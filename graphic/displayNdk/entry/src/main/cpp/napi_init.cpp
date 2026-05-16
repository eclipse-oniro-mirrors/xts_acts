/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <cstddef>
#include <cstdint>
#include <cstdio>
#define LOG_TAG "DisplayManager_NDK"
#include <hilog/log.h>
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_7 7
#define PARAM_8 8
#define PARAM_9 9
#define PARAM_202 202
#define PARAM_1400002 1400002

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value ThrowError(napi_env env, uint32_t errCode, const char* errorMessage)
{
    OH_LOG_ERROR(LOG_APP, "ThrowError=%{public}d mdErrorMessage=%{public}s.", errCode, errorMessage);
    napi_value errorInfo = nullptr;
    napi_create_object(env, &errorInfo);
    if (errorInfo == nullptr) {
        napi_value result = nullptr;
        napi_get_undefined(env, &result);
        return result;
    }
    napi_value errorCode = nullptr;
    
    napi_create_uint32(env, errCode, &errorCode);
    napi_set_named_property(env, errorInfo, "code", errorCode);
    napi_value errMsg = nullptr;
    napi_create_string_utf8(env, errorMessage, NAPI_AUTO_LENGTH, &errMsg);
    napi_set_named_property(env, errorInfo, "message", errMsg);
    napi_create_error(env, errorCode, errMsg, &errorInfo);
    napi_value error = nullptr;
    napi_create_type_error(env, errorCode, errMsg, &error);
    
    return error;
}

static napi_value GetDefaultDisplayId(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayId come in...");
    uint64_t displayId;
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayId displayId=%{public}lu ", displayId);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayId(&displayId);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayId displayId=%{public}lu errorCode=%{public}d.", displayId, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value id;
        napi_create_uint32(env, displayId, &id);
        return id;
    }
    return ThrowError(env,errCode, "get default display id failed.");
}

static napi_value GetDefaultDisplayWidth(napi_env env, napi_callback_info info)
{
    int32_t displayWidth;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayWidth(&displayWidth);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayWidth width=%{public}d errorCode=%{public}d.", displayWidth, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value width;
        napi_create_int32(env, displayWidth, &width);
        return width;
    }
    return ThrowError(env,errCode, "get default display width failed.");
}

static napi_value GetDefaultDisplayHeight(napi_env env, napi_callback_info info)
{
    int32_t displayHeight;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayHeight(&displayHeight);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayHeight height=%{public}d errorCode=%{public}d.", displayHeight, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value height;
        napi_create_int32(env, displayHeight, &height);
        return height;
    }
    return ThrowError(env,errCode, "get default display height failed.");
}

static napi_value GetDefaultDisplayRotation(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value rotation;
        napi_create_int32(env, displayRotation, &rotation);
        return rotation;
    } else {
        napi_value errorCode;
        napi_create_int32(env, errCode, &errorCode);
        return errorCode;  
    }
}

static napi_value GetDefaultDisplayOrientation(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayOrientation orientation=%{public}d errorCode=%{public}d.",
        displayOrientation, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value orientation;
        napi_create_int32(env, displayOrientation, &orientation);
        return orientation;
    }
    return ThrowError(env,errCode, "get default display orientation failed.");
}

static napi_value GetDefaultDisplayVirtualPixelRatio(napi_env env, napi_callback_info info)
{
    float dmVirtualPixels;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio(&dmVirtualPixels);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayVirtualPixelRatio dmVirtualPixels=%{public}f errorCode=%{public}d.",
        dmVirtualPixels, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value virtualPixels;
        napi_create_int32(env, dmVirtualPixels, &virtualPixels);
        return virtualPixels;
    }
    return ThrowError(env,errCode, "get default display virtual pixel failed.");
}

