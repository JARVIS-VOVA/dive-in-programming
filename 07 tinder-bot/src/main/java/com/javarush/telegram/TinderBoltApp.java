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

public class TinderBoltApp extends MultiSessionTelegramBot {
    public static final String TELEGRAM_BOT_TOKEN = "tinder_bot"; //TODO: додай токен бота в лапках
    public static final String OPEN_AI_TOKEN = "chat-gpt-token"; //TODO: додай токен ChatGPT у лапках
    public static final String TELEGRAM_BOT_NAME = "tinder_bot";

    public DialogMode mode = DialogMode.MAIN;
    public ChatGPTService gptService = new ChatGPTService(OPEN_AI_TOKEN);

    public TinderBoltApp() {
        super(TELEGRAM_BOT_NAME, TELEGRAM_BOT_TOKEN);
    }

    @Override
    public void onUpdateEventReceived(Update update) {
        String message = getMessageText();
        if (message.equals("/start")) {
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

        if (message.equals("/gpt")) {
            mode = DialogMode.GPT;
            String gptMessage = loadMessage("gpt");
            sendTextMessage(gptMessage);
            sendPhotoMessage("gpt");
            return;
        }

        if (mode == DialogMode.GPT) {
            String gpt_prompt = loadPrompt("gpt");
            String answer = gptService.sendMessage(gpt_prompt, message);
            sendTextMessage(answer);
            return;
        }
    }

    public static void main(String[] args) throws TelegramApiException {
        TelegramBotsApi telegramBotsApi = new TelegramBotsApi(DefaultBotSession.class);
        telegramBotsApi.registerBot(new TinderBoltApp());
    }
}
