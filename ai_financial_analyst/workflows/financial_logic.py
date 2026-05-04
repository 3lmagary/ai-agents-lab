from langgraph.graph import StateGraph, END
from typing import TypedDict, Annotated
from langgraph.graph.message import add_messages
from langgraph.prebuilt import ToolNode, tools_condition

from llm import llm_with_tools, python_tool 

class AgentState(TypedDict):
    messages: Annotated[list, add_messages]


def call_model(state: AgentState):
    response = llm_with_tools.invoke(state["messages"])
    return {"messages": [response]}


tool_node = ToolNode([python_tool])

workflow = StateGraph(AgentState)

workflow.add_node("agent", call_model)
workflow.add_node("tools", tool_node)

workflow.set_entry_point("agent")


workflow.add_conditional_edges("agent", tools_condition)

workflow.add_edge("tools", "agent")

app = workflow.compile()