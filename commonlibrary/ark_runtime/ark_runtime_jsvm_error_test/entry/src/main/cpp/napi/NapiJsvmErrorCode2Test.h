/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

#ifndef ARK_RUNTIME_JSVM_TEST_NAPI_ERROR2_TEST_H
#define ARK_RUNTIME_JSVM_TEST_NAPI_ERROR2_TEST_H

#include <napi/native_api.h>
#include "napi/NapiJsvmErrorCodeTest.h"

napi_value TestIsRegExpJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsRegExpInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsConstructorJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsConstructorInvalid(napi_env env1, napi_callback_info info);

napi_value TestCreateRegExpJSOK(napi_env env1, napi_callback_info info);
napi_value TestCreateRegExpExpected(napi_env env1, napi_callback_info info);
napi_value TestCreateRegExpPending(napi_env env1, napi_callback_info info);
napi_value TestCreateRegExpInvalid(napi_env env1, napi_callback_info info);
napi_value TestCreateRegExpGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestObjectGetPrototypeOfInvalid(napi_env env1, napi_callback_info info);

napi_value TestObjectSetPrototypeOfInvalid(napi_env env1, napi_callback_info info);

napi_value TestCreateFunctionWithScriptJSOK(napi_env env1, napi_callback_info info);
napi_value TestCreateFunctionWithScriptInvalid(napi_env env1, napi_callback_info info);
napi_value TestCreateFunctionWithScriptGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestRetainScriptInvalid(napi_env env1, napi_callback_info info);

napi_value TestReleaseScriptJSOK(napi_env env1, napi_callback_info info);
napi_value TestReleaseScriptInvalid(napi_env env1, napi_callback_info info);

napi_value TestOpenInspectorWithNameJSOK(napi_env env1, napi_callback_info info);
napi_value TestOpenInspectorWithNamePending(napi_env env1, napi_callback_info info);

napi_value TestCompileWasmModulePending(napi_env env1, napi_callback_info info);
napi_value TestCompileWasmModuleModeExpected(napi_env env1, napi_callback_info info);
napi_value TestCompileWasmModuleInvalid(napi_env env1, napi_callback_info info);
napi_value TestCompileWasmModuleGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestCompileWasmFunctionPending(napi_env env1, napi_callback_info info);
napi_value TestCompileWasmFunctionModeExpected(napi_env env1, napi_callback_info info);
napi_value TestCompileWasmFunctionGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestCreateWasmCacheModeExpected(napi_env env1, napi_callback_info info);
napi_value TestCreateWasmCacheInvalid(napi_env env1, napi_callback_info info);
napi_value TestCreateWasmCacheGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestCreateExternalStringLatin1JSOK(napi_env env1, napi_callback_info info);
napi_value TestCreateExternalStringLatin1Invalid(napi_env env1, napi_callback_info info);

napi_value TestCreateExternalStringUtf16JSOK(napi_env env1, napi_callback_info info);
napi_value TestCreateExternalStringUtf16Invalid(napi_env env1, napi_callback_info info);

napi_value TestCreatePrivateJSOK(napi_env env1, napi_callback_info info);
napi_value TestCreatePrivateExpected(napi_env env1, napi_callback_info info);
napi_value TestCreatePrivateInvalid(napi_env env1, napi_callback_info info);

napi_value TestSetPrivatePending(napi_env env1, napi_callback_info info);
napi_value TestSetPrivateGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestGetPrivatePending(napi_env env1, napi_callback_info info);
napi_value TestGetPrivateGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestDeletePrivateJSOK(napi_env env1, napi_callback_info info);
napi_value TestDeletePrivatePending(napi_env env1, napi_callback_info info);
napi_value TestDeletePrivateGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestCreateDataReferenceInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetReferenceDataInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsBigIntObjectJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsBigIntObjectInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsBooleanObjectJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsBooleanObjectInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsStringObjectJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsStringObjectInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsNumberObjectJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsNumberObjectInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsSymbolObjectJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsSymbolObjectInvalid(napi_env env1, napi_callback_info info);

#endif //ARK_RUNTIME_JSVM_TEST_NAPI_ERROR2_TEST_H
