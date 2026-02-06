/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "XComponentSurfaceConfigTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <cstdint>
#include <hilog/log.h>
#include <native_drawing/drawing_text_typography.h>
#include <string>
#include "../common/common.h"
#include <native_window/external_window.h>
#include <arkui/native_interface.h>

namespace NativeXComponentSample {
// [StartExclude xcomponent_manager_cpp]
std::unordered_map<int64_t, PluginRender*> XComponentSurfaceConfigTest::pluginRenderMap_;
std::unordered_map<int64_t, OHNativeWindow*> XComponentSurfaceConfigTest::windowMap_;

std::unordered_map<std::string, ArkUI_NodeHandle> XComponentSurfaceConfigTest::nodeHandleMap_;
std::unordered_map<void *, OH_ArkUI_SurfaceCallback *> XComponentSurfaceConfigTest::callbackMap_;
std::unordered_map<void *, OH_ArkUI_SurfaceHolder *> XComponentSurfaceConfigTest::surfaceHolderMap_;
ArkUI_AccessibilityProvider *XComponentSurfaceConfigTest::provider_ = nullptr;
ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

namespace {
    // 解析从ArkTS侧传入的surfaceId，此处surfaceId是一个64位int值
    int64_t ParseId(napi_env env, napi_callback_info info)
    {
        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ParseId", "env or info is null");
            return -1;
        }
        size_t argc = 1;
        napi_value args[1] = {nullptr};
        if (napi_ok != napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ParseId", "GetContext napi_get_cb_info failed");
            return -1;
        }
        int64_t value = 0;
        bool lossless = true;
        if (napi_ok != napi_get_value_bigint_int64(env, args[0], &value, &lossless)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ParseId", "Get value failed");
            return -1;
        }
        return value;
    }

    std::string value2String(napi_env env, napi_value value) // 将napi_value转化为string类型的变量
    {
        size_t stringSize = 0;
        napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
        std::string valueString;
        valueString.resize(stringSize);
        napi_get_value_string_utf8(env, value, &valueString[0], stringSize + 1, &stringSize);
        return valueString;
    }
    
    void OnSurfaceCreated(OH_ArkUI_SurfaceHolder *holder)
    {
        auto window = OH_ArkUI_XComponent_GetNativeWindow(holder); // 获取native window
        auto render = reinterpret_cast<EGLRender*>(OH_ArkUI_SurfaceHolder_GetUserData(holder));
        render->SetUpEGLContext(window); // 初始化egl环境
    }
    
    void OnSurfaceChanged(OH_ArkUI_SurfaceHolder *holder, uint64_t width, uint64_t height)
    {
        EGLRender* render = reinterpret_cast<EGLRender*>(OH_ArkUI_SurfaceHolder_GetUserData(holder));
        render->SetEGLWindowSize(width, height); // 设置绘制区域大小
        render->DrawStar(true);                  // 绘制五角星
    }
    
    void OnSurfaceDestroyed(OH_ArkUI_SurfaceHolder *holder)
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onBind", "on destroyed");
        EGLRender* render = reinterpret_cast<EGLRender*>(OH_ArkUI_SurfaceHolder_GetUserData(holder));
        render->DestroySurface();  // 销毁eglSurface相关资源
    }
    
    void OnSurfaceShow(OH_ArkUI_SurfaceHolder *holder)
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "on surface show");
    }
    
    void OnSurfaceHide(OH_ArkUI_SurfaceHolder *holder)
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "on surface hide");
    }
    
    void OnFrameCallback(ArkUI_NodeHandle node, uint64_t timestamp, uint64_t targetTimestamp)
    {
        if (!XComponentSurfaceConfigTest::surfaceHolderMap_.count(node)) {
            return;
        }
        static uint64_t count = 0;
        count++;
        if (count % FRAME_COUNT == 0) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "OnFrameCallback count = %{public}ld", count);
        }
    }
    
    void onEvent(ArkUI_NodeEvent *event)
    {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event); // 获取组件事件类型
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "on event");
        if (eventType == NODE_TOUCH_EVENT) {
            ArkUI_NodeHandle handle = OH_ArkUI_NodeEvent_GetNodeHandle(event); // 获取触发该事件的组件对象
            auto holder = XComponentSurfaceConfigTest::surfaceHolderMap_[handle];
            EGLRender* render = reinterpret_cast<EGLRender*>(OH_ArkUI_SurfaceHolder_GetUserData(holder));
            render->DrawStar(false); // 绘制五角星
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "on touch");
        }
    }
} // namespace

