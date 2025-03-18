from telegram.ext import ApplicationBuilder, MessageHandler, filters, CallbackQueryHandler, CommandHandler

from gpt import *
from util import *

TELEGRAM_BOT_TOKEN = "8034267?49:AAEw_HNWPHE6BoU_Jj2?Wx8QGnk0Geq-vMY"
OPEN_AI_TOKEN = "gpt:AwXimzQXBV8upnlD2Fs0exPWVNTK9gmJGa_-erhzfPL1q5ldKc7zlb9PU53QlMYgrXBnjxK1uVJFkblB?TVSZ57z?Zm705v8y2sd9IG54evj_wDJ-zeNy_W7xT6lcYEGbp9qD9IbKvgZ5Ks22k_pKNEe74Sd"

async def start(update, context):
    message = load_message("main")
    await send_photo(update, context, "main")
    await send_text(update, context, message)
    await show_main_menu(update, context, {
        "start": "Головне меню",
        "profile": "Генерація Tinder-anoia \uD83D\uDE0E",
        "opener": "Повідомлення для знайомства \uD83E\uDD70",
        "message": "Переписка від вашого імені \uD83D\uDE08",
        "date": "Спілкування з зірками \uD83D\uDD25",
        "gpt": "Задати питання ChatGPT \uD83E\uDDE0",
    })

async def hello(update, context):
    if dialog.mode == "gpt":
        await gpt_dialog(update, context)

async def gpt(update, context):
    dialog.mode = "gpt"
    await send_photo(update, context, "gpt")
    message = load_message("gpt")
    await send_text(update, context, message)

async def gpt_dialog(update, context):
    text = update.message.text
    prompt = load_prompt("gpt")
    answer = await chatgpt.send_question(prompt, text)
    await send_text(update, context, answer)

async def buttons_handler(update, context):
    query = update.callback_query.data
    if query == "start":
        await send_text(update, context, "Started")
    elif query == "stop":
        await send_text(update, context, "Stopped")

dialog = Dialog()
dialog.mode = None

chatgpt = ChatGptService(token=OPEN_AI_TOKEN)

app = ApplicationBuilder().token(TELEGRAM_BOT_TOKEN).build()
app.add_handler(CommandHandler("start", start))
app.add_handler(CommandHandler("gpt", gpt))
app.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, hello))
# app.add_handler(CallbackQueryHandler(buttons_handler))
app.run_polling()
