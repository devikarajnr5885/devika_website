/*
  # Disable RLS for Contact Submissions Table
  
  1. Changes
    - Completely disable RLS on contact_submissions table
    - This is for testing to confirm RLS is the issue
    - Once confirmed working, we'll re-enable with proper policies
  
  2. Note
    - This makes the table publicly writable
    - Only temporary for debugging
*/

-- Disable RLS on the table
ALTER TABLE contact_submissions DISABLE ROW LEVEL SECURITY;
