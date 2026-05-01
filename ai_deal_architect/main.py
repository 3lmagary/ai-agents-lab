from crewai import Crew , Process
from agents import *
from tasks import *


deal_architect = Crew(
  agents=[researcher_agent,intel_agent,closer_agent],
  tasks=[researcher_task,intel_task,closer_task],
  process = Process.sequential # كل واحد بدوره و يسلمه لبعض 
)


if __name__ == "__main__":
    print("🚀 جاري إطلاق مهندس الصفقات الذكي...")
    target_website = "https://www.crewai.com/"
    
    # Run the crew with the correct inputs
    result = deal_architect.kickoff(inputs={"website_url": target_website})
    
    print("\n\n✅ المهمة تمت بنجاح! إليك النتيجة النهائية:")
    print("==========================================")
    print(result)