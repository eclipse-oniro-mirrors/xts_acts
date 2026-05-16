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

#include "window/Window.h"
#include <cmath>
#include <cstdint>

namespace Window {

int32_t g_windowId = PARAM_NEGATIVE_1;
int32_t g_mainWindowId = PARAM_NEGATIVE_1;
int32_t g_displayId = PARAM_NEGATIVE_1;
int32_t g_result = 0;
size_t g_snapshotListSize = 0;
OH_PixelmapNative **g_snapshotPixelMapList = nullptr;
bool g_callbackExecuted = false;

napi_value GetWindowId(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetWindowId env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetWindowId napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    napi_get_value_int32(env, args[0], &g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "GetWindowId: %{public}d", g_mainWindowId);
    return nullptr;
}

napi_value GetMainWindowId(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetMainWindowId env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetMainWindowId napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    napi_get_value_int32(env, args[0], &g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "GetMainWindowId: %{public}d", g_mainWindowId);
    return nullptr;
}

napi_value GetDisplayId(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetDisplayId env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Window", "GetDisplayId napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    napi_get_value_int32(env, args[0], &g_displayId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "GetDisplayId: %{public}d", g_displayId);
    return nullptr;
}

napi_value SetWindowStatusBarEnabledInvalidParam(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag1 = mt() % 2;
    bool flag2 = mt() % 2;
    napi_value retValue = 0;
    g_result = OH_WindowManager_SetWindowStatusBarEnabled(g_mainWindowId - 1, flag1, flag2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "SetWindowStatusBarEnabledInvalidParam: %{public}d", g_result);
    napi_create_int32(env, g_result, &retValue);
    return retValue;
}

napi_value SetWindowStatusBarEnabledSystemAbnormal(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag1 = mt() % 2;
    bool flag2 = mt() % 2;
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_SetWindowStatusBarEnabled(g_mainWindowId, flag1, flag2);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetWindowAvoidAreaInvalidParam(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    WindowManager_AvoidAreaType avoidAreaType = WindowManager_AvoidAreaType(mt() % 5); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_GetWindowAvoidArea(g_mainWindowId, avoidAreaType, nullptr) ==
                     WINDOW_MANAGER_ERRORCODE_INVALID_PARAM ? WINDOW_MANAGER_ERRORCODE_INVALID_PARAM :
                     OK;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value IsWindowShownInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_IsWindowShown(g_mainWindowId, nullptr) ==
                     WINDOW_MANAGER_ERRORCODE_INVALID_PARAM ? WINDOW_MANAGER_ERRORCODE_INVALID_PARAM :
                     OK;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetWindowPrivacyModeNoPermission(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % 2;
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_SetWindowPrivacyMode(g_mainWindowId, flag) ==
                     WINDOW_MANAGER_ERRORCODE_NO_PERMISSION ? WINDOW_MANAGER_ERRORCODE_NO_PERMISSION :
                     OK;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetWindowPropertiesInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_GetWindowProperties(g_mainWindowId, nullptr) ==
                     WINDOW_MANAGER_ERRORCODE_INVALID_PARAM ? WINDOW_MANAGER_ERRORCODE_INVALID_PARAM :
                     OK;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SnapshotOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    // 声明初始化选项指针
    OH_Pixelmap_InitializationOptions* initOptions = nullptr;
    // 创建初始化选项对象
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&initOptions);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Create init options failed: %{public}d", errCode);
    }
    // 设置必要参数
    OH_PixelmapInitializationOptions_SetWidth(initOptions, PARAM_800);   // 设置图像宽度
    OH_PixelmapInitializationOptions_SetHeight(initOptions, PARAM_600);  // 设置图像高度
    OH_PixelmapInitializationOptions_SetPixelFormat(initOptions, PIXEL_FORMAT_RGBA_8888);  // RGBA格式
    OH_PixelmapInitializationOptions_SetAlphaType(initOptions, PIXELMAP_ALPHA_TYPE_PREMULTIPLIED);  // 预乘透明度
    // 创建图像数据缓冲区（示例：800x600 RGBA图像）
    const size_t dataSize = 800 * 600 * 4;  // 宽*高*通道数
    uint8_t* imageData = (uint8_t*)malloc(dataSize);
    if (imageData == nullptr) {
        OH_PixelmapInitializationOptions_Release(initOptions);
    }
    // 填充示例数据（实际应填充真实图像数据）
    std::fill_n(imageData, dataSize, 0xFF);
    // 声明PixelMap指针
    OH_PixelmapNative* pixelMap;
    // 创建PixelMap实例
    errCode = OH_PixelmapNative_CreatePixelmap(imageData, dataSize, initOptions, &pixelMap);
    // 检查创建结果
    if (errCode != IMAGE_SUCCESS || pixelMap == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Create PixelMap failed: %{public}d", errCode);
        free(imageData);
        OH_PixelmapInitializationOptions_Release(initOptions);
    }
    int32_t result = OH_WindowManager_Snapshot(g_mainWindowId, pixelMap) == OK ? OK : PARAM_NEGATIVE_1;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "SnapshotOk: %{public}d", result);
    // 释放PixelMap资源
    OH_PixelmapNative_Release(pixelMap);
    // 释放初始化选项
    OH_PixelmapInitializationOptions_Release(initOptions);
    // 释放图像数据（若不再需要）
    free(imageData);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SnapshotInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_Snapshot(g_mainWindowId, nullptr) ==
                     WINDOW_MANAGER_ERRORCODE_INVALID_PARAM ? WINDOW_MANAGER_ERRORCODE_INVALID_PARAM :
                     OK;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SnapshotStateAbnormal(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    // 声明初始化选项指针
    OH_Pixelmap_InitializationOptions* initOptions = nullptr;
    // 创建初始化选项对象
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_Create(&initOptions);
    if (errCode != IMAGE_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Create init options failed: %{public}d", errCode);
    }
    // 设置必要参数
    OH_PixelmapInitializationOptions_SetWidth(initOptions, PARAM_800);   // 设置图像宽度
    OH_PixelmapInitializationOptions_SetHeight(initOptions, PARAM_600);  // 设置图像高度
    OH_PixelmapInitializationOptions_SetPixelFormat(initOptions, PIXEL_FORMAT_RGBA_8888);  // RGBA格式
    OH_PixelmapInitializationOptions_SetAlphaType(initOptions, PIXELMAP_ALPHA_TYPE_PREMULTIPLIED);  // 预乘透明度
    // 创建图像数据缓冲区（示例：800x600 RGBA图像）
    const size_t dataSize = 800 * 600 * 4;  // 宽*高*通道数
    uint8_t* imageData = (uint8_t*)malloc(dataSize);
    if (imageData == nullptr) {
        OH_PixelmapInitializationOptions_Release(initOptions);
    }
    // 填充示例数据（实际应填充真实图像数据）
    std::fill_n(imageData, dataSize, 0xFF);  // 填充白色
    // 声明PixelMap指针
    OH_PixelmapNative* pixelMap;
    // 创建PixelMap实例
    errCode = OH_PixelmapNative_CreatePixelmap(imageData, dataSize, initOptions, &pixelMap);
    // 检查创建结果
    if (errCode != IMAGE_SUCCESS || pixelMap == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Create PixelMap failed: %{public}d", errCode);
        free(imageData);
        OH_PixelmapInitializationOptions_Release(initOptions);
    }
    int32_t result = OH_WindowManager_Snapshot(g_mainWindowId+1, pixelMap);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "SnapshotStateAbnormal: %{public}d", result);
    // 释放PixelMap资源
    OH_PixelmapNative_Release(pixelMap);
    // 释放初始化选项
    OH_PixelmapInitializationOptions_Release(initOptions);
    // 释放图像数据（若不再需要）
    free(imageData);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetAllWindowLayoutInfoListParameterOverride(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    WindowManager_Rect* windowLayoutInfo = nullptr;
    size_t* windowLayoutInfoSize = nullptr;
    auto result = OH_WindowManager_GetAllWindowLayoutInfoList(g_displayId, &windowLayoutInfo, windowLayoutInfoSize) ==
                  WINDOW_MANAGER_ERRORCODE_INVALID_PARAM;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "GetAllWindowLayoutInfoListParameterOverride: %{public}d", result);
    windowLayoutInfo = (WindowManager_Rect*)malloc(sizeof(WindowManager_Rect));
    windowLayoutInfoSize = (size_t*)malloc(sizeof(size_t));
    result = OH_WindowManager_GetAllWindowLayoutInfoList(-1, &windowLayoutInfo, windowLayoutInfoSize) ==
             WINDOW_MANAGER_ERRORCODE_INVALID_PARAM;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "GetAllWindowLayoutInfoListParameterOverride: %{public}d", result);
    auto result_errcode = OH_WindowManager_GetAllWindowLayoutInfoList(0, &windowLayoutInfo, windowLayoutInfoSize);
    result = result_errcode == OK || result_errcode == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "GetAllWindowLayoutInfoListParameterOverride: %{public}d", result_errcode);
    OH_WindowManager_ReleaseAllWindowLayoutInfoList(windowLayoutInfo);
    windowLayoutInfo = NULL;
    free(windowLayoutInfoSize);
    windowLayoutInfoSize = nullptr;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetAllWindowLayoutInfoListOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    WindowManager_Rect* windowLayoutInfo = nullptr;
    size_t* windowLayoutInfoSize = nullptr;
    windowLayoutInfo = (WindowManager_Rect*)malloc(sizeof(WindowManager_Rect));
    windowLayoutInfoSize = (size_t*)malloc(sizeof(size_t));
    auto result = OH_WindowManager_GetAllWindowLayoutInfoList(0, &windowLayoutInfo, windowLayoutInfoSize);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED;
    OH_WindowManager_ReleaseAllWindowLayoutInfoList(windowLayoutInfo);
    windowLayoutInfo = NULL;
    free(windowLayoutInfoSize);
    windowLayoutInfoSize = nullptr;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value InjectTouchEventParameterOverride(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t windowX = PARAM_100; // 相对窗口左上角坐标点x轴满足非负整数要求
    int32_t windowY = PARAM_200; // 相对窗口左上角坐标点y轴满足非负整数要求
    auto result = OH_WindowManager_InjectTouchEvent(g_mainWindowId, nullptr, windowX, windowY) ==
                                                    WINDOW_MANAGER_ERRORCODE_INVALID_PARAM ?
                                                    WINDOW_MANAGER_ERRORCODE_INVALID_PARAM : PARAM_NEGATIVE_1;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: %{public}d", result);
    Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    result = OH_WindowManager_InjectTouchEvent(-1, touchEvent, windowX, windowY) ==
             WINDOW_MANAGER_ERRORCODE_INVALID_PARAM && result != PARAM_NEGATIVE_1 ?
             WINDOW_MANAGER_ERRORCODE_INVALID_PARAM : PARAM_NEGATIVE_1;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: %{public}d", result);
    OH_Input_SetTouchEventActionTime(touchEvent, PARAM_1755494223); // 时间戳满足非零要求
    OH_Input_SetTouchEventFingerId(touchEvent, 0); // 手指Id满足非负要求
    OH_Input_SetTouchEventWindowId(touchEvent, g_mainWindowId); // 页面显示后通过GetWindowId获取的当前窗口Id
    OH_Input_SetTouchEventDisplayId(touchEvent, g_displayId); // 页面显示后通过GetDisplayId获取的当前屏幕Id
    OH_Input_SetTouchEventAction(touchEvent, 0); // 行为满足0~3要求
    OH_Input_SetTouchEventDisplayX(touchEvent, PARAM_100); // 相对屏幕左上角坐标点x轴满足非负整数要求，默认窗口全屏故设置与相对窗口左上角坐标点x轴一致
    OH_Input_SetTouchEventDisplayY(touchEvent, PARAM_200); // 相对屏幕左上角坐标点y轴满足非负整数要求，默认窗口全屏故设置与相对窗口左上角坐标点y轴一致
    result = OH_WindowManager_InjectTouchEvent(g_mainWindowId, touchEvent, windowX, windowY) ==
                                               OK && result != PARAM_NEGATIVE_1 ? OK : PARAM_NEGATIVE_1;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: %{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: g_mainWindowId %{public}d", g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: windowId %{public}d", OH_Input_GetTouchEventWindowId(touchEvent));
    windowX = PARAM_NEGATIVE_1;
    windowY = PARAM_200;
    result = OH_WindowManager_InjectTouchEvent(g_mainWindowId, touchEvent, windowX, windowY) ==
                                               WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL && result != PARAM_NEGATIVE_1 ?
                                               WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL : PARAM_NEGATIVE_1;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: %{public}d", result);
    windowX = PARAM_100;
    windowY = PARAM_NEGATIVE_1;
    result = OH_WindowManager_InjectTouchEvent(g_mainWindowId, touchEvent, windowX, windowY) ==
                                               WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL && result != PARAM_NEGATIVE_1 ?
                                               WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL : PARAM_NEGATIVE_1;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventParameterOverride: %{public}d", result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    napi_create_int32(env, result == WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL, &retValue);
    return retValue;
}

