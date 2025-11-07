import React from 'react';
import { createRoot } from 'react-dom/client';
import LogoCloudApp from '@/components/LogoCloudApp';

const rootElement = document.getElementById('logo-cloud-root');
if (rootElement) {
  const root = createRoot(rootElement);
  root.render(<LogoCloudApp />);
}
