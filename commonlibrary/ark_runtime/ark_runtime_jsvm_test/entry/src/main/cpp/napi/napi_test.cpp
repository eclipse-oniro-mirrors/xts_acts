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
#include "test_entry.h"
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
#include "napi_string_test.h"
#include "napi_arraytest.h"
#include "napi_error_test.h"
#include "napi_property_test.h"
#include "napi_strictqeuals_test.h"
#include "napi_executetasks_test.h"
#include "napi_object_test.h"
#include "napi_datatype_test.h"
#include "napi_date_test.h"
#include "napi_json_test.h"
#include "napi_arraybuffer_test.h"
#include "napi_basicdatatypes_test.h"
#include "napi_bigint_test.h"
#include "napi_class_test.h"
#include "napi_functioncall_test.h"
#include "napi_heapstatisticsdebugg_test.h"
#include "napi_lifecycle_test.h"
#include "napi_memorymanagementuse_test.h"
#include "napi_promise_test.h"
#include "napi_version_test.h"
#include <vector>
#define LOG_DEMAIN 0x0202
using namespace std;
static int aa = 0;
static bool g_temp = false;
const int DIFF_VALUE_ZERO = 0;
const int DIFF_VALUE_NOE = 1;
const int DIFF_VALUE_TWO = 2;
const int DIFF_VALUE_THREE = 3;
const int DIFF_VALUE_FOUR = 4;
const int DIFF_VALUE_FIVE = 5;
const int DIFF_VALUE_SIX = 6;
const int DIFF_VALUE_SEVEN = 7;
const int DIFF_VALUE_EIGHT = 8;
const int DIFF_VALUE_NINE = 9;
const int DIFF_VALUE_TEN = 10;
const int DIFF_VALUE_ELEVEN = 11;
const int DIFF_VALUE_TWELVE = 12;
const int DIFF_VALUE_THIRTEEN = 13;
const int DIFF_VALUE_FOURTEEN = 14;
const int DIFF_VALUE_FITEEN = 15;
const int DIFF_VALUE_SIXTEEN = 16;
const int DIFF_VALUE_SEVENTEEN = 17;
const int DIFF_VALUE_EIGHTEEN = 18;
const int DIFF_VALUE_NINETEEN = 19;
const int DIFF_VALUE_TWENTY = 20;
const int DIFF_VALUE_TWENTYONE = 21;
const int SCOPE_FOR_NUMBER = 100000;
const int RUN_JS_CODE_LENGTH = 1000;
const int DIFF_VALUE_INT32 = -20;
const int64_t DIFF_VALUE_INT = 2147483648;
const int64_t DIFF_VALUE_BIGINT = -5555555555555555555;
const uint64_t DIFF_VALUE_BIGUINT = 5555555555555555555;
const int32_t DIFF_VALUE_KEYLEN = 32;
const uint32_t DIFF_VALUE_UINT = 26;
const double DIFF_VALUE_DOUBLE = 1.234;
const double DIFF_VALUE_DATE = 1501924876711;
static char g_dataType[32] = "";
static bool g_threadFlag1 = false;
static bool g_threadFlag2 = false;
const int RUN_TEST_RETAIN_SCRIPT_VALUE = 121;
const int TWO = 2;
const int SIXTEEN = 16;

#define EOK 0
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

static JSVM_PropertyHandlerConfigurationStruct propertyCfg{
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr
};

