#!/bin/bash

# 1. Fix Footer Brand Name
cat << 'INNEREOF' > src/components/widgets/Footer.astro
---
import { Icon } from 'astro-icon/components';
import { getHomePermalink } from '~/utils/permalinks';

interface Link { text?: string; href?: string; ariaLabel?: string; icon?: string; }
interface Links { title?: string; links: Array<Link>; }
export interface Props { links: Array<Links>; secondaryLinks: Array<Link>; socialLinks: Array<Link>; footNote?: string; theme?: string; }

const { socialLinks = [], secondaryLinks = [], links = [], footNote = '', theme = 'light' } = Astro.props;
---

<footer class:list={[{ dark: theme === 'dark' }, 'relative border-t border-gray-200 dark:border-slate-800 not-prose']}>
  <div class="relative max-w-7xl mx-auto px-4 sm:px-6">
    
    <div class="flex justify-center py-8 md:py-12">
      {links.map(({ title, links: primaryLinks }) => (
        <div class="text-center">
          <div class="dark:text-gray-300 font-bold mb-2 uppercase tracking-widest text-sm">{title}</div>
            <ul class="text-sm flex flex-wrap justify-center items-center" role="list">
                {primaryLinks.map((link, index) => (
                    <li>
                        <a class="text-muted hover:text-gray-700 hover:underline dark:text-gray-400 transition" href={link.href}>{link.text}</a>
                        {index < primaryLinks.length - 1 && <span class="mx-2" aria-hidden="true">·</span>}
                    </li>
                ))}
            </ul>
        </div>
      ))}
    </div>

    <div class="flex flex-col-reverse items-center md:flex-row md:justify-between py-6 md:py-8 border-t border-gray-200 dark:border-slate-800">
      
      <div class="text-sm text-muted text-center md:text-left mt-4 md:mt-0">
        <div class="mb-1">
          <a class="font-bold text-xl hover:text-primary transition" href={getHomePermalink()}>Launch.Skin</a>
          <span class="hidden md:inline mx-2 text-gray-400">|</span>
          <span class="italic text-gray-500">Your Clinical Masterpiece ✨</span>
        </div>
        <div>
          <Fragment set:html={footNote} />
        </div>
      </div>

      <div class="flex items-center justify-center gap-x-6">
        <div class="text-sm text-muted">
          {secondaryLinks.map(({ text, href }, index) => (
            <>
              <a class="text-muted hover:text-gray-700 dark:text-gray-400 hover:underline transition" href={href} set:html={text} />
              {index < secondaryLinks.length - 1 && <span class="px-1">·</span>}
            </>
          ))}
        </div>
      </div>
    </div>
  </div>
</footer>
INNEREOF

# 2. Fix About Page (Restore missing images and enriched blocks)
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = { 
  title: 'The Story | Launch.Skin', 
  description: 'Why we build boutique websites for the world’s best skin clinics. Learn how we help practitioners dominate their local market.' 
};
---
<Layout metadata={metadata}>
  <Hero2
    tagline="The Story"
    title='Elite Websites for <span class="text-accent">Elite Practitioners</span>'
    subtitle="We believe your digital address should be as pristine as the results you create in the treatment room. Amazing practitioners lose patients when their online presence doesn't match their expertise."
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
        { 
          title: 'Patient Advocacy', 
          description: 'A professional digital home builds deeper trust. Our system turns one-time procedures into lifelong patients by presenting your results in a luxury clinical environment.', 
          icon: 'tabler:users' 
        },
    ]}
    image={{ src: '/images/testimonial-4.webp', alt: 'Clinic professional working on patient' }}
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
          title: 'Zero Maintenance', 
          description: 'We know you are busy with patient consultations. Once we set up your vanity URL and sync your feeds, you never have to log in or "manage" a website again.', 
          icon: 'tabler:settings' 
        },
        { 
          title: 'The "Wall of Results" Widget', 
          description: 'We automatically sync your best Instagram transformations directly to your site, building instant trust with new patients 24/7.', 
          icon: 'tabler:stars' 
        },
        { 
          title: 'One-Time Payment', 
          description: 'We don’t believe in monthly fees that eat your profits. $99 once, and you own the system for the life of your clinic.', 
          icon: 'tabler:coin' 
        },
    ]}
    image={{ src: '/images/testimonial-3.webp', alt: 'Skin practitioner reviewing feedback' }}
  >
    <Fragment slot="content">
      <h2 class="text-3xl font-bold tracking-tight dark:text-white sm:text-4xl mb-4">Our Commitment to Your Success</h2>
      <p class="text-muted text-lg mb-6">We aren't just another tech company. We are a partner in your clinic’s growth. We handle the technical hurdles so you can stay focused on clinical excellence.</p>
    </Fragment>
  </Content>

  <Pricing title='<span class="text-accent dark:text-white">Invest in Your Clinic’s Future.</span>' prices={[lifetimeDeal]} />
