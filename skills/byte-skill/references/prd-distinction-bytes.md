# Distinction Bytes (Mobile App) — Product Requirements Document (PRD)

> Source of truth for the Distinction Bytes product. This is a bundled copy of the
> official PRD so the skill is self-contained — no external download required.
> Owner: FlexiSAF / Distinction Product Team. Status: Draft PRD v1.0.

## 1. Product Overview

- **Product Name:** Distinction Bytes
- **Platform:** Mobile (Android & iOS)
- **Primary Audience:** Learners (secondary school, tertiary, professional, lifelong learners)

**One-liner:** Distinction Bytes is a gamified, AI-powered micro-learning mobile app that enables learners to study any subject or topic through bite-sized, personalized content — either as part of structured courses on Distinction or through on-demand topic exploration.

## 2. Problem Statement

Current learning platforms suffer from one or more of the following:

- Long, exhausting content not optimized for mobile
- Poor learner engagement and retention
- Lack of personalization
- Fragmented tools (LMS, videos, quizzes, notes)
- Weak motivation systems

Learners want:

- Short, engaging lessons
- Clear progress and rewards
- Ability to learn anything, anytime
- Guidance without rigidity

## 3. Product Goals & Success Metrics

### 3.1 Goals

- Create a daily learning habit for users
- Improve course completion rates on Distinction
- Enable instant learning from curiosity-driven searches
- Leverage FlexiSAF AI for adaptive, personalized learning

### 3.2 Success Metrics (North-Star & Supporting)

- Daily Active Learners (DAL)
- 7-day and 30-day retention
- Average bytes completed per session
- Streak continuation rate
- Course completion rate (for enrolled learners)

## 4. Target Users & Personas

**Persona 1: University Student**

- Needs exam-focused learning
- Short attention windows
- Values progress tracking

**Persona 2: Skill Learner / Professional**

- Goal-oriented
- Wants clarity & relevance
- Interested in certificates

**Persona 3: Curious Learner**

- Exploratory
- Searches topics often
- Needs structure from chaos

## 5. Core Value Proposition

Distinction Bytes uniquely combines:

- Micro-learning (3–7 minute bytes)
- AI-generated & curated content
- Gamification that rewards consistency
- Structured courses + open exploration

## 6. Key Product Principles

1. Learner-first, not institution-first
2. Mobile-native, not LMS-adapted
3. Motivation over pressure
4. Progress over perfection
5. AI as a silent guide, not a lecturer

## 7. Core Features & Requirements

### 7.1 Onboarding & User Setup

**Functional Requirements:**

- Email / phone / SSO login (reuse Distinction auth)
- Select learning goals
- Choose interests & level
- Optional placement assessment

**Non-Functional:**

- < 60 seconds to complete onboarding

### 7.2 Learning Modes

**A. Course Mode** — for enrolled Distinction learners

- Sync enrolled courses via Distinction API
- Display course → modules → bytes
- Daily learning goals
- Progress visualization

**B. Explore Mode** — for open learning

- Topic search input
- AI generates a mini-learning path
- Bytes ordered by difficulty
- Optional save to library

### 7.3 Learning Byte

**Definition:** A byte is the smallest unit of learning.

**Components:**

- Title
- Core explanation (text + optional audio)
- Visual aid (diagram / card)
- 1–3 quick questions

**Requirements:**

- Must load in < 1s
- Offline caching (premium)

### 7.4 Gamification System

**Mechanics:**

- XP per byte
- Daily streaks
- Topic mastery levels
- Badges

**Rules:**

- Reward consistency more than speed
- No punishment for breaks

### 7.5 Assessments & Feedback

- Quick quizzes
- Adaptive difficulty
- Instant explanations
- Mastery thresholds

### 7.6 AI-Powered Personalization (FlexiSAF-AI)

**Capabilities:**

- Generate bytes from topic prompts
- Adjust difficulty
- Recommend next bytes
- Multiple explanation styles

**Constraints:**

