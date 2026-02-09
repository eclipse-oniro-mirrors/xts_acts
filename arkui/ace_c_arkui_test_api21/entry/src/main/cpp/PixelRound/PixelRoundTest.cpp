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
#include "PixelRoundTest.h"

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

ArkUI_NodeHandle CreatePixelRoundNodeHandle(const std::string &tag)
{
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // column
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = 1;
    nodeAPI->setAttribute(column, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(column, NODE_HEIGHT_PERCENT, &item);
    value[0].u32 = 0xFFffc0cb; // Color.Pink
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    value[0].i32 = ARKUI_FLEX_ALIGNMENT_CENTER;
    nodeAPI->setAttribute(column, NODE_COLUMN_JUSTIFY_CONTENT, &item);
    
    // column1
    value[0].f32 = 111;
    nodeAPI->setAttribute(column1, NODE_WIDTH, &item);
    nodeAPI->setAttribute(column1, NODE_HEIGHT, &item);

    value[0].u32 = 0xFF00ff00; // green
    nodeAPI->setAttribute(column1, NODE_BACKGROUND_COLOR, &item);

    item.string = "PixelRoundPage_testColumn";
    nodeAPI->setAttribute(column1, NODE_ID, &item);

    nodeAPI->addChild(column, column1);

    return column;
}

napi_value PixelRoundTest::CreatePixelRoundNativeRoot(napi_env env, napi_callback_info info)
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
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PixelRoundTest", "napi_get_cb_info success");
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "List", "OH_ArkUI_GetNodeHandleFromNapiValue %{public}d");
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
                    testNode = CreatePixelRoundNodeHandle(*userDate);
                    delete userDate;
                    userDate = nullptr;
                } else {
                    testNode = CreatePixelRoundNodeHandle("noUserData");
                }
                OH_ArkUI_NodeContent_AddNode(handle, testNode);
            }
        };
        OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle_, nodeContentEvent);
    }
    return nullptr;
}

napi_value PixelRoundTest::SetPixelRound(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsColumn = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("PixelRoundPage_testColumn", &tsColumn);
    
    if (tsColumn) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );
        
        // set
        ArkUI_PixelRoundPolicy *policy = OH_ArkUI_PixelRoundPolicy_Create();

        OH_ArkUI_PixelRoundPolicy_SetTop(policy, ARKUI_PIXELROUNDCALCPOLICY_NOFORCEROUND);
        OH_ArkUI_PixelRoundPolicy_SetStart(policy, ARKUI_PIXELROUNDCALCPOLICY_FORCECEIL);
        OH_ArkUI_PixelRoundPolicy_SetBottom(policy, ARKUI_PIXELROUNDCALCPOLICY_FORCEFLOOR);
        OH_ArkUI_PixelRoundPolicy_SetEnd(policy, ARKUI_PIXELROUNDCALCPOLICY_FORCEFLOOR);

        ArkUI_AttributeItem item = {.object = policy};
        nodeAPI->setAttribute(tsColumn, NODE_PIXEL_ROUND, &item);

        OH_ArkUI_PixelRoundPolicy_Dispose(policy);
    }
    
    return nullptr;
}

