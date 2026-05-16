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

#ifndef ARK_RUNTIME_JSVM_TEST_NAPI_ERROR_TEST_H
#define ARK_RUNTIME_JSVM_TEST_NAPI_ERROR_TEST_H

#include <napi/native_api.h>
#include <ark_runtime/jsvm.h>

JSVM_Status CreateVMInstance(JSVM_VM* vm);
JSVM_Status CreateVMWithCreateSnapshot(JSVM_VM *vm, JSVM_VMScope *vmScope, JSVM_Env *env);

napi_value TestCreateVMJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateProxyJSOK(napi_env env1, napi_callback_info info);
napi_value TestCreateProxyPending(napi_env env1, napi_callback_info info);
napi_value TestCreateProxyInvalid(napi_env env1, napi_callback_info info);
napi_value TestCreateProxyObejct(napi_env env1, napi_callback_info info);

napi_value TestIsProxyJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsProxyInvalid(napi_env env1, napi_callback_info info);

napi_value TestProxyGetTargetJSOK(napi_env env1, napi_callback_info info);
napi_value TestProxyGetTargetInvalid(napi_env env1, napi_callback_info info);
napi_value TestProxyGetTargetInvalidType(napi_env env1, napi_callback_info info);

napi_value TestOpenVMScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestCloseVMScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateEnvJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateEnvFromSnapshotJSOK(napi_env env1, napi_callback_info info);

napi_value TestDestroyEnvJSOK(napi_env env1, napi_callback_info info);

napi_value TestOpenEnvScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestCloseEnvScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetVMJSOK(napi_env env1, napi_callback_info info);

napi_value TestCompileScriptJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateCodeCacheJSOK(napi_env env1, napi_callback_info info);

napi_value TestThrowJSOK(napi_env env1, napi_callback_info info);

napi_value TestOpenHandleScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestOpenEscapableHandleScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestCloseEscapableHandleScopeJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetReferenceValueJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateArrayJSOK(napi_env env1, napi_callback_info info);

napi_value TestAllocateArrayBufferBackingStoreDataInvalid(napi_env env1, napi_callback_info info);

napi_value TestAllocateArrayBufferBackingStoreDataGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestFreeArrayBufferBackingStoreDataInvalid(napi_env env1, napi_callback_info info);

napi_value TestCreateArrayBufferFromBackingStoreDataInvalid(napi_env env1, napi_callback_info info);

napi_value TestCreateDateJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateExternalJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateSymbolJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateBigintInt64JSOK(napi_env env1, napi_callback_info info);

napi_value TestGetArrayLengthJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetPrototypeJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetDateValueJSOK(napi_env env1, napi_callback_info info);
napi_value TestGetDateValueExpected(napi_env env1, napi_callback_info info);

napi_value TestGetValueBoolJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetValueDoubleExpected(napi_env env1, napi_callback_info info);

napi_value TestGetValueBigintInt64Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueBigintUint64JSOK(napi_env env1, napi_callback_info info);
napi_value TestGetValueBigintUint64Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueExternalInvalid(napi_env env1, napi_callback_info info);

napi_value TestGetValueInt32Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueInt64Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueStringLatin1JSOK(napi_env env1, napi_callback_info info);
napi_value TestGetValueStringLatin1Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueStringUtf8JSOK(napi_env env1, napi_callback_info info);
napi_value TestGetValueStringUtf8Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueStringUtf16JSOK(napi_env env1, napi_callback_info info);
napi_value TestGetValueStringUtf16Expected(napi_env env1, napi_callback_info info);

napi_value TestGetValueUint32JSOK(napi_env env1, napi_callback_info info);
napi_value TestGetValueUint32Expected(napi_env env1, napi_callback_info info);

napi_value TestGetBooleanJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetNullJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetUndefinedJSOK(napi_env env1, napi_callback_info info);

napi_value TestCoerceToBoolJSOK(napi_env env1, napi_callback_info info);

napi_value TestCoerceToNumberJSOK(napi_env env1, napi_callback_info info);

napi_value TestCoerceToObjectJSOK(napi_env env1, napi_callback_info info);

napi_value TestCoerceToStringJSOK(napi_env env1, napi_callback_info info);

#endif //ARK_RUNTIME_JSVM_TEST_NAPI_ERROR_TEST_H
