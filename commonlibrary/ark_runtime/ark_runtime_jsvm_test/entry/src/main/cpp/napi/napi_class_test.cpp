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
#include "napi_class_test.h"


//OH_JSVM_NewInstance:Constructor is a constructor with input parameters，argc、argv normal，result not null
[[maybe_unused]] JSVM_Value TestNewInstanceCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestNewInstanceCase01:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestNewInstanceCase01:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//Constructor is not a constructor，argc\argv nullptr, result not null
[[maybe_unused]] JSVM_Value TestNewInstanceCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;

    JSVM_Value instanceValue = nullptr;
    JSVM_Status status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestNewInstanceCase02:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetNewTarget:cbinfo not null + result not null
[[maybe_unused]] JSVM_Value TestGetNewTargetCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value newTarget = nullptr;
    JSVM_Status status = OH_JSVM_GetNewTarget(env, info, &newTarget);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNewTargetCase01:OH_JSVM_GetNewTarget Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//cbinfo NULL , result not null
[[maybe_unused]] JSVM_Value TestGetNewTargetCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value newTarget = nullptr;
    JSVM_Status status = OH_JSVM_GetNewTarget(env, nullptr, &newTarget);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNewTargetCase02:OH_JSVM_GetNewTarget Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//cbinfo not null，result NULL