static napi_value testEngineAndContext(napi_env env1, napi_callback_info info){
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
void CreateReference_test_1(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    const char testStr[] = "foo";
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_2(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    JSVM_Value value = nullptr;
    OH_JSVM_GetUndefined(env, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_3(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    JSVM_Value value = nullptr;
    OH_JSVM_GetNull(env, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_4(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    JSVM_Value value = nullptr;
    bool x = true;
    OH_JSVM_GetBoolean(env, x, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_6(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    JSVM_Value value = NULL;
    OH_JSVM_CreateObject(env, &value);
    const char *testNameStr = "bar";
    JSVM_Value propValue = nullptr;
    JSVM_Value key;
    OH_JSVM_CreateStringUtf8(env, "foo", JSVM_AUTO_LENGTH, &key);
    OH_JSVM_CreateStringUtf8(env, testNameStr, strlen(testNameStr), &propValue);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_7(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 0, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_8(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    size_t arrayLength = 2;
    JSVM_Value value;
    OH_JSVM_CreateArrayWithLength(env, arrayLength, &value);
    for (uint32_t i = 0; i < arrayLength; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, i + 1, &element);
        OH_JSVM_SetElement(env, value, i, element);
    }
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_9(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    const char testStr[] = "foo";
    JSVM_Value oldresult = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &oldresult);
    JSVM_Value value;
    OH_JSVM_CoerceToObject(env, oldresult, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
void CreateReference_test_10(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handleScope1);
    JSVM_Value value;
    OH_JSVM_CreateDouble(env, 0.0/0.0, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value result = nullptr;
    OH_JSVM_GetReferenceValue(env, reference, &result);
    OH_JSVM_DeleteReference(env, reference);
    OH_JSVM_CloseEscapableHandleScope(env, handleScope1);
    OH_JSVM_CloseHandleScope(env, handleScope);
}
static napi_value testLifeCycle2(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    CreateReference_test_1(env);
    CreateReference_test_2(env);
    CreateReference_test_3(env);
    CreateReference_test_4(env);
    CreateReference_test_6(env);
    CreateReference_test_7(env);
    CreateReference_test_8(env);
    CreateReference_test_9(env);
    CreateReference_test_10(env);

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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    JSVM_ASSERT(env, status == JSVM_OK, "success to OH_JSVM_CreateArraybuffer");
    JSVM_ASSERT(env, arrayBuffer != nullptr, "success create_arryBuffer");
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
    OH_JSVM_DetachArraybuffer(env, arrayBuffer);
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    JSVM_ASSERT(env, status == JSVM_OK, "success to OH_JSVM_CreateArraybuffer");
    JSVM_ASSERT(env, arrayBuffer != nullptr, "success create_arryBuffer");
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
    OH_JSVM_DetachArraybuffer(env, arrayBuffer);
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
void equals_test_1(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    OH_JSVM_GetUndefined(env, &lhs);
    JSVM_Value rhs = nullptr;
    OH_JSVM_GetUndefined(env, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_2(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    OH_JSVM_GetNull(env, &lhs);
    JSVM_Value rhs = nullptr;
    OH_JSVM_GetNull(env, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_3(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    bool x = true;
    OH_JSVM_GetBoolean(env, x, &lhs);
    JSVM_Value rhs = nullptr;
    bool y = true;
    OH_JSVM_GetBoolean(env, y, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_4(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    bool x = false;
    OH_JSVM_GetBoolean(env, x, &lhs);
    JSVM_Value rhs = nullptr;
    bool y = false;
    OH_JSVM_GetBoolean(env, y, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_5(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr1[] = "foo";
    JSVM_Value lhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr1, strlen(testStr1), &lhs);
    const char testStr2[] = "foo";
    JSVM_Value rhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr2, strlen(testStr2), &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_6(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value result = NULL;
    OH_JSVM_CreateObject(env, &result);
    const char *testNameStr = "bar";
    JSVM_Value propValue = nullptr;
    JSVM_Value key;
    OH_JSVM_CreateStringUtf8(env, "foo", JSVM_AUTO_LENGTH, &key);
    OH_JSVM_CreateStringUtf8(env, testNameStr, strlen(testNameStr), &propValue);
    OH_JSVM_SetProperty(env, result, key, propValue);
    bool isEquals = false;
    OH_JSVM_Equals(env, result, result, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_7(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs;
    OH_JSVM_CreateInt32(env, 0, &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateInt32(env, 0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_8(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs;
    OH_JSVM_CreateInt32(env, +0, &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateInt32(env, -0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_9(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs;
    OH_JSVM_CreateInt32(env, 0, &lhs);
    JSVM_Value rhs = nullptr;
    bool y = false;
    OH_JSVM_GetBoolean(env, y, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_10(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr[] = "";
    JSVM_Value lhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &lhs);
    JSVM_Value rhs = nullptr;
    bool y = false;
    OH_JSVM_GetBoolean(env, y, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_11(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr[] = "";
    JSVM_Value lhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateInt32(env, 0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_12(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr[] = "0";
    JSVM_Value lhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateInt32(env, 0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_13(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr[] = "1";
    JSVM_Value lhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateInt32(env, 1, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_14(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    size_t arrayLength = 2;
    JSVM_Value lhs;
    OH_JSVM_CreateArrayWithLength(env, arrayLength, &lhs);
    for (uint32_t i = 0; i < arrayLength; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, i + 1, &element);
        OH_JSVM_SetElement(env, lhs, i, element);
    }
    const char testStr[] = "1,2";
    JSVM_Value rhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_15(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr1[] = "foo";
    JSVM_Value oldresult = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr1, strlen(testStr1), &oldresult);
    JSVM_Value lhs;
    OH_JSVM_CoerceToObject(env, oldresult, &lhs);
    const char testStr2[] = "foo";
    JSVM_Value rhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr2, strlen(testStr2), &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_16(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    OH_JSVM_GetNull(env, &lhs);
    JSVM_Value rhs = nullptr;
    OH_JSVM_GetUndefined(env, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_17(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    OH_JSVM_GetNull(env, &lhs);
    JSVM_Value rhs = nullptr;
    bool y = false;
    OH_JSVM_GetBoolean(env, y, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_18(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = nullptr;
    OH_JSVM_GetUndefined(env, &lhs);
    JSVM_Value rhs = nullptr;
    bool y = false;
    OH_JSVM_GetBoolean(env, y, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_19(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs = NULL;
    OH_JSVM_CreateObject(env, &lhs);
    const char *testNameStr = "bar";
    JSVM_Value propValue1 = nullptr;
    JSVM_Value key1;
    OH_JSVM_CreateStringUtf8(env, "foo", JSVM_AUTO_LENGTH, &key1);
    OH_JSVM_CreateStringUtf8(env, testNameStr, strlen(testNameStr), &propValue1);
    OH_JSVM_SetProperty(env, lhs, key1, propValue1);
    JSVM_Value rhs = NULL;
    OH_JSVM_CreateObject(env, &rhs);
    JSVM_Value propValue2 = nullptr;
    JSVM_Value key2;
    OH_JSVM_CreateStringUtf8(env, "foo", JSVM_AUTO_LENGTH, &key2);
    OH_JSVM_CreateStringUtf8(env, testNameStr, strlen(testNameStr), &propValue2);
    OH_JSVM_SetProperty(env, rhs, key2, propValue2);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_20(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr1[] = "foo";
    JSVM_Value oldresult1 = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr1, strlen(testStr1), &oldresult1);
    JSVM_Value lhs;
    OH_JSVM_CoerceToObject(env, oldresult1, &lhs);
    const char testStr2[] = "foo";
    JSVM_Value oldresult2 = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr2, strlen(testStr2), &oldresult2);
    JSVM_Value rhs;
    OH_JSVM_CoerceToObject(env, oldresult2, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_21(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs;
    OH_JSVM_CreateInt32(env, 0, &lhs);
    JSVM_Value rhs = nullptr;
    OH_JSVM_GetNull(env, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_22(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs;
    OH_JSVM_CreateInt32(env, 0, &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateDouble(env, 0.0/0.0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_23(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char testStr1[] = "foo";
    JSVM_Value lhs = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr1, strlen(testStr1), &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateDouble(env, 0.0/0.0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
void equals_test_24(JSVM_Env env)
{
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value lhs;
    OH_JSVM_CreateDouble(env, 0.0/0.0, &lhs);
    JSVM_Value rhs;
    OH_JSVM_CreateDouble(env, 0.0/0.0, &rhs);
    bool isEquals = false;
    OH_JSVM_Equals(env, lhs, rhs, &isEquals);
    OH_JSVM_CloseHandleScope(env, handlescope);
}
static napi_value testValueOperation3(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    equals_test_1(env);
    equals_test_2(env);
    equals_test_3(env);
    equals_test_4(env);
    equals_test_5(env);
    equals_test_6(env);
    equals_test_7(env);
    equals_test_8(env);
    equals_test_9(env);
    equals_test_10(env);
    equals_test_11(env);
    equals_test_12(env);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
static napi_value testValueOperation4(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    equals_test_13(env);
    equals_test_14(env);
    equals_test_15(env);
    equals_test_16(env);
    equals_test_17(env);
    equals_test_18(env);
    equals_test_19(env);
    equals_test_20(env);
    equals_test_21(env);
    equals_test_22(env);
    equals_test_23(env);
    equals_test_24(env);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
void type_test(JSVM_Env env, JSVM_Value value)
{
    bool isValue = false;
    OH_JSVM_IsUndefined(env, value, &isValue);
    OH_JSVM_IsNull(env, value, &isValue);
    OH_JSVM_IsNullOrUndefined(env, value, &isValue);
    OH_JSVM_IsBoolean(env, value, &isValue);
    OH_JSVM_IsNumber(env, value, &isValue);
    OH_JSVM_IsString(env, value, &isValue);
    OH_JSVM_IsSymbol(env, value, &isValue);
    OH_JSVM_IsFunction(env, value, &isValue);
    OH_JSVM_IsObject(env, value, &isValue);
    OH_JSVM_IsBigInt(env, value, &isValue);
    OH_JSVM_IsConstructor(env, value, &isValue);
    OH_JSVM_IsMap(env, value, &isValue);
}
void type_test_Undefined(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_GetUndefined(env, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Null(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_GetNull(env, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Boolean(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    bool x = true;
    OH_JSVM_GetBoolean(env, x, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Int32(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 1, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_String(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    const char testStr[] = "foo";
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Symbol(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    JSVM_Value description;
    const char testStr[] = "1234567";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &description);
    OH_JSVM_CreateSymbol(env, description, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Function(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    JSVM_CallbackStruct param;
    OH_JSVM_CreateFunction(env, "func", JSVM_AUTO_LENGTH, &param, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Object(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_CreateObject(env, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Bigint(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    int64_t testValue = INT64_MAX;
    OH_JSVM_CreateBigintInt64(env, testValue, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_Map(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_CreateMap(env, &value);
    type_test(env, value);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
static napi_value testValueOperation5(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    type_test_Undefined(env);
    type_test_Null(env);
    type_test_Boolean(env);
    type_test_Int32(env);
    type_test_String(env);
    type_test_Symbol(env);
    type_test_Function(env);
    type_test_Object(env);
    type_test_Bigint(env);
    type_test_Map(env);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
void type_test_RegExp_UNICODE(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_GLOBAL(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_GLOBAL, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_IGNORE_CASE(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_IGNORE_CASE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_MULTILINE(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_MULTILINE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_STICKY(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_STICKY, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_DOT_ALL(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_DOT_ALL, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_LINEAR(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_LINEAR, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_HAS_INDICES(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_HAS_INDICES, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_UNICODE_SETS(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE_SETS, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
static napi_value testValueOperation6(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    type_test_RegExp_UNICODE(env);
    type_test_RegExp_GLOBAL(env);
    type_test_RegExp_IGNORE_CASE(env);
    type_test_RegExp_MULTILINE(env);
    type_test_RegExp_STICKY(env);
    type_test_RegExp_DOT_ALL(env);
    type_test_RegExp_LINEAR(env);
    type_test_RegExp_HAS_INDICES(env);
    type_test_RegExp_UNICODE_SETS(env);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}
void type_test_RegExp_Undefined(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_GetUndefined(env, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Null(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_GetNull(env, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Boolean(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    bool x = true;
    OH_JSVM_GetBoolean(env, x, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Int32(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 1, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Symbol(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    JSVM_Value description;
    const char testStr[] = "1234567";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &description);
    OH_JSVM_CreateSymbol(env, description, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Function(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    JSVM_CallbackStruct param;
    OH_JSVM_CreateFunction(env, "func", JSVM_AUTO_LENGTH, &param, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Object(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_CreateObject(env, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_BigintInt64(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    int64_t testValue = INT64_MAX;
    OH_JSVM_CreateBigintInt64(env, testValue, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
void type_test_RegExp_Map(JSVM_Env env)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value value = nullptr;
    OH_JSVM_CreateMap(env, &value);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_UNICODE, &result);
    type_test(env, result);

    OH_JSVM_CloseHandleScope(env, handleScope);
}
static napi_value testValueOperation7(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    type_test_RegExp_Undefined(env);
    type_test_RegExp_Null(env);
    type_test_RegExp_Boolean(env);
    type_test_RegExp_Int32(env);
    type_test_RegExp_Symbol(env);
    type_test_RegExp_Function(env);
    type_test_RegExp_Object(env);
    type_test_RegExp_BigintInt64(env);
    type_test_RegExp_Map(env);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

void prototypeof_test_1(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value obj;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value result;
    OH_JSVM_ObjectGetPrototypeOf(env, obj, &result);
    NAPI_ASSERT_RETURN_VOID(env1, result != nullptr, "check OH_JSVM_ObjectGetPrototype 1");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void prototypeof_test_2(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value obj;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value mySet;
    OH_JSVM_CreateSet(env, &mySet);
    JSVM_Status status = OH_JSVM_ObjectSetPrototypeOf(env, obj, mySet);
    NAPI_ASSERT_RETURN_VOID(env1, status == JSVM_OK, "OH_JSVM_ObjectSetPrototypeOf check status");
    JSVM_Value proto;
    OH_JSVM_ObjectGetPrototypeOf(env, obj, &proto);
    bool result = false;
    OH_JSVM_StrictEquals(env, proto, mySet, &result);
    NAPI_ASSERT_RETURN_VOID(env1, result, "check OH_JSVM_ObjectGetPrototype 2");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

void prototypeof_test_3(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value obj;
    OH_JSVM_GetUndefined(env, &obj);
    JSVM_Value proto;
    JSVM_Status status = OH_JSVM_ObjectGetPrototypeOf(env, obj, &proto);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectGetPrototype 3");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

void prototypeof_test_4(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value obj;
    OH_JSVM_GetUndefined(env, &obj);
    JSVM_Value proto = nullptr;
    JSVM_Status status = OH_JSVM_ObjectSetPrototypeOf(env, obj, proto);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectSetPrototype obj not an object");
    status = OH_JSVM_ObjectSetPrototypeOf(env, nullptr, proto);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectSetPrototype obj is null");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

void prototypeof_test_5(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value obj;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Status status = OH_JSVM_ObjectSetPrototypeOf(env, obj, nullptr);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectSetPrototype prototype is null");
    JSVM_Value proto;
    OH_JSVM_GetUndefined(env, &proto);
    status = OH_JSVM_ObjectSetPrototypeOf(env, obj, proto);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectSetPrototype prototype is not an object 1");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

void prototypeof_test_6(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value obj;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Status status = OH_JSVM_ObjectSetPrototypeOf(nullptr, obj, nullptr);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectSetPrototype prototype is null");
    JSVM_Value proto;
    OH_JSVM_GetUndefined(env, &proto);
    status = OH_JSVM_ObjectSetPrototypeOf(nullptr, obj, proto);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "check OH_JSVM_ObjectSetPrototype prototype is not an object 2");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

void set_test_1(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Status status = OH_JSVM_CreateSet(env, nullptr);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "OH_JSVM_CreateSet check status 1");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void set_test_2(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value mySet;
    JSVM_Status status = OH_JSVM_CreateSet(env, &mySet);
    NAPI_ASSERT_RETURN_VOID(env1, status == JSVM_OK, "OH_JSVM_CreateSet check status 2");
    bool isSet = false;
    OH_JSVM_IsSet(env, mySet, &isSet);
    NAPI_ASSERT_RETURN_VOID(env1, mySet != nullptr, "OH_JSVM_CreateSet check status 3");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

void set_test_3(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value mySet = nullptr;
    bool isSet = false;
    OH_JSVM_IsSet(env, mySet, &isSet);
    NAPI_ASSERT_RETURN_VOID(env1, !isSet, "check OH_JSVM_IsSet when not a set");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void set_test_4(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Status status = OH_JSVM_CreateSet(nullptr, nullptr);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "OH_JSVM_CreateSet check status 4");
    bool isSet = false;
    JSVM_Status status2 = OH_JSVM_IsSet(nullptr, nullptr, &isSet);
    NAPI_ASSERT_RETURN_VOID(env1, status2 != JSVM_OK, "OH_JSVM_IsSet check status");
    OH_JSVM_CloseHandleScope(env, handleScope);
}

static napi_value testValueOperation8(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    prototypeof_test_1(env, env1);
    prototypeof_test_2(env, env1);
    prototypeof_test_3(env, env1);
    prototypeof_test_4(env, env1);
    prototypeof_test_5(env, env1);
    prototypeof_test_6(env, env1);

    set_test_1(env, env1);
    set_test_2(env, env1);
    set_test_3(env, env1);
    set_test_4(env, env1);

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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
        if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
            printf("memset_s failed");
            return nullptr;
        }
        init_options.externalReferences = externals;
        if (aa == 0) {
            OH_JSVM_Init(&init_options);
            aa++;
        }
        JSVM_VM vm;
        JSVM_CreateVMOptions options;
        if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
            printf("memset_s failed");
            return nullptr;
        }
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
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
static bool output_stream(const char *data, int size, void *stream_data) {
    return true;
}
static JSVM_Value theSecondOperations(JSVM_Env env, JSVM_CallbackInfo info) {
    JSVM_VM vm;
    OH_JSVM_CreateVM(nullptr, &vm);
    void *data = nullptr;
    JSVM_HeapStatistics stats;
    OH_JSVM_GetHeapStatistics(vm, &stats);
    OH_JSVM_TakeHeapSnapshot(vm,output_stream,data);
    JSVM_CpuProfiler cpu_profiler;
    OH_JSVM_StartCpuProfiler(vm, &cpu_profiler);
    OH_JSVM_StopCpuProfiler( vm,cpu_profiler,output_stream,data);
    return nullptr;
}
static napi_value testSecondOperations(napi_env env1, napi_callback_info info) {
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = theSecondOperations;
    JSVM_PropertyDescriptor descriptor[] = {
        {"theSecondOperations", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    uint16_t num = 9229;
    OH_JSVM_OpenInspector(env, "localhost", num);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseInspector(env);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

// ========= arguments check =========
static JSVM_Value checkArgs(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    auto func = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.callback = func;
    param.data = nullptr;
    JSVM_Value testWrapClass = nullptr;

    // case 1. If env is null ptr, return JSVM_INVALID_ARG.
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(nullptr, "Test1", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &param, &testWrapClass);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr env");
    }

    // case 1. If utf8name is nullptr, return JSVM_INVALID_ARG.
    res = OH_JSVM_DefineClassWithPropertyHandler(env, nullptr, NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                 &propertyCfg, &param, &testWrapClass);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr utf8name");
    }

    // case 3. if constructor is nullptr, return JSVM_INVALID_ARG.
    res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test1", NAPI_AUTO_LENGTH, nullptr, 0, nullptr, &propertyCfg,
                                                 &param, &testWrapClass);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr constructor");
    }

    // case 4. If the callback of the constructor is nullptr, return JSVM_INVALID_ARG.
    param.callback = nullptr;
    res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test1", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                 &propertyCfg, &param, &testWrapClass);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr constructor callback");
    }
    param.callback = func;

    // case 5. If propertyCount is greater than 0, properties are nullptr
    res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test1", NAPI_AUTO_LENGTH, &param, 1, nullptr, &propertyCfg,
                                                 &param, &testWrapClass);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr properties");
    }

    // case 6. If propertyHandlerCfg is nullptr, return JSVM_INVALID_ARG.
    res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test1", NAPI_AUTO_LENGTH, &param, 0, nullptr, nullptr,
                                                 &param, &testWrapClass);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr propertyHandlerCfg");
    }

    // case 7. If result is nullptr, return JSVM_INVALID_ARG.
    res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test1", NAPI_AUTO_LENGTH, &param, 0, nullptr, &propertyCfg,
                                                 &param, nullptr);
    if (res == JSVM_INVALID_ARG) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler failed due to nullptr result");
    }

    // case 8. Valid input parameter, return JSVM_OK.
    res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test1", NAPI_AUTO_LENGTH, &param, 0, nullptr, &propertyCfg,
                                                 nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        JSVM_ASSERT(env, res == JSVM_INVALID_ARG, "OH_JSVM_DefineClassWithPropertyHandler successfully");
    }
    return nullptr;
}

static napi_value testCheckArgs(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = checkArgs;

    JSVM_PropertyDescriptor descriptor[] = {
        {"checkArgs", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============ empty propertyHandlerCfg ============================
// case 9. setProperty
static JSVM_Value setProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    JSVM_Value testWrapClass = nullptr;

    OH_JSVM_DefineClassWithPropertyHandler(env, "Test2", NAPI_AUTO_LENGTH, &param, 0, nullptr, &propertyCfg, nullptr,
                                           &testWrapClass);
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world";
    JSVM_Value setvalueName = nullptr;
    JSVM_Value result = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    JSVM_Status res = OH_JSVM_SetNamedProperty(env, instanceValue, "mySettedProperty", setvalueName);
    if (res == JSVM_OK) {
        char resultStr[] = "set property successfully";
        OH_JSVM_CreateStringUtf8(env, resultStr, strlen(resultStr), &result);
    }
    return result;
}

static napi_value testSetProperty(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = setProperty;

    JSVM_PropertyDescriptor descriptor[] = {
        {"setProperty", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// case 10. getProperty
static JSVM_Value getProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    OH_JSVM_DefineClassWithPropertyHandler(env, "Test3", NAPI_AUTO_LENGTH, &param, 0, nullptr, &propertyCfg, nullptr,
                                           &testWrapClass);
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "mySettedProperty", setvalueName);

    JSVM_Value valueName = nullptr;
    JSVM_Status res = OH_JSVM_GetNamedProperty(env, instanceValue, "mySettedProperty", &valueName);
    if (res == JSVM_OK) {
        printf("JSVM getProperty successfully");
    }
    return valueName;
}

static napi_value testGetProperty(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = getProperty;
    JSVM_PropertyDescriptor descriptor[] = {
        {"getProperty", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// case 11 and case 12
static JSVM_Value CallObjectAsFunction(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;

    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        void *innerData;
        size_t argc = 1;
        JSVM_Value args[1];
        OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, &innerData);
        uint32_t ret = 0;
        OH_JSVM_GetValueUint32(env, args[0], &ret);
        const char testStr[] = "hello world 111111";
        JSVM_Value setvalueName = nullptr;
        OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
        return setvalueName;
    };
    char data[100] = "hello world";
    callbackStruct.data = data;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test12", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance", instanceValue);
    return nullptr;
}

static napi_value testCallFunction(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = CallObjectAsFunction;

    JSVM_PropertyDescriptor descriptor[] = {
        {"CallObjectAsFunction", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============================= test nullptr return for namedProperty handle ====================================
// cases 13-16, return nullptr, only listen without interception, successfully setProperty.
static JSVM_Value SetNamedPropertyCbInfo1(JSVM_Env env, JSVM_Value name, JSVM_Value property, JSVM_Value thisArg,
    JSVM_Value data)
{
    char strValue[100];
    size_t size;
    size_t bufferSize = 300;
    OH_JSVM_GetValueStringUtf8(env, name, strValue, bufferSize, &size);
    char str[100];
    size_t size1;
    OH_JSVM_GetValueStringUtf8(env, property, str, strlen(str), &size1);
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value NameHandler(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericNamedPropertySetterCallback = SetNamedPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test4", NAPI_AUTO_LENGTH, &param, 0, nullptr, &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty1", setvalueName);
    JSVM_Value valueName = nullptr;
    OH_JSVM_GetNamedProperty(env, instanceValue, "nameProperty1", &valueName);
    propertyCfg.genericNamedPropertySetterCallback = nullptr;
    return valueName;
}

static napi_value testSetNamedProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler;

    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============================= test non-nullptr return for namedProperty handle ================================
// case 17 Return non null ptr, listen and intercept, failed to setProperty.
static JSVM_Value SetNamedPropertyCbInfo2(JSVM_Env env, JSVM_Value name, JSVM_Value property, JSVM_Value thisArg,
    JSVM_Value data)
{
    return property;
}

static JSVM_Value NameHandler1(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericNamedPropertySetterCallback = SetNamedPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test5", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world2";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty2", setvalueName);

    const char testStr2[] = "nameProperty2";
    JSVM_Value setvalueName2 = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr2, strlen(testStr2), &setvalueName2);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, setvalueName2, &isExisted);
    propertyCfg.genericNamedPropertySetterCallback = nullptr;
    return nullptr;
}

static napi_value testSetNamedProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler1;

    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler1", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============================= test nullptr return for indexedProperty handle ===================================
// cases 18-21 return nullptr, only listen without interception, successfully setProperty.
static JSVM_Value SetIndexPropertyCbInfo1(JSVM_Env env, JSVM_Value index, JSVM_Value property, JSVM_Value thisArg,
    JSVM_Value data)
{
    uint32_t value;
    OH_JSVM_GetValueUint32(env, index, &value);
    char str[100];
    size_t size;
    OH_JSVM_GetValueStringUtf8(env, property, str, strlen(str), &size);
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value IndexHandler1(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;

    propertyCfg.genericIndexedPropertySetterCallback = SetIndexPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test6", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    propertyCfg.genericIndexedPropertySetterCallback = nullptr;
    return setvalueName;
}

static napi_value testSetIndexProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler1;

    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler1", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============================= test non-nullptr return for indexedProperty handle ==================================
// //case 22 returns non nullptr, only listens and intercepts, property setting failed.
static JSVM_Value SetIndexPropertyCbInfo2(JSVM_Env env, JSVM_Value index, JSVM_Value property, JSVM_Value thisArg,
    JSVM_Value data)
{
    return property;
}

static JSVM_Value IndexHandler2(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertySetterCallback = SetIndexPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test7", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, jsIndex, &isExisted);
    propertyCfg.genericIndexedPropertySetterCallback = nullptr;
    return nullptr;
}

static napi_value testSetIndexProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler2;

    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler2", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============================= test nullptr return for namedProperty handle ===============
// case 23~25
static JSVM_Value GetNamedPropertyCbInfo1(JSVM_Env env, JSVM_Value name, JSVM_Value thisArg, JSVM_Value data)
{
    char strValue[100];
    size_t size;
    size_t bufferSize = 300;
    OH_JSVM_GetValueStringUtf8(env, name, strValue, bufferSize, &size);
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value NameHandler2(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericNamedPropertyGetterCallback = GetNamedPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test8", NAPI_AUTO_LENGTH, &param, 0,
                                                             nullptr, &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty1", setvalueName);
    JSVM_Value valueName = nullptr;
    OH_JSVM_GetNamedProperty(env, instanceValue, "nameProperty1", &valueName);
    propertyCfg.genericNamedPropertyGetterCallback = nullptr;
    return valueName;
}

static napi_value testGetNamedProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler2;

    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler2", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ========================= test non-nullptr return for namedProperty handle ============
// case 26
static JSVM_Value GetNamedPropertyCbInfo2(JSVM_Env env, JSVM_Value name, JSVM_Value thisArg, JSVM_Value data)
{
    JSVM_Value newResult = nullptr;
    if (g_temp) {
        char newStr[] = "hi from name handler";
        OH_JSVM_CreateStringUtf8(env, newStr, strlen(newStr), &newResult);
    }
    return newResult;
}

static JSVM_Value NameHandler3(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;

    propertyCfg.genericNamedPropertyGetterCallback = GetNamedPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test9", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty2", setvalueName);

    g_temp = true;
    JSVM_Value valueName = nullptr;
    OH_JSVM_GetNamedProperty(env, instanceValue, "nameProperty2", &valueName);
    char str[100];
    size_t size;
    OH_JSVM_GetValueStringUtf8(env, valueName, str, strlen(str), &size);
    g_temp = false;
    OH_JSVM_GetNamedProperty(env, instanceValue, "nameProperty2", &valueName);
    char str2[100];
    size_t size2;
    OH_JSVM_GetValueStringUtf8(env, valueName, str2, strlen(str2), &size2);
    propertyCfg.genericNamedPropertyGetterCallback = nullptr;
    return valueName;
}

static napi_value testGetNamedProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler3;

    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler3", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ========================== test nullptr return for indexedProperty handle ================
// case 27~29
static JSVM_Value GetIndexPropertyCbInfo1(JSVM_Env env, JSVM_Value index, JSVM_Value thisArg, JSVM_Value data)
{
    uint32_t value;
    OH_JSVM_GetValueUint32(env, index, &value);
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance2", thisArg);
    return nullptr;
}

static JSVM_Value IndexHandler3(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyGetterCallback = GetIndexPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test10", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    JSVM_Value valueName = nullptr;
    OH_JSVM_GetProperty(env, instanceValue, jsIndex, &valueName);
    propertyCfg.genericIndexedPropertyGetterCallback = nullptr;
    return valueName;
}

static napi_value testGetIndexProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler3;

    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler3", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// =====================test non-nullptr return for indexedProperty handle =========
// case 30
static JSVM_Value GetIndexPropertyCbInfo2(JSVM_Env env, JSVM_Value index, JSVM_Value thisArg, JSVM_Value data)
{
    JSVM_Value newResult = nullptr;
    if (g_temp) {
        char newStr[] = "hi from index handler";
        OH_JSVM_CreateStringUtf8(env, newStr, strlen(newStr), &newResult);
    }
    return newResult;
}

static JSVM_Value IndexHandler4(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyGetterCallback = GetIndexPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test11", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    g_temp = true;
    JSVM_Value valueName = nullptr;
    OH_JSVM_GetProperty(env, instanceValue, jsIndex, &valueName);
    char str[100];
    size_t size;
    OH_JSVM_GetValueStringUtf8(env, valueName, str, strlen(str), &size);
    g_temp = false;
    OH_JSVM_GetProperty(env, instanceValue, jsIndex, &valueName);
    char str2[100];
    size_t size2;
    OH_JSVM_GetValueStringUtf8(env, valueName, str2, strlen(str2), &size2);
    propertyCfg.genericIndexedPropertyGetterCallback = nullptr;
    return valueName;
}

static napi_value testGetIndexProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler4;

    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler4", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ======================== test nullptr return for namedProperty handle ==================
//  cases 31-33 when returning nullptr, delete listening trigger, only listen without intercepting.
//  The attribute deletion is successful, and the OH_JSVM_DeleteProperty output parameter is true.
static JSVM_Value DeleterNamedPropertyCbInfo1(JSVM_Env env, JSVM_Value name, JSVM_Value thisArg, JSVM_Value data)
{
    char strValue[100];
    size_t size;
    size_t bufferSize = 300;
    OH_JSVM_GetValueStringUtf8(env, name, strValue, bufferSize, &size);
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value NameHandler4(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericNamedPropertyDeleterCallback = DeleterNamedPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test13", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);
    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty1", setvalueName);
    bool result = false;
    JSVM_Value propertyName = nullptr;
    char propertyChar[] = "nameProperty1";
    OH_JSVM_CreateStringUtf8(env, propertyChar, strlen(propertyChar), &propertyName);
    OH_JSVM_DeleteProperty(env, instanceValue, propertyName, &result);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    propertyCfg.genericNamedPropertyDeleterCallback = nullptr;
    return nullptr;
}

static napi_value testDeleterNamedProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;

    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler4;
    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler4", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ===================== test return true for namedProperty handle =======================
// case 34 when returning true, the deletion of the listening trigger is triggered, and the interception
// is successful. The deletion of the attribute fails, and the output parameter of OH_JSVM_DeleteProperty is true.
static JSVM_Value DeleterNamedPropertyCbInfo2(JSVM_Env env, JSVM_Value name, JSVM_Value thisArg, JSVM_Value data)
{
    char strValue[100];
    size_t size;
    size_t bufferSize = 300;
    OH_JSVM_GetValueStringUtf8(env, name, strValue, bufferSize, &size);
    JSVM_Value newResult = nullptr;
    bool returnValue = true;
    OH_JSVM_GetBoolean(env, returnValue, &newResult);
    return newResult;
}

static JSVM_Value NameHandler5(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;

    propertyCfg.genericIndexedPropertyEnumeratorCallback = nullptr;
    propertyCfg.genericIndexedPropertyDeleterCallback = nullptr;
    propertyCfg.genericIndexedPropertySetterCallback = nullptr;
    propertyCfg.genericIndexedPropertyGetterCallback = nullptr;
    propertyCfg.genericNamedPropertyEnumeratorCallback = nullptr;
    propertyCfg.genericNamedPropertyDeleterCallback = DeleterNamedPropertyCbInfo2;
    propertyCfg.genericNamedPropertySetterCallback = nullptr;
    propertyCfg.genericNamedPropertyGetterCallback = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test14", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world2";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty2", setvalueName);

    bool result = false;
    JSVM_Value propertyName = nullptr;
    char propertyChar[] = "nameProperty2";
    OH_JSVM_CreateStringUtf8(env, propertyChar, strlen(propertyChar), &propertyName);
    OH_JSVM_DeleteProperty(env, instanceValue, propertyName, &result);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    return nullptr;
}

static napi_value testDeleterNamedProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler5;
    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler5", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ======================= test return false for namedProperty handle ========================
// case 35 when false is returned, the deletion of the listening trigger is triggered, and the
// interception is successful. The attribute deletion fails, and the OH_JSVM_DeleteProperty output parameter is false.
static JSVM_Value DeleterNamedPropertyCbInfo3(JSVM_Env env, JSVM_Value name, JSVM_Value thisArg, JSVM_Value data)
{
    char strValue[100];
    size_t size;
    size_t bufferSize = 300;
    OH_JSVM_GetValueStringUtf8(env, name, strValue, bufferSize, &size);
    JSVM_Value newResult = nullptr;
    bool returnValue = false;
    OH_JSVM_GetBoolean(env, returnValue, &newResult);
    return newResult;
}

static JSVM_Value NameHandler6(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;

    propertyCfg.genericIndexedPropertyEnumeratorCallback = nullptr;
    propertyCfg.genericIndexedPropertyDeleterCallback = nullptr;
    propertyCfg.genericIndexedPropertySetterCallback = nullptr;
    propertyCfg.genericIndexedPropertyGetterCallback = nullptr;
    propertyCfg.genericNamedPropertyEnumeratorCallback = nullptr;
    propertyCfg.genericNamedPropertyDeleterCallback = DeleterNamedPropertyCbInfo3;
    propertyCfg.genericNamedPropertySetterCallback = nullptr;
    propertyCfg.genericNamedPropertyGetterCallback = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test15", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);
    const char testStr[] = "hello world3";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty3", setvalueName);
    bool result = false;
    JSVM_Value propertyName = nullptr;
    char propertyChar[] = "nameProperty3";
    OH_JSVM_CreateStringUtf8(env, propertyChar, strlen(propertyChar), &propertyName);
    OH_JSVM_DeleteProperty(env, instanceValue, propertyName, &result);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    return nullptr;
}

static napi_value testDeleterNamedProperty03(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler6;
    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler6", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ==================test nullptr return for indexedProperty handle =====================
// cases 36-38, when returning nullptr, delete listening trigger, only listen without intercepting.
// The attribute deletion is successful, and the OH_JSVM_DeleteProperty output parameter is true.
static JSVM_Value DeleterIndexedPropertyCbInfo1(JSVM_Env env, JSVM_Value index, JSVM_Value thisArg, JSVM_Value data)
{
    uint32_t value;
    OH_JSVM_GetValueUint32(env, index, &value);
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value IndexHandler5(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyDeleterCallback = DeleterIndexedPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test16", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    bool result = false;
    OH_JSVM_DeleteProperty(env, instanceValue, jsIndex, &result);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, jsIndex, &isExisted);
    propertyCfg.genericIndexedPropertyDeleterCallback = nullptr;
    return nullptr;
}

static napi_value testDeleterIndexedProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler5;
    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler5", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// =================== test return true for indexedProperty handle ========================
// case 39 When returning true, the deletion of the listening trigger is triggered, and the interception
// is successful. The attribute deletion fails, and the OH_JSVM_DeleteProperty output parameter is true.
static JSVM_Value DeleterIndexedPropertyCbInfo2(JSVM_Env env, JSVM_Value index, JSVM_Value thisArg, JSVM_Value data)
{
    uint32_t value;
    OH_JSVM_GetValueUint32(env, index, &value);
    JSVM_Value newResult = nullptr;
    bool returnValue = true;
    OH_JSVM_GetBoolean(env, returnValue, &newResult);
    return newResult;
}

static JSVM_Value IndexHandler6(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyDeleterCallback = DeleterIndexedPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test17", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    const char testStr[] = "hello world2";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    bool result = false;
    OH_JSVM_DeleteProperty(env, instanceValue, jsIndex, &result);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, jsIndex, &isExisted);
    propertyCfg.genericIndexedPropertyDeleterCallback = nullptr;
    return nullptr;
}

static napi_value testDeleterIndexedProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler6;
    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler6", NULL, &param[1], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ============================= test return false for indexedProperty handle =======================
// case 40 When returning false, the deletion of the listening trigger is triggered, and the interception
// is successful.The attribute deletion fails, and the OH_JSVM_DeleteProperty output parameter is false.
static JSVM_Value DeleterIndexedPropertyCbInfo3(JSVM_Env env, JSVM_Value index, JSVM_Value thisArg, JSVM_Value data)
{
    uint32_t value;
    OH_JSVM_GetValueUint32(env, index, &value);
    JSVM_Value newResult = nullptr;
    bool returnValue = false;
    OH_JSVM_GetBoolean(env, returnValue, &newResult);
    return newResult;
}

static JSVM_Value IndexHandler7(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyDeleterCallback = DeleterIndexedPropertyCbInfo3;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test18", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    const char testStr[] = "hello world2";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    bool result = false;
    OH_JSVM_DeleteProperty(env, instanceValue, jsIndex, &result);
    bool isExisted = false;
    OH_JSVM_HasProperty(env, instanceValue, jsIndex, &isExisted);
    propertyCfg.genericIndexedPropertyDeleterCallback = nullptr;
    return nullptr;
}

static napi_value testDeleterIndexedProperty03(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler7;
    JSVM_PropertyDescriptor descriptor[] = {
        {"IndexHandler7", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// =================test nullptr return for namedProperty handle =======
// case 41 and case 42
// When returning nullptr, the enumerator listens and triggers, only listens but not
// intercepts.OH_JSVM_GetAllPropertyNames can retrieve the property names that have already been set.
static JSVM_Value EnumeratorNamedPropertyCbInfo1(JSVM_Env env, JSVM_Value thisArg, JSVM_Value data)
{
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value NameHandler7(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericNamedPropertyEnumeratorCallback = EnumeratorNamedPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test19", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }

    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty1", setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "nameProperty2", setvalueName);

    JSVM_Value allPropertyNames = nullptr;
    OH_JSVM_GetAllPropertyNames(
        env,
        instanceValue,
        JSVM_KEY_OWN_ONLY,
        static_cast<JSVM_KeyFilter>(JSVM_KEY_ENUMERABLE | JSVM_KEY_SKIP_SYMBOLS),
        JSVM_KEY_NUMBERS_TO_STRINGS,
        &allPropertyNames);
    uint32_t nameSize = 0;
    OH_JSVM_GetArrayLength(env, allPropertyNames, &nameSize);
    JSVM_Value propertyName = nullptr;
    for (uint32_t i = 0; i < nameSize; ++i) {
        OH_JSVM_GetElement(env, allPropertyNames, i, &propertyName);
        char str[100];
        size_t size;
        OH_JSVM_GetValueStringUtf8(env, propertyName, str, strlen(str), &size);
        bool isExisted = false;
        OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    }
    propertyCfg.genericNamedPropertyEnumeratorCallback = nullptr;
    return nullptr;
}

static napi_value testEnumeratorNamedProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler7;
    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler7", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ================== test return true for namedProperty handle =========
// case 43
// When returning nullptr, the enumerator listens and triggers, only listens but not
// intercepts. OH_JSVM_GetAllPropertyNames can retrieve the property names that have already been set.
static JSVM_Value EnumeratorNamedPropertyCbInfo2(JSVM_Env env, JSVM_Value thisArg, JSVM_Value data)
{
    uint32_t arrayLength = 2;
    JSVM_Value testArray = nullptr;
    OH_JSVM_CreateArrayWithLength(env, arrayLength, &testArray);
    JSVM_Value name1 = nullptr;
    char newStr1[] = "hahaha";
    OH_JSVM_CreateStringUtf8(env, newStr1, strlen(newStr1), &name1);
    JSVM_Value name2 = nullptr;
    char newStr2[] = "heheheh";
    OH_JSVM_CreateStringUtf8(env, newStr2, strlen(newStr2), &name2);
    OH_JSVM_SetElement(env, testArray, 0, name1);
    OH_JSVM_SetElement(env, testArray, 1, name2);
    return testArray;
}

static JSVM_Value NameHandler8(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericNamedPropertyEnumeratorCallback = EnumeratorNamedPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test20", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);
    const char testStr[] = "hello world2";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "str11", setvalueName);
    OH_JSVM_SetNamedProperty(env, instanceValue, "str123", setvalueName);
    JSVM_Value allPropertyNames = nullptr;
    OH_JSVM_GetAllPropertyNames(
        env,
        instanceValue,
        JSVM_KEY_OWN_ONLY,
        static_cast<JSVM_KeyFilter>(JSVM_KEY_ENUMERABLE | JSVM_KEY_SKIP_SYMBOLS),
        JSVM_KEY_NUMBERS_TO_STRINGS,
        &allPropertyNames);
    uint32_t nameSize = 0;
    OH_JSVM_GetArrayLength(env, allPropertyNames, &nameSize);
    JSVM_Value propertyName = nullptr;
    for (uint32_t i = 0; i < nameSize; ++i) {
        OH_JSVM_GetElement(env, allPropertyNames, i, &propertyName);
        char str[100];
        size_t size;
        OH_JSVM_GetValueStringUtf8(env, propertyName, str, strlen(str), &size);
        bool isExisted = false;
        OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    }
    propertyCfg.genericNamedPropertyEnumeratorCallback = nullptr;
    return nullptr;
}

static napi_value testEnumeratorNamedProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = NameHandler8;
    JSVM_PropertyDescriptor descriptor[] = {
        {"NameHandler8", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// ================== test nullptr return for indexedProperty handle =========
// case 44 and case 45
// When returning nullptr, the enumerator listens and triggers, only listens but not intercepts.
// OH_JSVM_GetAllPropertyNames can retrieve the property names that have already been set
static JSVM_Value EnumeratorIndexedPropertyCbInfo1(JSVM_Env env, JSVM_Value thisArg, JSVM_Value data)
{
    JSVM_Value gloablObj = nullptr;
    OH_JSVM_GetGlobal(env, &gloablObj);
    OH_JSVM_SetNamedProperty(env, gloablObj, "myTestInstance1", thisArg);
    return nullptr;
}

static JSVM_Value IndexHandler8(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyEnumeratorCallback = EnumeratorIndexedPropertyCbInfo1;
    JSVM_CallbackStruct callbackStruct;
    callbackStruct.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        printf("call as a function called");
        return nullptr;
    };
    callbackStruct.data = nullptr;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test21", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, &callbackStruct, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world1";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    JSVM_Value jsIndex1 = nullptr;
    uint32_t index1 = 1;
    OH_JSVM_CreateUint32(env, index1, &jsIndex1);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex1, setvalueName);
    JSVM_Value allPropertyNames = nullptr;
    OH_JSVM_GetAllPropertyNames(
        env,
        instanceValue,
        JSVM_KEY_OWN_ONLY,
        static_cast<JSVM_KeyFilter>(JSVM_KEY_ENUMERABLE | JSVM_KEY_SKIP_SYMBOLS),
        JSVM_KEY_NUMBERS_TO_STRINGS,
        &allPropertyNames);
    uint32_t nameSize = 0;
    OH_JSVM_GetArrayLength(env, allPropertyNames, &nameSize);
    JSVM_Value propertyName = nullptr;
    for (uint32_t i = 0; i < nameSize; ++i) {
        OH_JSVM_GetElement(env, allPropertyNames, i, &propertyName);
        char str[100];
        size_t size;
        OH_JSVM_GetValueStringUtf8(env, propertyName, str, strlen(str), &size);
        bool isExisted = false;
        OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    }
    propertyCfg.genericIndexedPropertyEnumeratorCallback = nullptr;
    return nullptr;
}

static napi_value testEnumeratorIndexedProperty01(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler8;
    JSVM_PropertyDescriptor descriptor[] = {
        {"indexHandler8", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

// =================== test return true for indexedProperty handle ============
// case 46
// When returning the array, the enumerator listens and triggers, listens and intercepts, and
// OH_JSVM_GetAllPropertyNames can retrieve the already set property names You can obtain the property
// names set in the listening callback and in the array, but the property names set in the callback are not actual properties
static JSVM_Value EnumeratorIndexedPropertyCbInfo2(JSVM_Env env, JSVM_Value thisArg, JSVM_Value data)
{
    JSVM_Value testArray = nullptr;
    uint32_t arrayLength = 2;
    OH_JSVM_CreateArrayWithLength(env, arrayLength, &testArray);
    JSVM_Value index1 = nullptr;
    uint32_t num1 = 2;
    OH_JSVM_CreateUint32(env, num1, &index1);
    JSVM_Value index2 = nullptr;
    uint32_t num2 = 3;
    OH_JSVM_CreateUint32(env, num2, &index2);
    OH_JSVM_SetElement(env, testArray, 0, index1);
    OH_JSVM_SetElement(env, testArray, 1, index2);
    return testArray;
}

static JSVM_Value IndexHandler9(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    param.data = nullptr;
    propertyCfg.genericIndexedPropertyEnumeratorCallback = EnumeratorIndexedPropertyCbInfo2;
    JSVM_Value testWrapClass = nullptr;
    JSVM_Status res = OH_JSVM_DefineClassWithPropertyHandler(env, "Test22", NAPI_AUTO_LENGTH, &param, 0, nullptr,
                                                             &propertyCfg, nullptr, &testWrapClass);
    if (res == JSVM_OK) {
        printf("OH_JSVM_DefineClassWithPropertyHandler successfully");
    } else {
        printf("OH_JSVM_DefineClassWithPropertyHandler failed");
        return nullptr;
    }
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, testWrapClass, 0, nullptr, &instanceValue);

    const char testStr[] = "hello world2";
    JSVM_Value setvalueName = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setvalueName);
    JSVM_Value jsIndex = nullptr;
    uint32_t index = 0;
    OH_JSVM_CreateUint32(env, index, &jsIndex);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex, setvalueName);
    JSVM_Value jsIndex1 = nullptr;
    uint32_t index1 = 1;
    OH_JSVM_CreateUint32(env, index1, &jsIndex1);
    OH_JSVM_SetProperty(env, instanceValue, jsIndex1, setvalueName);
    JSVM_Value allPropertyNames = nullptr;
    OH_JSVM_GetAllPropertyNames(
        env,
        instanceValue,
        JSVM_KEY_OWN_ONLY,
        static_cast<JSVM_KeyFilter>(JSVM_KEY_ENUMERABLE | JSVM_KEY_SKIP_SYMBOLS),
        JSVM_KEY_NUMBERS_TO_STRINGS,
        &allPropertyNames);
    uint32_t nameSize = 0;
    OH_JSVM_GetArrayLength(env, allPropertyNames, &nameSize);
    JSVM_Value propertyName = nullptr;
    for (uint32_t i = 0; i < nameSize; ++i) {
        OH_JSVM_GetElement(env, allPropertyNames, i, &propertyName);
        char str[100];
        size_t size;
        OH_JSVM_GetValueStringUtf8(env, propertyName, str, strlen(str), &size);
        bool isExisted = false;
        OH_JSVM_HasProperty(env, instanceValue, propertyName, &isExisted);
    }
    propertyCfg.genericIndexedPropertyEnumeratorCallback = nullptr;
    return nullptr;
}

static napi_value testEnumeratorIndexedProperty02(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_CallbackStruct param[1];
    param[0].callback = nullptr;
    param[0].callback = IndexHandler9;
    JSVM_PropertyDescriptor descriptor[] = {
        {"indexHandler9", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
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

static napi_value testDefinePropertyHandle(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    int32_t value;
    napi_value result = 0;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &value));
    if (value == DIFF_VALUE_ZERO) {
        result = testCheckArgs(env, info);
    } else if (value == DIFF_VALUE_NOE) {
        result = testSetProperty(env, info);
    } else if (value == DIFF_VALUE_TWO) {
        result = testGetProperty(env, info);
    } else if (value == DIFF_VALUE_THREE) {
        result = testCallFunction(env, info);
    } else if (value == DIFF_VALUE_FOUR) {
        result = testSetNamedProperty01(env, info);
    } else if (value == DIFF_VALUE_FIVE) {
        result = testSetNamedProperty02(env, info);
    } else if (value == DIFF_VALUE_SIX) {
        result = testSetIndexProperty01(env, info);
    } else if (value == DIFF_VALUE_SEVEN) {
        result = testSetIndexProperty02(env, info);
    } else if (value == DIFF_VALUE_EIGHT) {
        result = testGetNamedProperty01(env, info);
    } else if (value == DIFF_VALUE_NINE) {
        result = testGetNamedProperty02(env, info);
    } else if (value == DIFF_VALUE_TEN) {
        result = testGetIndexProperty01(env, info);
    } else if (value == DIFF_VALUE_ELEVEN) {
        result = testGetIndexProperty02(env, info);
    } else if (value == DIFF_VALUE_TWELVE) {
        result = testDeleterNamedProperty01(env, info);
    } else if (value == DIFF_VALUE_THIRTEEN) {
        result = testDeleterNamedProperty02(env, info);
    } else if (value == DIFF_VALUE_FOURTEEN) {
        result = testDeleterNamedProperty03(env, info);
    } else if (value == DIFF_VALUE_FITEEN) {
        result = testDeleterIndexedProperty01(env, info);
    } else if (value == DIFF_VALUE_SIXTEEN) {
        result = testDeleterIndexedProperty02(env, info);
    } else if (value == DIFF_VALUE_SEVENTEEN) {
        result = testDeleterIndexedProperty03(env, info);
    } else if (value == DIFF_VALUE_EIGHTEEN) {
        result = testEnumeratorNamedProperty01(env, info);
    } else if (value == DIFF_VALUE_NINETEEN) {
        result = testEnumeratorNamedProperty02(env, info);
    }  else if (value == DIFF_VALUE_TWENTY) {
        result = testEnumeratorIndexedProperty01(env, info);
    } else if (value == DIFF_VALUE_TWENTYONE) {
        result = testEnumeratorIndexedProperty02(env, info);
    }
    return result;
}

static JSVM_Value CreateStringUtf8(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    const char *str = u8"你好, World!, successes to create UTF-8 string!";
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_CreateStringUtf8(env, str, strlen(str), &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create UTF-8 string");
    }
    return result;
}

static JSVM_Value GetValueStringUtf8(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    size_t length = 0;
    OH_JSVM_GetValueStringUtf8(env, args[0], nullptr, 0, &length);
    if (length <= 0) {
        return nullptr;
    }
    char *buf = (char *)malloc(length + 1);
    if (buf == nullptr) {
        printf("Memory allocation failed!\n");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, args[0], buf, length + 1, &length);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value result;
    OH_JSVM_CreateStringUtf8(env, buf, length, &result);
    return result;
}

static JSVM_Value CreateStringUtf16(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf16");
    const char16_t *str = u"你好, World!, successes to create UTF-16 string!";
    size_t length = 0;
    while (str[length] != u'\0') {
        ++length;
    }
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_CreateStringUtf16(env, str, length, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create UTF-16 string");
    }
    return result;
}

static const int MAX_BUFFER_SIZE = 128;
static JSVM_Value GetValueStringUtf16(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf16");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result;
    size_t length;
    char16_t buffer[MAX_BUFFER_SIZE];

    size_t bufferSize = MAX_BUFFER_SIZE;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, args[0], buffer, bufferSize, &length);
    if (status != JSVM_OK) {
        return nullptr;
    }

    OH_JSVM_CreateStringUtf16(env, buffer, length, &result);
    return result;
}

static JSVM_Value CreateStringLatin1(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "latin");
    const char *str = "Hello, World! éçñ, successes to create Latin1 string! 111";
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateStringLatin1(env, str, JSVM_AUTO_LENGTH, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create Latin1 string");
    }
    return result;
}

static JSVM_Value GetValueStringLatin1(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "latin");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    char buf[MAX_BUFFER_SIZE];
    size_t length = 0;
    JSVM_Value jsvmRes;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, args[0], buf, MAX_BUFFER_SIZE, &length);
    if (status != JSVM_OK) {
        return nullptr;
    }
    OH_JSVM_CreateStringLatin1(env, buf, length, &jsvmRes);
    return jsvmRes;
}

void GetResultType(JSVM_Env env, JSVM_Value result)
{
    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, result, &valueType);
    switch (valueType) {
        case JSVM_NUMBER: {
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            break;
        }
        case JSVM_STRING: {
            strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
            break;
        }
        case JSVM_OBJECT: {
            strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
            break;
        }
        case JSVM_BIGINT: {
            strcpy_s(g_dataType, sizeof(g_dataType), "BigintUint64");
            break;
        }
        default: {
            break;
        }
    }
}

static JSVM_Value CreateDate(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "date");
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateDate(env, DIFF_VALUE_DATE, &returnValue);
    return returnValue;
}

static JSVM_Value CreateObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value name;
    OH_JSVM_CreateStringUtf8(env, "name", JSVM_AUTO_LENGTH, &name);
    JSVM_Value value;
    OH_JSVM_CreateStringUtf8(env, "Hello OH_JSVM_CreateObject!", NAPI_AUTO_LENGTH, &value);
    OH_JSVM_SetProperty(env, object, name, value);
    return object;
}

static JSVM_Value CreateExternal(JSVM_Env env, JSVM_CallbackInfo info)
{
    void *data = malloc(DIFF_VALUE_TEN);
    if (data == nullptr) {
        printf("Memory allocation failed!\n");
        return nullptr;
    }
    if (memset_s(data, DIFF_VALUE_TEN, 0, DIFF_VALUE_TEN) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    const char testStr[] = "test";
    JSVM_Value external = nullptr;
    JSVM_Status status = OH_JSVM_CreateExternal(
        env, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, (void *)testStr, &external);
    JSVM_Value returnValue;
    bool type = false;
    if (status != JSVM_OK) {
        return nullptr;
    } else {
        type = true;
    }
    OH_JSVM_GetBoolean(env, type, &returnValue);
    return returnValue;
}

static JSVM_Value GetValueExternal(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    void *data = reinterpret_cast<void *>(0x12345);
    JSVM_Value externalValue;
    JSVM_Status status = OH_JSVM_CreateExternal(env, data, nullptr, nullptr, &externalValue);
    if (status != JSVM_OK) {
        return nullptr;
    }
    void *dataValue;
    status = OH_JSVM_GetValueExternal(env, externalValue, &dataValue);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value returnValue;
    OH_JSVM_CreateInt32(env, 0, &returnValue);
    return returnValue;
}

static JSVM_Value CreateArray(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    JSVM_Value array = nullptr;
    OH_JSVM_CreateArray(env, &array);
    for (int i = 0; i < DIFF_VALUE_FIVE; i++) {
        JSVM_Value element;
        OH_JSVM_CreateInt32(env, i, &element);
        OH_JSVM_SetElement(env, array, i, element);
    }
    return array;
}

static JSVM_Value CreateArrayWithLength(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    JSVM_Value result = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    int32_t length = 0;
    OH_JSVM_GetValueInt32(env, argv[0], &length);
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, length, &result);
    if (status == JSVM_OK) {
        for (int32_t i = 0; i < length; i++) {
            JSVM_Value value;
            OH_JSVM_CreateInt32(env, i, &value);
            OH_JSVM_SetElement(env, result, i, value);
        }
    }
    return result;
}

static JSVM_Value CreateArraybuffer(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "arraybuffer");
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    int32_t value;
    size_t length;
    OH_JSVM_GetValueInt32(env, argv[0], &value);
    length = size_t(value);
    void *data;
    JSVM_Value result = nullptr;
    OH_JSVM_CreateArraybuffer(env, length, &data, &result);
    return result;
}

static JSVM_Value GetArrayLength(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    uint32_t length;
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    bool isArray = false;
    OH_JSVM_IsArray(env, args[0], &isArray);
    if (!isArray) {
        return nullptr;
    }
    OH_JSVM_GetArrayLength(env, args[0], &length);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateInt32(env, length, &result);
    return result;
}

static JSVM_Value CreateInt32(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_CreateInt32(env, DIFF_VALUE_INT32, &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return result;
}

static JSVM_Value GetValueInt32(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    int32_t result;
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Status status = OH_JSVM_GetValueInt32(env, args[0], &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value jsvmResult;
    status = OH_JSVM_CreateInt32(env, result, &jsvmResult);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return jsvmResult;
}

static JSVM_Value CreateUInt32(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_CreateUint32(env, DIFF_VALUE_UINT, &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return result;
}

static JSVM_Value GetValueUint32(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    uint32_t number;
    JSVM_Status status = OH_JSVM_GetValueUint32(env, argv[0], &number);
    JSVM_Value result = nullptr;
    OH_JSVM_CreateUint32(env, number, &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return result;
}

static JSVM_Value CreateInt64(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_CreateInt64(env, DIFF_VALUE_INT, &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return result;
}

static JSVM_Value GetValueInt64(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    int64_t result;
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Status status = OH_JSVM_GetValueInt64(env, args[0], &result);
    JSVM_Value jsvmResult;
    OH_JSVM_CreateInt64(env, result, &jsvmResult);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return jsvmResult;
}

static JSVM_Value CreateDouble(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "double");
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_CreateDouble(env, DIFF_VALUE_DOUBLE, &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return result;
}

static JSVM_Value GetDouble(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "double");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    double value;
    JSVM_Status status = OH_JSVM_GetValueDouble(env, args[0], &value);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value result;
    OH_JSVM_CreateDouble(env, value, &result);
    return result;
}

static JSVM_Value GetBoolean(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value argv[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    int32_t paramData = 0;
    OH_JSVM_GetValueInt32(env, argv[0], &paramData);
    int32_t paramValue = 0;
    OH_JSVM_GetValueInt32(env, argv[1], &paramValue);
    JSVM_Value returnValue;
    bool type = false;
    if (paramData == paramValue) {
        type = true;
    }
    OH_JSVM_GetBoolean(env, type, &returnValue);
    return returnValue;
}

static JSVM_Value GetValueBool(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool boolC;
    JSVM_Status status = OH_JSVM_GetValueBool(env, args[0], &boolC);
    if (status == JSVM_BOOLEAN_EXPECTED) {
        return nullptr;
    }
    JSVM_Value bool_napi;
    OH_JSVM_GetBoolean(env, boolC, &bool_napi);
    return bool_napi;
}

static JSVM_Value CreateBigintUint64(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "BigintUint64");
    JSVM_Value returnValue;
    OH_JSVM_CreateBigintUint64(env, DIFF_VALUE_BIGUINT, &returnValue);
    return returnValue;
}

static JSVM_Value GetValueBigintUint64(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "BigintUint64");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    uint64_t value = 0;
    bool lossLess = false;
    OH_JSVM_GetValueBigintUint64(env, args[0], &value, &lossLess);
    if (!lossLess) {
        OH_JSVM_ThrowError(env, nullptr, "BigInt values have no lossless converted");
    }
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateBigintUint64(env, value, &returnValue);
    return returnValue;
}

static JSVM_Value CreateBigintInt64(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "BigintInt64");
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateBigintInt64(env, DIFF_VALUE_BIGINT, &returnValue);
    return returnValue;
}

static JSVM_Value GetBigintInt64(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "BigintInt64");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int64_t value = 0;
    bool lossLess = false;
    OH_JSVM_GetValueBigintInt64(env, args[0], &value, &lossLess);
    if (!lossLess) {
        OH_JSVM_ThrowError(env, nullptr, "BigInt values have not been lossless converted");
    }
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateBigintInt64(env, value, &returnValue);
    return returnValue;
}

static JSVM_Value CreateBigintWords(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "BigintWords");
    int signBit = 0;
    size_t wordCount = DIFF_VALUE_THREE;
    uint64_t words[] = {12ULL, 34ULL, 56ULL};
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "OH_JSVM_CreateBigintWords fail");
    }
    return returnValue;
}

static JSVM_Value GetValueBigintWords(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    int signBit = 0;
    size_t wordCount = 0;
    uint64_t words;

    OH_JSVM_GetValueBigintWords(env, args[0], nullptr, &wordCount, nullptr);
    JSVM_Status status = OH_JSVM_GetValueBigintWords(env, args[0], &signBit, &wordCount, &words);
    if (status != JSVM_OK) {
        return nullptr;
    }

    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateInt32(env, signBit, &returnValue);
    return returnValue;
}

static JSVM_Value GetNull(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value nullValue;
    OH_JSVM_GetNull(env, &nullValue);
    return nullValue;
}

static JSVM_Value GetUndefined(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value value = nullptr;
    OH_JSVM_GetUndefined(env, &value);
    return value;
}

static JSVM_Value GetGlobal(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value value = nullptr;
    JSVM_Value global = nullptr;
    OH_JSVM_CreateInt32(env, DIFF_VALUE_NOE, &value);
    OH_JSVM_GetGlobal(env, &global);
    OH_JSVM_SetNamedProperty(env, global, "Row", value);
    return global;
}

static JSVM_Value CreateSymbol(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result;
    const char *des = "only";
    OH_JSVM_CreateStringUtf8(env, des, JSVM_AUTO_LENGTH, &result);
    JSVM_Value returnSymbol;
    OH_JSVM_CreateSymbol(env, result, &returnSymbol);
    JSVM_Value returnValue;
    bool type = false;
    JSVM_ValueType valuetypeSymbol;
    OH_JSVM_Typeof(env, returnSymbol, &valuetypeSymbol);
    if (valuetypeSymbol == JSVM_SYMBOL) {
        type = true;
    }
    OH_JSVM_GetBoolean(env, type, &returnValue);
    return returnValue;
}

static JSVM_Value SymbolFor(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value description;
    OH_JSVM_CreateStringUtf8(env, "test_demo", DIFF_VALUE_NINE, &description);
    char buffer[MAX_BUFFER_SIZE];
    size_t copied = 0;
    OH_JSVM_GetValueStringUtf8(env, description, buffer, MAX_BUFFER_SIZE, &copied);
    JSVM_Value symbol;
    OH_JSVM_CreateSymbol(env, description, &symbol);
    JSVM_Value result_symbol;
    JSVM_Status status = OH_JSVM_SymbolFor(env, nullptr, 0, &result_symbol);
    JSVM_Value returnValue;
    bool type = false;
    JSVM_ValueType valuetypeSymbol;
    OH_JSVM_Typeof(env, result_symbol, &valuetypeSymbol);
    if (valuetypeSymbol == JSVM_SYMBOL && status == JSVM_OK) {
        type = true;
    }
    OH_JSVM_GetBoolean(env, type, &returnValue);
    return returnValue;
}

static JSVM_Value GetDateValue(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "double");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    double value;
    JSVM_Status status = OH_JSVM_GetDateValue(env, args[0], &value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "napi_get_date_value fail");
    }
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateDouble(env, value, &returnValue);
    return returnValue;
}

static JSVM_Value IsDate(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    bool result = false;
    OH_JSVM_IsDate(env, args[0], &result);

    JSVM_Value isDate = nullptr;
    OH_JSVM_GetBoolean(env, result, &isDate);
    return isDate;
}


static JSVM_Value GetArraybufferInfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t infoTypeParam;
    OH_JSVM_GetValueInt32(env, args[1], &infoTypeParam);
    bool isArrayBuffer = false;
    OH_JSVM_IsArraybuffer(env, args[0], &isArrayBuffer);
    if (!isArrayBuffer) {
        return nullptr;
    }
    enum InfoType {
        ARRAY_LENGTH,
        ARRAY_BUFFER
    };
    void *data;
    size_t byteLength;
    JSVM_Status status = OH_JSVM_GetArraybufferInfo(env, args[0], &data, &byteLength);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value result = nullptr;
    switch (infoTypeParam) {
        case ARRAY_LENGTH:
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            JSVM_Value jsvmLength;
            OH_JSVM_CreateInt32(env, byteLength, &jsvmLength);
            result = jsvmLength;
            break;
        case ARRAY_BUFFER:
            strcpy_s(g_dataType, sizeof(g_dataType), "arraybuffer");
            JSVM_Value bufferData;
            OH_JSVM_CreateArraybuffer(env, byteLength, &data, &bufferData);
            result = bufferData;
            break;
        default:
            break;
    }
    return result;
}

static JSVM_Value CreateTypedArray(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "typearray");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t typeNum;
    OH_JSVM_GetValueInt32(env, args[0], &typeNum);
    JSVM_TypedarrayType arrayType;
    size_t elementSize = 0;
    arrayType = static_cast<JSVM_TypedarrayType>(typeNum);
    switch (typeNum) {
        case JSVM_INT8_ARRAY:
        case JSVM_UINT8_ARRAY:
        case JSVM_UINT8_CLAMPED_ARRAY:
            elementSize = sizeof(int8_t);
            break;
        case JSVM_INT16_ARRAY:
        case JSVM_UINT16_ARRAY:
            elementSize = sizeof(int16_t);
            break;
        case JSVM_INT32_ARRAY:
        case JSVM_UINT32_ARRAY:
            elementSize = sizeof(int32_t);
            break;
        case JSVM_FLOAT32_ARRAY:
            elementSize = sizeof(float);
            break;
        case JSVM_FLOAT64_ARRAY:
            elementSize = sizeof(double);
            break;
        case JSVM_BIGINT64_ARRAY:
        case JSVM_BIGUINT64_ARRAY:
            elementSize = sizeof(int64_t);
            break;
        default:
            arrayType = JSVM_INT8_ARRAY;
            elementSize = sizeof(int8_t);
            break;
    }
    size_t length = DIFF_VALUE_THREE;
    JSVM_Value arrayBuffer = nullptr;
    JSVM_Value typedArray = nullptr;
    void *data;
    OH_JSVM_CreateArraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
    OH_JSVM_CreateTypedarray(env, arrayType, length, arrayBuffer, DIFF_VALUE_ZERO, &typedArray);
    return typedArray;
}


static JSVM_Value GetTypedArrayInfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t infoTypeParam;
    OH_JSVM_GetValueInt32(env, args[1], &infoTypeParam);
    enum InfoType {
        INFO_TYPE,
        INFO_LENGTH,
        INFO_ARRAY_BUFFER,
        INFO_BYTE_OFFSET
    };
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    size_t length;
    JSVM_Value arrayBuffer = nullptr;
    JSVM_Status status = OH_JSVM_GetTypedarrayInfo(env, args[0], &type, &length, &data, &arrayBuffer, &byteOffset);

    JSVM_Value result = nullptr;
    switch (infoTypeParam) {
        case INFO_TYPE:
            JSVM_Value int8_type;
            OH_JSVM_GetBoolean(env, status == JSVM_OK ? type == JSVM_INT8_ARRAY : false, &int8_type);
            result = int8_type;
            break;
        case INFO_LENGTH:
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            JSVM_Value jsvmLength;
            OH_JSVM_CreateInt32(env, status == JSVM_OK ? length : 0, &jsvmLength);
            result = jsvmLength;
            break;
        case INFO_BYTE_OFFSET:
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            JSVM_Value jsvmOffset;
            OH_JSVM_CreateInt32(env, status == JSVM_OK ? byteOffset : 0, &jsvmOffset);
            result = jsvmOffset;
            break;
        case INFO_ARRAY_BUFFER:
            bool isArrayBuffer;
            OH_JSVM_IsArraybuffer(env, arrayBuffer, &isArrayBuffer);
            JSVM_Value isArray;
            OH_JSVM_GetBoolean(env, status == JSVM_OK ? isArrayBuffer : false, &isArray);
            result = isArray;
            break;
        default:
            break;
    }
    return result;
}


static JSVM_Value CreateDataView(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    JSVM_Value arraybuffer = nullptr;
    JSVM_Value result = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    OH_JSVM_CoerceToObject(env, args[0], &arraybuffer);
    OH_JSVM_CreateDataview(env, DIFF_VALUE_TWELVE, arraybuffer, DIFF_VALUE_FOUR, &result);
    uint8_t *data = nullptr;
    size_t length = 0;
    for (size_t i = 0; i < length; i++) {
        data[i] = static_cast<uint8_t>(i + 1);
    }
    int32_t infoType;
    OH_JSVM_GetValueInt32(env, args[1], &infoType);
    size_t returnLength;
    JSVM_Value returnArrayBuffer = nullptr;
    size_t returnOffset;
    enum InfoType {
        BYTE_LENGTHE,
        ARRAY_BUFFERE,
        BYTE_OFFSET
    };
    OH_JSVM_GetDataviewInfo(env, result, &returnLength, (void **)&data, &returnArrayBuffer, &returnOffset);
    JSVM_Value returnResult = nullptr;
    switch (infoType) {
        case BYTE_LENGTHE:
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            OH_JSVM_CreateInt32(env, returnLength, &returnResult);
            break;
        case ARRAY_BUFFERE:
            bool isArrayBuffer;
            OH_JSVM_IsArraybuffer(env, returnArrayBuffer, &isArrayBuffer);
            OH_JSVM_GetBoolean(env, isArrayBuffer, &returnResult);
            break;
        case BYTE_OFFSET:
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            OH_JSVM_CreateInt32(env, returnOffset, &returnResult);
            break;
        default:
            break;
    }
    return returnResult;
}

static JSVM_Value GetDataViewInfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};

    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t infoType;
    OH_JSVM_GetValueInt32(env, args[1], &infoType);

    size_t byteLength;
    void *data;
    JSVM_Value arrayBuffer = nullptr;
    size_t byteOffset;
    enum InfoType {
        BYTE_LENGTHE,
        ARRAY_BUFFERE,
        BYTE_OFFSET
    };
    OH_JSVM_GetDataviewInfo(env, args[0], &byteLength, &data, &arrayBuffer, &byteOffset);
    JSVM_Value result = nullptr;
    switch (infoType) {
        case BYTE_LENGTHE: {
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            JSVM_Value len;
            OH_JSVM_CreateInt32(env, byteLength, &len);
            result = len;
            break;
	}
        case ARRAY_BUFFERE: {
            bool isArrayBuffer = false;
            OH_JSVM_IsArraybuffer(env, arrayBuffer, &isArrayBuffer);
            JSVM_Value isArray;
            OH_JSVM_GetBoolean(env, isArrayBuffer, &isArray);
            result = isArray;
            break;
	}
        case BYTE_OFFSET: {
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            JSVM_Value offset;
            OH_JSVM_CreateInt32(env, byteOffset, &offset);
            result = offset;
            break;
	}
        default:
            break;
    }
    return result;
}

static JSVM_Value GetPrototype(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    const char *testNameStr = "set and get proto";
    JSVM_Value propValue = nullptr;
    JSVM_Value key;
    OH_JSVM_CreateStringUtf8(env, "name", JSVM_AUTO_LENGTH, &key);
    OH_JSVM_CreateStringUtf8(env, testNameStr, strlen(testNameStr), &propValue);
    OH_JSVM_SetProperty(env, obj, key, propValue);

    JSVM_Value propResult = nullptr;
    JSVM_Status status = OH_JSVM_GetProperty(env, obj, key, &propResult);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return propResult;
}

static JSVM_Value CreateReference(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Ref gRef = nullptr;
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, "CreateReference", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, obj, "name", value);
    JSVM_Status status = OH_JSVM_CreateReference(env, obj, 1, &gRef);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Finalize jSVM_Finalize = nullptr;
    OH_JSVM_AddFinalizer(env, obj, nullptr, jSVM_Finalize, nullptr, &gRef);
    uint32_t result;
    OH_JSVM_ReferenceRef(env, gRef, &result);
    if (result != DIFF_VALUE_TWO) {
        return nullptr;
    }
    return obj;
}

static JSVM_Value UseReference(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Ref gRef = nullptr;
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, "UseReference", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, obj, "name", value);
    JSVM_Status status = OH_JSVM_CreateReference(env, obj, 1, &gRef);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Finalize jSVM_Finalize = nullptr;
    OH_JSVM_AddFinalizer(env, obj, nullptr, jSVM_Finalize, nullptr, &gRef);
    uint32_t result;
    OH_JSVM_ReferenceRef(env, gRef, &result);
    if (result != DIFF_VALUE_TWO) {
        return nullptr;
    }
    JSVM_Value object = nullptr;
    status = OH_JSVM_GetReferenceValue(env, gRef, &object);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return object;
}

static JSVM_Value DeleteReference(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Ref gRef = nullptr;
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, "DeleteReference", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, obj, "name", value);
    JSVM_Status status = OH_JSVM_CreateReference(env, obj, 1, &gRef);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Finalize jSVM_Finalize = nullptr;
    OH_JSVM_AddFinalizer(env, obj, nullptr, jSVM_Finalize, nullptr, &gRef);
    uint32_t result;
    OH_JSVM_ReferenceRef(env, gRef, &result);
    if (result != DIFF_VALUE_TWO) {
        return nullptr;
    }
    uint32_t num;
    OH_JSVM_ReferenceUnref(env, gRef, &num);
    if (num != 1) {
        return nullptr;
    }
    status = OH_JSVM_DeleteReference(env, gRef);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value returnResult = nullptr;
    OH_JSVM_CreateStringUtf8(env, "OH_JSVM_DeleteReference success", JSVM_AUTO_LENGTH, &returnResult);
    return returnResult;
}

static JSVM_Value EscapableHandleScopeTest(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    JSVM_EscapableHandleScope scope = nullptr;
    OH_JSVM_OpenEscapableHandleScope(env, &scope);
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, "Test jsvm_escapable_handle_scope", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, obj, "name", value);
    JSVM_Value escapedObj = nullptr;
    OH_JSVM_EscapeHandle(env, scope, obj, &escapedObj);
    OH_JSVM_CloseEscapableHandleScope(env, scope);
    OH_JSVM_CreateStringUtf8(env, "001", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, escapedObj, "id", value);
    return escapedObj;
}

static JSVM_Value HandleScopeTest(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    JSVM_HandleScope scope = nullptr;
    JSVM_Status status = OH_JSVM_OpenHandleScope(env, &scope);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, "test handleScope", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, obj, "name", value);
    status = OH_JSVM_CloseHandleScope(env, scope);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return obj;
}

static JSVM_Value HandleScope(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    JSVM_HandleScope scope = nullptr;
    JSVM_Status status = OH_JSVM_OpenHandleScope(env, &scope);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env, "handleScope", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env, obj, "name", value);
    status = OH_JSVM_CloseHandleScope(env, scope);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return obj;
}


static JSVM_Value GetPropertyNames(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetPropertyNames(env, args[0], &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to get propertynames");
    }
    return result;
}

static JSVM_Value GetAllPropertyNames(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetAllPropertyNames(env, args[0], JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
        JSVM_KeyFilter::JSVM_KEY_WRITABLE, JSVM_KeyConversion::JSVM_KEY_NUMBERS_TO_STRINGS, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to get allpropertynames");
    }
    return result;
}

static JSVM_Value GetEnumerableNames(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    JSVM_Status status;
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result;
    status = OH_JSVM_GetAllPropertyNames(env, args[0], JSVM_KeyCollectionMode::JSVM_KEY_INCLUDE_PROTOTYPES,
        JSVM_KeyFilter::JSVM_KEY_ENUMERABLE, JSVM_KeyConversion::JSVM_KEY_NUMBERS_TO_STRINGS, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to get allpropertynames");
    }
    return result;
}

static JSVM_Value GetOwnWritableNames(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    JSVM_Status status;
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result;
    status = OH_JSVM_GetAllPropertyNames(env, args[0], JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
        JSVM_KeyFilter::JSVM_KEY_WRITABLE, JSVM_KeyConversion::JSVM_KEY_NUMBERS_TO_STRINGS, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to get allpropertynames");
    }
    return result;
}

static JSVM_Value GetEnumerableConfigurableNames(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    JSVM_Status status;
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result;
    status = OH_JSVM_GetAllPropertyNames(env, args[0], JSVM_KeyCollectionMode::JSVM_KEY_INCLUDE_PROTOTYPES,
        static_cast<JSVM_KeyFilter>(JSVM_KEY_ENUMERABLE | JSVM_KEY_CONFIGURABLE),
        JSVM_KeyConversion::JSVM_KEY_NUMBERS_TO_STRINGS, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to get allpropertynames");
    }
    return result;
}

static JSVM_Value GetOwnConfigurableNames(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    JSVM_Status status;
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result;
    status = OH_JSVM_GetAllPropertyNames(env, args[0], JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
        JSVM_KeyFilter::JSVM_KEY_CONFIGURABLE, JSVM_KeyConversion::JSVM_KEY_NUMBERS_TO_STRINGS, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to get allpropertynames");
    }
    return result;
}

static void AddReturnedStatus(JSVM_Env env, const char *key, JSVM_Value object, JSVM_Status expectedStatus,
    JSVM_Status actualStatus)
{
    char messageString[100] = "";
    JSVM_Value propValue;
    OH_JSVM_CreateStringUtf8(env, (actualStatus == expectedStatus ? "Invalid argument" : messageString),
        JSVM_AUTO_LENGTH, &propValue);
    OH_JSVM_SetNamedProperty(env, object, key, propValue);
}

static void AddLastStatus(JSVM_Env env, const char *key, JSVM_Value returnValue)
{
    JSVM_Value propValue;
    const JSVM_ExtendedErrorInfo *pLastError;
    OH_JSVM_GetLastErrorInfo(env, &pLastError);
    OH_JSVM_CreateStringUtf8(env,
        (pLastError->errorMessage == nullptr ? "JSVM_status::JSVM_OK" : pLastError->errorMessage), JSVM_AUTO_LENGTH,
        &propValue);
    OH_JSVM_SetNamedProperty(env, returnValue, key, propValue);
}

static JSVM_Value SetProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 3;
    JSVM_Value args[3] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Status status = OH_JSVM_SetProperty(env, args[0], args[1], args[2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_SetProperty fail");
    }
    return args[0];
}

static JSVM_Value SetPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_SetProperty(nullptr, object, 0, object));
    OH_JSVM_SetProperty(env, nullptr, 0, object);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_SetProperty(env, object, 0, nullptr);
    AddLastStatus(env, "nullptrValue", returnValue);
    return returnValue;
}

static JSVM_Value GetProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_GetProperty(env, args[0], args[1], &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_GetProperty fail");
    }
    GetResultType(env, result);
    return result;
}

static JSVM_Value GetPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value key;
    OH_JSVM_CreateInt32(env, 0, &key);
    JSVM_Value result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_GetProperty(nullptr, object, key, &result));
    OH_JSVM_GetProperty(env, nullptr, key, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_GetProperty(env, object, key, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}

static JSVM_Value HasProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status;
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_HasProperty fail");
    }
    JSVM_Value returnReslut;
    OH_JSVM_GetBoolean(env, result, &returnReslut);
    return returnReslut;
}

static JSVM_Value HasPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value key;
    OH_JSVM_CreateInt32(env, 0, &key);
    bool result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_HasProperty(nullptr, object, key, &result));
    OH_JSVM_HasProperty(env, nullptr, key, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_HasProperty(env, object, nullptr, &result);
    AddLastStatus(env, "nullprtKey", returnValue);
    OH_JSVM_HasProperty(env, object, key, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}

static JSVM_Value DeleteProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, args[0], &valueType);
    if (valueType != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "Expects an object as argument.");
    }
    bool result = false;
    JSVM_Status status = OH_JSVM_DeleteProperty(env, args[0], args[1], &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_DeleteProperty failed");
    }
    JSVM_Value ret;
    OH_JSVM_GetBoolean(env, result, &ret);
    return ret;
}

static JSVM_Value DeletePropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value key;
    OH_JSVM_CreateInt32(env, 0, &key);
    bool result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_DeleteProperty(nullptr, object, key, &result));
    OH_JSVM_DeleteProperty(env, nullptr, key, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_DeleteProperty(env, object, nullptr, &result);
    AddLastStatus(env, "nullprtKey", returnValue);
    return returnValue;
}

static JSVM_Value HasOwnProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_ValueType valueType1;
    OH_JSVM_Typeof(env, args[0], &valueType1);
    if (valueType1 != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "First argument must be an object.");
    }
    JSVM_ValueType valuetype2;
    OH_JSVM_Typeof(env, args[1], &valuetype2);
    if (valuetype2 != JSVM_STRING && valuetype2 != JSVM_SYMBOL) {
        strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
        JSVM_Value result;
        OH_JSVM_CreateStringUtf8(env, "name expected status.", JSVM_AUTO_LENGTH, &result);
        return result;
    }
    bool hasProperty;
    JSVM_Status status = OH_JSVM_HasOwnProperty(env, args[0], args[1], &hasProperty);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM  OH_JSVM_HasOwnProperty failed");
    }
    JSVM_Value result;
    OH_JSVM_GetBoolean(env, hasProperty, &result);
    return result;
}

static JSVM_Value HasOwnPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value key;
    OH_JSVM_CreateInt32(env, 0, &key);
    bool result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_HasOwnProperty(nullptr, object, key, &result));
    OH_JSVM_HasOwnProperty(env, nullptr, key, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_HasOwnProperty(env, object, nullptr, &result);
    AddLastStatus(env, "nullprtKey", returnValue);
    OH_JSVM_HasOwnProperty(env, object, key, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}
static const int32_t NAME_PROPERTY_NUM = 1234;
static JSVM_Value SetNamedPropertyCreateObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 1;
    JSVM_Value str;
    char strKey[32] = "";
    OH_JSVM_GetCbInfo(env, info, &argc, &str, nullptr, nullptr);
    size_t keyLength;
    OH_JSVM_GetValueStringUtf8(env, str, strKey, DIFF_VALUE_KEYLEN, &keyLength);
    JSVM_Value newObj;
    OH_JSVM_CreateObject(env, &newObj);
    int32_t value = NAME_PROPERTY_NUM;
    JSVM_Value numValue;
    OH_JSVM_CreateInt32(env, value, &numValue);
    JSVM_Status status = OH_JSVM_SetNamedProperty(env, newObj, strKey, numValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_SetNamedProperty failed");
    }
    return newObj;
}

static JSVM_Value SetNamedProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = DIFF_VALUE_THREE;
    JSVM_Value args[3] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, args[0], &valueType);
    if (valueType != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "First argument must be an object.");
    }
    char strKey[32] = "";
    OH_JSVM_GetValueStringUtf8(env, args[1], strKey, DIFF_VALUE_KEYLEN, nullptr);
    JSVM_Status status = OH_JSVM_SetNamedProperty(env, args[0], strKey, args[2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_SetNamedProperty failed");
    }
    return args[0];
}

static JSVM_Value SetNamedPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    char key[32] = "";
    JSVM_Value result = nullptr;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_SetNamedProperty(nullptr, object, key, result));
    OH_JSVM_SetNamedProperty(env, nullptr, key, result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_SetNamedProperty(env, object, nullptr, result);
    AddLastStatus(env, "nullprtKey", returnValue);
    OH_JSVM_SetNamedProperty(env, object, key, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}

static JSVM_Value GetNamedProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    char strKey[32] = "";
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    size_t keyLength;
    OH_JSVM_GetValueStringUtf8(env, args[1], strKey, DIFF_VALUE_KEYLEN, &keyLength);
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_GetNamedProperty(env, args[0], strKey, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_GetNamedProperty failed");
    }
    GetResultType(env, result);
    return result;
}

static JSVM_Value GetNamedPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    char key[32] = "";
    JSVM_Value result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_GetNamedProperty(nullptr, object, key, &result));
    OH_JSVM_GetNamedProperty(env, nullptr, key, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_GetNamedProperty(env, object, nullptr, &result);
    AddLastStatus(env, "nullprtKey", returnValue);
    OH_JSVM_GetNamedProperty(env, object, key, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}

static JSVM_Value HasNamedProperty(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    char strKey[32] = "";
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    size_t keyLength;
    OH_JSVM_GetValueStringUtf8(env, args[1], strKey, DIFF_VALUE_KEYLEN, &keyLength);
    bool hasProperty = false;
    JSVM_Status status = OH_JSVM_HasNamedProperty(env, args[0], strKey, &hasProperty);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_HasNamedProperty failed");
    }
    JSVM_Value result;
    OH_JSVM_GetBoolean(env, hasProperty, &result);
    return result;
}

static JSVM_Value HasNamedPropertyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    char key[32] = "";
    bool result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_HasNamedProperty(nullptr, object, key, &result));
    OH_JSVM_HasNamedProperty(env, nullptr, key, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_HasNamedProperty(env, object, nullptr, &result);
    AddLastStatus(env, "nullprtKey", returnValue);
    OH_JSVM_HasNamedProperty(env, object, key, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}

static JSVM_Value SetElementWithLength(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    size_t argc = 1;
    JSVM_Value args;
    OH_JSVM_GetCbInfo(env, info, &argc, &args, nullptr, nullptr);
    int32_t arrLength = 0;
    OH_JSVM_GetValueInt32(env, args, &arrLength);
    JSVM_Value result;
    OH_JSVM_CreateArrayWithLength(env, arrLength, &result);
    for (int32_t i = 0; i < arrLength; i++) {
        JSVM_Value value;
        OH_JSVM_CreateInt32(env, i + DIFF_VALUE_TWO, &value);
        OH_JSVM_SetElement(env, result, i, value);
    }
    return result;
}

static JSVM_Value SetElement(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    size_t argc = DIFF_VALUE_THREE;
    JSVM_Value args[3] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t index = 0;
    OH_JSVM_GetValueInt32(env, args[1], &index);
    OH_JSVM_SetElement(env, args[0], index, args[DIFF_VALUE_TWO]);
    return args[0];
}

static JSVM_Value SetElementFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value value = nullptr;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_SetElement(nullptr, object, 0, value));
    OH_JSVM_SetElement(env, nullptr, 0, value);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_SetElement(env, object, 0, nullptr);
    AddLastStatus(env, "nullprtValue", returnValue);
    return returnValue;
}

static JSVM_Value GetElement(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    uint32_t index;
    OH_JSVM_GetValueUint32(env, args[1], &index);
    JSVM_Value result = nullptr;
    OH_JSVM_GetElement(env, args[0], index, &result);
    GetResultType(env, result);
    return result;
}

static JSVM_Value GetElementFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value value;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_GetElement(nullptr, object, 0, &value));
    OH_JSVM_GetElement(env, nullptr, 0, &value);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_GetElement(env, object, 0, nullptr);
    AddLastStatus(env, "nullprtValue", returnValue);
    return returnValue;
}

static JSVM_Value HasElement(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    uint32_t index;
    OH_JSVM_GetValueUint32(env, args[1], &index);
    bool hasElement = true;
    OH_JSVM_HasElement(env, args[0], index, &hasElement);
    JSVM_Value result = nullptr;
    OH_JSVM_GetBoolean(env, hasElement, &result);
    return result;
}

static JSVM_Value HasElementFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    bool result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_HasElement(nullptr, object, 0, &result));
    OH_JSVM_HasElement(env, nullptr, 0, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_HasElement(env, object, 0, nullptr);
    AddLastStatus(env, "nullprtresult", returnValue);
    return returnValue;
}

static JSVM_Value DeleteElement(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    uint32_t index;
    OH_JSVM_GetValueUint32(env, args[1], &index);
    bool deleted = true;
    OH_JSVM_DeleteElement(env, args[0], index, &deleted);
    JSVM_Value result = nullptr;
    OH_JSVM_GetBoolean(env, deleted, &result);
    return result;
}

static JSVM_Value DeleteElementAndCheck(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "array");
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    uint32_t index;
    OH_JSVM_GetValueUint32(env, args[1], &index);
    OH_JSVM_DeleteElement(env, args[0], index, nullptr);
    return args[0];
}

static JSVM_Value DeleteElementFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    bool result;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_DeleteElement(nullptr, object, 0, &result));
    OH_JSVM_DeleteElement(env, nullptr, 0, &result);
    AddLastStatus(env, "nullprtObject", returnValue);
    return returnValue;
}

static const int32_t METHOD_NUM = 26;
static JSVM_Value DefineMethodPropertiesExample(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue;
    OH_JSVM_CreateInt32(env, METHOD_NUM, &returnValue);
    return returnValue;
}
static JSVM_Value DefineMethodProperties(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_CallbackStruct param[] = {
        {.callback = DefineMethodPropertiesExample, .data = nullptr},
    };
    JSVM_PropertyDescriptor descriptor[] = {
        {"defineMethodPropertiesExample", nullptr, &param[0], nullptr, nullptr, nullptr, JSVM_DEFAULT}
    };
    OH_JSVM_DefineProperties(env, *argv, sizeof(descriptor) / sizeof(descriptor[0]), descriptor);
    const char *srcMethod = R"JS(
        obj.defineMethodPropertiesExample();
    )JS";
    JSVM_Value sourceCodeValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, srcMethod, strlen(srcMethod), &sourceCodeValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value jsVmResult;
    OH_JSVM_RunScript(env, script, &jsVmResult);
    return jsVmResult;
}

static JSVM_Value DefineStringProperties(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_Value stringValue;
    OH_JSVM_CreateStringUtf8(env, "Hello!", JSVM_AUTO_LENGTH, &stringValue);
    JSVM_PropertyDescriptor descriptor[] = {
        {"defineStringPropertiesExample", nullptr, nullptr, nullptr, nullptr, stringValue, JSVM_DEFAULT}
    };
    OH_JSVM_DefineProperties(env, *argv, sizeof(descriptor) / sizeof(descriptor[0]), descriptor);
    const char *srcMethod = R"JS(
        obj.defineStringPropertiesExample;
    )JS";
    JSVM_Value sourceCodeValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, srcMethod, strlen(srcMethod), &sourceCodeValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value jsVmResult;
    OH_JSVM_RunScript(env, script, &jsVmResult);
    return jsVmResult;
}

static JSVM_Value GetterCallback(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result;
    const char *str = "Hello world!";
    size_t length = strlen(str);
    OH_JSVM_CreateStringUtf8(env, str, length, &result);
    return result;
}

static JSVM_Value DefineGetterProperties(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_CallbackStruct param[] = {
        {.callback = GetterCallback, .data = nullptr},
    };
    JSVM_PropertyDescriptor descriptor[] = {
        {"getterCallback", nullptr, nullptr, &param[0], nullptr, nullptr, JSVM_DEFAULT}
    };
    OH_JSVM_DefineProperties(env, *argv, 1, descriptor);
    const char *srcMethod = R"JS(
        obj.getterCallback;
    )JS";
    JSVM_Value sourceCodeValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, srcMethod, strlen(srcMethod), &sourceCodeValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value jsVmResult;
    OH_JSVM_RunScript(env, script, &jsVmResult);
    return jsVmResult;
}

static JSVM_Value DefinePropertiesFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &returnValue);
    OH_JSVM_CreateObject(env, &object);
    JSVM_CallbackStruct param[] = {
        {.callback = DefinePropertiesFailed, .data = nullptr},
    };
    JSVM_PropertyDescriptor desc[] = {{"prop", nullptr, &param[0], nullptr, nullptr, nullptr, JSVM_DEFAULT}};
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_DefineProperties(nullptr, object, 1, desc));
    OH_JSVM_DefineProperties(env, nullptr, 1, desc);
    AddLastStatus(env, "nullprtObject", returnValue);
    OH_JSVM_DefineProperties(env, object, 1, nullptr);
    AddLastStatus(env, "nullptrDescriptorList", returnValue);
    desc->utf8name = nullptr;
    OH_JSVM_DefineProperties(env, object, 1, nullptr);
    AddLastStatus(env, "nullptrUtf8name", returnValue);
    return returnValue;
}

static JSVM_Value ObjectFreeze(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    OH_JSVM_ObjectFreeze(env, argv[0]);
    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 0, &value);
    OH_JSVM_SetNamedProperty(env, argv[0], "data", value);
    OH_JSVM_SetNamedProperty(env, argv[0], "newKey", value);
    JSVM_Value key;
    OH_JSVM_CreateStringUtf8(env, "message", JSVM_AUTO_LENGTH, &key);
    OH_JSVM_DeleteProperty(env, argv[0], key, nullptr);
    return argv[0];
}

static JSVM_Value ObjectSeal(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    OH_JSVM_ObjectSeal(env, argv[0]);

    JSVM_Value changeValue;
    OH_JSVM_CreateInt32(env, METHOD_NUM, &changeValue);
    OH_JSVM_SetNamedProperty(env, argv[0], "data", changeValue);
    JSVM_Value deleteProperty;
    OH_JSVM_CreateStringUtf8(env, "message", JSVM_AUTO_LENGTH, &deleteProperty);
    OH_JSVM_DeleteProperty(env, argv[0], deleteProperty, nullptr);
    JSVM_Value addValue;
    OH_JSVM_CreateStringUtf8(env, "addValue", JSVM_AUTO_LENGTH, &addValue);
    OH_JSVM_SetNamedProperty(env, argv[0], "newProperty", addValue);
    return argv[0];
}

static JSVM_Value GetVersion(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    uint32_t jsVersion;
    OH_JSVM_GetVersion(env, &jsVersion);
    JSVM_Value result;
    OH_JSVM_CreateUint32(env, jsVersion, &result);
    return result;
}

static JSVM_Value GetVersionFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    OH_JSVM_CreateObject(env, &returnValue);
    uint32_t jsVersion;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_GetVersion(nullptr, &jsVersion));
    OH_JSVM_GetVersion(env, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}


static JSVM_Value GetVMInfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_VMInfo result;
    OH_JSVM_GetVMInfo(&result);
    JSVM_Value version;
    OH_JSVM_CreateUint32(env, result.apiVersion, &version);
    return version;
}

static JSVM_Value JsonStringify(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_Value result;
    OH_JSVM_JsonStringify(env, *argv, &result);
    return result;
}

static JSVM_Value JsonStringifyFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue;
    OH_JSVM_CreateObject(env, &returnValue);
    JSVM_Value jsonObject = nullptr;
    JSVM_Value ret = nullptr;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_JsonStringify(nullptr, jsonObject, &ret));
    OH_JSVM_JsonStringify(env, nullptr, &ret);
    AddLastStatus(env, "nullptrJsonObject", returnValue);
    return returnValue;
}

static JSVM_Value JsonParseNumber(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "double");
    const char *strNumber = "10.555";
    JSVM_Value jsonString = nullptr;
    OH_JSVM_CreateStringUtf8(env, strNumber, strlen(strNumber), &jsonString);
    JSVM_Value result = nullptr;
    OH_JSVM_JsonParse(env, jsonString, &result);
    return result;
}

static JSVM_Value JsonParseObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    const char *strObject = "{\"first\": \"one\", \"second\": \"two\"}";
    JSVM_Value strJson = nullptr;
    OH_JSVM_CreateStringUtf8(env, strObject, strlen(strObject), &strJson);
    JSVM_Value ret = nullptr;
    OH_JSVM_JsonParse(env, strJson, &ret);
    return ret;
}

static JSVM_Value JsonParse(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_Value result = nullptr;
    OH_JSVM_JsonParse(env, *argv, &result);
    GetResultType(env, result);
    return result;
}

static JSVM_Value JsonParseFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateObject(env, &returnValue);
    const char *str = "";
    JSVM_Value strJson = nullptr;
    OH_JSVM_CreateStringUtf8(env, str, strlen(str), &strJson);
    JSVM_Value ret = nullptr;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_JsonParse(nullptr, strJson, &ret));
    OH_JSVM_JsonParse(env, nullptr, &ret);
    AddLastStatus(env, "nullptrJsonString", returnValue);
    return returnValue;
}

static JSVM_Value CallFunction(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value global = nullptr;
    OH_JSVM_GetGlobal(env, &global);
    JSVM_Value result = nullptr;
    OH_JSVM_CallFunction(env, global, args[0], 0, nullptr, &result);
    GetResultType(env, result);
    return result;
}

static JSVM_Value CallFunctionWithArg(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value global = nullptr;
    OH_JSVM_GetGlobal(env, &global);
    JSVM_Value arg[2] = {nullptr};
    OH_JSVM_CreateStringUtf8(env, "Hello", JSVM_AUTO_LENGTH, &arg[0]);
    OH_JSVM_CreateStringUtf8(env, " World!", JSVM_AUTO_LENGTH, &arg[1]);
    JSVM_Value result = nullptr;
    OH_JSVM_CallFunction(env, global, args[0], DIFF_VALUE_TWO, arg, &result);
    return result;
}

static JSVM_Value CallFunctionWithObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value func = nullptr;
    OH_JSVM_GetNamedProperty(env, args[0], "myMethod", &func);
    JSVM_Value global = nullptr;
    OH_JSVM_GetGlobal(env, &global);
    JSVM_Value arg[2] = {nullptr};
    OH_JSVM_CreateInt32(env, METHOD_NUM, &arg[0]);
    OH_JSVM_CreateInt32(env, METHOD_NUM, &arg[1]);
    JSVM_Value result = nullptr;
    OH_JSVM_CallFunction(env, global, func, DIFF_VALUE_TWO, arg, &result);
    return result;
}

static JSVM_Value CallFunctionFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateObject(env, &returnValue);
    JSVM_Value global = nullptr;
    OH_JSVM_GetGlobal(env, &global);
    JSVM_Value result = nullptr;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_CallFunction(nullptr, global, args[0], 0, nullptr, &result));
    OH_JSVM_CallFunction(env, nullptr, args[0], 0, nullptr, &result);
    AddLastStatus(env, "nullprtGlobal", returnValue);
    OH_JSVM_CallFunction(env, global, args[0], 1, nullptr, &result);
    AddLastStatus(env, "nullprtArgv", returnValue);
    OH_JSVM_CallFunction(env, global, nullptr, 0, nullptr, &result);
    AddLastStatus(env, "nullptrFunc", returnValue);
    return returnValue;
}

static JSVM_Value CalculateArea(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    double width;
    OH_JSVM_GetValueDouble(env, args[0], &width);
    double height;
    OH_JSVM_GetValueDouble(env, args[1], &height);
    JSVM_Value area;
    OH_JSVM_CreateDouble(env, width * height, &area);
    return area;
}
static double g_width = 1.4;
static double g_height = 5.0;
static JSVM_Value CreateFunction(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "double");
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = CalculateArea;
    JSVM_Value funcValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "calculateArea", JSVM_AUTO_LENGTH, &param, &funcValue);
    if (funcValue == nullptr || status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_CreateFunction failed");
    }
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_CreateDouble(env, g_width, &args[0]);
    OH_JSVM_CreateDouble(env, g_height, &args[1]);
    JSVM_Value global = nullptr;
    OH_JSVM_GetGlobal(env, &global);
    JSVM_Value ret = nullptr;
    OH_JSVM_CallFunction(env, global, funcValue, DIFF_VALUE_TWO, args, &ret);
    return ret;
}

static JSVM_Value CreateFunctionFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateObject(env, &returnValue);
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = CalculateArea;
    JSVM_Value result = nullptr;
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_CreateFunction(nullptr, "myFunc", JSVM_AUTO_LENGTH, &param, &result));
    OH_JSVM_CreateFunction(env, "myFunc", JSVM_AUTO_LENGTH, nullptr, &result);
    AddLastStatus(env, "nullprtCD", returnValue);
    OH_JSVM_CreateFunction(env, "myFunc", JSVM_AUTO_LENGTH, &param, nullptr);
    AddLastStatus(env, "nullptrResult", returnValue);
    return returnValue;
}

static JSVM_Value CreateFunctionWithScript(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 3;
    JSVM_Value argv[3] = { nullptr};
    JSVM_Value thisArg = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, argv, &thisArg, nullptr);

    uint32_t arrayLen = 0;
    JSVM_CALL(env, OH_JSVM_GetArrayLength(env, argv[1], &arrayLen));
    if (arrayLen <= 0 || arrayLen > std::numeric_limits<uint32_t>::max() / sizeof(JSVM_Value)) {
        OH_JSVM_ThrowError(env, nullptr, "Invalid array length.");
        return nullptr;
    } else {
        JSVM_Value *args = new JSVM_Value[arrayLen];
        for (auto i = 0; i < arrayLen; i++) {
            JSVM_CALL(env, OH_JSVM_GetElement(env, argv[1], i, &args[i]));
        }
        JSVM_Value js_string;
        JSVM_CALL(env, OH_JSVM_CoerceToString(env, argv[0], &js_string));
        size_t length = 0;
        JSVM_CALL(env, OH_JSVM_GetValueStringUtf8(env, js_string, NULL, 0, &length));
        size_t capacity = length + 1;
        char *buffer = new char[capacity];
        size_t copyLength = 0;
        JSVM_CALL(env, OH_JSVM_GetValueStringUtf8(env, js_string, buffer, capacity, &copyLength));

        JSVM_Value func = nullptr;
        JSVM_CALL(env, OH_JSVM_CreateFunctionWithScript(env, buffer, JSVM_AUTO_LENGTH, arrayLen,
				                        args, argv[ argc - 1 ], &func));
        return func;
    }
}

static JSVM_Value GetHeapStatistics(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_VM testVm;
    OH_JSVM_GetVM(env, &testVm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(testVm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    OH_JSVM_CreateInt64(env, result.numberOfNativeContexts, &nativeContextsCnt);
    return nativeContextsCnt;
}

static JSVM_Value GetVM(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM testVm;
    JSVM_Status status = OH_JSVM_GetVM(env, &testVm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Test JSVM OH_JSVM_GetVM failed");
    }
    JSVM_Value result;
    OH_JSVM_GetBoolean(env, true, &result);
    return result;
}

static JSVM_Value GetTypeof(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, args[0], &valueType);
    JSVM_Value type = nullptr;
    switch (valueType) {
        case JSVM_UNDEFINED:
            OH_JSVM_CreateStringUtf8(env, "undefined", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_NULL:
            OH_JSVM_CreateStringUtf8(env, "null", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_BOOLEAN:
            OH_JSVM_CreateStringUtf8(env, "boolean", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_NUMBER:
            OH_JSVM_CreateStringUtf8(env, "number", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_STRING:
            OH_JSVM_CreateStringUtf8(env, "string", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_OBJECT:
            OH_JSVM_CreateStringUtf8(env, "object", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_FUNCTION:
            OH_JSVM_CreateStringUtf8(env, "function", JSVM_AUTO_LENGTH, &type);
            break;
        case JSVM_BIGINT:
            OH_JSVM_CreateStringUtf8(env, "bigint", JSVM_AUTO_LENGTH, &type);
            break;
        default:
            OH_JSVM_CreateStringUtf8(env, " ", NAPI_AUTO_LENGTH, &type);
            break;
    }
    return type;
}

static JSVM_Value InstanceOf(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_Instanceof(env, args[0], args[1], &result);
    JSVM_Value returnValue = nullptr;
    OH_JSVM_GetBoolean(env, result, &returnValue);
    return returnValue;
}

static JSVM_Value IsArray(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_IsArray(env, args[0], &result);
    JSVM_Value returnValue = nullptr;
    OH_JSVM_GetBoolean(env, result, &returnValue);
    return returnValue;
}

static JSVM_Value IsArrayBuffer(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool isArrayBuffer = false;
    JSVM_Status status = OH_JSVM_IsArraybuffer(env, args[0], &isArrayBuffer);
    if (status != JSVM_OK) {
        return nullptr;
    }
    JSVM_Value boolean = nullptr;
    OH_JSVM_GetBoolean(env, isArrayBuffer, &boolean);
    return boolean;
}

static JSVM_Value IsTypedarray(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_IsTypedarray(env, args[0], &result);
    JSVM_Value isTypedArray = nullptr;
    OH_JSVM_GetBoolean(env, result, &isTypedArray);
    return isTypedArray;
}

static JSVM_Value IsDataView(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_IsDataview(env, args[0], &result);
    JSVM_Value isDateView = nullptr;
    OH_JSVM_GetBoolean(env, result, &isDateView);
    return isDateView;
}

static JSVM_Value IsStrictEquals(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_StrictEquals(env, args[0], args[1], &result);
    JSVM_Value isStrictEqual = nullptr;
    OH_JSVM_GetBoolean(env, result, &isStrictEqual);
    return isStrictEqual;
}

static JSVM_Value DetachArraybuffer(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "arraybuffer");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    OH_JSVM_DetachArraybuffer(env, args[0]);
    return args[0];
}

static JSVM_Value IsDetachedArraybuffer(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "arraybuffer");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    OH_JSVM_DetachArraybuffer(env, args[0]);
    bool result = false;
    OH_JSVM_IsDetachedArraybuffer(env, args[0], &result);
    JSVM_Value isDetached = nullptr;
    OH_JSVM_GetBoolean(env, result, &isDetached);
    return isDetached;
}

static JSVM_Value IsRegExp(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_IsRegExp(env, args[0], &result);
    JSVM_Value isRegExp = nullptr;
    OH_JSVM_GetBoolean(env, result, &isRegExp);
    return isRegExp;
}

static JSVM_Value CoerceToBigInt(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value bigInt;
    OH_JSVM_GetUndefined(env, &bigInt);
    JSVM_Status status = OH_JSVM_CoerceToBigInt(env, args[0], &bigInt);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to coerce to bigint");
    }
    return bigInt;
}

static JSVM_Value CoerceToNumber(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value number = nullptr;
    OH_JSVM_CoerceToNumber(env, args[0], &number);
    return number;
}

static JSVM_Value CoerceToObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "object");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value obj = nullptr;
    JSVM_Status status = OH_JSVM_CoerceToObject(env, args[0], &obj);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "JSVM OH_JSVM_CoerceToObject fail");
    }
    bool isCoerce = true;
    JSVM_Value result;
    OH_JSVM_GetBoolean(env, isCoerce, &result);
    return result;
}

static JSVM_Value CoerceToString(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value str = nullptr;
    OH_JSVM_CoerceToString(env, args[0], &str);
    return str;
}

static JSVM_Value CoerceToBool(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value boolean = nullptr;
    OH_JSVM_CoerceToBool(env, args[0], &boolean);
    return boolean;
}

static JSVM_Value IsPromise(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool isPromise = false;
    OH_JSVM_IsPromise(env, args[0], &isPromise);
    JSVM_Value result = nullptr;
    OH_JSVM_GetBoolean(env, isPromise, &result);
    return result;
}

static JSVM_Value CreatePromise(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Deferred defer;
    JSVM_Value promise = nullptr;
    OH_JSVM_CreatePromise(env, &defer, &promise);
    bool isPromise = false;
    JSVM_Value returnIsPromise = nullptr;
    OH_JSVM_IsPromise(env, promise, &isPromise);
    OH_JSVM_GetBoolean(env, isPromise, &returnIsPromise);
    return returnIsPromise;
}

static JSVM_Value ResolveRejectDeferred(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = DIFF_VALUE_THREE;
    JSVM_Value args[3] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool status = false;
    OH_JSVM_GetValueBool(env, args[DIFF_VALUE_TWO], &status);

    JSVM_Deferred deferred = nullptr;
    JSVM_Value promise = nullptr;
    JSVM_Status createStatus = OH_JSVM_CreatePromise(env, &deferred, &promise);
    if (createStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Create promise failed");
    }
    if (status) {
        OH_JSVM_ResolveDeferred(env, deferred, args[0]);
    } else {
        OH_JSVM_RejectDeferred(env, deferred, args[1]);
    }
    JSVM_Value result = nullptr;
    OH_JSVM_GetBoolean(env, true, &result);
    return result;
}

static JSVM_Value GetCbArgs(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    return args[0];
}

static JSVM_Value NewInstance(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    JSVM_Value result = nullptr;
    OH_JSVM_NewInstance(env, args[0], 1, &args[1], &result);
    return result;
}

#define NUMBERINT_FOUR 4
static const JSVM_TypeTag TagsData[NUMBERINT_FOUR] = {
    {0x9e4b2449547061b3, 0x33999f8a6516c499},
    {0x1d55a794c53a726d, 0x43633f509f9c944e},
    {0, 0},
    {0x6a971439f5b2e5d7, 0x531dc28a7e5317c0},
};

static JSVM_Value SetTypeTagToObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t index = 0;
    OH_JSVM_GetValueInt32(env, args[1], &index);

    JSVM_Status status = OH_JSVM_TypeTagObject(env, args[0], &TagsData[index]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, "Reconnect error", "OH_JSVM_TypeTagObject failed");
    }
    JSVM_Value result = nullptr;
    OH_JSVM_GetBoolean(env, true, &result);
    return result;
}

static JSVM_Value CheckObjectTypeTag(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t index = 0;
    OH_JSVM_GetValueInt32(env, args[1], &index);
    bool checkResult = false;
    OH_JSVM_CheckObjectTypeTag(env, args[0], &TagsData[index], &checkResult);
    JSVM_Value checked = nullptr;
    OH_JSVM_GetBoolean(env, checkResult, &checked);
    return checked;
}

static const int64_t MEMORY_SIZE = 1024;
static JSVM_Value AdjustExternalMemory(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t change = MEMORY_SIZE * MEMORY_SIZE;
    int64_t adjustedValue;
    OH_JSVM_AdjustExternalMemory(env, change, &adjustedValue);
    JSVM_Value checked = nullptr;
    OH_JSVM_GetBoolean(env, true, &checked);
    return checked;
}

static JSVM_Value MemoryPressureNotification(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    OH_JSVM_MemoryPressureNotification(env, JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL);
    JSVM_Value level = nullptr;
    OH_JSVM_CreateInt32(env, 0, &level);
    return level;
}

static JSVM_Value JsVmThrow(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
    JSVM_Value errorMessage = nullptr;
    OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
    JSVM_Value error = nullptr;
    OH_JSVM_CreateError(env, errorCode, errorMessage, &error);
    OH_JSVM_Throw(env, error);
    return nullptr;
}

static JSVM_Value JsVmThrowFromJS(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    JSVM_Value jsError = argv[0];
    bool result = false;
    OH_JSVM_IsError(env, jsError, &result);
    if (!result) {
        JSVM_Value errorCode;
        OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
        JSVM_Value errorMessage;
        OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
        OH_JSVM_CreateError(env, errorCode, errorMessage, &jsError);
    }
    OH_JSVM_Throw(env, jsError);
    return nullptr;
}

static JSVM_Value JsVmThrowError(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    if (argc == 0) {
        OH_JSVM_ThrowError(env, "-1", "has Error");
    } else if (argc == 1) {
        size_t length;
        OH_JSVM_GetValueStringUtf8(env, argv[0], nullptr, 0, &length);
        char *buffer = new char[length + 1];
        OH_JSVM_GetValueStringUtf8(env, argv[0], buffer, length + 1, nullptr);
        OH_JSVM_ThrowError(env, nullptr, buffer);
        delete[] buffer;
    }
    return nullptr;
}

static JSVM_Value JsVmThrowTypeError(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    if (argc == 0) {
        OH_JSVM_ThrowTypeError(env, "-1", "throwing type error");
    } else if (argc == 1) {
        size_t length;
        OH_JSVM_GetValueStringUtf8(env, argv[0], nullptr, 0, &length);
        char *buffer = new char[length + 1];
        OH_JSVM_GetValueStringUtf8(env, argv[0], buffer, length + 1, nullptr);
        OH_JSVM_ThrowTypeError(env, nullptr, buffer);
        delete[] buffer;
    }
    return nullptr;
}

static JSVM_Value JsVmThrowRangeError(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value argv[2];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    if (argc != DIFF_VALUE_TWO) {
        OH_JSVM_ThrowRangeError(env, "OH_JSVM_ThrowRangeError", "Expected two numbers as arguments");
    }
    JSVM_Value result;
    OH_JSVM_GetBoolean(env, true, &result);
    return result;
}

static JSVM_Value JsVmThrowSyntaxError(JSVM_Env env, JSVM_CallbackInfo info)
{
    OH_JSVM_ThrowSyntaxError(env, "JsVmThrowSyntaxError", "throw syntax error");
    return nullptr;
}

static JSVM_Value JsVmIsError(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    bool result = false;
    OH_JSVM_IsError(env, args[0], &result);
    JSVM_Value returnValue;
    OH_JSVM_GetBoolean(env, result, &returnValue);
    return returnValue;
}

static JSVM_Value JsVmCreateError(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value errorCode;

    OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
    JSVM_Value errorMessage;
    OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
    JSVM_Value result;
    OH_JSVM_CreateError(env, errorCode, errorMessage, &result);
    return result;
}

static JSVM_Value JsVmCreateTypeError(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value errorCode;
    OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
    JSVM_Value errorMessage;
    OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
    JSVM_Value result;
    OH_JSVM_CreateTypeError(env, errorCode, errorMessage, &result);
    return result;
}

static JSVM_Value JsVmCreateRangeError(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value errorCode;
    OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
    JSVM_Value errorMessage;
    OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
    JSVM_Value result;
    OH_JSVM_CreateRangeError(env, errorCode, errorMessage, &result);
    return result;
}

static JSVM_Value JsVmCreateSyntaxError(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value errorCode;
    OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
    JSVM_Value errorMessage;
    OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
    JSVM_Value result;
    OH_JSVM_CreateSyntaxError(env, errorCode, errorMessage, &result);
    return result;
}

static JSVM_Value JsVmGetAndClearLastException(JSVM_Env env, JSVM_CallbackInfo info)
{
    OH_JSVM_ThrowError(env, "OH_JSVM_ThrowError", "OH_JSVM_ThrowError");
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetAndClearLastException(env, &result);
    if (status != JSVM_OK) {
        return nullptr;
    }
    return result;
}

static JSVM_Value JsVmIsExceptionPending(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status;
    bool isExceptionPending = false;
    OH_JSVM_ThrowError(env, "OH_JSVM_ThrowError", "OH_JSVM_ThrowError");
    status = OH_JSVM_IsExceptionPending(env, &isExceptionPending);
    if (status != JSVM_OK) {
        return nullptr;
    }
    if (isExceptionPending) {
        JSVM_Value result = nullptr;
        status = OH_JSVM_GetAndClearLastException(env, &result);
        if (status != JSVM_OK) {
            return nullptr;
        }
        return result;
    }
    return nullptr;
}

static JSVM_Value JsVmGetLastErrorInfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    int32_t value = 0;
    JSVM_Status status = OH_JSVM_GetValueInt32(env, args[0], &value);
    JSVM_ASSERT(env, status != JSVM_Status::JSVM_OK, "FAILED to produce error condition");
    const JSVM_ExtendedErrorInfo *errorInfo;
    OH_JSVM_GetLastErrorInfo(env, &errorInfo);
    JSVM_Value result;
    OH_JSVM_CreateInt32(env, DIFF_VALUE_NOE, &result);
    return result;
}

struct Object {
    char name[DIFF_VALUE_SIX];
    int32_t age;
};

struct Object *g_obj = (struct Object *)malloc(sizeof(struct Object));

static void DerekItem(JSVM_Env env, void *data, void *hint)
{
    (void)hint;
}

static JSVM_Value WrapObject(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");

    strcpy_s(g_obj->name, sizeof(g_obj->name), "lilei");
    g_obj->age = METHOD_NUM;
    size_t argc = 1;
    JSVM_Value toWrap = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, &toWrap, nullptr, nullptr);
    OH_JSVM_Wrap(env, toWrap, reinterpret_cast<void *>(g_obj), DerekItem, nullptr, nullptr);
    struct Object *data;
    struct Object *data1;
    OH_JSVM_Unwrap(env, toWrap, reinterpret_cast<void **>(&data));
    OH_JSVM_RemoveWrap(env, toWrap, reinterpret_cast<void **>(&g_obj));
    OH_JSVM_Unwrap(env, toWrap, reinterpret_cast<void **>(&data1));
    JSVM_Value checked = nullptr;
    OH_JSVM_GetBoolean(env, true, &checked);
    return checked;
}

static JSVM_Value RemoveWrap(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value wrapped = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, &wrapped, nullptr, nullptr);
    void *data;
    OH_JSVM_RemoveWrap(env, wrapped, &data);
    JSVM_Value checked = nullptr;
    OH_JSVM_GetBoolean(env, true, &checked);
    return checked;
}

static JSVM_Value HandleScopeFor(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value checked = nullptr;
    for (int i = 0; i < SCOPE_FOR_NUMBER; i++) {
        JSVM_HandleScope scope = nullptr;
        OH_JSVM_OpenHandleScope(env, &scope);
        if (scope == nullptr) {
            OH_JSVM_GetBoolean(env, false, &checked);
            return checked;
        }
        JSVM_Value res = nullptr;
        OH_JSVM_CreateObject(env, &res);
        OH_JSVM_CloseHandleScope(env, scope);
    }
    OH_JSVM_GetBoolean(env, true, &checked);
    return checked;
}


struct DefineObject {
    char name[DIFF_VALUE_SIX];
    JSVM_Ref wrapper_;
};
static thread_local JSVM_Ref g_ref = nullptr;
struct DefineObject *g_defineObject = (struct DefineObject *)malloc(sizeof(struct DefineObject));
JSVM_Value New(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "Class");
    JSVM_Value newTarget;
    OH_JSVM_GetNewTarget(env, info, &newTarget);
    if (newTarget != nullptr) {
        size_t argc = 1;
        JSVM_Value args[1];
        JSVM_Value jsThis;
        OH_JSVM_GetCbInfo(env, info, &argc, args, &jsThis, nullptr);
        double value = 0.0;
        JSVM_ValueType valuetype;
        OH_JSVM_Typeof(env, args[0], &valuetype);
        if (valuetype != JSVM_UNDEFINED) {
            OH_JSVM_GetValueDouble(env, args[0], &value);
        }

        strcpy_s(g_defineObject->name, sizeof(g_defineObject->name), "lilei");
        return nullptr;
    } else {
        size_t argc = 1;
        JSVM_Value args[1];
        OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
        JSVM_Value cons;
        OH_JSVM_GetReferenceValue(env, g_ref, &cons);
        JSVM_Value instance;
        OH_JSVM_NewInstance(env, cons, argc, args, &instance);
        return instance;
    }
}

napi_value GetObj(napi_env env)
{
    size_t strLen = sizeof("{\"name\": \"") - 1 + strlen(g_defineObject->name) + sizeof("\"}") - 1;
    char *str = (char *)malloc(strLen + 1);
    if (str == nullptr) {
        printf("Memory allocation failed!\n");
        return nullptr;
    }
    int result = sprintf_s(str, strLen + 1, "{\"name\": \"%s\"}", g_defineObject->name);
    if (result < 0 || result >= strLen + 1) {
        return nullptr;
    }
    napi_value jsResult;
    napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &jsResult);
    return jsResult;
}

JSVM_Value DefineClass(JSVM_Env env, JSVM_Value exports)
{
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value { return New(env, info); };
    JSVM_Value cons;
    OH_JSVM_DefineClass(env, "MyObject", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &cons);
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, cons, 0, nullptr, &instanceValue);
    return nullptr;
}

static JSVM_Value PrintHello(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value output;
    OH_JSVM_CreateStringUtf8(env, "Hello world!", JSVM_AUTO_LENGTH, &output);
    return output;
}
static JSVM_CallbackStruct helloCb = { PrintHello, nullptr };
static intptr_t g_externalsSnapshot[] = {
    (intptr_t)&helloCb,
    0,
};

static JSVM_Value CreateSnapshotFailed(JSVM_Env oldEnv, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
    JSVM_VM vm;
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    OH_JSVM_CreateVM(&vmOptions, &vm);
    JSVM_Env env;
    JSVM_PropertyDescriptor descriptor[] = {
        {"printHello", nullptr, &helloCb, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, 1, descriptor, &env);
    const char *blobData = nullptr;
    size_t blobSize = 0;
    JSVM_Env envs[1] = {env};
    JSVM_Status status = OH_JSVM_CreateSnapshot(vm, 1, envs, &blobData, &blobSize);
    JSVM_Value error = nullptr;
    if (status != JSVM_OK) {
        OH_JSVM_CreateStringUtf8(oldEnv, "generic failure status.", JSVM_AUTO_LENGTH, &error);
        return error;
    }
    return nullptr;
}


static bool WriteDataToStream(const char *data, int size, void *streamData)
{
    FILE *file = (FILE *)streamData;
    if (data) {
        fwrite(data, sizeof(char), size, file);
    } else {
        fclose(file);
    }
    return true;
}

static void StartCpuProfiler(JSVM_VM vm, JSVM_CpuProfiler *cpuProfiler)
{
    FILE *startHeapFile = fopen("/data/storage/el2/base/files/heapsnapshot-start.heapsnapshot", "wb");
    if (startHeapFile == nullptr) {
        printf("Error opening file!\n");
        return;
    }
    OH_JSVM_TakeHeapSnapshot(vm, WriteDataToStream, startHeapFile);
    OH_JSVM_StartCpuProfiler(vm, cpuProfiler);
}

static void StopCpuProfiler(JSVM_VM vm, JSVM_CpuProfiler cpuProfiler)
{
    FILE *cpFile = fopen("/data/storage/el2/base/files/cpu-profile.cpuprofile", "wb");
    if (cpFile == nullptr) {
        printf("Error opening file!\n");
        return;
    }
    OH_JSVM_StopCpuProfiler(vm, cpuProfiler, WriteDataToStream, cpFile);
    FILE *stopHeapFile = fopen("/data/storage/el2/base/files/heapsnapshot-stop.heapsnapshot", "wb");
    if (stopHeapFile == nullptr) {
        printf("Error opening file!\n");
        return;
    }
    OH_JSVM_TakeHeapSnapshot(vm, WriteDataToStream, stopHeapFile);
}

static const char *SCRIPT_TO_DEBUG = R"JS(
function factorialRecursive(n) {
    if (n === 0 || n === 1) {
        return 1;
    } else {
        return n * factorialRecursive(n - 1);
    }
}

function calculateFactorial() {
    var number = 10;
    var result = factorialRecursive(number);
    return result;
}

calculateFactorial();
)JS";

static JSVM_Value DebugCodeUsingCpuProfiler(JSVM_Env oldEnv, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_VM testVm;
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&vmOptions, &testVm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(testVm, &vmScope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(testVm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);

    JSVM_CpuProfiler cpuProfiler;
    StartCpuProfiler(testVm, &cpuProfiler);

    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Value strValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, SCRIPT_TO_DEBUG, strlen(SCRIPT_TO_DEBUG), &strValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, strValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value result = nullptr;
    OH_JSVM_RunScript(env, script, &result);
    OH_JSVM_CloseHandleScope(env, handleScope);

    StopCpuProfiler(testVm, cpuProfiler);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseVMScope(testVm, vmScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_DestroyVM(testVm);

    JSVM_Value ret1 = nullptr;
    OH_JSVM_CreateInt32(oldEnv, 0, &ret1);
    return ret1;
}

static JSVM_Value TakeHeapSnapshot(JSVM_Env oldEnv, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_VM testVm;
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&vmOptions, &testVm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(testVm, &vmScope);

    FILE *file = fopen("/data/storage/el2/base/files/heapsnapshot-test.heapsnapshot", "wb");
    if (file == nullptr) {
        printf("Error opening file!\n");
        return nullptr;
    }
    OH_JSVM_TakeHeapSnapshot(testVm, WriteDataToStream, file);

    OH_JSVM_CloseVMScope(testVm, vmScope);
    OH_JSVM_DestroyVM(testVm);

    JSVM_Value result = nullptr;
    OH_JSVM_CreateInt32(oldEnv, 0, &result);
    return result;
}


static JSVM_Value WaitForDebuggerFailed(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
    JSVM_Value returnValue = nullptr;
    OH_JSVM_CreateObject(env, &returnValue);
    AddReturnedStatus(env, "nullptrEnv", returnValue, JSVM_Status::JSVM_INVALID_ARG,
        OH_JSVM_WaitForDebugger(nullptr, true));
    OH_JSVM_WaitForDebugger(env, true);
    AddLastStatus(env, "notConnected", returnValue);
    return returnValue;
}

static const int PORT = 9225;
static void OpenInspector(JSVM_Env env)
{
    OH_JSVM_OpenInspector(env, "localhost", PORT);
}
static void CloseInspector(JSVM_Env env)
{
    OH_JSVM_CloseInspector(env);
}

static JSVM_Value DebugCodeUsingInspector(JSVM_Env oldEnv, JSVM_CallbackInfo info)
{
    JSVM_VM testVm;
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&vmOptions, &testVm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(testVm, &vmScope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(testVm, 0, nullptr, &env);

    OpenInspector(env);

    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Value strValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, SCRIPT_TO_DEBUG, strlen(SCRIPT_TO_DEBUG), &strValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, strValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value result = nullptr;
    OH_JSVM_RunScript(env, script, &result);

    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    CloseInspector(env);
    OH_JSVM_CloseVMScope(testVm, vmScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_DestroyVM(testVm);

    strcpy_s(g_dataType, sizeof(g_dataType), "int");
    JSVM_Value ret1 = nullptr;
    OH_JSVM_CreateInt32(oldEnv, 0, &ret1);
    return ret1;
}

struct InstanceData {
    int32_t value;
};

void InstanceFinalizeCallback(JSVM_Env env, void *finalizeData, void *finalizeHint)
{
    if (finalizeData) {
        InstanceData *data = reinterpret_cast<InstanceData *>(finalizeData);
        free(data);
    }
}

// If yes, true is returned. If no, false is returned.
static JSVM_Value SetInstanceData(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1];
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    uint32_t instanceDataValue;
    OH_JSVM_GetValueUint32(env, argv[0], &instanceDataValue);
    InstanceData *instanceData = reinterpret_cast<InstanceData *>(malloc(sizeof(InstanceData)));
    if (instanceData == nullptr) {
        JSVM_Value result1;
        OH_JSVM_GetBoolean(env, false, &result1);
        return result1;
    }
    instanceData->value = instanceDataValue;
    JSVM_Status status = OH_JSVM_SetInstanceData(env, instanceData, InstanceFinalizeCallback, nullptr);
    bool setResult = status == JSVM_OK;
    JSVM_Value result;
    OH_JSVM_GetBoolean(env, setResult, &result);
    return result;
}

// If yes, true is returned. If no, false is returned.
static JSVM_Value GetInstanceData(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result;
    InstanceData *instanceData = reinterpret_cast<InstanceData *>(malloc(sizeof(InstanceData)));
    if (instanceData == nullptr) {
        OH_JSVM_GetBoolean(env, false, &result);
        return result;
    }
    instanceData->value = DIFF_VALUE_FIVE;
    OH_JSVM_SetInstanceData(env, instanceData, InstanceFinalizeCallback, nullptr);
    InstanceData *resData = nullptr;
    JSVM_Status stat1 = OH_JSVM_GetInstanceData(env, (void **)&resData);
    bool setResult = stat1 == JSVM_OK;
    if (setResult == false) {
        OH_JSVM_GetBoolean(env, setResult, &result);
        return result;
    }
    setResult = resData->value == DIFF_VALUE_FIVE;
    if (setResult == false) {
        OH_JSVM_GetBoolean(env, setResult, &result);
        return result;
    }
    InstanceData *resData2 = nullptr;
    OH_JSVM_GetInstanceData(env, (void **)&resData2);
    setResult = resData2 == resData;
    OH_JSVM_GetBoolean(env, setResult, &result);
    return result;
}

static JSVM_Value IsCallable(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value value;
    JSVM_Value rst;
    size_t argc = 1;
    bool isCallable = false;
    JSVM_CALL(env, OH_JSVM_GetCbInfo(env, info, &argc, &value, NULL, NULL));
    JSVM_CALL(env, OH_JSVM_IsCallable(env, value, &isCallable));
    OH_JSVM_GetBoolean(env, isCallable, &rst);
    return rst;
}

static napi_value testIsCallable(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_CallbackStruct param[] = {{.callback = IsCallable, .data = nullptr}};
    JSVM_PropertyDescriptor descriptor[] = {{"isCallable", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT}};
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    const char* sourcecodestr = R"JS(
      function add() { return 0;} let rst = isCallable(add);
    )JS";
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

void Thread1Func(JSVM_VM vm, JSVM_Env env)
{
    bool isLocked = false;
    OH_JSVM_IsLocked(env, &isLocked);
    if (!isLocked) {
        OH_JSVM_AcquireLock(env);
        g_threadFlag1 = false;
    }
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 32, &value); // 32: numerical value
    int32_t num1;
    OH_JSVM_GetValueInt32(env, value, &num1);
    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_IsLocked(env, &isLocked);
    if (isLocked) {
        OH_JSVM_ReleaseLock(env);
        g_threadFlag1 = true;
    }
}

void Thread2Func(JSVM_VM vm, JSVM_Env env)
{
    bool isLocked = false;
    OH_JSVM_IsLocked(env, &isLocked);
    if (!isLocked) {
        OH_JSVM_AcquireLock(env);
        g_threadFlag2 = false;
    }
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 32, &value); // 32: numerical value
    int32_t num1;
    OH_JSVM_GetValueInt32(env, value, &num1);
    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_IsLocked(env, &isLocked);
    if (isLocked) {
        OH_JSVM_ReleaseLock(env);
        g_threadFlag2 = true;
    }
}

static napi_value testMultithreadFunction(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    Thread1Func(vm, env);
    Thread2Func(vm, env);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    if (g_threadFlag1 && g_threadFlag2) {
        NAPI_CALL(env1, napi_create_int32(env1, 1, &result11));
    } else {
        NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    }
    return result11;
}

static const char *STR_TASK = R"JS(
WebAssembly.instantiate(new Uint8Array([0, 97, 115, 109, 1, 0, 0, 0, 1, 8, 2, 96, 1, 127, 0, 96, 0, 0, 2, 8, 1, 2, 106,
115, 1, 95, 0, 0, 3, 2, 1, 1, 8, 1, 1, 10, 9, 1, 7, 0, 65, 185, 10, 16, 0, 11]),
{js:{_:console.log("JSVM: Called from WebAssembly Hello world")}}).then(function(obj)
{
    console.log("Called with instance " + obj);
}).catch(function(err) {
    console.log("Called with error " + err);
});
)JS";

static napi_value testHandleMicrotasks(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value sourcecodevalue;
    OH_JSVM_CreateStringUtf8(env, STR_TASK, strlen(STR_TASK), &sourcecodevalue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourcecodevalue, nullptr, 0, true, nullptr, &script);
    JSVM_Value result;
    OH_JSVM_RunScript(env, script, &result);
    bool rst = false;
    for (int i = 0; i < 3; i++) { // 3: cycles
        JSVM_Status flag1 = OH_JSVM_PumpMessageLoop(vm, &rst);
        JSVM_Status flag2 = OH_JSVM_PerformMicrotaskCheckpoint(vm);
        if (rst && flag1 == JSVM_Status::JSVM_OK && flag2 == JSVM_Status::JSVM_OK) {
            sleep(3);
            break;
        }
    }
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    bool rstLast = true;
    NAPI_CALL(env1, napi_get_boolean(env1, rstLast, &result11));
    return result11;
}

static const char *SRC_TEST = R"JS(
!function(e){var t={};function n(r){if(t[r])return t[r].exports;var o=t[r]={i:r,l:!1,exports:{}};
return e[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}n.m=e,n.c=t,n.d=function(e,t,r)
{n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})},n.r=function(e)
{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),
Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;
if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var r=Object.create(null);
if(n.r(r),Object.defineProperty(r,"default",
{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)n.d(r,o,function(t){return e[t]}.bind(null,o));
return r},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};
return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=0)}
([function(e,t,n){const r=n(1);try{const e=r.divide(10,0);print(e)}catch(e){print(e.message),print(e.stack)}},
function(e,t){e.exports={divide:function(e,t){if(0===t)throw new Error("Cannot divide by zero");return e/t}}}]);
)JS";

static napi_value testJswmInterface(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    JSVM_Value jsSrc;
    OH_JSVM_CreateStringUtf8(env, SRC_TEST, strlen(SRC_TEST), &jsSrc);
    const uint8_t *data = nullptr;
    size_t length = 0;
    bool cacheRejected = false;
    bool rstFlag = false;
    JSVM_Script script;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "/data/bundle.js.map/bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_Status status = OH_JSVM_CompileScriptWithOrigin(env, jsSrc, data, length,
                                                         true, &cacheRejected, &scriptOrgin, &script);
    if (status == JSVM_Status::JSVM_OK) {
        rstFlag = true;
    }
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_get_boolean(env1, rstFlag, &result11));
    return result11;
}

static JSVM_Value IsConstructor(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    bool result = false;
    OH_JSVM_IsConstructor(env, args[0], &result);

    JSVM_Value isConstructor = nullptr;
    OH_JSVM_GetBoolean(env, result, &isConstructor);
    return isConstructor;
}
static JSVM_Value CreateRegExp1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, args[0], JSVM_RegExpFlags::JSVM_REGEXP_IGNORE_CASE, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create regexp");
    }
    return returnValue;
}
static JSVM_Value CreateRegExp2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, args[0], JSVM_RegExpFlags::JSVM_REGEXP_GLOBAL, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create regexp");
    }
    return returnValue;
}
static JSVM_Value CreateRegExp3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, args[0], JSVM_RegExpFlags::JSVM_REGEXP_MULTILINE, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create regexp");
    }
    return returnValue;
}
static JSVM_Value CreateRegExp4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, args[0], JSVM_RegExpFlags::JSVM_REGEXP_STICKY, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create regexp");
    }
    return returnValue;
}
static JSVM_Value CreateRegExp5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, args[0], JSVM_RegExpFlags::JSVM_REGEXP_DOT_ALL, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create regexp");
    }
    return returnValue;
}
static JSVM_Value CreateRegExpEnvNullptr(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(nullptr, args[0], JSVM_RegExpFlags::JSVM_REGEXP_DOT_ALL, &returnValue);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateInt32(env, static_cast<int32_t>(status), &value);
    return value;
}
static JSVM_Value CreateMap(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateMap(env, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "Failed to create map");
    }
    return returnValue;
}

bool testCompileScriptWithOptions(JSVM_Env env)
{
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    std::string src(R"JS(let a = 100;a = a + 21)JS");
    uint8_t *cache;
    size_t length;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_EAGER_COMPILE }
    };
    option[1] = {
        .id = JSVM_COMPILE_SCRIPT_ORIGIN,
        .content = { &scriptOrgin }
    };
    bool rstFlag = false;
    OH_JSVM_CreateStringUtf8(env, src.c_str(), src.size(), &jsSrc);
    rstFlag = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script) == JSVM_OK;
    OH_JSVM_CreateCodeCache(env, script, (const uint8_t**)&cache, &length);
    return rstFlag;
}
static napi_value testCompileWithOption(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    bool rstFlag = false;
    rstFlag = testCompileScriptWithOptions(env);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_get_boolean(env1, rstFlag, &result11));
    return result11;
}

