/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestLazyForEachGetTotalNodeCount001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, PARAM_1);
    ASSERT_EQ(OH_ArkUI_NodeAdapter_GetTotalNodeCount(adapter), PARAM_1);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

} // namespace ArkUICapiTest