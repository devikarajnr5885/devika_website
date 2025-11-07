import React from 'react';
import { createRoot } from 'react-dom/client';
import LogoCloudApp from '@/components/LogoCloudApp';

function initLogoCloud() {
  const rootElement = document.getElementById('logo-cloud-root');
  if (rootElement) {
    const root = createRoot(rootElement);
    root.render(<LogoCloudApp />);
  }
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initLogoCloud);
} else {
  initLogoCloud();
}
