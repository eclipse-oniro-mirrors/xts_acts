#ifndef ACE_C_ARKUI_KEY_CODE_TEST_API20_DISPLAYMANAGERTEST_H
#define ACE_C_ARKUI_KEY_CODE_TEST_API20_DISPLAYMANAGERTEST_H
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "common/Common.h"

namespace DisplayManager {
    napi_value ArkuiAiAnalysisFinish(napi_env env, napi_callback_info info);
    napi_value ArkuiAiAnalysisDisabled(napi_env env, napi_callback_info info);
    napi_value ArkuiAiAnalysisUnsupported(napi_env env, napi_callback_info info);
    napi_value ArkuiAiAnalysisOngoing(napi_env env, napi_callback_info info);
    napi_value ArkuiAiAnalysisStopped(napi_env env, napi_callback_info info);
    napi_value ArkuiNodeUndefined(napi_env env, napi_callback_info info);
}
#endif //ACE_C_ARKUI_KEY_CODE_TEST_API20_DISPLAYMANAGERTEST_H
