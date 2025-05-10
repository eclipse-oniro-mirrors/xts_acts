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
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "button_label_test.h"
#include <string>
#define STR_NORMAL "label"
#define STR_LONG "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"\
                 "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
#define STR_NULL ""


namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildNodeButtonLabel(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);

    ArkUI_NumberValue widthValue[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &widthItem);

    return scroll;
}

napi_value ButtonLabelTest::CreateNativeNodeButtonLabel001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonLabelTest", "ButtonLabel");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_NORMAL;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(button, NODE_BUTTON_LABEL)->string, STR_NORMAL);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button001";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ButtonLabelTest::CreateNativeNodeButtonLabel002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonLabelTest", "ButtonLabel");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_LONG;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(button, NODE_BUTTON_LABEL)->string, STR_LONG);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button002";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ButtonLabelTest::CreateNativeNodeButtonLabel003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonLabelTest", "ButtonLabel");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_NULL;
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(button, NODE_BUTTON_LABEL)->string, STR_NULL);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button003";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value ButtonLabelTest::CreateNativeNodeButtonLabel004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonLabelTest", "ButtonLabel");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeButtonLabel(nodeAPI);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue button_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_width_item = {button_width_value,
                                             sizeof(button_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_width_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_width_item);
    ArkUI_AttributeItem valueItem = {};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "button004";
    nodeAPI->setAttribute(button, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, button);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonLabelTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
