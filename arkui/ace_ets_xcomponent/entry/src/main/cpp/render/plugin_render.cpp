/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <cstdint>

#include "native_common.h"
#include "plugin_common.h"
#include "plugin_manager.h"
#include "plugin_render.h"

#ifdef __cplusplus
extern "C" {
#endif

std::unordered_map<std::string, PluginRender*> PluginRender::instance_;

OH_NativeXComponent_Callback PluginRender::callback_;

uint32_t PluginRender::isCreated_ = 0;
uint32_t PluginRender::xcHeight_ = 0;
uint32_t PluginRender::xcWidth_ = 0;
double PluginRender::off_x = 0;
double PluginRender::off_y = 0;
uint32_t PluginRender::toolType_ = 5;
uint32_t PluginRender::mousecallback_ = 0;
float PluginRender::tiltX_ = 0;
float PluginRender::tiltY_ = 0;
uint32_t PluginRender::touchType = 4;
OH_NativeXComponent_TouchEvent PluginRender::testTouchEvent_;
OH_NativeXComponent_MouseEvent PluginRender::testMouseEvent_;
OH_NativeXComponent_MouseEvent_Callback PluginRender::mouseEventcallback_;

void OnSurfaceCreatedCB(OH_NativeXComponent* component, void* window)
{
    LOGE("OnSurfaceCreatedCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->OnSurfaceCreated(component, window);
}

void OnSurfaceChangedCB(OH_NativeXComponent* component, void* window)
{
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->OnSurfaceChanged(component, window);
}

void OnSurfaceDestroyedCB(OH_NativeXComponent* component, void* window)
{
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->OnSurfaceDestroyed(component, window);
}

void DispatchTouchEventCB(OH_NativeXComponent* component, void* window)
{
    LOGE("DispatchTouchEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->DispatchTouchEvent(component, window);
}

void DispatchMouseEventCB(OH_NativeXComponent* component, void* window)
{
    LOGD("DispatchMouseEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->DispatchMouseEvent(component, window);
}

PluginRender::PluginRender(std::string& id)
{
    id_ = id;
    component_ = nullptr;
    eglCore_ = new EGLCore(id);
    auto renderCallback = PluginRender::GetNXComponentCallback();
    renderCallback->OnSurfaceCreated = OnSurfaceCreatedCB;
    renderCallback->OnSurfaceChanged = OnSurfaceChangedCB;
    renderCallback->OnSurfaceDestroyed = OnSurfaceDestroyedCB;
    renderCallback->DispatchTouchEvent = DispatchTouchEventCB;
    auto renderMouseEventCallback = PluginRender::GetNXComponentMouseEventCallback();
    renderMouseEventCallback->DispatchMouseEvent = DispatchMouseEventCB;
}

PluginRender* PluginRender::GetInstance(std::string& id)
{
    if (instance_.find(id) == instance_.end()) {
        PluginRender*  instance = new PluginRender(id);
        instance_[id] = instance;
        return instance;
    } else {
        return instance_[id];
    }
}

OH_NativeXComponent_Callback* PluginRender::GetNXComponentCallback()
{
    return &PluginRender::callback_;
}

OH_NativeXComponent_MouseEvent_Callback* PluginRender::GetNXComponentMouseEventCallback()
{
    return &PluginRender::mouseEventcallback_;
}

void PluginRender::SetNativeXComponent(OH_NativeXComponent* component)
{
    component_ = component;
    OH_NativeXComponent_RegisterCallback(component_, &PluginRender::callback_);
    uint32_t mousecallback = OH_NativeXComponent_RegisterMouseEventCallback(component_,
        &PluginRender::mouseEventcallback_);
    mousecallback_ = mousecallback;
}

void PluginRender::OnSurfaceCreated(OH_NativeXComponent* component, void* window)
{
    LOGE("xclog PluginRender::OnSurfaceCreated");

    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);

    LOGE("xclog Offset : x = %{public}f, y = %{public}f ", x_, y_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        eglCore_->GLContextInit(window, width_, height_);
        isCreated_++;
        xcHeight_ = height_;
        xcWidth_ = width_;

        LOGE("xclog PluginRender::OnSurfaceCreated success ");
        LOGE("xclog PluginRender::OnSurfaceCreated iscreated %{public}d", isCreated_);
    } else {
        LOGE("xclog PluginRender::OnSurfaceCreated failed");
    }
}

void PluginRender::OnSurfaceChanged(OH_NativeXComponent* component, void* window)
{
    LOGE("PluginRender::OnSurfaceChanged");
    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);
    int32_t ret1;
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        xcHeight_ = height_;
        xcWidth_ = width_;
        LOGE("xclog after width = %{public}d, height = %{public}d", xcWidth_, xcHeight_);
        ret1= OH_NativeXComponent_GetXComponentOffset(component, window, &x_, &y_);
        off_x = x_;
        off_y = y_;

        if (ret1 == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            LOGE("xclog Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
        } else {
            LOGE("xclog Offset get failed");
        }

        LOGE("xclog PluginRender::GetOffset ");
        LOGE("xclog Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
    }
}

void PluginRender::OnSurfaceDestroyed(OH_NativeXComponent* component, void* window)
{
    LOGE("xclog PluginRender::OnSurfaceDestroyed");
    isCreated_--;
    LOGE("xclog PluginRender::OnSurfaceDestroyed iscreated %{public}d", isCreated_);
}

void PluginRender::DispatchTouchEvent(OH_NativeXComponent* component, void* window)
{
    int32_t ret = OH_NativeXComponent_GetTouchEvent(component, window, &touchEvent_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        testTouchEvent_ = touchEvent_;
        LOGE("Touch Info : x = %{public}f, y = %{public}f screenx = %{public}f, screeny = %{public}f",
            touchEvent_.x, touchEvent_.y, touchEvent_.screenX, touchEvent_.screenY);
        for (uint32_t i = 0; i < touchEvent_.numPoints; i++) {
            LOGE("Touch Info : dots[%{public}d] id %{public}d x = %{public}f, y = %{public}f", i,
                touchEvent_.touchPoints[i].id, touchEvent_.touchPoints[i].x, touchEvent_.touchPoints[i].y);
            LOGE("Touch Info : screenx = %{public}f, screeny = %{public}f",
                touchEvent_.touchPoints[i].screenX, touchEvent_.touchPoints[i].screenY);
            OH_NativeXComponent_TouchPointToolType toolType = OH_NativeXComponent_TouchPointToolType::OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN;
            float tiltX = 123.0;
            float tiltY = 321.0;
            [[maybe_unused]] int32_t ret1;
            [[maybe_unused]] int32_t ret2;
            [[maybe_unused]] int32_t ret3;
            ret1 = OH_NativeXComponent_GetTouchPointToolType(component, i, &toolType);
            ret2 = OH_NativeXComponent_GetTouchPointTiltX(component, i, &tiltX);
            ret3 = OH_NativeXComponent_GetTouchPointTiltY(component, i, &tiltY);
            toolType_ = toolType;
            tiltX_ = tiltX;
            tiltY_ = tiltY;
            LOGE("Touch Info : DispatchTouchEvent dots[%{public}d] toolType=%{public}u, tiltX=%{public}f, tiltY=%{public}f",
                i, toolType, tiltX, tiltY);
        }
    } else {
        LOGE("Touch fail");
    }
}

napi_value PluginRender::Export(napi_env env, napi_value exports)
{
    LOGE("PluginRender::Export");
    // Register JS API
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("changeShape", PluginRender::NapiChangeShape),
        DECLARE_NAPI_FUNCTION("drawTriangle", PluginRender::NapiDrawTriangle),
        DECLARE_NAPI_FUNCTION("changeColor", PluginRender::NapiChangeColor),
        DECLARE_NAPI_FUNCTION("TestGetXComponentId", PluginRender::TestGetXComponentId),
        DECLARE_NAPI_FUNCTION("TestOnSurfaceCreated", PluginRender::TestOnSurfaceCreated),
        DECLARE_NAPI_FUNCTION("TestGetXComponentSize_Height", PluginRender::TestGetXComponentSize_Height),
        DECLARE_NAPI_FUNCTION("TestGetXComponentSize_Width", PluginRender::TestGetXComponentSize_Width),
        DECLARE_NAPI_FUNCTION("TestGetXComponentOffset_x", PluginRender::TestGetXComponentOffset_x),
        DECLARE_NAPI_FUNCTION("TestGetXComponentOffset_y", PluginRender::TestGetXComponentOffset_y),
        DECLARE_NAPI_FUNCTION("TestGetXComponent_TouchEvent", PluginRender::TestGetXComponent_TouchEvent),
        DECLARE_NAPI_FUNCTION("TestGetXComponent_MouseEvent", PluginRender::TestGetXComponent_MouseEvent),
        DECLARE_NAPI_FUNCTION("TestGetXComponentpointtool_tilty", PluginRender::TestGetXComponentpointtool_tilty),
        DECLARE_NAPI_FUNCTION("TestGetXComponentpointtool_type", PluginRender::TestGetXComponentpointtool_type),
        DECLARE_NAPI_FUNCTION("TestGetXComponentpointtool_tiltx", PluginRender::TestGetXComponentpointtool_tiltx),
        DECLARE_NAPI_FUNCTION("TestGetXComponent_RegisterMouseEventCallback",
            PluginRender::TestGetXComponent_RegisterMouseEventCallback),

    };
    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc));
    return exports;
}

