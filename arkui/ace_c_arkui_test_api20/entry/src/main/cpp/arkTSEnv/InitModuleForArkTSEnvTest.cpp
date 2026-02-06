/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <arkui/native_node_napi.h>

namespace ArkUICapiTest {

static napi_value TestInitModuleForArkTSEnv(napi_env env, napi_callback_info info)
{
    napi_env newEnv2 = nullptr;
    auto ret1 = OH_ArkUI_InitModuleForArkTSEnv(newEnv2);
    napi_status status = napi_create_ark_context(env, &newEnv2);
    auto ret2 = OH_ArkUI_InitModuleForArkTSEnv(newEnv2);
    OH_ArkUI_NotifyArkTSEnvDestroy(newEnv2);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

} // namespace ArkUICapiTest