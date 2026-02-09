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
#include "ImageSupportSvg2Test.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1* nodeAPI;

namespace ArkUICapiTest {

static std::string Value2String(napi_env env, napi_value value)
{
    size_t stringSize = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &stringSize);
    std::string valueString;
    valueString.resize(stringSize);
    napi_get_value_string_utf8(env, value, &valueString[0], stringSize+1, &stringSize);
    return valueString;
}

ArkUI_NodeHandle CreateImageNodeHandleSupportSvg2(const std::string &tag)
{
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    // image1,true
    auto image1 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem image_src_item = {.string = "/resources/base/media/image1.svg"};
    nodeAPI->setAttribute(image1, NODE_IMAGE_SRC, &image_src_item);
    ArkUI_NumberValue svg2[1];
    svg2[0].i32=1;
    ArkUI_AttributeItem image_svg2 = {.value = svg2, .size=1};
    nodeAPI->setAttribute(image1, NODE_IMAGE_SUPPORT_SVG2, &image_svg2);
	ArkUI_AttributeItem imageId1 = {.string = "image1"};
    nodeAPI->setAttribute(image1, NODE_ID, &imageId1);
 
    // image2,false
    auto image2 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    image_src_item = {.string = "/resources/base/media/image2.svg"};
    nodeAPI->setAttribute(image2, NODE_IMAGE_SRC, &image_src_item);
    svg2[0].i32=0;
    image_svg2 = {.value = svg2, .size=1};
    nodeAPI->setAttribute(image2, NODE_IMAGE_SUPPORT_SVG2, &image_svg2);
	ArkUI_AttributeItem imageId2 = {.string = "image2"};
    nodeAPI->setAttribute(image2, NODE_ID, &imageId2);

    // image3,not set supportSvg2
    auto image3 = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    image_src_item = {.string = "/resources/base/media/image3.svg"};
    nodeAPI->setAttribute(image3, NODE_IMAGE_SRC, &image_src_item);
	ArkUI_AttributeItem imageId3 = {.string = "image3"};
    nodeAPI->setAttribute(image3, NODE_ID, &imageId3);

    nodeAPI->addChild(column, image1);
    nodeAPI->addChild(column, image2);
    nodeAPI->addChild(column, image3);
    return column;
}

napi_value ImageSupportSvg2Test::CreateImageSupportSvg2NativeRoot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 2;
    size_t expectArgCnt = 2;
    napi_value args[2] = { nullptr, nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != expectArgCnt) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EdgesPositionTest", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    std::string tag = Value2String(env, args[1]);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "tag=%{public}s", tag.c_str());
    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nodeContentHandle_, new std::string(tag));
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "setUserData failed error=%{public}d", ret);
    }
    if (nodeAPI == nullptr || nodeAPI->createNode == nullptr || nodeAPI->addChild == nullptr) {
        return nullptr;
    }
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        std::string *userDate = reinterpret_cast<std::string*>(OH_ArkUI_NodeContent_GetUserData(handle));
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            ArkUI_NodeHandle testNode;
            if (userDate) {
                testNode = CreateImageNodeHandleSupportSvg2(*userDate);
                delete userDate;
                userDate = nullptr;
            } else {
                testNode = CreateImageNodeHandleSupportSvg2("noUserData");
            }
            OH_ArkUI_NodeContent_AddNode(handle, testNode);
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    napi_value napiRet;
    napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &napiRet);
    return napiRet;
}

} // namespace ArkUICapiTest