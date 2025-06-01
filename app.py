import streamlit as st
import spacy
from neo4j import GraphDatabase
import atexit

# Load NLP model with error handling
try:
    nlp = spacy.load("en_core_web_sm")
except Exception as e:
    st.error(f"Error loading spaCy model: {e}")
    nlp = None

# Neo4j connection
try:
    driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "qwertyuiop"))
except Exception as e:
    st.error(f"Error connecting to Neo4j: {e}")
    driver = None

# Ensure driver closes on app shutdown
atexit.register(lambda: driver and driver.close())

# Connection test
def test_connection():
    if not driver:
        return False
    try:
        with driver.session() as session:
            result = session.run("RETURN 1 AS test")
            return result.single()["test"] == 1
    except Exception as e:
        st.error(f"❌ Neo4j connection failed: {e}")
        return False

if test_connection():
    st.success("✅ Connected to local Neo4j database")

# Indian skill mapping
INDIAN_SKILL_MAP = {
    # Computer Engineer
    "math": "mathematics", "maths": "mathematics",
    "physics": "physics", "phy": "physics",

    # Medical Doctor
    "biology": "biology", "bio": "biology",
    "chemistry": "chemistry", "chem": "chemistry",

    # Chartered Accountant
    "accounting": "accounting", "accounts": "accounting", "finance": "accounting",

    # IAS Officer
    "leadership": "leadership", "management": "leadership", "team leader": "leadership",

    # College Professor
    "teaching": "teaching", "mentoring": "teaching", "lecturing": "teaching", "instructing": "teaching",

    # Lawyer
    "logical reasoning": "logical reasoning", "reasoning": "logical reasoning", "logic": "logical reasoning",
    "verbal ability": "verbal ability", "english": "verbal ability", "communication": "verbal ability", "speaking": "verbal ability",
    "general knowledge": "general knowledge", "gk": "general knowledge", "current affairs": "general knowledge",
    "legal awareness": "legal awareness", "law": "legal awareness", "legal": "legal awareness",
    "argumentation": "argumentation", "debate": "argumentation", "arguing": "argumentation",
    "critical thinking": "critical thinking", "analysis": "critical thinking", "thinking": "critical thinking",
    "legal writing": "legal writing", "writing": "legal writing", "legal docs": "legal writing",

    #Indian Army Officer
    "leadership": "leadership", "team leader": "leadership","Physical Fitness" : "workout",  "workout" : "Physical Fitness",
    "discipline": "discipline", "self-discipline": "discipline", "self control": "discipline","Effective Communication": "communication", "communication": "Effective Communication",

    #painter 
     "artistic skills": "creativity", "drawing": "drawing", "sketching": "drawing", "painting": "painting",
     "Patience": "patience", "attention to detail": "Patience", "color theory": "color theory","creativity": "creativity", "imagination": "imagination", "visualization": "visualization",
     "visual communication": "visual communication", "aesthetic sense": "aesthetic sense",
}

# Normalize skills using the mapping
def normalize_skills(user_inputs):
    return [INDIAN_SKILL_MAP.get(s.lower().strip(), s.lower().strip()) for s in user_inputs]

# Extract and normalize skills
def extract_skills(text):
    if not nlp:
        return []
    doc = nlp(text.lower())
    raw_skills = [chunk.text.strip() for chunk in doc.noun_chunks]
    return normalize_skills(raw_skills)

# Recommendation function using Neo4j
def get_neo4j_recommendations(user_skills):
    query = """
    MATCH (s:Skill)<-[:REQUIRES_SKILL]-(c:Career)
    WHERE toLower(s.name) IN $skills
    WITH c, COUNT(s) AS matchCount
    OPTIONAL MATCH (c)-[:REQUIRES_EXAM]->(e:Exam)
    OPTIONAL MATCH (c)-[:REQUIRES_SKILL]->(requiredSkill:Skill)
    RETURN 
        c.name AS career, 
        c.stream AS stream,
        COLLECT(DISTINCT e.name) AS required_exams,
        COLLECT(DISTINCT requiredSkill.name) AS required_skills,
        matchCount
    ORDER BY matchCount DESC
    LIMIT 3
    """
    try:
        with driver.session() as session:
            result = session.run(query, skills=[s.lower() for s in user_skills])
            return [record.data() for record in result]
    except Exception as e:
        st.error(f"Neo4j query failed: {e}")
        return []

# Streamlit UI
st.title("🇮🇳 AI Career Pathfinder")

st.subheader("Tell us about yourself:")
interests = st.text_input("What subjects or activities do you enjoy?")
skills_input = st.text_input("What are you good at?")

if st.button("Find My Career Path"):
    if interests or skills_input:
        user_input = f"{interests} {skills_input}"
        user_skills = extract_skills(user_input)

        if not user_skills:
            st.warning("Could not extract any skills from your input.")
            st.stop()

        st.success(f"✅ Detected skills: {', '.join(user_skills)}")

        recommendations = get_neo4j_recommendations(user_skills)

        if not recommendations:
            st.warning("No career matches found.")
            st.stop()

        st.subheader("Recommended Careers:")
        for i, career in enumerate(recommendations, 1):
            required_exams = ', '.join(career['required_exams']) if career['required_exams'] else 'N/A'
            required_skills = ', '.join(career['required_skills']) if career['required_skills'] else 'N/A'
            st.markdown(f"""
**{i}. {career['career']}**  
- **Stream**: {career.get('stream', 'N/A')}
- **Required Exams**: {required_exams}
- **Required Skills**: {required_skills}
- **Matched Skills**: {career.get('matchCount', 0)}
""")
    else:
        st.warning("Please enter your interests or skills.")

# Sidebar resources
st.sidebar.header("Indian Exam Resources")
st.sidebar.markdown("""
- [JEE Main](https://jeemain.nta.nic.in/)
- [NEET](https://neet.nta.nic.in/)
- [UPSC](https://upsc.gov.in/)
- [CA Foundation](https://www.icai.org/)
- [GATE](https://gate.iitk.ac.in/)
- [CLAT](https://consortiumofnlus.ac.in/)
""")