static napi_value testRetainScript(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    bool result = true;
    JSVM_Script script = nullptr;
    JSVM_HandleScope handlescopeSub;
    OH_JSVM_OpenHandleScope(env, &handlescopeSub);
    std::string src(R"JS(let a = 100;a = a + 21)JS");

    JSVM_Value jsSrc;
    OH_JSVM_CreateStringUtf8(env, src.c_str(), src.size(), &jsSrc);
    OH_JSVM_CompileScriptWithOptions(env, jsSrc, 0, nullptr, &script);
    result = result && OH_JSVM_RetainScript(env, script) == JSVM_OK;
    OH_JSVM_CloseHandleScope(env, handlescopeSub);
    JSVM_Value returnValue;
    auto runStatus = OH_JSVM_RunScript(env, script, &returnValue) == JSVM_OK;
    OH_JSVM_ReleaseScript(env, script);
    int runResult = 0;
    OH_JSVM_GetValueInt32(env, returnValue, &runResult);
    result = runStatus && runResult == RUN_TEST_RETAIN_SCRIPT_VALUE;
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_get_boolean(env1, result, &result11));
    return result11;
}

static napi_value testOpenInspectorWithName(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }

    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);

    OH_JSVM_OpenInspectorWithName(env, -1, "test");
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Value strValue = nullptr;
    std::string src(R"JS(let a = 100;a = a + 21)JS");
    OH_JSVM_CreateStringUtf8(env, src.c_str(), src.size(), &strValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, strValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value result = nullptr;
    OH_JSVM_RunScript(env, script, &result);
    int runResult = 0;
    OH_JSVM_GetValueInt32(env, result, &runResult);
    auto resultFlag = runResult == RUN_TEST_RETAIN_SCRIPT_VALUE;
    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseInspector(env);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_get_boolean(env1, resultFlag, &result11));
    return result11;
}

