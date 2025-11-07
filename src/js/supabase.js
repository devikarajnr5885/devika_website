import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

console.log('=== SUPABASE CONNECTION DEBUG ===');
console.log('Supabase URL:', supabaseUrl);
console.log('Supabase Key exists:', !!supabaseAnonKey);
console.log('Supabase Key length:', supabaseAnonKey?.length);
console.log('Expected URL: https://npwazvlpzvkwuqpjgplf.supabase.co');
console.log('URL matches:', supabaseUrl === 'https://npwazvlpzvkwuqpjgplf.supabase.co');

if (!supabaseUrl || !supabaseAnonKey) {
  console.error('ERROR: Supabase credentials missing!');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Contact form submission with better error handling
export const submitContactForm = async (formData) => {
  console.log('=== CONTACT FORM SUBMISSION ===');
  console.log('Form data:', formData);
  console.log('Supabase client exists:', !!supabase);

  try {
    console.log('Attempting to insert into contact_submissions...');
    const { data, error } = await supabase
      .from('contact_submissions')
      .insert([formData])
      .select();

    console.log('Insert response - Data:', data);
    console.log('Insert response - Error:', error);

    if (error) {
      console.error('SUPABASE ERROR DETAILS:', {
        message: error.message,
        details: error.details,
        hint: error.hint,
        code: error.code
      });
    }

    return { data, error };
  } catch (err) {
    console.error('EXCEPTION during form submission:', err);
    console.error('Exception stack:', err.stack);
    return { data: null, error: err };
  }
};

// Test database connection
export const testConnection = async () => {
  try {
    const { data, error } = await supabase
      .from('contact_submissions')
      .select('count')
      .limit(1);
    
    console.log('Database test:', { data, error });
    return !error;
  } catch (err) {
    console.error('Database connection test failed:', err);
    return false;
  }
};