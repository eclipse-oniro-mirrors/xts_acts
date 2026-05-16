/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "../../../common/common.h"
#include <arkui/drag_and_drop.h>

namespace ArkUICapiTest {

/*
 * 测试接口: OH_ArkUI_NotifySuggestedDropOperation
 * 预期效果: 返回值属于文档列出的成功或错误码之一。
 * 实际测试: 非法/未绑定 requestIdentity 与合法 ArkUI_DropOperation 实参调用，断言 rc 为三选一。
 */
static napi_value TestArkUICapi_001(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto rc = OH_ArkUI_NotifySuggestedDropOperation(
        0, static_cast<ArkUI_DropOperation>(ARKUI_DROP_OPERATION_COPY));
    {
        napi_value napiAssertErr = ::ArkUICapiTest::TrueFailed(env, (rc == ARKUI_ERROR_CODE_NO_ERROR ||
        rc == ARKUI_ERROR_CODE_PARAM_INVALID ||
        rc == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

/*
 * 测试接口: OH_ArkUI_NotifyDisableDefaultDropAnimation
 * 预期效果: 返回值属于文档列出的成功或错误码之一。
 * 实际测试: 同上，对 NotifyDisableDefaultDropAnimation 做三选一断言。
 */
static napi_value TestArkUICapi_002(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto rc = OH_ArkUI_NotifyDisableDefaultDropAnimation(0, false);
    {
        napi_value napiAssertErr = ::ArkUICapiTest::TrueFailed(env, (rc == ARKUI_ERROR_CODE_NO_ERROR ||
        rc == ARKUI_ERROR_CODE_PARAM_INVALID ||
        rc == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED));
        if (napiAssertErr != nullptr) {
            return napiAssertErr;
        }
    }

    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
