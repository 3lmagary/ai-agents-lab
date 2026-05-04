from workflows.financial_logic import app

inputs = {"messages": [("user", "افتح ملف data/sales_2025.csv وقولي إجمالي الإيرادات لكل الشهور كام؟")]}

for event in app.stream(inputs, stream_mode="values"):
    message = event["messages"][-1]
    message.pretty_print()
print("*" * 20)

print(f"Prompt Tokens: {message.usage_metadata['input_tokens']}")
print(f"Completion Tokens: {message.usage_metadata['output_tokens']}")
print(f"Total Tokens: {message.usage_metadata['total_tokens']}")
print("*" * 20)

cost = message.response_metadata['token_usage']['cost']
print(f"Cost: ${cost}")