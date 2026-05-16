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
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include "xcomponent_lifecycle_test.h"
#include "render/EGLRender.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include "napi/native_api.h"
#include <arkui/native_interface.h>
#include <hilog/log.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <unordered_map>
#include <string>

namespace ArkUICapiTest {
static std::unordered_map<OH_ArkUI_SurfaceHolder*, EGLRender*> Renders;
static ArkUI_NativeNodeAPI_1* nodeAPI;
ArkUI_NodeHandle xcomponent_ = nullptr;
ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
OH_ArkUI_SurfaceHolder* holder_ = nullptr;
OH_ArkUI_SurfaceCallback* callback_;
OH_ArkUI_SurfaceCallback* tempCallback_;
uint64_t width_ = 0;
uint64_t height_ = 0;

static std::string value2String(napi_env env, napi_value value){
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    return valueString;
}

void onEvent(ArkUI_NodeEvent* event) {
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "wds on event");
    if (eventType == NODE_TOUCH_EVENT) {
        auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        float x = OH_ArkUI_PointerEvent_GetX(uiInputEvent);
        float y = OH_ArkUI_PointerEvent_GetY(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "wds on touch");
    } 
};

void OnSurfaceCreatedCB(OH_ArkUI_SurfaceHolder* holder)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_OnSurfaceCreatedCB holder %{public}p", holder);
    void* window = (void*)OH_ArkUI_XComponent_GetNativeWindow(holder_);
    auto render = Renders[holder_];
    if (window && render) {
        render->SetUpEGLContext(window, 0);
        int32_t width;
        int32_t height;
        auto *nativeWindow = reinterpret_cast<OHNativeWindow *>(window);
        OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_BUFFER_GEOMETRY,&width, &height);
        render->SetEGLWindowSize(width, height);
    }
}

void OnSurfaceChangedCB(OH_ArkUI_SurfaceHolder* holder, uint64_t width, uint64_t height)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_OnSurfaceChangedCB width %{public}d height %{public}d", width, height);
    width_ = width;
    height_ = height;
    auto render = Renders[holder_];
    if (render != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_OnSurfaceChangedCB 1");
        render->SetEGLWindowSize(width, height);
        render->DrawStar();
    }
}

void OnSurfaceDestroyedCB(OH_ArkUI_SurfaceHolder* holder)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_OnSurfaceDestroyedCB");
}

napi_value XComponentLifeCycleTest::removeSurfaceCallback(napi_env env, napi_callback_info info) {
    auto status = OH_ArkUI_SurfaceHolder_RemoveSurfaceCallback(holder_, callback_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_removeSurfaceCallback status %{public}d", status);

    napi_value statusCode;
    napi_status ret = napi_create_int32(env, status, &(statusCode));
    
    return statusCode;
}

napi_value XComponentLifeCycleTest::setUserData(napi_env env, napi_callback_info info) {
    auto status = OH_ArkUI_SurfaceHolder_SetUserData(holder_, new std::string("Hello World"));
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_setUserData status %{public}d data %{public}s", status, "Hello World");
    return nullptr;
}

napi_value XComponentLifeCycleTest::getUserData(napi_env env, napi_callback_info info) {
    napi_value napiStr;
    std::string* data = (std::string*)OH_ArkUI_SurfaceHolder_GetUserData(holder_);
    if (data) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_getUserData data %{public}s", data->c_str());
        napi_create_string_latin1(env, data->c_str(), data->size(), &napiStr);
        return napiStr;
    }
    return nullptr;
}

ArkUI_NodeHandle CreateNodeHandlePre() {
    ArkUI_NodeHandle handle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT_TEXTURE);
    //获取SurfaceHolder
    holder_ = OH_ArkUI_SurfaceHolder_Create(handle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_CreateNodeHandlePre create surface holder %{public}p", holder_);
    callback_ = OH_ArkUI_SurfaceCallback_Create();
    
    OH_ArkUI_SurfaceCallback_SetSurfaceCreatedEvent(callback_, OnSurfaceCreatedCB);
    OH_ArkUI_SurfaceCallback_SetSurfaceChangedEvent(callback_, OnSurfaceChangedCB);
    OH_ArkUI_SurfaceCallback_SetSurfaceDestroyedEvent(callback_, OnSurfaceDestroyedCB);
    
    //往SurfaceHolder里添加callback
    if (holder_) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_preCreate get holder");
        OH_ArkUI_SurfaceHolder_AddSurfaceCallback(holder_, callback_);
        if (!Renders.count(holder_)) {
            Renders[holder_] = new EGLRender();
            auto render = Renders[holder_];
        }
    }
    // 设置AutoInitial为false
    if (OH_ArkUI_XComponent_SetAutoInitialize(handle, false) != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_SetAutoInitialize failed.");
    }

    // 获取isINitialized的值
    bool isInitialized = false;
    if (OH_ArkUI_XComponent_IsInitialized(handle, &isInitialized) != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "GetIsInitialized failed.");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "GetIsInitialized = %{public}d", isInitialized);
    }

     //添加事件监听，返回成功码 0 
    auto ret = nodeAPI->addNodeEventReceiver(handle, onEvent); 
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_addNodeEventReceiver ret=%{public}d", ret);
    
    // 用C接口注册touch事件，返回成功码 0 
    ret = nodeAPI->registerNodeEvent(handle, NODE_TOUCH_EVENT, 0, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_registerNodeEvent ret=%{public}d", ret);
    ArkUI_NumberValue value[] = {{.i32 = static_cast<int>(true)}};
    ArkUI_AttributeItem item = {value, 1};
    auto ec = nodeAPI->setAttribute(handle, NODE_XCOMPONENT_ENABLE_ANALYZER, &item);
    // 返回错误码
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_set attribute ret=%{public}d", ec);
    xcomponent_ = handle;
    return handle;
}

