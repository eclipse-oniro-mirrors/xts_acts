/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "LanesValueTest.h"
#include "component/ButtonComponentTest.h"
#include "manager/PluginManagerTest.h"
#include <string>
namespace ArkUICapiTest {
auto CreateNodeWithSize(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle node, float width, float height)
{
    ArkUI_AttributeItem id_item = { nullptr, PARAM_0, "list" };
    nodeAPI->setAttribute(node, NODE_ID, &id_item);
    ArkUI_NumberValue valueHeight[] = { { .f32 = height } };
    ArkUI_AttributeItem height_item = { valueHeight, PARAM_1 };
    ArkUI_NumberValue valueWidth[] = { { .f32 = width } };
    ArkUI_AttributeItem width_item = { valueWidth, PARAM_1 };
    nodeAPI->setAttribute(node, NODE_HEIGHT_PERCENT, &height_item);
    nodeAPI->setAttribute(node, NODE_WIDTH_PERCENT, &width_item);
    return node;
}

napi_value ListTest::LanesValueTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "LanesValueTest");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto list = CreateNodeWithSize(nodeAPI, nodeAPI->createNode(ARKUI_NODE_LIST), PARAM_0_POINT_5, PARAM_0_POINT_5);
    auto btn = new ButtonComponent();
    btn->SetLabel("0");
    btn->SetId("click0");
    btn->RegisterOnClick([nodeAPI, list]() {
        ArkUI_NumberValue height_value[] = {{.i32 = PARAM_0}, {.f32 = PARAM_20}};
        ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
        
        auto a = nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &height_item);
        auto b = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY)->value->i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "a:%{public}d", a);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "b:%{public}d", b);
    });
    nodeAPI->addChild(column, btn->GetComponent());
    
    auto btn1 = new ButtonComponent();
    btn1->SetLabel("1");
    btn1->SetId("click1");
    btn1->RegisterOnClick([nodeAPI, list]() {
        ArkUI_NumberValue height_value[] = {{.i32 = PARAM_1}, {.f32 = PARAM_20}};
        ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
        
        auto a = nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &height_item);
        auto b = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY)->value->i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "a:%{public}d", a);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "b:%{public}d", b);
    });
    nodeAPI->addChild(column, btn1->GetComponent());
    
    auto btn2 = new ButtonComponent();
    btn2->SetLabel("2");
    btn2->SetId("click2");
    btn2->RegisterOnClick([nodeAPI, list]() {
        ArkUI_NumberValue height_value[] = {{.i32 = PARAM_2}, {.f32 = PARAM_20}};
        ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
        
        auto a = nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &height_item);
        auto b = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY)->value->i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "a:%{public}d", a);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "b:%{public}d", b);
    });
    nodeAPI->addChild(column, btn2->GetComponent());
    
    auto btn3 = new ButtonComponent();
    btn3->SetLabel("-1");
    btn3->SetId("click-1");
    btn3->RegisterOnClick([ nodeAPI, list ]() {
        ArkUI_NumberValue height_value[] = {{.i32 = PARAM_NEGATIVE_1}, {.f32 = PARAM_20}};
        ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
        
        auto a = nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &height_item);
        auto b = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY)->value->i32;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "a:%{public}d", a);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "b:%{public}d", b);
    });
    nodeAPI->addChild(column, btn3->GetComponent());
    
    nodeAPI->addChild(column, list);
    for (auto i = PARAM_0; i < PARAM_20; i++) {
        auto listItem = CreateNodeWithSize(nodeAPI, nodeAPI->createNode(ARKUI_NODE_LIST_ITEM),
            PARAM_0_POINT_2, PARAM_0_POINT_2);
        auto text = CreateNodeWithSize(nodeAPI, nodeAPI->createNode(ARKUI_NODE_TEXT),
            PARAM_0_POINT_2, PARAM_0_POINT_2);
        ArkUI_AttributeItem content_item = {};
        content_item.string = std::to_string(i).c_str();
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
        
        ArkUI_NumberValue text_align_value[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_CENTER}};
        ArkUI_AttributeItem text_align_item = {text_align_value, sizeof(text_align_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_TEXT_ALIGN, &text_align_item);
        
        nodeAPI->addChild(listItem, text);
        nodeAPI->addChild(list, listItem);
    }
    
    ArkUI_NumberValue height_value[] = {{.i32 = PARAM_2}, {.f32 = PARAM_20}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    
    auto a = nodeAPI->setAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY, &height_item);
    auto b = nodeAPI->getAttribute(list, NODE_LIST_LANES_ITEMFILLPOLICY)->value->i32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "a:%{public}d", a);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListTest", "b:%{public}d", b);
    
    // 所有组件挂载到XComponent
    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerMinMaxDateTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
}