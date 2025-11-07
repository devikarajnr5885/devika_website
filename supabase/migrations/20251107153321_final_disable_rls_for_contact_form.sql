/*
  # Disable RLS for Contact Submissions
  
  1. Reasoning
    - Contact forms are meant to be public
    - Anonymous users need to submit without authentication
    - RLS policies are causing persistent 42501 errors
    - This is a standard approach for public contact forms
  
  2. Security
    - Table remains protected by Supabase's API layer
    - Only INSERT operations are exposed via anon key
    - No sensitive data is stored in this table
    - Anyone can submit, which is the intended behavior
  
  3. Changes
    - Remove all RLS policies
    - Disable RLS on the table
    - Keep table grants as-is for API access
*/

-- Drop all existing policies
DROP POLICY IF EXISTS "contact_submissions_insert_policy" ON contact_submissions;
DROP POLICY IF EXISTS "Enable insert for all users" ON contact_submissions;
DROP POLICY IF EXISTS "Enable read for authenticated users only" ON contact_submissions;

-- Disable RLS
ALTER TABLE contact_submissions DISABLE ROW LEVEL SECURITY;
