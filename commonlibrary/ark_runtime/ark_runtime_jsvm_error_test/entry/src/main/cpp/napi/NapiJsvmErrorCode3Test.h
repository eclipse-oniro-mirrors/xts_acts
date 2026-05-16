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

#ifndef ARK_RUNTIME_JSVM_TEST_NAPI_ERROR3_TEST_H
#define ARK_RUNTIME_JSVM_TEST_NAPI_ERROR3_TEST_H

#include <napi/native_api.h>
#include "napi/NapiJsvmErrorCodeTest.h"

napi_value TestGetSymbolAsyncIteratorJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolAsyncIteratorInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolHasInstanceJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolHasInstanceInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolIsConcatSpreadableJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolIsConcatSpreadableInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolMatchJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolMatchInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolReplaceJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolReplaceInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolSearchJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolSearchInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolSplitJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolSplitInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolToPrimitiveJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolToPrimitiveInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolUnscopablesJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolUnscopablesInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolToStringTagJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolToStringTagInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetSymbolIteratorJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetSymbolIteratorInvalid(napi_env env1, napi_callback_info info);

napi_value TestSetHandlerForOOMErrorJSOK(napi_env env1, napi_callback_info info);
napi_value TestSetHandlerForOOMErrorInvalid(napi_env env1, napi_callback_info info);

napi_value TestSetDebugOptionJSOK(napi_env env1, napi_callback_info info);
napi_value TestSetDebugOptionInvalid(napi_env env1, napi_callback_info info);

napi_value TestSetHandlerForFatalErrorJSOK(napi_env env1, napi_callback_info info);
napi_value TestSetHandlerForFatalErrorInvalid(napi_env env1, napi_callback_info info);

napi_value TestSetHandlerForPromiseRejectJSOK(napi_env env1, napi_callback_info info);
napi_value TestSetHandlerForPromiseRejectInvalid(napi_env env1, napi_callback_info info);

napi_value TestDefineClassWithOptionsJSOK(napi_env env1, napi_callback_info info);
napi_value TestDefineClassWithOptionsGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestAddHandlerForGCJSOK(napi_env env1, napi_callback_info info);
napi_value TestAddHandlerForGCInvalid(napi_env env1, napi_callback_info info);

napi_value TestRemoveHandlerForGCJSOK(napi_env env1, napi_callback_info info);
napi_value TestRemoveHandlerForGCInvalid(napi_env env1, napi_callback_info info);


napi_value TestJSVMStatusNameExpected(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusFunctionExpected(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusEscapeCalledTwice(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusBigintExpected(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusDateExpected(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusDetacgableArraybufferExpected(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusInvalidType(napi_env env1, napi_callback_info info);
napi_value TestJSVMStatusJitModeExpected(napi_env env1, napi_callback_info info);


#endif //ARK_RUNTIME_JSVM_TEST_NAPI_ERROR3_TEST_H
