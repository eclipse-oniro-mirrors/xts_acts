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
#include "XComponent/XComponentCrossLanguageTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1* nodeAPI;

static std::string value2String(napi_env env, napi_value value)
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    return valueString;
}

ArkUI_NodeHandle CreateCrossLanguageXComponentNodeHandle(const std::string &tag) {
    // C侧创建XC组件（capiNode）
    ArkUI_NodeHandle capiNode = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT); // surface类型
    ArkUI_AttributeItem itemStringStyle = {.string = "XComponentCrossLanguage_capiNode"};
    ArkUI_NumberValue value[] = {480};
    ArkUI_NumberValue value2[] = {{.u32 = 100}, {.u32 = 100}};
    ArkUI_AttributeItem item = {value, 1};
    ArkUI_AttributeItem item2 = {value2, 2};
    ArkUI_NumberValue value3[] = {{.i32 = 10}, {.i32 = 10}, {.i32 = 200}, {.i32 = 200}};
    ArkUI_AttributeItem item3 = {value3, 4};
    ArkUI_NumberValue value4[] = {false};
    ArkUI_AttributeItem item4 = {value4, 1};
    
    value[0].f32 = 300;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH, &item); // 300
    value[0].f32 = 200;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT, &item); // 200
    nodeAPI->setAttribute(capiNode, NODE_ID, &itemStringStyle); // capiNode
    nodeAPI->setAttribute(capiNode, NODE_XCOMPONENT_SURFACE_SIZE, &item2); // 100*100
    nodeAPI->setAttribute(capiNode, NODE_XCOMPONENT_SURFACE_RECT, &item3); // 200*200
    nodeAPI->setAttribute(capiNode, NODE_XCOMPONENT_ENABLE_ANALYZER, &item4); // enableAnalyzer: false
    
    value[0].u32 = 0xFFFF0000; // 红色
    nodeAPI->setAttribute(capiNode, NODE_BACKGROUND_COLOR, &item);

    // 设置节点（capiNode）是否支持跨语言的属性设置
    ArkUI_CrossLanguageOption *option = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(option, true); // 跨语言设置属性是否可用
    auto r = OH_ArkUI_NodeUtils_SetCrossLanguageOption(capiNode, option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "xsx OH_ArkUI_NodeUtils_SetCrossLanguageOption=%{public}d", r);

    // 获取节点（capiNode）是否支持跨语言的属性设置
    bool crossLanguageAttributeSetting = OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "jyy OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus=%{public}d",
                 crossLanguageAttributeSetting);
    OH_ArkUI_CrossLanguageOption_Destroy(option);

    // 创建column容器组件
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 400;
    nodeAPI->setAttribute(column, NODE_WIDTH, &item);
    value[0].f32 = 800;
    nodeAPI->setAttribute(column, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFF000; // 黄色
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    itemStringStyle.string = "column_parent"; // column id
    nodeAPI->setAttribute(column, NODE_ID, &itemStringStyle); // capiNode

    // column挂载capiNode
    nodeAPI->addChild(column, capiNode);

    return column;
}

napi_value XComponentCrossLanguageTest::createCrossLanguageXComponentNativeNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 2;
    napi_value args[2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != 2) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
    );
    std::string tag = value2String(env, args[1]);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "tag=%{public}s", tag.c_str());
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, new std::string(tag));
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    if (nodeAPI != nullptr && nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                     "CreateNativeNode tag=%{public}s", tag.c_str());
        auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
            ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
            std::string *userDate = reinterpret_cast<std::string*>(OH_ArkUI_NodeContent_GetUserData(handle));
            if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
                ArkUI_NodeHandle testNode;
                if (userDate) {
                    testNode = CreateCrossLanguageXComponentNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreateCrossLanguageXComponentNodeHandle("noUserData");
                }
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}

napi_value XComponentCrossLanguageTest::crossLanguageSetXComponentAttribute(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "setTypeNodeXCAttribute 111");
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "setTypeNodeXCAttribute 222");

    size_t argCnt = 1;
    napi_value args[1] = { nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "setTypeNodeXCAttribute 333");

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    std::string nodeId = value2String(env, args[0]);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "setTypeNodeXCAttribute 444 =%{public}s", nodeId.c_str());
    auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    ArkUI_NodeHandle capiNode;
    auto error = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById(nodeId.c_str(), &capiNode);
    if (error != 0) return nullptr;
    ArkUI_NumberValue value5[] = {{.i32 = 10}, {.i32 = 10}, {.i32 = 100}, {.i32 = 100}};
    ArkUI_AttributeItem item5 = {value5, sizeof(value5) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(capiNode, NODE_XCOMPONENT_SURFACE_RECT, &item5); // typeNode设置surface位置大小 100*100

    value5[0].u32 = 0xffff0000; // 红色
    auto ret = nodeAPI->setAttribute(capiNode, NODE_BACKGROUND_COLOR, &item5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "setTypeNodeXCAttribute 111 =%{public}d", ret);

    value5[0].i32 = {false};
    nodeAPI->setAttribute(capiNode, NODE_XCOMPONENT_ENABLE_ANALYZER, &item5); // enableAnalyzer: false

    value5[0].f32 = {150};
    nodeAPI->setAttribute(capiNode, NODE_WIDTH, &item5); // 150
    value5[0].f32 = {200};
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT, &item5); // 200    
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "setTypeNodeXCAttribute end");

    return nullptr;
}
