/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "native_common.h"
#include "nativekeycode/KeyCodeFunction1.h"
#include "nativekeycode/KeyCodeFunction2.h"
#include "nativekeycode/KeyCodeFunction3.h"
#include "nativekeycode/KeyCodeFunction4.h"
#include <ace/xcomponent/native_xcomponent_key_event.h>
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>

static napi_value InitKeyMonitor(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    int32_t intValue;
    napi_value args[1]; // 存储参数数组

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &intValue);
    struct KeyMap { int key; bool* flag; } map[] = {
        { KEY_APOSTROPHE, KEY(ApostropheIsTrue) }, { KEY_GRAVE, KEY(GraveIsTrue) },
        { KEY_MINUS, KEY(MinusIsTrue) }, { KEY_EQUALS, KEY(EqualsIsTrue) },
        { KEY_LEFT_BRACKET, KEY(LeftBracketIsTrue) }, { KEY_RIGHT_BRACKET, KEY(RightBracketIsTrue) },
        { KEY_BACKSLASH, KEY(BackslashIsTrue) }, { KEY_SEMICOLON, KEY(SemicolonIsTrue) },
        { KEY_SLASH, KEY(SlashIsTrue) }, { KEY_AT, KEY(AtIsTrue) }
    };
    for (size_t i = 0; i < sizeof(map) / sizeof(map[0]); i++) {
        if (intValue == map[i].key) {
            *(map[i].flag) = 1;
            break;
        }
    }
    return nullptr;
}

static napi_value InitKeyMonitor1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    int32_t intValue;
    napi_value args[1]; // 存储参数数组
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &intValue);
    struct { int key; bool* flag; } map[] = {
        { KEY_UNKNOWN, KEY(UnknownIsTrue) }, { KEY_FN, KEY(FnIsTrue) }, { KEY_HOME, KEY(HomeIsTrue) },
        { KEY_BACK, KEY(BackIsTrue) }, { KEY_MEDIA_PLAY_PAUSE, KEY(MediaPlayPauseIsTrue) },
        { KEY_MEDIA_STOP, KEY(MediaStopIsTrue) }, { KEY_MEDIA_NEXT, KEY(MediaNextIsTrue) },
        { KEY_MEDIA_PREVIOUS, KEY(MediaPreviousIsTrue) }, { KEY_MEDIA_REWIND, KEY(MediaRewindIsTrue) },
        { KEY_MEDIA_FAST_FORWARD, KEY(MediaFastForwardIsTrue) }, { KEY_VOLUME_UP, KEY(VolumeUpIsTrue) },
        { KEY_VOLUME_DOWN, KEY(VolumeDownIsTrue) }, { KEY_POWER, KEY(PowerIsTrue) },
        { KEY_CAMERA, KEY(CameraIsTrue) }, { KEY_VOLUME_MUTE, KEY(VolumeMuteIsTrue) }, { KEY_MUTE, KEY(MuteIsTrue) },
        { KEY_BRIGHTNESS_UP, KEY(BrightnessUpIsTrue) }, { KEY_BRIGHTNESS_DOWN, KEY(BrightnessDownIsTrue) },
        { KEY_0, KEY(0IsTrue) }, { KEY_1, KEY(1IsTrue) }, { KEY_2, KEY(2IsTrue) }, { KEY_3, KEY(3IsTrue) },
        { KEY_4, KEY(4IsTrue) }, { KEY_5, KEY(5IsTrue) }, { KEY_6, KEY(6IsTrue) }, { KEY_7, KEY(7IsTrue) },
        { KEY_8, KEY(8IsTrue) }, { KEY_9, KEY(9IsTrue) },
        { KEY_STAR, KEY(StarIsTrue) }, { KEY_POUND, KEY(PoundIsTrue) }, { KEY_DPAD_UP, KEY(DpadUpIsTrue) },
        { KEY_DPAD_DOWN, KEY(DpadDownIsTrue) }, { KEY_DPAD_LEFT, KEY(DpadLeftIsTrue) },
        { KEY_DPAD_RIGHT, KEY(DpadRightIsTrue) }, { KEY_DPAD_CENTER, KEY(DpadCenterIsTrue) },
        { KEY_A, KEY(AIsTrue) }, { KEY_B, KEY(BIsTrue) }, { KEY_C, KEY(CIsTrue) }, { KEY_D, KEY(DIsTrue) },
        { KEY_E, KEY(EIsTrue) }, { KEY_F, KEY(FIsTrue) }, { KEY_G, KEY(GIsTrue) }, { KEY_H, KEY(HIsTrue) },
        { KEY_I, KEY(IIsTrue) }, { KEY_J, KEY(JIsTrue) }, { KEY_K, KEY(KIsTrue) }, { KEY_L, KEY(LIsTrue) },
        { KEY_M, KEY(MIsTrue) }, { KEY_N, KEY(NIsTrue) }, { KEY_O, KEY(OIsTrue) }, { KEY_P, KEY(PIsTrue) },
        { KEY_Q, KEY(QIsTrue) }, { KEY_R, KEY(RIsTrue) }, { KEY_S, KEY(SIsTrue) }, { KEY_T, KEY(TIsTrue) },
        { KEY_U, KEY(UIsTrue) }, { KEY_V, KEY(VIsTrue) }, { KEY_W, KEY(WIsTrue) }, { KEY_X, KEY(XIsTrue) },
        { KEY_Y, KEY(YIsTrue) }, { KEY_Z, KEY(ZIsTrue) }, { KEY_COMMA, KEY(CommaIsTrue) },
        { KEY_PERIOD, KEY(PeriodIsTrue) }, { KEY_ALT_LEFT, KEY(AltLeftIsTrue) },
        { KEY_ALT_RIGHT, KEY(AltRightIsTrue) }, { KEY_SHIFT_LEFT, KEY(ShiftLeftIsTrue) },
        { KEY_SHIFT_RIGHT, KEY(ShiftRightIsTrue) }, { KEY_FORWARD_DEL, KEY(ForwardDelIsTrue) },
        { KEY_SPACE, KEY(SpaceIsTrue) }, { KEY_SYM, KEY(SymIsTrue) }, { KEY_EXPLORER, KEY(ExplorerIsTrue) },
        { KEY_ENVELOPE, KEY(EnvelopeIsTrue) }, { KEY_ENTER, KEY(EnterIsTrue) }, { KEY_DEL, KEY(DelIsTrue) },
        { KEY_PLUS, KEY(PlusIsTrue) }, { KEY_MENU, KEY(MenuIsTrue) }, { KEY_PAGE_UP, KEY(PageUpIsTrue) },
        { KEY_PAGE_DOWN, KEY(PageDownIsTrue) }, { KEY_ESCAPE, KEY(EscapeIsTrue) }, { KEY_TAB, KEY(TabIsTrue) }
    };
    for (size_t i = 0; i < sizeof(map) / sizeof(map[0]); i++)
        if (intValue == map[i].key) {
            *map[i].flag = true;
            break;
        }
    return nullptr;
}

