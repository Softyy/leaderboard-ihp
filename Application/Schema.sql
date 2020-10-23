-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE leaderboards (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    "owner" TEXT DEFAULT 'Anonymous' NOT NULL,
    name TEXT DEFAULT 'Leaderboard' NOT NULL
);
CREATE TABLE scores (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    leaderboard_id UUID NOT NULL,
    name TEXT DEFAULT 'Anonymous' NOT NULL,
    score INT DEFAULT 0 NOT NULL
);
ALTER TABLE scores ADD CONSTRAINT scores_ref_leaderboard_id FOREIGN KEY (leaderboard_id) REFERENCES leaderboards (id) ON DELETE NO ACTION;
