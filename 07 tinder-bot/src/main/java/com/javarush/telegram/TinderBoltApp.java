package com.javarush.telegram;

import com.javarush.telegram.ChatGPTService;
import com.javarush.telegram.DialogMode;
import com.javarush.telegram.MultiSessionTelegramBot;
import com.javarush.telegram.UserInfo;
import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.meta.api.objects.*;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;

import java.util.ArrayList;
import java.util.List;

public class TinderBoltApp extends MultiSessionTelegramBot {
    public static final String TELEGRAM_BOT_TOKEN = "tinder_bot"; //TODO: додай токен бота в лапках
    public static final String OPEN_AI_TOKEN = "chat-gpt-token"; //TODO: додай токен ChatGPT у лапках
    public static final String TELEGRAM_BOT_NAME = "tinder_bot";

    public DialogMode mode = DialogMode.MAIN;
    public ChatGPTService gptService = new ChatGPTService(OPEN_AI_TOKEN);
    private List<String> chat;

    public TinderBoltApp() {
        super(TELEGRAM_BOT_NAME, TELEGRAM_BOT_TOKEN);
    }

    @Override
    public void onUpdateEventReceived(Update update) {
        String message = getMessageText();

        switch (message) {
            case "/start" -> {
                mode = DialogMode.MAIN;
                showMainMenu(
                        "головне меню бота", "/start",
                        "генерація Tinder-профілю 😎", "/profile",
                        "повідомлення для знайомства 🥰", "/opener",
                        "листування від вашого імені 😈", "/message",
                        "листування із зірками 🔥", "/date",
                        "поставити запитання чату GPT 🧠", "/gpt"
                );

                String menu = loadMessage("main");
                sendTextMessage(menu);
                sendPhotoMessage("main");
                return;
            }
            case "/gpt" -> {
                mode = DialogMode.GPT;
                String gptMessage = loadMessage("gpt");
                sendTextMessage(gptMessage);
                sendPhotoMessage("gpt");
                return;
            }
            case "/date" -> {
                mode = DialogMode.DATE;
                sendPhotoMessage("date");
                String dateMessage = loadMessage("date");
                sendTextButtonsMessage(dateMessage,
                        "Аріана Гранде", "date_grande",
                        "Марго Роббі", "date_robbie",
                        "Зендея", "date_zendaya",
                        "Райан Гослінг", "date_gosling",
                        "Том Харді", "date_hardy");
                return;
            }
            case "/message" -> {
                mode = DialogMode.MESSAGE;
                sendPhotoMessage("message");
                String gptMessageHelper = loadMessage("message");
                sendTextButtonsMessage (gptMessageHelper,
                        "Наступне повідомлення", "message_next",
                        "Запросити на побачення", "message_date");
                chat = new ArrayList<>();
                return;
            }
        }

        switch (mode) {
            case GPT -> {
                String gpt_prompt = loadPrompt("gpt");
                Message loadingMessage = sendTextMessage("Почекай...");
                String answer = gptService.sendMessage(gpt_prompt, message);
                updateTextMessage(loadingMessage, answer);
                return;
            }
            case DATE -> {
                String query = getCallbackQueryButtonKey();
                if (query.startsWith("date_")) {
                    sendPhotoMessage(query);
                    String prompt = loadPrompt(query);
                    gptService.setPrompt(prompt);
                    return;
                }
                Message loadingMessage = sendTextMessage("Почекай...");
                String answer = gptService.addMessage(message);
                updateTextMessage(loadingMessage, answer);
                return;
            }
            case MESSAGE -> {
                String query = getCallbackQueryButtonKey();
                if (query.startsWith("message_")) {
                    String prompt = loadPrompt(query);
                    String history = String. join("/n/n", chat);
                    Message loadingMessage = sendTextMessage("Почекай...");
                    String answer = gptService.sendMessage(prompt, history);
                    updateTextMessage(loadingMessage, answer);
                }
                chat.add(message);
                return;
            }
        }
    }

    public static void main(String[] args) throws TelegramApiException {
        TelegramBotsApi telegramBotsApi = new TelegramBotsApi(DefaultBotSession.class);
        telegramBotsApi.registerBot(new TinderBoltApp());
    }
}
