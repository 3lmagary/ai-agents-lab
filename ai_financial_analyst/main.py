from config import settings
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=settings.openrouter_api_key,
    model=settings.model_name
)

message = llm.invoke("Hi")  # invoke نفذ او خذ و رد وهكذا 

# الرد نفسه
print(message.content)
print("*" * 20)

# التوكنز — من usage_metadata (الطريقة الأسهل)
print(f"Prompt Tokens: {message.usage_metadata['input_tokens']}")
print(f"Completion Tokens: {message.usage_metadata['output_tokens']}")
print(f"Total Tokens: {message.usage_metadata['total_tokens']}")
print("*" * 20)

# التكلفة — من response_metadata (أعمق بمستوى)
cost = message.response_metadata['token_usage']['cost']
print(f"Cost: ${cost}")