static napi_value GetDefaultDisplayRefreshRate(napi_env env, napi_callback_info info)
{
    uint32_t dmRefreshRate;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayRefreshRate(&dmRefreshRate);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayRefreshRate dmRefreshRate=%{public}d errorCode=%{public}d.", dmRefreshRate,
        errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value refreshRate;
        napi_create_int32(env, dmRefreshRate, &refreshRate);
        return refreshRate;
    }
    return ThrowError(env,errCode, "get default display refresh rate failed.");
}

static napi_value GetDefaultDisplayDensityDpi(napi_env env, napi_callback_info info)
{
    int32_t dmDensityDpi;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityDpi(&dmDensityDpi);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayDensityDpi dmDensityDpi=%{public}d errorCode=%{public}d.", dmDensityDpi,
        errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value densityDpi;
        napi_create_int32(env, dmDensityDpi, &densityDpi);
        return densityDpi;
    }
    return ThrowError(env,errCode, "get default display density dpi failed.");
}

static napi_value GetDefaultDisplayDensityPixels(napi_env env, napi_callback_info info)
{
    float dmDensityPixels;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityPixels(&dmDensityPixels);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayDensityPixels dmDensityPixels=%{public}f errorCode=%{public}d.",
        dmDensityPixels, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value densityPixels;
        napi_create_int32(env, dmDensityPixels, &densityPixels);
        return densityPixels;
    }
    return ThrowError(env,errCode, "get default display density pixels failed.");
}

static napi_value GetDefaultDisplayScaledDensity(napi_env env, napi_callback_info info)
{
    float dmScaledDensity;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayScaledDensity(&dmScaledDensity);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayScaledDensity dmDensityPixels=%{public}f errorCode=%{public}d.",
        dmScaledDensity, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value scaledDensity;
        napi_create_int32(env, dmScaledDensity, &scaledDensity);
        return scaledDensity;
    }
    return ThrowError(env,errCode, "get default display density pixels failed.");
}

static napi_value GetDefaultDisplayDensityXdpi(napi_env env, napi_callback_info info)
{
    float dmxDpi;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi(&dmxDpi);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayDensityXdpi dmxDpi =%{public}f errorCode=%{public}d.", dmxDpi, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value xDpi;
        napi_create_int32(env, dmxDpi, &xDpi);
        return xDpi;
    }
    return ThrowError(env,errCode, "get default display xDPI failed.");
}

static napi_value GetDefaultDisplayDensityYdpi(napi_env env, napi_callback_info info)
{
    float dmyDpi;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi(&dmyDpi);
    OH_LOG_INFO(LOG_APP, "GetDefaultDisplayDensityYdpi dmyDpi =%{public}f errorCode=%{public}d.", dmyDpi, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value xDpi;
        napi_create_int32(env, dmyDpi, &xDpi);
        return xDpi;
    }
    return ThrowError(env,errCode, "get default display xDPI failed.");
}

