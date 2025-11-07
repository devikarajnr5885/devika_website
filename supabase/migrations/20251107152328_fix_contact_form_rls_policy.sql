/*
  # Fix Contact Form RLS Policy for Anonymous Users

  1. Changes
    - Drop the existing INSERT policy that may be causing issues
    - Create a new permissive INSERT policy that explicitly allows both anon and authenticated users
    - Ensure the WITH CHECK clause is truly permissive (just true, no complex checks)
  
  2. Security
    - Allow anyone (authenticated or anonymous) to submit contact forms
    - This is intentional since contact forms should be publicly accessible
    - The user_id field can be null for anonymous submissions
*/

-- Drop the existing INSERT policy
DROP POLICY IF EXISTS "Anyone can submit contact form" ON contact_submissions;

-- Create a new, more permissive INSERT policy
CREATE POLICY "Allow public contact form submissions"
  ON contact_submissions
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Verify RLS is still enabled
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;