void PluginRender::DispatchMouseEvent(OH_NativeXComponent* component, void* window)
{
    LOGE("----------TestMouse Mouse Info DispatchMouseEvent 11");
    int32_t ret = OH_NativeXComponent_GetMouseEvent(component, window, &mouseEvent_);
    LOGE("----------TestMouse Mouse Info DispatchMouseEvent");
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        testMouseEvent_ = mouseEvent_;
        LOGE("TestMouse Mouse Info : x = %{public}f, y = %{public}f screenx = %{public}f, screeny = %{public}f",
            mouseEvent_.x, mouseEvent_.y, mouseEvent_.screenX, mouseEvent_.screenY);
        LOGE("TestMouse Mouse Info : action = %{public}d, button = %{public}d", mouseEvent_.action, mouseEvent_.button);
    } else {
        LOGE("Mouse Info fail");
    }
}

napi_value PluginRender::NapiChangeShape(napi_env env, napi_callback_info info)
{
    LOGE("NapiChangeShape");
    napi_value exportInstance;
    napi_value thisArg;
    [[maybe_unused]] napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* instance = PluginRender::GetInstance(id);
    if (instance) {
        instance->eglCore_->ChangeShape();
    }
    return nullptr;
}

napi_value PluginRender::NapiDrawTriangle(napi_env env, napi_callback_info info)
{
    LOGE("NapiDrawTriangle");
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* instance = PluginRender::GetInstance(id);
    if (instance) {
        instance->eglCore_->DrawTriangle();
    }
    return nullptr;
}

