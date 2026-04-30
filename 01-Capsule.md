<!--
<tutor_plan_state>
covered_so_far:
  - "Step-1: AI Automation & APIs"
  - "Step-2: No-Code & Python Basics"
  - "Step-3: Defining Agents (CrewAI Basics)"
  - "Step-4: Building Single Agent with LLM"
  - "Step-5: Tools and RAG Concepts"
next_to_discuss:
  rationale: "User requested a comprehensive summary (Capsule) and the kickoff of a highly practical, non-traditional portfolio project to apply all learned concepts."
  substep: "Step-6 Substep-1: Advanced Portfolio Building - First Project Proposal & Plan"
</tutor_plan_state>
-->

### 🔴 أولاً: الكبسولة الذكية (The AI Agent Capsule)
*خلاصة ما سبق في 3 دقائق لإنعاش ذاكرتك قبل المعركة:*

1. **المفاهيم الأساسية (The Core):**
   * **LLM (العقل):** نموذج الذكاء الاصطناعي (مثل GPT-4, Gemini, OpenRouter). بدونه، النظام مجرد كود غبي.
   * **Agent (الموظف):** كائن برمجي له `Role` (دور)، `Goal` (هدف)، و `Backstory` (شخصية).
   * **Task (المهمة):** الوظيفة المطلوبة، وتتكون من `Description` (وصف دقيق) و `Expected Output` (شكل المخرج النهائي).
   * **Tools (الأيدي):** قدرات إضافية نعطيها للوكيل ليتفاعل مع العالم الخارجي (بحث جوجل، قراءة PDF، إرسال API).
   * **Crew (الشركة):** الحاوية التي تجمع الوكلاء والمهام وتحدد طريقة سير العمل `Process` (بالترتيب Sequential أو بالتوازي).

2. **أفضل الممارسات (Pro Tips):**
   * **Prompt Engineering:** اجعل الـ `Backstory` غنياً بالتفاصيل. قل للوكيل "أنت خبير لا تخطئ وتعتمد على الحقائق" بدلاً من "أنت مساعد".
   * **Modularity:** لا تكتب كل الكود في ملف واحد. المحترفون يفصلون الأدوات في ملف، والوكلاء في ملف، والتشغيل في ملف.
   * **Temperature:** اجعلها منخفضة (0.1 - 0.3) للمهام التحليلية والبحثية، ومرتفعة (0.7) لمهام الإبداع وكتابة المحتوى.

3. **أخطاء شائعة دمرت أنظمة للمبتدئين:**
   * نسيان ربط الـ `Task` بالـ `Agent` المخصص لها.
   * إعطاء الوكيل أداة (Tool) دون إخباره بكيفية استخدامها في الـ `Description`.
   * عدم التعامل مع صيغ الـ JSON بشكل صحيح عند استقبال البيانات من APIs.

---
## 🧠 قواعد كتابة commit احترافي
> استخدم prefixes:
- feat: → feature جديدة
- fix: → bug fix
- chore: → تنظيم / setup
- refactor: → تحسين كود
- docs: → README أو توثيق