napi_value InjectTouchEventSystemAbnormal(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t windowX = PARAM_NEGATIVE_1; // 相对窗口左上角坐标点x轴不满足非负整数要求
    int32_t windowY = PARAM_NEGATIVE_1; // 相对窗口左上角坐标点y轴不满足非负整数要求
    Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventActionTime(touchEvent, PARAM_1755494223); // 时间戳满足非零要求
    OH_Input_SetTouchEventFingerId(touchEvent, 0); // 手指Id满足非负要求
    OH_Input_SetTouchEventWindowId(touchEvent, g_mainWindowId); // 页面显示后通过GetWindowId获取的当前窗口Id
    OH_Input_SetTouchEventDisplayId(touchEvent, g_displayId); // 页面显示后通过GetDisplayId获取的当前屏幕Id
    OH_Input_SetTouchEventAction(touchEvent, 1); // 行为满足0~3要求
    OH_Input_SetTouchEventDisplayX(touchEvent, PARAM_100); // 相对屏幕左上角坐标点x轴满足非负整数要求，默认窗口全屏故设置与相对窗口左上角坐标点x轴一致
    OH_Input_SetTouchEventDisplayY(touchEvent, PARAM_200); // 相对屏幕左上角坐标点y轴满足非负整数要求，默认窗口全屏故设置与相对窗口左上角坐标点y轴一致
    auto result = OH_WindowManager_InjectTouchEvent(g_mainWindowId, touchEvent, windowX, windowY) ==
                  WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL ? WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "InjectTouchEventSystemAbnormal: %{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventSystemAbnormal: g_mainWindowId %{public}d", g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "InjectTouchEventSystemAbnormal: windowId %{public}d",
                 OH_Input_GetTouchEventWindowId(touchEvent));
    OH_Input_DestroyTouchEvent(&touchEvent);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value InjectTouchEventStateAbnormal(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t windowX = PARAM_NEGATIVE_1; // 相对窗口左上角坐标点x轴不满足非负整数要求
    int32_t windowY = PARAM_NEGATIVE_1; // 相对窗口左上角坐标点y轴不满足非负整数要求
    Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventActionTime(touchEvent, PARAM_1755494223); // 时间戳满足非零要求
    OH_Input_SetTouchEventFingerId(touchEvent, PARAM_NEGATIVE_1); // 手指Id满足非负要求
    OH_Input_SetTouchEventWindowId(touchEvent, g_mainWindowId); // 页面显示后通过GetWindowId获取的当前窗口Id
    OH_Input_SetTouchEventDisplayId(touchEvent, g_displayId); // 页面显示后通过GetDisplayId获取的当前屏幕Id
    OH_Input_SetTouchEventAction(touchEvent, 1); // 行为满足0~3要求
    OH_Input_SetTouchEventDisplayX(touchEvent, PARAM_100); // 相对屏幕左上角坐标点x轴满足非负整数要求，默认窗口全屏故设置与相对窗口左上角坐标点x轴一致
    OH_Input_SetTouchEventDisplayY(touchEvent, PARAM_200); // 相对屏幕左上角坐标点y轴满足非负整数要求，默认窗口全屏故设置与相对窗口左上角坐标点y轴一致
    auto result = OH_WindowManager_InjectTouchEvent(g_mainWindowId, touchEvent, windowX, windowY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "InjectTouchEventStateAbnormal: %{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventStateAbnormal: g_mainWindowId %{public}d", g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "InjectTouchEventStateAbnormal: windowId %{public}d", OH_Input_GetTouchEventWindowId(touchEvent));
    OH_Input_DestroyTouchEvent(&touchEvent);
    napi_create_int32(env, result == WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL, &retValue);
    return retValue;
}