- AI output must follow byte templates
- Human-verified content for flagship courses

## 8. Technical Architecture

### 8.1 Frontend

- React Native
- Shared design system
- Offline support

### 8.2 Backend

**Existing Systems:**

- Distinction API (courses, users, progress)
- FlexiSAF-AI service (content generation, personalization)

**New Services Needed:**

- Byte orchestration service
- Gamification service
- Recommendation engine (AI-assisted)

## 9. Data & Analytics

**Track:**

- Session length
- Bytes completed
- Drop-off points
- Streaks
- Search queries

Use GA4 + internal analytics.

## 10. Security & Compliance

- Token-based auth (reuse Distinction)
- Rate limiting on AI endpoints
- Content moderation layer
- GDPR-aligned data handling

## 11. Monetization Strategy (Phase-Based)

**Phase 1**

- Free access
- Focus on engagement

**Phase 2**

- Premium subscription
- Institution-sponsored access

## 12. MVP Scope (Phase 1)

**Include:**

- Auth & onboarding
- Course mode
- Explore mode
- Learning bytes
- Basic gamification

**Exclude:**

- Social features
- Live classes
- Certificates

## 13. Roadmap (High-Level)

- **0–3 Months:** MVP build & internal beta
- **3–6 Months:** Public launch, AI refinement
- **6–12 Months:** Monetization & scale

## 14. Open Questions

- Offline limits for free users?
- AI content approval workflow?
- Institutional branding support?

---

## 15. Structure of Bytes

**Executive Recommendation (TL;DR):** Default to text-first + visual cards, enhance with optional audio, use video very selectively, and let AI adapt the format per learner and per topic.

In short: bytes should be readable in 30–90 seconds, understandable without sound, and delightful to look at.

### 15.1 The "Byte" Is Not a Mini Lecture

This is the biggest trap to avoid.

A byte is **NOT**:

- A shortened video lecture
- A PDF page
- A slide deck

A byte **is**: a single idea, explained clearly, with just enough depth to move the learner forward.

If a concept needs more than one idea → it becomes multiple bytes.

### 15.2 Recommended Default Byte Structure (Core)

Every byte should follow the same mental rhythm, even if the media differs.

**The 5-Part Byte Model:**

1. **Hook (1–2 lines)** — Why should I care?
2. **Core Explanation (Text)** — Clear, conversational, concise
3. **Visual Anchor** — Diagram, card, illustration, or table
4. **Quick Check** — 1–3 questions or tap-to-reveal
5. **Takeaway** — One-sentence summary

This structure works across any subject.

### 15.3 Text: Your Primary Medium

Text should be the foundation, not an afterthought.

**Why text wins:**

- Fast to consume
- Works offline
- Easy to scan
- Lowest cognitive load
- Cheapest to generate & refine
- Best for AI adaptation

**But not "wall of text"** — think:

- Short paragraphs
- Bullet points
- Highlighted keywords
- Cards instead of pages

> **Rule:** If a byte takes more than ~90 seconds to read → split it.

### 15.4 Visuals: The Memory Anchor

Visuals are what make bytes stick.

**What kind of visuals?**

- Simple diagrams
- Flow arrows
- Comparison tables
- Illustrated examples
- Concept cards

**What to avoid:**

- Stock photos
- Decorative images
- Heavy infographics

> Think: "If the learner screenshots this, will it still make sense?" If yes → good visual.

### 15.5 Audio: Optional but Powerful

Audio should be additive, not mandatory.

**How audio should work:**

- Tap ▶️ to "listen to this byte"
- 30–90 seconds max
- Natural, calm voice
- Mirrors text (not extra content)

**Why this matters:**

- Commute learning
- Accessibility
- Low bandwidth markets
- Fatigue reduction

**Later phase — multiple audio styles:**

- Calm tutor
- Energetic coach
- Exam-focused narrator

### 15.6 Video: Use Sparingly (Very Sparingly)

Video is expensive and often unnecessary.

