#!/bin/bash

# 1. Update Navigation
cat << 'INNEREOF' > src/navigation.ts
import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    { text: 'Features', href: getPermalink('/#features') },
    { text: 'Process', href: getPermalink('/#process') },
    { text: 'The Story', href: getPermalink('/about') },
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
  footNote: '© 2026. All rights reserved.',
};
INNEREOF

# 2. Update Pricing Data
cat << 'INNEREOF' > src/data/pricingData.ts
export const lifetimeDeal = {
  title: 'Clinic Homepage Plan',
  subtitle: 'Boutique Websites for Practitioners',
  price: 99,
  period: 'One-time payment',
  items: [
    { description: 'Premium Vanity URL (launch.skin/yourclinic)' },
    { description: 'Real-time Instagram Results Sync' },
    { description: 'Aesthetic Medical-Grade Design' },
    { description: 'Mobile-First User Experience' },
    { description: 'Integrated Booking Links' },
    { description: 'Zero Maintenance / No Monthly Fees' },
    { description: 'Same Day Setup Guaranteed' },
  ],
  callToAction: { target: '_blank' as const, text: 'Claim Your Clinic\'s Website', href: '#', variant: 'success' },
};
INNEREOF

# 3. Update Home Page
cat << 'INNEREOF' > src/pages/index.astro
---
import Layout from '~/layouts/PageLayout.astro';
import Header from '~/components/widgets/Header.astro';
import Hero2 from '~/components/widgets/Hero2.astro';
import Features from '~/components/widgets/Features.astro';
import Steps2 from '~/components/widgets/Steps2.astro';
import Content from '~/components/widgets/Content.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { headerData } from '~/navigation';
import FAQs from '~/components/widgets/FAQs.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'Launch.Skin | Boutique Websites for Skin Clinics', 
  description: 'Your Practice Deserves a Digital Masterpiece. High-end websites with automated Instagram sync and vanity URLs for elite aesthetic professionals.' 
};
---
<Layout metadata={metadata}>
  <Fragment slot="header"><Header {...headerData} isSticky /></Fragment>
  
  <Hero2
    tagline="Boutique Web Development for Clinics"
    title='<span class="text-accent dark:text-white">Your Practice Deserves a Digital Masterpiece.</span>'
    subtitle="We build and deploy elegant, high-converting websites that sync with your social media results in real-time. Stand out with a professional address while you focus on your patients."
    actions={[{ variant: 'primary', text: 'Claim Your Clinic\'s Website', href: '/pricing/' }, { text: 'Features', href: '#features' }]}
    image={{ src: '/images/hero-poster.webp', width: 1024, height: 576 }}
  />

  <Features
    id="features"
    title="Everything Your Practice Needs"
    subtitle="Essential elements of a high-performance skin clinic website distilled into a single, beautiful package."
    items={[
        { 
          title: 'Aesthetic Medical Design', 
          description: 'Custom-crafted layouts that mirror the clean, clinical, and luxury vibe of your treatment rooms. We prioritize high-resolution imagery and elegant typography that signals elite-level care.', 
          icon: 'tabler:palette' 
        },
        { 
          title: 'Automated Result Feeds', 
          description: 'Your website should never be out of date. We sync your Instagram directly to your homepage gallery. Every time you post a fresh transformation, your website updates automatically.', 
          icon: 'tabler:brand-instagram' 
        },
        { 
          title: 'Conversion Strategy', 
          description: 'We integrate your primary booking engine directly into a clear layout. We optimize the path from search to scheduled treatment, ensuring local patients can find and book you with ease.', 
          icon: 'tabler:info-circle' 
        },
        { 
          title: 'Professional Technical Suite', 
          description: 'Stop worrying about servers. We handle the enterprise-grade tech behind your professional address. Lightning-fast global hosting, SSL security, and custom domain routing included.', 
          icon: 'tabler:cloud-computing' 
        },
    ]}
  />

  <Content
    isReversed={false}
    tagline="Always Fresh. Zero Maintenance."
    title="Your site stays as current as your latest procedure."
    items={[
        { title: 'Real-time Instagram Sync', description: 'Your portfolio updates automatically every time you post a new treatment result.', icon: 'tabler:refresh' },
        { title: 'Automatic Content Refresh', description: 'No more outdated websites. Your latest transformations are always front and center.', icon: 'tabler:camera' },
    ]}
    image={{ src: '/images/testimonial-2.webp', alt: 'Practitioner working on a patient' }}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        <span class="text-accent dark:text-white">Instant Results Portfolio</span>
      </h3>
      <p>We automatically sync your latest Instagram posts directly to your homepage so your site is always relevant and reflects your clinical expertise.</p>
    </Fragment>
  </Content>

  <div id="process" class="scroll-mt-20">
    <Steps2
      isReversed={true}
      title="The Path to a Better Presence"
      subtitle="Three simple steps to your clinic's new digital home."
      items={[
        { title: '01. Sign up with your brand', description: 'Secure your clinic identity and choose your vanity URL.', icon: 'tabler:number-1' },
        { title: '02. We Build & Sync', description: 'Our studio crafts your site and connects your social feeds for auto-updates.', icon: 'tabler:number-2' },
        { title: '03. Launch & Shine', description: 'Go live on launch.skin/yourclinic and start attracting high-value patients.', icon: 'tabler:number-3' },
      ]}
      image={{ src: '/images/testimonial-6.webp', alt: 'Launch Skin process' }}
    />
  </div>

  <Pricing title='Ready to elevate your clinical brand?' prices={[lifetimeDeal]} />

  <FAQs
    title="Deep Dive: How Launch.Skin Works"
    items={[
        { 
          title: 'What exactly is a Vanity URL?', 
          description: 'A Vanity URL is a professional, branded link like <strong>launch.skin/yourclinic</strong>. It is included for free and is designed to replace generic link-in-bio tools.', 
          icon: 'tabler:link' 
        },
        { 
          title: 'Is it really "Same-Day" Setup?', 
          description: 'Yes. If you submit your details by 2 PM, our team works in real-time to build your site, sync your feeds, and deploy your URL before you close for the day.', 
          icon: 'tabler:bolt' 
        },
        { 
          title: 'What is Launch.Skin exactly?', 
          description: 'Launch.Skin is the definitive digital presence for elite skin practitioners. Beyond a beautiful homepage, it serves as a massive authority signal for Google Search SEO.', 
          icon: 'tabler:world' 
        },
        { 
          title: 'Do I need technical skills?', 
          description: 'None whatsoever. Your website stays fresh automatically by syncing with your Instagram. If you can take a photo of a patient result, you can maintain your site.', 
          icon: 'tabler:tool' 
        },
    ]}
  />