static napi_value CreateDefaultDisplayCutoutInfo(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_CutoutInfo *cutOutInfo = NULL;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo(&cutOutInfo);
    OH_LOG_INFO(LOG_APP, "GetDefaultCutoutInfo errCode=%{public}d", errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        if (cutOutInfo != NULL && cutOutInfo->boundingRectsLength != 0) {
            OH_LOG_INFO(LOG_APP, "GetDefaultCutoutInfo cutOutInfo length=%{public}d", cutOutInfo->boundingRectsLength);
            for (int i = 0; i < cutOutInfo->boundingRectsLength; i++) {
                OH_LOG_INFO(LOG_APP, "cutOutInfo[%{public}d]=[%{public}d %{public}d %{public}d %{public}d]",
                    i, cutOutInfo->boundingRects[i].left, cutOutInfo->boundingRects[i].top,
                    cutOutInfo->boundingRects[i].width, cutOutInfo->boundingRects[i].height);
            }
            OH_LOG_INFO(LOG_APP, "cutOutInfo waterfall left rect=[%{public}d %{public}d %{public}d %{public}d]",
            cutOutInfo->waterfallDisplayAreaRects.left.left, cutOutInfo->waterfallDisplayAreaRects.left.top,
            cutOutInfo->waterfallDisplayAreaRects.left.left, cutOutInfo->waterfallDisplayAreaRects.left.left);
            OH_LOG_INFO(LOG_APP, "cutOutInfo waterfall top rect=[%{public}d %{public}d %{public}d %{public}d]",
            cutOutInfo->waterfallDisplayAreaRects.top.left, cutOutInfo->waterfallDisplayAreaRects.top.top,
            cutOutInfo->waterfallDisplayAreaRects.top.left, cutOutInfo->waterfallDisplayAreaRects.top.left);
            OH_LOG_INFO(LOG_APP, "cutOutInfo waterfall right rect=[%{public}d %{public}d %{public}d %{public}d]",
            cutOutInfo->waterfallDisplayAreaRects.right.left, cutOutInfo->waterfallDisplayAreaRects.right.top,
            cutOutInfo->waterfallDisplayAreaRects.right.left, cutOutInfo->waterfallDisplayAreaRects.right.left);
            OH_LOG_INFO(LOG_APP, "cutOutInfo waterfall bottom rect=[%{public}d %{public}d %{public}d %{public}d]",
            cutOutInfo->waterfallDisplayAreaRects.bottom.left, cutOutInfo->waterfallDisplayAreaRects.bottom.top,
            cutOutInfo->waterfallDisplayAreaRects.bottom.left, cutOutInfo->waterfallDisplayAreaRects.bottom.left);            
        }
        napi_value boundingRectsLength;
        napi_create_int32(env, cutOutInfo->boundingRectsLength, &boundingRectsLength);
        OH_NativeDisplayManager_DestroyDefaultDisplayCutoutInfo(cutOutInfo);   
        return boundingRectsLength;
    } else {
        napi_value errorCode;
        napi_create_int32(env, errCode, &errorCode);
        return errorCode;  
    }
}

static napi_value IsFoldable(napi_env env, napi_callback_info info)
{
    bool isFoldDevice = OH_NativeDisplayManager_IsFoldable();
    OH_LOG_INFO(LOG_APP, "IsFoldable isFoldDevice =%{public}d.", isFoldDevice);
    napi_value isFold;
    napi_get_boolean(env, isFoldDevice, &isFold);
    return isFold;
}

static napi_value GetFoldDisplayMode(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_FoldDisplayMode displayMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetFoldDisplayMode(&displayMode);
    OH_LOG_INFO(LOG_APP, "GetFoldDisplayMode displayMode =%{public}d errorCode=%{public}d.", displayMode, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value currentMode;
        napi_create_int32(env, displayMode, &currentMode);
        return currentMode;
    } else {
        napi_value errorCode;
        napi_create_int32(env, errCode, &errorCode);
        return errorCode;  
    }
}

void DisplayChangeCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "DisplayChangeCallback displayId=%{public}lu.", displayId);
}

static napi_value RegisterDisplayChangeListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterDisplayChangeListener(
        DisplayChangeCallback, &listenerIndex);
    OH_LOG_INFO(LOG_APP, "RegisterDisplayChangeListener listenerIndex =%{public}d errCode=%{public}d.",
        listenerIndex, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value registerIndex;
        napi_create_int32(env, listenerIndex, &registerIndex);
        return registerIndex;
    } else {
        napi_value errorCode;
        napi_create_int32(env, errCode, &errorCode);
        return errorCode;  
    }
}

static napi_value UnregisterDisplayChangeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };

    uint32_t listenerIndex;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &listenerIndex);
    OH_LOG_INFO(LOG_APP, "UnregisterDisplayChangeListener listenerIndex =%{public}d.", listenerIndex);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterDisplayChangeListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "UnregisterDisplayChangeListener errCode=%{public}d.", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

void FoldDisplayModeChangeCallback(NativeDisplayManager_FoldDisplayMode displayMode)
{
    OH_LOG_INFO(LOG_APP, "displayMode=%{public}d.", displayMode);
}

