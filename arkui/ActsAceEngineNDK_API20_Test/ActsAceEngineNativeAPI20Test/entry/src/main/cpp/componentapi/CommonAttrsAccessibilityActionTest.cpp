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
#include "CommonAttrsAccessibilityActionTest.h"

namespace CommonAttrsAccessibilityActionTest {

napi_value CheckResult(napi_env env, std::string expectStr, std::string result)
{
    std::string assertStr = "assert equal failed, expect is " + expectStr + " and result is " + result;
    napi_throw_error((env), nullptr, assertStr.c_str());
    napi_value errorResult = nullptr;
    napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
    return errorResult;
}

napi_value TestAccessibilityActions001(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NAPI_CHECK_PARAMS", "GetContext env or info is null");
        return nullptr;
    }
    uint32_t accessibilityActions = ARKUI_ACCESSIBILITY_ACTION_CUT;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    if (ret != SUCCESS) {
        return CheckResult(env, std::to_string(SUCCESS), std::to_string(ret));
    }
    uint32_t uAction = nodeAPI->getAttribute(stack, NODE_ACCESSIBILITY_ACTIONS)->value[PARAM_0].u32;
    if (uAction != accessibilityActions) {
        return CheckResult(env, std::to_string(accessibilityActions), std::to_string(uAction));
    }
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value TestAccessibilityActions002(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NAPI_CHECK_PARAMS", "GetContext env or info is null");
        return nullptr;
    }
    uint32_t accessibilityActions = ARKUI_ACCESSIBILITY_ACTION_COPY;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityActions}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ACCESSIBILITY_ACTIONS, &value_item);
    if (ret != SUCCESS) {
        return CheckResult(env, std::to_string(SUCCESS), std::to_string(ret));
    }
    uint32_t uAction = nodeAPI->getAttribute(stack, NODE_ACCESSIBILITY_ACTIONS)->value[PARAM_0].u32;
    if (uAction != accessibilityActions) {
        return CheckResult(env, std::to_string(accessibilityActions), std::to_string(uAction));
    }
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}
};