void useArrayBuffer(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    void *backingStore;
    JSVM_Value arrayBuffer;
    JSVM_Status stat1 = OH_JSVM_AllocateArrayBufferBackingStoreData(100, JSVM_ZERO_INITIALIZED, &backingStore);
    NAPI_ASSERT_RETURN_VOID(env1, stat1 == JSVM_OK, "OH_JSVM_AllocateArrayBufferBackingStoreData check status");

    JSVM_Status stat2 = OH_JSVM_CreateArrayBufferFromBackingStoreData(env, backingStore, 100, 30, 20, &arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat2 == JSVM_OK, "OH_JSVM_CreateArrayBufferFromBackingStoreData check status");

    JSVM_Value js_global;
    JSVM_Value name;
    JSVM_Status stat3 = OH_JSVM_GetGlobal(env, &js_global);
    NAPI_ASSERT_RETURN_VOID(env1, stat3 == JSVM_OK, "OH_JSVM_GetGlobal check status");
    JSVM_Status stat4 = OH_JSVM_CreateStringUtf8(env, "buffer", JSVM_AUTO_LENGTH, &name);
    NAPI_ASSERT_RETURN_VOID(env1, stat4 == JSVM_OK, "OH_JSVM_CreateStringUtf8 check status");
    JSVM_Status stat5 = OH_JSVM_SetProperty(env, js_global, name, arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat5 == JSVM_OK, "OH_JSVM_SetProperty check status");

    JSVM_Script script;
    JSVM_Value scriptString;
    JSVM_Value result;
    const char *src = R"JS(
        function writeBuffer(data) {
            let view = new Uint8Array(data);
            // Write some values to the ArrayBuffer
	    for (let i = 0; i < view.length; i++) {
                view[i] = i % 256;
            }
        }
        writeBuffer(buffer)
    )JS";
    JSVM_Status stat6 = OH_JSVM_CreateStringUtf8(env, src, JSVM_AUTO_LENGTH, &scriptString);
    NAPI_ASSERT_RETURN_VOID(env1, stat6 == JSVM_OK, "OH_JSVM_CreateStringUtf8 check status");
    JSVM_Status stat7 = OH_JSVM_CompileScriptWithOptions(env, scriptString, 0, nullptr, &script);
    NAPI_ASSERT_RETURN_VOID(env1, stat7 == JSVM_OK, "OH_JSVM_CompileScriptWithOption check status");
    JSVM_Status stat8 = OH_JSVM_RunScript(env, script, &result);
    NAPI_ASSERT_RETURN_VOID(env1, stat8 == JSVM_OK, "OH_JSVM_RunScript check status");

    uint8_t *array = static_cast<uint8_t*>(backingStore);
    for (auto i = 0; i < 100; ++i) {
        if (array[i] != i % 25 % 256) {
            NAPI_ASSERT_RETURN_VOID(env1, true, "OH_JSVM_RunScript check status");
        }
    }

    JSVM_Status stat9 = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat9 == JSVM_OK, "OH_JSVM_DetachArraybuffer check status");

    JSVM_Status stat10 = OH_JSVM_FreeArrayBufferBackingStoreData(backingStore);
    NAPI_ASSERT_RETURN_VOID(env1, stat10 == JSVM_OK, "OH_JSVM_FreeArrayBufferBackingStoreData check status");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

