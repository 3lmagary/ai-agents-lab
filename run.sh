#!/bin/bash

# إيقاف الاسكريبت فوراً في حالة حدوث أي خطأ
set -e

echo "🚀 جاري إنشاء هيكل مشروع AI Agent الاحترافي..."

# التأكد من وجود python3 قبل البدء
if ! command -v python3 &> /dev/null; then
    echo "❌ خطأ: لم يتم العثور على python3. يرجى تثبيته أولاً."
    exit 1
fi

# التحقق من تمرير اسم المشروع مع أمر التشغيل أو طلبه من المستخدم
if [ -z "$1" ]; then
    read -p "Enter project name: " project_name
else
    project_name="$1"
fi

# التحقق من أن الاسم ليس فارغاً
if [ -z "$project_name" ]; then
    echo "❌ خطأ: اسم المشروع لا يمكن أن يكون فارغاً."
    exit 1
fi

# التحقق مما إذا كان المجلد موجوداً بالفعل لتجنب مسح أو تداخل الملفات
if [ -d "$project_name" ]; then
    echo "❌ خطأ: المجلد '$project_name' موجود بالفعل. يرجى اختيار اسم آخر."
    exit 1
fi

# إنشاء المجلد الرئيسي والدخول إليه (تم وضع المتغير بين "" لدعم المسافات)
mkdir "$project_name"
cd "$project_name"

# إنشاء هيكل المجلدات الاحترافي
mkdir -p src/config
mkdir -p src/tools
mkdir -p data # لوضع ملفات الـ CSV أو Excel

# إنشاء ملفات بايثون الأساسية
touch src/__init__.py
touch src/config/__init__.py
touch src/tools/__init__.py
touch src/tasks.py src/agents.py

# ==========================================
# 1. إعداد ملف البيئة .env لدعم OpenRouter
# ==========================================
cat <<EOL > .env
# إعدادات OpenRouter
# نستخدم OPENAI_API_BASE لأن CrewAI و Langchain يعتمدان على حزمة OpenAI للاتصال بـ OpenRouter
OPENAI_API_BASE="https://openrouter.ai/api/v1"

# ضع مفتاح الـ API الخاص بـ OpenRouter هنا
OPENAI_API_KEY="your_openrouter_api_key_here"

# اسم الموديل الذي ترغب في استخدامه من OpenRouter
OPENAI_MODEL_NAME="mistralai/mixtral-8x7b-instruct"

# إعدادات إضافية (أدوات البحث وغيرها)
# TAVILY_API_KEY="your_tavily_api_key"
# SERPER_API_KEY="your_serper_api_key"
EOL

# إنشاء نسخة احتياطية من الإعدادات للرجوع إليها
cp .env .env.example

# ==========================================
# 2. إنشاء نقطة الدخول (main.py) المجهزة
# ==========================================
cat <<EOL > src/main.py
import os
from dotenv import load_dotenv

# تحميل المتغيرات من ملف .env لتجهيز اتصال OpenRouter
load_dotenv()

def main():
    print("🚀 بدء تشغيل مشروع AI Agent...")
    print(f"🔗 نقطة الاتصال (Base URL): {os.getenv('OPENAI_API_BASE')}")
    print(f"🤖 الموديل المستخدم: {os.getenv('OPENAI_MODEL_NAME')}")
    print("-" * 40)
    
    # مكان ممتاز لبدء استدعاء الـ Agents الخاصة بك
    # example: 
    # my_crew = Crew(agents=[...], tasks=[...])
    # result = my_crew.kickoff()

if __name__ == "__main__":
    main()
EOL

# ==========================================
# 3. إعداد المكتبات الأساسية (requirements.txt)
# ==========================================
cat <<EOL > requirements.txt
# الأساسيات وإدارة البيئة
python-dotenv

# طبقة الأدوات والمنطق (Tooling & Logic Layer)
langchain
langchain-openai
langchain-experimental   # (تحتوي على أدوات قوية مثل Python REPL)
langgraph

# طبقة الوكلاء (Agents Layer)
crewai
crewai-tools

# تحليل البيانات والرسوم البيانية (Data & Math)
pandas
matplotlib
EOL

# ==========================================
# 4. ملفات النظام والتجاهل (.gitignore & README)
# ==========================================
cat <<EOL > .gitignore
venv/
__pycache__/
*.pyc
.env
data/
.DS_Store
EOL

cat <<EOL > README.md
# $project_name

هذا المشروع عبارة عن قالب جاهز لتطوير وكلاء الذكاء الاصطناعي (AI Agents).
تم إعداد هذا المشروع ليعمل مباشرة مع **OpenRouter** للوصول إلى مجموعة واسعة من النماذج.

## خطوات التشغيل

1. قم بالدخول إلى بيئة العمل:
   \`\`\`bash
   source venv/bin/activate
   \`\`\`

2. تأكد من إضافة مفتاح OpenRouter الخاص بك في ملف \`.env\`.

3. تشغيل المشروع:
   \`\`\`bash
   python src/main.py
   \`\`\`
EOL

# ==========================================
# 5. بناء البيئة الافتراضية وتثبيت المكتبات
# ==========================================
echo "🐍 جاري إعداد بيئة العمل الافتراضية وتثبيت المكتبات (قد يستغرق بعض الوقت)..."
python3 -m venv venv

# استخدام مسار pip الخاص بالبيئة الافتراضية مباشرة (طريقة أكثر أماناً في السكربتات)
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

# ==========================================
# 6. رسالة الختام التوجيهية
# ==========================================
echo ""
echo "======================================================="
echo "✅ تم إنشاء المشروع '$project_name' بنجاح! 🚀"
echo "تم إعداد المشروع وربطه مسبقاً بـ OpenRouter."
echo "======================================================="
echo "للشروع في العمل، انسخ ونفذ الأوامر التالية:"
echo ""
echo "  cd \"$project_name\""
echo "  source venv/bin/activate"
echo "  # افتح ملف .env وضع مفتاح API الخاص بك"
echo "  python src/main.py"
echo "======================================================="