[[maybe_unused]] JSVM_Value TestGetNewTargetCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_GetNewTarget(env, info, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNewTargetCase03:OH_JSVM_GetNewTarget Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_DefineClass:name not null + length <= utf8name + properties not null + propertyCount <= properties + result
[[maybe_unused]] JSVM_Value TestDefineClassCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testWrapClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env,
                                             "TestWrapClass",
                                             NAPI_AUTO_LENGTH,
                                             &param1,
                                             0,
                                             nullptr,
                                             &testWrapClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefineClassCase01:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//name not null + length <= utf8name + properties NULL+ propertyCount 0 + result NULL
[[maybe_unused]] JSVM_Value TestDefineClassCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", NAPI_AUTO_LENGTH, &param1, 0, nullptr, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefineClassCase02:OH_JSVM_DefineClass abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_Wrap:jsobject+nativeObject+finalizeCb+finalizeHint+result not null
[[maybe_unused]] JSVM_Value TestWrapCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase01:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase01:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    void* finalizeHint = malloc(10);
    JSVM_Ref resultRef = nullptr;
    status = OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, finalizeHint, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase01:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsobject|nativeObject not null + finalizeCb NULL + finalizeHint NULL + result NULL
[[maybe_unused]] JSVM_Value TestWrapCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase02:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase02:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    status = OH_JSVM_Wrap(env, instanceValue, (void *)testStr, nullptr, nullptr, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase02:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsobject NULL + nativeObject not null + finalizeCb NULL + finalizeHint NULL + result NULL
[[maybe_unused]] JSVM_Value TestWrapCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char *testStr = "test";
    JSVM_Status status = OH_JSVM_Wrap(env, nullptr, (void *)testStr, nullptr, nullptr, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase03:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsobject not null + nativeObject NULL + finalizeCb NULL + finalizeHint NULL + result NULL
[[maybe_unused]] JSVM_Value TestWrapCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase04:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase04:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    status = OH_JSVM_Wrap(env, nullptr, instanceValue, nullptr, nullptr, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestWrapCase04:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_Unwrap:JsObject has been wrapped with other object instances + result not null
[[maybe_unused]] JSVM_Value TestUnwrapCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase01:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase01:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    void* finalizeHint = malloc(0);
    JSVM_Ref resultRef = nullptr;
    status = OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, finalizeHint, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase01:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    const char *tmpTestStr = nullptr;
    status = OH_JSVM_Unwrap(env, instanceValue, (void **)&tmpTestStr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase01:OH_JSVM_Unwrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JsObject is not wrapped with other object instances + result not null
[[maybe_unused]] JSVM_Value TestUnwrapCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase02:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase02:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *tmpTestStr = nullptr;
    status = OH_JSVM_Unwrap(env, instanceValue, (void **)&tmpTestStr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase02:OH_JSVM_Unwrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsObject NULL + result not null
[[maybe_unused]] JSVM_Value TestUnwrapCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char *tmpTestStr = nullptr;
    JSVM_Status status = OH_JSVM_Unwrap(env, nullptr, (void **)&tmpTestStr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase03:OH_JSVM_Unwrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JsObject has been wrapped with other object instances + result NULL
[[maybe_unused]] JSVM_Value TestUnwrapCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase04:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase04:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    void* finalizeHint = malloc(0);
    JSVM_Ref resultRef = nullptr;
    status = OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, finalizeHint, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase04:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    status = OH_JSVM_Unwrap(env, instanceValue, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestUnwrapCase04:OH_JSVM_Unwrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_RemoveWrap:JsObject has been wrapped with other object instances + result not null
[[maybe_unused]] JSVM_Value TestRemoveWrapCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase01:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase01:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    void* finalizeHint = malloc(0);
    JSVM_Ref resultRef = nullptr;
    status = OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, finalizeHint, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase01:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    const char *tmpTestStr1 = nullptr;
    status = OH_JSVM_RemoveWrap(env, instanceValue, (void **)&tmpTestStr1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase01:OH_JSVM_RemoveWrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JsObject is not wrapped with other object instances + result not null
[[maybe_unused]] JSVM_Value TestRemoveWrapCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase02:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase02:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *tmpTestStr1 = nullptr;
    status = OH_JSVM_RemoveWrap(env, instanceValue, (void **)&tmpTestStr1);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase02:OH_JSVM_RemoveWrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsObject NULL + result not null
[[maybe_unused]] JSVM_Value TestRemoveWrapCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char *tmpTestStr1 = nullptr;
    JSVM_Status status = OH_JSVM_RemoveWrap(env, nullptr, (void **)&tmpTestStr1);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase03:OH_JSVM_RemoveWrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JsObject has been wrapped with other object instances + result NULL
[[maybe_unused]] JSVM_Value TestRemoveWrapCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };

    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase04:OH_JSVM_DefineClass Failed.");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase04:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    void* finalizeHint = malloc(0);
    JSVM_Ref resultRef = nullptr;
    status = OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, finalizeHint, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase04:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    status = OH_JSVM_RemoveWrap(env, instanceValue, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestRemoveWrapCase04:OH_JSVM_RemoveWrap Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//API:defineClass -> NewInstance -> Wrap -> Unwrap ok -> RemoveWrap -> unwrap fail
[[maybe_unused]] JSVM_Value TestClassOperationCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    JSVM_Status status = OH_JSVM_DefineClass(env, "TestClass", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &testClass);

    JSVM_Value instanceValue = nullptr;
    status = OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestClassOperationCase01:OH_JSVM_NewInstance Failed.");
        return nullptr;
    }

    const char *testStr = "test";
    void* finalizeHint = malloc(100);
    JSVM_Ref resultRef = nullptr;
    status = OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, finalizeHint, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestClassOperationCase01:OH_JSVM_Wrap Failed.");
        return nullptr;
    }

    const char *tmpTestStr1 = nullptr;
    status = OH_JSVM_Unwrap(env, instanceValue, (void **)&tmpTestStr1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestClassOperationCase01:OH_JSVM_Unwrap Failed.");
        return nullptr;
    }

    status = OH_JSVM_RemoveWrap(env, instanceValue, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestClassOperationCase01:OH_JSVM_RemoveWrap Failed.");
        return nullptr;
    }

    const char *tmpTestStr2 = nullptr;
    status = OH_JSVM_Unwrap(env, instanceValue, (void **)&tmpTestStr2);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestClassOperationCase01:OH_JSVM_Unwrap Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}