</Layout>
INNEREOF

# 4. Update About Page
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'The Story | Launch.Skin', 
  description: 'Why we build boutique websites for the world’s best skin clinics.' 
};
---
<Layout metadata={metadata}>
  <Hero2
    tagline="The Story"
    title='Elite Websites for <span class="text-accent">Elite Practitioners</span>'
    subtitle="We believe your digital address should be as pristine as the results you create in the treatment room. Your website is your digital handshake."
    actions={[{ variant: 'primary', text: 'Secure My Address', href: '/pricing/' }]}
    image={{ src: '/images/hero-poster.webp', alt: 'Launch.Skin Professional Branding' }}
  />
  
  <Content
    isReversed={true}
    items={[
        { 
          title: 'The "Mirror" Moment', 
          description: 'The best time to build trust is the second your patient sees their skin results. Our system captures that momentum and presents it on a high-end clinical domain.', 
          icon: 'tabler:sparkles' 
        },
        { 
          title: 'Local Authority SEO', 
          description: 'When someone searches "best skin clinic near me," Google looks for authority. A professional Launch.Skin URL signals that you are a top-tier medical provider.', 
          icon: 'tabler:map-pin' 
        },
    ]}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        Why your clinic needs <span class="text-accent">Results on Autopilot ⭐⭐⭐⭐⭐</span>
      </h3>
      <p>Patients look at screens before they look at your clinic. In the aesthetic industry, your digital presence is your handshake—we make sure yours is a 5-star introduction.</p>
    </Fragment>
  </Content>

  <Content
    isReversed={false}
    items={[
        { 
          title: 'Focus on Results, Not Tech', 
          description: 'Practitioners are experts in biology, not code. We handle the servers and social integrations so your online presence stays perfect while you focus on patient care.', 
          icon: 'tabler:brush' 
        },
        { 
          title: 'One-Time License', 
          description: 'We don’t believe in monthly "SaaS taxes" that eat your clinic profits. $99 once, and you own the system for the life of your business.', 
          icon: 'tabler:coin' 
        },
    ]}
  >
    <Fragment slot="content">
      <h2 class="text-3xl font-bold tracking-tight dark:text-white sm:text-4xl mb-4">Our Clinical Philosophy</h2>
      <p class="text-muted text-lg mb-6">In the modern beauty industry, "Generic" is the enemy of "Expertise." We move beyond messy apps to provide a clean, dedicated digital address that establishes you as a local authority.</p>
    </Fragment>
  </Content>

  <Pricing title="Ready to Own Your Professional Identity?" prices={[lifetimeDeal]} />
</Layout>
INNEREOF

