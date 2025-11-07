/*
  # Create contact_submissions table

  1. New Tables
    - `contact_submissions`
      - `id` (uuid, primary key) - Unique identifier for each submission
      - `name` (text) - Contact person's name
      - `email` (text) - Contact person's email
      - `phone` (text, optional) - Contact person's phone number
      - `service` (text) - Service they're interested in
      - `message` (text) - Their message
      - `submitted_at` (timestamptz) - Timestamp of submission
      - `user_id` (uuid, optional) - User ID if authenticated
      - `created_at` (timestamptz) - Record creation timestamp

  2. Security
    - Enable RLS on `contact_submissions` table
    - Add policy for anyone to insert (public form submissions)
    - Add policy for authenticated users to read their own submissions
*/

-- Create contact_submissions table
CREATE TABLE IF NOT EXISTS contact_submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  phone text,
  service text NOT NULL,
  message text NOT NULL,
  submitted_at timestamptz DEFAULT now(),
  user_id uuid,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

-- Policy: Allow anyone to insert contact form submissions (public form)
CREATE POLICY "Anyone can submit contact form"
  ON contact_submissions
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Policy: Authenticated users can read their own submissions
CREATE POLICY "Users can read own submissions"
  ON contact_submissions
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- Create index for faster email lookups
CREATE INDEX IF NOT EXISTS idx_contact_submissions_email ON contact_submissions(email);
CREATE INDEX IF NOT EXISTS idx_contact_submissions_submitted_at ON contact_submissions(submitted_at DESC);
