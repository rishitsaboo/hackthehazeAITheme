// --- CAREERS ---
CREATE
  (eng:Career {name: "Computer Engineer", domain: "Technology"}),
  (mech:Career {name: "Mechanical Engineer", domain: "Engineering"}),
  (doc:Career {name: "Medical Doctor", domain: "Healthcare"}),
  (ca:Career {name: "Chartered Accountant", domain: "Finance"}),
  (ias:Career {name: "IAS Officer", domain: "Civil Services"}),
  (teacher:Career {name: "College Professor", domain: "Education"}),
  (army:Career {name: "Indian Army Officer", domain: "Defense"}),
  (painter:Career {name: "Painter", domain: "Arts"}),
  (lawyer:Career {name: "Lawyer", domain: "Law"}),
  (journalist:Career {name: "Journalist", domain: "Media & Communication"}),
  (designer:Career {name: "Graphic Designer", domain: "Design"}),
  (technician:Career {name: "IT Technician", domain: "Technology Support"}),
  (chef:Career {name: "Chef", domain: "Culinary Arts"});

// --- EXAMS ---
CREATE
  (jeem:Exam {name: "JEE Main", conducting_body: "NTA"}),
  (jeea:Exam {name: "JEE Advanced", conducting_body: "IIT"}),
  (neet:Exam {name: "NEET", conducting_body: "NTA"}),
  (cafound:Exam {name: "CA Foundation", conducting_body: "ICAI"}),
  (cainter:Exam {name: "CA Intermediate", conducting_body: "ICAI"}),
  (cafinal:Exam {name: "CA Final", conducting_body: "ICAI"}),
  (upsc:Exam {name: "UPSC CSE", conducting_body: "UPSC"}),
  (net:Exam {name: "UGC NET", conducting_body: "NTA"}),
  (nda:Exam {name: "NDA", conducting_body: "UPSC"}),
  (clat:Exam {name: "CLAT", conducting_body: "Consortium of NLUs"}),
  (aieed:Exam {name: "AIEED", conducting_body: "ARCH College"}),
  (iimc:Exam {name: "IIMC Entrance Exam", conducting_body: "IIMC"}),
  (nid:Exam {name: "NID DAT", conducting_body: "NID"}),
  (nift:Exam {name: "NIFT Entrance Exam", conducting_body: "NIFT"}),
  (polytechnic:Exam {name: "Polytechnic Entrance", conducting_body: "State Boards"}),
  (nchmct:Exam {name: "NCHMCT JEE", conducting_body: "NTA"});

// --- SKILLS ---
CREATE
  (math:Skill {name: "Mathematics"}),
  (phy:Skill {name: "Physics"}),
  (chem:Skill {name: "Chemistry"}),
  (bio:Skill {name: "Biology"}),
  (accounting:Skill {name: "Accounting"}),
  (leadership:Skill {name: "Leadership"}),
  (teaching:Skill {name: "Teaching"}),
  (mentoring:Skill {name: "Mentoring"}),
  (writing:Skill {name: "Academic Writing"}),
  (empathy:Skill {name: "Empathy"}),
  (communication:Skill {name: "Patient Communication"}),
  (anatomy:Skill {name: "Anatomy"}),
  (decision:Skill {name: "Decision Making"}),
  (ethics:Skill {name: "Ethics and Integrity"}),
  (taxation:Skill {name: "Taxation"}),
  (auditing:Skill {name: "Auditing"}),
  (analysis:Skill {name: "Financial Analysis"}),
  (compliance:Skill {name: "Legal Compliance"}),
  (spreadsheet:Skill {name: "Spreadsheet Proficiency"}),
  (programming:Skill {name: "Programming"}),
  (ds_algo:Skill {name: "Data Structures & Algorithms"}),
  (os:Skill {name: "Operating Systems"}),
  (dbms:Skill {name: "Database Management"}),
  (problem_solving:Skill {name: "Problem Solving"}),
  (software:Skill {name: "Software Engineering"}),
  (mechanics:Skill {name: "Mechanics"}),
  (cad:Skill {name: "CAD Designing"}),
  (thermal:Skill {name: "Thermal Engineering"}),
  (painting:Skill {name: "Artistic Painting"}),
  (color:Skill {name: "Color Theory"}),
  (law:Skill {name: "Legal Knowledge"}),
  (advocacy:Skill {name: "Advocacy"}),
  (legalwriting:Skill {name: "Legal Writing"}),
  (writing_journalism:Skill {name: "News Writing"}),
  (investigation:Skill {name: "Investigative Research"}),
  (storytelling:Skill {name: "Storytelling"}),
  (media_ethics:Skill {name: "Media Ethics"}),
  (design_thinking:Skill {name: "Design Thinking"}),
  (ux:Skill {name: "User Experience (UX)"}),
  (graphic_tools:Skill {name: "Graphic Design Tools"}),
  (branding:Skill {name: "Branding"}),
  (programming_basics:Skill {name: "Basic Programming"}),
  (logic_building:Skill {name: "Logical Reasoning"}),
  (hardware:Skill {name: "Hardware Fundamentals"}),
  (culinary_creativity:Skill {name: "Culinary Creativity"}),
  (knife_skills:Skill {name: "Knife Skills"}),
  (food_hygiene:Skill {name: "Food Hygiene"}),
  (presentation:Skill {name: "Plating & Presentation"});

