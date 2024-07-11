CREATE TABLE IF NOT EXISTS key_players_sentiment (
    id SERIAL PRIMARY KEY,
    symbol	VARCHAR (12),
    sentiment INTEGER,
    value INTEGER);

ALTER TABLE key_players_sentiment ADD COLUMN timestamp TIMESTAMP NOT NULL;