static napi_value RegisterFoldDisplayModeChangeListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener(
        FoldDisplayModeChangeCallback, &listenerIndex);
    OH_LOG_INFO(LOG_APP, "listenerIndex =%{public}d errCode=%{public}d.",
        listenerIndex, errCode);
    if (errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK) {
        napi_value registerIndex;
        napi_create_int32(env, listenerIndex, &registerIndex);
        return registerIndex;
    } else {
        napi_value errorCode;
        napi_create_int32(env, errCode, &errorCode);
        return errorCode;  
    }
}

static napi_value UnregisterFoldDisplayModeChangeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t listenerIndex;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &listenerIndex);
    OH_LOG_INFO(LOG_APP, "listenerIndex =%{public}d.", listenerIndex);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value CreateAvailableArea(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rect *availableAreaInfo;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateAvailableArea(0, &availableAreaInfo);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "left=%{public}d", availableAreaInfo->left);
    OH_LOG_INFO(LOG_APP, "top=%{public}d", availableAreaInfo->top);
    OH_LOG_INFO(LOG_APP, "width=%{public}d", availableAreaInfo->width);
    OH_LOG_INFO(LOG_APP, "height=%{public}d", availableAreaInfo->height);
    napi_value result;
    napi_create_object(env, &result);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    napi_set_named_property(env, result, "errcode", errorCode);
    napi_value left;
    napi_create_int32(env, availableAreaInfo->left, &left);
    napi_set_named_property(env, result, "left", left);
    napi_value top;
    napi_create_int32(env, availableAreaInfo->top, &top);
    napi_set_named_property(env, result, "top", top);
    napi_value width;
    napi_create_int32(env, availableAreaInfo->width, &width);
    napi_set_named_property(env, result, "width", width);
    napi_value height;
    napi_create_int32(env, availableAreaInfo->height, &height);
    napi_set_named_property(env, result, "height", height);
    return result;
}

