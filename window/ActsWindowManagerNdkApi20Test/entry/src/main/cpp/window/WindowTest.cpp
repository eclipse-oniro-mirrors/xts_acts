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

namespace Window {

int32_t g_windowId = PARAM_NEGATIVE_1;
int32_t g_mainWindowId = PARAM_NEGATIVE_1;
int32_t g_displayId = PARAM_NEGATIVE_1;
int32_t g_result = 0;

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
    g_result = OH_WindowManager_SetWindowStatusBarEnabled(g_mainWindowId-1, flag1, flag2);
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
    windowLayoutInfoSize = NULL;
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
    windowLayoutInfoSize = NULL;
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
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId+999);
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
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId+999);
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
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId+999);
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
    int32_t result = OH_NativeWindowManager_UnregisterTouchEventFilter(g_mainWindowId+999);
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

}
