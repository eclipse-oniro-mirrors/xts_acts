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

#include "requirement_routerpagestate_test.h"

#include <arkui/native_node_napi.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"

static ArkUI_RouterPageState state;

namespace ArkUICapiTest {

std::vector<int32_t> RequirementRouterPageStateTest::routerValue = {};

static napi_value SetArrayNapiDataWithGesture(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_double(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};

static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}

napi_value RequirementRouterPageStateTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementRouterPageStateTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementRouterPageStateTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    nodeAPI->addChild(column1, image);
    nodeAPI->addChild(column, column1);

    ArkUI_ErrorCode errorCode1 = OH_ArkUI_GetRouterPageState(image, &state);
    ArkUI_ErrorCode errorCode2 = OH_ArkUI_GetRouterPageState(column1, &state);
    ArkUI_ErrorCode errorCode3 = OH_ArkUI_GetRouterPageState(column, &state);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    PushBackIntToData(RequirementRouterPageStateTest::routerValue, errorCode1);
    PushBackIntToData(RequirementRouterPageStateTest::routerValue, errorCode2);
    PushBackIntToData(RequirementRouterPageStateTest::routerValue, errorCode3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), Column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementRouterPageStateTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value RequirementRouterPageStateTest::GetRouterData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementRouterPageStateTest", "GetRouterData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(
        env, result, PARAM_0, SetArrayNapiDataWithGesture(RequirementRouterPageStateTest::routerValue, env));
    RequirementRouterPageStateTest::routerValue.clear();
    return result;
}
} // namespace ArkUICapiTest
