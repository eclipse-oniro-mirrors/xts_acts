/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "arkui/native_type.h"
#include "arkui/native_node.h"

namespace ArkUICapiTest {

static napi_value TestGetErrorMessage001(napi_env env, napi_callback_info info)
{
    const char *errorMessage = nullptr;
    auto errorCode = OH_ArkUI_NodeAdapter_GetAllItems(nullptr, nullptr, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_PARAM_INVALID);
    errorMessage = OH_ArkUI_NativeModule_GetErrorMessage();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "lzq Manager",
                 "before any error, ErrorMessage is %{public}s", errorMessage);
    ASSERT_STREQ(errorMessage,
        "errorCode: 401, functionName: OH_ArkUI_NodeAdapter_GetAllItems, errorMessage: Node adapter handle is null");
    NAPI_END;
}

} // namespace ArkUICapiTest