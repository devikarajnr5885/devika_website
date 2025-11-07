/*
  # Comprehensive Fix for Contact Submissions
  
  1. Changes
    - Explicitly disable RLS
    - Revoke all existing grants
    - Grant fresh permissions to anon and authenticated
    - Add explicit schema cache refresh
  
  2. Security
    - Table is public for contact form submissions
    - No RLS needed for public forms
*/

-- Disable RLS explicitly
ALTER TABLE contact_submissions DISABLE ROW LEVEL SECURITY;

-- Revoke ALL privileges first to start fresh
REVOKE ALL ON contact_submissions FROM anon;
REVOKE ALL ON contact_submissions FROM authenticated;
REVOKE ALL ON contact_submissions FROM public;

-- Grant INSERT and SELECT to anon (for contact form)
GRANT INSERT ON contact_submissions TO anon;
GRANT SELECT ON contact_submissions TO anon;

-- Grant full access to authenticated users
GRANT ALL ON contact_submissions TO authenticated;

-- Ensure the table owner is correct
ALTER TABLE contact_submissions OWNER TO postgres;

-- Grant usage on the sequence for id generation if it exists
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'public' AND sequencename LIKE 'contact_submissions%') THEN
    EXECUTE 'GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO anon';
    EXECUTE 'GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated';
  END IF;
END $$;

-- Notify Supabase to refresh the schema cache
NOTIFY pgrst, 'reload schema';
