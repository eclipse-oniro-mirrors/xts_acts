 /*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <hilog/log.h>
#include "orphanCharOptimizationTest.h"

// #define LOG_TAG "manager"
#define LOG_INFO(...) OH_LOG_Print(LOG_APP, LOG_INFO, 0xD001400, LOG_TAG, __VA_ARGS__)

#define VALUE_0 0
#define VALUE_1 1
#define VALUE_8 8
#define VALUE_20 20
#define VALUE_40 40
#define VALUE_120 120

#define EVENT_CLICK_TRUE 1
#define EVENT_CLICK_FALSE 2
#define EVENT_CLICK_UNDEFINED 3

namespace NativeXComponentSample {
    orphanCharOptimizationManager orphanCharOptimizationManager::orphanCharOptimizationManager_;
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

    static ArkUI_NodeHandle textComp = nullptr;
    static ArkUI_NodeHandle textInputComp = nullptr;
    static ArkUI_NodeHandle textAreaComp = nullptr;
    static ArkUI_NodeHandle richEditorComp = nullptr;

    void setCommonSize(ArkUI_NodeHandle node) {
        ArkUI_NumberValue w[] = {{.f32 = VALUE_120}};
        ArkUI_AttributeItem widthItem = {w, 1};
        nodeAPI->setAttribute(node, NODE_WIDTH, &widthItem);

        ArkUI_NumberValue h[] = {{.f32 = VALUE_40}};
        ArkUI_AttributeItem heightItem = {h, 1};
        nodeAPI->setAttribute(node, NODE_HEIGHT, &heightItem);
    }

    void setAllOrphanChar(int32_t value) {
        // -------- Text --------
        if (value == -1) {
            nodeAPI->resetAttribute(textComp, NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION);
        } else {
            ArkUI_NumberValue v[] = {{.i32 = value}};
            ArkUI_AttributeItem item = {v, 1};
            nodeAPI->setAttribute(textComp, NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION, &item);
        }

        // -------- TextInput --------
        if (value == -1) {
            nodeAPI->resetAttribute(textInputComp, NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION);
        } else {
            ArkUI_NumberValue v[] = {{.i32 = value}};
            ArkUI_AttributeItem item = {v, 1};
            nodeAPI->setAttribute(textInputComp, NODE_TEXT_INPUT_ORPHAN_CHAR_OPTIMIZATION, &item);
        }

        // -------- TextArea --------
        if (value == -1) {
            nodeAPI->resetAttribute(textAreaComp, NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION);
        } else {
            ArkUI_NumberValue v[] = {{.i32 = value}};
            ArkUI_AttributeItem item = {v, 1};
            nodeAPI->setAttribute(textAreaComp, NODE_TEXT_AREA_ORPHAN_CHAR_OPTIMIZATION, &item);
        }

        // -------- RichEditor --------
        if (value == -1) {
            nodeAPI->resetAttribute(richEditorComp, NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION);
        } else {
            ArkUI_NumberValue v[] = {{.i32 = value}};
            ArkUI_AttributeItem item = {v, 1};
            nodeAPI->setAttribute(richEditorComp, NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION, &item);
        }

        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_TAG, "全部组件 orphanChar 已设置为: %d", value);
    }

    void createAllComponents(ArkUI_NodeHandle root) {
        // === Text ===
        textComp = nodeAPI->createNode(ARKUI_NODE_TEXT);
        setCommonSize(textComp);
        ArkUI_AttributeItem textContent = {.string = "龙飞凤舞龙飞凤舞"};
        nodeAPI->setAttribute(textComp, NODE_TEXT_CONTENT, &textContent);

        // ID
        ArkUI_AttributeItem idText = {.string = "textCAPI"};
        nodeAPI->setAttribute(textComp, NODE_ID, &idText);
        nodeAPI->addChild(root, textComp);

        // === TextInput ===
        textInputComp = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
        setCommonSize(textInputComp);
        ArkUI_AttributeItem inputContent = {.string = "龙飞凤舞龙飞凤舞"};
        nodeAPI->setAttribute(textInputComp, NODE_TEXT_INPUT_TEXT, &inputContent);
        // ID
        ArkUI_AttributeItem idInput = {.string = "textInputCAPI"};
        nodeAPI->setAttribute(textInputComp, NODE_ID, &idInput);
        nodeAPI->addChild(root, textInputComp);

        // === TextArea ===
        textAreaComp = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
        setCommonSize(textAreaComp);
        ArkUI_AttributeItem areaContent = {.string = "龙飞凤舞龙飞凤舞"};
        nodeAPI->setAttribute(textAreaComp, NODE_TEXT_AREA_TEXT, &areaContent);
        // ID
        ArkUI_AttributeItem idArea = {.string = "textAreaCAPI"};
        nodeAPI->setAttribute(textAreaComp, NODE_ID, &idArea);
        nodeAPI->addChild(root, textAreaComp);

        // === RichEditor ===
        richEditorComp = nodeAPI->createNode(ARKUI_NODE_TEXT_EDITOR);
        setCommonSize(richEditorComp);
        ArkUI_AttributeItem editorContent = {.string = "龙飞凤舞龙飞凤舞"};
        nodeAPI->setAttribute(richEditorComp, NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER, &editorContent);
        // ID
        ArkUI_AttributeItem idEditor = {.string = "richEditorCAPI"};
        nodeAPI->setAttribute(richEditorComp, NODE_ID, &idEditor);
        nodeAPI->addChild(root, richEditorComp);

        // 默认全部 false
        setAllOrphanChar(0);
    }

    void createButton(ArkUI_NodeHandle row, const char* text, int32_t eventId, const char* idStr) {
        ArkUI_NodeHandle btn = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem label = {.string = text};
        nodeAPI->setAttribute(btn, NODE_BUTTON_LABEL, &label);

        ArkUI_NumberValue margin[] = {{.f32 = 5}, {.f32 = 5}, {.f32 = 5}, {.f32 = 5}};
        ArkUI_AttributeItem marginItem = {margin, 4};
        nodeAPI->setAttribute(btn, NODE_MARGIN, &marginItem);

        ArkUI_AttributeItem btnId = {.string = idStr};
        nodeAPI->setAttribute(btn, NODE_ID, &btnId);

        nodeAPI->registerNodeEvent(btn, NODE_ON_CLICK_EVENT, eventId, nullptr);
        nodeAPI->addChild(row, btn);
    }

    void buildUI(ArkUI_NodeHandle root) {
        createAllComponents(root);

        ArkUI_NodeHandle buttonRow = nodeAPI->createNode(ARKUI_NODE_ROW);
        nodeAPI->addChild(root, buttonRow);

        createButton(buttonRow, "T", EVENT_CLICK_TRUE, "trueCAPI");
        createButton(buttonRow, "F", EVENT_CLICK_FALSE, "falseCAPI");
        createButton(buttonRow, "Un", EVENT_CLICK_UNDEFINED, "undefinedCAPI");

        nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
            if (OH_ArkUI_NodeEvent_GetEventType(event) == NODE_ON_CLICK_EVENT) {
                int32_t id = OH_ArkUI_NodeEvent_GetTargetId(event);
                switch (id) {
                    case EVENT_CLICK_TRUE:
                        setAllOrphanChar(1);
                        break;
                    case EVENT_CLICK_FALSE:
                        setAllOrphanChar(0);
                        break;
                    case EVENT_CLICK_UNDEFINED:
                        setAllOrphanChar(-1);
                        break;
                }
            }
        });
    }

    napi_value orphanCharOptimizationManager::CreateNativeNode(napi_env env, napi_callback_info info) {
        size_t argCnt = 1;
        napi_value args[1] = {nullptr};
        napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr);

        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {0};
        size_t length;
        napi_get_value_string_utf8(env, args[0], idStr, OH_XCOMPONENT_ID_LEN_MAX + 1, &length);

        auto manager = orphanCharOptimizationManager::GetInstance();
        OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
        if (!component) return nullptr;

        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

        ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        buildUI(column);

        OH_NativeXComponent_AttachNativeRootNode(component, column);
        return nullptr;
    }

    napi_value orphanCharOptimizationManager::UpdateNativeNode(napi_env env, napi_callback_info info) {
        return nullptr;
    }

    napi_value orphanCharOptimizationManager::GetContext(napi_env env, napi_callback_info info) {
        return nullptr;
    }

    napi_value orphanCharOptimizationManager::CreatePixelMapTest(napi_env env, napi_callback_info info) {
        return nullptr;
    }

    void orphanCharOptimizationManager::Export(napi_env env, napi_value exports) {
        napi_value exportInstance = nullptr;
        napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);

        OH_NativeXComponent *nativeXComponent = nullptr;
        napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent));

        char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {0};
        uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
        OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);

        std::string id(idStr);
        auto manager = orphanCharOptimizationManager::GetInstance();
        if (manager) {
            manager->SetNativeXComponent(id, nativeXComponent);
        }
    }

    void orphanCharOptimizationManager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent) {
        nativeXComponentMap_[id] = nativeXComponent;
    }

    OH_NativeXComponent *orphanCharOptimizationManager::GetNativeXComponent(const std::string &id) {
        return nativeXComponentMap_[id];
    }

    Container *orphanCharOptimizationManager::GetContainer(std::string &id) {
        if (containerMap_.find(id) == containerMap_.end()) {
            Container *instance = Container::GetInstance(id);
            containerMap_[id] = instance;
        }
        return containerMap_[id];
    }

    orphanCharOptimizationManager::~orphanCharOptimizationManager() {
        nativeXComponentMap_.clear();
        containerMap_.clear();
    }

} // namespace NativeXComponentSample