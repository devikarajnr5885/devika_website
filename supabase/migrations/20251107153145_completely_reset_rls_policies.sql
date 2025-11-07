/*
  # Completely Reset RLS Policies
  
  1. Steps
    - Disable RLS temporarily
    - Drop ALL existing policies
    - Re-enable RLS
    - Create ONE simple INSERT policy for everyone
  
  2. This is a nuclear option to fix the 42501 error
*/

-- Disable RLS temporarily
ALTER TABLE contact_submissions DISABLE ROW LEVEL SECURITY;

-- Drop ALL policies
DROP POLICY IF EXISTS "Allow public contact form submissions" ON contact_submissions;
DROP POLICY IF EXISTS "Users can read own submissions" ON contact_submissions;
DROP POLICY IF EXISTS "Anyone can submit contact form" ON contact_submissions;

-- Re-enable RLS
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

-- Create a single, simple INSERT policy
CREATE POLICY "contact_submissions_insert_policy"
  ON contact_submissions
  FOR INSERT
  WITH CHECK (true);