# 5. Update Pricing Page
cat << 'INNEREOF' > src/pages/pricing.astro
---
import Layout from '~/layouts/PageLayout.astro';
import HeroText from '~/components/widgets/HeroText.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import FAQs from '~/components/widgets/FAQs.astro';
import Features3 from '~/components/widgets/Features3.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'Pricing | Secure Your Elite Launch.Skin URL', 
  description: 'Professional clinic vanity URLs with zero monthly fees. Transform your Google Business Profile into a luxury portfolio.' 
};
---
<Layout metadata={metadata}>
  <HeroText 
    tagline="The Professional Standard"
    title="A Stunning Home for Your Practice. Live in Hours." 
    subtitle="More than just a link—it's your clinic's digital flagship. Own a beautiful vanity URL (launch.skin/yourclinic) that transforms your social bio and Google 'Website' button into a high-end experience."
  />
  <Pricing prices={[lifetimeDeal]} />
  <Features3
    title="Elevate Every Touchpoint"
    subtitle="We bridge the gap between your expertise and your presence online."
    columns={3}
    items={[
      { title: 'Clinic Authority', description: 'Replace generic links with a dedicated homepage that creates a massive authority signal to local patients.', icon: 'tabler:brand-google' },
      { title: 'Live Results Sync', description: 'We pull your live Instagram feed directly onto your URL, ensuring your website portfolio is always current.', icon: 'tabler:brand-instagram' },
      { title: 'One-Time License', description: 'No monthly subscriptions. Pay once and own your professional identity for life.', icon: 'tabler:coin' },
    ]}
  />
</Layout>
INNEREOF

# 6. Update Pricing Component (Paypal + Preview)
cat << 'INNEREOF' > src/components/widgets/Pricing.astro
---
import { Icon } from 'astro-icon/components';
import Button from '~/components/ui/Button.astro';
import Headline from '~/components/ui/Headline.astro';
import WidgetWrapper from '~/components/ui/WidgetWrapper.astro';
import type { Price } from '~/types';

const { title, subtitle, tagline, prices = [], classes = {}, ...rest } = Astro.props;
---

<WidgetWrapper {...rest} id="pricing" classes={{ container: 'max-w-7xl scroll-mt-16', ...classes.container }} hasBackground>
  <Headline {title} {subtitle} {tagline} classes={{ headline: 'max-w-3xl' }} />
  <div class="flex justify-center">
    {prices.map((price) => (
      <div class="relative overflow-visible flex flex-col rounded-lg border-2 border-primary p-8 text-center shadow-2xl w-full max-w-lg bg-white dark:bg-slate-900">
        <div class="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-accent text-white px-4 py-1 rounded-full text-sm font-bold uppercase tracking-widest">
            Lifetime Digital Address
        </div>
        <h3 class="text-2xl font-bold mt-2">{price.title}</h3>
        <div class="mt-8 flex-1">
          <div class="flex items-end justify-center">
            <span class="text-5xl font-bold tracking-tight text-primary">${price.price}</span>
            <span class="ml-1 text-xl font-medium text-muted">/ once</span>
          </div>
          <ul role="list" class="mt-8 space-y-4 text-left">
            {price.items.map((item) => (
              <li class="flex items-start">
                <Icon name="tabler:circle-check" class="w-6 h-6 text-green-500 flex-shrink-0" />
                <p class="ml-3 text-base text-muted">{item.description}</p>
              </li>
            ))}
          </ul>
        </div>
        <div class="mt-10 p-6 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
          <form id="paypal-form" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
            <input type="hidden" name="cmd" value="_xclick" />
            <input type="hidden" name="business" value="ZFG89TK2KESFG" />
            <input type="hidden" id="paypal-item-name" name="item_name" value="Launch.Skin Professional Vanity URL Setup" />
            <input type="hidden" name="item_number" value="LSURL99" />
            <input type="hidden" name="amount" value="99.00" />
            <input type="hidden" name="currency_code" value="USD" />
            <input type="hidden" name="no_shipping" value="1" />
            <input type="hidden" name="no_note" value="1" />
            <input type="hidden" name="solution_type" value="Sole">
            <input type="hidden" name="landing_page" value="billing">
            <div class="text-left mb-4">
              <label class="block text-sm font-bold mb-2 text-slate-700 dark:text-gray-300">1. Choose Your Vanity URL</label>
              <div class="relative">
                <input type="hidden" name="on0" value="Vanity URL" />
                <input type="text" id="vanity-input" name="os0" required class="w-full px-4 py-3 border-2 border-slate-300 rounded-lg focus:ring-primary focus:border-primary dark:bg-slate-900 dark:border-slate-600 transition-all font-semibold" placeholder="yourclinic" />
              </div>
              <div class="mt-3 px-3 py-2.5 bg-blue-50 dark:bg-primary/10 rounded-lg border-2 border-dashed border-primary/40 flex items-center gap-2 overflow-hidden shadow-sm">
                <div class="bg-primary rounded-full p-1 flex-shrink-0"><Icon name="tabler:world" class="w-3.5 h-3.5 text-white" /></div>
                <span class="text-xs md:text-sm font-mono whitespace-nowrap leading-none">
                    <span class="text-slate-500 dark:text-slate-400">https://</span><span id="vanity-preview" class="text-primary dark:text-blue-400 font-bold underline decoration-accent/30 decoration-2 underline-offset-2">yourclinic</span><span class="text-slate-500 dark:text-slate-400">.launch.skin</span>
                </span>
              </div>
            </div>
            <div class="text-left mb-6">
              <label class="block text-sm font-bold mb-2 text-slate-700 dark:text-gray-300">2. Clinic Name</label>
              <input type="hidden" name="on1" value="Clinic Name" />
              <input type="text" id="salon-name-input" name="os1" required class="w-full px-4 py-3 border-2 border-slate-300 rounded-lg dark:bg-slate-900 dark:border-slate-600 transition-all" placeholder="Business Name" />
            </div>
            <button type="submit" class="w-full py-4 px-4 bg-primary hover:bg-blue-700 text-white font-extrabold rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200 text-lg">Secure My URL Today</button>
          </form>
        </div>
      </div>
    ))}
  </div>
