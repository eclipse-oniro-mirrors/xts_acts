/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <asm-generic/stat.h>
#include <bits/alltypes.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <arkui/drag_and_drop.h>
#include "SelectedDragPreviewStyleTest.h"

namespace NativeXComponentSample {
    static ArkUI_NodeHandle drag_text = nullptr;
    static ArkUI_NodeHandle text = nullptr;
    ColorManager ColorManager::ColorManager_;

    ColorManager::~ColorManager() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager", "~ColorManager");
        for (auto iter = nativeXComponentMap_.begin(); iter != nativeXComponentMap_.end(); ++iter) {
            if (iter->second != nullptr) {
                iter->second = nullptr;
            }
        }
        nativeXComponentMap_.clear();

        for (auto iter = containerMap_.begin(); iter != containerMap_.end(); ++iter) {
            if (iter->second != nullptr) {
                delete iter->second;
                iter->second = nullptr;
            }
        }
        containerMap_.clear();
    }

    napi_value ColorManager::CreateNativeNode(napi_env env, napi_callback_info info) {

        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode env or info is null");
            return nullptr;
        }

        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode  1111");

        size_t argCnt = 2;
        napi_value args[2] = {nullptr};
        if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode napi_get_cb_info failed");
        }

        if (argCnt < 1) {
            napi_throw_type_error(env, NULL, "Wrong number of arguments");
            return nullptr;
        }

        napi_valuetype valuetype;
        if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
            napi_throw_type_error(env, NULL, "napi_typeof failed");
            return nullptr;
        }

        if (valuetype != napi_string) {
            napi_throw_type_error(env, NULL, "Wrong type of arguments");
            return nullptr;
        }

        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
        constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        size_t length;
        if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
            napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
            return nullptr;
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode  2222 %{public}s", idStr);

        auto manager = ColorManager::GetInstance();
        if (manager == nullptr) {
            return nullptr;
        }

        OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
        if (component == nullptr) {
            return nullptr;
        }

        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode  3333333");

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

        if (nodeAPI != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode  34444");
            if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ColorManager", "OnSurfaceCreatedCB  222--1");

            auto startDrag = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            ArkUI_NumberValue WidthPercentValue[] = {PARAM_1};
            ArkUI_AttributeItem WidthItemPercent = {WidthPercentValue, PARAM_1};
            ArkUI_NumberValue HeightPercentValue[] = {PARAM_1};
            ArkUI_AttributeItem HeightPercentItem = {HeightPercentValue, PARAM_1};
            nodeAPI->setAttribute(startDrag, NODE_WIDTH_PERCENT, &WidthItemPercent);
            nodeAPI->setAttribute(startDrag, NODE_HEIGHT_PERCENT, &HeightPercentItem);
            ArkUI_NumberValue marginValue[] = {PARAM_5};
            ArkUI_AttributeItem marginItem = {marginValue, PARAM_1};
            
            drag_text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            ArkUI_AttributeItem Text_Item = {.string = "test测试"};
            ArkUI_NumberValue copyOptVal = {.i32 = ARKUI_TEXT_COPY_OPTIONS_IN_APP};
            ArkUI_AttributeItem copyOptItem = {&copyOptVal, PARAM_1};
            nodeAPI->setAttribute(drag_text, NODE_TEXT_CONTENT, &Text_Item);
            nodeAPI->setAttribute(drag_text, NODE_TEXT_COPY_OPTION, &copyOptItem);
            ArkUI_SelectedDragPreviewStyle *text_options = OH_ArkUI_SelectedDragPreviewStyle_Create();
            OH_ArkUI_SelectedDragPreviewStyle_SetColor(text_options, 0xFFFF0000);
            uint32_t getColorText = OH_ArkUI_SelectedDragPreviewStyle_GetColor(text_options);
            ArkUI_AttributeItem textColorItem = {.size = PARAM_1, .object = text_options};
            nodeAPI->setAttribute(drag_text, NODE_TEXT_SELECTED_DRAG_PREVIEW_STYLE, &textColorItem);
            ArkUI_AttributeItem text_test_id_item = {};
            text_test_id_item.string = "text_test_capi";
            nodeAPI->setAttribute(drag_text, NODE_ID, &text_test_id_item);
            OH_ArkUI_SetNodeDraggable(drag_text, true);
            
            auto textInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
            ArkUI_AttributeItem input_Item = {.string = "TEXT_INPUT测试"};
            nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &input_Item);
            nodeAPI->setAttribute(textInput, NODE_MARGIN, &marginItem);
            nodeAPI->registerNodeEvent(textInput, NODE_ON_DRAG_START, PARAM_2, nullptr);
            ArkUI_SelectedDragPreviewStyle *textInput_options = OH_ArkUI_SelectedDragPreviewStyle_Create();
            OH_ArkUI_SelectedDragPreviewStyle_SetColor(textInput_options, 0xFFFFFF00);
            uint32_t getColorTextInput = OH_ArkUI_SelectedDragPreviewStyle_GetColor(textInput_options);
            
            ArkUI_AttributeItem textInputColorItem = {.size = PARAM_1, .object = textInput_options};
            nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_SELECTED_DRAG_PREVIEW_STYLE, &textInputColorItem);
            ArkUI_AttributeItem textInput_test_id_item = {};
            textInput_test_id_item.string = "textInput_test_capi";
            nodeAPI->setAttribute(textInput, NODE_ID, &textInput_test_id_item);
            OH_ArkUI_SetNodeDraggable(textInput, true);

            auto textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
            ArkUI_AttributeItem arae_Item0 = {.string = "TEXT_AREA测试"};
            nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &arae_Item0);
            nodeAPI->setAttribute(textArea, NODE_MARGIN, &marginItem);
            ArkUI_SelectedDragPreviewStyle *textArea_options = OH_ArkUI_SelectedDragPreviewStyle_Create();
            OH_ArkUI_SelectedDragPreviewStyle_SetColor(textArea_options, Undefined);
            uint32_t getColorTextArea = OH_ArkUI_SelectedDragPreviewStyle_GetColor(textArea_options);
            OH_ArkUI_SelectedDragPreviewStyle_Dispose(nullptr);
            ArkUI_AttributeItem textAreaColorItem = {.size = PARAM_1, .object = textArea_options};
            nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_SELECTED_DRAG_PREVIEW_STYLE, &textAreaColorItem);
            ArkUI_AttributeItem textArea_test_id_item = {};
            textArea_test_id_item.string = "textArea_test_capi";
            nodeAPI->setAttribute(textArea, NODE_ID, &textArea_test_id_item);
            OH_ArkUI_SetNodeDraggable(textArea, true);
            
            std::string contentTextStr2 = std::to_string(getColorText) + std::to_string(getColorTextInput) +
                                            std::to_string(getColorTextArea);
            
            text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            ArkUI_AttributeItem LABEL_Item = {.string = contentTextStr2.c_str()};
            ArkUI_NumberValue fontSize[] = {PARAM_20};
            ArkUI_AttributeItem Font_Item = {fontSize, PARAM_1};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &LABEL_Item);
            nodeAPI->setAttribute(text, NODE_TEXT_FONT, &Font_Item);
            nodeAPI->setAttribute(text, NODE_MARGIN, &marginItem);
            nodeAPI->registerNodeEvent(text, NODE_ON_PRE_DRAG, PARAM_1, nullptr);
            ArkUI_AttributeItem text_id_item = {};
            text_id_item.string = "Drag";
            nodeAPI->setAttribute(text, NODE_ID, &text_id_item);
            OH_ArkUI_SetNodeDraggable(text, true);
            
            OH_ArkUI_SelectedDragPreviewStyle_Dispose(text_options);
            OH_ArkUI_SelectedDragPreviewStyle_Dispose(textInput_options);
            OH_ArkUI_SelectedDragPreviewStyle_Dispose(textArea_options);

            nodeAPI->addChild(startDrag, text);
            nodeAPI->addChild(startDrag, drag_text);
            nodeAPI->addChild(startDrag, textInput);
            nodeAPI->addChild(startDrag, textArea);
            
            OH_NativeXComponent_AttachNativeRootNode(component, startDrag);
        }
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ColorManager", "CreateNativeNode  555");
        return nullptr;
    }

    void ColorManager::Export(napi_env env, napi_value exports) {
        if ((env == nullptr) || (exports == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager", "Export: env or exports is null");
            return;
        }

        napi_value exportInstance = nullptr;
        if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager", "Export: napi_get_named_property fail");
            return;
        }

        OH_NativeXComponent *nativeXComponent = nullptr;
        if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager", "Export: napi_unwrap fail");
            return;
        }

        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) !=
            OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ColorManager",
                         "Export: OH_NativeXComponent_GetXComponentId fail");
            return;
        }

        std::string id(idStr);
        auto manager = ColorManager::GetInstance();
        if ((manager != nullptr) && (nativeXComponent != nullptr)) {
            manager->SetNativeXComponent(id, nativeXComponent);
            auto container = manager->GetContainer(id);
            if (container != nullptr) {
                container->RegisterCallback(nativeXComponent);
            }
        }
    }

    void ColorManager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent) {
        if (nativeXComponent == nullptr) {
            return;
        }

        if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
            nativeXComponentMap_[id] = nativeXComponent;
            return;
        }

        if (nativeXComponentMap_[id] != nativeXComponent) {
            OH_NativeXComponent *tmp = nativeXComponentMap_[id];
            tmp = nullptr;
            nativeXComponentMap_[id] = nativeXComponent;
        }
    }

    OH_NativeXComponent *ColorManager::GetNativeXComponent(const std::string &id) { return nativeXComponentMap_[id]; }

    Container *ColorManager::GetContainer(std::string &id) {
        if (containerMap_.find(id) == containerMap_.end()) {
            Container *instance = Container::GetInstance(id);
            containerMap_[id] = instance;
            return instance;
        }

        return containerMap_[id];
    }
} // namespace NativeXComponentSample