napi_value PixelRoundTest::GetPixelRound(napi_env env, napi_callback_info info) {
    ArkUI_NodeHandle tsColumn = nullptr;
    auto ret = OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("PixelRoundPage_testColumn", &tsColumn);
    
    std::string showStr = "";
    if (tsColumn) {
        ArkUI_NativeNodeAPI_1 * nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1")
        );

        std::string topStr = "";
        std::string startStr = "";
        std::string bottomStr = "";
        std::string endStr = "";
        const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsColumn, NODE_PIXEL_ROUND);
        if (get_item) {
            ArkUI_PixelRoundPolicy *policy = reinterpret_cast<ArkUI_PixelRoundPolicy *>(get_item->object);
            ArkUI_PixelRoundCalcPolicy get_value;
            if (OH_ArkUI_PixelRoundPolicy_GetTop(policy, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
                topStr = "error";
            } else {
                topStr = std::to_string(get_value);
            }
            if (OH_ArkUI_PixelRoundPolicy_GetStart(policy, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
                startStr = "error";
            } else {
                startStr = std::to_string(get_value);
            }
            if (OH_ArkUI_PixelRoundPolicy_GetBottom(policy, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
                bottomStr = "error";
            } else {
                bottomStr = std::to_string(get_value);
            }
            if (OH_ArkUI_PixelRoundPolicy_GetEnd(policy, &get_value) == ARKUI_ERROR_CODE_PARAM_INVALID) {
                endStr = "error";
            } else {
                endStr = std::to_string(get_value);
            }
            showStr = "top:" + topStr + ",left:" + startStr + ",bottom:" + bottomStr + ",right:" + endStr;
        }
        else {
            showStr = "undefined";
        }
    }
    
    napi_value cppStr;
    napi_create_string_latin1(env, showStr.c_str(), showStr.size(), &(cppStr));
    return cppStr;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetTopErrorCode_001(napi_env env, napi_callback_info info) {
    // create tsColumn
    NAPI_START(tsColumn, ARKUI_NODE_COLUMN);

    // SetTop
    ArkUI_PixelRoundPolicy *policy = OH_ArkUI_PixelRoundPolicy_Create();
    OH_ArkUI_PixelRoundPolicy_SetTop(policy, ARKUI_PIXELROUNDCALCPOLICY_NOFORCEROUND);
    ArkUI_AttributeItem item = {.object = policy};
    nodeAPI->setAttribute(tsColumn, NODE_PIXEL_ROUND, &item);
    OH_ArkUI_PixelRoundPolicy_Dispose(policy);

    // GetTop
    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsColumn, NODE_PIXEL_ROUND);
    ArkUI_PixelRoundPolicy *get_policy = reinterpret_cast<ArkUI_PixelRoundPolicy *>(get_item->object);

    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetTop(get_policy, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetTopErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsColumn, NODE_PIXEL_ROUND);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetTopErrorCode_002(napi_env env, napi_callback_info info) {
    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetTop(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetTopErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetStartErrorCode_001(napi_env env, napi_callback_info info) {
    // create tsColumn
    NAPI_START(tsColumn, ARKUI_NODE_COLUMN);

    // SetStart
    ArkUI_PixelRoundPolicy *policy = OH_ArkUI_PixelRoundPolicy_Create();
    OH_ArkUI_PixelRoundPolicy_SetStart(policy, ARKUI_PIXELROUNDCALCPOLICY_FORCECEIL);
    ArkUI_AttributeItem item = {.object = policy};
    nodeAPI->setAttribute(tsColumn, NODE_PIXEL_ROUND, &item);
    OH_ArkUI_PixelRoundPolicy_Dispose(policy);

    // GetStart
    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsColumn, NODE_PIXEL_ROUND);
    ArkUI_PixelRoundPolicy *get_policy = reinterpret_cast<ArkUI_PixelRoundPolicy *>(get_item->object);

    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetStart(get_policy, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetStartErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsColumn, NODE_PIXEL_ROUND);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetStartErrorCode_002(napi_env env, napi_callback_info info) {
    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetStart(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetStartErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetBottomErrorCode_001(napi_env env, napi_callback_info info) {
    // create tsColumn
    NAPI_START(tsColumn, ARKUI_NODE_COLUMN);

    // SetBottom
    ArkUI_PixelRoundPolicy *policy = OH_ArkUI_PixelRoundPolicy_Create();
    OH_ArkUI_PixelRoundPolicy_SetBottom(policy, ARKUI_PIXELROUNDCALCPOLICY_FORCEFLOOR);
    ArkUI_AttributeItem item = {.object = policy};
    nodeAPI->setAttribute(tsColumn, NODE_PIXEL_ROUND, &item);
    OH_ArkUI_PixelRoundPolicy_Dispose(policy);

    // GetBottom
    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsColumn, NODE_PIXEL_ROUND);
    ArkUI_PixelRoundPolicy *get_policy = reinterpret_cast<ArkUI_PixelRoundPolicy *>(get_item->object);

    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetBottom(get_policy, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetBottomErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsColumn, NODE_PIXEL_ROUND);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetBottomErrorCode_002(napi_env env, napi_callback_info info) {
    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetBottom(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetBottomErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetEndErrorCode_001(napi_env env, napi_callback_info info) {
    // create tsColumn
    NAPI_START(tsColumn, ARKUI_NODE_COLUMN);

    // SetEnd
    ArkUI_PixelRoundPolicy *policy = OH_ArkUI_PixelRoundPolicy_Create();
    OH_ArkUI_PixelRoundPolicy_SetEnd(policy, ARKUI_PIXELROUNDCALCPOLICY_FORCEFLOOR);
    ArkUI_AttributeItem item = {.object = policy};
    nodeAPI->setAttribute(tsColumn, NODE_PIXEL_ROUND, &item);
    OH_ArkUI_PixelRoundPolicy_Dispose(policy);

    // GetEnd
    const ArkUI_AttributeItem *get_item = nodeAPI->getAttribute(tsColumn, NODE_PIXEL_ROUND);
    ArkUI_PixelRoundPolicy *get_policy = reinterpret_cast<ArkUI_PixelRoundPolicy *>(get_item->object);

    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetEnd(get_policy, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetEndErrorCode_001 ret=%{public}d", ret);

    // Reset
    nodeAPI->resetAttribute(tsColumn, NODE_PIXEL_ROUND);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyGetEndErrorCode_002(napi_env env, napi_callback_info info) {
    ArkUI_PixelRoundCalcPolicy get_value;
    auto ret = OH_ArkUI_PixelRoundPolicy_GetEnd(nullptr, &get_value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyGetEndErrorCode_002 ret=%{public}d", ret);

    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value PixelRoundTest::TestPixelRoundPolicyCreateReturnNoNullptr(napi_env env, napi_callback_info info) {
    ArkUI_PixelRoundPolicy *policy = OH_ArkUI_PixelRoundPolicy_Create();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestPixelRoundPolicyCreateReturnNoNullptr copy=%{public}p", policy);

    ASSERT_OBJ_NE(policy, nullptr);
    OH_ArkUI_PixelRoundPolicy_Dispose(policy);
    NAPI_END;
}

} // namespace ArkUICapiTest