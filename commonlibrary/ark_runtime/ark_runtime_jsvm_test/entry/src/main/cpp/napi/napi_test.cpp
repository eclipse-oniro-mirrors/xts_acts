/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "jsvm.h"
#include "jsvm_common.h"
#include "native_common.h"
#include "securec.h"
#include <stdint.h>
#include <stdio.h>
#include <malloc.h>
#include <ctime>
#include <thread>
#include <uv.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include <cstring>
#include <fstream>
#include <string>
#include <vector>
#define LOG_DEMAIN 0x0202
using namespace std;
static int aa = 0;
#define OPENCODE
#ifdef OPENCODE
static void addReturnedStatus(JSVM_Env env, const char *key, JSVM_Value object, const char *expected_message,
                              JSVM_Status expected_status, JSVM_Status actual_status) {
    char napi_message_string[100] = "";
    JSVM_Value prop_value;

    if (actual_status != expected_status) {
        printf("Invalid status [%d]", actual_status);
    }

    JSVM_CALL_RETURN_VOID(
        env, OH_JSVM_CreateStringUtf8(env, (actual_status == expected_status ? expected_message : napi_message_string),
                                      NAPI_AUTO_LENGTH, &prop_value));
    JSVM_CALL_RETURN_VOID(env, OH_JSVM_SetNamedProperty(env, object, key, prop_value));
}