static napi_value testArrayBuffer(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    useArrayBuffer(env, env1);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

void useArrayBuffer2(JSVM_Env env, napi_env env1)
{
    void *storeData = nullptr;
    size_t storeLen = SIXTEEN;
    JSVM_Status stat1 = OH_JSVM_AllocateArrayBufferBackingStoreData(storeLen, JSVM_ZERO_INITIALIZED, &storeData);
    NAPI_ASSERT_RETURN_VOID(env1, stat1 == JSVM_OK, "OH_JSVM_AllocateArrayBufferBackingStoreData check status");
    
    JSVM_Value arrayBuffer;
    JSVM_Status stat2 = OH_JSVM_CreateArrayBufferFromBackingStoreData(env, storeData, storeLen, 0, storeLen, &arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat2 == JSVM_OK, "OH_JSVM_CreateArrayBufferFromBackingStoreData check status");
    
    void *tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLen = 0;
    JSVM_Status stat3 = OH_JSVM_GetArraybufferInfo(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLen);
    NAPI_ASSERT_RETURN_VOID(env1, stat3 == JSVM_OK, "OH_JSVM_GetArraybufferInfo check status");
    
    size_t typedArrayLen = arrayBufferLen / sizeof(int32_t);
    JSVM_Value typedArray;
    JSVM_Status stat4 = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, typedArrayLen,
                                                 arrayBuffer, 0, &typedArray);
    NAPI_ASSERT_RETURN_VOID(env1, stat4 == JSVM_OK, "OH_JSVM_CreateTypedarray check status");
    
    JSVM_Status stat5 = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat5 == JSVM_OK, "OH_JSVM_DetachArraybuffer check status");
    
    JSVM_Status stat6 = OH_JSVM_FreeArrayBufferBackingStoreData(storeData);
    NAPI_ASSERT_RETURN_VOID(env1, stat6 == JSVM_OK, "OH_JSVM_FreeArrayBufferBackingStoreData check status");
}
static napi_value testArrayBuffer2(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

	useArrayBuffer2(env, env1);

    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

void useArrayBuffer3(JSVM_Env env, napi_env env1)
{
    void *storeData = nullptr;
    size_t storeLen = SIXTEEN;
    JSVM_Status stat1 = OH_JSVM_AllocateArrayBufferBackingStoreData(storeLen, JSVM_ZERO_INITIALIZED, &storeData);
    NAPI_ASSERT_RETURN_VOID(env1, stat1 == JSVM_OK, "OH_JSVM_AllocateArrayBufferBackingStoreData check status");
 
    JSVM_Value arrayBuffer;
    JSVM_Status stat2 = OH_JSVM_CreateArrayBufferFromBackingStoreData(env, storeData, storeLen, 0, storeLen, &arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat2 == JSVM_OK, "OH_JSVM_CreateArrayBufferFromBackingStoreData check status");
 
    void *tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLen = 0;
    JSVM_Status stat3 = OH_JSVM_GetArraybufferInfo(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLen);
    NAPI_ASSERT_RETURN_VOID(env1, stat3 == JSVM_OK, "OH_JSVM_GetArraybufferInfo check status");
 
    size_t typedArrayLen = arrayBufferLen / sizeof(int32_t);
 
    JSVM_Value typedArray;
    JSVM_Status stat4 = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, typedArrayLen, arrayBuffer, 0, &typedArray);
    NAPI_ASSERT_RETURN_VOID(env1, stat4 == JSVM_OK, "OH_JSVM_CreateTypedarray check status");
 
    JSVM_Status stat5 = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    NAPI_ASSERT_RETURN_VOID(env1, stat5 == JSVM_OK, "OH_JSVM_DetachArraybuffer check status");
 
    JSVM_Value arrayBuffer2;
    JSVM_Status stat6 = OH_JSVM_CreateArrayBufferFromBackingStoreData(env, storeData, storeLen, 0, storeLen, &arrayBuffer2);
    NAPI_ASSERT_RETURN_VOID(env1, stat6 == JSVM_OK, "OH_JSVM_CreateArrayBufferFromBackingStoreData check status");
    JSVM_Status stat7 = OH_JSVM_DetachArraybuffer(env, arrayBuffer2);
    NAPI_ASSERT_RETURN_VOID(env1, stat7 == JSVM_OK, "OH_JSVM_DetachArraybuffer check status");
 
    JSVM_Status stat8 = OH_JSVM_FreeArrayBufferBackingStoreData(storeData);
    NAPI_ASSERT_RETURN_VOID(env1, stat8 == JSVM_OK, "OH_JSVM_FreeArrayBufferBackingStoreData check status");
}
static napi_value testArrayBuffer3(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

	useArrayBuffer3(env, env1);

    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

void test_CompileWasmModule(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Value wasmModule;
    JSVM_Status status = OH_JSVM_CompileWasmModule(env, nullptr, 0, nullptr, 0, nullptr, &wasmModule);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "OH_JSVM_CompileWasmModule check status");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void test_CompileWasmFunctionNULL(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Status status = OH_JSVM_CompileWasmFunction(env, nullptr, 0, JSVM_WASM_OPT_BASELINE);
    NAPI_ASSERT_RETURN_VOID(env1, status == JSVM_INVALID_ARG, "OH_JSVM_CompileWasmFunction check status");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void test_IsWasmModuleValueisNULL(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    bool result = false;
    JSVM_Status status = OH_JSVM_IsWasmModuleObject(env, nullptr, &result);
    NAPI_ASSERT_RETURN_VOID(env1, status == JSVM_INVALID_ARG, "OH_JSVM_IsWasmModuleObject check status");
    NAPI_ASSERT_RETURN_VOID(env1, result == false, "OH_JSVM_IsWasmModuleObject check result");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void test_CreateWarmCache_wasmmodule_is_null(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    const uint8_t *cacheData = nullptr;
    size_t cacheLength = 0;
    JSVM_Value wasmModule = nullptr;
    JSVM_Status status = OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheLength);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "OH_JSVM_CreateWarmCache check status not ok 1");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void test_CreateWarmCache_wasmmodule_is_not_wasmmodule(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    const uint8_t *cacheData = nullptr;
    size_t cacheLength = 0;
    JSVM_Value wasmModule;
    OH_JSVM_CreateSet(env, &wasmModule);
    JSVM_Status status = OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheLength);
    NAPI_ASSERT_RETURN_VOID(env1, status != JSVM_OK, "OH_JSVM_CreateWarmCache check status not ok 2");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

void test_ReleaseCache_cachedata_is_null(JSVM_Env env, napi_env env1)
{
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);

    JSVM_Status status = OH_JSVM_ReleaseCache(env, nullptr, JSVM_CACHE_TYPE_JS);
    NAPI_ASSERT_RETURN_VOID(env1, status == JSVM_INVALID_ARG, "OH_JSVM_CreateWarmCache check status is invalid_arg");

    OH_JSVM_CloseHandleScope(env, handleScope);
}

static napi_value testWasmOperator(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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
#if !defined(JSVM_JITLESS)
    test_CompileWasmModule(env, env1);
    test_CompileWasmFunctionNULL(env, env1);
    test_CreateWarmCache_wasmmodule_is_null(env, env1);
    test_CreateWarmCache_wasmmodule_is_not_wasmmodule(env, env1);
#endif
    test_IsWasmModuleValueisNULL(env, env1);
    test_ReleaseCache_cachedata_is_null(env, env1);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

void test_set_debug_option(JSVM_Env env)
{
    JSVM_HandleScope handleScope1, handleScope2, handleScope3;
    int num = 100;
    bool boolValue = false;
    JSVM_Value array1[num], array2[num], array3[num];
    OH_JSVM_SetDebugOption(env, JSVM_SCOPE_CHECK, true);
    OH_JSVM_OpenHandleScope(env, &handleScope1);
    for (int i = 0; i < num; i++) {
        OH_JSVM_GetBoolean(env, false, &array1[i]);
        OH_JSVM_IsBoolean(env, array1[i], &boolValue);
    }
    OH_JSVM_OpenHandleScope(env, &handleScope2);
    for (int i = 0; i < num; i++) {
        OH_JSVM_GetBoolean(env, false, &array2[i]);
        OH_JSVM_IsBoolean(env, array2[i], &boolValue);
    }
    OH_JSVM_OpenHandleScope(env, &handleScope3);
    for (int i = 0; i < num; i++) {
        OH_JSVM_GetBoolean(env, false, &array3[i]);
        OH_JSVM_IsBoolean(env, array3[i], &boolValue);
    }
    OH_JSVM_CloseHandleScope(env, handleScope3);
    OH_JSVM_CloseHandleScope(env, handleScope2);
    OH_JSVM_CloseHandleScope(env, handleScope1);
    OH_JSVM_SetDebugOption(env, JSVM_SCOPE_CHECK, false);
}

static napi_value testSetDebugOption(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    if (aa == 0) {
        OH_JSVM_Init(&init_options);
        aa++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
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

    test_set_debug_option(env);

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result11;
    NAPI_CALL(env1, napi_create_int32(env1, 0, &result11));
    return result11;
}

static JSVM_CallbackStruct param[] = {
    {.callback = CreateStringUtf8, .data = nullptr},
    {.callback = GetValueStringUtf8, .data = nullptr},
    {.callback = CreateStringUtf16, .data = nullptr},
    {.callback = GetValueStringUtf16, .data = nullptr},
    {.callback = CreateStringLatin1, .data = nullptr},
    {.callback = GetValueStringLatin1, .data = nullptr},
    {.callback = CreateDate, .data = nullptr},
    {.callback = CreateObject, .data = nullptr},
    {.callback = CreateExternal, .data = nullptr},
    {.callback = GetValueExternal, .data = nullptr},
    {.callback = CreateArray, .data = nullptr},
    {.callback = CreateArrayWithLength, .data = nullptr},
    {.callback = CreateArraybuffer, .data = nullptr},
    {.callback = GetArrayLength, .data = nullptr},
    {.callback = CreateInt32, .data = nullptr},
    {.callback = GetValueInt32, .data = nullptr},
    {.callback = CreateUInt32, .data = nullptr},
    {.callback = GetValueUint32, .data = nullptr},
    {.callback = CreateInt64, .data = nullptr},
    {.callback = GetValueInt64, .data = nullptr},
    {.callback = CreateDouble, .data = nullptr},
    {.callback = GetDouble, .data = nullptr},
    {.callback = GetBoolean, .data = nullptr},
    {.callback = GetValueBool, .data = nullptr},
    {.callback = CreateBigintUint64, .data = nullptr},
    {.callback = GetValueBigintUint64, .data = nullptr},
    {.callback = CreateBigintInt64, .data = nullptr},
    {.callback = GetBigintInt64, .data = nullptr},
    {.callback = CreateBigintWords, .data = nullptr},
    {.callback = GetValueBigintWords, .data = nullptr},
    {.callback = GetNull, .data = nullptr},
    {.callback = GetUndefined, .data = nullptr},
    {.callback = GetGlobal, .data = nullptr},
    {.callback = CreateSymbol, .data = nullptr},
    {.callback = SymbolFor, .data = nullptr},
    {.callback = GetDateValue, .data = nullptr},
    {.callback = IsDate, .data = nullptr},
    {.callback = GetArraybufferInfo, .data = nullptr},
    {.callback = CreateTypedArray, .data = nullptr},
    {.callback = GetTypedArrayInfo, .data = nullptr},
    {.callback = CreateDataView, .data = nullptr},
    {.callback = GetDataViewInfo, .data = nullptr},
    {.callback = GetPrototype, .data = nullptr},
    {.callback = CreateReference, .data = nullptr},
    {.callback = UseReference, .data = nullptr},
    {.callback = DeleteReference, .data = nullptr},
    {.callback = EscapableHandleScopeTest, .data = nullptr},
    {.callback = HandleScopeTest, .data = nullptr},
    {.callback = HandleScope, .data = nullptr},
    {.callback = GetPropertyNames, .data = nullptr},
    {.callback = GetAllPropertyNames, .data = nullptr},
    {.callback = GetEnumerableNames, .data = nullptr},
    {.callback = GetOwnWritableNames, .data = nullptr},
    {.callback = GetEnumerableConfigurableNames, .data = nullptr},
    {.callback = GetOwnConfigurableNames, .data = nullptr},
    {.callback = SetProperty, .data = nullptr},
    {.callback = SetPropertyFailed, .data = nullptr},
    {.callback = GetProperty, .data = nullptr},
    {.callback = GetPropertyFailed, .data = nullptr},
    {.callback = HasProperty, .data = nullptr},
    {.callback = HasPropertyFailed, .data = nullptr},
    {.callback = DeleteProperty, .data = nullptr},
    {.callback = DeletePropertyFailed, .data = nullptr},
    {.callback = HasOwnProperty, .data = nullptr},
    {.callback = HasOwnPropertyFailed, .data = nullptr},
    {.callback = SetNamedPropertyCreateObject, .data = nullptr},
    {.callback = SetNamedProperty, .data = nullptr},
    {.callback = SetNamedPropertyFailed, .data = nullptr},
    {.callback = GetNamedProperty, .data = nullptr},
    {.callback = GetNamedPropertyFailed, .data = nullptr},
    {.callback = HasNamedProperty, .data = nullptr},
    {.callback = HasNamedPropertyFailed, .data = nullptr},
    {.callback = SetElementWithLength, .data = nullptr},
    {.callback = SetElement, .data = nullptr},
    {.callback = SetElementFailed, .data = nullptr},
    {.callback = GetElement, .data = nullptr},
    {.callback = GetElementFailed, .data = nullptr},
    {.callback = HasElement, .data = nullptr},
    {.callback = HasElementFailed, .data = nullptr},
    {.callback = DeleteElement, .data = nullptr},
    {.callback = DeleteElementAndCheck, .data = nullptr},
    {.callback = DeleteElementFailed, .data = nullptr},
    {.callback = DefineMethodProperties, .data = nullptr},
    {.callback = DefineStringProperties, .data = nullptr},
    {.callback = DefineGetterProperties, .data = nullptr},
    {.callback = DefinePropertiesFailed, .data = nullptr},
    {.callback = ObjectFreeze, .data = nullptr},
    {.callback = ObjectSeal, .data = nullptr},
    {.callback = GetVersion, .data = nullptr},
    {.callback = GetVersionFailed, .data = nullptr},
    {.callback = GetVMInfo, .data = nullptr},
    {.callback = JsonStringify, .data = nullptr},
    {.callback = JsonStringifyFailed, .data = nullptr},
    {.callback = JsonParseNumber, .data = nullptr},
    {.callback = JsonParseObject, .data = nullptr},
    {.callback = JsonParse, .data = nullptr},
    {.callback = JsonParseFailed, .data = nullptr},
    {.callback = CallFunction, .data = nullptr},
    {.callback = CallFunctionWithArg, .data = nullptr},
    {.callback = CallFunctionWithObject, .data = nullptr},
    {.callback = CallFunctionFailed, .data = nullptr},
    {.callback = CreateFunction, .data = nullptr},
    {.callback = CreateFunctionFailed, .data = nullptr},
    {.callback = GetHeapStatistics, .data = nullptr},
    {.callback = GetVM, .data = nullptr},
    {.callback = GetTypeof, .data = nullptr},
    {.callback = InstanceOf, .data = nullptr},
    {.callback = IsArray, .data = nullptr},
    {.callback = IsArrayBuffer, .data = nullptr},
    {.callback = IsTypedarray, .data = nullptr},
    {.callback = IsDataView, .data = nullptr},
    {.callback = IsStrictEquals, .data = nullptr},
    {.callback = DetachArraybuffer, .data = nullptr},
    {.callback = IsDetachedArraybuffer, .data = nullptr},
    {.callback = CoerceToBool, .data = nullptr},
    {.callback = CoerceToNumber, .data = nullptr},
    {.callback = CoerceToObject, .data = nullptr},
    {.callback = CoerceToString, .data = nullptr},
    {.callback = IsPromise, .data = nullptr},
    {.callback = CreatePromise, .data = nullptr},
    {.callback = ResolveRejectDeferred, .data = nullptr},
    {.callback = GetCbArgs, .data = nullptr},
    {.callback = NewInstance, .data = nullptr},
    {.callback = SetTypeTagToObject, .data = nullptr},
    {.callback = CheckObjectTypeTag, .data = nullptr},
    {.callback = AdjustExternalMemory, .data = nullptr},
    {.callback = MemoryPressureNotification, .data = nullptr},
    {.callback = WrapObject, .data = nullptr},
    {.callback = RemoveWrap, .data = nullptr},
    {.callback = HandleScopeFor, .data = nullptr},
    {.callback = JsVmThrow, .data = nullptr},
    {.callback = JsVmThrowFromJS, .data = nullptr},
    {.callback = JsVmThrowError, .data = nullptr},
    {.callback = JsVmThrowTypeError, .data = nullptr},
    {.callback = JsVmThrowRangeError, .data = nullptr},
    {.callback = JsVmThrowSyntaxError, .data = nullptr},
    {.callback = JsVmIsError, .data = nullptr},
    {.callback = JsVmCreateError, .data = nullptr},
    {.callback = JsVmCreateTypeError, .data = nullptr},
    {.callback = JsVmCreateRangeError, .data = nullptr},
    {.callback = JsVmCreateSyntaxError, .data = nullptr},
    {.callback = JsVmGetLastErrorInfo, .data = nullptr},
    {.callback = JsVmGetAndClearLastException, .data = nullptr},
    {.callback = JsVmIsExceptionPending, .data = nullptr},
    {.callback = CreateSnapshotFailed, .data = nullptr},
    {.callback = DebugCodeUsingCpuProfiler, .data = nullptr},
    {.callback = TakeHeapSnapshot, .data = nullptr},
    {.callback = DebugCodeUsingInspector, .data = nullptr},
    {.callback = WaitForDebuggerFailed, .data = nullptr},
    {.callback = SetInstanceData, .data = nullptr},
    {.callback = GetInstanceData, .data = nullptr},
    {.callback = IsConstructor, .data = nullptr},
    {.callback = CreateRegExp1, .data = nullptr},
    {.callback = CreateRegExp2, .data = nullptr},
    {.callback = CreateRegExp3, .data = nullptr},
    {.callback = CreateRegExp4, .data = nullptr},
    {.callback = CreateRegExp5, .data = nullptr},
    {.callback = CreateRegExpEnvNullptr, .data = nullptr},
    {.callback = CreateFunctionWithScript, .data = nullptr},
    {.callback = CreateMap, .data = nullptr},
    {.callback = IsRegExp, .data = nullptr},
    {.callback = CoerceToBigInt, .data = nullptr},
    {.callback = TestGetValueStringUtf8Test1, .data = nullptr},
    {.callback = TestGetValueStringUtf8Test2, .data = nullptr},
    {.callback = TestGetValueStringUtf8Test3, .data = nullptr},
    {.callback = TestGetValueStringUtf8Test4, .data = nullptr},
    {.callback = TestGetValueStringUtf8Test5, .data = nullptr},
    {.callback = TestGetValueStringUtf8Test6, .data = nullptr},
    {.callback = TestCreateStringUtf8Test1, .data = nullptr},
    {.callback = TestCreateStringUtf8Test2, .data = nullptr},
    {.callback = TestCreateStringUtf8Test3, .data = nullptr},
    {.callback = TestCreateStringUtf8Test4, .data = nullptr},
    {.callback = TestCreateStringUtf16Test1, .data = nullptr},
    {.callback = TestCreateStringUtf16Test2, .data = nullptr},
    {.callback = TestCreateStringUtf16Test3, .data = nullptr},
    {.callback = TestCreateStringUtf16Test4, .data = nullptr},
    {.callback = TestGetValueStringUtf16Test1, .data = nullptr},
    {.callback = TestGetValueStringUtf16Test2, .data = nullptr},
    {.callback = TestGetValueStringUtf16Test3, .data = nullptr},
    {.callback = TestGetValueStringUtf16Test4, .data = nullptr},
    {.callback = TestGetValueStringUtf16Test5, .data = nullptr},
    {.callback = TestGetValueStringUtf16Test6, .data = nullptr},
    {.callback = TestCreateStringLatin1Test1, .data = nullptr},
    {.callback = TestCreateStringLatin1Test2, .data = nullptr},
    {.callback = TestCreateStringLatin1Test3, .data = nullptr},
    {.callback = TestCreateStringLatin1Test4, .data = nullptr},
    {.callback = TestGetValueStringLatin1Test1, .data = nullptr},
    {.callback = TestGetValueStringLatin1Test2, .data = nullptr},
    {.callback = TestGetValueStringLatin1Test3, .data = nullptr},
    {.callback = TestGetValueStringLatin1Test4, .data = nullptr},
    {.callback = TestGetValueStringLatin1Test5, .data = nullptr},
    {.callback = TestGetValueStringLatin1Test6, .data = nullptr},
    {.callback = TestIsStringTest1, .data = nullptr},
    {.callback = TestIsStringTest2, .data = nullptr},
    {.callback = TestIsStringTest3, .data = nullptr},
    {.callback = TestOtherTest1, .data = nullptr},
    {.callback = TestCreateArrayWithLength_01, .data = nullptr},
    {.callback = TestCreateArrayWithLength_02, .data = nullptr},
    {.callback = TestCreateArrayWithLength_03, .data = nullptr},
    {.callback = TestCreateArrayWithLength_04, .data = nullptr},
    {.callback = TestGetArrayLength_01, .data = nullptr},
    {.callback = TestGetArrayLength_02, .data = nullptr},
    {.callback = TestGetArrayLength_03, .data = nullptr},
    {.callback = TestGetArrayLength_04, .data = nullptr},
    {.callback = TestCreateTypedarray_01, .data = nullptr},
    {.callback = TestCreateTypedarray_02, .data = nullptr},
    {.callback = TestCreateTypedarray_03, .data = nullptr},
    {.callback = TestCreateTypedarray_04, .data = nullptr},
    {.callback = TestCreateTypedarray_05, .data = nullptr},
    {.callback = TestCreateTypedarray_06, .data = nullptr},
    {.callback = TestGetTypedarrayInfo_01, .data = nullptr},
    {.callback = TestGetTypedarrayInfo_02, .data = nullptr},
    {.callback = TestCreateDataview_01, .data = nullptr},
    {.callback = TestCreateDataview_02, .data = nullptr},
    {.callback = TestCreateDataview_03, .data = nullptr},
    {.callback = TestCreateDataview_04, .data = nullptr},
    {.callback = TestCreateDataview_05, .data = nullptr},
    {.callback = TestCreateDataview_06, .data = nullptr},
    {.callback = TestGetDataview_01, .data = nullptr},
    {.callback = TestGetDataview_02, .data = nullptr},
    {.callback = TestSetElement_01, .data = nullptr},
    {.callback = TestSetElement_02, .data = nullptr},
    {.callback = TestSetElement_03, .data = nullptr},
    {.callback = TestSetElement_04, .data = nullptr},
    {.callback = TestSetElement_05, .data = nullptr},
    {.callback = TestSetElement_06, .data = nullptr},
    {.callback = TestSetElement_07, .data = nullptr},
    {.callback = TestGetElement_01, .data = nullptr},
    {.callback = TestGetElement_02, .data = nullptr},
    {.callback = TestGetElement_03, .data = nullptr},
    {.callback = TestGetElement_04, .data = nullptr},
    {.callback = TestGetElement_05, .data = nullptr},
    {.callback = TestGetElement_06, .data = nullptr},
    {.callback = TestHasElement_01, .data = nullptr},
    {.callback = TestHasElement_02, .data = nullptr},
    {.callback = TestHasElement_03, .data = nullptr},
    {.callback = TestHasElement_04, .data = nullptr},
    {.callback = TestHasElement_05, .data = nullptr},
    {.callback = TestHasElement_06, .data = nullptr},
    {.callback = TestDeleteElement_01, .data = nullptr},
    {.callback = TestDeleteElement_02, .data = nullptr},
    {.callback = TestDeleteElement_03, .data = nullptr},
    {.callback = TestDeleteElement_04, .data = nullptr},
    {.callback = TestDeleteElement_05, .data = nullptr},
    {.callback = TestDeleteElement_06, .data = nullptr},
    {.callback = TestArrayProcessSteps_01, .data = nullptr},
    {.callback = TestArrayProcessSteps_02, .data = nullptr},
    {.callback = TestTypedarrayProcessSteps_01, .data = nullptr},
    {.callback = TestTypedarrayProcessSteps_02, .data = nullptr},
    {.callback = TestArrayDataviewProcessSteps_01, .data = nullptr},
    {.callback = TestArrayDataviewProcessSteps_02, .data = nullptr},
    {.callback = TestTypeArrayAndDataviewProcessSteps_01, .data = nullptr},
    {.callback = TestTypeArraySetMultipleTimes_01, .data = nullptr},
    {.callback = TestArraySetMultipleTimes_01, .data = nullptr},
    {.callback = TestArrayGetMultipleTimes_01, .data = nullptr},
    {.callback = TestArrayDeleteMultipleTimes_01, .data = nullptr},
    {.callback = TestArrayDeleteMultipleTimes_02, .data = nullptr},
    {.callback = TestCreateErrorTest1, .data = nullptr},
    {.callback = TestCreateErrorTest2, .data = nullptr},
    {.callback = TestCreateErrorTest3, .data = nullptr},
    {.callback = TestCreateErrorTest4, .data = nullptr},
    {.callback = TestCreateErrorTest5, .data = nullptr},
    {.callback = TestCreateTypeErrorTest1, .data = nullptr},
    {.callback = TestCreateTypeErrorTest2, .data = nullptr},
    {.callback = TestCreateTypeErrorTest3, .data = nullptr},
    {.callback = TestCreateTypeErrorTest4, .data = nullptr},
    {.callback = TestCreateTypeErrorTest5, .data = nullptr},
    {.callback = TestCreateRangeErrorTest1, .data = nullptr},
    {.callback = TestCreateRangeErrorTest2, .data = nullptr},
    {.callback = TestCreateRangeErrorTest3, .data = nullptr},
    {.callback = TestCreateRangeErrorTest4, .data = nullptr},
    {.callback = TestCreateRangeErrorTest5, .data = nullptr},
    {.callback = TestCreateSyntaxErrorTest1, .data = nullptr},
    {.callback = TestCreateSyntaxErrorTest2, .data = nullptr},
    {.callback = TestCreateSyntaxErrorTest3, .data = nullptr},
    {.callback = TestCreateSyntaxErrorTest4, .data = nullptr},
    {.callback = TestCreateSyntaxErrorTest5, .data = nullptr},
    {.callback = TestThrowTest1, .data = nullptr},
    {.callback = TestThrowTest2, .data = nullptr},
    {.callback = TestThrowTest3, .data = nullptr},
    {.callback = TestThrowTest4, .data = nullptr},
    {.callback = TestThrowTest5, .data = nullptr},
    {.callback = TestThrowTest6, .data = nullptr},
    {.callback = TestThrowErrorTest1, .data = nullptr},
    {.callback = TestThrowErrorTest2, .data = nullptr},
    {.callback = TestThrowErrorTest3, .data = nullptr},
    {.callback = TestThrowTypeErrorTest1, .data = nullptr},
    {.callback = TestThrowTypeErrorTest2, .data = nullptr},
    {.callback = TestThrowTypeErrorTest3, .data = nullptr},
    {.callback = TestThrowRangeErrorTest1, .data = nullptr},
    {.callback = TestThrowRangeErrorTest2, .data = nullptr},
    {.callback = TestThrowRangeErrorTest3, .data = nullptr},
    {.callback = TestThrowSyntaxErrorTest1, .data = nullptr},
    {.callback = TestThrowSyntaxErrorTest2, .data = nullptr},
    {.callback = TestThrowSyntaxErrorTest3, .data = nullptr},
    {.callback = TestIsErrorTest1, .data = nullptr},
    {.callback = TestIsErrorTest2, .data = nullptr},
    {.callback = TestGetAndClearLastExceptionTest1, .data = nullptr},
    {.callback = TestGetAndClearLastExceptionTest2, .data = nullptr},
    {.callback = TestGetAndClearLastExceptionTest3, .data = nullptr},
    {.callback = TestIsExceptionPendingTest1, .data = nullptr},
    {.callback = TestIsExceptionPendingTest2, .data = nullptr},
    {.callback = TestIsExceptionPendingTest3, .data = nullptr},
    {.callback = TestGetLastErrorInfoTest1, .data = nullptr},
    {.callback = TestGetLastErrorInfoTest2, .data = nullptr},
    {.callback = TestGetLastErrorInfoTest3, .data = nullptr},
    {.callback = TestCombinationTest1, .data = nullptr},
    {.callback = TestCombinationTest2, .data = nullptr},
    {.callback = TestCombinationTest3, .data = nullptr},
    {.callback = TestCombinationTest4, .data = nullptr},
    {.callback = TestCombinationTest5, .data = nullptr},
    {.callback = TestCombinationTest6, .data = nullptr},
    {.callback = TestCombinationTest7, .data = nullptr},
    {.callback = TestCombinationTest8, .data = nullptr},
    {.callback = TestCombinationTest9, .data = nullptr},
    {.callback = TestCombinationTest10, .data = nullptr},
    {.callback = TestCombinationTest11, .data = nullptr},
    {.callback = TestCombinationTest12, .data = nullptr},
    {.callback = TestCombinationTest13, .data = nullptr},
    {.callback = TestCombinationTest14, .data = nullptr},
    {.callback = TestCombinationTest15, .data = nullptr},
    {.callback = TestCombinationTest16, .data = nullptr},
    {.callback = TestCombinationTest17, .data = nullptr},
    {.callback = TestCombinationTest18, .data = nullptr},
    {.callback = TestCombinationTest19, .data = nullptr},
    {.callback = TestCombinationTest20, .data = nullptr},
    {.callback = TestCombinationTest21, .data = nullptr},
    {.callback = TestCombinationTest22, .data = nullptr},
    {.callback = TestCombinationTest23, .data = nullptr},
    {.callback = TestHasPropertyTest1, .data = nullptr},
    {.callback = TestHasPropertyTest2, .data = nullptr},
    {.callback = TestDeletePropertyTest1, .data = nullptr},
    {.callback = TestDeletePropertyTest2, .data = nullptr},
    {.callback = TestHasOwnPropertyTest1, .data = nullptr},
    {.callback = TestHasOwnPropertyTest2, .data = nullptr},
    {.callback = TestHasOwnPropertyTest3, .data = nullptr},
    {.callback = TestGetNamedPropertyTest1, .data = nullptr},
    {.callback = TestGetNamedPropertyTest2, .data = nullptr},
    {.callback = TestGetNamedPropertyTest3, .data = nullptr},
    {.callback = TestHasNamedPropertyTest1, .data = nullptr},
    {.callback = TestHasNamedPropertyTest2, .data = nullptr},
    {.callback = TestHasNamedPropertyTest3, .data = nullptr},
    {.callback = TestHasNamedPropertyTest4, .data = nullptr},
    {.callback = TestDefinePropertiesTest1, .data = nullptr},
    {.callback = TestDefinePropertiesTest2, .data = nullptr},
    {.callback = TestDefinePropertiesTest3, .data = nullptr},
    {.callback = TestDefinePropertiesTest4, .data = nullptr},
    {.callback = TestCombinationPropertyTest1, .data = nullptr},
    {.callback = TestCombinationPropertyTest2, .data = nullptr},
    {.callback = TestCombinationPropertyTest3, .data = nullptr},
    {.callback = TestCombinationPropertyTest4, .data = nullptr},
    {.callback = TestCombinationNamedPropertyTest1, .data = nullptr},
    {.callback = TestCombinationNamedPropertyTest2, .data = nullptr},
    {.callback = TestCreateObjectTest1, .data = nullptr},
    {.callback = TestCreateObjectTest2, .data = nullptr},
    {.callback = TestTypeofTest1, .data = nullptr},
    {.callback = TestTypeofTest2, .data = nullptr},
    {.callback = TestTypeofTest3, .data = nullptr},
    {.callback = TestTypeofTest4, .data = nullptr},
    {.callback = TestTypeofTest5, .data = nullptr},
    {.callback = TestTypeofTest6, .data = nullptr},
    {.callback = TestTypeofTest7, .data = nullptr},
    {.callback = TestTypeofTest8, .data = nullptr},
    {.callback = TestTypeofTest9, .data = nullptr},
    {.callback = TestTypeofTest10, .data = nullptr},
    {.callback = TestTypeofTest11, .data = nullptr},
    {.callback = TestTypeofTest12, .data = nullptr},
    {.callback = TestTypeTagObjectTest1, .data = nullptr},
    {.callback = TestTypeTagObjectTest2, .data = nullptr},
    {.callback = TestTypeTagObjectTest3, .data = nullptr},
    {.callback = TestTypeTagObjectTest4, .data = nullptr},
    {.callback = TestCheckObjectTypeTagTest1, .data = nullptr},
    {.callback = TestCheckObjectTypeTagTest2, .data = nullptr},
    {.callback = TestCheckObjectTypeTagTest3, .data = nullptr},
    {.callback = TestCheckObjectTypeTagTest4, .data = nullptr},
    {.callback = TestCheckObjectTypeTagTest5, .data = nullptr},
    {.callback = TestObjectCombinationTest1, .data = nullptr},
    {.callback = TestObjectCombinationTest2, .data = nullptr},
    {.callback = TestObjectCombinationTest3, .data = nullptr},
    {.callback = TestInitTest1, .data = nullptr},
    {.callback = TestCreateVMTest1, .data = nullptr},
    {.callback = TestCreateVMTest2, .data = nullptr},
    {.callback = TestDestroyVMTest1, .data = nullptr},
    {.callback = TestDestroyVMTest2, .data = nullptr},
    {.callback = TestOpenVMScopeTest1, .data = nullptr},
    {.callback = TestOpenVMScopeTest2, .data = nullptr},
    {.callback = TestCloseVMScopeTest1, .data = nullptr},
    {.callback = TestCloseVMScopeTest2, .data = nullptr},
    {.callback = TestCreateEnvTest1, .data = nullptr},
    {.callback = TestCreateEnvTest2, .data = nullptr},
    {.callback = TestDestroyEnvTest1, .data = nullptr},
    {.callback = TestDestroyEnvTest2, .data = nullptr},
    {.callback = TestOpenEnvScopeTest1, .data = nullptr},
    {.callback = TestOpenEnvScopeTest2, .data = nullptr},
    {.callback = TestOpenEnvScopeTest3, .data = nullptr},
    {.callback = TestCloseEnvScopeTest1, .data = nullptr},
    {.callback = TestCloseEnvScopeTest2, .data = nullptr},
    {.callback = TestDataTypeCombinationTest1, .data = nullptr},
    {.callback = TestCreateDateTest1, .data = nullptr},
    {.callback = TestGetDateValueTest1, .data = nullptr},
    {.callback = TestIsDateTest1, .data = nullptr},
    {.callback = TestDateCombinationTest1, .data = nullptr},
    {.callback = TestPumpMessageLoopTest1, .data = nullptr},
    {.callback = TestPerformMicrotaskCheckpointTest1, .data = nullptr},
    {.callback = TestExecuteTasksCombinationTest1, .data = nullptr},
    {.callback = TestJsonParseTest1, .data = nullptr},
    {.callback = TestJsonParseTest2, .data = nullptr},
    {.callback = TestJsonParseTest3, .data = nullptr},
    {.callback = TestJsonStringifyTest1, .data = nullptr},
    {.callback = TestJsonStringifyTest2, .data = nullptr},
    {.callback = TestJsonStringifyTest3, .data = nullptr},
    {.callback = TestJsonCombinationTest1, .data = nullptr},
    {.callback = TestStrictEqualsTest1, .data = nullptr},
    {.callback = TestStrictEqualsTest2, .data = nullptr},
    {.callback = TestStrictEqualsTest3, .data = nullptr},
    {.callback = TestStrictEqualsTest4, .data = nullptr},
    {.callback = TestStrictEqualsTest5, .data = nullptr},
    {.callback = TestStrictEqualsTest6, .data = nullptr},
    {.callback = TestStrictEqualsTest7, .data = nullptr},
    {.callback = TestStrictEqualsTest8, .data = nullptr},
    {.callback = TestStrictEqualsTest9, .data = nullptr},
    {.callback = TestStrictEqualsTest10, .data = nullptr},
    {.callback = TestStrictEqualsTest11, .data = nullptr},
    {.callback = TestStrictEqualsTest12, .data = nullptr},
    {.callback = TestStrictEqualsTest13, .data = nullptr},
    {.callback = TestStrictEqualsTest14, .data = nullptr},
    {.callback = TestStrictEqualsTest15, .data = nullptr},
    {.callback = TestStrictEqualsTest16, .data = nullptr},
    {.callback = TestStrictEqualsTest17, .data = nullptr},
    {.callback = TestStrictEqualsTest18, .data = nullptr},
    {.callback = TestStrictEqualsTest19, .data = nullptr},
    {.callback = TestCreateArrayBufferCase01, .data = nullptr},
    {.callback = TestCreateArrayBufferCase02, .data = nullptr},
    {.callback = TestCreateArrayBufferCase03, .data = nullptr},
    {.callback = TestCreateArrayBufferCase04, .data = nullptr},
    {.callback = TestGetArrayBufferCase01, .data = nullptr},
    {.callback = TestGetArrayBufferCase02, .data = nullptr},
    {.callback = TestIsArrayBufferCase01, .data = nullptr},
    {.callback = TestIsArrayBufferCase02, .data = nullptr},
    {.callback = TestIsArrayBufferCase03, .data = nullptr},
    {.callback = TestDetachArrayBufferCase01, .data = nullptr},
    {.callback = TestDetachArrayBufferCase02, .data = nullptr},
    {.callback = TestDetachArrayBufferCase03, .data = nullptr},
    {.callback = TestIsDetachedArraybufferCase01, .data = nullptr},
    {.callback = TestIsDetachedArraybufferCase02, .data = nullptr},
    {.callback = TestIsDetachedArraybufferCase03, .data = nullptr},
    {.callback = TestIsDetachedArraybufferCase04, .data = nullptr},
    {.callback = TestIsDetachedArraybufferCase05, .data = nullptr},
    {.callback = TestCreateAnyBufferDetachedCase01, .data = nullptr},
    {.callback = TestCreateInt32Case01, .data = nullptr},
    {.callback = TestCreateInt32Case02, .data = nullptr},
    {.callback = TestCreateInt32Case03, .data = nullptr},
    {.callback = TestCreateInt32Case04, .data = nullptr},
    {.callback = TestCreateUint32Case01, .data = nullptr},
    {.callback = TestCreateUint32Case02, .data = nullptr},
    {.callback = TestCreateUint32Case03, .data = nullptr},
    {.callback = TestCreateUint32Case04, .data = nullptr},
    {.callback = TestCreateInt64Case01, .data = nullptr},
    {.callback = TestCreateInt64Case02, .data = nullptr},
    {.callback = TestCreateInt64Case03, .data = nullptr},
    {.callback = TestCreateInt64Case04, .data = nullptr},
    {.callback = TestCreateDoubleCase01, .data = nullptr},
    {.callback = TestCreateDoubleCase02, .data = nullptr},
    {.callback = TestCreateDoubleCase03, .data = nullptr},
    {.callback = TestCreateDoubleCase04, .data = nullptr},
    {.callback = TestGetValueUint32Case01, .data = nullptr},
    {.callback = TestGetValueInt32Case01, .data = nullptr},
    {.callback = TestGetValueInt64Case01, .data = nullptr},
    {.callback = TestGetValueDoubleCase01, .data = nullptr},
    {.callback = TestBasicDataTypesCase01, .data = nullptr},
    {.callback = TestBasicDataTypesCase02, .data = nullptr},
    {.callback = TestBasicDataTypesCase03, .data = nullptr},
    {.callback = TestBasicDataTypesCase04, .data = nullptr},
    {.callback = TestCreateBigintInt64Case01, .data = nullptr},
    {.callback = TestCreateBigintInt64Case02, .data = nullptr},
    {.callback = TestCreateBigintInt64Case03, .data = nullptr},
    {.callback = TestCreateBigintInt64Case04, .data = nullptr},
    {.callback = TestCreateBigintUint64Case01, .data = nullptr},
    {.callback = TestCreateBigintUint64Case02, .data = nullptr},
    {.callback = TestCreateBigintUint64Case03, .data = nullptr},
    {.callback = TestCreateBigintWordsCase01, .data = nullptr},
    {.callback = TestCreateBigintWordsCase02, .data = nullptr},
    {.callback = TestCreateBigintWordsCase03, .data = nullptr},
    {.callback = TestCreateBigintWordsCase04, .data = nullptr},
    {.callback = TestCreateBigintWordsCase05, .data = nullptr},
    {.callback = TestGetValueBigintInt64Case01, .data = nullptr},
    {.callback = TestGetValueBigintInt64Case02, .data = nullptr},
    {.callback = TestGetValueBigintInt64Case03, .data = nullptr},
    {.callback = TestGetValueBigintInt64Case04, .data = nullptr},
    {.callback = TestGetValueBigintInt64Case05, .data = nullptr},
    {.callback = TestGetValueBigintInt64Case06, .data = nullptr},
    {.callback = TestGetValueBigintUint64Case01, .data = nullptr},
    {.callback = TestGetValueBigintUint64Case02, .data = nullptr},
    {.callback = TestGetValueBigintUint64Case03, .data = nullptr},
    {.callback = TestGetValueBigintUint64Case04, .data = nullptr},
    {.callback = TestGetValueBigintUint64Case05, .data = nullptr},
    {.callback = TestGetValueBigintUint64Case06, .data = nullptr},
    {.callback = TestGetValueBigintWordsCase01, .data = nullptr},
    {.callback = TestGetValueBigintWordsCase02, .data = nullptr},
    {.callback = TestGetValueBigintWordsCase03, .data = nullptr},
    {.callback = TestGetValueBigintWordsCase04, .data = nullptr},
    {.callback = TestGetValueBigintWordsCase05, .data = nullptr},
    {.callback = TestCreateAndGetBigIntProgramCase01, .data = nullptr},
    {.callback = TestCreateAndGetBigIntProgramCase02, .data = nullptr},
    {.callback = TestCreateAndGetBigIntProgramCase03, .data = nullptr},
    {.callback = TestNewInstanceCase01, .data = nullptr},
    {.callback = TestNewInstanceCase02, .data = nullptr},
    {.callback = TestGetNewTargetCase01, .data = nullptr},
    {.callback = TestGetNewTargetCase02, .data = nullptr},
    {.callback = TestGetNewTargetCase03, .data = nullptr},
    {.callback = TestDefineClassCase01, .data = nullptr},
    {.callback = TestDefineClassCase02, .data = nullptr},
    {.callback = TestWrapCase01, .data = nullptr},
    {.callback = TestWrapCase02, .data = nullptr},
    {.callback = TestWrapCase03, .data = nullptr},
    {.callback = TestWrapCase04, .data = nullptr},
    {.callback = TestUnwrapCase01, .data = nullptr},
    {.callback = TestUnwrapCase02, .data = nullptr},
    {.callback = TestUnwrapCase03, .data = nullptr},
    {.callback = TestUnwrapCase04, .data = nullptr},
    {.callback = TestRemoveWrapCase01, .data = nullptr},
    {.callback = TestRemoveWrapCase02, .data = nullptr},
    {.callback = TestRemoveWrapCase03, .data = nullptr},
    {.callback = TestRemoveWrapCase04, .data = nullptr},
    {.callback = TestClassOperationCase01, .data = nullptr},
    {.callback = TestCallFunction01, .data = nullptr},
    {.callback = TestCallFunction02, .data = nullptr},
    {.callback = TestCallFunction03, .data = nullptr},
    {.callback = TestCallFunction04, .data = nullptr},
    {.callback = TestCallFunction05, .data = nullptr},
    {.callback = TestCallFunction06, .data = nullptr},
    {.callback = TestCallFunction07, .data = nullptr},
    {.callback = TestCallFunction08, .data = nullptr},
    {.callback = TestCallFunction09, .data = nullptr},
    {.callback = TestCreateFunction01, .data = nullptr},
    {.callback = TestCreateFunction02, .data = nullptr},
    {.callback = TestCreateFunction03, .data = nullptr},
    {.callback = TestCreateFunction04, .data = nullptr},
    {.callback = TestCreateFunction05, .data = nullptr},
    {.callback = TestCreateFunction06, .data = nullptr},
    {.callback = TestGetCbInfo01, .data = nullptr},
    {.callback = TestGetCbInfo02, .data = nullptr},
    {.callback = TestGetCbInfo03, .data = nullptr},
    {.callback = TestGetCbInfo04, .data = nullptr},
    {.callback = TestGetCbInfo05, .data = nullptr},
    {.callback = TestIsFunction01, .data = nullptr},
    {.callback = TestIsFunction02, .data = nullptr},
    {.callback = TestIsFunction03, .data = nullptr},
    {.callback = TestIsFunction04, .data = nullptr},
    {.callback = TestOpenHandleScopeCase01, .data = nullptr},
    {.callback = TestOpenHandleScopeCase02, .data = nullptr},
    {.callback = TestOpenHandleScopeCase03, .data = nullptr},
    {.callback = TestOpenHandleScopeCase04, .data = nullptr},
    {.callback = TestCloseHandleScopeCase01, .data = nullptr},
    {.callback = TestCloseHandleScopeCase02, .data = nullptr},
    {.callback = TestOpenAndCloseHandleScopeCase01, .data = nullptr},
    {.callback = TestOpenAndCloseHandleScopeCase02, .data = nullptr},
    {.callback = TestOpenEscapableHandleScopeCase01, .data = nullptr},
    {.callback = TestOpenEscapableHandleScopeCase02, .data = nullptr},
    {.callback = TestOpenEscapableHandleScopeCase03, .data = nullptr},
    {.callback = TestCloseEscapableHandleScopeCase01, .data = nullptr},
    {.callback = TestCloseEscapableHandleScopeCase02, .data = nullptr},
    {.callback = TestCloseEscapableHandleScopeCase03, .data = nullptr},
    {.callback = TestEscapeHandleCase01, .data = nullptr},
    {.callback = TestEscapeHandleCase02, .data = nullptr},
    {.callback = TestEscapeHandleCase03, .data = nullptr},
    {.callback = TestEscapeHandleCase04, .data = nullptr},
    {.callback = TestEscapeHandleCase05, .data = nullptr},
    {.callback = TestOpenClosedEscapeCase01, .data = nullptr},
    {.callback = TestOpenClosedEscapeCase02, .data = nullptr},
    {.callback = TestCreateReferenceCase01, .data = nullptr},
    {.callback = TestCreateReferenceCase02, .data = nullptr},
    {.callback = TestCreateReferenceCase03, .data = nullptr},
    {.callback = TestDeleteReferenceCase01, .data = nullptr},
    {.callback = TestDeleteReferenceCase02, .data = nullptr},
    {.callback = TestReferenceRefCase01, .data = nullptr},
    {.callback = TestReferenceRefCase02, .data = nullptr},
    {.callback = TestReferenceRefCase03, .data = nullptr},
    {.callback = TestReferenceUnrefCase01, .data = nullptr},
    {.callback = TestReferenceUnrefCase02, .data = nullptr},
    {.callback = TestReferenceUnrefCase03, .data = nullptr},
    {.callback = TestGetReferenceValueCase01, .data = nullptr},
    {.callback = TestGetReferenceValueCase02, .data = nullptr},
    {.callback = TestHandleAndRefCase01, .data = nullptr},
    {.callback = TestHandleAndRefCase02, .data = nullptr},
    {.callback = TestHandleAndRefCase03, .data = nullptr},
    {.callback = TestAdjustExternalMemoryCase01, .data = nullptr},
    {.callback = TestAdjustExternalMemoryCase02, .data = nullptr},
    {.callback = TestAdjustExternalMemoryCase03, .data = nullptr},
    {.callback = TestAdjustExternalMemoryCase04, .data = nullptr},
    {.callback = TestMemoryPressureNotificationCase01, .data = nullptr},
    {.callback = TestMemoryPressureNotificationCase02, .data = nullptr},
    {.callback = TestMemoryPressureNotificationCase03, .data = nullptr},
    {.callback = TestMemoryManagementuseCase01, .data = nullptr},
    {.callback = TestIsPromiseCase01, .data = nullptr},
    {.callback = TestIsPromiseCase02, .data = nullptr},
    {.callback = TestIsPromiseCase03, .data = nullptr},
    {.callback = TestIsPromiseCase04, .data = nullptr},
    {.callback = TestCreatePromiseCase01, .data = nullptr},
    {.callback = TestResolveDeferredCase01, .data = nullptr},
    {.callback = TestResolveDeferredCase02, .data = nullptr},
    {.callback = TestRejectDeferredCase01, .data = nullptr},
    {.callback = TestRejectDeferredCase02, .data = nullptr},
    {.callback = TestCreateResolveDeferredCase01, .data = nullptr},
    {.callback = TestGetVersionCase01, .data = nullptr},
    {.callback = TestGetVMInfoCase01, .data = nullptr},
    {.callback = TestGetVMInfoCase02, .data = nullptr},
    {.callback = TestGetHeapStatisticsCase01, .data = nullptr},
    {.callback = TestStartCpuProfilerCase01, .data = nullptr},
    {.callback = TestStopCpuProfilerCase01, .data = nullptr},
    {.callback = TestTakeHeapSnapshotCase01, .data = nullptr},
    {.callback = TestOpenInspectorCase01, .data = nullptr},
    {.callback = TestOpenInspectorCase02, .data = nullptr},
    {.callback = TestOpenInspectorCase03, .data = nullptr},
    {.callback = TestCloseInspectorCase01, .data = nullptr},
    {.callback = TestCloseInspectorCase02, .data = nullptr},
    {.callback = TestCloseInspectorCase03, .data = nullptr},
    {.callback = TestOpenInspectorWithNameCase01, .data = nullptr},
    {.callback = TestOpenInspectorWithNameCase02, .data = nullptr},
};
static JSVM_PropertyDescriptor jsDescriptor[] = {
    {"createStringUtf8", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueStringUtf8", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createStringUtf16", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueStringUtf16", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createStringLatin1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueStringLatin1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createDate", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createExternal", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueExternal", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createArray", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createArrayWithLength", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createArraybuffer", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getArrayLength", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createInt32", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueInt32", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createUInt32", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueUint32", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createInt64", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueInt64", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createDouble", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getDouble", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getBoolean", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueBool", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createBigintUint64", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueBigintUint64", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createBigintInt64", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getBigintInt64", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createBigintWords", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getValueBigintWords", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getNull", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getUndefined", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getGlobal", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createSymbol", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"symbolFor", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getDateValue", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isDate", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getArraybufferInfo", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createTypedArray", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getTypedArrayInfo", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createDataView", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getDataViewInfo", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getPrototype", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createReference", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"useReference", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"deleteReference", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"escapableHandleScopeTest", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"handleScopeTest", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"handleScope", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getPropertyNames", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getAllPropertyNames", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getEnumerableNames", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getOwnWritableNames", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getEnumerableConfigurableNames", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getOwnConfigurableNames", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsvmSetProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"deleteProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"deletePropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasOwnProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasOwnPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setNamedPropertyCreateObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setNamedProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setNamedPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getNamedProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getNamedPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasNamedProperty", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasNamedPropertyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setElementWithLength", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setElement", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setElementFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getElement", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getElementFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasElement", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"hasElementFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"deleteElement", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"deleteElementAndCheck", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"deleteElementFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"defineMethodProperties", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"defineStringProperties", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"defineGetterProperties", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"definePropertiesFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"objectFreeze", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"objectSeal", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getVersion", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getVersionFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getVMInfo", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsonStringify", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsonStringifyFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsonParseNumber", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsonParseObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsonParse", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsonParseFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"callFunction", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"callFunctionWithArg", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"callFunctionWithObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"callFunctionFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createFunction", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createFunctionFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getHeapStatistics", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getVM", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getTypeof", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"instanceOf", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isArray", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isArrayBuffer", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isTypedarray", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isDataView", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isStrictEquals", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"detachArraybuffer", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isDetachedArraybuffer", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"coerceToBool", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"coerceToNumber", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"coerceToObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"coerceToString", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isPromise", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createPromise", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"resolveRejectDeferred", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getCbArgs", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"newInstance", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setTypeTagToObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"checkObjectTypeTag", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"adjustExternalMemory", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"memoryPressureNotification", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"wrapObject", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"removeWrap", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"handleScopeFor", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmThrow", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmThrowFromJS", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmThrowError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmThrowTypeError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmThrowRangeError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmThrowSyntaxError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmIsError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmCreateError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmCreateTypeError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmCreateRangeError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmCreateSyntaxError", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmGetLastErrorInfo", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmGetAndClearLastException", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"jsVmIsExceptionPending", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createSnapshotFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"debugCodeUsingCpuProfiler", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"takeHeapSnapshot", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"debugCodeUsingInspector", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"waitForDebuggerFailed", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"setInstanceData", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"getInstanceData", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isConstructor", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createRegExp1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createRegExp2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createRegExp3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createRegExp4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createRegExp5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createRegExpEnvNullptr", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createFunctionWithScript", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"createMap", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"isRegExp", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"coerceToBigInt", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf8Test1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf8Test2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf8Test3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf8Test4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf8Test5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf8Test6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf8Test1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf8Test2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf8Test3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf8Test4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf16Test1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf16Test2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf16Test3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringUtf16Test4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf16Test1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf16Test2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf16Test3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf16Test4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf16Test5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringUtf16Test6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringLatin1Test1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringLatin1Test2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringLatin1Test3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateStringLatin1Test4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringLatin1Test1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringLatin1Test2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringLatin1Test3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringLatin1Test4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringLatin1Test5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueStringLatin1Test6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsStringTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsStringTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsStringTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOtherTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayWithLength_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayWithLength_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayWithLength_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayWithLength_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetArrayLength_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetArrayLength_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetArrayLength_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetArrayLength_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypedarray_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypedarray_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypedarray_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypedarray_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypedarray_05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypedarray_06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetTypedarrayInfo_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetTypedarrayInfo_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDataview_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDataview_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDataview_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDataview_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDataview_05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDataview_06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetDataview_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetDataview_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testSetElement_07", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetElement_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetElement_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetElement_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetElement_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetElement_05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetElement_06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasElement_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasElement_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasElement_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasElement_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasElement_05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasElement_06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteElement_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteElement_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteElement_03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteElement_04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteElement_05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteElement_06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayProcessSteps_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayProcessSteps_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypedarrayProcessSteps_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypedarrayProcessSteps_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayDataviewProcessSteps_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayDataviewProcessSteps_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeArrayAndDataviewProcessSteps_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeArraySetMultipleTimes_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArraySetMultipleTimes_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayGetMultipleTimes_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayDeleteMultipleTimes_01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testArrayDeleteMultipleTimes_02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateErrorTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateErrorTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypeErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypeErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypeErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypeErrorTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateTypeErrorTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateRangeErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateRangeErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateRangeErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateRangeErrorTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateRangeErrorTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateSyntaxErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateSyntaxErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateSyntaxErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateSyntaxErrorTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateSyntaxErrorTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTest6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTypeErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTypeErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowTypeErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowRangeErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowRangeErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowRangeErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowSyntaxErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowSyntaxErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testThrowSyntaxErrorTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsErrorTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsErrorTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetAndClearLastExceptionTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetAndClearLastExceptionTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetAndClearLastExceptionTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsExceptionPendingTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsExceptionPendingTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsExceptionPendingTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetLastErrorInfoTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetLastErrorInfoTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetLastErrorInfoTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest7", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest8", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest9", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest10", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest11", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest12", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest13", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest14", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest15", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest16", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest17", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest18", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest19", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest20", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest21", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest22", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationTest23", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasPropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasPropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeletePropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeletePropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasOwnPropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasOwnPropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasOwnPropertyTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNamedPropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNamedPropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNamedPropertyTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasNamedPropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasNamedPropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasNamedPropertyTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHasNamedPropertyTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDefinePropertiesTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDefinePropertiesTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDefinePropertiesTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDefinePropertiesTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationPropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationPropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationPropertyTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationPropertyTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationNamedPropertyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCombinationNamedPropertyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateObjectTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateObjectTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest7", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest8", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest9", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest10", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest11", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeofTest12", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeTagObjectTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeTagObjectTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeTagObjectTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTypeTagObjectTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCheckObjectTypeTagTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCheckObjectTypeTagTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCheckObjectTypeTagTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCheckObjectTypeTagTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCheckObjectTypeTagTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testObjectCombinationTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testObjectCombinationTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testObjectCombinationTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testInitTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateVMTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateVMTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDestroyVMTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDestroyVMTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenVMScopeTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenVMScopeTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseVMScopeTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseVMScopeTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateEnvTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateEnvTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDestroyEnvTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDestroyEnvTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenEnvScopeTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenEnvScopeTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenEnvScopeTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseEnvScopeTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseEnvScopeTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDataTypeCombinationTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDateTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetDateValueTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsDateTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDateCombinationTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testPumpMessageLoopTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testPerformMicrotaskCheckpointTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testExecuteTasksCombinationTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonParseTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonParseTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonParseTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonStringifyTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonStringifyTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonStringifyTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testJsonCombinationTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest1", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest2", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest3", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest4", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest5", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest6", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest7", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest8", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest9", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest10", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest11", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest12", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest13", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest14", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest15", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest16", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest17", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest18", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStrictEqualsTest19", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayBufferCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayBufferCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayBufferCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateArrayBufferCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetArrayBufferCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetArrayBufferCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsArrayBufferCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsArrayBufferCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsArrayBufferCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDetachArrayBufferCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDetachArrayBufferCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDetachArrayBufferCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsDetachedArraybufferCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsDetachedArraybufferCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsDetachedArraybufferCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsDetachedArraybufferCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsDetachedArraybufferCase05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateAnyBufferDetachedCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt32Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt32Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt32Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt32Case04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateUint32Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateUint32Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateUint32Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateUint32Case04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt64Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt64Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt64Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateInt64Case04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDoubleCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDoubleCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDoubleCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateDoubleCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueUint32Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueInt32Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueInt64Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueDoubleCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testBasicDataTypesCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testBasicDataTypesCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testBasicDataTypesCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testBasicDataTypesCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintInt64Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintInt64Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintInt64Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintInt64Case04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintUint64Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintUint64Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintUint64Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintWordsCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintWordsCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintWordsCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintWordsCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateBigintWordsCase05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintInt64Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintInt64Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintInt64Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintInt64Case04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintInt64Case05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintInt64Case06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintUint64Case01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintUint64Case02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintUint64Case03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintUint64Case04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintUint64Case05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintUint64Case06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintWordsCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintWordsCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintWordsCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintWordsCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetValueBigintWordsCase05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateAndGetBigIntProgramCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateAndGetBigIntProgramCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateAndGetBigIntProgramCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testNewInstanceCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testNewInstanceCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNewTargetCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNewTargetCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNewTargetCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDefineClassCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDefineClassCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testWrapCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testWrapCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testWrapCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testWrapCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testUnwrapCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testUnwrapCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testUnwrapCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testUnwrapCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testRemoveWrapCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testRemoveWrapCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testRemoveWrapCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testRemoveWrapCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testClassOperationCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction07", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction08", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCallFunction09", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateFunction01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateFunction02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateFunction03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateFunction04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateFunction05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateFunction06", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetCbInfo01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetCbInfo02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetCbInfo03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetCbInfo04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetCbInfo05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsFunction01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsFunction02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsFunction03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsFunction04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenHandleScopeCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenHandleScopeCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenHandleScopeCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenHandleScopeCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseHandleScopeCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseHandleScopeCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenAndCloseHandleScopeCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenAndCloseHandleScopeCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenEscapableHandleScopeCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenEscapableHandleScopeCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenEscapableHandleScopeCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseEscapableHandleScopeCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseEscapableHandleScopeCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseEscapableHandleScopeCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testEscapeHandleCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testEscapeHandleCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testEscapeHandleCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testEscapeHandleCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testEscapeHandleCase05", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenClosedEscapeCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenClosedEscapeCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateReferenceCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateReferenceCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateReferenceCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteReferenceCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testDeleteReferenceCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testReferenceRefCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testReferenceRefCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testReferenceRefCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testReferenceUnrefCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testReferenceUnrefCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testReferenceUnrefCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetReferenceValueCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetReferenceValueCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHandleAndRefCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHandleAndRefCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testHandleAndRefCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testAdjustExternalMemoryCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testAdjustExternalMemoryCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testAdjustExternalMemoryCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testAdjustExternalMemoryCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testMemoryPressureNotificationCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testMemoryPressureNotificationCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testMemoryPressureNotificationCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testMemoryManagementuseCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsPromiseCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsPromiseCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsPromiseCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testIsPromiseCase04", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreatePromiseCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testResolveDeferredCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testResolveDeferredCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testRejectDeferredCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testRejectDeferredCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCreateResolveDeferredCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetVersionCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetVMInfoCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetVMInfoCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetHeapStatisticsCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStartCpuProfilerCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testStopCpuProfilerCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testTakeHeapSnapshotCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenInspectorCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenInspectorCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenInspectorCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseInspectorCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseInspectorCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testCloseInspectorCase03", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenInspectorWithNameCase01", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testOpenInspectorWithNameCase02", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
};
void WaitPropertyDescriptor()
{
    size_t iSize = sizeof(jsDescriptor) / sizeof(JSVM_PropertyDescriptor);
    for (int i = 0; i < iSize; i++) {
        jsDescriptor[i].name = nullptr;
        jsDescriptor[i].method = &param[i];
        jsDescriptor[i].getter = nullptr;
        jsDescriptor[i].setter = nullptr;
        jsDescriptor[i].value = nullptr;
        jsDescriptor[i].attributes = JSVM_DEFAULT;
    }
}
napi_typedarray_type GetArrayType(JSVM_TypedarrayType typeNum)
{
    napi_typedarray_type arrayType;
    if (typeNum >= JSVM_INT8_ARRAY && typeNum <= JSVM_BIGUINT64_ARRAY) {
        arrayType = static_cast<napi_typedarray_type>(typeNum);
    } else {
        arrayType = napi_int8_array;
    }
    return arrayType;
}

size_t GetArraySize(JSVM_TypedarrayType typeNum)
{
    size_t elementSize = 0;
    switch (typeNum) {
        case JSVM_INT8_ARRAY:
        case JSVM_UINT8_ARRAY:
        case JSVM_UINT8_CLAMPED_ARRAY:
            elementSize = sizeof(int8_t);
            break;
        case JSVM_INT16_ARRAY:
        case JSVM_UINT16_ARRAY:
            elementSize = sizeof(int16_t);
            break;
        case JSVM_INT32_ARRAY:
        case JSVM_UINT32_ARRAY:
            elementSize = sizeof(int32_t);
            break;
        case JSVM_FLOAT32_ARRAY:
            elementSize = sizeof(float);
            break;
        case JSVM_FLOAT64_ARRAY:
            elementSize = sizeof(double);
            break;
        case JSVM_BIGINT64_ARRAY:
        case JSVM_BIGUINT64_ARRAY:
            elementSize = sizeof(int64_t);
            break;
        default:
            elementSize = sizeof(int8_t);
            break;
    }
    return elementSize;
}

void ConvertResults(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue);

void ConvertString(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "utf8") == 0) {
        size_t length;
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, nullptr, 0, &length);
        if (length <= 0) {
            return;
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            return;
        }
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, buffer, length + 1, nullptr);
        napi_create_string_utf8(napiEnv, buffer, length, napiValue);
        free(buffer);
    } else if (strcmp(g_dataType, "utf16") == 0) {
        char16_t buffer[128];
        size_t bufferSize = 128;
        size_t copied = 0;
        OH_JSVM_GetValueStringUtf16(jsVmEnv, jSVmValue, buffer, bufferSize, &copied);
        napi_create_string_utf16(napiEnv, buffer, copied, napiValue);
    } else if (strcmp(g_dataType, "latin") == 0) {
        size_t length;
        OH_JSVM_GetValueStringLatin1(jsVmEnv, jSVmValue, nullptr, 0, &length);
        if (length <= 0) {
            return;
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            return;
        }
        OH_JSVM_GetValueStringLatin1(jsVmEnv, jSVmValue, buffer, length + 1, nullptr);
        napi_create_string_latin1(napiEnv, buffer, length, napiValue);
        free(buffer);
    } else {
        size_t length;
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, nullptr, 0, &length);
        if (length <= 0) {
            return;
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            return;
        }
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, buffer, length + 1, nullptr);
        napi_create_string_utf8(napiEnv, buffer, length, napiValue);
        free(buffer);
    }
}