XComponentSurfaceConfigTest::~XComponentSurfaceConfigTest()
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "~XComponentSurfaceConfigTest");
    for (auto iter = pluginRenderMap_.begin(); iter != pluginRenderMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    pluginRenderMap_.clear();
    for (auto iter = windowMap_.begin(); iter != windowMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    windowMap_.clear();
}

PluginRender* XComponentSurfaceConfigTest::GetPluginRender(int64_t& id)
{
    if (pluginRenderMap_.find(id) != pluginRenderMap_.end()) {
        return pluginRenderMap_[id];
    }
    return nullptr;
}

// 设置SurfaceId，基于SurfaceId完成对NativeWindow的初始化
napi_value XComponentSurfaceConfigTest::SetSurfaceId(napi_env env, napi_callback_info info)
{
    int64_t surfaceId = ParseId(env, info);
    OHNativeWindow *nativeWindow;
    PluginRender *pluginRender;
    if (windowMap_.find(surfaceId) == windowMap_.end()) {
        OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &nativeWindow);
        windowMap_[surfaceId] = nativeWindow;
    } else {
        return nullptr;
    }
    if (pluginRenderMap_.find(surfaceId) == pluginRenderMap_.end()) {
        pluginRender = new PluginRender(surfaceId);
        pluginRenderMap_[surfaceId] = pluginRender;
    }
    pluginRender->InitNativeWindow(nativeWindow);
    return nullptr;
}

// 销毁Surface
napi_value XComponentSurfaceConfigTest::DestroySurface(napi_env env, napi_callback_info info)
{
    int64_t surfaceId = ParseId(env, info);
    auto pluginRenderMapIter = pluginRenderMap_.find(surfaceId);
    if (pluginRenderMapIter != pluginRenderMap_.end()) {
        delete pluginRenderMapIter->second;
        pluginRenderMap_.erase(pluginRenderMapIter);
    }
    auto windowMapIter = windowMap_.find(surfaceId);
    if (windowMapIter != windowMap_.end()) {
        OH_NativeWindow_DestroyNativeWindow(windowMapIter->second);
        windowMap_.erase(windowMapIter);
    }
    return nullptr;
}

// 根据传入的surfaceId、width、height实现Surface大小的变动
napi_value XComponentSurfaceConfigTest::ChangeSurface(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "ChangeSurface: OnLoad env or info is null");
        return nullptr;
    }
    int64_t surfaceId = 0;
    size_t argc = 3;
    napi_value args[3] = {nullptr};

    if (napi_ok != napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "ChangeSurface: GetContext napi_get_cb_info failed");
    }
    bool lossless = true;
    int index = 0;
    if (napi_ok != napi_get_value_bigint_int64(env, args[index++], &surfaceId, &lossless)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "ChangeSurface: Get value failed");
    }
    double width;
    if (napi_ok != napi_get_value_double(env, args[index++], &width)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "ChangeSurface: Get width failed");
    }
    double height;
    if (napi_ok != napi_get_value_double(env, args[index++], &height)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "ChangeSurface: Get height failed");
    }
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "ChangeSurface: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->UpdateNativeWindowSize(width, height);
    return nullptr;
}

// 实现改变绘制图形颜色的功能
napi_value XComponentSurfaceConfigTest::ChangeColor(napi_env env, napi_callback_info info)
{
    int64_t surfaceId = ParseId(env, info);
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "ChangeColor: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->ChangeColor(); // 参考Native XComponent场景ChangeColor实现
    return nullptr;
}

// 实现EGL绘画逻辑
napi_value XComponentSurfaceConfigTest::DrawPattern(napi_env env, napi_callback_info info)
{
    int64_t surfaceId = ParseId(env, info);
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest", "DrawPattern: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->DrawPattern();
    return nullptr;
}

