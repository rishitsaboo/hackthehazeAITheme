import pandas as pd
from sklearn.neighbors import NearestNeighbors
from sklearn.feature_extraction.text import TfidfVectorizer
import joblib

# Load career data
career_df = pd.read_csv('indian_careers.csv')

# Prepare the model
vectorizer = TfidfVectorizer()
skills_matrix = vectorizer.fit_transform(career_df['skills'])

# Create KNN model
knn = NearestNeighbors(n_neighbors=3, metric='cosine')
knn.fit(skills_matrix)

# Save everything
joblib.dump(knn, 'career_knn_model.pkl')
joblib.dump(vectorizer, 'tfidf_vectorizer.pkl')
career_df.to_pickle('career_df.pkl')

print("Career engine created successfully!")