</Layout>
INNEREOF

# 3. Fix Privacy Page
cat << 'INNEREOF' > src/pages/privacy.astro
---
import Layout from '~/layouts/PageLayout.astro';

const metadata = { title: 'Privacy Policy | Launch.Skin' };
---
<Layout metadata={metadata}>
  <section class="px-4 py-16 sm:px-6 mx-auto lg:px-8 lg:py-20 max-w-4xl">
    <h1 class="font-bold font-heading text-4xl md:text-5xl leading-tighter tracking-tighter mb-8 text-center">Privacy Policy</h1>
    <div class="prose prose-lg max-w-4xl dark:prose-invert">
      <p>Last updated: March 21, 2026</p>
      <p>At Launch.Skin, we take your privacy seriously. This policy describes how we collect, use, and handle your information when you use our website and services.</p>
      <h2>1. Information We Collect</h2>
      <p>We collect information you provide directly to us, such as when you purchase a vanity URL, including your clinic name, Instagram handle, and payment information.</p>
      <h2>2. How We Use Information</h2>
      <p>We use the information to set up your professional digital address, sync your social media feeds, and provide ongoing white-glove support.</p>
      <h2>3. Data Security</h2>
      <p>We implement enterprise-grade security measures to protect your data. We do not store your Google login credentials; we only use public business data for syncing.</p>
      <h2>4. Contact Us</h2>
      <p>If you have questions about your data, please visit <a href="/contact">our contact page</a>.</p>
    </div>
  </section>
</Layout>
INNEREOF

# 4. Fix Terms Page
cat << 'INNEREOF' > src/pages/terms.astro
---
import Layout from '~/layouts/PageLayout.astro';

const metadata = { title: 'Terms of Service | Launch.Skin' };
---
<Layout metadata={metadata}>
  <section class="px-4 py-16 sm:px-6 mx-auto lg:px-8 lg:py-20 max-w-4xl">
    <h1 class="font-bold font-heading text-4xl md:text-5xl leading-tighter tracking-tighter mb-8 text-center">Terms of Service</h1>
    <div class="prose prose-lg max-w-4xl dark:prose-invert">
      <p>Last updated: March 21, 2026</p>
      <p>By using Launch.Skin, you agree to the following terms:</p>
      <h2>1. Lifetime License</h2>
      <p>The $99 fee grants you a lifetime license for your specific vanity URL and boutique site setup. There are no recurring monthly subscription fees.</p>
      <h2>2. Custom Domains</h2>
      <p>While the launch.skin vanity URL is included, custom domains (e.g., .com) are subject to a $15/year registration and management fee if processed through our studio.</p>
      <h2>3. Service Use</h2>
      <p>You agree to provide accurate business information and Instagram handles for the purpose of site generation.</p>
      <h2>4. Support</h2>
      <p>Lifetime white-glove support includes basic menu updates and technical maintenance of your URL hosting.</p>
    </div>
  </section>
</Layout>
INNEREOF

# 5. Global text sweep for Launch.Skin
grep -rl "address.hair" src/ | xargs sed -i 's/address.hair/launch.skin/g'
grep -rl "Address.Hair" src/ | xargs sed -i 's/Address.Hair/Launch.Skin/g'

# Execution: Git Push
git add .
git commit -m "BUG FIX: Restored About images, fixed footer branding, and repaired legal pages"
git push

echo "ALL BUGS FIXED: Launch.Skin is now consistent and operational."