// 获得xcomponent状态，并返回至ArkTS侧
napi_value XComponentSurfaceConfigTest::GetXComponentStatus(napi_env env, napi_callback_info info)
{
    int64_t surfaceId = ParseId(env, info);
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "GetXComponentStatus: Get pluginRender failed");
        return nullptr;
    }
    napi_value hasDraw;
    napi_value hasChangeColor;
    napi_status ret = napi_create_int32(env, pluginRender->HasDraw(), &(hasDraw));
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "GetXComponentStatus: napi_create_int32 hasDraw_ error");
        return nullptr;
    }
    ret = napi_create_int32(env, pluginRender->HasChangedColor(), &(hasChangeColor));
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "GetXComponentStatus: napi_create_int32 hasChangeColor_ error");
        return nullptr;
    }
    napi_value obj;
    ret = napi_create_object(env, &obj);
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                     "XComponentSurfaceConfigTest", "GetXComponentStatus: napi_create_object error");
        return nullptr;
    }
    ret = napi_set_named_property(env, obj, "hasDraw", hasDraw);
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "GetXComponentStatus: napi_set_named_property hasDraw error");
        return nullptr;
    }
    ret = napi_set_named_property(env, obj, "hasChangeColor", hasChangeColor);
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentSurfaceConfigTest",
                     "GetXComponentStatus: napi_set_named_property hasChangeColor error");
        return nullptr;
    }
    return obj;
}

napi_value XComponentSurfaceConfigTest::BindNode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    ArkUI_NodeHandle handle;
    OH_ArkUI_GetNodeHandleFromNapiValue(env, args[1], &handle);             // 获取 nodeHandle
    OH_ArkUI_SurfaceHolder *holder = OH_ArkUI_SurfaceHolder_Create(handle); // 获取 SurfaceHolder
    nodeHandleMap_[nodeId] = handle;
    surfaceHolderMap_[handle] = holder;
    auto callback = OH_ArkUI_SurfaceCallback_Create(); // 创建 SurfaceCallback
    callbackMap_[holder] = callback;
    auto render = new EGLRender();
    OH_ArkUI_SurfaceHolder_SetUserData(holder, render); // 将render保存在holder中
    OH_ArkUI_SurfaceCallback_SetSurfaceCreatedEvent(callback, OnSurfaceCreated);     // 注册OnSurfaceCreated回调
    OH_ArkUI_SurfaceCallback_SetSurfaceChangedEvent(callback, OnSurfaceChanged);     // 注册OnSurfaceChanged回调
    OH_ArkUI_SurfaceCallback_SetSurfaceDestroyedEvent(callback, OnSurfaceDestroyed); // 注册OnSurfaceDestroyed回调
    OH_ArkUI_SurfaceCallback_SetSurfaceShowEvent(callback, OnSurfaceShow);           // 注册OnSurfaceShow回调
    OH_ArkUI_SurfaceCallback_SetSurfaceHideEvent(callback, OnSurfaceHide);           // 注册OnSurfaceHide回调
    OH_ArkUI_XComponent_RegisterOnFrameCallback(handle, OnFrameCallback);            // 注册OnFrameCallback回调
    OH_ArkUI_SurfaceHolder_AddSurfaceCallback(holder, callback);                     // 注册SurfaceCallback回调
    if (!nodeAPI->addNodeEventReceiver(handle, onEvent)) { // 添加事件监听，返回成功码 0
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "addNodeEventReceiver error");
    }
    if (!nodeAPI->registerNodeEvent(handle, NODE_TOUCH_EVENT, 0, nullptr)) { // 用C接口注册touch事件，返回成功码 0
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "onBind", "registerTouchEvent error");
    }
    provider_ = OH_ArkUI_AccessibilityProvider_Create(handle); // 创建一个ArkUI_AccessibilityProvider类型的对象
    
    // 创建SurfaceConfig: true
    ArkUI_XComponentSurfaceConfig* surfaceConfig =  OH_ArkUI_XComponentSurfaceConfig_Create();
    OH_ArkUI_XComponentSurfaceConfig_SetIsOpaque(surfaceConfig, true);
    auto ret = OH_ArkUI_SurfaceHolder_SetSurfaceConfig(holder, surfaceConfig);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestXComponentIgnoreBufferAlpha001 ret=%{public}d", ret);
    OH_ArkUI_XComponentSurfaceConfig_Dispose(surfaceConfig);

    return nullptr;
}

