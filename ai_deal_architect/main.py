from dotenv import load_dotenv
load_dotenv()

from crewai import Crew, Process
from agents import *
from tasks import *
from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt
from rich.text import Text

console = Console()

deal_architect = Crew(
  agents=[researcher_agent, intel_agent, closer_agent],
  tasks=[researcher_task, intel_task, closer_task],
  process=Process.sequential # كل واحد بدوره و يسلمه لبعض 
)

if __name__ == "__main__":
    console.clear()
    
    # Title Panel
    title = Text("🚀 AI Deal Architect", style="bold magenta", justify="center")
    console.print(Panel(title, border_style="cyan", padding=(1, 5)))
    
    console.print("\n[bold yellow]Welcome to the elite B2B Sales Automation System![/bold yellow]")
    console.print("[dim]This system will scrape the target website, analyze their business model, and write a highly personalized cold email.[/dim]\n")
    
    # Beautiful Input Prompt
    target_website = Prompt.ask("[bold green]🔗 Enter The Target Website URL[/bold green]")
    our_solution = Prompt.ask("[bold blue]💼 What is YOUR product/service? (e.g. AI Chatbots, SEO Services, Lead Gen)[/bold blue]")
    
    console.print(f"\n[bold cyan]⏳ Initializing the AI Crew for:[/bold cyan] [u]{target_website}[/u] ...\n")
    
    # Loading Spinner while agents work
    with console.status("[bold green]🤖 Agents are working hard... This may take a minute...[/bold green]", spinner="dots"):
        # Run the crew with the correct inputs
        result = deal_architect.kickoff(inputs={"website_url": target_website, "our_solution": our_solution})
    
    console.print("\n[bold green]✅ Mission Accomplished![/bold green]\n")
    
    # Output the result inside a nice Panel
    console.print(Panel(str(result), title="[bold green]🎯 Final Output (Cold Email)[/bold green]", border_style="green", padding=(1, 2)))