ArkUI_NodeHandle CreateNodeHandle(const std::string &tag) {
    ArkUI_NodeHandle handle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    
    //获取SurfaceHolder
    holder_ = OH_ArkUI_SurfaceHolder_Create(handle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_CreateNodeHandle create surface holder %{public}p", holder_);
    
    OHNativeWindow* window = OH_ArkUI_XComponent_GetNativeWindow(holder_);
    if (window) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_GetNativeWindow success");
    }
    
    callback_ = OH_ArkUI_SurfaceCallback_Create();
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_CreateNodeHandle callback_ %{public}p", callback_);
    
    OH_ArkUI_SurfaceCallback_SetSurfaceCreatedEvent(callback_, OnSurfaceCreatedCB);
    OH_ArkUI_SurfaceCallback_SetSurfaceChangedEvent(callback_, OnSurfaceChangedCB);
    OH_ArkUI_SurfaceCallback_SetSurfaceDestroyedEvent(callback_, OnSurfaceDestroyedCB);
    //往SurfaceHolder里添加callback
    if (holder_) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_CreateNodeHandle get holder");
        OH_ArkUI_SurfaceHolder_AddSurfaceCallback(holder_, callback_);
        if (!Renders.count(holder_)) {
            Renders[holder_] = new EGLRender();
            auto render = Renders[holder_];
        }
    }
    //设置AutoInitial为false
    if (OH_ArkUI_XComponent_SetAutoInitialize(handle, true) != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_SetAutoInitialize failed.");
    }
//    //获取isINitialized的值
    bool isInitialized = false;
    if (OH_ArkUI_XComponent_IsInitialized(handle, &isInitialized) != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "GetIsInitialized failed.");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "GetIsInitialized = %{public}d", isInitialized);
    }

    ArkUI_NumberValue value[] = {{.i32 = static_cast<int>(true)}};
    ArkUI_AttributeItem item = {value, 1};
    auto ec = nodeAPI->setAttribute(handle, NODE_XCOMPONENT_ENABLE_ANALYZER, &item);
    ArkUI_NumberValue value1[] = {{.u32 = 0x12345678}};
    ArkUI_AttributeItem item1 = {value1, 1};
    nodeAPI->setAttribute(handle, NODE_BACKGROUND_COLOR, &item1);
    // 返回错误码
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_set attribute ret=%{public}d", ec);
    xcomponent_ = handle;
    return handle;
}

napi_value XComponentLifeCycleTest::createNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "createNativeNode", "createNativeNode");
    size_t argCnt = 3;
    napi_value args[3] = { nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr);

    if (argCnt != 3) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*> (
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    
    std::string tag = value2String(env, args[1]);
    if (tag == "preCreate") {
        xcomponent_ = CreateNodeHandlePre();
    } else {
        xcomponent_ = CreateNodeHandle("cyc");
    }
    return nullptr;
}

napi_value XComponentLifeCycleTest::initialize(napi_env env, napi_callback_info info) {
    auto status = OH_ArkUI_XComponent_Initialize(xcomponent_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_Initialize. Code: %{public}d", status);

    napi_value statusCode;
    napi_status ret = napi_create_int32(env, status, &(statusCode));

    return statusCode;
}

napi_value XComponentLifeCycleTest::finalize(napi_env env, napi_callback_info info) {
    auto status = OH_ArkUI_XComponent_Finalize(xcomponent_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_Finalize. Code: %{public}d", status);

    napi_value statusCode;
    napi_status ret = napi_create_int32(env, status, &(statusCode));
    
    return statusCode;
}

napi_value XComponentLifeCycleTest::attachToMainTree(napi_env env, napi_callback_info info) {
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, xcomponent_);
    return nullptr;
}

napi_value XComponentLifeCycleTest::detachFromMainTree(napi_env env, napi_callback_info info) {
    OH_ArkUI_NodeContent_RemoveNode(nodeContentHandle_, xcomponent_);
    return nullptr;
}

napi_value XComponentLifeCycleTest::dispose(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_CNode dispose");
    OH_ArkUI_NodeContent_RemoveNode(nodeContentHandle_, xcomponent_);
    nodeAPI->disposeNode(xcomponent_);
    xcomponent_ = nullptr;
    if (holder_) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "jyy CYC_SurfaceHolder dispose");
        OH_ArkUI_SurfaceHolder_Dispose(holder_);
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "onbind", "CYC_dispose callback_ %{public}p", callback_);
    if (callback_) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_SurfaceCallback dispose 2");
        OH_ArkUI_SurfaceCallback_Dispose(callback_);
    }
    if (tempCallback_) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "XComponent_Native", "CYC_SurfaceCallback dispose");
        OH_ArkUI_SurfaceCallback_Dispose(tempCallback_);
    }
    return nullptr;
}

} // ArkUICapiTest
