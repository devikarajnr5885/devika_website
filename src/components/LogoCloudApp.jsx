import React from 'react';
import { LogoCloud } from '@/components/ui/logo-cloud';

const logos = [
  {
    src: "https://cdn.worldvectorlogo.com/logos/n8n-io.svg",
    alt: "n8n",
  },
  {
    src: "https://asset.brandfetch.io/idZAhuPTHv/idMJlizHHD.svg",
    alt: "Make.com",
  },
  {
    src: "https://cdn.worldvectorlogo.com/logos/zapier.svg",
    alt: "Zapier",
  },
  {
    src: "https://svgl.app/library/openai_wordmark_light.svg",
    alt: "OpenAI",
  },
  {
    src: "https://svgl.app/library/claude-ai-wordmark-icon_light.svg",
    alt: "Claude AI",
  },
  {
    src: "https://svgl.app/library/supabase_wordmark_light.svg",
    alt: "Supabase",
  },
  {
    src: "https://cdn.worldvectorlogo.com/logos/airtable-1.svg",
    alt: "Airtable",
  },
  {
    src: "https://asset.brandfetch.io/idZnB_OB16/idKA33sUyR.svg",
    alt: "Bolt.new",
  },
  {
    src: "https://avatars.githubusercontent.com/u/164673910?s=200&v=4",
    alt: "Lovable",
  },
  {
    src: "https://asset.brandfetch.io/idViYwB4es/idlcE3ql-m.svg",
    alt: "Replit",
  },
  {
    src: "https://www.gstatic.com/lamda/images/gemini_wordmark_f7c3bbad51f823db49202c.svg",
    alt: "Gemini",
  },
  {
    src: "https://asset.brandfetch.io/idpPgCl8n_/id43VqHRdX.svg",
    alt: "Vapi",
  },
  {
    src: "https://cdn.worldvectorlogo.com/logos/notion-logo-1.svg",
    alt: "Notion",
  },
  {
    src: "https://svgl.app/library/github_wordmark_light.svg",
    alt: "GitHub",
  },
];

export default function LogoCloudApp() {
  return (
    <div className="logo-cloud-container">
      <LogoCloud logos={logos} />
    </div>
  );
}