napi_value WindowManagerErrorCodeOk(napi_env env, napi_callback_info info)
{
    return SnapshotOk(env, info);
}

napi_value WindowManagerErrorCodeNoPermission(napi_env env, napi_callback_info info)
{
    return SetWindowPrivacyModeNoPermission(env, info);
}

napi_value WindowManagerErrorCodeInvalidParam(napi_env env, napi_callback_info info)
{
    return GetWindowAvoidAreaInvalidParam(env, info);
}

napi_value WindowManagerErrorCodeDeviceNotSupported(napi_env env, napi_callback_info info)
{
    return GetAllWindowLayoutInfoListOkOrDeviceNotSupported(env, info);
}

napi_value WindowManagerErrorCodeInvalidWindowId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_NativeWindowManager_KeyEventFilter filter;
    auto result = OH_NativeWindowManager_RegisterKeyEventFilter(-1, filter) ==
                  INVAILD_WINDOW_ID ? INVAILD_WINDOW_ID : OK;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value WindowManagerErrorCodeStateAbnormal(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag1 = mt() % 2;
    bool flag2 = mt() % 2;
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_SetWindowStatusBarEnabled(g_mainWindowId+1, flag1, flag2) ==
                  WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL ? WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "WindowManagerErrorCodeStateAbnormal: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value WindowManagerErrorCodeSystemAbnormal(napi_env env, napi_callback_info info)
{
    return InjectTouchEventSystemAbnormal(env, info);
}

WindowManager_AvoidAreaType CheckWindowAvoidAreaType(WindowManager_AvoidAreaType avoidAreaType, bool flag)
{
    return (avoidAreaType == WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM ||
            avoidAreaType == WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT ||
            avoidAreaType == WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE ||
            avoidAreaType == WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD ||
            avoidAreaType == WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR) && flag ?
            avoidAreaType : WindowManager_AvoidAreaType(-1);
}

napi_value GetWindowAvoidAreaType(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t index = PARAM_NEGATIVE_1;
    napi_get_value_int32(env, args[0], &index);
    if (index >= PARAM_5 || index < PARAM_0) {
        napi_throw_type_error(env, NULL, "Wrong arguments");
        return nullptr;
    }
    WindowManager_AvoidAreaType avoidAreaType = WindowManager_AvoidAreaType(index);
    WindowManager_AvoidArea avoidArea = {};
    napi_value retValue = 0;
    int32_t result = OH_WindowManager_GetWindowAvoidArea(g_mainWindowId, avoidAreaType, &avoidArea);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "GetWindowAvoidAreaType: %{public}d result: %{public}d",
                 avoidAreaType, result);
    napi_create_int32(env, CheckWindowAvoidAreaType(avoidAreaType, result == OK), &retValue);
    return retValue;
}

