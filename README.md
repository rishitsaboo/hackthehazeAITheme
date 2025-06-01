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