static napi_value InitKeyMonitor2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    int32_t intValue;
    napi_value args[1]; // 存储参数数组
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &intValue);
    struct { int key; bool* flag; } map[] = {
        { KEY_CTRL_LEFT, KEY(CtrlLeftIsTrue) }, { KEY_CTRL_RIGHT, KEY(CtrlRightIsTrue) }, { KEY_F3, KEY(F3IsTrue) },
        { KEY_CAPS_LOCK, KEY(CapsLockIsTrue) }, { KEY_SCROLL_LOCK, KEY(ScrollLockIsTrue) },
        { KEY_META_LEFT, KEY(MetaLeftIsTrue) }, { KEY_META_RIGHT, KEY(MetaRightIsTrue) }, { KEY_F2, KEY(F2IsTrue) },
        { KEY_FUNCTION, KEY(FunctionIsTrue) }, { KEY_SYSRQ, KEY(SysRqIsTrue) }, { KEY_F1, KEY(F1IsTrue) },
        { KEY_BREAK, KEY(BreakIsTrue) }, { KEY_MOVE_HOME, KEY(MoveHomeIsTrue) }, { KEY_F4, KEY(F4IsTrue) },
        { KEY_MOVE_END, KEY(MoveEndIsTrue) }, { KEY_INSERT, KEY(InsertIsTrue) }, { KEY_F5, KEY(F5IsTrue) },
        { KEY_FORWARD, KEY(ForwardIsTrue) }, { KEY_MEDIA_PLAY, KEY(MediaPlayIsTrue) }, { KEY_F6, KEY(F6IsTrue) },
        { KEY_MEDIA_PAUSE, KEY(MediaPauseIsTrue) }, { KEY_MEDIA_CLOSE, KEY(MediaCloseIsTrue) },
        { KEY_MEDIA_EJECT, KEY(MediaEjectIsTrue) }, { KEY_MEDIA_RECORD, KEY(MediaRecordIsTrue) },
        { KEY_F7, KEY(F7IsTrue) }, { KEY_F8, KEY(F8IsTrue) }, { KEY_F9, KEY(F9IsTrue) },
        { KEY_F10, KEY(F10IsTrue) }, { KEY_F11, KEY(F11IsTrue) }, { KEY_F12, KEY(F12IsTrue) },
        { KEY_NUM_LOCK, KEY(NumLockIsTrue) }, { KEY_NUMPAD_0, KEY(Numpad0IsTrue) }, { KEY_CUT, KEY(CutIsTrue) },
        { KEY_NUMPAD_1, KEY(Numpad1IsTrue) }, { KEY_NUMPAD_2, KEY(Numpad2IsTrue) }, { KEY_HELP, KEY(HelpIsTrue) },
        { KEY_NUMPAD_3, KEY(Numpad3IsTrue) }, { KEY_NUMPAD_4, KEY(Numpad4IsTrue) }, { KEY_CALC, KEY(CalcIsTrue) },
        { KEY_NUMPAD_5, KEY(Numpad5IsTrue) }, { KEY_NUMPAD_SUBTRACT, KEY(NumpadSubtractIsTrue) },
        { KEY_NUMPAD_7, KEY(Numpad7IsTrue) }, { KEY_NUMPAD_MULTIPLY, KEY(NumpadMultiplyIsTrue) },
        { KEY_NUMPAD_9, KEY(Numpad9IsTrue) }, { KEY_NUMPAD_DIVIDE, KEY(NumpadDivideIsTrue) },
        { KEY_NUMPAD_6, KEY(Numpad6IsTrue) }, { KEY_NUMPAD_LEFT_PAREN, KEY(NumpadLeftParenIsTrue) },
        { KEY_NUMPAD_ADD, KEY(NumpadAddIsTrue) }, { KEY_NUMPAD_DOT, KEY(NumpadDotIsTrue) },
        { KEY_NUMPAD_COMMA, KEY(NumpadCommaIsTrue) }, { KEY_NUMPAD_ENTER, KEY(NumpadEnterIsTrue) },
        { KEY_NUMPAD_8, KEY(Numpad8IsTrue) }, { KEY_NUMPAD_EQUALS, KEY(NumpadEqualsIsTrue) },
        { KEY_NUMPAD_RIGHT_PAREN, KEY(NumpadRightParenIsTrue) }, { KEY_LINEFEED, KEY(LinefeedIsTrue) },
        { KEY_SLEEP, KEY(SleepIsTrue) }, { KEY_ZENKAKU_HANKAKU, KEY(ZenkakuHankakuIsTrue) },
        { KEY_102ND, KEY(102ndIsTrue) }, { KEY_RO, KEY(RoIsTrue) }, { KEY_FILE, KEY(FileIsTrue) },
        { KEY_KATAKANA, KEY(KatakanaIsTrue) }, { KEY_HIRAGANA, KEY(HiraganaIsTrue) },
        { KEY_HENKAN, KEY(HenkanIsTrue) }, { KEY_KATAKANA_HIRAGANA, KEY(KatakanaHiraganaIsTrue) },
        { KEY_MUHENKAN, KEY(MuhenkanIsTrue) }, { KEY_VIRTUAL_MULTITASK, KEY(VirtualMultitaskIsTrue) },
        { KEY_MACRO, KEY(MacroIsTrue) }, { KEY_NUMPAD_PLUSMINUS, KEY(NumpadPlusminusIsTrue) },
        { KEY_SCALE, KEY(ScaleIsTrue) }, { KEY_HANGUEL, KEY(HanguelIsTrue) }, { KEY_AGAIN, KEY(AgainIsTrue) },
        { KEY_HANJA, KEY(HanjaIsTrue) }, { KEY_YEN, KEY(YenIsTrue) }, { KEY_STOP, KEY(StopIsTrue) },
        { KEY_PROPS, KEY(PropsIsTrue) }, { KEY_UNDO, KEY(UndoIsTrue) }, { KEY_COPY, KEY(CopyIsTrue) },
        { KEY_PASTE, KEY(PasteIsTrue) }, { KEY_FIND, KEY(FindIsTrue) }, { KEY_OPEN, KEY(OpenIsTrue) },
    };
    for (size_t i = 0; i < sizeof(map) / sizeof(map[0]); i++)
        if (intValue == map[i].key) {
            *map[i].flag = true;
            break;
        }
    return nullptr;
}