static void addLastStatus(JSVM_Env env, const char *key, JSVM_Value return_value) {
    JSVM_Value prop_value;
    const JSVM_ExtendedErrorInfo *p_last_error;
    JSVM_CALL_RETURN_VOID(env, OH_JSVM_GetLastErrorInfo(env, &p_last_error));

    JSVM_CALL_RETURN_VOID(
        env, OH_JSVM_CreateStringUtf8(
                 env, (p_last_error->errorMessage == NULL ? "JSVM_Status::JSVM_OK" : p_last_error->errorMessage),
                 NAPI_AUTO_LENGTH, &prop_value));
    JSVM_CALL_RETURN_VOID(env, OH_JSVM_SetNamedProperty(env, return_value, key, prop_value));
}
#endif
static JSVM_Value defineProperties(JSVM_Env env, JSVM_CallbackInfo info) {
    JSVM_Value object, return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = defineProperties;
    JSVM_PropertyDescriptor desc = {"prop", NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_ENUMERABLE};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));

    addReturnedStatus(env, "envIsNull", return_value, "Invalid argument", JSVM_Status::JSVM_INVALID_ARG,
                      OH_JSVM_DefineProperties(NULL, object, 1, &desc));

    OH_JSVM_DefineProperties(env, NULL, 1, &desc);
    addLastStatus(env, "objectIsNull", return_value);

    OH_JSVM_DefineProperties(env, object, 1, NULL);
    addLastStatus(env, "descriptorListIsNull", return_value);

    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    addLastStatus(env, "utf8nameIsNull", return_value);
    desc.utf8name = "prop";

    desc.method = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    addLastStatus(env, "methodIsNull", return_value);
    desc.method = &param;

    return return_value;
}
static JSVM_Value assertEqual(JSVM_Env env, JSVM_CallbackInfo info) {
    size_t argc = 2;
    JSVM_Value args[2];
    JSVM_CALL(env, OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    bool isStrictEquals = false;
    OH_JSVM_StrictEquals(env, args[0], args[1], &isStrictEquals);
    return nullptr;
}

static JSVM_Value assertTrue(JSVM_Env env, JSVM_CallbackInfo info) {
    size_t argc = 1;
    JSVM_Value args[1];
    JSVM_CALL(env, OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    bool value = false;
    JSVM_CALL(env, OH_JSVM_GetValueBool(env, args[0], &value));
    return nullptr;
}

static JSVM_Value assertFalse(JSVM_Env env, JSVM_CallbackInfo info) {
    size_t argc = 1;
    JSVM_Value args[1];
    JSVM_CALL(env, OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    bool value = false;
    JSVM_CALL(env, OH_JSVM_GetValueBool(env, args[0], &value));
    return nullptr;
}

static JSVM_Value consoleinfo(JSVM_Env env, JSVM_CallbackInfo info) {
    size_t argc = 1;
    JSVM_Value args[1];
    char log[256] = "";
    size_t log_length;
    JSVM_CALL(env, OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    JSVM_CALL(env, OH_JSVM_GetValueStringUtf8(env, args[0], log, 255, &log_length));
    return nullptr;
}


// OH_JSVM_IsArray
static JSVM_Value isArray(JSVM_Env env, JSVM_CallbackInfo info) {
    JSVM_Value array = nullptr;
    OH_JSVM_CreateArray(env, &array);
    JSVM_ASSERT(env, array != nullptr, "OH_JSVM_GetUndefined success");
    bool isArray = false;
    OH_JSVM_IsArray(env, array, &isArray);
    JSVM_ASSERT(env, isArray, "OH_JSVM_IsArrayd success");

    JSVM_Value _value;
    JSVM_CALL(env, OH_JSVM_CreateInt32(env, 0, &_value));
    return _value;
}
static JSVM_Value hello(JSVM_Env env, JSVM_CallbackInfo info) {
    JSVM_Value output;
    void *data = nullptr;
    OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, nullptr, &data);
    OH_JSVM_CreateStringUtf8(env, (char *)data, strlen((char *)data), &output);
    return output;
}
static JSVM_CallbackStruct hello_cb = {hello, (void *)"Hello"};
static intptr_t externals[] = {
    (intptr_t)&hello_cb,
    0,
};


static napi_value testEngineAndContext(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));

    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    

    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char *sourcecodestr = "\
{\
    var length = 5; var arr = new Array(length); arr[4] = 123;\
}\
";
    JSVM_Value sourcecodevalue;
    OH_JSVM_CreateStringUtf8(env, sourcecodestr, strlen(sourcecodestr), &sourcecodevalue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourcecodevalue, nullptr, 0, true, nullptr, &script);
    JSVM_Value result;
    OH_JSVM_RunScript(env, script, &result);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testError(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    //error
    JSVM_Value code = nullptr;
    JSVM_Value message = nullptr;
    OH_JSVM_CreateStringLatin1(env, "600", NAPI_AUTO_LENGTH, &code);
    OH_JSVM_CreateStringLatin1(env, "test error", NAPI_AUTO_LENGTH, &message);
    JSVM_Value error = nullptr;
    OH_JSVM_CreateError(env, code, message, &error);
    bool isError = false;
    OH_JSVM_IsError(env, error, &isError);
    OH_JSVM_ThrowError(env, "500", "Common error");
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testTypeError(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));

    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;

    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    // typeError
    JSVM_Value code1 = nullptr;
    JSVM_Value message1 = nullptr;
    OH_JSVM_CreateStringLatin1(env, "500", NAPI_AUTO_LENGTH, &code1);
    OH_JSVM_CreateStringLatin1(env, "type error 500", NAPI_AUTO_LENGTH, &message1);
    JSVM_Value error1 = nullptr;
    OH_JSVM_CreateTypeError(env, code1, message1, &error1);
    bool isError1 = false;
    OH_JSVM_IsError(env, error1, &isError1);
    OH_JSVM_ThrowTypeError(env, NULL, "type error1");
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testRangeError(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));

    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;

    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    // rangeError
    JSVM_Value code2 = nullptr;
    JSVM_Value message2 = nullptr;
    OH_JSVM_CreateStringLatin1(env, "500", NAPI_AUTO_LENGTH, &code2);
    OH_JSVM_CreateStringLatin1(env, "range error 500", NAPI_AUTO_LENGTH, &message2);
    JSVM_Value error2 = nullptr;
    OH_JSVM_CreateRangeError(env, code2, message2, &error2);
    bool isError2 = false;
    OH_JSVM_IsError(env, error2, &isError2);
    OH_JSVM_ThrowRangeError(env, NULL, "range error");
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testSyntaxError(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;

    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    // syntaxError
    JSVM_Value code3 = nullptr;
    JSVM_Value message3 = nullptr;
    OH_JSVM_CreateStringLatin1(env, "500", NAPI_AUTO_LENGTH, &code3);
    OH_JSVM_CreateStringLatin1(env, "syntax error 500", NAPI_AUTO_LENGTH, &message3);
    JSVM_Value error3 = nullptr;
    OH_JSVM_CreateSyntaxError(env, code3, message3, &error3);
    bool isError3 = false;
    OH_JSVM_IsError(env, error3, &isError3);
    OH_JSVM_ThrowSyntaxError(env, NULL, "syntax error");
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testClearError(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;

    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    // getLastErrorInfo
    JSVM_Value value;
    OH_JSVM_CreateStringUtf8(env, "xyz", 3, &value);
    double double_value;
    OH_JSVM_GetValueDouble(env, value, &double_value);
    const JSVM_ExtendedErrorInfo *error_info = 0;
    OH_JSVM_GetLastErrorInfo(env, &error_info);
    // getAndClearLastException
    JSVM_Value code4 = nullptr;
    JSVM_Value message4 = nullptr;
    OH_JSVM_CreateStringLatin1(env, "600", NAPI_AUTO_LENGTH, &code4);
    OH_JSVM_CreateStringLatin1(env, "tag range error", NAPI_AUTO_LENGTH, &message4);
    JSVM_Value error4 = nullptr;
    OH_JSVM_CreateRangeError(env, code4, message4, &error4);
    bool isError4 = false;
    OH_JSVM_IsError(env, error4, &isError4);
    JSVM_Value ex;
    OH_JSVM_GetAndClearLastException(env, &ex);
    bool exceptionWasPending = true;
    OH_JSVM_IsExceptionPending(env, &exceptionWasPending);
    OH_JSVM_Throw(env, error4);
    OH_JSVM_IsExceptionPending(env, &exceptionWasPending);
    JSVM_Value ex1;
    OH_JSVM_GetAndClearLastException(env, &ex1);
    isError4 = false;
    OH_JSVM_IsError(env, ex1, &isError4);
    OH_JSVM_IsExceptionPending(env, &exceptionWasPending);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    // shaoshuai
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testLifeCycle(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_EscapableHandleScope handlescope1;
    OH_JSVM_OpenEscapableHandleScope(env,&handlescope1);
    JSVM_Value output = NULL;
    JSVM_Value escapee = NULL;
    OH_JSVM_CreateObject(env, &output);
    OH_JSVM_EscapeHandle(env, handlescope1, output, &escapee);
    JSVM_Value result = nullptr;
    JSVM_Ref resultRef = nullptr;
    uint32_t resultRefCount = 0;
    OH_JSVM_CreateObject(env, &result);
    OH_JSVM_CreateReference(env, result, 1, &resultRef);
    OH_JSVM_ReferenceRef(env, resultRef, &resultRefCount);
    OH_JSVM_ReferenceUnref(env, resultRef, &resultRefCount);
    JSVM_Value refValue = nullptr;
    OH_JSVM_GetReferenceValue(env, resultRef, &refValue);
    OH_JSVM_DeleteReference(env, resultRef);
    OH_JSVM_CloseEscapableHandleScope(env,handlescope1);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testCreateData1(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value ret;
    OH_JSVM_CreateArray(env, &ret);
    bool is_array = false;
    OH_JSVM_IsArray(env,ret,&is_array);
    uint32_t array_length = 10;
    JSVM_Value ret1;
    OH_JSVM_CreateArrayWithLength(env, array_length, &ret1);
    uint32_t length;
    OH_JSVM_GetArrayLength(env, ret1, &length);
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    JSVM_Value createResult = nullptr;
    double time = 202110181203150;
    OH_JSVM_CreateDate(env, time, &createResult);
    double getTime;
    OH_JSVM_GetDateValue(env, createResult, &getTime);
    bool is_date = false;
    OH_JSVM_IsDate(env,createResult,&is_date);
    const char testStr[] = "test";
    JSVM_Value external = nullptr;
    OH_JSVM_CreateExternal(
        env, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, (void *)testStr, &external);
    void *tempExternal = nullptr;
    OH_JSVM_GetValueExternal(env, external, &tempExternal);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    // shaoshuai
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testCreateData2(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value description;
    OH_JSVM_CreateStringUtf8(env,"teststr",7,&description);
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    OH_JSVM_GetValueStringUtf8(env,description, buffer, bufferSize, &copied);
    JSVM_Value symbol;
    OH_JSVM_CreateSymbol(env, description, &symbol);
    JSVM_Value result_symbol;
    OH_JSVM_SymbolFor(env, NULL, 0, &result_symbol);
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    void *tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    OH_JSVM_GetArraybufferInfo(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    JSVM_Value _value;
    OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, typedArrayLength, arrayBuffer, 0, &_value);
    bool isTypedArray = false;
    OH_JSVM_IsTypedarray(env, _value, &isTypedArray);
    JSVM_TypedarrayType type;
    size_t length = 0;
    void *data = nullptr;
    JSVM_Value retArrayBuffer;
    size_t byteOffset = -1;
    OH_JSVM_GetTypedarrayInfo(env, _value, &type, &length, &data, &retArrayBuffer, &byteOffset);
    OH_JSVM_DetachArraybuffer(env,retArrayBuffer);
    bool isDetachedArrayBuffer = false;
    OH_JSVM_IsDetachedArraybuffer(env, retArrayBuffer,&isDetachedArrayBuffer);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testCreateData3(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    bool isArrayBuffer = false;
    OH_JSVM_IsArraybuffer(env, arrayBuffer, &isArrayBuffer);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateDataview(env, arrayBufferSize, arrayBuffer, 0, &result);
    bool isDataView = false;
    OH_JSVM_IsDataview(env, result, &isDataView);
    JSVM_Value retArrayBuffer = nullptr;
    void *data = nullptr;
    size_t byteLength = 0;
    size_t byteOffset = -1;
    OH_JSVM_GetDataviewInfo(env, result, &byteLength, &data, &retArrayBuffer, &byteOffset);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testCreateData4(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value output1;
    OH_JSVM_CreateInt32(env, 0, &output1);
    int32_t value1;
    OH_JSVM_GetValueInt32(env, output1, &value1);
    JSVM_Value output2;
    OH_JSVM_CreateUint32(env,0, &output2);
    uint32_t value2;
    OH_JSVM_GetValueUint32(env,output2, &value2);
    JSVM_Value output3;
    OH_JSVM_CreateInt64(env, (double)0, &output3);
    int64_t value3;
    OH_JSVM_GetValueInt64(env,output3, &value3);
    int64_t resultValue = 0;
    bool flag = false;
    OH_JSVM_GetValueBigintInt64(env, output3, &resultValue, &flag);
    uint64_t testValue = UINT64_MAX;
    JSVM_Value result = nullptr;
    OH_JSVM_CreateBigintUint64(env, testValue, &result);
  
    uint64_t resultValue1 = 0;
    bool flag1 = false;
    OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    double value = 1.0;
    JSVM_Value output4;
    OH_JSVM_CreateDouble(env, value, &output4);
    double resultDouble;
    OH_JSVM_GetValueDouble(env, output4, &resultDouble);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testCreateData5(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    int64_t testValue = INT64_MAX;
    JSVM_Value result = nullptr;
    OH_JSVM_CreateBigintInt64(env, testValue, &result);
    uint64_t testValue1 = UINT64_MAX;
    JSVM_Value result1 = nullptr;
    OH_JSVM_CreateBigintUint64(env, testValue1, &result1);
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    JSVM_Value result2 = nullptr;
    OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &result2);
    int retSignBit = -1;
    size_t retWordCount = 4;
    OH_JSVM_GetValueBigintWords(env, result2, &retSignBit, &retWordCount, wordsOut);
    JSVM_Value description;
    OH_JSVM_CreateStringLatin1(env, "teststr", 7, &description);
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    OH_JSVM_GetValueStringLatin1(env,description, buffer, bufferSize, &copied);
    const char16_t *str  = u"he"; 
    JSVM_Value result4;
    OH_JSVM_CreateStringUtf16(env, str, 2, &result4);
    char16_t buffer1[128];    // 128: char16_t type of element size
    size_t bufferSize1 = 128; // 128: char16_t type of element size
    size_t copied1 = 0;
    OH_JSVM_GetValueStringUtf16(env,result4, buffer1, bufferSize1, &copied1);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testGetData1(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value testWrapClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    OH_JSVM_DefineClass(env, "TestWrapClass", NAPI_AUTO_LENGTH, &param1, 0, nullptr, &testWrapClass);
    JSVM_Value customClassPrototype = nullptr;
    OH_JSVM_GetPrototype(env, testWrapClass, &customClassPrototype);
    bool value1 = true;
    JSVM_Value boolValue;
    OH_JSVM_GetBoolean(env,value1,&boolValue);
    bool value2;
    OH_JSVM_GetValueBool(env,boolValue, &value2);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testGetData2(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value result = nullptr;
    OH_JSVM_GetGlobal(env, &result);
    JSVM_Value result1 = nullptr;
    OH_JSVM_GetNull(env, &result1);
    JSVM_ValueType type;
    OH_JSVM_Typeof(env, result1, &type);
    JSVM_Value result2 = nullptr;
    OH_JSVM_GetUndefined(env, &result2);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testValueOperation(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value value1;
    OH_JSVM_CreateInt32(env,0,&value1);
    JSVM_Value value2;
    OH_JSVM_CoerceToBool(env,value1,&value2);
    JSVM_Value value3;
    OH_JSVM_CreateStringUtf8(env, "12", 2, &value3);
    JSVM_Value value4;
    OH_JSVM_CoerceToNumber(env,value3,&value4);
    JSVM_Value ret;
    OH_JSVM_CreateArray(env, &ret);
    JSVM_Value value5;
    OH_JSVM_CoerceToObject(env, ret,&value5);
    JSVM_Value value6;
    OH_JSVM_CoerceToString(env,value1,&value6);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testValueOperation2(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value customClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    OH_JSVM_DefineClass(env, "TestWrapClass", NAPI_AUTO_LENGTH, &param1, 0, nullptr, &customClass);
    JSVM_Value customClassPrototype = nullptr;
    OH_JSVM_GetPrototype(env, customClass, &customClassPrototype);
    JSVM_Value customInstance = nullptr;
    OH_JSVM_NewInstance(env, customClass, 0, nullptr, &customInstance);
    bool isInstanceOf = false;
    OH_JSVM_Instanceof(env, customInstance, customClass, &isInstanceOf);
    const char *testStringStr = "test";
    JSVM_Value testString = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStringStr, strlen(testStringStr), &testString);
    bool isStrictEquals = false;
    OH_JSVM_StrictEquals(env, testString, testString, &isStrictEquals);
    JSVM_Value testObject = nullptr;
    OH_JSVM_CreateObject(env, &testObject);
    isStrictEquals = false;
    OH_JSVM_StrictEquals(env, testObject, testObject, &isStrictEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testGetPropertyNames(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateObject(env, &result);
    const char testStr[] = "1234567";
    JSVM_Value strAttribute = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &strAttribute);
    OH_JSVM_SetNamedProperty(env, result, "strAttribute", strAttribute);
    bool hasNamedProperty = false;
    OH_JSVM_HasNamedProperty(env, result, "strAttribute", &hasNamedProperty);
    JSVM_Value retStrAttribute = nullptr;
    OH_JSVM_GetNamedProperty(env, result, "strAttribute", &retStrAttribute);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testGetAllPropertyNames(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value returnValue, props;
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &returnValue));
    addReturnedStatus(env, "envIsNull", returnValue, "Invalid argument", JSVM_Status::JSVM_INVALID_ARG,
                      OH_JSVM_GetAllPropertyNames(nullptr, returnValue, JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
                                                  JSVM_KeyFilter::JSVM_KEY_WRITABLE,
                                                  JSVM_KeyConversion::JSVM_KEY_KEEP_NUMBERS, &props));
    OH_JSVM_GetAllPropertyNames(env, nullptr, JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
                                JSVM_KeyFilter::JSVM_KEY_WRITABLE, JSVM_KeyConversion::JSVM_KEY_KEEP_NUMBERS, &props);
    addLastStatus(env, "objectIsNull", returnValue);
    OH_JSVM_GetAllPropertyNames(env, returnValue, JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
                                JSVM_KeyFilter::JSVM_KEY_WRITABLE, JSVM_KeyConversion::JSVM_KEY_KEEP_NUMBERS, nullptr);
    addLastStatus(env, "valueIsNull", returnValue);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testProperty(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateObject(env, &result);
    const char testStr[] = "1234567";
    JSVM_Value strAttribute = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &strAttribute);
    OH_JSVM_SetNamedProperty(env, result, "strAttribute", strAttribute);

    JSVM_Value retStrAttribute = nullptr;
    OH_JSVM_GetNamedProperty(env, result, "strAttribute", &retStrAttribute);

    int32_t testNumber = 12345;
    JSVM_Value numberAttribute = nullptr;
    OH_JSVM_CreateInt32(env, testNumber, &numberAttribute);
    OH_JSVM_SetNamedProperty(env, result, "numberAttribute", numberAttribute);
    JSVM_Value propNames = nullptr;
    OH_JSVM_GetPropertyNames(env, result, &propNames);
    
    bool isArray = false;
    OH_JSVM_IsArray(env, propNames, &isArray);
    uint32_t arrayLength = 0;
    OH_JSVM_GetArrayLength(env, propNames, &arrayLength);

    for (uint32_t i = 0; i < arrayLength; i++) {
        bool hasElement = false;
        OH_JSVM_HasElement(env, propNames, i, &hasElement);
        JSVM_Value propName = nullptr;
        OH_JSVM_GetElement(env, propNames, i, &propName);
        bool hasProp = false;
        OH_JSVM_HasProperty(env, result, propName, &hasProp);
        JSVM_Value propValue = nullptr;
        OH_JSVM_GetProperty(env, result, propName, &propValue);
    }
    bool deletion = false;
    OH_JSVM_DeleteElement(env, propNames, 1, &deletion);
    bool hasElement = true;
    OH_JSVM_HasElement(env, propNames, 1, &hasElement);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testDefineProperties(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value object, return_value;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = defineProperties;
    JSVM_PropertyDescriptor desc = {"prop", NULL, &param1, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_ENUMERABLE};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));

    addReturnedStatus(env, "envIsNull", return_value, "Invalid argument", JSVM_Status::JSVM_INVALID_ARG,
                      OH_JSVM_DefineProperties(NULL, object, 1, &desc));
    OH_JSVM_DefineProperties(env, NULL, 1, &desc);
    OH_JSVM_ObjectFreeze(env, object);
    OH_JSVM_ObjectSeal(env, object);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testWrap(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value testClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);

        return thisVar;
    };
    OH_JSVM_DefineClass(env, "TestClass", NAPI_AUTO_LENGTH, &param1, 0, nullptr, &testClass);

    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testClass, 0, nullptr, &instanceValue);

    const char *testStr = "test";
    OH_JSVM_Wrap(
        env, instanceValue, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, nullptr, nullptr);
    const char *tmpTestStr = nullptr;
    OH_JSVM_Unwrap(env, instanceValue, (void **)&tmpTestStr);
    const char *tmpTestStr1 = nullptr;
    OH_JSVM_RemoveWrap(env, instanceValue, (void **)&tmpTestStr1);
   OH_JSVM_Unwrap(env, instanceValue, (void **)&tmpTestStr1);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static JSVM_Deferred deferred = nullptr;
static napi_value testOthers(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    uint32_t result;
    OH_JSVM_GetVersion(env, &result);
    JSVM_VMInfo result1;
    OH_JSVM_GetVMInfo(&result1);
    int64_t adjustedValue;
    OH_JSVM_AdjustExternalMemory(env, 1, &adjustedValue);
    JSVM_Value promise;
    OH_JSVM_CreatePromise(env, &deferred, &promise);
    bool is_promise;
    OH_JSVM_IsPromise(env, promise, &is_promise);
    const char *blob_data = nullptr;
    size_t blob_size = 0;
    JSVM_Env envs[1] = {env};
    OH_JSVM_CreateSnapshot(vm, 1, envs, &blob_data, &blob_size);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}


static napi_value Add(napi_env env1, napi_callback_info info) {
        JSVM_InitOptions init_options;
        memset(&init_options, 0, sizeof(init_options));
        init_options.externalReferences = externals;
        if (aa == 0) {
            OH_JSVM_Init(&init_options);
            aa++;
        }
        JSVM_VM vm;
        JSVM_CreateVMOptions options;
        memset(&options, 0, sizeof(options));

        OH_JSVM_CreateVM(&options, &vm);
        JSVM_VMScope vm_scope;
        OH_JSVM_OpenVMScope(vm, &vm_scope);
        JSVM_Env env;

        JSVM_CallbackStruct param[5];
        for (int i = 0; i < 5; i++) {
            param[i].data = nullptr;
        }
        param[0].callback = assertEqual;
        param[1].callback = assertTrue;
        param[2].callback = assertFalse;
        param[3].callback = consoleinfo;
        param[4].callback = isArray;

        JSVM_PropertyDescriptor descriptor[] = {
            {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
            {"assertTrue", NULL, &param[1], NULL, NULL, NULL, JSVM_DEFAULT},
            {"assertFalse", NULL, &param[2], NULL, NULL, NULL, JSVM_DEFAULT},
            {"consoleinfo", NULL, &param[3], NULL, NULL, NULL, JSVM_DEFAULT},
            {"isArray", NULL, &param[4], NULL, NULL, NULL, JSVM_DEFAULT},
        };

        OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
        JSVM_EnvScope envScope;
        OH_JSVM_OpenEnvScope(env, &envScope);
        JSVM_HandleScope handlescope;
        OH_JSVM_OpenHandleScope(env, &handlescope);
        const char* sourcecodestr = "\
{\
    var length = 5; var arr = new Array(length); arr[4] = 123;\
}\
";
        JSVM_Value sourcecodevalue;
        OH_JSVM_CreateStringUtf8(env, sourcecodestr, strlen(sourcecodestr), &sourcecodevalue);
        JSVM_Script script;
        OH_JSVM_CompileScript(env, sourcecodevalue, nullptr, 0, true, nullptr, &script);
        JSVM_Value result;
        OH_JSVM_RunScript(env, script, &result);
        int32_t value2;
        JSVM_CALL(env, OH_JSVM_GetValueInt32(env, result, &value2));
        OH_JSVM_CloseHandleScope(env, handlescope);
        OH_JSVM_CloseEnvScope(env, envScope);
        OH_JSVM_DestroyEnv(env);
        // shaoshuai
        OH_JSVM_CloseVMScope(vm, vm_scope);
        OH_JSVM_DestroyVM(vm);
        return nullptr;
}
static JSVM_Value test(JSVM_Env env, JSVM_CallbackInfo info) {
    JSVM_VM vm1 = nullptr;
    JSVM_Env env2;
    JSVM_Script script = nullptr;
    OH_JSVM_CreateEnvFromSnapshot(vm1, 0, &env2);
    const uint8_t **data_ptr = nullptr;
    size_t *length_ptr =nullptr;
    OH_JSVM_CreateCodeCache(env, script, data_ptr, length_ptr);
    OH_JSVM_SetInstanceData(
        env2, 0, [](JSVM_Env env, void *data, void *hint) { ++*static_cast<int *>(data); }, nullptr);
    JSVM_Ref *refValues;
    OH_JSVM_GetInstanceData(env, (void **)&refValues);
    JSVM_Value object = nullptr;
    OH_JSVM_SetProperty(env, object, 0, NULL);
    JSVM_Value key = nullptr;
    bool result;
    OH_JSVM_DeleteProperty(env, object, key, &result);
    OH_JSVM_HasOwnProperty(env, object, key, &result);
    OH_JSVM_SetElement(NULL, object, 0, object);
    JSVM_Value ret;
    JSVM_Value funcValue = nullptr;
    JSVM_CallbackStruct param;
    OH_JSVM_CreateFunction(env, "func", NAPI_AUTO_LENGTH, &param, &funcValue);
    OH_JSVM_CallFunction(env, nullptr, funcValue, 0, nullptr, &ret);
    JSVM_Value constructor = nullptr;
    JSVM_CallbackInfo info1 = nullptr;
    OH_JSVM_GetNewTarget(env, info1, &constructor);
    JSVM_Value value = nullptr;
    OH_JSVM_TypeTagObject(env, value,nullptr);
    OH_JSVM_CheckObjectTypeTag(env, object, nullptr, &result);
    JSVM_Finalize finalizeCb = nullptr;
    JSVM_Ref result1;
    OH_JSVM_AddFinalizer(env, object, NULL, finalizeCb, NULL, &result1);
    OH_JSVM_MemoryPressureNotification(env, JSVM_MEMORY_PRESSURE_LEVEL_NONE);
    JSVM_Deferred deferred = nullptr;
    OH_JSVM_ResolveDeferred(env, deferred,value);
    OH_JSVM_RejectDeferred(env, deferred, value);
    JSVM_Value value1;
    OH_JSVM_JsonParse(env, value, &value1);
    OH_JSVM_JsonStringify(env, object, &value1);
    return nullptr;
}
static napi_value Add1(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    memset(&init_options, 0, sizeof(init_options));
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset(&options, 0, sizeof(options));
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = test;
    JSVM_PropertyDescriptor descriptor[] = {
        {"test", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{ 
    napi_property_descriptor properties[] = {
        DECLARE_NAPI_FUNCTION("testEngineAndContext",testEngineAndContext),
        DECLARE_NAPI_FUNCTION("testError",testError),
        DECLARE_NAPI_FUNCTION("testTypeError",testTypeError),
        DECLARE_NAPI_FUNCTION("testRangeError",testRangeError),
        DECLARE_NAPI_FUNCTION("testSyntaxError",testSyntaxError),
        DECLARE_NAPI_FUNCTION("testClearError",testClearError),
        DECLARE_NAPI_FUNCTION("testLifeCycle",testLifeCycle),
        DECLARE_NAPI_FUNCTION("testCreateData1",testCreateData1),
        DECLARE_NAPI_FUNCTION("testCreateData2",testCreateData2),
        DECLARE_NAPI_FUNCTION("testCreateData3",testCreateData3),
        DECLARE_NAPI_FUNCTION("testCreateData4",testCreateData4),
        DECLARE_NAPI_FUNCTION("testCreateData5",testCreateData5),
        DECLARE_NAPI_FUNCTION("testGetData1",testGetData1),
        DECLARE_NAPI_FUNCTION("testGetData2",testGetData2),
        DECLARE_NAPI_FUNCTION("testValueOperation",testValueOperation),
        DECLARE_NAPI_FUNCTION("testValueOperation2",testValueOperation2),
        DECLARE_NAPI_FUNCTION("testGetPropertyNames",testGetPropertyNames),
        DECLARE_NAPI_FUNCTION("testGetAllPropertyNames",testGetAllPropertyNames),
        DECLARE_NAPI_FUNCTION("testProperty",testProperty),
        DECLARE_NAPI_FUNCTION("testDefineProperties",testDefineProperties),
        DECLARE_NAPI_FUNCTION("testWrap",testWrap),
        DECLARE_NAPI_FUNCTION("testOthers",testOthers),
        DECLARE_NAPI_FUNCTION("Add",Add),
        DECLARE_NAPI_FUNCTION("Add1",Add1),
    };
    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(properties) / sizeof(properties[0]), properties));
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napitest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
