# 🚀 AI B2B Deal Architect

## 📌 Overview
An autonomous multi-agent AI system built with **Python** and **CrewAI**. This system acts as an elite sales team that scrapes target company websites, analyzes their business model & pain points, and drafts highly personalized B2B cold emails to maximize conversion rates.

## 🏗️ Architecture
- **Researcher Agent:** Uses `ScrapeWebsiteTool` to read the target website and extract the Value Proposition and Ideal Customer Profile (ICP).
- **Intelligence Agent:** Analyzes the research data to find a strategic "Sales Angle" or gap in the market.
- **Closer Agent:** Crafts a concise (<150 words), highly personalized cold email based on the intelligence brief.

## 🛠️ Tech Stack
- **Framework:** CrewAI, LangChain
- **Language:** Python 3.x
- **LLM:** `gpt-4o-mini` (via OpenRouter)
- **Tools:** Custom Web Scraper Tool

## 💡 Business Value
This automation saves hours of manual lead research and copywriting, allowing agencies and B2B companies to scale their outbound sales with hyper-personalized outreach.

## 🚀 How to Start (Setup & Run)

We have created an automated script that handles the entire setup process for you!

1. Open your terminal in the project directory.
2. Run the magic script:
   ```bash
   ./setup_and_run.sh
   ```
3. The script will ask you for your **OpenRouter** and **Firecrawl** API keys.
4. It will automatically create your virtual environment, install all dependencies, and launch the AI!

Enjoy your automated sales team! 🎉