static napi_value InitKeyMonitor3(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    int32_t intValue;
    napi_value args[1]; // 存储参数数组
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &intValue);
    struct KeyMap { int key; bool* flag; } map[] = {
        { KEY_BOOKMARKS, KEY(BookmarksIsTrue) }, { KEY_NEXT, KEY(NextIsTrue) }, { KEY_EDIT, KEY(EditIsTrue) },
        { KEY_PREVIOUS, KEY(PreviousIsTrue) }, { KEY_STOPCD, KEY(StopcdIsTrue) }, { KEY_CONFIG, KEY(ConfigIsTrue) },
        { KEY_REFRESH, KEY(RefreshIsTrue) }, { KEY_EXIT, KEY(ExitIsTrue) }, { KEY_PLAYPAUSE, KEY(PlaypauseIsTrue) },
        { KEY_SCROLLUP, KEY(ScrollupIsTrue) }, { KEY_SCROLLDOWN, KEY(ScrolldownIsTrue) },
        { KEY_REDO, KEY(RedoIsTrue) }, { KEY_CLOSE, KEY(CloseIsTrue) }, { KEY_PLAY, KEY(PlayIsTrue) },
        { KEY_BASSBOOST, KEY(BassboostIsTrue) }, { KEY_PRINT, KEY(PrintIsTrue) }, { KEY_CHAT, KEY(ChatIsTrue) },
        { KEY_FINANCE, KEY(FinanceIsTrue) }, { KEY_CANCEL, KEY(CancelIsTrue) }, { KEY_YELLOW, KEY(YellowIsTrue) },
        { KEY_KBDILLUM_TOGGLE, KEY(KbdillumToggleIsTrue) }, { KEY_KBDILLUM_DOWN, KEY(KbdillumDownIsTrue) },
        { KEY_KBDILLUM_UP, KEY(KbdillumUpIsTrue) }, { KEY_SEND, KEY(SendIsTrue) }, { KEY_REPLY, KEY(ReplyIsTrue) },
        { KEY_FORWARDMAIL, KEY(ForwardmailIsTrue) }, { KEY_SAVE, KEY(SaveIsTrue) }, { KEY_PVR, KEY(PvrIsTrue) },
        { KEY_VIDEO_NEXT, KEY(VideoNextIsTrue) }, { KEY_VIDEO_PREV, KEY(VideoPrevIsTrue) },
        { KEY_BRIGHTNESS_CYCLE, KEY(BrightnessCycleIsTrue) }, { KEY_BRIGHTNESS_ZERO, KEY(BrightnessZeroIsTrue) },
        { KEY_DISPLAY_OFF, KEY(DisplayOffIsTrue) }, { KEY_BTN_MISC, KEY(BtnMiscIsTrue) },
        { KEY_NEWS, KEY(NewsIsTrue) }, { KEY_CHANNELDOWN, KEY(ChanneldownIsTrue) }, { KEY_MEMO, KEY(MemoIsTrue) },
        { KEY_INFO, KEY(InfoIsTrue) }, { KEY_PROGRAM, KEY(ProgramIsTrue) }, { KEY_SUBTITLE, KEY(SubtitleIsTrue) },
        { KEY_FULL_SCREEN, KEY(FullScreenIsTrue) }, { KEY_KEYBOARD, KEY(KeyboardIsTrue) },
        { KEY_ASPECT_RATIO, KEY(AspectRatioIsTrue) }, { KEY_PC, KEY(PcIsTrue) }, { KEY_TV, KEY(TvIsTrue) },
        { KEY_TV2, KEY(Tv2IsTrue) }, { KEY_VCR, KEY(VcrIsTrue) }, { KEY_VCR2, KEY(Vcr2IsTrue) },
        { KEY_SAT, KEY(SatIsTrue) }, { KEY_DOCUMENTS, KEY(DocumentsIsTrue) }, { KEY_GOTO, KEY(GotoIsTrue) },
        { KEY_CD, KEY(CdIsTrue) }, { KEY_TAPE, KEY(TapeIsTrue) }, { KEY_TUNER, KEY(TunerIsTrue) },
        { KEY_PLAYER, KEY(PlayerIsTrue) }, { KEY_SHUFFLE, KEY(ShuffleIsTrue) }, { KEY_EDITOR, KEY(EditorIsTrue) },
        { KEY_DVD, KEY(DvdIsTrue) }, { KEY_AUDIO, KEY(AudioIsTrue) }, { KEY_VIDEO, KEY(VideoIsTrue) },
        { KEY_CALENDAR, KEY(CalendarIsTrue) }, { KEY_RED, KEY(RedIsTrue) }, { KEY_GREEN, KEY(GreenIsTrue) },
        { KEY_BLUE, KEY(BlueIsTrue) }, { KEY_CHANNELUP, KEY(ChannelupIsTrue) }, { KEY_ZOOMIN, KEY(ZoominIsTrue) },
        { KEY_LAST, KEY(LastIsTrue) }, { KEY_RESTART, KEY(RestartIsTrue) }, { KEY_SLOW, KEY(SlowIsTrue) },
        { KEY_VIDEOPHONE, KEY(VideophoneIsTrue) }, { KEY_GAMES, KEY(GamesIsTrue) },
        { KEY_ZOOMOUT, KEY(ZoomoutIsTrue) }, { KEY_ZOOMRESET, KEY(ZoomresetIsTrue) }, { KEY_NEW, KEY(NewIsTrue) },
        { KEY_SPREADSHEET, KEY(SpreadsheetIsTrue) }, { KEY_GRAPHICSEDITOR, KEY(GraphicseditorIsTrue) },
        { KEY_PRESENTATION, KEY(PresentationIsTrue) }, { KEY_DATABASE, KEY(DatabaseIsTrue) },
        { KEY_VOICEMAIL, KEY(VoicemailIsTrue) }, { KEY_WORDPROCESSOR, KEY(WordprocessorIsTrue) },
    };
    for (size_t i = 0; i < sizeof(map) / sizeof(map[0]); i++) {
        if (intValue == map[i].key) {
            *map[i].flag = true;
            break;
        }
    }
    return nullptr;
}

