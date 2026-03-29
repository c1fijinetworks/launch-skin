import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    { text: 'Features', href: getPermalink('/#features') },
    { text: 'The Story', href: getPermalink('/about') },
    { text: 'Live Demo', href: getPermalink('/demo') },
    { text: 'Pricing', href: getPermalink('/pricing') },
  ],
  actions: [
    { text: 'Claim Your URL', variant: 'primary', href: '/pricing' }
  ],
};

export const footerData = {
  links: [
    {
      title: 'Launch.Skin | Clinic Artistry ✨',
      links: [
        { text: "Claim Your Site – $99", href: getPermalink('/pricing') },
        { text: 'Live Demo', href: getPermalink('/demo') },
        { text: 'The Story', href: getPermalink('/about') },
        { text: 'Support', href: getPermalink('/contact') },
      ],
    },
  ],
  secondaryLinks: [
    { text: 'Terms of Service', href: getPermalink('/terms') },
    { text: 'Privacy Policy', href: getPermalink('/privacy') },
  ],
  socialLinks: [],
  footNote: '© 2026 Launch.Skin. All rights reserved.',
};