WindowManager_WindowType CheckWindowType(WindowManager_WindowType windowType, bool flag)
{
    return (windowType == WINDOW_MANAGER_WINDOW_TYPE_APP ||
            windowType == WINDOW_MANAGER_WINDOW_TYPE_MAIN ||
            windowType == WINDOW_MANAGER_WINDOW_TYPE_FLOAT ||
            windowType == WINDOW_MANAGER_WINDOW_TYPE_DIALOG) && flag ?
            windowType : WindowManager_WindowType(-1);
}

napi_value GetWindowType(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 2;
    napi_value args[2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_2) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t index = PARAM_NEGATIVE_1;
    napi_get_value_int32(env, args[0], &index);
    int32_t windowId;
    napi_get_value_int32(env, args[1], &windowId);
    if (index != PARAM_0 && index != PARAM_1 && index != PARAM_8 && index != PARAM_16) {
        napi_throw_type_error(env, NULL, "Wrong arguments");
        return nullptr;
    }
    napi_value retValue = 0;
    WindowManager_WindowProperties windowProperties = {};
    int32_t result = OH_WindowManager_GetWindowProperties(windowId, &windowProperties);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window", "GetWindowType: %{public}d", result);
    napi_create_int32(env, CheckWindowType(windowProperties.type, result == OK), &retValue);
    return retValue;
}

