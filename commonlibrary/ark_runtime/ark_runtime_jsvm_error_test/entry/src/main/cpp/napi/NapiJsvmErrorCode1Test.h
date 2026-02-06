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

#ifndef ARK_RUNTIME_JSVM_TEST_NAPI_ERROR1_TEST_H
#define ARK_RUNTIME_JSVM_TEST_NAPI_ERROR1_TEST_H

#include <napi/native_api.h>
#include "napi/NapiJsvmErrorCodeTest.h"

napi_value TestInstanceofJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsArrayJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsArraybufferJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsDataviewJSOK(napi_env env1, napi_callback_info info);

napi_value TestEqualsJSOK(napi_env env1, napi_callback_info info);

napi_value TestDetachArraybufferExpected(napi_env env1, napi_callback_info info);

napi_value TestIsDetachedArraybufferJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetPropertyNamesJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetAllPropertyNamesJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetPropertyJSOK(napi_env env1, napi_callback_info info);

napi_value TestSetElementJSOK(napi_env env1, napi_callback_info info);

napi_value TestHasElementJSOK(napi_env env1, napi_callback_info info);

napi_value TestDeleteElementJSOK(napi_env env1, napi_callback_info info);

napi_value TestObjectFreezeJSOK(napi_env env1, napi_callback_info info);

napi_value TestObjectSealJSOK(napi_env env1, napi_callback_info info);

JSVM_Value TestGetCbInfoJSOK(JSVM_Env env, JSVM_CallbackInfo info);

JSVM_Value TestGetNewTargetJSOK(JSVM_Env env, JSVM_CallbackInfo info);

napi_value TestNewInstanceJSOK(napi_env env1, napi_callback_info info);

napi_value TestDefineClassJSOK(napi_env env1, napi_callback_info info);

napi_value TestRemoveWrapJSOK(napi_env env1, napi_callback_info info);

napi_value TestTypeTagObjectInvalid(napi_env env1, napi_callback_info info);

napi_value TestAddFinalizerJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetVersionJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetVMInfoJSOK(napi_env env1, napi_callback_info info);

napi_value TestMemoryPressureNotificationJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreatePromiseJSOK(napi_env env1, napi_callback_info info);

napi_value TestResolveDeferreJSOK(napi_env env1, napi_callback_info info);

napi_value TestRejectDeferredJSOK(napi_env env1, napi_callback_info info);

napi_value TestPromiseRegisterHandlerJSOK(napi_env env1, napi_callback_info info);
napi_value TestPromiseRegisterHandlerInvalidtype(napi_env env1, napi_callback_info info);
napi_value TestPromiseRegisterHandlerPending(napi_env env1, napi_callback_info info);
napi_value TestPromiseRegisterHandlerInvalid(napi_env env1, napi_callback_info info);
napi_value TestPromiseRegisterHandlerGenericFailure(napi_env env1, napi_callback_info info);

napi_value TestCreateSnapshotJSOK(napi_env env1, napi_callback_info info);

napi_value TestGetHeapStatisticsJSOK(napi_env env1, napi_callback_info info);

napi_value TestStartCpuProfilerJSOK(napi_env env1, napi_callback_info info);

napi_value TestStopCpuProfilerJSOK(napi_env env1, napi_callback_info info);

napi_value TestTakeHeapSnapshotJSOK(napi_env env1, napi_callback_info info);

napi_value TestOpenInspectorJSOK(napi_env env1, napi_callback_info info);
napi_value TestOpenInspectorPending(napi_env env1, napi_callback_info info);

napi_value TestCloseInspectorPending(napi_env env1, napi_callback_info info);

napi_value TestWaitForDebuggerJSOK(napi_env env1, napi_callback_info info);
napi_value TestWaitForDebuggerPending(napi_env env1, napi_callback_info info);

napi_value TestIsLockedJSOK(napi_env env1, napi_callback_info info);

napi_value TestAcquireLockJSOK(napi_env env1, napi_callback_info info);

napi_value TestReleaseLockJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsCallableJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsNullJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsNullOrUndefinedJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsBooleanJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsNumberJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsStringJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsSymbolJSOK(napi_env env1, napi_callback_info info);

napi_value TestIsBigIntJSOK(napi_env env1, napi_callback_info info);

napi_value TestCreateMapJSOK(napi_env env1, napi_callback_info info);
napi_value TestCreateMapInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsMapJSOK(napi_env env1, napi_callback_info info);
napi_value TestIsMapInvalid(napi_env env1, napi_callback_info info);

napi_value TestCreateSetInvalid(napi_env env1, napi_callback_info info);

napi_value TestIsSetInvalid(napi_env env1, napi_callback_info info);

napi_value TestCompileScriptWithOptionsInvalid(napi_env env1, napi_callback_info info);

napi_value TestCoerceToBigIntJSOK(napi_env env1, napi_callback_info info);
napi_value TestCoerceToBigIntInvalid(napi_env env1, napi_callback_info info);
napi_value TestCoerceToBigIntExpected(napi_env env1, napi_callback_info info);

#endif //ARK_RUNTIME_JSVM_TEST_NAPI_ERROR1_TEST_H
