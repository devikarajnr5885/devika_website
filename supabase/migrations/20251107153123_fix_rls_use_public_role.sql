/*
  # Fix RLS to use PUBLIC role
  
  1. Changes
    - Drop existing INSERT policy
    - Create new policy using PUBLIC role (which includes anon)
    - Use explicit TO PUBLIC syntax
  
  2. Reason
    - Sometimes specifying anon explicitly doesn't work
    - PUBLIC includes all roles including anon
*/

-- Drop existing policy
DROP POLICY IF EXISTS "Allow public contact form submissions" ON contact_submissions;

-- Create policy with PUBLIC role
CREATE POLICY "Allow public contact form submissions"
  ON contact_submissions
  FOR INSERT
  TO public
  WITH CHECK (true);