napi_value PluginRender::NapiChangeColor(napi_env env, napi_callback_info info)
{
    LOGE("NapiChangeColor");
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    }

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* instance = PluginRender::GetInstance(id);
    if (instance) {
        instance->eglCore_->ChangeColor();
    }
    return nullptr;
}

napi_value PluginRender::TestGetXComponentId(napi_env env, napi_callback_info info)
{
    napi_value thisArg;
    [[maybe_unused]] napi_status status;
    napi_value exportInstance;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));
    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    };

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, idStr, id.length(), &output));

    return output;
}

napi_value PluginRender::TestOnSurfaceCreated(napi_env env, napi_callback_info info)
{
    LOGE("xclog iscreated instance.size ");

    napi_value output;
    NAPI_CALL(env, napi_get_boolean(env, isCreated_ == instance_.size(), &output));
    LOGE("xclog iscreated instance.size ");

    return output;
}

napi_value PluginRender::TestGetXComponentSize_Height(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentSize_Height");
    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, xcHeight_, &output));
    LOGE("xclog  TestGetXComponentSize_Height %{public}d ", xcHeight_);
    return output;
}

napi_value PluginRender::TestGetXComponentSize_Width(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentSize_Width");
    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, xcWidth_, &output));
    LOGE("xclog  TestGetXComponentSize_Width %{public}d ", xcWidth_);
    return output;
}

napi_value PluginRender::TestGetXComponentOffset_x(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentOffset_x");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, off_x, &output));
    LOGE("xclog TestGetXComponentOffset_x : %{public}f", off_x);

    return output;
}

napi_value PluginRender::TestGetXComponentOffset_y(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentOffset_y");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, off_y, &output));
    LOGE("xclog TestGetXComponentOffset_y : %{public}f", off_y);

    return output;
}

napi_value PluginRender::TestGetXComponentpointtool_tiltx(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentpointtool_tiltx");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, tiltX_, &output));
    LOGE("xclog TestGetXComponentpointtool_tiltx : %{public}f", tiltX_);

    return output;
}

napi_value PluginRender::TestGetXComponentpointtool_tilty(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentpointtool_tilty");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, tiltY_, &output));
    LOGE("xclog TestGetXComponentpointtool_tilty : %{public}f", tiltY_);

    return output;
}

napi_value PluginRender::TestGetXComponentpointtool_type(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentpointtool_type");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, toolType_, &output));
    LOGE("xclog TestGetXComponentpointtool_type : %{public}u", toolType_);

    return output;
}

napi_value PluginRender::TestGetXComponent_TouchEvent(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponent_TouchEvent");

    napi_value surf_x;
    napi_value surf_y;
    napi_value t_type;

    NAPI_CALL(env, napi_create_double(env, testTouchEvent_.x, &(surf_x)));
    NAPI_CALL(env, napi_create_double(env, testTouchEvent_.y, &(surf_y)));
    NAPI_CALL(env, napi_create_uint32(env, testTouchEvent_.type, &(t_type)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_X", surf_x));  // float x
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_Y", surf_y));  // float y
    NAPI_CALL(env, napi_set_named_property(env, obj, "touchType", t_type));  // int32_t

    return obj;
}

napi_value PluginRender::TestGetXComponent_MouseEvent(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponent_MouseEvent");

    napi_value surf_x;
    napi_value surf_y;
    napi_value t_button;

    NAPI_CALL(env, napi_create_double(env, testMouseEvent_.x, &(surf_x)));
    NAPI_CALL(env, napi_create_double(env, testMouseEvent_.y, &(surf_y)));
    NAPI_CALL(env, napi_create_uint32(env, testMouseEvent_.button, &(t_button)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_X1", surf_x));  // float x
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_Y1", surf_y));  // float y
    NAPI_CALL(env, napi_set_named_property(env, obj, "mousebutton", t_button));  // int32_t

    return obj;
}


napi_value PluginRender::TestGetXComponent_RegisterMouseEventCallback(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponent_RegisterMouseEventCallback");

    napi_value callback_;
    NAPI_CALL(env, napi_create_double(env, mousecallback_, &(callback_)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "MouseCallback_", callback_));  // float x

    return obj;
}

#ifdef __cplusplus
}
#endif