void ConvertNumber(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "double") == 0) {
        double doubleValue;
        JSVM_Status doubleStatus = OH_JSVM_GetValueDouble(jsVmEnv, jSVmValue, &doubleValue);
        if (doubleStatus == JSVM_OK) {
            napi_create_double(napiEnv, doubleValue, napiValue);
        } else {
            napi_create_double(napiEnv, 0, napiValue);
        }
    } else if (strcmp(g_dataType, "int") == 0) {
        int64_t value;
        JSVM_Status int64Status = OH_JSVM_GetValueInt64(jsVmEnv, jSVmValue, &value);
        if (int64Status == JSVM_OK) {
            napi_create_int64(napiEnv, value, napiValue);
        } else {
            napi_create_int64(napiEnv, 0, napiValue);
        }
    } else {
        int64_t value;
        JSVM_Status int64Status = OH_JSVM_GetValueInt64(jsVmEnv, jSVmValue, &value);
        if (int64Status == JSVM_OK) {
            napi_create_int64(napiEnv, value, napiValue);
        } else {
            napi_create_int64(napiEnv, 0, napiValue);
        }
    }
}

void ConvertBigInt(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "BigintInt64") == 0) {
        int64_t intValue;
        bool lossless = false;
        OH_JSVM_GetValueBigintInt64(jsVmEnv, jSVmValue, &intValue, &lossless);
        napi_create_bigint_int64(napiEnv, intValue, napiValue);
    }
    if (strcmp(g_dataType, "BigintUint64") == 0) {
        uint64_t uintValue;
        bool lossless = false;
        OH_JSVM_GetValueBigintUint64(jsVmEnv, jSVmValue, &uintValue, &lossless);
        napi_create_bigint_uint64(napiEnv, uintValue, napiValue);
    }
    if (strcmp(g_dataType, "BigintWords") == 0) {
        int retSignBit = 0;
        size_t retWordCount = 4;
        uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL};
        OH_JSVM_GetValueBigintWords(jsVmEnv, jSVmValue, &retSignBit, &retWordCount, wordsOut);
        napi_create_bigint_words(napiEnv, 0, DIFF_VALUE_THREE, wordsOut, napiValue);
    }
}

