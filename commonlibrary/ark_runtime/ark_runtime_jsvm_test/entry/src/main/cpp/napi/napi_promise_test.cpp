/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

#include "napi/native_api.h"
#include "napi_promise_test.h"

//OH_JSVM_IsPromise：value null,return not ok
[[maybe_unused]] JSVM_Value TestIsPromiseCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    bool isPromise = false;
    JSVM_Status status = OH_JSVM_IsPromise(env, nullptr, &isPromise);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase01:OH_JSVM_IsPromise Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//input promise,return ok,result true
[[maybe_unused]] JSVM_Value TestIsPromiseCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Deferred deferred = nullptr;
    JSVM_Value promise;
    OH_JSVM_CreatePromise(env, &deferred, &promise);
    bool isPromise = false;
    JSVM_Status status = OH_JSVM_IsPromise(env, promise, &isPromise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase02:OH_JSVM_IsPromise Failed.");
        return nullptr;
    }
    if (!isPromise) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase02:OH_JSVM_IsPromise false Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//input not promise,return ok,result false
[[maybe_unused]] JSVM_Value TestIsPromiseCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    bool isPromise = false;
    JSVM_Status status = OH_JSVM_IsPromise(env, args[0], &isPromise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase03:OH_JSVM_IsPromise Failed.");
        return nullptr;
    }
    if (isPromise) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase03:OH_JSVM_IsPromise true Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JS Create promise obj,return ok，result is true
[[maybe_unused]] JSVM_Value TestIsPromiseCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Deferred defer;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &defer, &promise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase04:OH_JSVM_CreatePromise Failed.");
        return nullptr;
    }

    bool isPromise = false;
    status = OH_JSVM_IsPromise(env, promise, &isPromise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase04:OH_JSVM_IsPromise Failed.");
        return nullptr;
    }
    if (!isPromise) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsPromiseCase04:OH_JSVM_IsPromise false Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreatePromise:call this func,return ok, deferred and promise not null
[[maybe_unused]] JSVM_Value TestCreatePromiseCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Deferred defer;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &defer, &promise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreatePromiseCase01:OH_JSVM_CreatePromise 1 Failed.");
        return nullptr;
    }
    if (defer == nullptr || promise == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreatePromiseCase01:OH_JSVM_CreatePromise 2 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_ResolveDeferred
//OH_JSVM_CreatePromise create deferred and promise,call this func,resolution true,return ok
[[maybe_unused]] JSVM_Value TestResolveDeferredCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Deferred deferred;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &deferred, &promise);
    if (status != JSVM_OK || deferred == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestResolveDeferredCase01:OH_JSVM_CreatePromise Failed.");
        return nullptr;
    }

    JSVM_Value value = nullptr;
    bool setVal = true;
    OH_JSVM_GetBoolean(env, setVal, &value);
    status = OH_JSVM_ResolveDeferred(env, deferred, value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestResolveDeferredCase01:OH_JSVM_ResolveDeferred Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreatePromise create deferred and promise,call this func,resolution false, return ok
[[maybe_unused]] JSVM_Value TestResolveDeferredCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Deferred deferred;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &deferred, &promise);
    if (status != JSVM_OK || deferred == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestResolveDeferredCase02:OH_JSVM_CreatePromise Failed.");
        return nullptr;
    }

    JSVM_Value value = nullptr;
    bool setVal = false;
    OH_JSVM_GetBoolean(env, setVal, &value);
    status = OH_JSVM_ResolveDeferred(env, deferred, value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestResolveDeferredCase02:OH_JSVM_ResolveDeferred Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_RejectDeferred:OH_JSVM_CreatePromise create deferred and promise,call this func,rejection true, return ok
[[maybe_unused]] JSVM_Value TestRejectDeferredCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    bool setVal = true;
    JSVM_Value retVal = nullptr;
    OH_JSVM_GetBoolean(env, setVal, &retVal);
    JSVM_Value args[2] = {retVal, retVal};
    
    JSVM_Deferred deferred;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &deferred, &promise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRejectDeferredCase01:OH_JSVM_CreatePromise Failed.");
        return nullptr;
    }

    status = OH_JSVM_RejectDeferred(env, deferred, args[1]);
    if (status != JSVM_OK) {
            OH_JSVM_ThrowError(env, nullptr, "TestRejectDeferredCase01:ResolveDeferred 2 Failed.");
            return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreatePromise create deferred and promise, call this func, rejection false, return ok
[[maybe_unused]] JSVM_Value TestRejectDeferredCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    bool setVal = false;
    JSVM_Value retVal = nullptr;
    OH_JSVM_GetBoolean(env, setVal, &retVal);
    JSVM_Value args[2] = {retVal, retVal};

    JSVM_Deferred deferred;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &deferred, &promise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRejectDeferredCase02:OH_JSVM_CreatePromise Failed.");
        return nullptr;
    }

    status = OH_JSVM_RejectDeferred(env, deferred, args[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRejectDeferredCase02:ResolveDeferred 2 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//API:create -- is -- resolve result normal
[[maybe_unused]] JSVM_Value TestCreateResolveDeferredCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    bool setVal = false;
    JSVM_Value retVal = nullptr;
    OH_JSVM_GetBoolean(env, setVal, &retVal);
    JSVM_Value args[2] = {retVal, retVal};

    JSVM_Deferred deferred;
    JSVM_Value promise;
    JSVM_Status status = OH_JSVM_CreatePromise(env, &deferred, &promise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateResolveDeferredCase01:OH_JSVM_CreatePromise Failed.");
        return nullptr;
    }

    bool isPromise = false;
    status = OH_JSVM_IsPromise(env, promise, &isPromise);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateResolveDeferredCase01:OH_JSVM_IsPromise 1 Failed.");
        return nullptr;
    }
    if (!isPromise) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateResolveDeferredCase01:OH_JSVM_IsPromise 2 Failed.");
        return nullptr;
    }

    status = OH_JSVM_ResolveDeferred(env, deferred, args[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateResolveDeferredCase01:OH_JSVM_ResolveDeferred Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}