napi_value RegisterMouseEventFilterOkOrServiceError(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_RegisterMouseEventFilter(g_mainWindowId, MouseEventFilter);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "RegisterMouseEventFilterOkOrServiceError: %{public}d", result);
    if (result == OK) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterMouseEventFilterInvaildWindowId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId + 999);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "RegisterMouseEventFilterInvaildWindowId: %{public}d", result);
    if (result == INVAILD_WINDOW_ID) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

bool MouseEventFilter(Input_MouseEvent* mouseEvent)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % 2;
    return flag;
}

napi_value UnregisterMouseEventFilterOkOrServiceError(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_UnregisterMouseEventFilter(g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "UnregisterMouseEventFilterOkOrServiceError: %{public}d", result);
    if (result == OK) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value UnregisterMouseEventFilterInvaildWindowId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId + 999);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "UnregisterMouseEventFilterInvaildWindowId: %{public}d", result);
    if (result == INVAILD_WINDOW_ID) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterTouchEventFilterOkOrServiceError(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_RegisterTouchEventFilter(g_mainWindowId, TouchEventFilter);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "RegisterTouchEventFilterOkOrServiceError: %{public}d", result);
    if (result == OK) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value RegisterTouchEventFilterInvaildWindowId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId + 999);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "RegisterTouchEventFilterInvaildWindowId: %{public}d", result);
    if (result == INVAILD_WINDOW_ID) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