void ConvertObjectArray(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    uint32_t length;
    OH_JSVM_GetArrayLength(jsVmEnv, jSVmValue, &length);
    napi_create_array(napiEnv, napiValue);
    for (uint32_t i = 0; i < length; i++) {
        JSVM_Value jsvmElement;
        OH_JSVM_GetElement(jsVmEnv, jSVmValue, i, &jsvmElement);
        GetResultType(jsVmEnv, jsvmElement);
        napi_value napiElement;
        ConvertResults(jsVmEnv, jsvmElement, napiEnv, &napiElement);
        napi_set_element(napiEnv, *napiValue, i, napiElement);
    }
}

void ConvertObjectObjStr(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value propNames = nullptr;
    OH_JSVM_GetPropertyNames(jsVmEnv, jSVmValue, &propNames);
    bool isArray = false;
    OH_JSVM_IsArray(jsVmEnv, propNames, &isArray);
    uint32_t arrayLength = 0;
    OH_JSVM_GetArrayLength(jsVmEnv, propNames, &arrayLength);
    napi_create_object(napiEnv, napiValue);
    for (uint32_t i = 0; i < arrayLength; i++) {
        strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
        JSVM_Value propName = nullptr;
        OH_JSVM_GetElement(jsVmEnv, propNames, i, &propName);
        napi_value propNameNapi;
        ConvertString(jsVmEnv, propName, napiEnv, &propNameNapi);
        JSVM_Value propValue = nullptr;
        OH_JSVM_GetProperty(jsVmEnv, jSVmValue, propName, &propValue);
        napi_value propValueNapi;
        GetResultType(jsVmEnv, propValue);
        ConvertResults(jsVmEnv, propValue, napiEnv, &propValueNapi);
        napi_set_property(napiEnv, *napiValue, propNameNapi, propValueNapi);
    }
}