**When video makes sense:**

- Demonstrations (e.g., lab experiment, forex chart reading)
- Motion-based concepts
- Skill walkthroughs

**When it doesn't:**

- Definitions
- Theoretical explanations
- Concept breakdowns

> **Rule:** If a concept can be understood without motion → don't use video.

### 15.7 Interactive Micro-Interactions

Instead of video, use interaction.

**Examples:**

- Tap to reveal answer
- Drag-and-drop matching
- Swipe to compare
- Highlight the correct part of a diagram

**These:**

- Increase retention
- Feel game-like
- Cost less than video
- Work offline

### 15.8 AI-Driven Format Adaptation

This is where Distinction Bytes can leapfrog competitors.

**Same byte, different presentations:**

- "Explain simply"
- "Exam-focused"
- "Practical example"
- "Analogy-based"

**Also:**

- Weak learner → more visuals, slower pace
- Advanced learner → concise text, fewer prompts

The content stays the same; the presentation adapts.

### 15.9 Byte Format Types (Standardize These)

Don't allow unlimited creativity early. Define formats.

**Suggested MVP formats:**

1. **Explain** — concept breakdown
2. **Compare** — A vs B
3. **Step-by-step** — processes
4. **Example** — worked problems
5. **Practice** — questions only

**This helps:** AI consistency, analytics, content QA.

### 15.10 Accessibility & Inclusion

Design bytes so that they:

- Work without sound
- Work on small screens
- Load fast on low bandwidth
- Are readable in dark mode

Africa + global markets demand this.

### 15.11 Final Advice (Opinionated)

- Text + visual cards as default
- Audio as a tap-away enhancement
- Video only when motion is essential
- Interaction over passive consumption
- AI adapts the presentation, not the learner

This approach is scalable, cost-effective, delightful, and future-proof.

Possible next steps: define the Byte JSON schema, design AI prompt templates for each byte type, create 3–5 sample bytes (e.g., Calculus, Forex, Biology), or map content standards for Distinction vs open exploration.

## 16. Byte Sources (How Bytes Are Created)

### A) Course-Generated Bytes (Course Mode)

**Purpose:** Help learners study enrolled Distinction courses through AI-generated micro-learning bytes.

**User Flow:**

1. User logs in and sees enrolled courses
2. User selects a course
3. User selects module/topic or chooses "Generate from whole course"
4. System generates a learning path of bytes and begins the Byte Player

**Inputs to Byte Generation:**

- Enrolled course content (course outline, modules, topics, learning objectives)
- User profile (level, learning goals, interests)
- Optional user constraints (exam prep, revision, simplified explanations)

**Requirements:**

- Fetch enrolled courses via Distinction API
- Allow course selection and optional module/topic selection
- Generate a structured byte path (e.g., 5–30 bytes depending on course/module size)
- Order bytes by progression: beginner → intermediate → advanced
- Allow regeneration if user is not satisfied (limited retries)
- Store generated bytes for the user (cache/persist) to reduce repeated generation costs
- Track progress per generated byte path and reflect in course progress

### B) User-Generated Bytes (Manual Topic Mode)

**Purpose:** Let learners instantly learn anything by providing a topic and context.

**User Inputs:**

- Topic (required)
- Level (Beginner / Intermediate / Advanced)
- Goal (exam prep, revision, skill-building)
- Explanation style (simple, examples-first, deep)
- Optional: number of bytes to generate (e.g., 3–10)

**Requirements:**

- Generate a mini learning path from the user topic
- Order bytes by difficulty progression
- Allow saving generated bytes/paths to library (optional in MVP)
- Ensure AI follows the byte template strictly

## 17. Bytes Data Structure

```text
Topic
 └─ BytePath
      ├─ Byte 1 (concept intro)
      ├─ Byte 2 (rule)
      ├─ Byte 3 (example)
      └─ Byte 4 (application)
```

This applies to:

- Manual Topic Mode
- Course Mode (course or module becomes the "topic source")
