from config import settings
from langchain_openai import ChatOpenAI
from langchain_experimental.tools import PythonAstREPLTool

# ======== LLM ========
llm = ChatOpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=settings.openrouter_api_key,
    model=settings.model_name
)

# ======== Tools ========
python_tool = PythonAstREPLTool()

# ======== LLM + Tools ========
llm_with_tools = llm.bind_tools([python_tool])