void ConvertObjectArraybuffer(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value byteLen;
    OH_JSVM_GetNamedProperty(jsVmEnv, jSVmValue, "byteLength", &byteLen);
    int32_t length;
    OH_JSVM_GetValueInt32(jsVmEnv, byteLen, &length);
    void *data;
    napi_create_arraybuffer(napiEnv, length, &data, napiValue);
}

void ConvertObjectDate(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    double value;
    OH_JSVM_GetDateValue(jsVmEnv, jSVmValue, &value);
    napi_create_date(napiEnv, value, napiValue);
}

void ConvertObjectArrayBufferInfo(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value proLen;
    OH_JSVM_GetNamedProperty(jsVmEnv, jSVmValue, "byteLength", &proLen);
    int32_t len;
    OH_JSVM_GetValueInt32(jsVmEnv, proLen, &len);

    napi_create_object(napiEnv, napiValue);
    napi_value length;
    napi_create_uint32(napiEnv, len, &length);
    napi_set_named_property(napiEnv, *napiValue, "byteLength", length);
    JSVM_Value vmBufferData;
    OH_JSVM_GetNamedProperty(jsVmEnv, jSVmValue, "buffer", &vmBufferData);
    size_t buffLength;
    void *data;
    OH_JSVM_GetArraybufferInfo(jsVmEnv, vmBufferData, &data, &buffLength);
    napi_value bufferData;
    napi_create_arraybuffer(napiEnv, len, &data, &bufferData);
    napi_set_named_property(napiEnv, *napiValue, "buffer", bufferData);
}

void ConvertObjectTypeArray(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    size_t length;
    size_t elementSize = 0;
    JSVM_Value arraybuffer;
    OH_JSVM_GetTypedarrayInfo(jsVmEnv, jSVmValue, &type, &length, &data, &arraybuffer, &byteOffset);
    napi_typedarray_type arraytype;
    elementSize = GetArraySize(type);
    arraytype = GetArrayType(type);
    napi_value arrayBuffer;
    napi_create_arraybuffer(napiEnv, length * elementSize, (void **)&data, &arrayBuffer);
    napi_create_typedarray(napiEnv, arraytype, length, arrayBuffer, 0, napiValue);
}

void ConvertJsObject(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value nameValue;
    JSVM_Value propNameValue;
    OH_JSVM_CreateStringUtf8(jsVmEnv, "name", JSVM_AUTO_LENGTH, &propNameValue);

    OH_JSVM_GetProperty(jsVmEnv, jSVmValue, propNameValue, &nameValue);
    size_t bufsize = 0;
    OH_JSVM_GetValueStringUtf8(jsVmEnv, nameValue, nullptr, 0, &bufsize);
    if (bufsize <= 0) {
        printf("Bufsize error!\n");
    }
    char *buf = (char *)malloc(bufsize + 1);
    if (buf == nullptr) {
        printf("Memory allocation failed!\n");
    }
    OH_JSVM_GetValueStringUtf8(jsVmEnv, nameValue, buf, bufsize + 1, &bufsize);
    napi_create_object(napiEnv, napiValue);
    napi_value name;
    napi_create_string_utf8(napiEnv, "name", NAPI_AUTO_LENGTH, &name);
    napi_value value;
    napi_create_string_utf8(napiEnv, buf, NAPI_AUTO_LENGTH, &value);
    napi_set_property(napiEnv, *napiValue, name, value);

    JSVM_Value idValue;
    JSVM_Value propIDValue;
    OH_JSVM_CreateStringUtf8(jsVmEnv, "id", JSVM_AUTO_LENGTH, &propIDValue);
    OH_JSVM_GetProperty(jsVmEnv, jSVmValue, propIDValue, &idValue);
    size_t idSize = 0;
    OH_JSVM_GetValueStringUtf8(jsVmEnv, idValue, nullptr, 0, &idSize);
    if (idSize > 0) {
        char *idBuf = (char *)malloc(idSize + 1);
        if (idBuf == nullptr) {
            printf("Memory allocation failed!\n");
        }
        OH_JSVM_GetValueStringUtf8(jsVmEnv, idValue, idBuf, idSize + 1, &idSize);
        napi_value id;
        napi_create_string_utf8(napiEnv, "id", NAPI_AUTO_LENGTH, &id);
        napi_value id_value;
        napi_create_string_utf8(napiEnv, idBuf, NAPI_AUTO_LENGTH, &id_value);
        napi_set_property(napiEnv, *napiValue, id, id_value);
    }
}

void ConvertObject(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "array") == 0) {
        ConvertObjectArray(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "arraybuffer") == 0) {
        ConvertObjectArraybuffer(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "date") == 0) {
        ConvertObjectDate(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "arraybufferinfo") == 0) {
        ConvertObjectArrayBufferInfo(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "typearray") == 0) {
        ConvertObjectTypeArray(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "object") == 0) {
        ConvertJsObject(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "objectstr") == 0) {
        ConvertObjectObjStr(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
}

void ConvertResults(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_ValueType resultType;
    OH_JSVM_Typeof(jsVmEnv, jSVmValue, &resultType);
    switch (resultType) {
        case JSVM_UNDEFINED: {
            napi_get_undefined(napiEnv, napiValue);
            break;
        }
        case JSVM_NULL: {
            napi_get_null(napiEnv, napiValue);
            break;
        }
        case JSVM_BOOLEAN: {
            bool value = false;
            OH_JSVM_GetValueBool(jsVmEnv, jSVmValue, &value);
            napi_get_boolean(napiEnv, value, napiValue);
            break;
        }
        case JSVM_NUMBER: {
            ConvertNumber(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        case JSVM_STRING: {
            ConvertString(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        case JSVM_OBJECT: {
            ConvertObject(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        case JSVM_EXTERNAL: {
            void **result = nullptr;
            JSVM_Status externalStatus = OH_JSVM_GetValueExternal(jsVmEnv, jSVmValue, result);
            if (externalStatus == JSVM_OK) {
                napi_create_external(napiEnv, result, nullptr, nullptr, napiValue);
            }
            break;
        }
        case JSVM_BIGINT: {
            ConvertBigInt(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        default: {
            break;
        }
    }
}

void RunScriptFail(napi_env &nEnv, JSVM_Env &env)
{
    JSVM_Value exceptionValue;
    JSVM_Status status = OH_JSVM_GetAndClearLastException(env, &exceptionValue);
    if (status == JSVM_OK) {
        JSVM_Value message;
        OH_JSVM_GetNamedProperty(env, exceptionValue, "message", &message);
        size_t length = 0;
        OH_JSVM_GetValueStringUtf8(env, message, nullptr, 0, &length);
        if (length <= 0) {
            printf("Get length error!\n");
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            printf("Memory allocation failed!\n");
        }
        OH_JSVM_GetValueStringUtf8(env, message, buffer, length + 1, nullptr);
        OH_JSVM_GetNamedProperty(env, exceptionValue, "name", &message);
        size_t nameLength;
        OH_JSVM_GetValueStringUtf8(env, message, nullptr, 0, &nameLength);
        if (nameLength <= 0) {
            printf("Get nameLength error!\n");
        }
        char *nameBuffer = (char *)malloc(nameLength + 1);
        if (nameBuffer == nullptr) {
            printf("Memory allocation failed!\n");
        }
        OH_JSVM_GetValueStringUtf8(env, message, nameBuffer, nameLength + 1, nullptr);
        if (strcmp(nameBuffer, "TypeError") == 0) {
            napi_throw_type_error(nEnv, nameBuffer, buffer);
        } else if (strcmp(nameBuffer, "RangeError") == 0) {
            napi_throw_range_error(nEnv, nameBuffer, buffer);
        } else {
            napi_throw_error(nEnv, "-1", buffer);
        }
        free(nameBuffer);
        free(buffer);
    } else {
        napi_throw_error(nEnv, "-1", nullptr);
    }
}

napi_value ExecuteJsScript(napi_env nEnv, JSVM_Env env, char *buf)
{
    const char *sourceCodeStr = buf;
    JSVM_Value sourceCodeValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, sourceCodeStr, strlen(sourceCodeStr), &sourceCodeValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value jsVmResult = nullptr;
    napi_value nResult = nullptr;
    if (strcmp(sourceCodeStr, "defineClass") == 0) {
        JSVM_Value obj = nullptr;
        DefineClass(env, obj);
        nResult = GetObj(nEnv);
    } else {
        JSVM_Value sourceCodeValue = nullptr;
        OH_JSVM_CreateStringUtf8(env, sourceCodeStr, strlen(sourceCodeStr), &sourceCodeValue);
        JSVM_Script script;
        OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
        JSVM_Status res = OH_JSVM_RunScript(env, script, &jsVmResult);
        if (res != JSVM_OK) {
            RunScriptFail(nEnv, env);
        }
        ConvertResults(env, jsVmResult, nEnv, &nResult);
    }
    return nResult;
}

void GetJsCode(napi_env nEnv, napi_callback_info nInfo, char *buf)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_get_cb_info(nEnv, nInfo, &argc, argv, nullptr, nullptr);
    napi_get_value_string_utf8(nEnv, argv[0], buf, RUN_JS_CODE_LENGTH, nullptr);
}

static napi_value RunJsVm(napi_env nEnv, napi_callback_info nInfo)
{
    char *buf = (char *)malloc(RUN_JS_CODE_LENGTH);
    WaitPropertyDescriptor();
    if (buf == nullptr) {
        return nullptr;
    }
    GetJsCode(nEnv, nInfo, buf);
    JSVM_InitOptions initOptions;
    if (memset_s(&initOptions, sizeof(initOptions), 0, sizeof(initOptions)) != EOK) {
        return nullptr;
    }
    initOptions.externalReferences = g_externalsSnapshot;
    if (aa == 0) {
        aa++;
        OH_JSVM_Init(&initOptions);
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, sizeof(jsDescriptor) / sizeof(jsDescriptor[0]), jsDescriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    napi_value nResult = ExecuteJsScript(nEnv, env, buf);
    if (nResult == nullptr) {
        return nullptr;
    }
    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_DestroyVM(vm);
    return nResult;
}

#include <iostream>

[[maybe_unused]] static napi_value WasmTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_wasm.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value ArrayBufferBackingStoreTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_array_buffer_backing_store.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value TraceTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_trace.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value SetMicrotaskPolicy(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_microtask_policy.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value PromiseRegisterHandler(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_promise.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value ProxyTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_proxy.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value WrapperObjectTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_wrapper_object.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value WellKnownSymbolsTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_well_known_symbols.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value DefineClassWithOptionsTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_define_class_with_options.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value TriggerExceptionsTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_trigger_exceptions.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value TriggerGCTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_trigger_gc.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value PrivateTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_private.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

[[maybe_unused]] static napi_value ExternalStringTest(napi_env env, napi_callback_info info) {
  (void)RunTestsWithPrefix("test_external_string.cpp");
  napi_value result;
  napi_create_int32(env, 0, &result);
  return result;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    napi_value typedArrayTypes;
    napi_create_object(env, &typedArrayTypes);
    const char* typeKeys[] = {
        "INT8_ARRAY",   "UINT8_ARRAY",   "UINT8_CLAMPED_ARRAY", "INT16_ARRAY",    "UINT16_ARRAY",
        "INT32_ARRAY",  "UINT32_ARRAY",  "FLOAT32_ARRAY",       "FLOAT64_ARRAY",  "BIGINT64_ARRAY",
        "BIGUINT64_ARRAY"
    };
    for (int32_t i = 0; i < sizeof(typeKeys) / sizeof(typeKeys[0]); i++) {
        napi_value typeIndex;
        napi_create_int32(env, i, &typeIndex);
        napi_set_named_property(env, typedArrayTypes, typeKeys[i], typeIndex);
    }
    napi_property_descriptor properties[] = {
        DECLARE_NAPI_FUNCTION("testEngineAndContext",testEngineAndContext),
        DECLARE_NAPI_FUNCTION("testError",testError),
        DECLARE_NAPI_FUNCTION("testTypeError",testTypeError),
        DECLARE_NAPI_FUNCTION("testRangeError",testRangeError),
        DECLARE_NAPI_FUNCTION("testSyntaxError",testSyntaxError),
        DECLARE_NAPI_FUNCTION("testClearError",testClearError),
        DECLARE_NAPI_FUNCTION("testLifeCycle",testLifeCycle),
        DECLARE_NAPI_FUNCTION("testLifeCycle2", testLifeCycle2),
        DECLARE_NAPI_FUNCTION("testCreateData1",testCreateData1),
        DECLARE_NAPI_FUNCTION("testCreateData2",testCreateData2),
        DECLARE_NAPI_FUNCTION("testCreateData3",testCreateData3),
        DECLARE_NAPI_FUNCTION("testCreateData4",testCreateData4),
        DECLARE_NAPI_FUNCTION("testCreateData5",testCreateData5),
        DECLARE_NAPI_FUNCTION("testGetData1",testGetData1),
        DECLARE_NAPI_FUNCTION("testGetData2",testGetData2),
        DECLARE_NAPI_FUNCTION("testValueOperation",testValueOperation),
        DECLARE_NAPI_FUNCTION("testValueOperation2",testValueOperation2),
        DECLARE_NAPI_FUNCTION("testValueOperation3", testValueOperation3),
        DECLARE_NAPI_FUNCTION("testValueOperation4", testValueOperation4),
        DECLARE_NAPI_FUNCTION("testValueOperation5", testValueOperation5),
        DECLARE_NAPI_FUNCTION("testValueOperation6", testValueOperation6),
        DECLARE_NAPI_FUNCTION("testValueOperation7", testValueOperation7),
        DECLARE_NAPI_FUNCTION("testValueOperation8", testValueOperation8),
        DECLARE_NAPI_FUNCTION("testGetPropertyNames",testGetPropertyNames),
        DECLARE_NAPI_FUNCTION("testGetAllPropertyNames",testGetAllPropertyNames),
        DECLARE_NAPI_FUNCTION("testProperty",testProperty),
        DECLARE_NAPI_FUNCTION("testDefineProperties",testDefineProperties),
        DECLARE_NAPI_FUNCTION("testWrap",testWrap),
        DECLARE_NAPI_FUNCTION("testOthers",testOthers),
        DECLARE_NAPI_FUNCTION("Add",Add),
        DECLARE_NAPI_FUNCTION("Add1",Add1),
        DECLARE_NAPI_FUNCTION("testSecondOperations",testSecondOperations),
        DECLARE_NAPI_FUNCTION("testDefinePropertyHandle",testDefinePropertyHandle),
        DECLARE_NAPI_FUNCTION("testIsCallable", testIsCallable),
        DECLARE_NAPI_FUNCTION("testHandleMicrotasks", testHandleMicrotasks),
        DECLARE_NAPI_FUNCTION("runJsVm", RunJsVm),
        {"TypedArrayTypes", nullptr, nullptr, nullptr, nullptr, typedArrayTypes, napi_default, nullptr},
        DECLARE_NAPI_FUNCTION("testMultithreadFunction", testMultithreadFunction),
        DECLARE_NAPI_FUNCTION("testJswmInterface", testJswmInterface),
        DECLARE_NAPI_FUNCTION("testCompileWithOption", testCompileWithOption),
        DECLARE_NAPI_FUNCTION("testRetainScript", testRetainScript),
        DECLARE_NAPI_FUNCTION("testOpenInspectorWithName", testOpenInspectorWithName),
        DECLARE_NAPI_FUNCTION("testArrayBuffer", testArrayBuffer),
        DECLARE_NAPI_FUNCTION("testArrayBuffer2", testArrayBuffer2),
        DECLARE_NAPI_FUNCTION("testArrayBuffer3", testArrayBuffer3),
        DECLARE_NAPI_FUNCTION("testWasmOperator", testWasmOperator),
        DECLARE_NAPI_FUNCTION("wrapperObjectTest", WrapperObjectTest),
        DECLARE_NAPI_FUNCTION("wellKnownSymbolsTest", WellKnownSymbolsTest),
        DECLARE_NAPI_FUNCTION("traceTest", TraceTest),
        DECLARE_NAPI_FUNCTION("defineClassWithOptionsTest", DefineClassWithOptionsTest),
        DECLARE_NAPI_FUNCTION("triggerExceptionsTest", TriggerExceptionsTest),
        DECLARE_NAPI_FUNCTION("triggerGCTest", TriggerGCTest),
        DECLARE_NAPI_FUNCTION("SetMicrotaskPolicy", SetMicrotaskPolicy),
        DECLARE_NAPI_FUNCTION("PromiseRegisterHandler", PromiseRegisterHandler),
        DECLARE_NAPI_FUNCTION("ProxyTest", ProxyTest),
        DECLARE_NAPI_FUNCTION("privateTest", PrivateTest),
        DECLARE_NAPI_FUNCTION("externalStringTest", ExternalStringTest),
        DECLARE_NAPI_FUNCTION("wasmTest", WasmTest),
        DECLARE_NAPI_FUNCTION("arrayBufferBackingStoreTest", ArrayBufferBackingStoreTest),
        DECLARE_NAPI_FUNCTION("testSetDebugOption", testSetDebugOption),
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