static napi_value InitKeyMonitor4(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    int32_t intValue;
    napi_value args[1]; // 存储参数数组
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &intValue);
    struct KeyMap { int key; bool* flag; } map[] = {
        { KEY_ADDRESSBOOK, KEY(AddressbookIsTrue) }, { KEY_MESSENGER, KEY(MessengerIsTrue) },
        { KEY_BRIGHTNESS_TOGGLE, KEY(BrightnessToggleIsTrue) }, { KEY_SPELLCHECK, KEY(SpellcheckIsTrue) },
        { KEY_COFFEE, KEY(CoffeeIsTrue) }, { KEY_MEDIA_REPEAT, KEY(MediaRepeatIsTrue) }, { KEY_F13, KEY(F13IsTrue) },
        { KEY_IMAGES, KEY(ImagesIsTrue) }, { KEY_BUTTONCONFIG, KEY(ButtonconfigIsTrue) }, { KEY_HP, KEY(HpIsTrue) },
        { KEY_TASKMANAGER, KEY(TaskmanagerIsTrue) }, { KEY_JOURNAL, KEY(JournalIsTrue) },
        { KEY_CONTROLPANEL, KEY(ControlpanelIsTrue) }, { KEY_APPSELECT, KEY(AppselectIsTrue) },
        { KEY_SCREENSAVER, KEY(ScreensaverIsTrue) }, { KEY_ASSISTANT, KEY(AssistantIsTrue) },
        { KEY_KBD_LAYOUT_NEXT, KEY(KbdLayoutNextIsTrue) }, { KEY_BRIGHTNESS_MIN, KEY(BrightnessMinIsTrue) },
        { KEY_BRIGHTNESS_MAX, KEY(BrightnessMaxIsTrue) }, { KEY_KBDINPUTASSIST_PREV, KEY(KbdinputassistPrevIsTrue) },
        { KEY_KBDINPUTASSIST_NEXT, KEY(KbdinputassistNextIsTrue) }, { KEY_SUSPEND, KEY(SuspendIsTrue) },
        { KEY_KBDINPUTASSIST_PREVGROUP, KEY(KbdinputassistPrevgroupIsTrue) }, { KEY_BTN_9, KEY(Btn9IsTrue) },
        { KEY_KBDINPUTASSIST_NEXTGROUP, KEY(KbdinputassistNextgroupIsTrue) }, { KEY_CONNECT, KEY(ConnectIsTrue) },
        { KEY_KBDINPUTASSIST_ACCEPT, KEY(KbdinputassistAcceptIsTrue) }, { KEY_FRONT, KEY(FrontIsTrue) },
        { KEY_SETUP, KEY(SetupIsTrue) }, { KEY_WAKEUP, KEY(WakeupIsTrue) }, { KEY_SENDFILE, KEY(SendfileIsTrue) },
        { KEY_DELETEFILE, KEY(DeletefileIsTrue) }, { KEY_XFER, KEY(XferIsTrue) }, { KEY_PROG1, KEY(Prog1IsTrue) },
        { KEY_PROG2, KEY(Prog2IsTrue) }, { KEY_MSDOS, KEY(MsdosIsTrue) }, { KEY_SCREENLOCK, KEY(ScreenlockIsTrue) },
        { KEY_DIRECTION_ROTATE_DISPLAY, KEY(DirectionRotateDisplayIsTrue) }, { KEY_F19, KEY(F19IsTrue) },
        { KEY_COMPUTER, KEY(ComputerIsTrue) }, { KEY_KBDINPUTASSIST_CANCEL, KEY(KbdinputassistCancelIsTrue) },
        { KEY_ISO, KEY(IsoIsTrue) }, { KEY_MOVE, KEY(MoveIsTrue) }, { KEY_F16, KEY(F16IsTrue) },
        { KEY_F14, KEY(F14IsTrue) }, { KEY_F15, KEY(F15IsTrue) }, { KEY_EJECTCLOSECD, KEY(EjectclosecdIsTrue) },
        { KEY_F17, KEY(F17IsTrue) }, { KEY_F18, KEY(F18IsTrue) }, { KEY_CYCLEWINDOWS, KEY(CyclewindowsIsTrue) },
        { KEY_F20, KEY(F20IsTrue) }, { KEY_F21, KEY(F21IsTrue) }, { KEY_CHANNEL, KEY(ChannelIsTrue) },
        { KEY_F23, KEY(F23IsTrue) }, { KEY_F24, KEY(F24IsTrue) }, { KEY_PROG3, KEY(Prog3IsTrue) },
        { KEY_PROG4, KEY(Prog4IsTrue) }, { KEY_DASHBOARD, KEY(DashboardIsTrue) },
        { KEY_SOUND, KEY(SoundIsTrue) }, { KEY_QUESTION, KEY(QuestionIsTrue) },
        { KEY_SPORT, KEY(SportIsTrue) }, { KEY_SHOP, KEY(ShopIsTrue) }, { KEY_ALTERASE, KEY(AlteraseIsTrue) },
        { KEY_SWITCHVIDEOMODE, KEY(SwitchvideomodeIsTrue) }, { KEY_BATTERY, KEY(BatteryIsTrue) },
        { KEY_BLUETOOTH, KEY(BluetoothIsTrue) }, { KEY_WLAN, KEY(WlanIsTrue) }, { KEY_UWB, KEY(UwbIsTrue) },
        { KEY_WWAN_WIMAX, KEY(WwanWimaxIsTrue) }, { KEY_RFKILL, KEY(RfkillIsTrue) }, { KEY_F22, KEY(F22IsTrue) },
        { KEY_BTN_0, KEY(Btn0IsTrue) }, { KEY_BTN_1, KEY(Btn1IsTrue) }, { KEY_BTN_2, KEY(Btn2IsTrue) },
        { KEY_BTN_3, KEY(Btn3IsTrue) }, { KEY_BTN_4, KEY(Btn4IsTrue) }, { KEY_BTN_5, KEY(Btn5IsTrue) },
        { KEY_BTN_6, KEY(Btn6IsTrue) }, { KEY_BTN_7, KEY(Btn7IsTrue) }, { KEY_BTN_8, KEY(Btn8IsTrue) }
    };
    for (size_t i = 0; i < sizeof(map) / sizeof(map[0]); i++) {
        if (intValue == map[i].key) {
            *(map[i].flag) = 1;
            break;
        }
    }
    return nullptr;
}

EXTERN_C_START
static void InitPush0(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        XL("GetKeyCodeEventApostrophe", GetKeyCodeEventApostrophe),
        XL("GetKeyCodeEventGrave", GetKeyCodeEventGrave),
        XL("GetKeyCodeEventMinus", GetKeyCodeEventMinus),
        XL("GetKeyCodeEventEquals", GetKeyCodeEventEquals),
        XL("GetKeyCodeEventLeftBracket", GetKeyCodeEventLeftBracket),
        XL("GetKeyCodeEventRightBracket", GetKeyCodeEventRightBracket),
        XL("GetKeyCodeEventBackslash", GetKeyCodeEventBackslash),
        XL("GetKeyCodeEventSemicolon", GetKeyCodeEventSemicolon),
        XL("GetKeyCodeEventSlash", GetKeyCodeEventSlash),
        XL("GetKeyCodeEventAt", GetKeyCodeEventAt),
        XL("GetKeyCodeEventNumpad0", GetKeyCodeEventNumpad0), XL("GetKeyCodeEventNumpad1", GetKeyCodeEventNumpad1),
        XL("GetKeyCodeEventNumpad2", GetKeyCodeEventNumpad2), XL("GetKeyCodeEventNumpad3", GetKeyCodeEventNumpad3),
        XL("GetKeyCodeEventNumpad4", GetKeyCodeEventNumpad4), XL("GetKeyCodeEventNumpad5", GetKeyCodeEventNumpad5),
        XL("GetKeyCodeEventNumpad6", GetKeyCodeEventNumpad6), XL("GetKeyCodeEventNumpad7", GetKeyCodeEventNumpad7),
        XL("GetKeyCodeEventNumpad8", GetKeyCodeEventNumpad8), XL("GetKeyCodeEventNumpad9", GetKeyCodeEventNumpad9),
        XL("GetKeyCodeEventBtn0", GetKeyCodeEventBtn0), XL("GetKeyCodeEventBtn1", GetKeyCodeEventBtn1),
        XL("GetKeyCodeEventBtn2", GetKeyCodeEventBtn2), XL("GetKeyCodeEventBtn3", GetKeyCodeEventBtn3),
        XL("GetKeyCodeEventBtn4", GetKeyCodeEventBtn4), XL("GetKeyCodeEventBtn5", GetKeyCodeEventBtn5),
        XL("GetKeyCodeEventBtn6", GetKeyCodeEventBtn6), XL("GetKeyCodeEventBtn7", GetKeyCodeEventBtn7),
        XL("GetKeyCodeEventBtn8", GetKeyCodeEventBtn8), XL("GetKeyCodeEventBtn9", GetKeyCodeEventBtn9),
        XL("InitKeyMonitor", InitKeyMonitor),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}