bool TouchEventFilter(Input_TouchEvent* touchEvent)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % 2;
    return flag;
}

napi_value UnregisterTouchEventFilterOkOrServiceError(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "UnregisterTouchEventFilterOkOrServiceError: %{public}d", result);
    if (result == OK) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value UnregisterTouchEventFilterInvaildWindowId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId + 999);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "UnregisterTouchEventFilterInvaildWindowId: %{public}d", result);
    if (result == INVAILD_WINDOW_ID) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    } else if (result == SERVICE_ERROR) {
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value Test_OH_WindowManager_GetAllMainWindowInfo_0200(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = PARAM_2;
    napi_value args[PARAM_2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_2) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId = 0;
    napi_get_value_int32(env, args[0], &windowId);
    int32_t displayId = 0;
    napi_get_value_int32(env, args[1], &displayId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "Test_OH_WindowManager_GetAllMainWindowInfo_0200 windowId: %{public}d", windowId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "Test_OH_WindowManager_GetAllMainWindowInfo_0200 displayId: %{public}d", displayId);
    napi_value retValue;
    WindowManager_MainWindowInfo *infoList = NULL;
    size_t mainWindowInfoSize = 0;
    int32_t result = OH_WindowManager_GetAllMainWindowInfo(&infoList, &mainWindowInfoSize);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "Test_OH_WindowManager_GetAllMainWindowInfo_0200: %{public}d", result);
    if (result != OK) {
        napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
        return retValue;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "Test_OH_WindowManager_GetAllMainWindowInfo_0200 mainWindowInfoSize: %{public}d",
        mainWindowInfoSize);
    if (mainWindowInfoSize < 1) {
        napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
        return retValue;
    }
    for (size_t i = 0; i < mainWindowInfoSize; i++) {
        WindowManager_MainWindowInfo* currentWindow = &infoList[i];
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
            "Test_OH_WindowManager_GetAllMainWindowInfo_0200 infoList[%{public}d]: "
            "%{public}d, %{public}d, %{public}d, %{public}s", i, currentWindow->displayId,
            currentWindow->windowId, currentWindow->showing, currentWindow->label);
        if (currentWindow->windowId != windowId) {
            continue;
        }
        if (currentWindow->displayId == displayId && currentWindow->windowId == windowId &&
            currentWindow->showing == true && currentWindow->label != "label") {
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
    }
    OH_WindowManager_ReleaseAllMainWindowInfo(infoList);
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

void OnWindowSnapshotCallback(const OH_PixelmapNative** snapshotPixelMapList, size_t snapshotListSize)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "OnWindowSnapshotCallback success. snapshotListSize: %{public}u", snapshotListSize);
    if (g_snapshotPixelMapList != nullptr) {
        free(g_snapshotPixelMapList);
    }
    g_snapshotListSize = snapshotListSize;
    g_callbackExecuted = true;
    
    if (snapshotListSize > 0 && snapshotPixelMapList != nullptr) {
        g_snapshotPixelMapList = (OH_PixelmapNative**)malloc(sizeof(OH_PixelmapNative*) * snapshotListSize);
        if (g_snapshotPixelMapList != nullptr) {
            for (size_t i = 0; i < snapshotListSize; i++) {
                g_snapshotPixelMapList[i] = const_cast<OH_PixelmapNative*>(snapshotPixelMapList[i]);
            }
        }
    } else {
        g_snapshotPixelMapList = nullptr;
    }
    OH_WindowManager_ReleaseMainWindowSnapshot(*g_snapshotPixelMapList);
}

napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0200(napi_env env, napi_callback_info info)
{
    WindowManager_WindowSnapshotConfig config;
    config.useCache = false;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(nullptr, 1, config, OnWindowSnapshotCallback);
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "Test_OH_WindowManager_GetMainWindowSnapshot_0200: %{public}d", result);
    if (result == WINDOW_MANAGER_ERRORCODE_INVALID_PARAM) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_INVALID_PARAM, &retValue);
        return retValue;
    } else if (result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
   
napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0300(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(0);
    windowIdList.push_back(windowId);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = false;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        windowIdList.size(), config, OnWindowSnapshotCallback);
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "test_OH_WindowManager_GetMainWindowSnapshot_0300: %{public}d", result);
    if (result == WINDOW_MANAGER_ERRORCODE_INVALID_PARAM) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_INVALID_PARAM, &retValue);
        return retValue;
    } else if (result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0400(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(-1);
    windowIdList.push_back(windowId);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = false;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        windowIdList.size(), config, OnWindowSnapshotCallback);
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "Test_OH_WindowManager_GetMainWindowSnapshot_0400: %{public}d", result);
    if (result == WINDOW_MANAGER_ERRORCODE_INVALID_PARAM) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_INVALID_PARAM, &retValue);
        return retValue;
    } else if (result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
   
napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0500(napi_env env, napi_callback_info info)
{
    g_callbackExecuted = false;
    g_snapshotPixelMapList = nullptr;
    g_snapshotListSize = 0;
    
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(PARAM_1000);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = false;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        windowIdList.size(), config, OnWindowSnapshotCallback);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "Test_OH_WindowManager_GetMainWindowSnapshot_0500: %{public}d", result);
    
    int timeout = 1000;
    while (!g_callbackExecuted && timeout > 0) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
        timeout--;
    }
    
    napi_value retValue;
    if (g_callbackExecuted && g_snapshotListSize == 1 && g_snapshotPixelMapList != nullptr) {
        napi_create_int32(env, 0, &retValue); // 成功
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_1, &retValue); // 失败
    }
    
    return retValue;
}

napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0600(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(windowId);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = false;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        NULL, config, OnWindowSnapshotCallback);
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "Test_OH_WindowManager_GetMainWindowSnapshot_0600: %{public}d", result);
    if (result == WINDOW_MANAGER_ERRORCODE_INVALID_PARAM) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_INVALID_PARAM, &retValue);
        return retValue;
    } else if (result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0700(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(windowId);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = false;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        windowIdList.size(), config, OnWindowSnapshotCallback);
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "Test_OH_WindowManager_GetMainWindowSnapshot_0700: %{public}d", result);
    if (g_snapshotListSize == 1) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}
   
napi_value Test_OH_WindowManager_GetMainWindowSnapshot_0800(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(windowId);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = true;
    int32_t result = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        windowIdList.size(), config, OnWindowSnapshotCallback);
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "Test_OH_WindowManager_GetMainWindowSnapshot_0800: %{public}d", result);
    if (g_snapshotListSize == 1) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    napi_create_int32(env, PARAM_NEGATIVE_1, &retValue);
    return retValue;
}

