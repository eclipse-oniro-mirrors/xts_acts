//
// Created on 2023/12/5.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <cstdint>
#include <string>

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <hilog/log.h>

#include "container.h"
// #include <node/myNode.h>

namespace NativeXComponentSample {
    namespace {
        void OnSurfaceCreatedCB(OH_NativeXComponent *component, void *window) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceCreatedCB");
            if ((component == nullptr) || (window == nullptr)) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "OnSurfaceCreatedCB: component or window is null");
                return;
            }

            //
            //        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  3333333");
            //        OH_NativeNode *nodeAPI;
            //        OH_NativeXComponent_GetNativeNode(component, &nodeAPI);
            //        if (nodeAPI != nullptr) {
            //            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  34444");
            //            if (nodeAPI->CreateNode != nullptr && nodeAPI->AddChild != nullptr &&
            //            nodeAPI->GetCommonModifier) {
            //                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OnSurfaceCreatedCB 222--1");
            //
            //                const OH_CommonModifier *modifier = nodeAPI->GetCommonModifier();
            //
            //                OH_NativeNodeHandle text1 = nodeAPI->CreateNode("Text", 100, 0);
            //                modifier->SetWidth(text1, 100, 0, nullptr); // 100px
            //                modifier->SetHeight(text1, 30, 0, nullptr); // px
            //                modifier->SetBackgroundColor(text1, 0xfffff0f0);
            //                modifier->SetPosition(text1, 10, 0, 10, 0); // 10px, 10px
            //
            //                OH_NativeNodeHandle text2 = nodeAPI->CreateNode("Text", 102, 1);
            //                modifier->SetWidth(text2, 1, 3, nullptr);   // 100 percent
            //                modifier->SetHeight(text2, 30, 0, nullptr); // px
            //                modifier->SetBackgroundColor(text2, 0xffff0000);
            //                modifier->SetPosition(text2, 10, 0, 50, 0); // 10px, 10px
            //
            //                OH_NativeNodeHandle text3 = nodeAPI->CreateNode("Text", 104, 2);
            //                modifier->SetWidth(text3, 0.9, 3, nullptr); // 90 percent
            //                modifier->SetHeight(text3, 30, 0, nullptr); // px
            //                modifier->SetBackgroundColor(text3, 0xff0000ff);
            //                modifier->SetPosition(text3, 10, 0, 180, 0); // 10px, 10px
            //
            //                OH_NativeNodeHandle stack = nodeAPI->CreateNode("Stack", 105, 2);
            //
            //                modifier->SetWidth(stack, 1, 3, nullptr);    // 200px
            //                modifier->SetHeight(stack, 400, 0, nullptr); // 200px
            //                modifier->SetBackgroundColor(stack, 0xffffff00);
            //
            //                OH_NativeNodeHandle scroll = nodeAPI->CreateNode("Scroll", 106, 2);
            //
            //                modifier->SetWidth(scroll, 1, 3, nullptr);    // 200px
            //                modifier->SetHeight(scroll, 100, 0, nullptr); // 200px
            //                modifier->SetBackgroundColor(scroll, 0xff00f000);
            //
            //                nodeAPI->AddChild(stack, text1);
            //                nodeAPI->AddChild(stack, text2);
            //                nodeAPI->AddChild(stack, text3);
            //                nodeAPI->AddChild(scroll, stack);
            //
            //                OH_NativeXComponent_AttachNativeRootNode(component, scroll);
            //                OH_NativeXComponent_MarkDirtyContainer(component, 1 << 9);
            //            }
            //        }
            //        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  555");


            char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
            uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
            if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "OnSurfaceCreatedCB: Unable to get XComponent id");
                return;
            }

            std::string id(idStr);
            auto render = Container::GetInstance(id);
            uint64_t width;
            uint64_t height;
            int32_t xSize = OH_NativeXComponent_GetXComponentSize(component, window, &width, &height);
            if ((xSize == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) && (render != nullptr)) {
                //                if (render->eglCore_->EglContextInit(window, width, height)) {
                //                    render->eglCore_->Background();
                //                }
            }
        }

        void OnSurfaceChangedCB(OH_NativeXComponent *component, void *window) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceChangedCB");
            if ((component == nullptr) || (window == nullptr)) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "OnSurfaceChangedCB: component or window is null");
                return;
            }

            char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
            uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
            if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "OnSurfaceChangedCB: Unable to get XComponent id");
                return;
            }


            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceChangedCB  1111");
            //        OH_NativeNode* nodeAPI;
            //        OH_NativeXComponent_GetNativeNode(component, &nodeAPI);
            //        if(nodeAPI != nullptr) {
            //            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceChangedCB  222");
            //            if (nodeAPI->GetNodeById != nullptr && nodeAPI->RemoveChild != nullptr ) {
            //                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceChangedCB
            //                222--1");
            //
            //                ArkUI_NodeHandle text1 = nodeAPI->GetNodeById(100);
            //                //OH_NativeNodeHandle text1 = nodeAPI->GetNodeById(102);
            //                ArkUI_NodeHandle text3 = nodeAPI->GetNodeById(104);
            //                ArkUI_NodeHandle stack = nodeAPI->GetNodeById(105);
            //
            //                nodeAPI->RemoveChild(stack, text1);
            //                nodeAPI->RemoveChild(stack, text3);
            //                OH_NativeXComponent_MarkDirtyContainer(component,1 << 9);
            //            }
            //        }
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceCreatedCB  333");


            std::string id(idStr);
            auto container = Container::GetInstance(id);
            if (container != nullptr) {
                container->OnSurfaceChanged(component, window);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "surface changed");
            }
        }

        void OnSurfaceDestroyedCB(OH_NativeXComponent *component, void *window) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnSurfaceDestroyedCB");
            if ((component == nullptr) || (window == nullptr)) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "OnSurfaceDestroyedCB: component or window is null");
                return;
            }

            char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
            uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
            if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "OnSurfaceDestroyedCB: Unable to get XComponent id");
                return;
            }

            std::string id(idStr);
            Container::Release(id);
        }

        void DispatchTouchEventCB(OH_NativeXComponent *component, void *window) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "DispatchTouchEventCB");
            if ((component == nullptr) || (window == nullptr)) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "DispatchTouchEventCB: component or window is null");
                return;
            }

            char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
            uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
            if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                             "DispatchTouchEventCB: Unable to get XComponent id");
                return;
            }

            std::string id(idStr);
            Container *render = Container::GetInstance(id);
            if (render != nullptr) {
                render->OnTouchEvent(component, window);
            }
        }

        void DispatchMouseEventCB(OH_NativeXComponent *component, void *window) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "DispatchMouseEventCB");
            int32_t ret;
            char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
            uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
            ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
            if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
                return;
            }

            std::string id(idStr);
            auto render = Container::GetInstance(id);
            if (render != nullptr) {
                render->OnMouseEvent(component, window);
            }
        }


        void DispatchHoverEventCB(OH_NativeXComponent *component, bool isHover) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "DispatchHoverEventCB");
            int32_t ret;
            char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
            uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
            ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
            if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
                return;
            }

            std::string id(idStr);
            auto container = Container::GetInstance(id);
            if (container != nullptr) {
                container->OnHoverEvent(component, isHover);
            }
        }

        //    void OnKeyEventCB(OH_NativeXComponent *component, void *window) {
        //        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Callback", "OnKeyEventCB");
        //        int32_t ret;
        //        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
        //        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        //        ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
        //        if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        //            return;
        //        }
        //        std::string id(idStr);
        //        auto container = Container::GetInstance(id);
        //        if (container != nullptr) {
        //            container->OnKeyEvent(component, window);
        //        }
        //    }
    } // namespace


    std::unordered_map<std::string, Container *> Container::instance_;

    //    int32_t Container::hasDraw_ = 0;
    //    int32_t Container::hasChangeColor_ = 0;

    Container::Container(const std::string &id) {
        this->id_ = id;
        //        this->eglCore_ = new EGLCore();
    }

    Container *Container::GetInstance(const std::string &id) {
        if (instance_.find(id) == instance_.end()) {
            Container *instance = new Container(id);
            instance_[id] = instance;
            return instance;
        } else {
            return instance_[id];
        }
    }

    //    void Container::Export(napi_env env, napi_value exports) {
    //        if ((env == nullptr) || (exports == nullptr)) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container", "Export: env or exports is null");
    //            return;
    //        }
    //
    //        napi_property_descriptor desc[] = {
    //            {"drawPattern", nullptr, Container::NapiDrawPattern, nullptr, nullptr, nullptr, napi_default,
    //            nullptr},
    //            {"getStatus", nullptr, Container::TestGetXComponentStatus, nullptr, nullptr, nullptr, napi_default,
    //             nullptr}};
    //        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container", "Export: napi_define_properties
    //            failed");
    //        }
    //    }
    //
    //    // NAPI registration method type napi_callback. If no value is returned, nullptr is returned.
    //    napi_value Container::NapiDrawPattern(napi_env env, napi_callback_info info) {
    //        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", "NapiDrawPattern");
    //        if ((env == nullptr) || (info == nullptr)) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container", "NapiDrawPattern: env or info is
    //            null"); return nullptr;
    //        }
    //
    //        napi_value thisArg;
    //        if (napi_get_cb_info(env, info, nullptr, nullptr, &thisArg, nullptr) != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container",
    //                         "NapiDrawPattern: napi_get_cb_info fail");
    //            return nullptr;
    //        }
    //
    //        napi_value exportInstance;
    //        if (napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container",
    //                         "NapiDrawPattern: napi_get_named_property fail");
    //            return nullptr;
    //        }
    //
    //        OH_NativeXComponent *nativeXComponent = nullptr;
    //        if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container", "NapiDrawPattern: napi_unwrap fail");
    //            return nullptr;
    //        }
    //
    //        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    //        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    //        if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) !=
    //            OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container",
    //                         "NapiDrawPattern: Unable to get XComponent id");
    //            return nullptr;
    //        }
    //
    //        std::string id(idStr);
    //        Container *render = Container::GetInstance(id);
    //        if (render != nullptr) {
    //           // render->eglCore_->Draw();
    //            hasDraw_ = 1;
    //            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", "render->eglCore_->Draw() executed");
    //        }
    //        return nullptr;
    //    }

    void Container::Release(const std::string &id) {
        Container *render = Container::GetInstance(id);
        if (render != nullptr) {
        }
    }

    void Container::OnSurfaceChanged(OH_NativeXComponent *component, void *window) {
        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                         "OnSurfaceChanged: Unable to get XComponent id");
            return;
        }

        std::string id(idStr);
        Container *container = Container::GetInstance(id);
        double offsetX;
        double offsetY;
        OH_NativeXComponent_GetXComponentOffset(component, window, &offsetX, &offsetY);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OH_NativeXComponent_GetXComponentOffset",
                     "offsetX = %{public}lf, offsetY = %{public}lf", offsetX, offsetY);
        uint64_t width;
        uint64_t height;
        OH_NativeXComponent_GetXComponentSize(component, window, &width, &height);
        if (container != nullptr) {
            // container->eglCore_->UpdateSize(width, height);
        }
    }

    void Container::OnTouchEvent(OH_NativeXComponent *component, void *window) {
        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        if (OH_NativeXComponent_GetXComponentId(component, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback",
                         "DispatchTouchEventCB: Unable to get XComponent id");
            return;
        }
        OH_NativeXComponent_TouchEvent touchEvent;
        OH_NativeXComponent_GetTouchEvent(component, window, &touchEvent);
        std::string id(idStr);
        Container *container = Container::GetInstance(id);
        if (container != nullptr && touchEvent.type == OH_NativeXComponent_TouchEventType::OH_NATIVEXCOMPONENT_UP) {
            // container->eglCore_->ChangeColor();
            // hasChangeColor_ = 1;
        }
        float tiltX = 0.0f;
        float tiltY = 0.0f;
        OH_NativeXComponent_TouchPointToolType toolType =
            OH_NativeXComponent_TouchPointToolType::OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN;
        OH_NativeXComponent_GetTouchPointToolType(component, 0, &toolType);
        OH_NativeXComponent_GetTouchPointTiltX(component, 0, &tiltX);
        OH_NativeXComponent_GetTouchPointTiltY(component, 0, &tiltY);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "OnTouchEvent",
                     "touch info: toolType = %{public}d, tiltX = %{public}lf, tiltY = %{public}lf", toolType, tiltX,
                     tiltY);
    }

    void Container::RegisterCallback(OH_NativeXComponent *nativeXComponent) {
        containerCallback_.OnSurfaceCreated = OnSurfaceCreatedCB;
        containerCallback_.OnSurfaceChanged = OnSurfaceChangedCB;
        containerCallback_.OnSurfaceDestroyed = OnSurfaceDestroyedCB;
        containerCallback_.DispatchTouchEvent = DispatchTouchEventCB;
        OH_NativeXComponent_RegisterCallback(nativeXComponent, &containerCallback_);

        mouseCallback_.DispatchMouseEvent = DispatchMouseEventCB;
        mouseCallback_.DispatchHoverEvent = DispatchHoverEventCB;
        OH_NativeXComponent_RegisterMouseEventCallback(nativeXComponent, &mouseCallback_);
        // OH_NativeXComponent_RegisterKeyEventCallback(nativeXComponent, OnKeyEventCB);
    }

    void Container::OnMouseEvent(OH_NativeXComponent *component, void *window) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", "OnMouseEvent");
        OH_NativeXComponent_MouseEvent mouseEvent;
        int32_t ret = OH_NativeXComponent_GetMouseEvent(component, window, &mouseEvent);
        if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container",
                         "MouseEvent Info: x = %{public}f, y = %{public}f, action = %{public}d, button = %{public}d",
                         mouseEvent.x, mouseEvent.y, mouseEvent.action, mouseEvent.button);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container", "GetMouseEvent error");
        }
    }

    void Container::OnHoverEvent(OH_NativeXComponent *component, bool isHover) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", "OnHoverEvent isHover_ = %{public}d", isHover);
    }

    void Container::OnKeyEvent(OH_NativeXComponent *component, void *window) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", "OnKeyEvent");

        //        OH_NativeXComponent_KeyEvent *keyEvent = nullptr;
        //        if (OH_NativeXComponent_GetKeyEvent(component, &keyEvent) >= 0) {
        //            OH_NativeXComponent_KeyAction action;
        //            OH_NativeXComponent_GetKeyEventAction(keyEvent, &action);
        //            OH_NativeXComponent_KeyCode code;
        //            OH_NativeXComponent_GetKeyEventCode(keyEvent, &code);
        //            OH_NativeXComponent_EventSourceType sourceType;
        //            OH_NativeXComponent_GetKeyEventSourceType(keyEvent, &sourceType);
        //            int64_t deviceId;
        //            OH_NativeXComponent_GetKeyEventDeviceId(keyEvent, &deviceId);
        //            int64_t timeStamp;
        //            OH_NativeXComponent_GetKeyEventTimestamp(keyEvent, &timeStamp);
        //            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container",
        //                         "KeyEvent Info: action=%{public}d, code=%{public}d, sourceType=%{public}d, "
        //                         "deviceId=%{public}ld, timeStamp=%{public}ld",
        //                         action, code, sourceType, deviceId, timeStamp);
        //        } else {
        //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Container", "GetKeyEvent error");
        //        }
    }

    //    napi_value Container::TestGetXComponentStatus(napi_env env, napi_callback_info info) {
    //        napi_value hasDraw;
    //        napi_value hasChangeColor;
    //
    //        napi_status ret = napi_create_int32(env, hasDraw_, &(hasDraw));
    //        if (ret != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestGetXComponentStatus",
    //                         "napi_create_int32 hasDraw_ error");
    //            return nullptr;
    //        }
    //        ret = napi_create_int32(env, hasChangeColor_, &(hasChangeColor));
    //        if (ret != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestGetXComponentStatus",
    //                         "napi_create_int32 hasChangeColor_ error");
    //            return nullptr;
    //        }
    //
    //        napi_value obj;
    //        ret = napi_create_object(env, &obj);
    //        if (ret != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestGetXComponentStatus", "napi_create_object
    //            error"); return nullptr;
    //        }
    //        ret = napi_set_named_property(env, obj, "hasDraw", hasDraw);
    //        if (ret != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestGetXComponentStatus",
    //                         "napi_set_named_property hasDraw error");
    //            return nullptr;
    //        }
    //        ret = napi_set_named_property(env, obj, "hasChangeColor", hasChangeColor);
    //        if (ret != napi_ok) {
    //            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestGetXComponentStatus",
    //                         "napi_set_named_property hasChangeColor error");
    //            return nullptr;
    //        }
    //        return obj;
    //    }
} // namespace NativeXComponentSample
