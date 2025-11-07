/*
  # Enable RLS with Working Policy
  
  1. Issue Identified
    - When RLS is disabled but role has rolbypassrls=false
    - PostgREST still enforces RLS-like behavior
    - Solution: Enable RLS with explicit permissive policy
  
  2. Changes
    - Enable RLS on contact_submissions
    - Create explicit INSERT policy for anon
    - Create explicit SELECT policy for anon
  
  3. Security
    - Public contact form (anyone can submit)
    - Anyone can read (for confirmation)
*/

-- Enable RLS
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

-- Create INSERT policy for anon
CREATE POLICY "anon_can_insert"
  ON contact_submissions
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Create SELECT policy for anon  
CREATE POLICY "anon_can_select"
  ON contact_submissions
  FOR SELECT
  TO anon
  USING (true);

-- Same for authenticated
CREATE POLICY "authenticated_can_insert"
  ON contact_submissions
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "authenticated_can_select"
  ON contact_submissions
  FOR SELECT
  TO authenticated
  USING (true);