</WidgetWrapper>
<script is:inline>
  function initVanityPreview() {
    const vanityInput = document.getElementById('vanity-input');
    const vanityPreview = document.getElementById('vanity-preview');
    const clinicInput = document.getElementById('salon-name-input');
    const paypalItemName = document.getElementById('paypal-item-name');
    if (vanityInput && vanityPreview && clinicInput && paypalItemName) {
      const update = () => {
        let vVal = vanityInput.value.toLowerCase().replace(/[^a-z0-9]/g, '');
        vanityInput.value = vVal;
        vanityPreview.textContent = vVal || 'yourclinic';
        const clinicVal = clinicInput.value || 'New Clinic';
        const displayVanity = vVal || 'yourclinic';
        paypalItemName.value = `Launch.Skin: ${displayVanity}.launch.skin (${clinicVal})`;
      };
      vanityInput.addEventListener('input', update);
      clinicInput.addEventListener('input', update);
      update();
    }
  }
  document.addEventListener('astro:page-load', initVanityPreview);
  initVanityPreview();
</script>
INNEREOF

# 7. Update Logo & Global strings
cat << 'INNEREOF' > src/components/Logo.astro
---
---
<a href="/" class="flex items-center">
  <img src="/images/logo.webp" alt="Launch.Skin" class="h-10 w-auto mr-2 rtl:mr-0 rtl:ml-2" loading="lazy" decoding="async">
  <span class="self-center text-2xl md:text-xl font-bold text-gray-900 whitespace-nowrap dark:text-white">
    Launch.Skin
  </span>
</a>
INNEREOF

cat << 'INNEREOF' > src/components/widgets/Announcement.astro
<div class="dark text-sm bg-black hidden md:flex items-center justify-center overflow-hidden px-3 py-2 relative text-ellipsis whitespace-nowrap">
  <div class="flex items-center gap-2">
    <span>✨ </span><span class="text-white font-medium">Claim your professional <strong>launch.skin/yourclinic</strong> vanity URL today.</span>
  </div>
  <div class="absolute right-4 top-0 h-full flex items-center"><span class="text-white font-medium">Same-day setup. Just $99</span></div>
</div>
INNEREOF

cat << 'INNEREOF' > src/components/widgets/StickyFooterCTA.astro
---
import Button from '~/components/ui/Button.astro';
---
<div class="sticky bottom-0 z-40 w-full flex-none">
  <div class="bg-white dark:bg-slate-900 border-t dark:border-slate-800 shadow-t-lg">
    <div class="max-w-7xl auto px-4 sm:px-6 py-3 flex justify-center items-center">
      <Button
        variant="primary"
        text="Claim Your Clinic's Website - $99"
        href="/pricing"
      />
    </div>
  </div>
</div>
INNEREOF

# 8. Meta sweep and Contact update
sed -i 's/Address.Hair/Launch.Skin/g' src/pages/contact.astro
sed -i 's/Address.Hair/Launch.Skin/g' src/pages/404.astro
sed -i 's/address.hair/launch.skin/g' src/pages/pricing.astro

# 9. Execution: Git Push
git add .
git commit -m "Refactor: Target Skin Clinic owners (Launch.Skin)"
git push

echo "Successfully refactored for Launch.Skin and pushed to Github."
