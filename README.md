🧠 Hack The Haze – Open Mind Challenge
Welcome to the official repository for Hack The Haze – Theme 4: 🎯 AI-Powered Career Guidance Engine for Indian Learners Hosted by brainfogdev

💼 Problem Statement
Build an intelligent, personalized, and scalable AI-powered career guidance system for the Indian education ecosystem. Your engine should analyze aptitude, goals, skills, and experience to recommend optimal career paths aligned with Indian academic streams (CBSE/ICSE/State Boards), national-level exams (UPSC, NEET, JEE, CA, etc.), and job market trends.

You're not just building a tool — you're shaping the future of career discovery and educational planning in India.

🔍 Objectives
Predict natural aptitude using ML from test scores or behavioral patterns.
Extract goals and interests using NLP from text/audio inputs.
Map skills and experiences using embeddings and match with industry profiles.
Recommend personalized career paths based on Indian education routes and competitive exams.
Suggest learning pathways based on skill gap analysis (aligned with NEP & current job demands).
🧠 Core AI Features
📊 Aptitude Prediction (ML Regression/Classification)
🧠 Goal Extraction (NLP on text/audio responses)
🧩 Skill Mapping (Embeddings / Semantic Similarity)
🔁 Career Recommendation Engine (Supervised/Unsupervised Learning)
🧮 Skill Gap Analysis & Learning Suggestions
🎨 Suggested Enhancements
📈 Interactive dashboards for results
🎙️ Voice/text-based user inputs (with NLP support)
🌍 Regional language support (IndicNLP/AI4Bharat)
🔎 Resume/LinkedIn scraping (optional)
📚 NEP-based course suggestions (Coursera, SWAYAM, etc.)
🔄 Real-time recommendation updates as user progresses
🧰 Recommended Stack
Frontend: React.js, Next.js, or Flutter Web
Backend: Node.js / Python (FastAPI preferred)
ML/NLP: scikit-learn, spaCy, Transformers, sentence-transformers
Data Storage: Firebase / MongoDB / PostgreSQL
Deployment: Vercel, Netlify, or Streamlit Cloud
Design Tool: Figma / Canva for UX workflows
📁 Project Structure (Suggested)
career-guidance-engine/  
├── public/  
├── src/  
│   ├── assets/             # Images, icons  
│   ├── components/         # UI elements  
│   ├── layouts/            # Page wrappers  
│   ├── pages/              # App screens  
│   ├── routes/             # Routing config  
│   ├── ml_models/          # Trained models (or API wrappers)  
│   ├── services/           # API calls / external services  
│   ├── styles/             # Tailwind, Chakra, etc.  
│   └── utils/              # NLP / ML helpers  
├── README.md  
└── THOUGHTS.md  
🏁 Getting Started
1. Clone the Repository
git clone https://github.com/brainfogdev/hackthehaze-careerengine.git  
cd hackthehaze-careerengine
2. Install Dependencies
npm install  # or pip install -r requirements.txt for backend ML  
3. Start the App
npm run dev  # or streamlit run app.py for AI model demo  
📝 Submission Guidelines
1️⃣ Fork This Repo
Click Fork, then clone your copy and start building your solution.

2️⃣ Build Your Solution
Develop an AI-guided platform that’s:

💡 Smart and insightful
📱 Mobile-first and accessible
🌐 Indian ecosystem-aware
3️⃣ Include the Following in Your Repo
📄 README.md

What your app does
Tech stack used
How to run
Screenshots or videos
🧠 THOUGHTS.md

Product thinking and UX decisions
ML/NLP model choices
Learnings and challenges
Future roadmap
🤖 models/ (optional)

Jupyter notebooks, model files, or HuggingFace links
🎨 figma/ (optional)

Wireframes, mockups, or export files
4️⃣ (Optional) Deploy Your Project
Host on Vercel, Streamlit, Netlify, or HuggingFace Spaces. Include your live URL in the README.

5️⃣ Submit on Unstop
Submit the following:

🔗 GitHub Repository
🔗 Live App Link (if any)
💡 Tips to Stand Out
Design with school and college students in mind
Explain the career paths clearly (with links to actual exams/jobs)
Add regional language support for better accessibility
Include AI Explainability (why a path was suggested)
Go beyond “tech” — think teacher & parent experience too
🏆 Build Futures. Empower Dreams. Guide Millions.
India needs smarter tools for smarter choices. Make this engine the future of education meets AI.

Hack the haze. Shape the journey. 🚀🎓



=============================================================================================================================
# AI Career Pathfinder

This project is an AI-powered career recommendation system for Indian users. It uses NLP with spaCy, a Neo4j graph database, and machine learning models to recommend career paths based on user skills and interests.

## Features

- Extracts skills from user input using spaCy NLP
- Queries Neo4j database for career recommendations
- Uses K-Nearest Neighbors model with TF-IDF vectorizer for skill matching
- Interactive web UI built with Streamlit

## Installation

1. Clone the repository.

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Ensure Neo4j is running locally on `bolt://localhost:7687` with username `neo4j` and password `qwertyuiop`.

4. Neo4j Setup:

- If Neo4j is not installed, download and install it from [Neo4j Download Center](https://neo4j.com/download/).
- Start the Neo4j Desktop application or run Neo4j server.
- Open the Neo4j Browser at `http://localhost:7474` and log in with the above credentials.
- To set up the graph database, run the Cypher queries contained in the `graph_database_by_neo4j_career_skills.cypher` file. This file creates nodes for careers, exams, skills, and their relationships.
- You can run the Cypher script by copying its contents into the Neo4j Browser query editor and executing it, or by using the Neo4j command line tools.

## Running the Application

Run the Streamlit app:

```bash
streamlit run app.py
```

## Files

- `app.py`: Main Streamlit app and Neo4j integration
- `career_engine.py`: Career recommendation engine using KNN and TF-IDF
- `requirements.txt`: Python dependencies
- `career_df.pkl`, `career_knn_model.pkl`, `tfidf_vectorizer.pkl`: Model and data files
- `graph_database_by_neo4j_career_skills.cypher`: Cypher queries to set up the Neo4j graph database with careers, exams, skills, and their relationships

## Project Structure

```
career-recommendation/
├── app.py                      # Main Streamlit app integrating Neo4j
├── career_engine.py            # Career recommendation engine using KNN and TF-IDF
├── graph_database_by_neo4j_career_skills.cypher  # Cypher script to set up Neo4j graph database
├── career_df.pkl               # Pickled career data
├── career_knn_model.pkl        # Pre-trained KNN model for skill matching
├── tfidf_vectorizer.pkl        # TF-IDF vectorizer for text feature extraction
├── requirements.txt            # Python dependencies
├── README.md                   # Project documentation and setup instructions
```

## Resources

- Indian exam resources links are included in the app sidebar.

## License

This project is provided as-is without warranty.

## Suggested Enhancements

- Expand the Neo4j graph database with more careers, skills, and exams for broader recommendations.
- Integrate additional NLP models to improve skill extraction accuracy.
- Add user authentication and personalized profiles for tailored career advice.
- Develop a REST API backend to support multiple client applications.
- Implement advanced visualization of career paths and skill relationships.
- Optimize machine learning models for faster and more accurate recommendations.
- Add support for multiple languages and regional career data.
