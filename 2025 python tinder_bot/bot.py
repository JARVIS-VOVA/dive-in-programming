from telegram.ext import ApplicationBuilder, MessageHandler, filters, CallbackQueryHandler, CommandHandler

from gpt import *
from util import *

TELEGRAM_BOT_TOKEN = "8034267?49:AAEw_HNWPHE6BoU_Jj2?Wx8QGnk0Geq-vMY"

async def start(update, context):
    # await send_photo(update, context, "avatar_main")
    # await send_text(update, context, "привіт користувач")
    message = load_message("main")
    await send_text(update, context, message)

async def hello(update, context):
    # await send_text(update, context, "Hello" + update.message.text)
    await send_text_buttons(update, context, "Hello " + update.message.text, {
        "start": "Start",
        "stop": "Stop"
    })

async def buttons_handler(update, context):
    query = update.callback_query.data
    if query == "start":
        await send_text(update, context, "Started")
    elif query == "stop":
        await send_text(update, context, "Stopped")

app = ApplicationBuilder().token(TELEGRAM_BOT_TOKEN).build()
app.add_handler(CommandHandler("start", start))
app.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, hello))
app.add_handler(CallbackQueryHandler(buttons_handler))
app.run_polling()
