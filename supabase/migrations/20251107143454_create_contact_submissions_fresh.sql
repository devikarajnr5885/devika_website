/*
  # Create contact_submissions table (Fresh Start)

  ## Overview
  This migration creates a clean contact form submissions table with proper security.

  ## New Tables
  ### `contact_submissions`
  - `id` (uuid, primary key) - Unique identifier for each submission
  - `name` (text, required) - Contact person's name
  - `email` (text, required) - Contact person's email address
  - `phone` (text, optional) - Contact person's phone number
  - `service` (text, required) - Service they're interested in
  - `message` (text, required) - Their message content
  - `submitted_at` (timestamptz) - When the form was submitted
  - `user_id` (uuid, optional) - User ID if authenticated (for future use)
  - `created_at` (timestamptz) - Record creation timestamp

  ## Security (Row Level Security)
  ### Policies:
  1. **Public Insert Access** - Anyone (anon or authenticated) can submit the contact form
  2. **Authenticated Read Access** - Authenticated users can read their own submissions
  
  ## Indexes
  - Email lookup index for faster queries
  - Submitted date index for sorting

  ## Notes
  - Phone is optional (can be NULL)
  - User ID is optional (for future authentication features)
  - All timestamps are in UTC with timezone
*/

-- Create the contact_submissions table
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

-- Enable Row Level Security
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

-- Policy: Allow anyone (including anonymous users) to insert contact form submissions
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

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_contact_submissions_email ON contact_submissions(email);
CREATE INDEX IF NOT EXISTS idx_contact_submissions_submitted_at ON contact_submissions(submitted_at DESC);
CREATE INDEX IF NOT EXISTS idx_contact_submissions_created_at ON contact_submissions(created_at DESC);
