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
#include "multimedia/image_framework/image/pixelmap_native.h"
#include "hilog/log.h"
#include <bits/alltypes.h>
#include <thread>
#include <iostream>

#undef LOG_TAG
#define LOG_TAG "MMI"

const int GLOBAL_RESMGR = 0xFF00;
const char *TAG = "[SensorCapiSample]";
const uint32_t LENGTH = 128;
const int FOCUS = 129;

static napi_value GetPointerLocation1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t displayId;
    double displayX;
    double displayY;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, &displayY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION ||
        retResult == INPUT_DEVICE_NO_POINTER || retResult == INPUT_APP_NOT_FOCUSED) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation2(napi_env env, napi_callback_info info)
{
    napi_value result;

    double displayX;
    double displayY;
    Input_Result retResult = OH_Input_GetPointerLocation(nullptr, &displayX, &displayY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation3(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t displayId;
    double displayY;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, nullptr, &displayY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0300 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation4(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t displayId;
    double displayX;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0400 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation5(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_GetPointerLocation(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0500 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RequestInjection1(napi_env env, napi_callback_info info)
{
    napi_value result;

    auto fnCallBack = [](Input_InjectionStatus authorizedStatus) {
        OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_RequestInjection_0100 authorizedStatus:%{public}d", authorizedStatus);
    };
    Input_Result retResult = OH_Input_RequestInjection(fnCallBack);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_RequestInjection_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        (retResult == 801 || retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION ||
        retResult == INPUT_INJECTION_AUTHORIZING || retResult == INPUT_INJECTION_AUTHORIZED_OTHERS ||
        retResult == INPUT_INJECTION_OPERATION_FREQUENT || retResult == INPUT_INJECTION_AUTHORIZED) ? 1 : 0, &result);
    return result;
}

static napi_value QueryAuthorizedStatus1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_InjectionStatus status;
    Input_Result retResult = OH_Input_QueryAuthorizedStatus(&status);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryAuthorizedStatus_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        ((retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION) &&
        (status == UNAUTHORIZED || status == AUTHORIZING)) ? 1 : 0, &result);
    return result;
}

static napi_value InjectMouseEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalX(mouseEvent, 100);
    OH_Input_SetMouseEventGlobalY(mouseEvent, 100);
    int32_t retResult = OH_Input_InjectMouseEventGlobal(mouseEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectMouseEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (mouseEvent != nullptr && retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value InjectMouseEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalX(mouseEvent, 100);
    int32_t globalX = OH_Input_GetMouseEventGlobalX(mouseEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectMouseEventGlobal_0200 globalX:%{public}d", globalX);
    napi_create_int32(env, (mouseEvent != nullptr && globalX == 100) ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value InjectMouseEventGlobal3(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalY(mouseEvent, 100);
    int32_t globalY = OH_Input_GetMouseEventGlobalY(mouseEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectMouseEventGlobal_0300 globalY:%{public}d", globalY);
    napi_create_int32(env, (mouseEvent != nullptr && globalY == 100) ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value SetPointerVisible1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_SetPointerVisible(false);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_DEVICE_NOT_SUPPORTED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value SetPointerVisible2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_SetPointerVisible(true);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_DEVICE_NOT_SUPPORTED ||
                      retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerStyle1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = -1;
    int32_t pointerStyle = -1;
    Input_Result retResult = OH_Input_GetPointerStyle(windowId, &pointerStyle);
    napi_create_int32(env, ((retResult == INPUT_SUCCESS && (pointerStyle == 0 || pointerStyle == 1))
                      || retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerStyle2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = 100000;
    int32_t pointerStyle = -1;
    int32_t cursorStyle = 48;
    Input_Result retResult = OH_Input_GetPointerStyle(windowId, &pointerStyle);
    napi_create_int32(env, ((retResult == INPUT_SUCCESS && pointerStyle >= -1 && pointerStyle <= cursorStyle)
                      || retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerStyle3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = -2;
    int32_t pointerStyle = -1;
    Input_Result retResult = OH_Input_GetPointerStyle(windowId, &pointerStyle);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerStyle4(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = 0;
    Input_Result retResult = OH_Input_GetPointerStyle(windowId, nullptr);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetPointerStyle1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = -1;
    int32_t pointerStyle = 1;
    Input_Result retResult = OH_Input_SetPointerStyle(windowId, pointerStyle);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetPointerStyle2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = 100000;
    int32_t pointerStyle = 1;
    int32_t pointerStyle1 = -1;
    Input_Result retResult1 = OH_Input_SetPointerStyle(windowId, pointerStyle);
    Input_Result retResult2 = OH_Input_GetPointerStyle(windowId, &pointerStyle1);
    napi_create_int32(env, (retResult1 == INPUT_SUCCESS || retResult1 == INPUT_SERVICE_EXCEPTION) &&
                      ((retResult2 == INPUT_SUCCESS && pointerStyle1 == 1)  ||
                      retResult2 == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value SetPointerStyle3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = 0;
    int32_t pointerStyle = -1;
    Input_Result retResult = OH_Input_SetPointerStyle(windowId, pointerStyle);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value SetPointerStyle5(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t windowId = 0;
    Input_PointerStyle pointerStyle = Input_PointerStyle::SCREENRECORDER_CURSOR;
    int32_t pointerStyle1 = -1;
    int32_t cursorStyle = 48;
    Input_Result retResult1 = OH_Input_SetPointerStyle(windowId, pointerStyle);
    Input_Result retResult2 = OH_Input_GetPointerStyle(windowId, &pointerStyle1);
    napi_create_int32(env, (retResult1 == INPUT_SUCCESS || retResult1 == INPUT_SERVICE_EXCEPTION) &&
                      ((retResult2 == INPUT_SUCCESS && pointerStyle1 == cursorStyle)  ||
                      retResult2 == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    
    return result;
}

static napi_value CustomCursor1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(nullptr, 0, 0);
    napi_create_int32(env, (customCursor == nullptr) ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    return result;
}

static napi_value CustomCursor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    int32_t result1 = customCursor != nullptr ? 1 : 0;
    OH_Input_CustomCursor_Destroy(&customCursor);
    int32_t result2 = customCursor == nullptr ? 1 : 0;
    napi_create_int32(env, (result1 == 1 && result2 == 1) ? 1 : 0, &result);
    return result;
}

static napi_value CustomCursor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap;
    Input_Result retResult = OH_Input_CustomCursor_GetPixelMap(nullptr, &pixelmap);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value CustomCursor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    Input_Result retResult = OH_Input_CustomCursor_GetPixelMap(customCursor, nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    return result;
}

static napi_value CustomCursor5(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t anchorX;
    int32_t anchorY;
    Input_Result retResult = OH_Input_CustomCursor_GetAnchor(nullptr, &anchorX, &anchorY);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value CustomCursor6(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    int32_t anchorY;
    Input_Result retResult = OH_Input_CustomCursor_GetAnchor(customCursor, nullptr, &anchorY);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    return result;
}

static napi_value CustomCursor7(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    int32_t anchorX;
    Input_Result retResult = OH_Input_CustomCursor_GetAnchor(customCursor, &anchorX, nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    return result;
}

static napi_value CustomCursor8(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(true);
    bool isfollowSystem = false;
    Input_Result retResult = OH_Input_CursorConfig_IsFollowSystem(cursorConfig, &isfollowSystem);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && isfollowSystem == true) ? 1 : 0, &result);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor9(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool isfollowSystem = false;
    Input_Result retResult = OH_Input_CursorConfig_IsFollowSystem(nullptr, &isfollowSystem);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value CustomCursor10(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(true);
    Input_Result retResult = OH_Input_CursorConfig_IsFollowSystem(cursorConfig, nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor11(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(false);
    bool isfollowSystem = true;
    Input_Result retResult = OH_Input_CursorConfig_IsFollowSystem(cursorConfig, &isfollowSystem);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && isfollowSystem == false) ? 1 : 0, &result);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor12(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    bool isfollowSystem = true;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(isfollowSystem);
    int32_t windowId = -1;
    Input_Result retResult = OH_Input_SetCustomCursor(windowId, customCursor, cursorConfig);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ||
    retResult == INPUT_DEVICE_NOT_SUPPORTED ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor13(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    bool isfollowSystem = true;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(isfollowSystem);
    int32_t windowId = 10000;
    Input_Result retResult1 = OH_Input_SetCustomCursor(windowId, customCursor, cursorConfig);
    int32_t pointerStyle = -1;
    Input_Result retResult2 = OH_Input_GetPointerStyle(windowId, &pointerStyle);
    napi_create_int32(env, ((retResult1 == INPUT_INVALID_WINDOWID || retResult1 == INPUT_DEVICE_NOT_SUPPORTED) &&
        retResult2 == INPUT_SUCCESS && pointerStyle == 0) ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CursorInfo1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    napi_create_int32(env, cursorInfo != nullptr ? 1 : 0, &result);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    napi_create_int32(env, cursorInfo == nullptr ? 1 : 0, &result);
    return result;
}

static napi_value CursorInfo3(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool visible;
    Input_PointerStyle pointerStyle;
    int32_t sizeLevel;
    uint32_t color;
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    Input_Result retResult1 = OH_Input_CursorInfo_IsVisible(cursorInfo, &visible);
    Input_Result retResult2 = OH_Input_CursorInfo_GetStyle(cursorInfo, &pointerStyle);
    Input_Result retResult3 = OH_Input_CursorInfo_GetSizeLevel(cursorInfo, &sizeLevel);
    Input_Result retResult4 = OH_Input_CursorInfo_GetColor(cursorInfo, &color);
    napi_create_int32(env, retResult1 == INPUT_SUCCESS && visible == false && retResult2 == INPUT_PARAMETER_ERROR &&
                      retResult3 == INPUT_PARAMETER_ERROR && retResult4 == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo4(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool visible;
    Input_PointerStyle pointerStyle;
    int32_t sizeLevel;
    uint32_t color;
    Input_Result retResult1 = OH_Input_CursorInfo_IsVisible(nullptr, &visible);
    Input_Result retResult2 = OH_Input_CursorInfo_GetStyle(nullptr, &pointerStyle);
    Input_Result retResult3 = OH_Input_CursorInfo_GetSizeLevel(nullptr, &sizeLevel);
    Input_Result retResult4 = OH_Input_CursorInfo_GetColor(nullptr, &color);
    napi_create_int32(env, retResult1 == INPUT_PARAMETER_ERROR && retResult2 == INPUT_PARAMETER_ERROR &&
                      retResult3 == INPUT_PARAMETER_ERROR && retResult4 == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value CursorInfo5(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    Input_Result retResult1 = OH_Input_CursorInfo_IsVisible(cursorInfo, nullptr);
    Input_Result retResult2 = OH_Input_CursorInfo_GetStyle(cursorInfo, nullptr);
    Input_Result retResult3 = OH_Input_CursorInfo_GetSizeLevel(cursorInfo, nullptr);
    Input_Result retResult4 = OH_Input_CursorInfo_GetColor(cursorInfo, nullptr);
    napi_create_int32(env, retResult1 == INPUT_PARAMETER_ERROR && retResult2 == INPUT_PARAMETER_ERROR &&
                      retResult3 == INPUT_PARAMETER_ERROR && retResult4 == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo6(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    Input_Result retResult = OH_Input_GetMouseEventCursorInfo(mouseEvent, cursorInfo);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo7(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    Input_Result retResult = OH_Input_GetMouseEventCursorInfo(nullptr, cursorInfo);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo8(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    Input_Result retResult = OH_Input_GetMouseEventCursorInfo(mouseEvent, nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value CursorInfo9(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    Input_Result retResult = OH_Input_GetCursorInfo(cursorInfo, nullptr);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo10(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_Result retResult = OH_Input_GetCursorInfo(nullptr, &pixelmap1);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_PixelmapInitializationOptions_Release(options);
    OH_PixelmapNative_Release(pixelmap1);
    OH_PixelmapNative_Destroy(&pixelmap1);
    return result;
}

static napi_value CursorInfo11(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_GetCursorInfo(nullptr, nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value CursorInfo12(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    Input_Result retResult = OH_Input_GetCursorInfo(cursorInfo, &pixelmap1);
    napi_create_int32(env, retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION ? 1 : 0, &result);
    OH_PixelmapInitializationOptions_Release(options);
    OH_PixelmapNative_Release(pixelmap1);
    OH_PixelmapNative_Destroy(&pixelmap1);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CursorInfo13(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool visible;
    Input_PointerStyle pointerStyle;
    int32_t sizeLevel;
    uint32_t color;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CursorInfo *cursorInfo = OH_Input_CursorInfo_Create();
    OH_Input_GetCursorInfo(cursorInfo, &pixelmap1);
    Input_Result retResult1 = OH_Input_CursorInfo_IsVisible(cursorInfo, &visible);
    Input_Result retResult2 = OH_Input_CursorInfo_GetStyle(cursorInfo, &pointerStyle);
    Input_Result retResult3 = OH_Input_CursorInfo_GetSizeLevel(cursorInfo, &sizeLevel);
    Input_Result retResult4 = OH_Input_CursorInfo_GetColor(cursorInfo, &color);
    if (visible == false) {
        napi_create_int32(env, retResult1 == INPUT_SUCCESS && retResult2 == INPUT_PARAMETER_ERROR &&
                      retResult3 == INPUT_PARAMETER_ERROR && retResult4 == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    } else {
        napi_create_int32(env, retResult1 == INPUT_SUCCESS && retResult2 == INPUT_SUCCESS &&
                      retResult3 == INPUT_SUCCESS && retResult4 == INPUT_SUCCESS ? 1 : 0, &result);
    }
    OH_PixelmapInitializationOptions_Release(options);
    OH_PixelmapNative_Release(pixelmap1);
    OH_PixelmapNative_Destroy(&pixelmap1);
    OH_Input_CursorInfo_Destroy(&cursorInfo);
    return result;
}

static napi_value CustomCursor14(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    bool isfollowSystem = true;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(isfollowSystem);
    int32_t windowId = 0;
    Input_Result retResult = OH_Input_SetCustomCursor(windowId, customCursor, cursorConfig);
    napi_create_int32(env, retResult == INPUT_SUCCESS ||
    retResult == INPUT_DEVICE_NOT_SUPPORTED ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor15(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, FOCUS, FOCUS);
    bool isfollowSystem = true;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(isfollowSystem);
    int32_t windowId = 0;
    Input_Result retResult = OH_Input_SetCustomCursor(windowId, customCursor, cursorConfig);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ||
    retResult == INPUT_SERVICE_EXCEPTION ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor16(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_CursorConfig *cursorConfig = OH_Input_CursorConfig_Create(false);
    napi_create_int32(env, cursorConfig != nullptr ? 1 : 0, &result);
    OH_Input_CursorConfig_Destroy(&cursorConfig);
    return result;
}

static napi_value CustomCursor17(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    int32_t anchorX;
    int32_t anchorY;
    Input_Result retResult = OH_Input_CustomCursor_GetAnchor(customCursor, &anchorX, &anchorY);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    return result;
}

static napi_value CustomCursor18(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative *pixelmap1 = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, LENGTH);
    OH_PixelmapInitializationOptions_SetHeight(options, LENGTH);
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap1);
    Input_CustomCursor *customCursor = OH_Input_CustomCursor_Create(pixelmap1, 0, 0);
    Input_Result retResult = OH_Input_CustomCursor_GetPixelMap(customCursor, &pixelmap1);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_CustomCursor_Destroy(&customCursor);
    return result;
}

static napi_value CreateDeviceInfo1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    napi_create_int32(env, (deviceInfo != nullptr) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value CreateHotkey1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Hotkey *hotkey = OH_Input_CreateHotkey();
    napi_create_int32(env, (hotkey != nullptr) ? 1 : 0, &result);
    OH_Input_DestroyHotkey(&hotkey);
    return result;
}

static napi_value GetInterSinceLastInput1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int64_t retResult = OH_Input_GetIntervalSinceLastInput(nullptr);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ||
    retResult == INPUT_SERVICE_EXCEPTION ? 1 : 0, &result);
    return result;
}

static napi_value RemoveKeyEventHook1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_RemoveKeyEventHook(nullptr);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value DispatchToNextHandler1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t eventId1 = -1;
    int32_t eventId2 = 0;
    int32_t eventId3 = 1;
    int32_t eventId4 = 2147483647;
    Input_Result retResult1 = OH_Input_DispatchToNextHandler(eventId1);
    Input_Result retResult2 = OH_Input_DispatchToNextHandler(eventId2);
    Input_Result retResult3 = OH_Input_DispatchToNextHandler(eventId3);
    Input_Result retResult4 = OH_Input_DispatchToNextHandler(eventId4);
    napi_create_int32(env,
        (retResult1 == INPUT_PARAMETER_ERROR || retResult1 == INPUT_SERVICE_EXCEPTION) &&
        (retResult2 == INPUT_PARAMETER_ERROR || retResult2 == INPUT_SERVICE_EXCEPTION) &&
        (retResult3 == INPUT_PARAMETER_ERROR || retResult3 == INPUT_SERVICE_EXCEPTION) &&
        (retResult4 == INPUT_PARAMETER_ERROR || retResult4 == INPUT_SERVICE_EXCEPTION)
         ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyEventId(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t eventId;
    Input_Result retResult = OH_Input_GetKeyEventId(nullptr, &eventId);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

EXTERN_C_START
static napi_property_descriptor desc_part1[] = {
    {"GetPointerLocation1", nullptr, GetPointerLocation1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerLocation2", nullptr, GetPointerLocation2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerLocation3", nullptr, GetPointerLocation3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerLocation4", nullptr, GetPointerLocation4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerLocation5", nullptr, GetPointerLocation5, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RequestInjection1", nullptr, RequestInjection1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"QueryAuthorizedStatus1", nullptr, QueryAuthorizedStatus1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"InjectMouseEventGlobal1", nullptr, InjectMouseEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"InjectMouseEventGlobal2", nullptr, InjectMouseEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"InjectMouseEventGlobal3", nullptr, InjectMouseEventGlobal3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPointerVisible1", nullptr, SetPointerVisible1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPointerVisible2", nullptr, SetPointerVisible2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerStyle1", nullptr, GetPointerStyle1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerStyle2", nullptr, GetPointerStyle2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerStyle3", nullptr, GetPointerStyle3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetPointerStyle4", nullptr, GetPointerStyle4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPointerStyle1", nullptr, SetPointerStyle1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPointerStyle2", nullptr, SetPointerStyle2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPointerStyle3", nullptr, SetPointerStyle3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPointerStyle5", nullptr, SetPointerStyle5, nullptr, nullptr, nullptr, napi_default, nullptr},
};

static napi_property_descriptor desc_part2[] = {
    {"CustomCursor1", nullptr, CustomCursor1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor2", nullptr, CustomCursor2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor3", nullptr, CustomCursor3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor4", nullptr, CustomCursor4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor5", nullptr, CustomCursor5, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor6", nullptr, CustomCursor6, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor7", nullptr, CustomCursor7, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor8", nullptr, CustomCursor8, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor9", nullptr, CustomCursor9, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor10", nullptr, CustomCursor10, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor11", nullptr, CustomCursor11, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor12", nullptr, CustomCursor12, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor13", nullptr, CustomCursor13, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo1", nullptr, CursorInfo1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo2", nullptr, CursorInfo2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo3", nullptr, CursorInfo3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo4", nullptr, CursorInfo4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo5", nullptr, CursorInfo5, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo6", nullptr, CursorInfo6, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo7", nullptr, CursorInfo7, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo8", nullptr, CursorInfo8, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo9", nullptr, CursorInfo9, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo10", nullptr, CursorInfo10, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo11", nullptr, CursorInfo11, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo12", nullptr, CursorInfo12, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CursorInfo13", nullptr, CursorInfo13, nullptr, nullptr, nullptr, napi_default, nullptr},
};

static napi_property_descriptor desc_part3[] = {
    {"CustomCursor14", nullptr, CustomCursor14, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor15", nullptr, CustomCursor15, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor16", nullptr, CustomCursor16, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor17", nullptr, CustomCursor17, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CustomCursor18", nullptr, CustomCursor18, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CreateDeviceInfo1", nullptr, CreateDeviceInfo1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CreateHotkey1", nullptr, CreateHotkey1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetInterSinceLastInput1", nullptr, GetInterSinceLastInput1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RemoveKeyEventHook1", nullptr, RemoveKeyEventHook1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DispatchToNextHandler1", nullptr, DispatchToNextHandler1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"GetKeyEventId", nullptr, GetKeyEventId, nullptr, nullptr, nullptr, napi_default, nullptr},
};

static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc_part1) / sizeof(desc_part1[0]), desc_part1);
    napi_define_properties(env, exports, sizeof(desc_part2) / sizeof(desc_part2[0]), desc_part2);
    napi_define_properties(env, exports, sizeof(desc_part3) / sizeof(desc_part3[0]), desc_part3);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libmousendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}