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
#include "xcomponent_id_test.h"
#include <string>
#define STR_OVERLENGTH "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"\
                       "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong"
#define STR_NULL ""


namespace ArkUICapiTest {

static ArkUI_NodeHandle CreateChildNodeXComponentId(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto scroll = nodeAPI->createNode(ARKUI_NODE_SCROLL);

    ArkUI_NumberValue widthValue[] = {{.f32 = SIZE_300}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(scroll, NODE_HEIGHT, &widthItem);

    return scroll;
}

napi_value XComponentIdTest::CreateNativeNodeXComponentId001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "XComponentIdTest", "XComponentId");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeXComponentId(nodeAPI);
    auto xcomponent = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue xcomponent_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem xcomponent_width_item = {xcomponent_width_value,
                                                 sizeof(xcomponent_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(xcomponent, NODE_WIDTH, &xcomponent_width_item);
    nodeAPI->setAttribute(xcomponent, NODE_HEIGHT, &xcomponent_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "XComponentKey";
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_ID, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_ID)->string, "XComponentKey");
    ArkUI_AttributeItem idItem = {};
    idItem.string = "xcomponent001";
    nodeAPI->setAttribute(xcomponent, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, xcomponent);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value XComponentIdTest::CreateNativeNodeXComponentId002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "XComponentIdTest", "XComponentId");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeXComponentId(nodeAPI);
    auto xcomponent = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue xcomponent_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem xcomponent_width_item = {xcomponent_width_value,
                                                 sizeof(xcomponent_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(xcomponent, NODE_WIDTH, &xcomponent_width_item);
    nodeAPI->setAttribute(xcomponent, NODE_HEIGHT, &xcomponent_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_OVERLENGTH;
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_ID, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_ID)->string, STR_OVERLENGTH);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "xcomponent002";
    nodeAPI->setAttribute(xcomponent, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, xcomponent);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value XComponentIdTest::CreateNativeNodeXComponentId003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "XComponentIdTest", "XComponentId");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeXComponentId(nodeAPI);
    auto xcomponent = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue xcomponent_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem xcomponent_width_item = {xcomponent_width_value,
                                                 sizeof(xcomponent_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(xcomponent, NODE_WIDTH, &xcomponent_width_item);
    nodeAPI->setAttribute(xcomponent, NODE_HEIGHT, &xcomponent_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_NULL;
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_ID, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(xcomponent, NODE_XCOMPONENT_ID)->string, STR_NULL);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "xcomponent003";
    nodeAPI->setAttribute(xcomponent, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, xcomponent);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value XComponentIdTest::CreateNativeNodeXComponentId004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "XComponentIdTest", "XComponentId");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto scroll = CreateChildNodeXComponentId(nodeAPI);
    auto xcomponent = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_NumberValue xcomponent_width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem xcomponent_width_item = {xcomponent_width_value,
                                                 sizeof(xcomponent_width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(xcomponent, NODE_WIDTH, &xcomponent_width_item);
    nodeAPI->setAttribute(xcomponent, NODE_HEIGHT, &xcomponent_width_item);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = nullptr;
    auto ret = nodeAPI->setAttribute(xcomponent, NODE_XCOMPONENT_ID, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "xcomponent004";
    nodeAPI->setAttribute(xcomponent, NODE_ID, &idItem);
    nodeAPI->addChild(scroll, xcomponent);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), scroll) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "XComponentIdTest",
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
