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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "common/common.h"
#include "SwiperCrossLanguageTest.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1* nodeAPI;

namespace ArkUICapiTest {

static std::string value2String(napi_env env, napi_value value)
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    return valueString;
}

ArkUI_NodeHandle CreateSwiperNodeHandle(const std::string &tag)
{
    ArkUI_NodeHandle capiNode = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    ArkUI_AttributeItem itemStringStyle = {.string = "SwiperCrossLanguage_capiNode"};
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    nodeAPI->setAttribute(capiNode, NODE_ID, &itemStringStyle);
    value[0].f32 = 200;
    nodeAPI->setAttribute(capiNode, NODE_WIDTH, &item);
    value[0].f32 = 100;
    nodeAPI->setAttribute(capiNode, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF0000; // Color.Red
    nodeAPI->setAttribute(capiNode, NODE_BACKGROUND_COLOR, &item);
    value[0].f32 = 20;
    nodeAPI->setAttribute(capiNode, NODE_SWIPER_NEXT_MARGIN, &item);
    value[0].f32 = 20;
    nodeAPI->setAttribute(capiNode, NODE_SWIPER_PREV_MARGIN, &item);
    value[0].f32 = 40;
    nodeAPI->setAttribute(capiNode, NODE_SWIPER_ITEM_SPACE, &item);

    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column1, NODE_WIDTH, &item);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column1, NODE_HEIGHT, &item);
    value[0].u32 = 0xFF4CFF00; // Color.Green
    nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &item);

    ArkUI_NodeHandle column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column2, NODE_WIDTH, &item);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column2, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFE600FF; // Color.Pink
    nodeAPI->setAttribute(column2, NODE_BACKGROUND_COLOR, &item);
    
    ArkUI_NodeHandle column3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column3, NODE_WIDTH, &item);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column3, NODE_HEIGHT, &item);
    value[0].u32 = 0xFF002AFF; // Color.Blue
    nodeAPI->setAttribute(column3, NODE_BACKGROUND_COLOR, &item);
    
    ArkUI_NodeHandle column4 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column4, NODE_WIDTH, &item);
    value[0].f32 = 100;
    nodeAPI->setAttribute(column4, NODE_HEIGHT, &item);
    value[0].u32 = 0xFF9C9DA0; // Color.Grey
    nodeAPI->setAttribute(column4, NODE_BACKGROUND_COLOR, &item);

    nodeAPI->addChild(capiNode, column1);
    nodeAPI->addChild(capiNode, column2);
    nodeAPI->addChild(capiNode, column3);
    nodeAPI->addChild(capiNode, column4);
    
    ArkUI_CrossLanguageOption *option = OH_ArkUI_CrossLanguageOption_Create();
    //********设置跨语言开关通道************
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(option, true);
    OH_ArkUI_NodeUtils_SetCrossLanguageOption(capiNode, option);
    bool crossLanguageAttributeSetting = OH_ArkUI_CrossLanguageOption_GetAttributeSettingStatus(option);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "xsx crossLanguageAttributeSetting=%{public}d",
                 crossLanguageAttributeSetting);
    OH_ArkUI_CrossLanguageOption_Destroy(option);

    return capiNode;
}

napi_value SwiperCrossLanguageTest::createCrossLanguageSwiperNode(napi_env env, napi_callback_info info)
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
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperCrossLanguageTest", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Swiper", "OH_ArkUI_GetNodeHandleFromNapiValue %{public}d");
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
                    testNode = CreateSwiperNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreateSwiperNodeHandle("noUserData");
                }
                    
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}
} // namespace ArkUICapiTest