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
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include "multimodalinput/oh_pointer_style.h"
#include "hilog/log.h"
#include <bits/alltypes.h>
#include <thread>
#include <iostream>

#undef LOG_TAG
#define LOG_TAG "MMI"

const int GLOBAL_RESMGR = 0xFF00;
const char *TAG = "[SensorCapiSample]";

void HookCallback(const Input_KeyEvent *keyEvent)
{
    int32_t eventId{-1};
    if (OH_Input_GetKeyEventId(keyEvent, &eventId) != INPUT_SUCCESS) {
        return;
    }
}

static napi_value QueryMaxTouchPoints1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_QueryMaxTouchPoints(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryMaxTouchPoints_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value QueryMaxTouchPoints2(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t count;
    int32_t minCount = -1;
    int32_t maxCount = 10;
    Input_Result retResult = OH_Input_QueryMaxTouchPoints(&count);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryMaxTouchPoints_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && (count >= minCount && count <= maxCount)) ? 1 : 0, &result);
    return result;
}

static napi_value InjectTouchEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 100);
    OH_Input_SetTouchEventGlobalY(touchEvent, 100);
    OH_Input_SetTouchEventAction(touchEvent, 1);
    int32_t retResult = OH_Input_InjectTouchEventGlobal(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (touchEvent != nullptr && retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value InjectTouchEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 100);
    int32_t globalX = OH_Input_GetTouchEventGlobalX(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0200 globalX:%{public}d", globalX);
    napi_create_int32(env, (touchEvent != nullptr && globalX == 100) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value InjectTouchEventGlobal3(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalY(touchEvent, 100);
    int32_t globalY = OH_Input_GetTouchEventGlobalY(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0300 globalY:%{public}d", globalY);
    napi_create_int32(env, (touchEvent != nullptr && globalY == 100) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value AxisEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    OH_Input_SetAxisEventGlobalX(axisEvent, 100);
    int32_t globalX;
    Input_Result retResult = OH_Input_GetAxisEventGlobalX(axisEvent, &globalX);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AxisEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (globalX == 100 && retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value AxisEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    OH_Input_SetAxisEventGlobalY(axisEvent, 99);
    int32_t globalY;
    Input_Result retResult = OH_Input_GetAxisEventGlobalY(axisEvent, &globalY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AxisEventGlobal_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (globalY == 99 && retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetKeyEventId1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t eventId;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    Input_Result retResult = OH_Input_GetKeyEventId(keyEvent, &eventId);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetKeyEventId_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventHook1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_AddKeyEventHook(HookCallback);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AddKeyEventHook_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        (retResult == INPUT_PERMISSION_DENIED || retResult == INPUT_SERVICE_EXCEPTION ||
        retResult == INPUT_DEVICE_NOT_SUPPORTED) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveKeyEventHook1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_RemoveKeyEventHook(HookCallback);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_RemoveKeyEventHook_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value DispatchToNextHandler1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t eventId;
    struct Input_KeyEvent* keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_GetKeyEventId(keyEvent, &eventId);
    Input_Result retResult = OH_Input_DispatchToNextHandler(eventId);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_DispatchToNextHandler_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        (retResult == INPUT_PARAMETER_ERROR || retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

static napi_value KeyCode1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 1;
    int32_t keyCode2 = 2;
    int32_t keyCode3 = 9;
    int32_t keyCode4 = 10;
    int32_t keyCode5 = 11;
    int32_t keyCode6 = 12;
    int32_t keyCode7 = 13;
    int32_t keyCode8 = 14;
    int32_t keyCode9 = 15;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_HOME == keyCode1 && Input_KeyCode::KEYCODE_BACK == keyCode2 &&
                      Input_KeyCode::KEYCODE_SEARCH == keyCode3 &&
                      Input_KeyCode::KEYCODE_MEDIA_PLAY_PAUSE == keyCode4 &&
                      Input_KeyCode::KEYCODE_MEDIA_STOP == keyCode5 &&
                      Input_KeyCode::KEYCODE_MEDIA_NEXT == keyCode6 &&
                      Input_KeyCode::KEYCODE_MEDIA_PREVIOUS == keyCode7 &&
                      Input_KeyCode::KEYCODE_MEDIA_REWIND == keyCode8 &&
                      Input_KeyCode::KEYCODE_MEDIA_FAST_FORWARD == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2210;
    int32_t keyCode2 = 2301;
    int32_t keyCode3 = 2302;
    int32_t keyCode4 = 2304;
    int32_t keyCode5 = 2305;
    int32_t keyCode6 = 2307;
    int32_t keyCode7 = 2308;
    int32_t keyCode8 = 2309;
    int32_t keyCode9 = 2310;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_VIRTUAL_MULTITASK == keyCode1 &&
                      Input_KeyCode::KEYCODE_BUTTON_A == keyCode2 && Input_KeyCode::KEYCODE_BUTTON_B == keyCode3 &&
                      Input_KeyCode::KEYCODE_BUTTON_X == keyCode4 && Input_KeyCode::KEYCODE_BUTTON_Y == keyCode5 &&
                      Input_KeyCode::KEYCODE_BUTTON_L1 == keyCode6 && Input_KeyCode::KEYCODE_BUTTON_R1 == keyCode7 &&
                      Input_KeyCode::KEYCODE_BUTTON_L2 == keyCode8 && Input_KeyCode::KEYCODE_BUTTON_R2 == keyCode9
                      ) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2311;
    int32_t keyCode2 = 2312;
    int32_t keyCode3 = 2313;
    int32_t keyCode4 = 2314;
    int32_t keyCode5 = 2315;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_BUTTON_SELECT == keyCode1 &&
                      Input_KeyCode::KEYCODE_BUTTON_START == keyCode2 &&
                      Input_KeyCode::KEYCODE_BUTTON_MODE == keyCode3 &&
                      Input_KeyCode::KEYCODE_BUTTON_THUMBL == keyCode4 &&
                      Input_KeyCode::KEYCODE_BUTTON_THUMBR == keyCode5) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode4(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2600;
    int32_t keyCode2 = 2601;
    int32_t keyCode3 = 2602;
    int32_t keyCode4 = 2603;
    int32_t keyCode5 = 2604;
    int32_t keyCode6 = 2605;
    int32_t keyCode7 = 2606;
    int32_t keyCode8 = 2607;
    int32_t keyCode9 = 2608;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_SLEEP == keyCode1 && Input_KeyCode::KEYCODE_ZENKAKU_HANKAKU == keyCode2 &&
                      Input_KeyCode::KEYCODE_102ND == keyCode3 && Input_KeyCode::KEYCODE_RO == keyCode4 &&
                      Input_KeyCode::KEYCODE_KATAKANA == keyCode5 && Input_KeyCode::KEYCODE_HIRAGANA == keyCode6 &&
                      Input_KeyCode::KEYCODE_HENKAN == keyCode7 &&
                      Input_KeyCode::KEYCODE_KATAKANA_HIRAGANA == keyCode8 &&
                      Input_KeyCode::KEYCODE_MUHENKAN == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode5(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2609;
    int32_t keyCode2 = 2610;
    int32_t keyCode3 = 2611;
    int32_t keyCode4 = 2612;
    int32_t keyCode5 = 2613;
    int32_t keyCode6 = 2614;
    int32_t keyCode7 = 2615;
    int32_t keyCode8 = 2616;
    int32_t keyCode9 = 2617;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_LINEFEED == keyCode1 && Input_KeyCode::KEYCODE_MACRO == keyCode2 &&
                      Input_KeyCode::KEYCODE_NUMPAD_PLUSMINUS == keyCode3 &&
                      Input_KeyCode::KEYCODE_SCALE == keyCode4 &&
                      Input_KeyCode::KEYCODE_HANGUEL == keyCode5 && Input_KeyCode::KEYCODE_HANJA == keyCode6 &&
                      Input_KeyCode::KEYCODE_YEN == keyCode7 && Input_KeyCode::KEYCODE_STOP == keyCode8 &&
                      Input_KeyCode::KEYCODE_AGAIN == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode6(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2618;
    int32_t keyCode2 = 2619;
    int32_t keyCode3 = 2620;
    int32_t keyCode4 = 2621;
    int32_t keyCode5 = 2622;
    int32_t keyCode6 = 2623;
    int32_t keyCode7 = 2624;
    int32_t keyCode8 = 2625;
    int32_t keyCode9 = 2626;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_PROPS == keyCode1 && Input_KeyCode::KEYCODE_UNDO == keyCode2 &&
                      Input_KeyCode::KEYCODE_COPY == keyCode3 && Input_KeyCode::KEYCODE_OPEN == keyCode4 &&
                      Input_KeyCode::KEYCODE_PASTE == keyCode5 && Input_KeyCode::KEYCODE_FIND == keyCode6 &&
                      Input_KeyCode::KEYCODE_CUT == keyCode7 && Input_KeyCode::KEYCODE_HELP == keyCode8 &&
                      Input_KeyCode::KEYCODE_CALC == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode7(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2627;
    int32_t keyCode2 = 2628;
    int32_t keyCode3 = 2629;
    int32_t keyCode4 = 2630;
    int32_t keyCode5 = 2631;
    int32_t keyCode6 = 2632;
    int32_t keyCode7 = 2634;
    int32_t keyCode8 = 2635;
    int32_t keyCode9 = 2636;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_FILE == keyCode1 && Input_KeyCode::KEYCODE_BOOKMARKS == keyCode2 &&
                      Input_KeyCode::KEYCODE_NEXT == keyCode3 && Input_KeyCode::KEYCODE_PLAYPAUSE == keyCode4 &&
                      Input_KeyCode::KEYCODE_PREVIOUS == keyCode5 && Input_KeyCode::KEYCODE_STOPCD == keyCode6 &&
                      Input_KeyCode::KEYCODE_CONFIG == keyCode7 && Input_KeyCode::KEYCODE_REFRESH == keyCode8 &&
                      Input_KeyCode::KEYCODE_EXIT == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode8(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2637;
    int32_t keyCode2 = 2638;
    int32_t keyCode3 = 2639;
    int32_t keyCode4 = 2640;
    int32_t keyCode5 = 2641;
    int32_t keyCode6 = 2642;
    int32_t keyCode7 = 2643;
    int32_t keyCode8 = 2644;
    int32_t keyCode9 = 2645;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_EDIT == keyCode1 && Input_KeyCode::KEYCODE_SCROLLUP == keyCode2 &&
                      Input_KeyCode::KEYCODE_SCROLLDOWN == keyCode3 && Input_KeyCode::KEYCODE_NEW == keyCode4 &&
                      Input_KeyCode::KEYCODE_REDO == keyCode5 && Input_KeyCode::KEYCODE_CLOSE == keyCode6 &&
                      Input_KeyCode::KEYCODE_PLAY == keyCode7 && Input_KeyCode::KEYCODE_BASSBOOST == keyCode8 &&
                      Input_KeyCode::KEYCODE_PRINT == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode9(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2646;
    int32_t keyCode2 = 2647;
    int32_t keyCode3 = 2648;
    int32_t keyCode4 = 2649;
    int32_t keyCode5 = 2650;
    int32_t keyCode6 = 2651;
    int32_t keyCode7 = 2652;
    int32_t keyCode8 = 2653;
    int32_t keyCode9 = 2654;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_CHAT == keyCode1 && Input_KeyCode::KEYCODE_FINANCE == keyCode2 &&
                      Input_KeyCode::KEYCODE_CANCEL == keyCode3 &&
                      Input_KeyCode::KEYCODE_KBDILLUM_TOGGLE == keyCode4 &&
                      Input_KeyCode::KEYCODE_KBDILLUM_DOWN == keyCode5 &&
                      Input_KeyCode::KEYCODE_KBDILLUM_UP == keyCode6 &&
                      Input_KeyCode::KEYCODE_SEND == keyCode7 && Input_KeyCode::KEYCODE_REPLY == keyCode8 &&
                      Input_KeyCode::KEYCODE_FORWARDMAIL == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode10(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2655;
    int32_t keyCode2 = 2656;
    int32_t keyCode3 = 2657;
    int32_t keyCode4 = 2658;
    int32_t keyCode5 = 2659;
    int32_t keyCode6 = 2660;
    int32_t keyCode7 = 2661;
    int32_t keyCode8 = 2662;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_SAVE == keyCode1 && Input_KeyCode::KEYCODE_DOCUMENTS == keyCode2 &&
                      Input_KeyCode::KEYCODE_VIDEO_NEXT == keyCode3 &&
                      Input_KeyCode::KEYCODE_VIDEO_PREV == keyCode4 &&
                      Input_KeyCode::KEYCODE_BRIGHTNESS_CYCLE == keyCode5 &&
                      Input_KeyCode::KEYCODE_BRIGHTNESS_ZERO == keyCode6 &&
                      Input_KeyCode::KEYCODE_DISPLAY_OFF == keyCode7 &&
                      Input_KeyCode::KEYCODE_BTN_MISC == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode11(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2663;
    int32_t keyCode2 = 2664;
    int32_t keyCode3 = 2665;
    int32_t keyCode4 = 2666;
    int32_t keyCode5 = 2667;
    int32_t keyCode6 = 2668;
    int32_t keyCode7 = 2669;
    int32_t keyCode8 = 2670;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_GOTO == keyCode1 && Input_KeyCode::KEYCODE_INFO == keyCode2 &&
                      Input_KeyCode::KEYCODE_PROGRAM == keyCode3 && Input_KeyCode::KEYCODE_PVR == keyCode4 &&
                      Input_KeyCode::KEYCODE_SUBTITLE == keyCode5 &&
                      Input_KeyCode::KEYCODE_FULL_SCREEN == keyCode6 &&
                      Input_KeyCode::KEYCODE_KEYBOARD == keyCode7 &&
                      Input_KeyCode::KEYCODE_ASPECT_RATIO == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode12(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyoCde1 = 2671;
    int32_t keyCode2 = 2672;
    int32_t keyCode3 = 2673;
    int32_t keyCode4 = 2674;
    int32_t keyCode5 = 2675;
    int32_t keyCode6 = 2676;
    int32_t keyCode7 = 2677;
    int32_t keyCode8 = 2678;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_PC == keyoCde1 && Input_KeyCode::KEYCODE_TV == keyCode2 &&
                      Input_KeyCode::KEYCODE_TV2 == keyCode3 && Input_KeyCode::KEYCODE_VCR == keyCode4 &&
                      Input_KeyCode::KEYCODE_VCR2 == keyCode5 && Input_KeyCode::KEYCODE_SAT == keyCode6 &&
                      Input_KeyCode::KEYCODE_CD == keyCode7 &&
                      Input_KeyCode::KEYCODE_TAPE == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode13(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2679;
    int32_t keyCode2 = 2680;
    int32_t keyCode3 = 2681;
    int32_t keyCode4 = 2682;
    int32_t keyCode5 = 2683;
    int32_t keyCode6 = 2684;
    int32_t keyCode7 = 2685;
    int32_t keyCode8 = 2686;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_TUNER == keyCode1 &&
                      Input_KeyCode::KEYCODE_PLAYER == keyCode2 &&
                      Input_KeyCode::KEYCODE_DVD == keyCode3 && Input_KeyCode::KEYCODE_AUDIO == keyCode4 &&
                      Input_KeyCode::KEYCODE_VIDEO == keyCode5 && Input_KeyCode::KEYCODE_MEMO == keyCode6 &&
                      Input_KeyCode::KEYCODE_CALENDAR == keyCode7 &&
                      Input_KeyCode::KEYCODE_RED == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode14(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2687;
    int32_t keyCode2 = 2688;
    int32_t keyCode3 = 2689;
    int32_t keyCode4 = 2690;
    int32_t keyCode5 = 2691;
    int32_t keyCode6 = 2692;
    int32_t keyCode7 = 2693;
    int32_t keyCode8 = 2694;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_GREEN == keyCode1 &&
                      Input_KeyCode::KEYCODE_YELLOW == keyCode2 &&
                      Input_KeyCode::KEYCODE_BLUE == keyCode3 && Input_KeyCode::KEYCODE_CHANNELUP == keyCode4 &&
                      Input_KeyCode::KEYCODE_CHANNELDOWN == keyCode5 &&
                      Input_KeyCode::KEYCODE_LAST == keyCode6 &&
                      Input_KeyCode::KEYCODE_RESTART == keyCode7 &&
                      Input_KeyCode::KEYCODE_SLOW == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode15(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2695;
    int32_t keyCode2 = 2696;
    int32_t keyCode3 = 2697;
    int32_t keyCode4 = 2698;
    int32_t keyCode5 = 2699;
    int32_t keyCode6 = 2700;
    int32_t keyCode7 = 2701;
    int32_t keyCode8 = 2702;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_SHUFFLE == keyCode1 && Input_KeyCode::KEYCODE_VIDEOPHONE == keyCode2 &&
                      Input_KeyCode::KEYCODE_GAMES == keyCode3 && Input_KeyCode::KEYCODE_ZOOMIN == keyCode4 &&
                      Input_KeyCode::KEYCODE_ZOOMOUT == keyCode5 && Input_KeyCode::KEYCODE_ZOOMRESET == keyCode6 &&
                      Input_KeyCode::KEYCODE_WORDPROCESSOR == keyCode7 &&
                      Input_KeyCode::KEYCODE_EDITOR == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode16(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2703;
    int32_t keyCode2 = 2704;
    int32_t keyCode3 = 2705;
    int32_t keyCode4 = 2706;
    int32_t keyCode5 = 2707;
    int32_t keyCode6 = 2708;
    int32_t keyCode7 = 2709;
    int32_t keyCode8 = 2710;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_SPREADSHEET == keyCode1 &&
                      Input_KeyCode::KEYCODE_GRAPHICSEDITOR == keyCode2 &&
                      Input_KeyCode::KEYCODE_PRESENTATION == keyCode3 &&
                      Input_KeyCode::KEYCODE_DATABASE == keyCode4 &&
                      Input_KeyCode::KEYCODE_NEWS == keyCode5 && Input_KeyCode::KEYCODE_VOICEMAIL == keyCode6 &&
                      Input_KeyCode::KEYCODE_ADDRESSBOOK == keyCode7 &&
                      Input_KeyCode::KEYCODE_MESSENGER == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode17(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2711;
    int32_t keyCode2 = 2712;
    int32_t keyCode3 = 2713;
    int32_t keyCode4 = 2714;
    int32_t keyCode5 = 2715;
    int32_t keyCode6 = 2716;
    int32_t keyCode7 = 2717;
    int32_t keyCode8 = 2718;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_BRIGHTNESS_TOGGLE == keyCode1 &&
                      Input_KeyCode::KEYCODE_SPELLCHECK == keyCode2 && Input_KeyCode::KEYCODE_COFFEE == keyCode3 &&
                      Input_KeyCode::KEYCODE_MEDIA_REPEAT == keyCode4 &&
                      Input_KeyCode::KEYCODE_IMAGES == keyCode5 &&
                      Input_KeyCode::KEYCODE_BUTTONCONFIG == keyCode6 &&
                      Input_KeyCode::KEYCODE_TASKMANAGER == keyCode7 &&
                      Input_KeyCode::KEYCODE_JOURNAL == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode18(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2719;
    int32_t keyCode2 = 2720;
    int32_t keyCode3 = 2721;
    int32_t keyCode4 = 2722;
    int32_t keyCode5 = 2723;
    int32_t keyCode6 = 2724;
    int32_t keyCode7 = 2725;
    int32_t keyCode8 = 2726;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_CONTROLPANEL == keyCode1 &&
                      Input_KeyCode::KEYCODE_APPSELECT == keyCode2 &&
                      Input_KeyCode::KEYCODE_SCREENSAVER == keyCode3 &&
                      Input_KeyCode::KEYCODE_ASSISTANT == keyCode4 &&
                      Input_KeyCode::KEYCODE_KBD_LAYOUT_NEXT == keyCode5 &&
                      Input_KeyCode::KEYCODE_BRIGHTNESS_MIN == keyCode6 &&
                      Input_KeyCode::KEYCODE_BRIGHTNESS_MAX == keyCode7 &&
                      Input_KeyCode::KEYCODE_KBDINPUTASSIST_PREV == keyCode8) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode19(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2727;
    int32_t keyCode2 = 2728;
    int32_t keyCode3 = 2729;
    int32_t keyCode4 = 2730;
    int32_t keyCode5 = 2731;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_KBDINPUTASSIST_NEXT == keyCode1 &&
                      Input_KeyCode::KEYCODE_KBDINPUTASSIST_PREVGROUP == keyCode2 &&
                      Input_KeyCode::KEYCODE_KBDINPUTASSIST_NEXTGROUP == keyCode3 &&
                      Input_KeyCode::KEYCODE_KBDINPUTASSIST_ACCEPT == keyCode4 &&
                      Input_KeyCode::KEYCODE_KBDINPUTASSIST_CANCEL == keyCode5) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode20(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2800;
    int32_t keyCode2 = 2801;
    int32_t keyCode3 = 2802;
    int32_t keyCode4 = 2803;
    int32_t keyCode5 = 2804;
    int32_t keyCode6 = 2805;
    int32_t keyCode7 = 2806;
    int32_t keyCode8 = 2807;
    int32_t keyCode9 = 2808;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_FRONT == keyCode1 && Input_KeyCode::KEYCODE_SETUP == keyCode2 &&
                      Input_KeyCode::KEYCODE_WAKEUP == keyCode3 && Input_KeyCode::KEYCODE_SENDFILE == keyCode4 &&
                      Input_KeyCode::KEYCODE_DELETEFILE == keyCode5 && Input_KeyCode::KEYCODE_XFER == keyCode6 &&
                      Input_KeyCode::KEYCODE_PROG1 == keyCode7 && Input_KeyCode::KEYCODE_PROG2 == keyCode8 &&
                      Input_KeyCode::KEYCODE_MSDOS == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode21(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2809;
    int32_t keyCode2 = 2810;
    int32_t keyCode3 = 2811;
    int32_t keyCode4 = 2812;
    int32_t keyCode5 = 2813;
    int32_t keyCode6 = 2814;
    int32_t keyCode7 = 2815;
    int32_t keyCode8 = 2816;
    int32_t keyCode9 = 2817;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_SCREENLOCK == keyCode1 &&
                      Input_KeyCode::KEYCODE_DIRECTION_ROTATE_DISPLAY == keyCode2 &&
                      Input_KeyCode::KEYCODE_CYCLEWINDOWS == keyCode3 &&
                      Input_KeyCode::KEYCODE_COMPUTER == keyCode4 &&
                      Input_KeyCode::KEYCODE_EJECTCLOSECD == keyCode5 &&
                      Input_KeyCode::KEYCODE_ISO == keyCode6 &&
                      Input_KeyCode::KEYCODE_MOVE == keyCode7 && Input_KeyCode::KEYCODE_F13 == keyCode8 &&
                      Input_KeyCode::KEYCODE_F14 == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode22(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2818;
    int32_t keyCode2 = 2819;
    int32_t keyCode3 = 2820;
    int32_t keyCode4 = 2821;
    int32_t keyCode5 = 2822;
    int32_t keyCode6 = 2823;
    int32_t keyCode7 = 2824;
    int32_t keyCode8 = 2825;
    int32_t keyCode9 = 2826;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_F15 == keyCode1 && Input_KeyCode::KEYCODE_F16 == keyCode2 &&
                      Input_KeyCode::KEYCODE_F17 == keyCode3 && Input_KeyCode::KEYCODE_F18 == keyCode4 &&
                      Input_KeyCode::KEYCODE_F19 == keyCode5 && Input_KeyCode::KEYCODE_F20 == keyCode6 &&
                      Input_KeyCode::KEYCODE_F21 == keyCode7 && Input_KeyCode::KEYCODE_F22 == keyCode8 &&
                      Input_KeyCode::KEYCODE_F23 == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode23(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2827;
    int32_t keyCode2 = 2828;
    int32_t keyCode3 = 2829;
    int32_t keyCode4 = 2830;
    int32_t keyCode5 = 2831;
    int32_t keyCode6 = 2832;
    int32_t keyCode7 = 2833;
    int32_t keyCode8 = 2834;
    int32_t keyCode9 = 2836;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_F24 == keyCode1 && Input_KeyCode::KEYCODE_PROG3 == keyCode2 &&
                      Input_KeyCode::KEYCODE_PROG4 == keyCode3 && Input_KeyCode::KEYCODE_DASHBOARD == keyCode4 &&
                      Input_KeyCode::KEYCODE_SUSPEND == keyCode5 && Input_KeyCode::KEYCODE_HP == keyCode6 &&
                      Input_KeyCode::KEYCODE_SOUND == keyCode7 && Input_KeyCode::KEYCODE_QUESTION == keyCode8 &&
                      Input_KeyCode::KEYCODE_CONNECT == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode24(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2837;
    int32_t keyCode2 = 2838;
    int32_t keyCode3 = 2839;
    int32_t keyCode4 = 2841;
    int32_t keyCode5 = 2842;
    int32_t keyCode6 = 2843;
    int32_t keyCode7 = 2844;
    int32_t keyCode8 = 2845;
    int32_t keyCode9 = 2846;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_SPORT == keyCode1 && Input_KeyCode::KEYCODE_SHOP == keyCode2 &&
                      Input_KeyCode::KEYCODE_ALTERASE == keyCode3 &&
                      Input_KeyCode::KEYCODE_SWITCHVIDEOMODE == keyCode4 &&
                      Input_KeyCode::KEYCODE_BATTERY == keyCode5 &&
                      Input_KeyCode::KEYCODE_BLUETOOTH == keyCode6 &&
                      Input_KeyCode::KEYCODE_WLAN == keyCode7 && Input_KeyCode::KEYCODE_UWB == keyCode8 &&
                      Input_KeyCode::KEYCODE_WWAN_WIMAX == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode25(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 2847;
    int32_t keyCode2 = 3001;
    int32_t keyCode3 = 3100;
    int32_t keyCode4 = 3101;
    int32_t keyCode5 = 3102;
    int32_t keyCode6 = 3103;
    int32_t keyCode7 = 3104;
    int32_t keyCode8 = 3105;
    int32_t keyCode9 = 3106;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_RFKILL == keyCode1 &&
                      Input_KeyCode::KEYCODE_CHANNEL == keyCode2 &&
                      Input_KeyCode::KEYCODE_BTN_0 == keyCode3 && Input_KeyCode::KEYCODE_BTN_1 == keyCode4 &&
                      Input_KeyCode::KEYCODE_BTN_2 == keyCode5 && Input_KeyCode::KEYCODE_BTN_3 == keyCode6 &&
                      Input_KeyCode::KEYCODE_BTN_4 == keyCode7 && Input_KeyCode::KEYCODE_BTN_5 == keyCode8 &&
                      Input_KeyCode::KEYCODE_BTN_6 == keyCode9) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode26(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t keyCode1 = 3107;
    int32_t keyCode2 = 3108;
    int32_t keyCode3 = 3109;
    int32_t keyCode4 = 3211;
    int32_t keyCode5 = 3212;
    int32_t keyCode6 = 3213;
    int32_t keyCode7 = 3220;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_BTN_7 == keyCode1 &&
                      Input_KeyCode::KEYCODE_BTN_8 == keyCode2 &&
                      Input_KeyCode::KEYCODE_BTN_9 == keyCode3 &&
                      Input_KeyCode::KEYCODE_DAGGER_CLICK == keyCode4 &&
                      Input_KeyCode::KEYCODE_DAGGER_DOUBLE_CLICK == keyCode5 &&
                      Input_KeyCode::KEYCODE_DAGGER_LONG_PRESS == keyCode6 &&
                      Input_KeyCode::KEYCODE_DIV == keyCode7) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 0;
    int32_t pointerStyle2 = 1;
    int32_t pointerStyle3 = 2;
    int32_t pointerStyle4 = 3;
    int32_t pointerStyle5 = 4;
    int32_t pointerStyle6 = 5;
    int32_t pointerStyle7 = 6;
    int32_t pointerStyle8 = 7;
    napi_create_int32(env,
                      (Input_PointerStyle::DEFAULT == pointerStyle1 && Input_PointerStyle::EAST == pointerStyle2 &&
                      Input_PointerStyle::WEST == pointerStyle3 && Input_PointerStyle::SOUTH == pointerStyle4 &&
                      Input_PointerStyle::NORTH == pointerStyle5 && Input_PointerStyle::WEST_EAST == pointerStyle6 &&
                      Input_PointerStyle::NORTH_SOUTH == pointerStyle7 &&
                      Input_PointerStyle::NORTH_EAST == pointerStyle8) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 8;
    int32_t pointerStyle2 = 9;
    int32_t pointerStyle3 = 10;
    int32_t pointerStyle4 = 11;
    int32_t pointerStyle5 = 12;
    int32_t pointerStyle6 = 13;
    int32_t pointerStyle7 = 14;
    int32_t pointerStyle8 = 15;
    napi_create_int32(env,
                      (Input_PointerStyle::NORTH_WEST == pointerStyle1 &&
                      Input_PointerStyle::SOUTH_EAST == pointerStyle2 &&
                      Input_PointerStyle::SOUTH_WEST == pointerStyle3 &&
                      Input_PointerStyle::NORTH_EAST_SOUTH_WEST == pointerStyle4 &&
                      Input_PointerStyle::NORTH_WEST_SOUTH_EAST == pointerStyle5 &&
                      Input_PointerStyle::CROSS == pointerStyle6 &&
                      Input_PointerStyle::CURSOR_COPY == pointerStyle7 &&
                      Input_PointerStyle::CURSOR_FORBID == pointerStyle8) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 16;
    int32_t pointerStyle2 = 17;
    int32_t pointerStyle3 = 18;
    int32_t pointerStyle4 = 19;
    int32_t pointerStyle5 = 20;
    int32_t pointerStyle6 = 21;
    int32_t pointerStyle7 = 22;
    int32_t pointerStyle8 = 23;
    napi_create_int32(env,
                      (Input_PointerStyle::COLOR_SUCKER == pointerStyle1 &&
                      Input_PointerStyle::HAND_GRABBING == pointerStyle2 &&
                      Input_PointerStyle::HAND_OPEN == pointerStyle3 &&
                      Input_PointerStyle::HAND_POINTING == pointerStyle4 &&
                      Input_PointerStyle::HELP == pointerStyle5 && Input_PointerStyle::MOVE == pointerStyle6 &&
                      Input_PointerStyle::RESIZE_LEFT_RIGHT == pointerStyle7 &&
                      Input_PointerStyle::RESIZE_UP_DOWN == pointerStyle8) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle4(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 24;
    int32_t pointerStyle2 = 25;
    int32_t pointerStyle3 = 26;
    int32_t pointerStyle4 = 27;
    int32_t pointerStyle5 = 28;
    int32_t pointerStyle6 = 29;
    int32_t pointerStyle7 = 30;
    int32_t pointerStyle8 = 31;
    napi_create_int32(env,
                      (Input_PointerStyle::SCREENSHOT_CHOOSE == pointerStyle1 &&
                      Input_PointerStyle::SCREENSHOT_CURSOR == pointerStyle2 &&
                      Input_PointerStyle::TEXT_CURSOR == pointerStyle3 &&
                      Input_PointerStyle::ZOOM_IN == pointerStyle4 && Input_PointerStyle::ZOOM_OUT == pointerStyle5 &&
                      Input_PointerStyle::MIDDLE_BTN_EAST == pointerStyle6 &&
                      Input_PointerStyle::MIDDLE_BTN_WEST == pointerStyle7 &&
                      Input_PointerStyle::MIDDLE_BTN_SOUTH == pointerStyle8) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle5(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 32;
    int32_t pointerStyle2 = 33;
    int32_t pointerStyle3 = 34;
    int32_t pointerStyle4 = 35;
    int32_t pointerStyle5 = 36;
    int32_t pointerStyle6 = 37;
    int32_t pointerStyle7 = 38;
    napi_create_int32(env,
                      (Input_PointerStyle::MIDDLE_BTN_NORTH == pointerStyle1 &&
                      Input_PointerStyle::MIDDLE_BTN_NORTH_SOUTH == pointerStyle2 &&
                      Input_PointerStyle::MIDDLE_BTN_NORTH_EAST == pointerStyle3 &&
                      Input_PointerStyle::MIDDLE_BTN_NORTH_WEST == pointerStyle4 &&
                      Input_PointerStyle::MIDDLE_BTN_SOUTH_EAST == pointerStyle5 &&
                      Input_PointerStyle::MIDDLE_BTN_SOUTH_WEST == pointerStyle6 &&
                      Input_PointerStyle::MIDDLE_BTN_NORTH_SOUTH_WEST_EAST == pointerStyle7) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle6(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 39;
    int32_t pointerStyle2 = 40;
    int32_t pointerStyle3 = 41;
    int32_t pointerStyle4 = 42;
    int32_t pointerStyle5 = 43;
    int32_t pointerStyle6 = 44;
    int32_t pointerStyle7 = 45;
    int32_t pointerStyle8 = 46;
    napi_create_int32(env,
                      (Input_PointerStyle::HORIZONTAL_TEXT_CURSOR == pointerStyle1 &&
                      Input_PointerStyle::CURSOR_CROSS == pointerStyle2 &&
                      Input_PointerStyle::CURSOR_CIRCLE == pointerStyle3 &&
                      Input_PointerStyle::LOADING == pointerStyle4 && Input_PointerStyle::RUNNING == pointerStyle5 &&
                      Input_PointerStyle::MIDDLE_BTN_EAST_WEST == pointerStyle6 &&
                      Input_PointerStyle::RUNNING_LEFT == pointerStyle7 &&
                      Input_PointerStyle::RUNNING_RIGHT == pointerStyle8) ? 1 : 0, &result);
    return result;
}

static napi_value PointerStyle7(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t pointerStyle1 = 47;
    int32_t pointerStyle2 = 48;
    int32_t pointerStyle3 = 49;
    int32_t pointerStyle4 = 50;
    int32_t pointerStyle5 = 51;
    int32_t pointerStyle6 = -100;
    napi_create_int32(env,
                      (Input_PointerStyle::AECH_DEVELOPER_DEFINED_ICON == pointerStyle1 &&
                      Input_PointerStyle::SCREENRECORDER_CURSOR == pointerStyle2 &&
                      Input_PointerStyle::LASER_CURSOR == pointerStyle3 &&
                      Input_PointerStyle::LASER_CURSOR_DOT == pointerStyle4 &&
                      Input_PointerStyle::LASER_CURSOR_DOT_RED == pointerStyle5 &&
                      Input_PointerStyle::DEVELOPER_DEFINED_ICON == pointerStyle6) ? 1 : 0, &result);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"QueryMaxTouchPoints1", nullptr, QueryMaxTouchPoints1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QueryMaxTouchPoints2", nullptr, QueryMaxTouchPoints2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal1", nullptr, InjectTouchEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal2", nullptr, InjectTouchEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal3", nullptr, InjectTouchEventGlobal3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AxisEventGlobal1", nullptr, AxisEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AxisEventGlobal2", nullptr, AxisEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventId1", nullptr, GetKeyEventId1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventHook1", nullptr, AddKeyEventHook1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventHook1", nullptr, RemoveKeyEventHook1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DispatchToNextHandler1", nullptr, DispatchToNextHandler1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode1", nullptr, KeyCode1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode2", nullptr, KeyCode2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode3", nullptr, KeyCode3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode4", nullptr, KeyCode4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode5", nullptr, KeyCode5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode6", nullptr, KeyCode6, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode7", nullptr, KeyCode7, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode8", nullptr, KeyCode8, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode9", nullptr, KeyCode9, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode10", nullptr, KeyCode10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode11", nullptr, KeyCode11, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode12", nullptr, KeyCode12, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode13", nullptr, KeyCode13, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode14", nullptr, KeyCode14, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode15", nullptr, KeyCode15, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode16", nullptr, KeyCode16, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode17", nullptr, KeyCode17, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode18", nullptr, KeyCode18, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode19", nullptr, KeyCode19, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode20", nullptr, KeyCode20, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode21", nullptr, KeyCode21, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode22", nullptr, KeyCode22, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode23", nullptr, KeyCode23, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode24", nullptr, KeyCode24, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode25", nullptr, KeyCode25, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode26", nullptr, KeyCode26, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle1", nullptr, PointerStyle1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle2", nullptr, PointerStyle2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle3", nullptr, PointerStyle3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle4", nullptr, PointerStyle4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle5", nullptr, PointerStyle5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle6", nullptr, PointerStyle6, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle7", nullptr, PointerStyle7, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libtouchndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}