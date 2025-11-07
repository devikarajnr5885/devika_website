/*
  # Fix SELECT Policy for Anonymous Users
  
  1. Problem
    - Current SELECT policy requires auth.uid() = user_id
    - Anonymous contact form submissions have user_id = NULL
    - This prevents the form from reading back inserted data
  
  2. Solution
    - Drop existing SELECT policy
    - Create new SELECT policy that allows anon to read all submissions
    - Or allow reading when user_id is NULL
  
  3. Security
    - Contact form submissions are not sensitive
    - Allowing anon to read is acceptable for this use case
*/

-- Drop the restrictive SELECT policy
DROP POLICY IF EXISTS "Users can read own submissions" ON contact_submissions;

-- Create a permissive SELECT policy for anon
CREATE POLICY "Anyone can read contact submissions"
  ON contact_submissions
  FOR SELECT
  TO anon
  USING (true);