static napi_value CreateAvailableArea_ErrCode140004(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rect *availableAreaInfo;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateAvailableArea(-1, &availableAreaInfo);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value DestroyAvailableArea(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rect *availableAreaInfo;
    OH_NativeDisplayManager_CreateAvailableArea(0, &availableAreaInfo);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_DestroyAvailableArea(availableAreaInfo);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value GetDisplaySourceMode_1(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(0, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    if (errCode != 0) {
        napi_create_int32(env, errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

static napi_value GetDisplaySourceMode_2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    int64_t displayId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int64(env, args[0], &displayId);
    OH_LOG_INFO(LOG_APP, "displayId =%{public}d.", displayId);
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(displayId,
        &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    if (errCode != 0) {
        napi_create_int32(env, errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

static napi_value GetDisplaySourceMode_4(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    int64_t displayId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int64(env, args[0], &displayId);
    OH_LOG_INFO(LOG_APP, "displayId =%{public}d.", displayId);
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(displayId,
        &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value result;
    if (errCode != 0) {
        napi_create_int32(env, errCode, &result);
    } else {
        OH_LOG_INFO(LOG_APP, "displaySourceMode=%{public}d", displaySourceMode);
        napi_create_int32(env, displaySourceMode, &result);
    }
    return result;
}

static napi_value GetDisplaySourceMode_ErrCode140004(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_SourceMode displaySourceMode;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplaySourceMode(-1, &displaySourceMode);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value GetDisplayPosition(napi_env env, napi_callback_info info)
{
    int32_t x;
    int32_t y;
    uint64_t displayId = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplayPosition(displayId, &x, &y);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "x=%{public}d", x);
    OH_LOG_INFO(LOG_APP, "y=%{public}d", y);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value GetDisplayPosition_ErrCode140004(napi_env env, napi_callback_info info)
{
    int32_t x;
    int32_t y;
    uint64_t displayId = -1;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_GetDisplayPosition(displayId, &x, &y);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "x=%{public}d", x);
    OH_LOG_INFO(LOG_APP, "y=%{public}d", y);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

void AvailableAreaChangeCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "AvailableAreaChangeCallback displayId=%{public}lu.", displayId);
}


static napi_value RegisterAvailableAreaChangeListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterAvailableAreaChangeListener(
        AvailableAreaChangeCallback, &listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener(listenerIndex);
    return errorCode;
}

static napi_value UnregisterAvailableAreaChangeListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    OH_NativeDisplayManager_RegisterAvailableAreaChangeListener(AvailableAreaChangeCallback, &listenerIndex);
    NativeDisplayManager_ErrorCode errCode =
    OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value UnregisterAvailableAreaChangeListener_ErrCode140004(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode =
        OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

void DisplayAddCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "DisplayAddCallback displayId=%{public}lu.", displayId);
}

static napi_value RegisterDisplayAddListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_RegisterDisplayAddListener(DisplayAddCallback,
        &listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    OH_NativeDisplayManager_UnregisterDisplayAddListener(listenerIndex);
    return errorCode;
}

static napi_value UnregisterDisplayAddListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    OH_NativeDisplayManager_RegisterDisplayAddListener(DisplayAddCallback, &listenerIndex);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterDisplayAddListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value UnregisterDisplayAddListener_ErrCode140004(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterDisplayAddListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

void DisplayRemoveCallback(uint64_t displayId)
{
    OH_LOG_INFO(LOG_APP, "DisplayRemoveCallback displayId=%{public}lu.", displayId);
}

static napi_value RegisterDisplayRemoveListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode =
        OH_NativeDisplayManager_RegisterDisplayRemoveListener(DisplayRemoveCallback, &listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    OH_NativeDisplayManager_UnregisterDisplayRemoveListener(listenerIndex);
    return errorCode;
}

static napi_value UnregisterDisplayRemoveListener(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    OH_NativeDisplayManager_RegisterDisplayRemoveListener(DisplayRemoveCallback, &listenerIndex);
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterDisplayRemoveListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

static napi_value RegisterDisplayRemoveListener_ErrCode140004(napi_env env, napi_callback_info info)
{
    uint32_t listenerIndex = 0;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_UnregisterDisplayRemoveListener(listenerIndex);
    OH_LOG_INFO(LOG_APP, "errorCode=%{public}d", errCode);
    napi_value errorCode;
    napi_create_int32(env, errCode, &errorCode);
    return errorCode;
}

napi_value TestNativeDisplayManager_ErrorCode_enum(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    napi_value retValue;
    if (NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_ERROR_NOT_SYSTEM_APP == PARAM_202 &&
        NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_ERROR_INVALID_CALL == PARAM_1400002) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, -1, &retValue);
    }
    return retValue;
}

napi_value TestNativeDisplayManager_FoldDisplayMode_enum(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    napi_value retValue;
    if (NativeDisplayManager_FoldDisplayMode::DISPLAY_MANAGER_FOLD_DISPLAY_MODE_UNKNOWN == PARAM_0 &&
        NativeDisplayManager_FoldDisplayMode::DISPLAY_MANAGER_FOLD_DISPLAY_MODE_FULL == PARAM_1 &&
        NativeDisplayManager_FoldDisplayMode::DISPLAY_MANAGER_FOLD_DISPLAY_MODE_MAIN == PARAM_2 &&
        NativeDisplayManager_FoldDisplayMode::DISPLAY_MANAGER_FOLD_DISPLAY_MODE_SUB == PARAM_3 &&
        NativeDisplayManager_FoldDisplayMode::DISPLAY_MANAGER_FOLD_DISPLAY_MODE_COORDINATION == PARAM_4) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, -1, &retValue);
    }
    return retValue;
}

napi_value TestNativeDisplayManager_SourceMode_enum(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    napi_value retValue;
    if (NativeDisplayManager_SourceMode::DISPLAY_SOURCE_MODE_NONE == PARAM_0 &&
        NativeDisplayManager_SourceMode::DISPLAY_SOURCE_MODE_MAIN == PARAM_1 &&
        NativeDisplayManager_SourceMode::DISPLAY_SOURCE_MODE_MIRROR == PARAM_2 &&
        NativeDisplayManager_SourceMode::DISPLAY_SOURCE_MODE_EXTEND == PARAM_3 &&
        NativeDisplayManager_SourceMode::DISPLAY_SOURCE_MODE_ALONE == PARAM_4) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, -1, &retValue);
    }
    return retValue;
}

static napi_value displayInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "createAvailableArea", nullptr, CreateAvailableArea, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "createAvailableArea_ErrCode140004", nullptr, CreateAvailableArea_ErrCode140004, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "destroyAvailableArea", nullptr, DestroyAvailableArea, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getDisplaySourceMode_1", nullptr, GetDisplaySourceMode_1, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getDisplaySourceMode_2", nullptr, GetDisplaySourceMode_2, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getDisplaySourceMode_4", nullptr, GetDisplaySourceMode_4, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getDisplaySourceMode_ErrCode140004", nullptr, GetDisplaySourceMode_ErrCode140004, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getDisplayPosition", nullptr, GetDisplayPosition, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getDisplayPosition_ErrCode140004", nullptr, GetDisplayPosition_ErrCode140004, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "registerAvailableAreaChangeListener", nullptr, RegisterAvailableAreaChangeListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "unregisterAvailableAreaChangeListener", nullptr, UnregisterAvailableAreaChangeListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "unregisterAvailableAreaChangeListener_ErrCode140004", nullptr,
            UnregisterAvailableAreaChangeListener_ErrCode140004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "registerDisplayAddListener", nullptr, RegisterDisplayAddListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "unregisterDisplayAddListener", nullptr, UnregisterDisplayAddListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "unregisterDisplayAddListener_ErrCode140004", nullptr, UnregisterDisplayAddListener_ErrCode140004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "registerDisplayRemoveListener", nullptr, RegisterDisplayRemoveListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "unregisterDisplayRemoveListener", nullptr, UnregisterDisplayRemoveListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "registerDisplayRemoveListener_ErrCode140004", nullptr, RegisterDisplayRemoveListener_ErrCode140004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

static napi_value windowEnumInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testNativeDisplayManager_ErrorCode_enum", nullptr,
            TestNativeDisplayManager_ErrorCode_enum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testNativeDisplayManager_FoldDisplayMode_enum", nullptr,
            TestNativeDisplayManager_FoldDisplayMode_enum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testNativeDisplayManager_SourceMode_enum", nullptr,
            TestNativeDisplayManager_SourceMode_enum, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    displayInit(env, exports);
    windowEnumInit(env, exports);
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getId", nullptr, GetDefaultDisplayId, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getWidth", nullptr, GetDefaultDisplayWidth, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getHeight", nullptr, GetDefaultDisplayHeight, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getRotation", nullptr, GetDefaultDisplayRotation, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getOrientation", nullptr, GetDefaultDisplayOrientation, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getVirtualPixelRatio", nullptr, GetDefaultDisplayVirtualPixelRatio, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getRefreshRate", nullptr, GetDefaultDisplayRefreshRate, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDensityDpi", nullptr, GetDefaultDisplayDensityDpi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDensityPixels", nullptr, GetDefaultDisplayDensityPixels, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getScaledDensity", nullptr, GetDefaultDisplayScaledDensity, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getDensityXdpi", nullptr, GetDefaultDisplayDensityXdpi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDensityYdpi", nullptr, GetDefaultDisplayDensityYdpi, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCutoutInfo", nullptr, CreateDefaultDisplayCutoutInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "checkIsFoldDevice", nullptr, IsFoldable, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayMode", nullptr, GetFoldDisplayMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "registerDisplayChange", nullptr, RegisterDisplayChangeListener, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "unregisterDisplayChange", nullptr, UnregisterDisplayChangeListener, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "registerFoldDisplayModeChange", nullptr, RegisterFoldDisplayModeChangeListener, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "unregisterFoldDisplayModeChange", nullptr, UnregisterFoldDisplayModeChangeListener, nullptr, nullptr,
            nullptr, napi_default, nullptr },
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