static void InitPush1(napi_property_descriptor* desc)
{
    const uint32_t offset = 31;
    napi_property_descriptor descTemp[] = {
        XL("GetKeyCodeEventUnknown", GetKeyCodeEventUnknown), XL("GetKeyCodeEventFn", GetKeyCodeEventFn),
        XL("GetKeyCodeEventHome", GetKeyCodeEventHome), XL("GetKeyCodeEventDpadDown", GetKeyCodeEventDpadDown),
        XL("GetKeyCodeEventMediaPlayPause", GetKeyCodeEventMediaPlayPause), XL("InitKeyMonitor1", InitKeyMonitor1),
        XL("GetKeyCodeEventBack", GetKeyCodeEventBack), XL("GetKeyCodeEventMediaStop", GetKeyCodeEventMediaStop),
        XL("GetKeyCodeEventMediaFastForward", GetKeyCodeEventMediaFastForward),
        XL("GetKeyCodeEventVolumeUp", GetKeyCodeEventVolumeUp), XL("GetKeyCodeEventPeriod", GetKeyCodeEventPeriod),
        XL("GetKeyCodeEventPower", GetKeyCodeEventPower), XL("GetKeyCodeEventCamera", GetKeyCodeEventCamera),
        XL("GetKeyCodeEventVolumeMute", GetKeyCodeEventVolumeMute), XL("GetKeyCodeEventMute", GetKeyCodeEventMute),
        XL("GetKeyCodeEvent0", GetKeyCodeEvent0), XL("GetKeyCodeEventMediaNext", GetKeyCodeEventMediaNext),
        XL("GetKeyCodeEvent1", GetKeyCodeEvent1), XL("GetKeyCodeEventMediaPrevious", GetKeyCodeEventMediaPrevious),
        XL("GetKeyCodeEvent2", GetKeyCodeEvent2), XL("GetKeyCodeEventMediaRewind", GetKeyCodeEventMediaRewind),
        XL("GetKeyCodeEvent3", GetKeyCodeEvent3), XL("GetKeyCodeEventShiftLeft", GetKeyCodeEventShiftLeft),
        XL("GetKeyCodeEvent4", GetKeyCodeEvent4), XL("GetKeyCodeEventBrightnessDown", GetKeyCodeEventBrightnessDown),
        XL("GetKeyCodeEvent5", GetKeyCodeEvent5), XL("GetKeyCodeEventBrightnessUp", GetKeyCodeEventBrightnessUp),
        XL("GetKeyCodeEvent6", GetKeyCodeEvent6), XL("GetKeyCodeEventVolumeDown", GetKeyCodeEventVolumeDown),
        XL("GetKeyCodeEvent7", GetKeyCodeEvent7), XL("GetKeyCodeEventShiftRight", GetKeyCodeEventShiftRight),
        XL("GetKeyCodeEvent8", GetKeyCodeEvent8), XL("GetKeyCodeEventDpadCenter", GetKeyCodeEventDpadCenter),
        XL("GetKeyCodeEvent9", GetKeyCodeEvent9), XL("GetKeyCodeEventDpadRight", GetKeyCodeEventDpadRight),
        XL("GetKeyCodeEventStar", GetKeyCodeEventStar), XL("GetKeyCodeEventPound", GetKeyCodeEventPound),
        XL("GetKeyCodeEventDpadUp", GetKeyCodeEventDpadUp), XL("GetKeyCodeEventDpadLeft", GetKeyCodeEventDpadLeft),
        XL("GetKeyCodeEventA", GetKeyCodeEventA), XL("GetKeyCodeEventB", GetKeyCodeEventB),
        XL("GetKeyCodeEventC", GetKeyCodeEventC), XL("GetKeyCodeEventD", GetKeyCodeEventD),
        XL("GetKeyCodeEventE", GetKeyCodeEventE), XL("GetKeyCodeEventF", GetKeyCodeEventF),
        XL("GetKeyCodeEventG", GetKeyCodeEventG), XL("GetKeyCodeEventH", GetKeyCodeEventH),
        XL("GetKeyCodeEventI", GetKeyCodeEventI), XL("GetKeyCodeEventJ", GetKeyCodeEventJ),
        XL("GetKeyCodeEventK", GetKeyCodeEventK), XL("GetKeyCodeEventL", GetKeyCodeEventL),
        XL("GetKeyCodeEventM", GetKeyCodeEventM), XL("GetKeyCodeEventN", GetKeyCodeEventN),
        XL("GetKeyCodeEventO", GetKeyCodeEventO), XL("GetKeyCodeEventP", GetKeyCodeEventP),
        XL("GetKeyCodeEventQ", GetKeyCodeEventQ), XL("GetKeyCodeEventR", GetKeyCodeEventR),
        XL("GetKeyCodeEventS", GetKeyCodeEventS), XL("GetKeyCodeEventT", GetKeyCodeEventT),
        XL("GetKeyCodeEventU", GetKeyCodeEventU), XL("GetKeyCodeEventV", GetKeyCodeEventV),
        XL("GetKeyCodeEventW", GetKeyCodeEventW), XL("GetKeyCodeEventAltLeft", GetKeyCodeEventAltLeft),
        XL("GetKeyCodeEventY", GetKeyCodeEventY), XL("GetKeyCodeEventForwardDel", GetKeyCodeEventForwardDel),
        XL("GetKeyCodeEventZ", GetKeyCodeEventZ), XL("GetKeyCodeEventComma", GetKeyCodeEventComma),
        XL("GetKeyCodeEventX", GetKeyCodeEventX), XL("GetKeyCodeEventAltRight", GetKeyCodeEventAltRight),
        XL("GetKeyCodeEventTab", GetKeyCodeEventTab), XL("GetKeyCodeEventSpace", GetKeyCodeEventSpace),
        XL("GetKeyCodeEventSym", GetKeyCodeEventSym), XL("GetKeyCodeEventExplorer", GetKeyCodeEventExplorer),
        XL("GetKeyCodeEventEnvelope", GetKeyCodeEventEnvelope), XL("GetKeyCodeEventEnter", GetKeyCodeEventEnter),
        XL("GetKeyCodeEventDel", GetKeyCodeEventDel), XL("GetKeyCodeEventPlus", GetKeyCodeEventPlus),
        XL("GetKeyCodeEventMenu", GetKeyCodeEventMenu), XL("GetKeyCodeEventPageUp", GetKeyCodeEventPageUp),
        XL("GetKeyCodeEventPageDown", GetKeyCodeEventPageDown), XL("GetKeyCodeEventEscape", GetKeyCodeEventEscape),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}
static void InitPush2(napi_property_descriptor* desc)
{
    const uint32_t offset = 112;
    napi_property_descriptor descTemp[] = {
        XL("GetKeyCodeEventCtrlLeft", GetKeyCodeEventCtrlLeft), XL("GetKeyCodeEventCapsLock", GetKeyCodeEventCapsLock),
        XL("GetKeyCodeEventScrollLock", GetKeyCodeEventScrollLock), XL("GetKeyCodeEventF12", GetKeyCodeEventF12),
        XL("GetKeyCodeEventMetaLeft", GetKeyCodeEventMetaLeft), XL("GetKeyCodeEventNumLock", GetKeyCodeEventNumLock),
        XL("GetKeyCodeEventFunction", GetKeyCodeEventFunction), XL("GetKeyCodeEventSysRq", GetKeyCodeEventSysRq),
        XL("GetKeyCodeEventBreak", GetKeyCodeEventBreak), XL("GetKeyCodeEventCtrlRight", GetKeyCodeEventCtrlRight),
        XL("GetKeyCodeEventMoveEnd", GetKeyCodeEventMoveEnd), XL("GetKeyCodeEventInsert", GetKeyCodeEventInsert),
        XL("GetKeyCodeEventForward", GetKeyCodeEventForward), XL("GetKeyCodeEventNumpadAdd", GetKeyCodeEventNumpadAdd),
        XL("GetKeyCodeEventMediaPlay", GetKeyCodeEventMediaPlay), XL("GetKeyCodeEventYen", GetKeyCodeEventYen),
        XL("GetKeyCodeEventMediaPause", GetKeyCodeEventMediaPause), XL("GetKeyCodeEventF5", GetKeyCodeEventF5),
        XL("GetKeyCodeEventMediaClose", GetKeyCodeEventMediaClose), XL("GetKeyCodeEventF4", GetKeyCodeEventF4),
        XL("GetKeyCodeEventMediaEject", GetKeyCodeEventMediaEject), XL("GetKeyCodeEventF3", GetKeyCodeEventF3),
        XL("GetKeyCodeEventHanja", GetKeyCodeEventHanja), XL("GetKeyCodeEventNumpadDot", GetKeyCodeEventNumpadDot),
        XL("GetKeyCodeEventF7", GetKeyCodeEventF7), XL("GetKeyCodeEventNumpadDivide", GetKeyCodeEventNumpadDivide),
        XL("GetKeyCodeEventF8", GetKeyCodeEventF8),
        XL("GetKeyCodeEventF9", GetKeyCodeEventF9), XL("GetKeyCodeEventZenkakuHankaku", GetKeyCodeEventZenkakuHankaku),
        XL("GetKeyCodeEventF10", GetKeyCodeEventF10), XL("GetKeyCodeEventNumpadComma", GetKeyCodeEventNumpadComma),
        XL("GetKeyCodeEventF11", GetKeyCodeEventF11), XL("GetKeyCodeEventNumpadEnter", GetKeyCodeEventNumpadEnter),
        XL("GetKeyCodeEventF1", GetKeyCodeEventF1), XL("GetKeyCodeEventNumpadMultiply", GetKeyCodeEventNumpadMultiply),
        XL("GetKeyCodeEventF6", GetKeyCodeEventF6), XL("GetKeyCodeEventNumpadSubtract", GetKeyCodeEventNumpadSubtract),
        XL("GetKeyCodeEventF2", GetKeyCodeEventF2), XL("GetKeyCodeEventMediaRecord", GetKeyCodeEventMediaRecord),
        XL("GetKeyCodeEventNumpadLeftParen", GetKeyCodeEventNumpadLeftParen), XL("InitKeyMonitor2", InitKeyMonitor2),
        XL("GetKeyCodeEventNumpadRightParen", GetKeyCodeEventNumpadRightParen),
        XL("GetKeyCodeEventVirtualMultitask", GetKeyCodeEventVirtualMultitask),
        XL("GetKeyCodeEventSleep", GetKeyCodeEventSleep), XL("GetKeyCodeEventKatakana", GetKeyCodeEventKatakana),
        XL("GetKeyCodeEventMuhenkan", GetKeyCodeEventMuhenkan), XL("GetKeyCodeEventHanguel", GetKeyCodeEventHanguel),
        XL("GetKeyCodeEvent102nd", GetKeyCodeEvent102nd), XL("GetKeyCodeEventHiragana", GetKeyCodeEventHiragana),
        XL("GetKeyCodeEventRo", GetKeyCodeEventRo), XL("GetKeyCodeEventNumpadEquals", GetKeyCodeEventNumpadEquals),
        XL("GetKeyCodeEventHenkan", GetKeyCodeEventHenkan), XL("GetKeyCodeEventLinefeed", GetKeyCodeEventLinefeed),
        XL("GetKeyCodeEventKatakanaHiragana", GetKeyCodeEventKatakanaHiragana),
        XL("GetKeyCodeEventMacro", GetKeyCodeEventMacro), XL("GetKeyCodeEventMetaRight", GetKeyCodeEventMetaRight),
        XL("GetKeyCodeEventNumpadPlusminus", GetKeyCodeEventNumpadPlusminus),
        XL("GetKeyCodeEventStop", GetKeyCodeEventStop), XL("GetKeyCodeEventCut", GetKeyCodeEventCut),
        XL("GetKeyCodeEventAgain", GetKeyCodeEventAgain), XL("GetKeyCodeEventProps", GetKeyCodeEventProps),
        XL("GetKeyCodeEventUndo", GetKeyCodeEventUndo), XL("GetKeyCodeEventCopy", GetKeyCodeEventCopy),
        XL("GetKeyCodeEventOpen", GetKeyCodeEventOpen), XL("GetKeyCodeEventPaste", GetKeyCodeEventPaste),
        XL("GetKeyCodeEventFind", GetKeyCodeEventFind), XL("GetKeyCodeEventScale", GetKeyCodeEventScale),
        XL("GetKeyCodeEventHelp", GetKeyCodeEventHelp), XL("GetKeyCodeEventCalc", GetKeyCodeEventCalc),
        XL("GetKeyCodeEventFile", GetKeyCodeEventFile), XL("GetKeyCodeEventMoveHome", GetKeyCodeEventMoveHome)
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}
static void InitPush3(napi_property_descriptor* desc)
{
    const uint32_t offset = 183;
    napi_property_descriptor descTemp[] = {
        XL("GetKeyCodeEventBookmarks", GetKeyCodeEventBookmarks), XL("GetKeyCodeEventNext", GetKeyCodeEventNext),
        XL("GetKeyCodeEventPlaypause", GetKeyCodeEventPlaypause), XL("GetKeyCodeEventTv", GetKeyCodeEventTv),
        XL("GetKeyCodeEventPrevious", GetKeyCodeEventPrevious), XL("GetKeyCodeEventStopcd", GetKeyCodeEventStopcd),
        XL("GetKeyCodeEventConfig", GetKeyCodeEventConfig), XL("GetKeyCodeEventRefresh", GetKeyCodeEventRefresh),
        XL("GetKeyCodeEventExit", GetKeyCodeEventExit), XL("GetKeyCodeEventScrollup", GetKeyCodeEventScrollup),
        XL("GetKeyCodeEventEdit", GetKeyCodeEventEdit), XL("GetKeyCodeEventScrolldown", GetKeyCodeEventScrolldown),
        XL("GetKeyCodeEventNew", GetKeyCodeEventNew), XL("GetKeyCodeEventAudio", GetKeyCodeEventAudio),
        XL("GetKeyCodeEventClose", GetKeyCodeEventClose), XL("GetKeyCodeEventBassboost", GetKeyCodeEventBassboost),
        XL("GetKeyCodeEventPlay", GetKeyCodeEventPlay), XL("GetKeyCodeEventShuffle", GetKeyCodeEventShuffle),
        XL("GetKeyCodeEventPrint", GetKeyCodeEventPrint), XL("GetKeyCodeEventSpreadsheet", GetKeyCodeEventSpreadsheet),
        XL("GetKeyCodeEventFinance", GetKeyCodeEventFinance), XL("GetKeyCodeEventCancel", GetKeyCodeEventCancel),
        XL("GetKeyCodeEventKbdillumToggle", GetKeyCodeEventKbdillumToggle), XL("GetKeyCodeEventCd", GetKeyCodeEventCd),
        XL("GetKeyCodeEventKbdillumUp", GetKeyCodeEventKbdillumUp), XL("GetKeyCodeEventChat", GetKeyCodeEventChat),
        XL("GetKeyCodeEventSend", GetKeyCodeEventSend), XL("GetKeyCodeEventBtnMisc", GetKeyCodeEventBtnMisc),
        XL("GetKeyCodeEventReply", GetKeyCodeEventReply), XL("GetKeyCodeEventForwardmail", GetKeyCodeEventForwardmail),
        XL("GetKeyCodeEventSave", GetKeyCodeEventSave), XL("GetKeyCodeEventDocuments", GetKeyCodeEventDocuments),
        XL("GetKeyCodeEventVideoNext", GetKeyCodeEventVideoNext), XL("GetKeyCodeEventRedo", GetKeyCodeEventRedo),
        XL("GetKeyCodeEventBrightnessCycle", GetKeyCodeEventBrightnessCycle),
        XL("GetKeyCodeEventDisplayOff", GetKeyCodeEventDisplayOff), XL("GetKeyCodeEventVcr", GetKeyCodeEventVcr),
        XL("GetKeyCodeEventGoto", GetKeyCodeEventGoto), XL("GetKeyCodeEventFullScreen", GetKeyCodeEventFullScreen),
        XL("GetKeyCodeEventInfo", GetKeyCodeEventInfo), XL("GetKeyCodeEventPresentation", GetKeyCodeEventPresentation),
        XL("GetKeyCodeEventProgram", GetKeyCodeEventProgram), XL("GetKeyCodeEventVideoPrev", GetKeyCodeEventVideoPrev),
        XL("GetKeyCodeEventPvr", GetKeyCodeEventPvr), XL("GetKeyCodeEventAspectRatio", GetKeyCodeEventAspectRatio),
        XL("GetKeyCodeEventSubtitle", GetKeyCodeEventSubtitle), XL("GetKeyCodeEventKeyboard", GetKeyCodeEventKeyboard),
        XL("GetKeyCodeEventPc", GetKeyCodeEventPc), XL("GetKeyCodeEventBrightnessZero", GetKeyCodeEventBrightnessZero),
        XL("GetKeyCodeEventTv2", GetKeyCodeEventTv2), XL("GetKeyCodeEventKbdillumDown", GetKeyCodeEventKbdillumDown),
        XL("GetKeyCodeEventVcr2", GetKeyCodeEventVcr2), XL("GetKeyCodeEventSat", GetKeyCodeEventSat),
        XL("GetKeyCodeEventTuner", GetKeyCodeEventTuner), XL("GetKeyCodeEventPlayer", GetKeyCodeEventPlayer),
        XL("GetKeyCodeEventDvd", GetKeyCodeEventDvd), XL("GetKeyCodeEventWordprocessor", GetKeyCodeEventWordprocessor),
        XL("GetKeyCodeEventVideo", GetKeyCodeEventVideo), XL("GetKeyCodeEventMemo", GetKeyCodeEventMemo),
        XL("GetKeyCodeEventRestart", GetKeyCodeEventRestart), XL("GetKeyCodeEventRed", GetKeyCodeEventRed),
        XL("GetKeyCodeEventGreen", GetKeyCodeEventGreen), XL("GetKeyCodeEventYellow", GetKeyCodeEventYellow),
        XL("GetKeyCodeEventBlue", GetKeyCodeEventBlue), XL("GetKeyCodeEventChannelup", GetKeyCodeEventChannelup),
        XL("GetKeyCodeEventChanneldown", GetKeyCodeEventChanneldown), XL("GetKeyCodeEventTape", GetKeyCodeEventTape),
        XL("GetKeyCodeEventLast", GetKeyCodeEventLast), XL("GetKeyCodeEventCalendar", GetKeyCodeEventCalendar),
        XL("GetKeyCodeEventSlow", GetKeyCodeEventSlow), XL("GetKeyCodeEventVoicemail", GetKeyCodeEventVoicemail),
        XL("GetKeyCodeEventVideophone", GetKeyCodeEventVideophone), XL("GetKeyCodeEventGames", GetKeyCodeEventGames),
        XL("GetKeyCodeEventZoomin", GetKeyCodeEventZoomin), XL("GetKeyCodeEventZoomout", GetKeyCodeEventZoomout),
        XL("GetKeyCodeEventZoomreset", GetKeyCodeEventZoomreset), XL("GetKeyCodeEventEditor", GetKeyCodeEventEditor),
        XL("GetKeyCodeEventGraphicseditor", GetKeyCodeEventGraphicseditor), XL("InitKeyMonitor3", InitKeyMonitor3),
        XL("GetKeyCodeEventDatabase", GetKeyCodeEventDatabase), XL("GetKeyCodeEventNews", GetKeyCodeEventNews),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}
static void InitPush4(napi_property_descriptor* desc)
{
    const uint32_t offset = 264;
    napi_property_descriptor descTemp[] = {
        XL("GetKeyCodeEventAddressbook", GetKeyCodeEventAddressbook), XL("GetKeyCodeEventIso", GetKeyCodeEventIso),
        XL("GetKeyCodeEventMessenger", GetKeyCodeEventMessenger), XL("GetKeyCodeEventImages", GetKeyCodeEventImages),
        XL("GetKeyCodeEventBrightnessToggle", GetKeyCodeEventBrightnessToggle),
        XL("GetKeyCodeEventSpellcheck", GetKeyCodeEventSpellcheck), XL("GetKeyCodeEventCoffee", GetKeyCodeEventCoffee),
        XL("GetKeyCodeEventMediaRepeat", GetKeyCodeEventMediaRepeat), XL("GetKeyCodeEventMove", GetKeyCodeEventMove),
        XL("GetKeyCodeEventButtonconfig", GetKeyCodeEventButtonconfig),
        XL("GetKeyCodeEventTaskmanager", GetKeyCodeEventTaskmanager), XL("GetKeyCodeEventSetup", GetKeyCodeEventSetup),
        XL("GetKeyCodeEventJournal", GetKeyCodeEventJournal), XL("GetKeyCodeEventProg2", GetKeyCodeEventProg2),
        XL("GetKeyCodeEventControlpanel", GetKeyCodeEventControlpanel), XL("GetKeyCodeEventShop", GetKeyCodeEventShop),
        XL("GetKeyCodeEventAppselect", GetKeyCodeEventAppselect), XL("GetKeyCodeEventProg1", GetKeyCodeEventProg1),
        XL("GetKeyCodeEventScreensaver", GetKeyCodeEventScreensaver), XL("GetKeyCodeEventProg3", GetKeyCodeEventProg3),
        XL("GetKeyCodeEventAssistant", GetKeyCodeEventAssistant), XL("GetKeyCodeEventSuspend", GetKeyCodeEventSuspend),
        XL("GetKeyCodeEventKbdLayoutNext", GetKeyCodeEventKbdLayoutNext), XL("GetKeyCodeEventF15", GetKeyCodeEventF15),
        XL("GetKeyCodeEventBrightnessMin", GetKeyCodeEventBrightnessMin), XL("GetKeyCodeEventF16", GetKeyCodeEventF16),
        XL("GetKeyCodeEventBrightnessMax", GetKeyCodeEventBrightnessMax), XL("GetKeyCodeEventF17", GetKeyCodeEventF17),
        XL("GetKeyCodeEventKbdinputassistPrev", GetKeyCodeEventKbdinputassistPrev),
        XL("GetKeyCodeEventKbdinputassistNext", GetKeyCodeEventKbdinputassistNext),
        XL("GetKeyCodeEventKbdinputassistPrevgroup", GetKeyCodeEventKbdinputassistPrevgroup),
        XL("GetKeyCodeEventKbdinputassistNextgroup", GetKeyCodeEventKbdinputassistNextgroup),
        XL("GetKeyCodeEventKbdinputassistAccept", GetKeyCodeEventKbdinputassistAccept),
        XL("GetKeyCodeEventKbdinputassistCancel", GetKeyCodeEventKbdinputassistCancel),
        XL("GetKeyCodeEventFront", GetKeyCodeEventFront), XL("GetKeyCodeEventScreenlock", GetKeyCodeEventScreenlock),
        XL("GetKeyCodeEventWakeup", GetKeyCodeEventWakeup), XL("GetKeyCodeEventDashboard", GetKeyCodeEventDashboard),
        XL("GetKeyCodeEventSendfile", GetKeyCodeEventSendfile), XL("GetKeyCodeEventComputer", GetKeyCodeEventComputer),
        XL("GetKeyCodeEventDeletefile", GetKeyCodeEventDeletefile), XL("GetKeyCodeEventXfer", GetKeyCodeEventXfer),
        XL("GetKeyCodeEventDirectionRotateDisplay", GetKeyCodeEventDirectionRotateDisplay),
        XL("GetKeyCodeEventCyclewindows", GetKeyCodeEventCyclewindows), XL("GetKeyCodeEventF14", GetKeyCodeEventF14),
        XL("GetKeyCodeEventEjectclosecd", GetKeyCodeEventEjectclosecd), XL("GetKeyCodeEventF13", GetKeyCodeEventF13),
        XL("GetKeyCodeEventF18", GetKeyCodeEventF18), XL("GetKeyCodeEventF19", GetKeyCodeEventF19),
        XL("GetKeyCodeEventF20", GetKeyCodeEventF20), XL("GetKeyCodeEventF21", GetKeyCodeEventF21),
        XL("GetKeyCodeEventF22", GetKeyCodeEventF22), XL("GetKeyCodeEventF23", GetKeyCodeEventF23),
        XL("GetKeyCodeEventF24", GetKeyCodeEventF24), XL("GetKeyCodeEventHp", GetKeyCodeEventHp),
        XL("GetKeyCodeEventSound", GetKeyCodeEventSound), XL("GetKeyCodeEventConnect", GetKeyCodeEventConnect),
        XL("GetKeyCodeEventQuestion", GetKeyCodeEventQuestion), XL("GetKeyCodeEventProg4", GetKeyCodeEventProg4),
        XL("GetKeyCodeEventSport", GetKeyCodeEventSport), XL("GetKeyCodeEventMsdos", GetKeyCodeEventMsdos),
        XL("GetKeyCodeEventAlterase", GetKeyCodeEventAlterase), XL("GetKeyCodeEventBattery", GetKeyCodeEventBattery),
        XL("GetKeyCodeEventSwitchvideomode", GetKeyCodeEventSwitchvideomode), XL("InitKeyMonitor4", InitKeyMonitor4),
        XL("GetKeyCodeEventBluetooth", GetKeyCodeEventBluetooth), XL("GetKeyCodeEventWlan", GetKeyCodeEventWlan),
        XL("GetKeyCodeEventUwb", GetKeyCodeEventUwb), XL("GetKeyCodeEventWwanWimax", GetKeyCodeEventWwanWimax),
        XL("GetKeyCodeEventRfkill", GetKeyCodeEventRfkill), XL("GetKeyCodeEventChannel", GetKeyCodeEventChannel)
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[335] = { };
    InitPush0(desc);
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
#undef XL
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "keycodendk",
    .nm_priv = ((void *)0),
    .reserved = {0}
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
