/*
  # Enable RLS with Proper Grants
  
  1. Changes
    - Grant INSERT permission to anon and authenticated roles
    - Enable RLS
    - Create permissive INSERT policy
  
  2. Security
    - Table is protected by RLS
    - Anyone can submit contact forms (public form)
    - Only authenticated users can read their own submissions
*/

-- First, grant INSERT permission to anon and authenticated roles
GRANT INSERT ON contact_submissions TO anon;
GRANT INSERT ON contact_submissions TO authenticated;

-- Grant SELECT permission only to authenticated users
GRANT SELECT ON contact_submissions TO authenticated;

-- Enable RLS
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

-- Create INSERT policy (allow anyone to insert)
CREATE POLICY "Enable insert for all users"
  ON contact_submissions
  FOR INSERT
  WITH CHECK (true);

-- Create SELECT policy (only authenticated users can read their own)
CREATE POLICY "Enable read for authenticated users only"
  ON contact_submissions
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);