napi_value XComponentSurfaceConfigTest::UnbindNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    ArkUI_NodeHandle node;
    if (nodeHandleMap_.find(nodeId) == nodeHandleMap_.end()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SetNeedSoftKeyboard", "nodeId not exit error");
        return nullptr;
    }
    node = nodeHandleMap_[nodeId];
    OH_ArkUI_XComponent_UnregisterOnFrameCallback(node); // 解注册帧回调
    OH_ArkUI_AccessibilityProvider_Dispose(provider_);   // 销毁 ArkUI_AccessibilityProvider
    auto holder = surfaceHolderMap_[node];
    if (XComponentSurfaceConfigTest::callbackMap_.count(holder)) {
        auto callback = XComponentSurfaceConfigTest::callbackMap_[holder];
        OH_ArkUI_SurfaceHolder_RemoveSurfaceCallback(holder, callback); // 移除SurfaceCallback
        OH_ArkUI_SurfaceCallback_Dispose(callback);                     // 销毁surfaceCallback
        XComponentSurfaceConfigTest::callbackMap_.erase(holder);
    }
    auto render = reinterpret_cast<EGLRender*>(OH_ArkUI_SurfaceHolder_GetUserData(holder));
    delete render; // 销毁EGLRender对象
    OH_ArkUI_SurfaceHolder_Dispose(holder); // 销毁surfaceHolder
    nodeAPI->disposeNode(node);             // 销毁nodeHandle
    nodeHandleMap_.erase(nodeId);
    return nullptr;
}

napi_value XComponentSurfaceConfigTest::DrawStar(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    ArkUI_NodeHandle node;
    if (nodeHandleMap_.find(nodeId) == nodeHandleMap_.end()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SetNeedSoftKeyboard", "nodeId not exit error");
        return nullptr;
    }
    node = nodeHandleMap_[nodeId];
    auto holder = surfaceHolderMap_[node];
    EGLRender* render = reinterpret_cast<EGLRender*>(OH_ArkUI_SurfaceHolder_GetUserData(holder));
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onBind", "YGB DrawStar w:[%{public}d],h[%{public}d]", render->width_,
                 render->height_);
    render->DrawStar(true); // 绘制五角星
    return nullptr;
}

napi_value XComponentSurfaceConfigTest::TestSetSurfaceConfigErrorCode001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    ArkUI_NodeHandle handle = nodeHandleMap_[nodeId];
    OH_ArkUI_SurfaceHolder *holder = surfaceHolderMap_[handle]; // 获取 SurfaceHolder

    // 创建SurfaceConfig: true
    ArkUI_XComponentSurfaceConfig* surfaceConfig =  OH_ArkUI_XComponentSurfaceConfig_Create();
    OH_ArkUI_XComponentSurfaceConfig_SetIsOpaque(surfaceConfig, true);
    auto ret = OH_ArkUI_SurfaceHolder_SetSurfaceConfig(holder, surfaceConfig);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestXComponentIgnoreBufferAlpha001 ret=%{public}d", ret);
    OH_ArkUI_XComponentSurfaceConfig_Dispose(surfaceConfig);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value XComponentSurfaceConfigTest::TestSetSurfaceConfigErrorCode002(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string nodeId = value2String(env, args[0]);
    ArkUI_NodeHandle handle = nodeHandleMap_[nodeId];
    OH_ArkUI_SurfaceHolder *holder = surfaceHolderMap_[handle]; // 获取 SurfaceHolder

    // Error code: ARKUI_ERROR_CODE_PARAM_INVALID
    auto ret = OH_ArkUI_SurfaceHolder_SetSurfaceConfig(holder, NULL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestXComponentIgnoreBufferAlpha001 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value XComponentSurfaceConfigTest::TestSurfaceConfigCreateReturnNoNullptr(napi_env env, napi_callback_info info) {
    // 创建SurfaceConfig
    ArkUI_XComponentSurfaceConfig* surfaceConfig =  OH_ArkUI_XComponentSurfaceConfig_Create();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestSurfaceConfigCreateReturnNoNullptr ret=%{public}p", surfaceConfig);

    ASSERT_OBJ_NE(surfaceConfig, nullptr);
    OH_ArkUI_XComponentSurfaceConfig_Dispose(surfaceConfig);
    NAPI_END;
}

} // namespace NativeXComponentSample