// --- CAREER -> EXAM RELATIONSHIPS ---
CREATE
  (eng)-[:REQUIRES_EXAM]->(jeem),
  (eng)-[:REQUIRES_EXAM]->(jeea),
  (mech)-[:REQUIRES_EXAM]->(jeem),
  (mech)-[:REQUIRES_EXAM]->(jeea),
  (doc)-[:REQUIRES_EXAM]->(neet),
  (ca)-[:REQUIRES_EXAM]->(cafound),
  (ca)-[:REQUIRES_EXAM]->(cainter),
  (ca)-[:REQUIRES_EXAM]->(cafinal),
  (ias)-[:REQUIRES_EXAM]->(upsc),
  (teacher)-[:REQUIRES_EXAM]->(net),
  (army)-[:REQUIRES_EXAM]->(nda),
  (lawyer)-[:REQUIRES_EXAM]->(clat),
  (painter)-[:REQUIRES_EXAM]->(aieed),
  (journalist)-[:REQUIRES_EXAM]->(iimc),
  (designer)-[:REQUIRES_EXAM]->(nid),
  (designer)-[:REQUIRES_EXAM]->(nift),
  (technician)-[:REQUIRES_EXAM]->(polytechnic),
  (chef)-[:REQUIRES_EXAM]->(nchmct);

// --- CAREER -> SKILL RELATIONSHIPS ---
CREATE
  // Computer Engineer
  (eng)-[:REQUIRES_SKILL]->(math),
  (eng)-[:REQUIRES_SKILL]->(phy),
  (eng)-[:REQUIRES_SKILL]->(programming),
  (eng)-[:REQUIRES_SKILL]->(ds_algo),
  (eng)-[:REQUIRES_SKILL]->(os),
  (eng)-[:REQUIRES_SKILL]->(dbms),
  (eng)-[:REQUIRES_SKILL]->(problem_solving),
  (eng)-[:REQUIRES_SKILL]->(software),

  // Mechanical Engineer
  (mech)-[:REQUIRES_SKILL]->(math),
  (mech)-[:REQUIRES_SKILL]->(phy),
  (mech)-[:REQUIRES_SKILL]->(mechanics),
  (mech)-[:REQUIRES_SKILL]->(cad),
  (mech)-[:REQUIRES_SKILL]->(thermal),

  // Doctor
  (doc)-[:REQUIRES_SKILL]->(bio),
  (doc)-[:REQUIRES_SKILL]->(chem),
  (doc)-[:REQUIRES_SKILL]->(anatomy),
  (doc)-[:REQUIRES_SKILL]->(empathy),
  (doc)-[:REQUIRES_SKILL]->(communication),

  // CA
  (ca)-[:REQUIRES_SKILL]->(accounting),
  (ca)-[:REQUIRES_SKILL]->(taxation),
  (ca)-[:REQUIRES_SKILL]->(auditing),
  (ca)-[:REQUIRES_SKILL]->(analysis),
  (ca)-[:REQUIRES_SKILL]->(compliance),
  (ca)-[:REQUIRES_SKILL]->(spreadsheet),

  // IAS
  (ias)-[:REQUIRES_SKILL]->(leadership),
  (ias)-[:REQUIRES_SKILL]->(decision),
  (ias)-[:REQUIRES_SKILL]->(ethics),

  // Professor
  (teacher)-[:REQUIRES_SKILL]->(teaching),
  (teacher)-[:REQUIRES_SKILL]->(mentoring),
  (teacher)-[:REQUIRES_SKILL]->(writing),

  // Army
  (army)-[:REQUIRES_SKILL]->(leadership),
  (army)-[:REQUIRES_SKILL]->(decision),
  (army)-[:REQUIRES_SKILL]->(ethics),
  (army)-[:REQUIRES_SKILL]->(fitness:Skill {name: "Physical Fitness"}),

  // Painter
  (painter)-[:REQUIRES_SKILL]->(painting),
  (painter)-[:REQUIRES_SKILL]->(color),

  // Lawyer
  (lawyer)-[:REQUIRES_SKILL]->(law),
  (lawyer)-[:REQUIRES_SKILL]->(advocacy),
  (lawyer)-[:REQUIRES_SKILL]->(legalwriting),

  // Journalist
  (journalist)-[:REQUIRES_SKILL]->(writing_journalism),
  (journalist)-[:REQUIRES_SKILL]->(investigation),
  (journalist)-[:REQUIRES_SKILL]->(storytelling),
  (journalist)-[:REQUIRES_SKILL]->(media_ethics),

  // Designer
  (designer)-[:REQUIRES_SKILL]->(design_thinking),
  (designer)-[:REQUIRES_SKILL]->(ux),
  (designer)-[:REQUIRES_SKILL]->(graphic_tools),
  (designer)-[:REQUIRES_SKILL]->(branding),

  // Technician
  (technician)-[:REQUIRES_SKILL]->(programming_basics),
  (technician)-[:REQUIRES_SKILL]->(logic_building),
  (technician)-[:REQUIRES_SKILL]->(hardware),

  // Chef
  (chef)-[:REQUIRES_SKILL]->(culinary_creativity),
  (chef)-[:REQUIRES_SKILL]->(knife_skills),
  (chef)-[:REQUIRES_SKILL]->(food_hygiene),
  (chef)-[:REQUIRES_SKILL]->(presentation);
