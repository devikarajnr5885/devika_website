# Netlify Environment Variables Setup

## CRITICAL: Add These Environment Variables to Netlify

Your website is showing `undefined` for Supabase credentials because Netlify doesn't read `.env` files automatically. You MUST add these in Netlify's dashboard.

### Steps to Fix:

1. **Go to Netlify Dashboard:**
   - Visit: https://app.netlify.com/
   - Select your site: `devikaraj`

2. **Navigate to Environment Variables:**
   - Click on `Site configuration` → `Environment variables`
   - OR go directly to: `Site settings` → `Build & deploy` → `Environment variables`

3. **Add These TWO Variables:**

   **Variable 1:**
   ```
   Key: VITE_SUPABASE_URL
   Value: https://npwazvlpzvkwuqpjgplf.supabase.co
   ```

   **Variable 2:**
   ```
   Key: VITE_SUPABASE_ANON_KEY
   Value: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5wd2F6dmxwenZrd3VxcGpncGxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEwMTQ2MTgsImV4cCI6MjA2NjU5MDYxOH0.vTU0MQg68nwxoYa2zaFiIY74L05z4ZmrkO1bfSpEga0
   ```

4. **Set the Scope:**
   - For both variables, set scope to: `All deploy contexts` (or at least `Production`)

5. **Trigger a Redeploy:**
   - After adding variables, go to: `Deploys` → `Trigger deploy` → `Deploy site`
   - OR just push a new commit to your Git repository

### Verification:

After redeploying, open your site and check the browser console (F12). You should see:
```
=== SUPABASE CONNECTION DEBUG ===
Supabase URL: https://npwazvlpzvkwuqpjgplf.supabase.co
Supabase Key exists: true
URL matches: true
```

### Why This Happens:

- `.env` files work locally in development
- Netlify (and most hosting platforms) require environment variables to be set in their dashboard
- This is for security - you don't want to commit sensitive keys to Git
- Vite reads `import.meta.env.VITE_*` variables from Netlify's environment

### Your Contact Form Will Work After:
1. Adding the environment variables in Netlify
2. Redeploying the site
3. Testing the contact form

The form data will then be saved to your Supabase `contact_submissions` table!
