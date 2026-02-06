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
#include <js_native_api_types.h>
#include <cstdint>
#include <vector>
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include "SetKeyEventKeyCodeTest.h"

napi_value OHInputInjectKeyEventB(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_B);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventE(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_E);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventG(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_G);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventH(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_H);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventI(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_I);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventJ(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_J);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventK(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_K);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventL(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_L);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventM(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_M);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventN(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_N);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventO(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_O);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventP(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_P);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventQ(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_Q);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventR(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_R);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventS(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_S);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventT(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_T);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventU(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_U);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventV(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_V);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventW(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_W);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventX(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_X);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventY(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_Y);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventDpadDown(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_DPAD_DOWN);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventDpadRight(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_DPAD_RIGHT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventDpadCenter(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_DPAD_CENTER);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}


napi_value OHInputInjectKeyEventPount(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_POUND);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent0(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_0);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent1(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_1);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent2(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_2);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent3(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_3);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent4(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_4);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent5(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_5);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent6(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_6);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent7(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_7);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEvent8(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_8);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}


napi_value OHInputInjectKeyEventStart(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_STAR);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventComma(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_COMMA);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventPeriod(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_PERIOD);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventActionRight(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_SHIFT_RIGHT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeSpace(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_SPACE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeSYM(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_SYM);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeExplorer(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_EXPLORER);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeEnvelope(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_ENVELOPE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeDel(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_DEL);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeGrave(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_GRAVE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMinus(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MINUS);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeEquals(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_EQUALS);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeLeftBracket(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_LEFT_BRACKET);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeRightBracket(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_RIGHT_BRACKET);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeBackSlash(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_BACKSLASH);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeSemicolon(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_SEMICOLON);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeApostrophe(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_APOSTROPHE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeSlash(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_SLASH);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeAT(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_AT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodePlus(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_PLUS);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMenu(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MENU);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodePageUp(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_PAGE_UP);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodePageDown(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_PAGE_DOWN);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeEscape(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_ESCAPE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeForwardDel(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_FORWARD_DEL);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMetaRight(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_META_RIGHT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeFunction(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_FUNCTION);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeSysrq(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_SYSRQ);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeBreak(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_BREAK);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMoveEnd(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MOVE_END);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeInsert(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_INSERT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeForward(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_FORWARD);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMediaPlay(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MEDIA_PLAY);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMediaPause(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MEDIA_PAUSE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMediaClose(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MEDIA_CLOSE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMediaEject(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MEDIA_EJECT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeMediaRecord(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MEDIA_RECORD);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF2(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F2);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF3(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F3);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF4(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F4);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF5(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F5);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF6(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F6);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF7(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F7);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF8(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F8);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF9(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F9);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF10(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F10);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeF11(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F11);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}


napi_value OHInputInjectKeyEventKeycodeF12(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_F12);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumLock(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUM_LOCK);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad0(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_0);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}


napi_value OHInputInjectKeyEventKeycodeNumpad1(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_1);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad2(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_2);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad3(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_3);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad4(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_4);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad5(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_5);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad6(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_6);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad7(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_7);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpad8(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_8);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}


napi_value OHInputInjectKeyEventKeycodeNumpadDivide(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_DIVIDE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadMultiply(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_MULTIPLY);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadSubtract(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_SUBTRACT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadAdd(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_ADD);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadDot(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_DOT);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadComma(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_COMMA);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadEnter(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_ENTER);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadEquals(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_EQUALS);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadLeftParen(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_LEFT_PAREN);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventKeycodeNumpadRightParen(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_NUMPAD_RIGHT_PAREN);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventFn(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_FN);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventVolumeUp(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_VOLUME_UP);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventVolumeDown(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_VOLUME_DOWN);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventPower(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_POWER);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventCamera(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_CAMERA);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventVolumeMute(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_VOLUME_MUTE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventMute(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_MUTE);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventBrightnessUp(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_BRIGHTNESS_UP);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value OHInputInjectKeyEventBrightnessDown(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_BRIGHTNESS_DOWN);
    
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value SetAxisEventAxisValueUnkown(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_UNKNOWN;
    double axisValue = 1.0;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value SetAxisEventAxisValueVertical(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_VERTICAL;
    double axisValue = 1.0;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value SetAxisEventAxisValueHorizontal(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_SCROLL_HORIZONTAL;
    double axisValue = 1.0;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value SetAxisEventAxisValuePinch(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_PINCH;
    double axisValue = 1.0;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value SetAxisEventAxisValueRotate(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisType axisType = AXIS_TYPE_ROTATE;
    double axisValue = 1.0;
    Input_Result retResult = OH_Input_SetAxisEventAxisValue(axisEvent, axisType, axisValue);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value SetKeyCodePressed(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, KEY_PRESSED);
    int32_t keyCode = OH_Input_GetKeyCode(keyState);
    napi_create_int32(env, keyCode == KEY_PRESSED ? 0 : -1, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

napi_value SetKeyCodeSwitchOn(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, KEY_SWITCH_ON);
    int32_t keyCode = OH_Input_GetKeyCode(keyState);
    napi_create_int32(env, keyCode == KEY_SWITCH_ON ? 0 : -1, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

napi_value SetKeyCodeSwitchOff(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, KEY_SWITCH_OFF);
    int32_t keyCode = OH_Input_GetKeyCode(keyState);
    napi_create_int32(env, keyCode == KEY_SWITCH_OFF ? 0 : -1, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

napi_value GetKeyEventActionCancel(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_CANCEL);
    int32_t action = OH_Input_GetKeyEventAction(keyEvent);
    napi_create_int32(env, action == KEY_ACTION_CANCEL ? 0 : -1, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

napi_value SetMouseEventActionAxisEnd(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, MOUSE_ACTION_AXIS_END);
    int32_t action = OH_Input_GetMouseEventAction(mouseEvent);
    napi_create_int32(env, action == MOUSE_ACTION_AXIS_END ? 0 : -1, &result);
    return result;
}

napi_value GetMouseEventAxisTypeHorizontal(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAxisType(mouseEvent, MOUSE_AXIS_SCROLL_HORIZONTAL);
    int32_t action = OH_Input_GetMouseEventAxisType(mouseEvent);
    napi_create_int32(env, action == MOUSE_AXIS_SCROLL_HORIZONTAL ? 0 : -1, &result);
    return result;
}

napi_value SetMouseEventButtonBack(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventButton(mouseEvent, MOUSE_BUTTON_BACK);
    int32_t action = OH_Input_GetMouseEventButton(mouseEvent);
    napi_create_int32(env, action == MOUSE_BUTTON_BACK ? 0 : -1, &result);
    return result;
}

napi_value touchEventActionUp(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, TOUCH_ACTION_UP);
    int32_t action = OH_Input_GetTouchEventAction(touchEvent);
    napi_create_int32(env, action == TOUCH_ACTION_UP ? 0 : -1, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value touchEventActionCancel(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, TOUCH_ACTION_CANCEL);
    int32_t action = OH_Input_GetTouchEventAction(touchEvent);
    napi_create_int32(env, action == TOUCH_ACTION_CANCEL ? 0 : -1, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

napi_value SetAxisEventSourceType(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_SourceType sourceType = SOURCE_TYPE_TOUCHPAD;
    OH_Input_SetAxisEventSourceType(axisEvent, SOURCE_TYPE_TOUCHPAD);
    Input_Result retResult = OH_Input_GetAxisEventSourceType(axisEvent, &sourceType);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value AxisEventActionCancel(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    InputEvent_AxisAction action = AXIS_ACTION_CANCEL;
    Input_Result retResult = OH_Input_SetAxisEventAction(axisEvent, action);
    retResult = OH_Input_GetAxisEventAction(axisEvent, &action);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 0 : -1, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

napi_value OHInputInjectionStatusSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_InjectionStatus status = UNAUTHORIZED;
    int32_t retResult = OH_Input_QueryAuthorizedStatus(&status);
    napi_create_int32(env, retResult == 0 ? 0 : -1, &result);
    return result;
}

napi_value OHInputInjectionStatusError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t retResult = OH_Input_QueryAuthorizedStatus(nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 0 : -1, &result);
    return result;
}

void addSetKeyEventKeyCodeTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventB",
                       nullptr, OHInputInjectKeyEventB, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventE",
                       nullptr, OHInputInjectKeyEventE, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventG",
                       nullptr, OHInputInjectKeyEventG, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventH",
                       nullptr, OHInputInjectKeyEventH, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventI",
                       nullptr, OHInputInjectKeyEventI, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventJ",
                       nullptr, OHInputInjectKeyEventJ, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventK",
                       nullptr, OHInputInjectKeyEventK, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventL",
                       nullptr, OHInputInjectKeyEventL, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventM",
                       nullptr, OHInputInjectKeyEventM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventN",
                       nullptr, OHInputInjectKeyEventN, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventO",
                       nullptr, OHInputInjectKeyEventO, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventP",
                       nullptr, OHInputInjectKeyEventP, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventQ",
                       nullptr, OHInputInjectKeyEventQ, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventR",
                       nullptr, OHInputInjectKeyEventR, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventS",
                       nullptr, OHInputInjectKeyEventS, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventT",
                       nullptr, OHInputInjectKeyEventT, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventU",
                       nullptr, OHInputInjectKeyEventU, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventV",
                       nullptr, OHInputInjectKeyEventV, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventW",
                       nullptr, OHInputInjectKeyEventW, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventX",
                       nullptr, OHInputInjectKeyEventX, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventY",
                       nullptr, OHInputInjectKeyEventY, nullptr, nullptr, nullptr, napi_default, nullptr});
}
void addSetKeyEventKeyCodeTest2(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventDpadDown",
                       nullptr, OHInputInjectKeyEventDpadDown, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventDpadRight",
                       nullptr, OHInputInjectKeyEventDpadRight, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventDpadCenter",
                       nullptr, OHInputInjectKeyEventDpadCenter, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventPount",
                       nullptr, OHInputInjectKeyEventPount, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent0",
                       nullptr, OHInputInjectKeyEvent0, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent1",
                       nullptr, OHInputInjectKeyEvent1, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent2",
                       nullptr, OHInputInjectKeyEvent2, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent3",
                       nullptr, OHInputInjectKeyEvent3, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent4",
                       nullptr, OHInputInjectKeyEvent4, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent5",
                       nullptr, OHInputInjectKeyEvent5, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent6",
                       nullptr, OHInputInjectKeyEvent6, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent7",
                       nullptr, OHInputInjectKeyEvent7, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEvent8",
                       nullptr, OHInputInjectKeyEvent8, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventStart",
                       nullptr, OHInputInjectKeyEventStart, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventComma",
                       nullptr, OHInputInjectKeyEventComma, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventPeriod",
                       nullptr, OHInputInjectKeyEventPeriod, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventActionRight",
                       nullptr, OHInputInjectKeyEventActionRight, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeSpace",
                       nullptr, OHInputInjectKeyEventKeycodeSpace, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeSYM",
                       nullptr, OHInputInjectKeyEventKeycodeSYM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeExplorer",
                       nullptr, OHInputInjectKeyEventKeycodeExplorer,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeEnvelope",
                       nullptr, OHInputInjectKeyEventKeycodeEnvelope,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeDel",
                       nullptr, OHInputInjectKeyEventKeycodeDel, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMinus",
                       nullptr, OHInputInjectKeyEventKeycodeMinus, nullptr, nullptr, nullptr, napi_default, nullptr});
}
void addSetKeyEventKeyCodeTest3(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventKeycodeEquals",
                       nullptr, OHInputInjectKeyEventKeycodeEquals, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeLeftBracket",
                       nullptr, OHInputInjectKeyEventKeycodeLeftBracket,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeRightBracket",
                       nullptr, OHInputInjectKeyEventKeycodeRightBracket,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeBackSlash",
                       nullptr, OHInputInjectKeyEventKeycodeBackSlash,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeSemicolon",
                       nullptr, OHInputInjectKeyEventKeycodeSemicolon,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeApostrophe",
                       nullptr, OHInputInjectKeyEventKeycodeApostrophe,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeSlash",
                       nullptr, OHInputInjectKeyEventKeycodeSlash,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeGrave",
                       nullptr, OHInputInjectKeyEventKeycodeGrave,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeAT",
                       nullptr, OHInputInjectKeyEventKeycodeAT,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectionStatusSuccess",
                       nullptr, OHInputInjectionStatusSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectionStatusError",
                       nullptr, OHInputInjectionStatusError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodePlus",
                       nullptr, OHInputInjectKeyEventKeycodePlus,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMenu",
                       nullptr, OHInputInjectKeyEventKeycodeMenu,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodePageUp",
                       nullptr, OHInputInjectKeyEventKeycodePageUp,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest4(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventKeycodeF2",
                       nullptr, OHInputInjectKeyEventKeycodeF2, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF3",
                       nullptr, OHInputInjectKeyEventKeycodeF3, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF4",
                       nullptr, OHInputInjectKeyEventKeycodeF4, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF5",
                       nullptr, OHInputInjectKeyEventKeycodeF5, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF6",
                       nullptr, OHInputInjectKeyEventKeycodeF6, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF7",
                       nullptr, OHInputInjectKeyEventKeycodeF7, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF8",
                       nullptr, OHInputInjectKeyEventKeycodeF8, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF9",
                       nullptr, OHInputInjectKeyEventKeycodeF9, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF10",
                       nullptr, OHInputInjectKeyEventKeycodeF10, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF11",
                       nullptr, OHInputInjectKeyEventKeycodeF11, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeF12",
                       nullptr, OHInputInjectKeyEventKeycodeF12, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumLock",
                       nullptr, OHInputInjectKeyEventKeycodeNumLock,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad0",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad0,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad1",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad1,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad2",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad2,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad3",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad3,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad4",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad4,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad5",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad5,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad6",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad6,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest5(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadLeftParen",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadLeftParen,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadRightParen",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadRightParen,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventFn",
                       nullptr, OHInputInjectKeyEventFn, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventVolumeUp",
                       nullptr, OHInputInjectKeyEventVolumeUp, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventVolumeDown",
                       nullptr, OHInputInjectKeyEventVolumeDown, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventPower",
                       nullptr, OHInputInjectKeyEventPower, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventCamera",
                       nullptr, OHInputInjectKeyEventCamera, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventVolumeMute",
                       nullptr, OHInputInjectKeyEventVolumeMute, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventMute",
                       nullptr, OHInputInjectKeyEventMute, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventBrightnessUp",
                       nullptr, OHInputInjectKeyEventBrightnessUp, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventBrightnessDown",
                       nullptr, OHInputInjectKeyEventBrightnessDown, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetAxisEventAxisValueUnkown",
                       nullptr, SetAxisEventAxisValueUnkown, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetAxisEventAxisValueVertical",
                       nullptr, SetAxisEventAxisValueVertical, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetAxisEventAxisValueHorizontal",
                       nullptr, SetAxisEventAxisValueHorizontal, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetAxisEventAxisValuePinch",
                       nullptr, SetAxisEventAxisValuePinch, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetAxisEventAxisValueRotate",
                       nullptr, SetAxisEventAxisValueRotate, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetKeyCodePressed",
                       nullptr, SetKeyCodePressed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetKeyCodeSwitchOn",
                       nullptr, SetKeyCodeSwitchOn, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetKeyCodeSwitchOff",
                       nullptr, SetKeyCodeSwitchOff, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"GetKeyEventActionCancel",
                       nullptr, GetKeyEventActionCancel, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetMouseEventActionAxisEnd",
                       nullptr, SetMouseEventActionAxisEnd, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest6(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"GetMouseEventAxisTypeHorizontal",
                       nullptr, GetMouseEventAxisTypeHorizontal,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetMouseEventButtonBack",
                       nullptr, SetMouseEventButtonBack, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"touchEventActionUp",
                       nullptr, touchEventActionUp, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"touchEventActionCancel",
                       nullptr, touchEventActionCancel, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SetAxisEventSourceType",
                       nullptr, SetAxisEventSourceType, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"AxisEventActionCancel",
                       nullptr, AxisEventActionCancel, nullptr,
                       nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad7",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad7,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpad8",
                       nullptr, OHInputInjectKeyEventKeycodeNumpad8,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadDivide",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadDivide,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadMultiply",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadMultiply,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadSubtract",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadSubtract,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadAdd",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadAdd,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadDot",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadDot,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest7(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventKeycodeBreak",
                       nullptr, OHInputInjectKeyEventKeycodeBreak,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMoveEnd",
                       nullptr, OHInputInjectKeyEventKeycodeMoveEnd,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeInsert",
                       nullptr, OHInputInjectKeyEventKeycodeInsert,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeForward",
                       nullptr, OHInputInjectKeyEventKeycodeForward,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMediaPlay",
                       nullptr, OHInputInjectKeyEventKeycodeMediaPlay,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMediaPause",
                       nullptr, OHInputInjectKeyEventKeycodeMediaPause,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMediaClose",
                       nullptr, OHInputInjectKeyEventKeycodeMediaClose,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMediaEject",
                       nullptr, OHInputInjectKeyEventKeycodeMediaEject,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMediaRecord",
                       nullptr, OHInputInjectKeyEventKeycodeMediaRecord,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodePageDown",
                       nullptr, OHInputInjectKeyEventKeycodePageDown,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeEscape",
                       nullptr, OHInputInjectKeyEventKeycodeEscape,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeForwardDel",
                       nullptr, OHInputInjectKeyEventKeycodeForwardDel,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeMetaRight",
                       nullptr, OHInputInjectKeyEventKeycodeMetaRight,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeFunction",
                       nullptr, OHInputInjectKeyEventKeycodeFunction,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeSysrq",
                       nullptr, OHInputInjectKeyEventKeycodeSysrq,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest8(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadEquals",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadEquals,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadComma",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadComma,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHInputInjectKeyEventKeycodeNumpadEnter",
                       nullptr, OHInputInjectKeyEventKeycodeNumpadEnter,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addSetKeyEventKeyCodeTest(std::vector<napi_property_descriptor>& descData)
{
    addSetKeyEventKeyCodeTest1(descData);
    addSetKeyEventKeyCodeTest2(descData);
    addSetKeyEventKeyCodeTest3(descData);
    addSetKeyEventKeyCodeTest4(descData);
    addSetKeyEventKeyCodeTest5(descData);
    addSetKeyEventKeyCodeTest6(descData);
    addSetKeyEventKeyCodeTest7(descData);
    addSetKeyEventKeyCodeTest8(descData);
}
