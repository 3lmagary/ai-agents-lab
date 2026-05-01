#!/bin/bash

# إيقاف الاسكريبت فوراً في حالة حدوث أي خطأ
set -e

echo "🚀 جاري إنشاء هيكل مشروع AI Agent الاحترافي..."

# التحقق من تمرير اسم المشروع مع أمر التشغيل أو طلبه من المستخدم
if [ -z "$1" ]; then
    read -p "Enter project name: " project_name
else
    project_name="$1"
fi

if [ -z "$project_name" ]; then
    echo "❌ خطأ: اسم المشروع لا يمكن أن يكون فارغاً."
    exit 1
fi

if [ -d "$project_name" ]; then
    echo "❌ خطأ: المجلد '$project_name' موجود بالفعل. يرجى اختيار اسم آخر."
    exit 1
fi

# إنشاء المجلد الرئيسي والدخول إليه
mkdir "$project_name"
cd "$project_name"

# ==========================================
# 1. إنشاء المجلدات الأساسية (System Layers)
# ==========================================
mkdir -p data          # 📊 (طبقة البيانات) ملفات الإكسيل والـ PDF
mkdir -p tools         # 🛠️ (طبقة الأدوات) أدوات LangChain المخصصة
mkdir -p workflows     # 🧠 (طبقة العقل) مسارات LangGraph أو CrewAI
mkdir -p knowledge     # 📚 (طبقة المعرفة) أكواد LlamaIndex و RAG

# إنشاء ملفات بايثون الأساسية (__init__.py لجعلها موديولات)
touch tools/__init__.py
touch workflows/__init__.py
touch knowledge/__init__.py

# إنشاء نقطة التشغيل الرئيسية
touch main.py
touch .env
# ==========================================
# 3. إعداد المكتبات الأساسية (requirements.txt)
# ==========================================
cat <<'EOF' > requirements.txt
# الأساسيات وإدارة البيئة
python-dotenv

# طبقة الأدوات والمنطق (Tooling & Logic Layer)
langchain
langchain-openai
langchain-experimental
langgraph

# طبقة الوكلاء (Agents Layer)
crewai
crewai-tools

# تحليل البيانات والرسوم البيانية (Data & Math)
pandas
matplotlib

# أدوات بحث وأخرى
firecrawl-py
EOF

# ==========================================
# 4. ملفات النظام والتجاهل (.gitignore)
# ==========================================
cat <<'EOF' > .gitignore
venv/
__pycache__/
*.pyc
.env
data/
.DS_Store
src/__pycache__
EOF


# ==========================================
# رسالة الختام التوجيهية
# ==========================================
echo ""
echo "======================================================="
echo "✅ تم إنشاء المشروع '$project_name' بنجاح! 🚀"
echo "======================================================="