napi_value TestLockCursorwithOutofRange(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    int32_t result1 = OH_WindowManager_LockCursor(0, false);
    int32_t result2 = OH_WindowManager_LockCursor(-1, false);
    int32_t result3 = OH_WindowManager_LockCursor(PARAM_100, false);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestLockCursorwithOutofRange: %{public}d", result1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestLockCursorwithOutofRange: %{public}d", result2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestLockCursorwithOutofRange: %{public}d", result3);
    napi_value retValue;
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_3] = {result1, result2, result3};
    for (int i = 0; i < PARAM_3; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestLockCursorwithoutPermission(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    if (argc != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    int32_t result1 = OH_WindowManager_LockCursor(windowId, false);
 
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestLockCursorwithoutPermission: %{public}d", result1);
    
    napi_create_int32(env, result1, &retValue);
    return retValue;
}

napi_value TestUnLockCursorwithOutofRange(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    int32_t result1 = OH_WindowManager_UnlockCursor(0);
    int32_t result2 = OH_WindowManager_UnlockCursor(-1);
    int32_t result3 = OH_WindowManager_UnlockCursor(PARAM_100);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestUnLockCursorwithOutofRange: %{public}d", result1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestUnLockCursorwithOutofRange: %{public}d", result2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestUnLockCursorwithOutofRange: %{public}d", result3);
    napi_value retValue;
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_3] = {result1, result2, result3};
    for (int i = 0; i < PARAM_3; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestUnLockCursorwithoutPermission(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    int32_t result1 = OH_WindowManager_UnlockCursor(windowId);
 
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestUnLockCursorwithoutPermission: %{public}d", result1);
    
    napi_create_int32(env, result1, &retValue);
    return retValue;
}

napi_value TestSetWindowBrightness(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);
    if (valuetype0 != napi_number || valuetype1 != napi_number) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "ValueType is false");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    double brightness;
    napi_get_value_double(env, args[1], &brightness);
    
    int32_t result1 = OH_WindowManager_SetWindowBrightness(windowId, brightness);
 
    napi_value retValue;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestSetWindowBrightness: %{public}d", result1);
    
    napi_create_int32(env, result1, &retValue);
    return retValue;
}

napi_value TestInjectTouchEvent(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    if (valuetype0 != napi_number) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "ValueType is false");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
   
    Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    int32_t result1 = OH_WindowManager_InjectTouchEvent(windowId, touchEvent, PARAM_NEGATIVE_2147483648, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestInjectTouchEvent 1: %{public}d", result1);
    
    int32_t result2 = OH_WindowManager_InjectTouchEvent(windowId, touchEvent, PARAM_2147483647, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestInjectTouchEvent 2: %{public}d", result2);
    napi_value retValue;
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result1, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestGetMainWindowSnapshot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    if (valuetype0 != napi_number) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "ValueType is false");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    std::vector<int32_t> windowIdList;
    windowIdList.push_back(windowId);
    WindowManager_WindowSnapshotConfig config;
    config.useCache = true;
    
    int32_t result1 = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        0, config, OnWindowSnapshotCallback);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestGetMainWindowSnapshot 1: %{public}d", result1);
    int32_t result2 = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        PARAM_4294967295, config, OnWindowSnapshotCallback);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestGetMainWindowSnapshot 2: %{public}d", result2);
    int32_t result3 = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        PARAM_NEGATIVE_1, config, OnWindowSnapshotCallback);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestGetMainWindowSnapshot 3: %{public}d", result3);
    int32_t result4 = OH_WindowManager_GetMainWindowSnapshot(windowIdList.data(),
        PARAM_4294967296, config, OnWindowSnapshotCallback);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestGetMainWindowSnapshot 4: %{public}d", result4);
    
    napi_value retValue;
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_4] = {result1, result2, result3, result4};
    for (int i = 0; i < PARAM_4; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestLockCursor(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    if (valuetype0 != napi_number) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "ValueType is false");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    int32_t result1 = OH_WindowManager_LockCursor(0, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestLockCursor 1: %{public}d", result1);
    int32_t result2 = OH_WindowManager_LockCursor(PARAM_4294967295, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
                 "TestLockCursor 2: %{public}d", result2);
    
    napi_value retValue;
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result1, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}

napi_value TestUnlockCursor(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType",
            "CreateNativeNode env or info is null");
            return nullptr;
    }
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    if (valuetype0 != napi_number) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetWindowType", "ValueType is false");
        return nullptr;
    }
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
   
    int32_t result1 = OH_WindowManager_UnlockCursor(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "TestUnlockCursor 1: %{public}d", result1);
    int32_t result2 = OH_WindowManager_UnlockCursor(PARAM_4294967295);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Window",
        "TestUnlockCursor 2: %{public}d", result2);
    
    napi_value retValue;
    if (napi_create_array(env, &retValue) != napi_ok) {
        return nullptr;
    }
    int32_t values[PARAM_2] = {result1, result2};
    for (int i = 0; i < PARAM_2; i++) {
        napi_value element;
        napi_create_int32(env, values[i], &element);
        napi_set_element(env, retValue, i, element);
    }
    return retValue;
}
}
