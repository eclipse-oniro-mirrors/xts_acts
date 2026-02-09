/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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

#include "common/native_common.h"
#include "napi/native_api.h"
#include <securec.h>
#include <pthread.h>
#include <stdint.h>
#include <string>
#include <stdio.h>
#include <vector>
#include <malloc.h>
#include <cstdlib>
#include <ctime>
#include <thread>
#include <unistd.h>
#include <memory.h>
#include <uv.h>

static napi_ref test_reference = NULL;
const int TAG_NUMBER = 666;
const int NUMBER_FIVE = 5;
const int THREAD_NAME_LENGTH = 20;
const int INVALID_PARAM_WITH_NOWAIT = 0;
const int INVALID_PARAM_WITH_DEFAULT = 1;
const int RUN_IN_MAIN_THREAD_WITH_NOWAIT = 2;
const int RUN_IN_MAIN_THREAD_WITH_DEFAULT = 3;
const int RUN_IN_WORKER_THREAD_WITH_NOWAIT = 4;
const int RUN_IN_WORKER_THREAD_WITH_DEFAULT = 5;
const int RUN_NAPI_LOOP_WITH_NOWAIT = 6;
const int RUN_NAPI_LOOP_WITH_DEFAULT = 7;
const int RUN_NAPI_LOOP_AFTER_RUN_FINISH = 8;
const int WITHOUT_RUN_NAPI_LOOP = 9;
const int DIFF_VALUE_ONE = 2;
const int DIFF_VALUE_TWO = 4;
const int PARAM_SIZE_TWO = 2;
const int INVALID_PARAM_WITH_STOP_LOOP = 0;
const int STOP_LOOP_IN_MAIN_THREAD = 1;
const int STOP_LOOP_IN_WORKER_THREAD = 2;
const int STOP_LOOP_BEFORE_RUN = 3;
const int STOP_LOOP_AFTER_RUN = 4;
static int g_delCount = 0;
static int g_cleanupHookCount = 0;
static napi_env g_sharedEnv = nullptr;
static napi_deferred g_deferred = nullptr;
static bool g_isTaskFinished = false;
const int NAPI_ERROR_LENGTH = 11;
const int NAPI_STRING_LENGTH = 3;
const int NAPI_UTF8_LENGTH = 256;
const int NAPI_REF_COUNT = 2;
const int NAPI_ARGC_LENGTH = 2;
const int NAPI_COPIED_VALUE = 3;
const int NAPI_INVALID_NUM1 = -2;
const int NAPI_INVALID_NUM2 = -5;
const int NAPI_UTF8_MAX = 255;
const int NAPI_ARGS_LENGTH = 2;
const uint32_t NAPI_NATIVE_VALUE1 = 11;
const uint32_t NAPI_NATIVE_VALUE2 = 22;
static constexpr int INT_ARG_100 = 100;


struct CallbackData {
    napi_threadsafe_function tsfn;
    napi_async_work work;
};

struct InstanceData {
    size_t value;
    bool print;
    napi_ref jsCbRef;
};

struct AsyncData {
    uv_async_t async;
    napi_env env;
    napi_async_cleanup_hook_handle handle;
};

struct AddonData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    napi_ref callback = nullptr;
    double args = 0;
    double result = 0;
};

struct AsyncContext {
    napi_env env;
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int num1 = 0;
    int num2 = 0;
    int sum = 0;
};

static napi_value ResolvedCallback(napi_env env, napi_callback_info info)
{
    void *toStopTheLoop;
    size_t argc = 0;
    if (napi_get_cb_info(env, info, &argc, nullptr, nullptr, &toStopTheLoop) != napi_ok) {
        return nullptr;
    }
    auto flag = reinterpret_cast<int *>(toStopTheLoop);
    if (*flag == 1) {
        napi_stop_event_loop(env);
    }
    return nullptr;
}

static napi_value RejectedCallback(napi_env env, napi_callback_info info)
{
    napi_stop_event_loop(env);
    return nullptr;
}
static void add_returned_status(napi_env env,
                                const char* key,
                                napi_value object,
                                const char* expected_message,
                                napi_status expected_status,
                                napi_status actual_status)
{
    char napi_message_string[100] = "";
    napi_value prop_value;

    if (actual_status != expected_status) {
        printf("Invalid status [%d]", actual_status);
    }

    NAPI_CALL_RETURN_VOID(env,
            napi_create_string_utf8(env,
                    (actual_status == expected_status ?
                    expected_message :
                    napi_message_string),
                    NAPI_AUTO_LENGTH,
                    &prop_value));
    NAPI_CALL_RETURN_VOID(env,
            napi_set_named_property(env,
                    object,
                    key,
                    prop_value));
}

static void add_last_status(napi_env env, const char* key, napi_value return_value)
{
    napi_value prop_value;
    const napi_extended_error_info* p_last_error;
    NAPI_CALL_RETURN_VOID(env, napi_get_last_error_info(env, &p_last_error));

    NAPI_CALL_RETURN_VOID(env,
            napi_create_string_utf8(env,
                    (p_last_error->error_message == nullptr ?
                    "napi_ok" :
                    p_last_error->error_message),
                    NAPI_AUTO_LENGTH,
                    &prop_value));
    NAPI_CALL_RETURN_VOID(env, napi_set_named_property(env,
            return_value,
            key,
            prop_value));
}

static napi_value getLastErrorInfo(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_string_utf8(env, "xyz", 3, &value));
    double double_value;
    napi_status status = napi_get_value_double(env, value, &double_value);
    NAPI_ASSERT(env, status != napi_ok, "Failed to produce error condition");
    const napi_extended_error_info * error_info = 0;
    NAPI_CALL(env, napi_get_last_error_info(env, &error_info));

    NAPI_ASSERT(env, error_info->error_code == status,
            "Last error info code should match last status");
    NAPI_ASSERT(env, error_info->error_message,
            "Last error info message should not be null");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, error_info->error_code, &_value));
    return _value;
}

static napi_value cleanUpErrorInfo(napi_env env, napi_callback_info info)
{
    const napi_extended_error_info * error_info = 0;
    NAPI_CALL(env, napi_get_last_error_info(env, &error_info));

    napi_value result;
    bool is_ok = error_info->error_code == napi_ok;
    NAPI_CALL(env, napi_get_boolean(env, is_ok, &result));

    return result;
}

static napi_value throwExistingError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "600", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "test error", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "error succes");
    bool isError = false;
    napi_is_error(env, error, &isError);
    NAPI_ASSERT(env, isError, "error succes");

    NAPI_CALL(env, napi_throw(env, error));

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value throwError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "600", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "test error", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "error succes");
    bool isError = false;
    napi_is_error(env, error, &isError);
    NAPI_ASSERT(env, isError, "error succes");
    napi_throw_error(env, "500", "Common error");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value throwTypeError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "type error 500", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_type_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "error succes");
    bool isError = false;
    napi_is_error(env, error, &isError);
    NAPI_ASSERT(env, isError, "error succes");
    napi_throw_type_error(env, nullptr, "type error1");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value throwRangeError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "range error 500", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_range_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "error succes");
    bool isError = false;
    napi_is_error(env, error, &isError);
    NAPI_ASSERT(env, isError, "error succes");
    napi_throw_range_error(env, nullptr, "range error");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value isError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    bool r;
    NAPI_CALL(env, napi_is_error(env, args[0], &r));

    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, r, &result));

    return result;
}

static napi_value createError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;

    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "common error", NAPI_AUTO_LENGTH, &message);

    napi_value error = nullptr;
    napi_create_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "error succes");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value createTypeError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "type error", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_type_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "error succes");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value createRangeError(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "range error", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_range_error(env, code, message, &error);

    NAPI_ASSERT(env, error != nullptr, "error succes");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value getAndClearLastException(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "600", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "tag range error", NAPI_AUTO_LENGTH, &message);
    
    napi_value error = nullptr;
    napi_create_range_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "tag error succes");

    bool isError = false;
    napi_is_error(env, error, &isError);
    NAPI_ASSERT(env, isError, "tag isError 1");

    napi_value ex;
    napi_get_and_clear_last_exception(env, &ex);
    
    bool exceptionWasPending = true;
    napi_is_exception_pending(env, &exceptionWasPending);
    NAPI_ASSERT(env, !exceptionWasPending, "tag !exceptionWasPending 1");
    
    napi_throw(env, error);
    
    napi_is_exception_pending(env, &exceptionWasPending);
    NAPI_ASSERT(env, exceptionWasPending, "tag exceptionWasPending 2");
        
    napi_value ex1;
    napi_get_and_clear_last_exception(env, &ex1);
    isError = false;
    napi_is_error(env, ex1, &isError);
    NAPI_ASSERT(env, isError, "tag isError 2");
    
    napi_is_exception_pending(env, &exceptionWasPending);
    NAPI_ASSERT(env, !exceptionWasPending, "tag !exceptionWasPending 3");

    return ex1;
}

static napi_value isExceptionPending(napi_env env, napi_callback_info info)
{
    bool exceptionWasPending = true;
    napi_is_exception_pending(env, &exceptionWasPending);

    NAPI_ASSERT(env, !exceptionWasPending, "isExceptionPending failed");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value openAndCloseHandleScope(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope;
    napi_status openStatus = napi_open_handle_scope(env, &scope);
    napi_value output = nullptr;
    napi_status createStatus = napi_create_object(env, &output);
    napi_status closeStatus = napi_close_handle_scope(env, scope);
    if (openStatus == napi_ok && createStatus == napi_ok && closeStatus == napi_ok) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }
    return output;
}

static napi_value openAndCloseEscapableHandleScope(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = nullptr;
    napi_value escapee = nullptr;
    NAPI_CALL(env, napi_create_object(env, &output));
    NAPI_CALL(env, napi_escape_handle(env, scope, output, &escapee));
    NAPI_CALL(env, napi_close_escapable_handle_scope(env, scope));
    return escapee;
}

static napi_value createReference(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_create_int32(env, TAG_NUMBER, &result);
    NAPI_CALL(env, napi_create_reference(env, result, 1, &test_reference));
    napi_value value;        
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value getAndDeleteReference(napi_env env, napi_callback_info info)
{
    NAPI_ASSERT(env, test_reference != nullptr,
            "A reference must have been created.");

    napi_value refValue = nullptr;
    napi_get_reference_value(env, test_reference, &refValue);

    int32_t value = 0;
    napi_get_value_int32(env, refValue, &value);
    NAPI_ASSERT(env, value == TAG_NUMBER,
            "refValue expect equal to 666.");

    NAPI_CALL(env, napi_delete_reference(env, test_reference));
    test_reference = nullptr;
    return nullptr;
}

static napi_value referenceRefAndUnref(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_ref resultRef = nullptr;
    uint32_t resultRefCount = 0;

    napi_create_object(env, &result);
    napi_create_reference(env, result, 1, &resultRef);
    
    napi_reference_ref(env, resultRef, &resultRefCount);
    NAPI_ASSERT(env, resultRefCount == 2,
            "resultRefCount expect equal to 2");
    napi_reference_unref(env, resultRef, &resultRefCount);
    NAPI_ASSERT(env, resultRefCount == 1,
            "resultRefCount expect equal to 1.");

    napi_value refValue = nullptr;
    napi_get_reference_value(env, resultRef, &refValue);
    NAPI_ASSERT(env, refValue != nullptr,
                "A reference must have been created.");
    napi_delete_reference(env, resultRef);
    resultRef = nullptr;

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value createArrayAndGetLength(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an array as first argument.");

    napi_value ret;
    NAPI_CALL(env, napi_create_array(env, &ret));

    uint32_t i, length;
    NAPI_CALL(env, napi_get_array_length(env, args[0], &length));

    for (i = 0; i < length; i++) {
        napi_value e;
        NAPI_CALL(env, napi_get_element(env, args[0], i, &e));
        NAPI_CALL(env, napi_set_element(env, ret, i, e));
    }
    return ret;
}

static napi_value getArrayWithLength(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an integer the first argument.");

    uint32_t array_length = 0;
    NAPI_CALL(env, napi_get_array_length(env, args[0], &array_length));
    NAPI_ASSERT(env, array_length == 2, "array_length expect equal to 2");

    napi_value ret;
    NAPI_CALL(env, napi_create_array_with_length(env, array_length, &ret));
    for (uint32_t i = 0; i < array_length * 2; i++) {
        napi_value e;
        NAPI_CALL(env, napi_create_uint32(env, i, &e));
        NAPI_CALL(env, napi_set_element(env, ret, i, e));
    }
    
    return ret;
}

static napi_value createExternal(napi_env env, napi_callback_info info)
{
    const char testStr[] = "test";
    napi_value external = nullptr;
    napi_create_external(
        env, (void*)testStr,
        [](napi_env env, void* data, void* hint) {},
        (void*)testStr, &external);
    void* tempExternal = nullptr;
    NAPI_CALL(env, napi_get_value_external(env, external, &tempExternal));
    NAPI_ASSERT(env, tempExternal != nullptr, "tempExternal expect not equal to nullptr");
    NAPI_ASSERT(env, tempExternal == testStr, "tempExternal expect equal to testStr");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value createExternalArraybuffer(napi_env env, napi_callback_info info)
{
    int* testInt = (int*)malloc(sizeof(int));
    *testInt = TAG_NUMBER;
    napi_value external = nullptr;
    size_t arrayBufferSize = 1024;

    napi_create_external_arraybuffer(
        env, (void*)testInt, arrayBufferSize,
        [](napi_env env, void* data, void* hint) {
            int* temp = static_cast<int*>(data);
            free(temp);
            temp = nullptr;
        },
        (void*)testInt, &external);
    
    return external;
}

static napi_value createObject(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    NAPI_ASSERT(env, result != nullptr, "napi_create_object");
    return result;
}

static napi_value createSymbol(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value description = nullptr;
    if (argc >= 1) {
        napi_valuetype valuetype;
        NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

        NAPI_ASSERT(env, valuetype == napi_string,
                "Wrong type of arguments. Expects a string.");

        description = args[0];
    }

    napi_value symbol;
    NAPI_CALL(env, napi_create_symbol(env, description, &symbol));

    napi_valuetype valuetypeSymbol;
    NAPI_CALL(env, napi_typeof(env, symbol, &valuetypeSymbol)); 

    NAPI_ASSERT(env, valuetypeSymbol == napi_symbol,
                "Wrong type of arguments. Expects a string.");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;            
}

static napi_value createTypeArray(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);

    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    
    NAPI_ASSERT(env, arrayBufferPtr == tmpArrayBufferPtr, "napi_get_arraybuffer_info success");
    NAPI_ASSERT(env, arrayBufferSize ==  arrayBufferLength, "napi_create_arraybuffer success");

    napi_value _value;
    napi_create_typedarray(env, napi_int32_array, typedArrayLength, arrayBuffer, 0, &_value);
        
    return _value;
}

static napi_value createDataView(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "napi_create_arraybuffer success");
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, " napi_is_arraybuffer success");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, &result));

    bool isDataView = false;
    napi_is_dataview(env, result, &isDataView);
    NAPI_ASSERT(env, isDataView, " napi_is_dataview success");
    
    return result;
}

static napi_value createAndGetInt32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t value;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_int32(env, value, &output));

    return output;
}

static napi_value createAndGetUInt32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    uint32_t value;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, value, &output));

    return output;
}

static napi_value createAndGetInt64(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int64_t value;
    NAPI_CALL(env, napi_get_value_int64(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_int64(env, (double)value, &output));

    return output;
}

static napi_value createDouble(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    double value;
    NAPI_CALL(env, napi_get_value_double(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, value, &output));

    return output;
}

static napi_value createAndGetStringLatin1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_latin1(env, args[0], buffer, bufferSize, &copied));
    NAPI_ASSERT(env, copied == 3, "napi_get_value_string_latin1 fail");

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

    return output;
}

static napi_value createAndGetStringUtf8(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_utf8(env, args[0], buffer, bufferSize, &copied));
    NAPI_ASSERT(env, copied == 2, "napi_get_value_string_utf8 fail");

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));

    return output;
}

static napi_value StringUtf8OfLengthLeZero(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc == 1, "Expects one argument.");

    napi_valuetype valueType;
    NAPI_CALL(env, napi_typeof(env, args[0], &valueType));

    NAPI_ASSERT(env, valueType == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_utf8(env, args[0], buffer, bufferSize, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, -1, &output));

    return output;
}

static napi_value CreateAndGetStringUtf16(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments.");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string, "Expect a string.");

    char16_t buffer[128]; // 128: char16_t type of element size
    size_t bufferSize = 128; // 128: char16_t type of element size
    size_t copied = 0;

    NAPI_CALL(env, napi_get_value_string_utf16(env, args[0], buffer, bufferSize, &copied));

    napi_value result;
    NAPI_CALL(env, napi_create_string_utf16(env, buffer, copied, &result));

    return result;
}

static napi_value StringUtf16OfCase(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments.");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string, "Expects a string.");

    char16_t buffer[5]; // 5: char16_t type of element size
    size_t bufferSize = 5; // 5: char16_t type of element size
    size_t copied  = 0;

    NAPI_CALL(env,
        napi_get_value_string_utf16(env, args[0], buffer, bufferSize, &copied));

    napi_value result;
    NAPI_CALL(env, napi_create_string_utf16(env, buffer, copied, &result));

    return result;
}

static napi_value StringUtf16OfLengthLeZero(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc == 1, "Expects one argument.");

    napi_valuetype valueType;
    NAPI_CALL(env, napi_typeof(env, args[0], &valueType));

    NAPI_ASSERT(env, valueType == napi_string, "Expects a string.");

    char16_t buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_utf16(env, args[0], buffer, bufferSize, &copied));

    napi_value result;
    NAPI_CALL(env, napi_create_string_utf16(env, buffer, -1, &result));

    return result;
}

static napi_value StringUtf16OfLengthEqOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc == 1, "Expects one argument.");

    char16_t buffer[128];
    size_t bufferSize = 1;
    size_t copied = 1;

    NAPI_CALL(env,
        napi_get_value_string_utf16(env, args[0], buffer, bufferSize, &copied));

    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, copied, &value));
    return value;
}

static const napi_type_tag typeTags[NUMBER_FIVE] = {
    {0xdaf987b3cc62481a, 0xb745b0497f299531},
    {0xbb7936c374084d9b, 0xa9548d0762eeedb9},
    {0xa5ed9ce2e4c00c38, 0xa9548d0762eeedb1},
    {0, 0},
    {0xa5ed9ce2e4c00c38, 0xdaf987b3cc62481a},
};

static napi_value TypeTaggedInstance(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    uint32_t typeIndex = 0;
    napi_value instance = nullptr;
    napi_value whichType = nullptr;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &whichType, nullptr, nullptr));
    NAPI_CALL(env, napi_get_value_uint32(env, whichType, &typeIndex));
    NAPI_ASSERT(env, typeIndex <= NUMBER_FIVE, "typeIndex out of range");
    NAPI_CALL(env, napi_create_object(env, &instance));

    NAPI_CALL(env, napi_type_tag_object(env, instance, &typeTags[typeIndex]));
    return instance;
}

static napi_value CheckTypeTag(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    bool result;
    napi_value argv[2];
    napi_value jsResult = nullptr;
    uint32_t typeIndex;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr));

    NAPI_CALL(env, napi_get_value_uint32(env, argv[0], &typeIndex));

    NAPI_ASSERT(env, typeIndex <= NUMBER_FIVE, "typeIndex out of range");

    NAPI_CALL(env, napi_check_object_type_tag(env, argv[1], &typeTags[typeIndex], &result));
    NAPI_CALL(env, napi_get_boolean(env, result, &jsResult));

    return jsResult;
}

static napi_value getPrototype(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH, [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);

    napi_value customClassPrototype = nullptr;
    NAPI_CALL(env, napi_get_prototype(env, testWrapClass, &customClassPrototype));
    NAPI_ASSERT(env, customClassPrototype != nullptr, "napi_get_prototype fail");
    
    return customClassPrototype;
}

static napi_value getPrototype2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_function,
            "Wrong type of argment. Expects a napi_function.");

    napi_value customClassPrototype = nullptr;
    NAPI_CALL(env, napi_get_prototype(env, args[0], &customClassPrototype));
    NAPI_ASSERT(env, customClassPrototype != nullptr, "napi_get_prototype fail");
    
    return customClassPrototype;
}

static napi_value getTypedArrayInfo(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "getTypedArrayInfo napi_create_arraybuffer fail");
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, "getTypedArrayInfo napi_is_arraybuffer fail");
    napi_value result;
    napi_create_typedarray(env, napi_int32_array, typedArrayLength, arrayBuffer, 0, &result);

    bool isTypedArray = false;
    napi_is_typedarray(env, result, &isTypedArray);
    NAPI_ASSERT(env, isTypedArray, "getTypedArrayInfo napi_is_dataview fail");

    napi_typedarray_type type;
    size_t length = 0;
    void* data = nullptr;
    napi_value retArrayBuffer;
    size_t byteOffset = -1;
    NAPI_CALL(env, napi_get_typedarray_info(env, result, &type, &length, &data, &retArrayBuffer, &byteOffset));
    NAPI_ASSERT(env, type == napi_int32_array, "napi_get_typedarray_info success 0");
    NAPI_ASSERT(env, length == arrayBufferSize, "napi_get_typedarray_info success 1");
    NAPI_ASSERT(env, data == arrayBufferPtr, "napi_get_dataview_info success 2");

    bool retIsArrayBuffer = false;
    NAPI_CALL(env, napi_is_arraybuffer(env, retArrayBuffer, &retIsArrayBuffer));
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    NAPI_CALL(env, napi_get_arraybuffer_info(env, retArrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength));
    
    NAPI_ASSERT(env, byteOffset == 0, "napi_get_dataview_info success 3");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value getDataViewInfo(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "getDataViewInfo napi_create_arraybuffer fail");
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, "getDataViewInfo napi_is_arraybuffer fail");
    napi_value result = nullptr;
    napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, &result);

    bool isDataView = false;
    napi_is_dataview(env, result, &isDataView);
    NAPI_ASSERT(env, isDataView, "getDataViewInfo napi_is_dataview fail");

    napi_value retArrayBuffer = nullptr;
    void* data = nullptr;
    size_t byteLength = 0;
    size_t byteOffset = -1;
    napi_get_dataview_info(env, result, &byteLength, &data, &retArrayBuffer, &byteOffset);

    bool retIsArrayBuffer = false;
    napi_is_arraybuffer(env, retArrayBuffer, &retIsArrayBuffer);
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    napi_get_arraybuffer_info(env, retArrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);

    NAPI_ASSERT(env, arrayBufferLength == arrayBufferSize, "napi_get_dataview_info success 0");
    NAPI_ASSERT(env, arrayBufferPtr == data, "napi_get_dataview_info success 1");
    NAPI_ASSERT(env, byteOffset == 0, "napi_get_dataview_info success 2");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;  
}

static napi_value getValueBool(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    bool value;
    NAPI_CALL(env, napi_get_value_bool(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_get_boolean(env, value, &output));

    return output;
}

static napi_value getValueDouble(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    double value;
    NAPI_CALL(env, napi_get_value_double(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, value, &output));

    return output;
}

static napi_value getValueExternal(napi_env env, napi_callback_info info)
{
    const char testStr[] = "test";
    napi_value external = nullptr;
    napi_create_external(
        env, (void*)testStr,
        [](napi_env env, void* data, void* hint) {},
        (void*)testStr, &external);
    void* tempExternal = nullptr;
    napi_get_value_external(env, external, &tempExternal);

    NAPI_ASSERT(env, tempExternal == testStr, "napi_get_value_external true");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value getNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_get_null(env, &result));
    NAPI_ASSERT(env, result != nullptr, "napi_get_null success");
    napi_valuetype type;
    NAPI_CALL(env, napi_typeof(env, result, &type));
    NAPI_ASSERT(env, type == napi_null, "napi_get_null fail");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value getUndefined(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_get_undefined(env, &result));
    NAPI_ASSERT(env, result != nullptr, "napi_get_undefined success");
    napi_valuetype type;
    NAPI_CALL(env, napi_typeof(env, result, &type));
    NAPI_ASSERT(env, type == napi_undefined, "napi_get_undefined fail");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value coerceToBool(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_bool(env, args[0], &output));

    return output;
}

static napi_value coerceToNumber(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_number(env, args[0], &output));

    return output;
}

static napi_value coerceToObject(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_object(env, args[0], &output));

    return output;
}

static napi_value coerceToString(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_string(env, args[0], &output));

    return output;
}

static napi_value instanceOf(napi_env env, napi_callback_info info)
{
    napi_value customClass = nullptr;

    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        }, nullptr, 0, nullptr, &customClass);

    napi_value customClassPrototype = nullptr;
    napi_get_prototype(env, customClass, &customClassPrototype);
    
    napi_value customInstance = nullptr;
    NAPI_CALL(env, napi_new_instance(env, customClass, 0, nullptr, &customInstance));

    bool isInstanceOf = false;
    NAPI_CALL(env, napi_instanceof(env, customInstance, customClass, &isInstanceOf));

    NAPI_ASSERT(env, isInstanceOf, "isInstanceOf success");

    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, isInstanceOf, &result));

    return result;
}

static napi_value NapiIsSendable(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isSendable = false;
    napi_is_sendable(env, args[0], &isSendable);
    napi_value result;
    napi_get_boolean(env, isSendable, &result);
    return result;
}

static napi_value NapiDefineSendableClass(napi_env env, napi_callback_info info)
{
    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {
        {"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };

    napi_value sendableClass = nullptr;
    napi_define_sendable_class(
        env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {
                {"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr,
                 [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 },
                 nullptr, nullptr, nullptr, napi_default, nullptr},
            };
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        },
        nullptr, sizeof(props) / sizeof(props[0]), props, nullptr, &sendableClass);

    return sendableClass;
}

static napi_value NapiCreateSendableObject(napi_env env, napi_callback_info info)
{
    napi_value val_true;
    napi_get_boolean(env, true, &val_true);
    napi_property_descriptor desc[] = {
        {"x", nullptr, nullptr, nullptr, nullptr, val_true, napi_default_jsproperty, nullptr},
    };
    napi_value obj;
    napi_create_sendable_object_with_properties(env, 1, desc, &obj);
    return obj;
}

static napi_value NapiCreateSendableArray(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_sendable_array(env, &result);
    return result;
}

static napi_value NapiCreateSendableArrayWithLength(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_sendable_array_with_length(env, 1, &result);
    return result;
}

static napi_value NapiCreateSendableArrayBuffer(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    void* data;
    napi_value result = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &result);
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, result, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, "napi_is_arraybuffer success");
    return result;
}

static napi_value NapiCreateSendableTypedArray(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);

    napi_value result = nullptr;
    napi_create_sendable_typedarray(env, napi_uint8_array, length, arraybuffer, offset, &result);
    bool isTypedArray = false;
    napi_is_typedarray(env, result, &isTypedArray);
    NAPI_ASSERT(env, isTypedArray, "napi_is_typedarray success");
    return result;
}

static napi_value NapiWrapSendable(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);

    napi_wrap_sendable(
        env, args[0], (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr);
    return args[0];
}

static napi_value NapiWrapSendableWithSize(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);

    static size_t nativeBindingSize = 1024;
    napi_wrap_sendable_with_size(
        env, args[0], (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr, nativeBindingSize);
    return args[0];
}

static napi_value NapiUnwrapSendable(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char* data = nullptr;
    napi_unwrap_sendable(env, args[0], (void**)&data);

    napi_value result = nullptr;
    napi_create_string_utf8(env, data, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value NapiRemoveWrapSendable(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char* data = nullptr;
    napi_remove_wrap_sendable(env, args[0], (void**)&data);

    napi_value result = nullptr;
    napi_create_string_utf8(env, data, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value isArray(napi_env env, napi_callback_info info)
{
    napi_value array = nullptr;
    napi_create_array(env, &array);
    NAPI_ASSERT(env, array != nullptr, "napi_get_undefined success");
    bool isArray = false;
    napi_is_array(env, array, &isArray);
    NAPI_ASSERT(env, isArray, "napi_is_arrayd success");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value isDate(napi_env env, napi_callback_info info)
{
    napi_value date, result;
    size_t argc = 1;
    bool is_date = false;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &date, nullptr, nullptr));
    NAPI_CALL(env, napi_is_date(env, date, &is_date));
    NAPI_CALL(env, napi_get_boolean(env, is_date, &result));

    return result;
}

static napi_value strictEquals(napi_env env, napi_callback_info info)
{
    const char* testStringStr = "test";
    napi_value testString = nullptr;
    napi_create_string_utf8(env, testStringStr, strlen(testStringStr), &testString);
    bool isStrictEquals = false;
    napi_strict_equals(env, testString, testString, &isStrictEquals);
    NAPI_ASSERT(env, isStrictEquals, "napi_strict_equals success 0");

    napi_value testObject = nullptr;
    napi_create_object(env, &testObject);
    isStrictEquals = false;
    napi_strict_equals(env, testObject, testObject, &isStrictEquals);
    NAPI_ASSERT(env, isStrictEquals, "napi_strict_equals success 1");

    napi_value napi_number1 = nullptr;
    napi_value napi_number2 = nullptr;
    napi_create_double(env, 10.1, &napi_number1);
    napi_create_int32(env, 10, &napi_number2);
    isStrictEquals = true;
    napi_strict_equals(env, napi_number1, napi_number2, &isStrictEquals);
    NAPI_ASSERT(env, !isStrictEquals, "napi_strict_equals success 2");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value getPropertyNames(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));

    NAPI_ASSERT(env, result != nullptr, "napi_create_object success");

    const char testStr[] = "1234567";
    napi_value strAttribute = nullptr;

    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &strAttribute));
    NAPI_ASSERT(env, strAttribute != nullptr, "napi_create_string_utf8 success");

    NAPI_CALL(env, napi_set_named_property(env, result, "strAttribute", strAttribute));
    bool hasNamedProperty = false;
    NAPI_CALL(env, napi_has_named_property(env, result, "strAttribute", &hasNamedProperty));
    NAPI_ASSERT(env, hasNamedProperty, "napi_has_named_property fail");

    napi_value retStrAttribute = nullptr;
    NAPI_CALL(env, napi_get_named_property(env, result, "strAttribute", &retStrAttribute));
    NAPI_ASSERT(env, retStrAttribute != nullptr, "napi_get_named_property success");
    napi_valuetype type;
    NAPI_CALL(env, napi_typeof(env, retStrAttribute, &type));
    NAPI_ASSERT(env, type == napi_string, "napi_get_named_property fail");
    napi_value res;
    napi_coerce_to_number(env, retStrAttribute, &res);
    int32_t num = 0;
    napi_get_value_int32(env, res, &num);
    NAPI_ASSERT(env, num == 1234567, "getPropertyNames fail");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value setProperty(napi_env env,
                              napi_callback_info info)
{
    napi_status status;
    napi_value object, key, value;

    NAPI_CALL(env, napi_create_object(env, &object));

    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));

    NAPI_CALL(env, napi_create_object(env, &value));

    status = napi_set_property(nullptr, object, key, value);

    add_returned_status(env,
            "envIsNull",
            object,
            "Invalid argument",
            napi_invalid_arg,
            status);

    napi_set_property(env, nullptr, key, value);

    add_last_status(env, "objectIsNull", object);

    napi_set_property(env, object, nullptr, value);

    add_last_status(env, "keyIsNull", object);

    napi_set_property(env, object, key, nullptr);

    add_last_status(env, "valueIsNull", object);

    return object;
}

static napi_value getProperty(napi_env env,
                              napi_callback_info info)
{
    napi_status status;
    napi_value object, key, result;

    NAPI_CALL(env, napi_create_object(env, &object));

    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));

    NAPI_CALL(env, napi_create_object(env, &result));

    status = napi_get_property(nullptr, object, key, &result);

    add_returned_status(env,
            "envIsNull",
            object,
            "Invalid argument",
            napi_invalid_arg,
            status);

    napi_get_property(env, nullptr, key, &result);

    add_last_status(env, "objectIsNull", object);

    napi_get_property(env, object, nullptr, &result);

    add_last_status(env, "keyIsNull", object);

    napi_get_property(env, object, key, nullptr);

    add_last_status(env, "resultIsNull", object);

    return object;
}

static napi_value hasProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));

    const char testStr[] = "1234567";
    napi_value strAttribute = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &strAttribute));
    NAPI_CALL(env, napi_set_named_property(env, result, "strAttribute", strAttribute));

    napi_value retStrAttribute = nullptr;
    NAPI_CALL(env, napi_get_named_property(env, result, "strAttribute", &retStrAttribute));

    int32_t testNumber = 12345;
    napi_value numberAttribute = nullptr;
    NAPI_CALL(env, napi_create_int32(env, testNumber, &numberAttribute));
    NAPI_CALL(env, napi_set_named_property(env, result, "numberAttribute", numberAttribute));

    napi_value propNames = nullptr;
    NAPI_CALL(env, napi_get_property_names(env, result, &propNames));
    NAPI_ASSERT(env, propNames != nullptr, "napi_get_property_names success");

    bool isArray = false;
    NAPI_CALL(env, napi_is_array(env, propNames, &isArray));
    NAPI_ASSERT(env, isArray, "napi_is_array success");

    uint32_t arrayLength = 0;
    NAPI_CALL(env, napi_get_array_length(env, propNames, &arrayLength));

    for (uint32_t i = 0; i < arrayLength; i++) {
        bool hasElement = false;
        NAPI_CALL(env, napi_has_element(env, propNames, i, &hasElement));
        NAPI_ASSERT(env, hasElement, "napi_has_element success");

        napi_value propName = nullptr;
        NAPI_CALL(env, napi_get_element(env, propNames, i, &propName));
        NAPI_ASSERT(env, propName != nullptr, "napi_get_element success");

        bool hasProp = false;
        napi_has_property(env, result, propName, &hasProp);
        NAPI_ASSERT(env, hasProp, "napi_get_element success");

        napi_value propValue = nullptr;
        napi_get_property(env, result, propName, &propValue);
        NAPI_ASSERT(env, propValue != nullptr, "napi_get_property success");
    }

    bool deletion = false;
    NAPI_CALL(env, napi_delete_element(env, propNames, 1, &deletion));
    NAPI_ASSERT(env, deletion, "napi_delete_element fail");
    bool hasElement = true;
    NAPI_CALL(env, napi_has_element(env, propNames, 1, &hasElement));
    NAPI_ASSERT(env, !hasElement, "napi_has_element fail");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value setAndDeleteProperty(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc == 2, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, args[1], &valuetype1));
    NAPI_ASSERT(env, valuetype1 == napi_string || valuetype1 == napi_symbol,
            "Wrong type of arguments. Expects a string or symbol as second.");

    const char testStr[] = "cKey";
    napi_value cKey;
    napi_value cValue;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &cKey));
    NAPI_CALL(env, napi_create_int32(env, 3, &cValue));
    NAPI_CALL(env, napi_set_property(env, args[0], cKey, cValue));

    bool hasProp = false;
    NAPI_CALL(env, napi_has_property(env, args[0], cKey, &hasProp));
    NAPI_ASSERT(env, hasProp, "setAndDeleteProperty napi_has_property fail 1");

    bool result;
    napi_value ret;
    NAPI_CALL(env, napi_delete_property(env, args[0], cKey, &result));
    NAPI_CALL(env, napi_get_boolean(env, result, &ret));
    NAPI_CALL(env, napi_has_property(env, args[0], cKey, &hasProp));
    NAPI_ASSERT(env, !hasProp, "setAndDeleteProperty napi_has_property fail 2");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value hasOwnProperty(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc == 2, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    bool has_property;
    NAPI_CALL(env, napi_has_own_property(env, args[0], args[1], &has_property));

    napi_value ret;
    NAPI_CALL(env, napi_get_boolean(env, has_property, &ret));

    return ret;
}

static napi_value setNamedProperty(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    char key[256] = "";
    size_t key_length;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 3, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));

    NAPI_ASSERT(env, value_type1 == napi_string,
            "Wrong type of arguments. Expects a string as second.");

    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[1], key, 255, &key_length));
    key[255] = 0;
    NAPI_ASSERT(env, key_length <= 255,
            "Cannot accommodate keys longer than 255 bytes");

    NAPI_CALL(env, napi_set_named_property(env, args[0], key, args[2]));

    napi_value value_true;
    NAPI_CALL(env, napi_get_boolean(env, true, &value_true));

    return value_true;
}

static napi_value getNamedProperty(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    char key[256] = "";
    size_t key_length;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 2, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));

    NAPI_ASSERT(env, value_type1 == napi_string,
            "Wrong type of arguments. Expects a string as second.");

    napi_value object = args[0];
    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[1], key, 255, &key_length));
    key[255] = 0;
    NAPI_ASSERT(env, key_length <= 255,
            "Cannot accommodate keys longer than 255 bytes");
    napi_value output;
    NAPI_CALL(env, napi_get_named_property(env, object, key, &output));

    return output;
}

static napi_value hasNamedProperty(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    char key[256] = "";
    size_t key_length;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 2, "Wrong number of arguments");

    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));

    NAPI_ASSERT(env, value_type0 == napi_object,
            "Wrong type of arguments. Expects an object as first argument.");

    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));

    NAPI_ASSERT(env, value_type1 == napi_string || value_type1 == napi_symbol,
            "Wrong type of arguments. Expects a string as second.");

    NAPI_CALL(env,
            napi_get_value_string_utf8(env, args[1], key, 255, &key_length));
    key[255] = 0;
    NAPI_ASSERT(env, key_length <= 255,
            "Cannot accommodate keys longer than 255 bytes");

    bool has_property;
    NAPI_CALL(env, napi_has_named_property(env, args[0], key, &has_property));

    napi_value ret;
    NAPI_CALL(env, napi_get_boolean(env, has_property, &ret));

    return ret;
}

static napi_value setElement(napi_env env, napi_callback_info info)
{
    napi_value return_value, object;

    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            napi_set_element(nullptr, object, 0, object));

    napi_set_element(env, nullptr, 0, object);
    add_last_status(env, "objectIsNull", return_value);


    napi_set_property(env, object, 0, nullptr);
    add_last_status(env, "valueIsNull", return_value);

    return return_value;
}

static napi_value getElement(napi_env env, napi_callback_info info)
{
    napi_value return_value, object, prop;

    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            napi_get_element(nullptr, object, 0, &prop));

    napi_get_property(env, nullptr, 0, &prop);
    add_last_status(env, "objectIsNull", return_value);

    napi_get_property(env, object, 0, nullptr);
    add_last_status(env, "valueIsNull", return_value);

    return return_value;
}

static napi_value TestBoolValuedElementApi(napi_env env,
                                           napi_status (* api)(napi_env, napi_value, uint32_t, bool*))
{
    napi_value return_value, object;
    bool result;

    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            api(nullptr, object, 0, &result));

    api(env, nullptr, 0, &result);
    add_last_status(env, "objectIsNull", return_value);

    api(env, object, 0, nullptr);
    add_last_status(env, "valueIsNull", return_value);

    return return_value;
}

static napi_value hasElement(napi_env env, napi_callback_info info)
{
    return TestBoolValuedElementApi(env, napi_has_element);
}

static napi_value deleteElement(napi_env env, napi_callback_info info)
{
    return TestBoolValuedElementApi(env, napi_delete_element);
}

static napi_value defineProperties(napi_env env, napi_callback_info info)
{
    napi_value object, return_value;

    napi_property_descriptor desc = {"prop", NULL, defineProperties, NULL, NULL, NULL, napi_enumerable, NULL};

    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_object(env, &return_value));

    add_returned_status(env,
            "envIsNull",
            return_value,
            "Invalid argument",
            napi_invalid_arg,
            napi_define_properties(nullptr, object, 1, &desc));

    napi_define_properties(env, nullptr, 1, &desc);
    add_last_status(env, "objectIsNull", return_value);

    napi_define_properties(env, object, 1, nullptr);
    add_last_status(env, "descriptorListIsNull", return_value);

    desc.utf8name = nullptr;
    napi_define_properties(env, object, 1, nullptr);
    add_last_status(env, "utf8nameIsNull", return_value);
    desc.utf8name = "prop";

    desc.method = nullptr;
    napi_define_properties(env, object, 1, nullptr);
    add_last_status(env, "methodIsNull", return_value);
    desc.method = defineProperties;

    return return_value;
}

static napi_value MyConstructor(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    size_t argc = 0;
    napi_value constructor = nullptr;
    napi_get_cb_info(env, info, &argc, nullptr, &thisVar, nullptr);
    napi_get_new_target(env, info, &constructor);
    if (constructor == nullptr) {
        napi_throw_error(env, nullptr, "is not new instance");
    }
    return thisVar;
}

static napi_value NewTargetTest(napi_env env, napi_callback_info info)
{
    bool isConstructor = true;
    napi_value constructor = nullptr;
    napi_get_new_target(env, info, &constructor);
    if (constructor == nullptr) {
        napi_throw_error(env, nullptr, "is not new instance");
        isConstructor = false;
    }
    napi_value value;
    NAPI_CALL(env, napi_get_boolean(env, isConstructor, &value));

    return value;
}

static napi_value wrap(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "test";
    napi_wrap(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, nullptr);
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value unwrap(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "test";
    napi_wrap(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, nullptr);

    const char* tmpTestStr = nullptr;
    NAPI_CALL(env, napi_unwrap(env, instanceValue, (void**)&tmpTestStr));
    NAPI_ASSERT(env, tmpTestStr == testStr, "napi_unwrap fail");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value removeWrap(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "test";
    napi_wrap(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, nullptr);

    const char* tmpTestStr = nullptr;
    NAPI_CALL(env, napi_unwrap(env, instanceValue, (void**)&tmpTestStr));
    NAPI_ASSERT(env, tmpTestStr == testStr, "napi_unwrap fail");

    const char* tmpTestStr1 = nullptr;
    napi_remove_wrap(env, instanceValue, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, tmpTestStr1 == testStr, "napi_remove_wrap fail 1");

    NAPI_CALL(env, napi_unwrap(env, instanceValue, (void**)&tmpTestStr1));
    NAPI_ASSERT(env, tmpTestStr1 == nullptr, "napi_remove_wrap fail");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value getVersion(napi_env env, napi_callback_info info)
{
    uint32_t version;
    napi_value result;
    NAPI_CALL(env, napi_get_version(env, &version));
    NAPI_CALL(env, napi_create_uint32(env, version, &result));
    return result;
}

static napi_value createPromise(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_create_promise(env, &deferred, &promise);
    NAPI_ASSERT(env, deferred != nullptr, "create promise success");
    NAPI_ASSERT(env, promise != nullptr, "create promise success");
        
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value resolveAndRejectDeferred(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    NAPI_CALL(env, napi_create_promise(env, &deferred, &promise));

    bool isPromise = false;
    napi_is_promise(env, promise, &isPromise);

    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    NAPI_CALL(env, napi_resolve_deferred(env, deferred, undefined));

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value isPromise(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    NAPI_CALL(env, napi_create_promise(env, &deferred, &promise));
        
    bool isPromise = false;
    NAPI_CALL(env, napi_is_promise(env, promise, &isPromise));
    NAPI_ASSERT(env, isPromise, "napi_is_promise success");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value runScript(napi_env env, napi_callback_info info)
{
    napi_value script, result;
    size_t argc = 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &script, nullptr, nullptr));

    NAPI_CALL(env, napi_run_script(env, script, &result));

    return result;
}

static napi_value getUvEventLoop(napi_env env, napi_callback_info info)
{
    struct uv_loop_s* loop = nullptr;

    NAPI_CALL(env, napi_get_uv_event_loop(env, &loop));
    NAPI_ASSERT(env, loop != nullptr, "napi_get_uv_event_loop fail");

    return nullptr;
}

static napi_value TestLatin1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t bufferSize = 128;
    size_t copied;

    NAPI_CALL(env,
            napi_get_value_string_latin1(env, args[0], buffer, bufferSize, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

    return output;
}

static napi_value TestUtf8(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc == 1, "Expects one argument.");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t bufferSize = 128;
    size_t copied;

    NAPI_CALL(env,
        napi_get_value_string_utf8(env, args[0], buffer, bufferSize, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));

    return output;
}

static napi_value TestUtf16(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc == 1, "Expects one argument.");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char16_t buffer[128];
    size_t bufferSize = 128;
    size_t copied;

    NAPI_CALL(env,
        napi_get_value_string_utf16(env, args[0], buffer, bufferSize, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf16(env, buffer, copied, &output));

    return output;
}
// test the napi function
static napi_value napCreateArrayBuffer(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_status status = napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    NAPI_ASSERT(env, arrayBuffer != nullptr, "success create_arrayBuffer");
    
    return arrayBuffer;
}

static napi_value napiGetCbInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "get_cb_info ok");
    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");
    double value;
    napi_get_value_double(env, args[0], &value);
    
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));
    NAPI_ASSERT(env, valuetype == napi_number, "Wrong type of argment. Expects a nunber.");

    napi_value returnValue;
    napi_status statusDouble = napi_create_double(env, value, &returnValue);
    NAPI_ASSERT(env, statusDouble == napi_ok, "success to napi_create_double");

    return returnValue;
}

static napi_value naiGetArrayBufferInfo(napi_env env, napi_callback_info info)
{
    // the value to return
    napi_value arrayBuffer;
    napi_status status;
    void* yourPointer = nullptr;
    size_t arrayBufferSize = 1024;
    status = napi_create_arraybuffer(env, arrayBufferSize, &yourPointer, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    status = napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_get_arraybuffer_info");
  
    napi_value arrayLength;
    // return the length of array js type int
    NAPI_CALL(env, napi_create_int32(env, arrayBufferLength, &arrayLength));
    
    return arrayLength;
}

static napi_value napiDefineClass(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH, [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);
      
    napi_value instanceValue = nullptr;
    napi_new_instance(env, testWrapClass, 0, nullptr, &instanceValue);
    NAPI_ASSERT(env, instanceValue != nullptr, "success napiDefineClass");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static napi_value napiRunScriptPath(napi_env env, napi_callback_info info)
{
    napi_value value;
    const char* path =  "pages/index.ets";
    napi_status status = napi_run_script_path(env, path, &value);
    NAPI_ASSERT(env, status == napi_ok, "napi_run_script_path ok");
    NAPI_ASSERT(env, value != nullptr, "napi_run_script_path success");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiLoadModule(napi_env env, napi_callback_info info)
{
    napi_value value;
    const char* path =  "@ohos.hilog";
    napi_status status = napi_load_module(env, path, &value);
    NAPI_ASSERT(env, status == napi_ok, "napi_load_module ok");
    NAPI_ASSERT(env, value != nullptr, "napi_load_module success");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiGetNodeVersion(napi_env env, napi_callback_info info)
{
    napi_value value;
    const napi_node_version* version;
    napi_get_node_version(env, &version);
    const char* release = version->release;
    napi_status status = napi_create_string_utf8(env, release, strlen(release), &value);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_string_utf8 ok");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiCallThreadsafeFunction(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_threadsafe_function func = (napi_threadsafe_function)data;
    napi_threadsafe_function_call_mode blockMode = napi_tsfn_nonblocking;
    void* context = nullptr;
    napi_status status = napi_get_threadsafe_function_context(func, &context);
    NAPI_ASSERT(env, status != napi_ok, "napi_get_threadsafe_function_context fail");
    static int32_t gSendData = 0;
    napi_call_threadsafe_function(func, &gSendData, blockMode);
    status = napi_call_threadsafe_function(func, &gSendData, blockMode);
    NAPI_ASSERT(env, status != napi_ok, "napi_call_threadsafe_function fail");
    napi_release_threadsafe_function(func, napi_tsfn_release);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static napi_value napiCreateThreadsafeFunction(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t  callJstCbDataTestId = 101;
    int32_t  finalCbtDataTestID = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, resourceName,
                                                         0, 1, &callJstCbDataTestId, nullptr,
                                                         &finalCbtDataTestID, nullptr, &tsFunc);
    NAPI_ASSERT(env, status != napi_ok, "napi_create_threadsafe_function failed");
    
    napi_acquire_threadsafe_function(tsFunc);
    status = napi_unref_threadsafe_function(env, tsFunc);
    NAPI_ASSERT(env, status != napi_ok, "napi_unref_threadsafe_function failed");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static void AddExecuteCB(napi_env env, void *data) {
    AddonData *addonData = (AddonData *)data;
    addonData->result = addonData->args;
}

static void AddCallbackCompleteCB(napi_env env, napi_status status, void *data) {
    AddonData *addonData = (AddonData *)data;
    napi_value callback = nullptr;
    NAPI_CALL_RETURN_VOID(env, napi_get_reference_value(env, addonData->callback, &callback));
    napi_value result = nullptr;
    NAPI_CALL_RETURN_VOID(env, napi_create_double(env, addonData->result, &result));
    napi_value callbackResult = nullptr;

    int32_t ret = 0;
    NAPI_CALL_RETURN_VOID(env, napi_call_function(env, nullptr, callback, 1, &result, &callbackResult));
    NAPI_CALL_RETURN_VOID(env, napi_get_value_int32(env, callbackResult, &ret));
    NAPI_ASSERT_RETURN_VOID(env, ret == 2000, "AddCallbackCompleteCB failed");

    if (addonData->callback != nullptr) {
        NAPI_CALL_RETURN_VOID(env, napi_delete_reference(env, addonData->callback));
        addonData->callback = nullptr;
    }

    NAPI_CALL_RETURN_VOID(env, napi_delete_async_work(env, addonData->asyncWork));
    free(addonData);
}

static napi_value testAsyncWork(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    if (addonData == nullptr) {
        return nullptr;
    }

    NAPI_CALL(env, napi_get_value_double(env, args[0], &addonData->args));
    NAPI_CALL(env, napi_create_reference(env, args[1], 1, &addonData->callback));

    napi_value resourceName = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "AsyncWorkTest", NAPI_AUTO_LENGTH, &resourceName));
    NAPI_CALL(env, napi_create_async_work(env, nullptr, resourceName, AddExecuteCB, AddCallbackCompleteCB,
        (void *)addonData, &addonData->asyncWork));

    NAPI_CALL(env, napi_queue_async_work(env, addonData->asyncWork));

    napi_value _value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static void AddPromiseCompleteCB(napi_env env, napi_status status, void *data) {
    AddonData *addonData = (AddonData *)data;
    napi_value result = nullptr;
    NAPI_CALL_RETURN_VOID(env, napi_create_double(env, addonData->result, &result));
    if (addonData->result > 0) {
        NAPI_CALL_RETURN_VOID(env, napi_resolve_deferred(env, addonData->deferred, result));
    } else {
        NAPI_CALL_RETURN_VOID(env, napi_reject_deferred(env, addonData->deferred, result));
    }

    NAPI_CALL_RETURN_VOID(env, napi_delete_async_work(env, addonData->asyncWork));
    free(addonData);
    addonData = nullptr;
}

static napi_value testPromise(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    NAPI_CALL(env, napi_create_promise(env, &deferred, &promise));

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    if (addonData == nullptr) {
        return nullptr;
    }
    addonData->deferred = deferred;

    NAPI_CALL(env, napi_get_value_double(env, args[0], &addonData->args));

    napi_value resourceName = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "AsyncCallback", NAPI_AUTO_LENGTH, &resourceName));
    NAPI_CALL(env, napi_create_async_work(env, nullptr, resourceName, AddExecuteCB,
        AddPromiseCompleteCB, (void *)addonData, &addonData->asyncWork));

    napi_queue_async_work(env, addonData->asyncWork);

    return promise;
}

static napi_value napiCancelAsyncWork(napi_env env, napi_callback_info info)
{
    napi_async_work work = nullptr;
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "AsyncWorkTest", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, [](napi_env value, void* data) {},
                           [](napi_env env, napi_status status, void* data) {}, nullptr, &work);
    NAPI_CALL(env, napi_cancel_async_work(env, work));
    napi_delete_async_work(env, work);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static napi_value SayHello(napi_env env, napi_callback_info info)
{
    printf("Hello\n");
    napi_value ret;
    NAPI_CALL(env, napi_create_int32(env, TAG_NUMBER, &ret));
    return ret;
}

static napi_value napiCreateFunction(napi_env env, napi_callback_info info)
{
    napi_value funcValue = nullptr;
    napi_status status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, SayHello, nullptr, &funcValue);
    NAPI_ASSERT(env, funcValue != nullptr, "napi_create_function fail");
    NAPI_ASSERT(env, status == napi_ok, "napi_create_function fail");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 1, &value));
    
    return funcValue;
}

static napi_value NapiCreateFunctionTwo(napi_env env, napi_callback_info info)
{
    napi_value resultValue = nullptr;
    napi_status status = napi_create_function(env, nullptr, NAPI_AUTO_LENGTH, SayHello, nullptr, &resultValue);
    if (resultValue == nullptr) {
        napi_throw_error(env, nullptr, "napi_create_function fail");
        return nullptr;
    }
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_create_function fail");
        return nullptr;
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 1, &value));

    return resultValue;
}

static napi_value napiRefthreadSafeFunction(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t callJsCbDataTestId = 101;
    int32_t finalCbDataTestId = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, resourceName,
                                                         0, 1, &callJsCbDataTestId,
                                                         nullptr, &finalCbDataTestId, nullptr, &tsFunc);
    NAPI_ASSERT(env, status != napi_ok, "napi_create_threadsafe_function failed");
    
    status = napi_ref_threadsafe_function(env, tsFunc);
    NAPI_ASSERT(env, status != napi_ok, "napi_ref_threadsafe_function");
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    
    return _value;
}

static napi_value napiCreateDate(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_status status = napi_create_date(env, time, &createResult);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_date success");
    double getTime = false;
    napi_get_date_value(env, createResult, &getTime);
    bool result = false;
    if (time == getTime) {
        result = true;
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, result, &value));
    
    return value;
}

static napi_value napiCreateBigintUint64(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
         
    uint64_t resultValue = 0;
    bool flag = false;
    napi_get_value_bigint_uint64(env, result, &resultValue, &flag);
    NAPI_ASSERT(env, resultValue == testValue, "napi_get_value_bigint_int64 failed");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, flag, &value));
    
    return value;
}

static napi_value napiCreateBigintInt64(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_int64(env, testValue, &result);
    int64_t resultValue = 0;
    bool flag = false;
    napi_get_value_bigint_int64(env, result, &resultValue, &flag);
    NAPI_ASSERT(env, resultValue == testValue, "napi_get_value_bigint_int64 failed");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, flag, &value));
    
    return value;
}

static napi_value napiCreateBigintWords(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    int retSignBit = -1;
    size_t retWordCount = 4;
    NAPI_CALL(env, napi_get_value_bigint_words(env, result, &retSignBit, &retWordCount, wordsOut));
    bool testResult = true;
    if (retSignBit != signBit || retWordCount != wordCount) {
        testResult = false;
    }
    for (size_t i = 0; i < wordCount; i++) {
        if (wordsOut[i] != words[i]) {
            testResult = false;
            break;
        }
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, testResult, &value));
    
    return value;
}

static napi_value callFunction(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_function,
            "Wrong type of argment. Expects a string.");
    napi_value ret;
    NAPI_CALL(env, napi_call_function(env, nullptr, args[0], 0, nullptr, &ret));
    return ret;
}

static napi_value getGlobal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_get_global(env, &result));
    NAPI_ASSERT(env, result != nullptr, "napi_get_global failed");
    return nullptr;
}

napi_threadsafe_function tsfn;
napi_ref functionRef;
static void CallJs(napi_env env, napi_value jsCb, void *context, void *data) {
    
    napi_value undefined;
    NAPI_CALL_RETURN_VOID(env, napi_get_undefined(env, &undefined));
    napi_value cb;
    NAPI_CALL_RETURN_VOID(env, napi_get_reference_value(env, functionRef, &cb));
    
    napi_value ret;
    int32_t num = 0;
    NAPI_CALL_RETURN_VOID(env, napi_call_function(env, undefined, cb, 0, nullptr, &ret));
    NAPI_CALL_RETURN_VOID(env, napi_get_value_int32(env, ret, &num));
    NAPI_ASSERT_RETURN_VOID(env, num == TAG_NUMBER, "CallJs fail");
}

static napi_value ThreadSafeTest(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value jsCb, work_name;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &jsCb, nullptr, nullptr));
    napi_create_reference(env, jsCb, 1, &functionRef);

    NAPI_CALL(env, napi_create_string_utf8(env, "work_name", NAPI_AUTO_LENGTH, &work_name));

    napi_valuetype valueType = napi_undefined;
    NAPI_CALL(env, napi_typeof(env, jsCb, &valueType));
    NAPI_ASSERT(env, valueType == napi_function, "valueType expect equal to napi_function");
    
    const char* context = "context";
    NAPI_CALL(env, napi_create_threadsafe_function(env, jsCb, nullptr, work_name, 0, 1, nullptr, nullptr,
        const_cast<void*>(reinterpret_cast<const void*>(context)), CallJs, &tsfn));
    void* retContext = nullptr;
    NAPI_CALL(env, napi_get_threadsafe_function_context(tsfn, &retContext));
    NAPI_ASSERT(env, retContext == context, "napi_get_threadsafe_function_context failed");

    napi_acquire_threadsafe_function(tsfn);
    napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_blocking);

    NAPI_CALL(env, napi_ref_threadsafe_function(env, tsfn));
    NAPI_CALL(env, napi_unref_threadsafe_function(env, tsfn));
    NAPI_CALL(env, napi_release_threadsafe_function(tsfn, napi_tsfn_release));
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 1, &_value));
    return _value;
}

static void NoopDeleter(napi_env env, void* data, [[maybe_unused]] void* finalizeHint)
{
    g_delCount++;
}

static const char TEST_STR[] =
    "Where there is a will, there is a way.";

static void DelTest(napi_env env, void* data, [[maybe_unused]] void* finalizeHint)
{
    free(data);
    g_delCount++;
}

static napi_value CreateBuffer(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), &napiBuffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create buffer");
        return nullptr;
    }
    NAPI_ASSERT(env, copyPtr, "Unable to duplicate static text for CreateBuffer.");
    int ret = memcpy_s(copyPtr, bufferSize, TEST_STR, strlen(TEST_STR) + 1);
    NAPI_ASSERT(env, ret == 0, "memcpy_s failed");
    return napiBuffer;
}

static napi_value CreateExternalBuffer(napi_env env, napi_callback_info info)
{
    char* copyPtr = strdup(TEST_STR);
    napi_value napiBuffer;
    const unsigned int bufferSize = sizeof(TEST_STR);

    NAPI_ASSERT(env, copyPtr, "Unable to duplicate static text for CreateExternalBuffer.");
    NAPI_CALL(env,
              napi_create_external_buffer(env,
                                          bufferSize,
                                          copyPtr,
                                          DelTest,
                                          nullptr /* finalizeHint */,
                                          &napiBuffer));
    return napiBuffer;
}

static napi_value BufferCopy(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_value napiBuffer;
    void* dataPtr = nullptr;
    napi_status status = napi_create_buffer_copy(env, bufferSize, TEST_STR, &dataPtr, &napiBuffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create buffer");
        return nullptr;
    }
    return napiBuffer;
}

static napi_value IsBuffer(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    size_t argc = 1;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    NAPI_ASSERT(env, argc == 1, "The number of arguments provided is incorrect.");
    napi_value napiBuffer = args[0];
    bool result;
    napi_status status = napi_is_buffer(env, napiBuffer, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "The parameter instance is not of type buffer.");
    }
    napi_value returnValue;
    NAPI_CALL(env, napi_get_boolean(env, result, &returnValue));
    return returnValue;
}

static napi_value GetBufferInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    const unsigned int bufferSize = sizeof(TEST_STR);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    NAPI_ASSERT(env, argc == 1, "Incorrect number of parameters.");
    napi_value napiBuffer = args[0];
    char *bufferData;
    napi_value returnValue;
    size_t bufferLength;
    if (napi_get_buffer_info(env, napiBuffer, (void**)(&bufferData), &bufferLength) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get buffer info.");
        return nullptr;
    }
    NAPI_CALL(env, napi_get_boolean(env,
                                    !strcmp(bufferData, TEST_STR) && bufferLength == bufferSize,
                                    &returnValue));
    return returnValue;
}

static napi_value StaticBuffer(napi_env env, napi_callback_info info)
{
    napi_value napiBuffer;
    const unsigned int bufferSize = sizeof(TEST_STR);
    NAPI_CALL(env,
              napi_create_external_buffer(env,
                                          bufferSize,
                                          (void*)TEST_STR,
                                          NoopDeleter,
                                          nullptr /* finalizeHint */,
                                          &napiBuffer));
    return napiBuffer;
}

static napi_value GetSymbolNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_valuetype valueType0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valueType0));
    if (valueType0 != napi_object) {
        napi_throw_error(env, nullptr, "Wrong type of arguments. Expects an object as first argument.");
        return nullptr;
    }
    napi_value output;
    NAPI_CALL(env,
              napi_get_all_property_names(env,
                                          args[0],
                                          napi_key_include_prototypes,
                                          napi_key_skip_strings,
                                          napi_key_numbers_to_strings,
                                          &output));
    return output;
}

static napi_value GetEnumerableWritableNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_valuetype valueType0;
    if (napi_typeof(env, args[0], &valueType0) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get argument type");
        return nullptr;
    }
    if (valueType0 != napi_object) {
        napi_throw_error(env, nullptr, "Wrong type of arguments. Expects an object as first argument.");
        return nullptr;
    }
    napi_value output;
    NAPI_CALL(env,
              napi_get_all_property_names(env,
                                          args[0],
                                          napi_key_include_prototypes,
                                          static_cast<napi_key_filter>(napi_key_writable | napi_key_enumerable),
                                          napi_key_numbers_to_strings,
                                          &output));
    return output;
}

static napi_value GetOwnWritableNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_valuetype valueType0;
    if (napi_typeof(env, args[0], &valueType0) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get argument type");
        return nullptr;
    }
    if (valueType0 != napi_object) {
        napi_throw_error(env, nullptr, "Wrong type of arguments. Expects an object as first argument.");
        return nullptr;
    }
    napi_value output;
    NAPI_CALL(env,
              napi_get_all_property_names(env,
                                          args[0],
                                          napi_key_own_only,
                                          napi_key_writable,
                                          napi_key_numbers_to_strings,
                                          &output));
    return output;
}

static napi_value GetEnumerableConfigurableNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_valuetype valueType0;
    if (napi_typeof(env, args[0], &valueType0) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get argument type");
        return nullptr;
    }
    if (valueType0 != napi_object) {
        napi_throw_error(env, nullptr, "Wrong type of arguments. Expects an object as first argument.");
        return nullptr;
    }
    napi_value output;
    NAPI_CALL(env,
              napi_get_all_property_names(env,
                                          args[0],
                                          napi_key_include_prototypes,
                                          static_cast<napi_key_filter>(napi_key_enumerable | napi_key_configurable),
                                          napi_key_numbers_to_strings,
                                          &output));
    return output;
}

static napi_value GetOwnConfigurableNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_valuetype valueType0;
    if (napi_typeof(env, args[0], &valueType0) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get argument type");
        return nullptr;
    }
    if (valueType0 != napi_object) {
        napi_throw_error(env, nullptr, "Wrong type of arguments. Expects an object as first argument.");
        return nullptr;
    }
    napi_value output;
    NAPI_CALL(env,
              napi_get_all_property_names(env,
                                          args[0],
                                          napi_key_own_only,
                                          napi_key_configurable,
                                          napi_key_numbers_to_strings,
                                          &output));
    return output;
}

static napi_value GetAllPropertyNames(napi_env env, napi_callback_info info)
{
    napi_value returnValue, props;
    NAPI_CALL(env, napi_create_object(env, &returnValue));
    add_returned_status(env,
                        "envIsNull",
                        returnValue,
                        "Invalid argument",
                        napi_invalid_arg,
                        napi_get_all_property_names(nullptr,
                                                    returnValue,
                                                    napi_key_own_only,
                                                    napi_key_writable,
                                                    napi_key_keep_numbers,
                                                    &props));
    napi_get_all_property_names(env,
                                nullptr,
                                napi_key_own_only,
                                napi_key_writable,
                                napi_key_keep_numbers,
                                &props);
    add_last_status(env, "objectIsNull", returnValue);
    napi_get_all_property_names(env,
                                returnValue,
                                napi_key_own_only,
                                napi_key_writable,
                                napi_key_keep_numbers,
                                nullptr);
    add_last_status(env, "valueIsNull", returnValue);
    return returnValue;
}

static napi_value FreezeTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    // Check if argument is an object
    napi_value objectConstructor;
    napi_status status = napi_get_named_property(env, args[0], "Object", &objectConstructor);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Argument must be an object");
    }
    // Freeze the object
    napi_value object = args[0];
    NAPI_CALL(env, napi_object_freeze(env, object));
    return object;
}

static napi_value SealTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    // Check if argument is an object
    napi_value objectConstructor;
    napi_status status = napi_get_named_property(env, args[0], "Object", &objectConstructor);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Argument must be an object");
    }
    // Seal the object
    napi_value object = args[0];
    NAPI_CALL(env, napi_object_seal(env, object));

    return object;
}

void FinalizeCallback(napi_env env, void* finalizeData, void* finalizeHint)
{
    free(finalizeData);
}

static napi_value External(napi_env env, napi_callback_info info)
{
    const uint8_t parraySize  = 3;
    void* externalData = malloc(parraySize  * sizeof(int8_t));

    //Sets the three elements of the array that are used to create an ArrayBuffer object
    ((int8_t*)externalData)[0] = 0; // 0 means that the first value of the created array is 0
    ((int8_t*)externalData)[1] = 1; // 1 means that the second value of the created array is 1
    ((int8_t*)externalData)[2] = 2; // 2 means that the third value of the created array is 2

    napi_value outputBuffer;
    napi_status status = napi_create_external_arraybuffer(env,
                                                          externalData,
                                                          parraySize  * sizeof(int8_t),
                                                          FinalizeCallback,
                                                          nullptr,  // finalizeHint
                                                          &outputBuffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external arraybuffer");
        return nullptr;
    }
    napi_value outputArray;
    status = napi_create_typedarray(env,
                                    napi_int8_array,
                                    parraySize,
                                    outputBuffer,
                                    0,
                                    &outputArray);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create typedarray");
        return nullptr;
    }
    return outputArray;
}

static napi_value DetachTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc == 1, "The number of arguments provided is incorrect.");
    void* data;
    size_t length;
    napi_typedarray_type type;
    napi_value arrayBuffer;
    NAPI_CALL(env, napi_get_typedarray_info(env, args[0], &type, &length, &data, &arrayBuffer, nullptr));

    NAPI_CALL(env, napi_detach_arraybuffer(env, arrayBuffer));
    return nullptr;
}

napi_value IsDetachedTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc != 1) {
        napi_throw_error(env, nullptr, "Wrong number of arguments.");
        return nullptr;
    }
    bool isArraybuffer;
    status = napi_is_arraybuffer(env, args[0], &isArraybuffer);
    if (status != napi_ok || !isArraybuffer) {
        napi_throw_error(env, nullptr, "Wrong type of arguments. Expects an array buffer as first argument.");
        return nullptr;
    }
    bool isDetached;
    status = napi_is_detached_arraybuffer(env, args[0], &isDetached);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to check if array buffer is detached.");
        return nullptr;
    }
    napi_value result;
    status = napi_get_boolean(env, isDetached, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create boolean result.");
        return nullptr;
    }
    return result;
}

static void AsyncDestroyCb(napi_env env, void *data, void *hint)
{
    napi_status status = napi_async_destroy(env, (napi_async_context) data);
    // We cannot use NAPI_ASSERT_RETURN_VOID because we need to have a JS
    // stack below in order to use exceptions.
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_async_destroy is failed");
        return;
    }
}

static napi_value CreateAsyncResource(napi_env env, napi_callback_info info)
{
    napi_value asyncContextWrap;
    NAPI_CALL(env, napi_create_object(env, &asyncContextWrap));

    size_t argc = 2; // Number of parameters is 2
    napi_value args[2]; // Number of parameters is 2
    size_t parameterCount = 2; // Number of parameters is 2
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_value resource = args[0];
    napi_value jsDestroyOnFinalizer = args[1];
    napi_valuetype resourceType;
    NAPI_CALL(env, napi_typeof(env, resource, &resourceType));
    if (resourceType != napi_object) {
        resource = nullptr;
    }

    napi_value resourceName;
    NAPI_CALL(env,
              napi_create_string_utf8(env, "test_async", NAPI_AUTO_LENGTH, &resourceName));

    napi_async_context context;
    NAPI_CALL(env, napi_async_init(env, resource, resourceName, &context));

    bool destroyOnFinalizer = true;
    if (argc == parameterCount) {
        NAPI_CALL(env, napi_get_value_bool(env, jsDestroyOnFinalizer, &destroyOnFinalizer));
    }
    if (resourceType == napi_object && destroyOnFinalizer) {
        NAPI_CALL(env,
            napi_add_finalizer(env, resource, reinterpret_cast<void*>(context), AsyncDestroyCb, nullptr, nullptr));
    }
    NAPI_CALL(env,
        napi_wrap(env, asyncContextWrap, context, [](napi_env env, void *data, void *hint) {}, nullptr, nullptr));
    return asyncContextWrap;
}

static napi_value DestroyAsyncResource(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc == 1, "Wrong number of arguments");

    napi_value asyncContextWrap = args[0];

    napi_async_context asyncContext;
    NAPI_CALL(env, napi_remove_wrap(env, asyncContextWrap, (void **)&asyncContext));
    NAPI_CALL(env, napi_async_destroy(env, asyncContext));

    return asyncContextWrap;
}

static napi_value RunInCallbackScope(napi_env env, napi_callback_info info)
{
    size_t argc;
    constexpr size_t parameterCount = 3;
    napi_value args[parameterCount];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, nullptr, nullptr, nullptr));
    NAPI_ASSERT(env, argc == parameterCount, "Wrong number of arguments");

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object,
                "Wrong type of arguments. Expects an object as first argument.");

    NAPI_CALL(env, napi_typeof(env, args[1], &valuetype));
    NAPI_ASSERT(env, valuetype == napi_string,
                "Wrong type of arguments. Expects a string as second argument.");
    constexpr size_t parameterTwo = 2;
    NAPI_CALL(env, napi_typeof(env, args[parameterTwo], &valuetype));
    NAPI_ASSERT(env, valuetype == napi_function,
                "Wrong type of arguments. Expects a function as third argument.");

    napi_async_context context;
    NAPI_CALL(env, napi_async_init(env, args[0], args[1], &context));

    napi_callback_scope scope = nullptr;
    NAPI_CALL(env, napi_open_callback_scope(env, args[0], context, &scope));

    // If the function has an exception pending after the call that is ok
    // so we don't use NAPI_CALL as we must close the callback scope
    // regardless.
    napi_value result = nullptr;
    napi_status functionCallResult =
        napi_call_function(env, args[0], args[parameterTwo], 0, nullptr, &result);
    if (functionCallResult != napi_ok) {
        GET_AND_THROW_LAST_ERROR(env);
    }

    NAPI_CALL(env, napi_close_callback_scope(env, scope));
    NAPI_CALL(env, napi_async_destroy(env, context));

    return result;
}

static void Callback(uv_work_t *req, [[maybe_unused]] int ignored)
{
    napi_env env = g_sharedEnv;

    napi_handle_scope handleScope = nullptr;
    NAPI_CALL_RETURN_VOID(env, napi_open_handle_scope(env, &handleScope));

    napi_value resourceName;
    NAPI_CALL_RETURN_VOID(env,
                          napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &resourceName));
    napi_async_context context;
    NAPI_CALL_RETURN_VOID(env,
                          napi_async_init(env, nullptr, resourceName, &context));

    napi_value resourceObject;
    NAPI_CALL_RETURN_VOID(env, napi_create_object(env, &resourceObject));

    napi_value undefinedValue;
    NAPI_CALL_RETURN_VOID(env, napi_get_undefined(env, &undefinedValue));

    napi_callback_scope scope = nullptr;
    NAPI_CALL_RETURN_VOID(env,
                          napi_open_callback_scope(env, resourceObject, context, &scope));

    NAPI_CALL_RETURN_VOID(env,
                          napi_resolve_deferred(env, g_deferred, undefinedValue));

    NAPI_CALL_RETURN_VOID(env, napi_close_callback_scope(env, scope));

    NAPI_CALL_RETURN_VOID(env, napi_close_handle_scope(env, handleScope));
    NAPI_CALL_RETURN_VOID(env, napi_async_destroy(env, context));
    free(req);
}

static void NoopWork([[maybe_unused]] uv_work_t *work)
{
    return;
}

static napi_value TestResolveAsync(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    if (g_deferred == nullptr) {
        g_sharedEnv = env;
        NAPI_CALL(env, napi_create_promise(env, &g_deferred, &promise));

        uv_loop_t *loop = nullptr;
        NAPI_CALL(env, napi_get_uv_event_loop(env, &loop));

        uv_work_t* req = reinterpret_cast<uv_work_t*>(malloc(sizeof(uv_work_t)));
        uv_queue_work(loop,
                      req,
                      NoopWork,
                      Callback);
    }
    return promise;
}

static void CallCbAndDeleteRef(napi_env env, napi_ref *optionalRef)
{
    napi_value jsCb;
    napi_value undefined;

    napi_ref *ref = optionalRef;
    if (optionalRef == nullptr) {
        InstanceData *data;
        napi_get_instance_data(env, reinterpret_cast<void**>(&data));
        ref = &data->jsCbRef;
    }

    napi_get_reference_value(env, *ref, &jsCb);
    napi_get_undefined(env, &undefined);
    napi_call_function(env, undefined, jsCb, 0, nullptr, nullptr);
    napi_delete_reference(env, *ref);

    *ref = nullptr;
}

static bool EstablishCallbackRef(napi_env env, napi_callback_info info)
{
    InstanceData *data;
    size_t argc = 1;
    napi_value jsCb;

    napi_get_instance_data(env, reinterpret_cast<void**>(&data));

    napi_get_cb_info(env, info, &argc, &jsCb, nullptr, nullptr);
    napi_create_reference(env, jsCb, 1, &data->jsCbRef);

    return true;
}

static void AsyncWorkCbExecute([[maybe_unused]] napi_env env, [[maybe_unused]] void* data)
{
    return;
}

static void AsyncWorkCbComplete(napi_env env,
                                [[maybe_unused]] napi_status status,
                                [[maybe_unused]] void* data)
{
    CallCbAndDeleteRef(env, nullptr);
}

static void DeleteAddonData(napi_env env, void* rawData, void* hint)
{
    InstanceData* data = reinterpret_cast<InstanceData*>(rawData);
    if (data->print) {
        printf("deleting addon data\n");
    }
    if (data->jsCbRef != nullptr) {
        NAPI_CALL_RETURN_VOID(env, napi_delete_reference(env, data->jsCbRef));
        data->jsCbRef = nullptr;
    }
    delete data;
    data = nullptr;
}

static napi_value NapiSetInstanceData(napi_env env, napi_callback_info info)
{
    InstanceData* data = new InstanceData();
    data->value = 1;
    data->print = true;
    data->jsCbRef = nullptr;

    NAPI_CALL(env, napi_set_instance_data(env, data, DeleteAddonData, nullptr));

    InstanceData* getData = nullptr;
    NAPI_CALL(env, napi_get_instance_data(env, reinterpret_cast<void**>(&getData)));
    ++getData->value;
    const size_t expectValue = 2;

    bool res = true;
    NAPI_ASSERT(env, getData->value == expectValue, "napi_get_instance_data failed");

    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, res, &value));

    return value;
}

static napi_value AsyncWorkCallback(napi_env env, napi_callback_info info)
{
    if (EstablishCallbackRef(env, info)) {
        napi_value resourceName;
        napi_async_work work;

        NAPI_CALL(env,
            napi_create_string_utf8(
                env, "AsyncIncrement", NAPI_AUTO_LENGTH, &resourceName));
        NAPI_CALL(env,
            napi_create_async_work(
                env, nullptr, resourceName, AsyncWorkCbExecute, AsyncWorkCbComplete,
                nullptr, &work));
        NAPI_CALL(env, napi_queue_async_work(env, work));
    }

    return nullptr;
}

static void MustNotCall(napi_async_cleanup_hook_handle hook, void* arg)
{
    return;
}

static AsyncData* CreateAsyncData()
{
    AsyncData* data = reinterpret_cast<AsyncData*>(malloc(sizeof(AsyncData)));
    data->handle = nullptr;
    return data;
}

static void AfterCleanupHookTwo(uv_handle_t* handle)
{
    g_cleanupHookCount++;
    AsyncData* data = reinterpret_cast<AsyncData*>(handle->data);
    napi_status status = napi_remove_async_cleanup_hook(data->handle);
    if (status != napi_ok) {
        napi_throw_error(data->env, nullptr, "napi_remove_async_cleanup_hook is failed");
        return;
    }
    free(data);
}

static void AfterCleanupHookOne(uv_async_t* async)
{
    g_cleanupHookCount++;
    uv_close((uv_handle_t*)async, AfterCleanupHookTwo);
}

static void AsyncCleanupHook(napi_async_cleanup_hook_handle handle, void* arg)
{
    g_cleanupHookCount++;
    AsyncData* data = reinterpret_cast<AsyncData*>(arg);
    uv_loop_t* loop = nullptr;
    napi_status status = napi_get_uv_event_loop(data->env, &loop);
    if (status != napi_ok) {
        napi_throw_error(data->env, nullptr, "napi_get_uv_event_loop is failed");
        return;
    }
    int err = uv_async_init(loop, &data->async, AfterCleanupHookOne);
    if (err != 0) {
        napi_throw_error(data->env, nullptr, "uv_async_init is failed");
        return;
    }

    data->async.data = data;
    data->handle = handle;
    uv_async_send(&data->async);
}

static void ObjectFinalizer(napi_env env, void* data, void* hint)
{
    const int cleanupHookCount = 6;
    if (g_cleanupHookCount != cleanupHookCount) {
        napi_throw_error(env, nullptr, "cleanup_hook_count is error");
        return;
    }

    napi_ref *ref = reinterpret_cast<napi_ref *>(data);
    NAPI_CALL_RETURN_VOID(env, napi_delete_reference(env, *ref));
    *ref = nullptr;
    free(ref);
}

static void CreateObjectWrap(napi_env env)
{
    napi_value jsObj;
    napi_ref *ref = reinterpret_cast<napi_ref *>(malloc(sizeof(napi_ref)));
    NAPI_CALL_RETURN_VOID(env, napi_create_object(env, &jsObj));
    NAPI_CALL_RETURN_VOID(
        env, napi_wrap(env, jsObj, ref, ObjectFinalizer, nullptr, ref));
    // create a strong reference so that the finalizer is called at shutdown.
    NAPI_CALL_RETURN_VOID(env, napi_reference_ref(env, *ref, nullptr));
}

static napi_value NapiAsyncCleanUpHook(napi_env env, napi_callback_info exports)
{
    // Reinitialize the static variable to be compatible with musl libc.
    g_cleanupHookCount = 0;
    // Create object wrap before cleanup hooks.
    CreateObjectWrap(env);

    {
        AsyncData* data = CreateAsyncData();
        data->env = env;
        napi_add_async_cleanup_hook(env, AsyncCleanupHook, data, &data->handle);
    }

    {
        AsyncData* data = CreateAsyncData();
        data->env = env;
        napi_add_async_cleanup_hook(env, AsyncCleanupHook, data, nullptr);
    }

    {
        napi_async_cleanup_hook_handle mustNotCallHandle;
        napi_add_async_cleanup_hook(
            env, MustNotCall, nullptr, &mustNotCallHandle);
        napi_remove_async_cleanup_hook(mustNotCallHandle);
    }

    // Create object wrap after cleanup hooks.
    CreateObjectWrap(env);

    return nullptr;
}

static void Cleanup(void* arg)
{
    g_cleanupHookCount++;
    printf("Cleanup(%d)\n", *reinterpret_cast<int*>(arg));
}

static void CustomObjectFinalizer(napi_env env, void* data, void* hint)
{
    // cleanup is called once.
    if (g_cleanupHookCount != 1) {
        napi_throw_error(env, nullptr, "cleanup_hook_count is error");
        return;
    }

    napi_ref *ref = reinterpret_cast<napi_ref *>(data);
    NAPI_CALL_RETURN_VOID(env, napi_delete_reference(env, *ref));
    *ref = nullptr;
    free(ref);
    ref = nullptr;
}

static void ObjectWrapper(napi_env env)
{
    napi_value jsObj;
    napi_ref *ref = reinterpret_cast<napi_ref *>(malloc(sizeof(napi_ref)));
    NAPI_CALL_RETURN_VOID(env, napi_create_object(env, &jsObj));
    NAPI_CALL_RETURN_VOID(
        env, napi_wrap(env, jsObj, ref, CustomObjectFinalizer, nullptr, ref));
    // create a strong reference so that the finalizer is called at shutdown.
    NAPI_CALL_RETURN_VOID(env, napi_reference_ref(env, *ref, nullptr));
}

static napi_value NapiEnvCleanUpHook(napi_env env, napi_callback_info exports)
{
    // Create object wrap before cleanup hooks.
    g_cleanupHookCount = 0;
    static int argValue = 42;
    static int argValueRemoved = 17;
    ObjectWrapper(env);

    napi_add_env_cleanup_hook(env, Cleanup, &argValueRemoved);
    napi_add_env_cleanup_hook(env, Cleanup, &argValue);
    napi_remove_env_cleanup_hook(env, Cleanup, &argValueRemoved);

    // Create object wrap after cleanup hooks.
    CreateObjectWrap(env);

    return nullptr;
}

static napi_value GetModuleFileName(napi_env env, napi_callback_info info)
{
    const char *filename;
    napi_value result;
    node_api_get_module_file_name(env, &filename);
    napi_create_string_utf8(env, filename, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value AsyncWorkWithQos(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    if (addonData == nullptr) {
        return nullptr;
    }

    NAPI_CALL(env, napi_get_value_double(env, args[0], &addonData->args));
    NAPI_CALL(env, napi_create_reference(env, args[1], 1, &addonData->callback));

    napi_value resourceName = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "AsyncWorkWithQosTest", NAPI_AUTO_LENGTH, &resourceName));
    NAPI_CALL(env, napi_create_async_work(env, nullptr, resourceName, AddExecuteCB, AddCallbackCompleteCB,
        (void *)addonData, &addonData->asyncWork));

    NAPI_CALL(env, napi_queue_async_work_with_qos(env, addonData->asyncWork, napi_qos_default));

    napi_value _value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static void* TestDetachCallback(napi_env env, void* nativeObject, void* hint)
{
    printf("this is detach callback");
    return nativeObject;
}

static napi_value TestAttachCallback(napi_env env, void* nativeObject, void* hint)
{
    printf("this is attach callback");
    napi_value object = nullptr;
    napi_value number = nullptr;
    uint32_t data = 0;
    if (hint != nullptr) {
        object = reinterpret_cast<napi_value>(nativeObject);
        data = 2000; // 2000 : Is number.
        napi_create_uint32(env, data, &number);
    } else {
        napi_create_object(env, &object);
        data = 1000; // 1000 : Is number.
        napi_create_uint32(env, data, &number);
    }
    napi_set_named_property(env, object, "number", number);
    return object;
}

static napi_value CreateWithPropertiesTestGetter(napi_env env, napi_callback_info info)
{
    napi_value res;
    napi_get_boolean(env, false, &res);
    return res;
}

static napi_value CreateWithPropertiesTestSetter(napi_env env, napi_callback_info info)
{
    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value CreateObjectWithProperties(napi_env env, napi_callback_info info)
{
    napi_value excep;
    NAPI_CALL(env, napi_get_and_clear_last_exception(env, &excep));
    napi_value val_false;
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, false, &val_false));
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    napi_property_descriptor desc1[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    };
    napi_value obj1;
    NAPI_CALL(env, napi_create_object_with_properties(env, &obj1, 1, desc1));
    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, obj1, &valuetype1));
    napi_value obj2;
    napi_property_descriptor desc2[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("a", val_false),
        DECLARE_NAPI_GETTER_SETTER("b", CreateWithPropertiesTestGetter, CreateWithPropertiesTestSetter),
        DECLARE_NAPI_DEFAULT_PROPERTY("c", obj1),
    };
    NAPI_CALL(env, napi_create_object_with_properties(env, &obj2, 3, desc2));  // 3 : The property count.
    napi_valuetype valuetype2;
    NAPI_CALL(env, napi_typeof(env, obj2, &valuetype2));
    NAPI_ASSERT(env, valuetype1 == napi_object, "Wrong type of argment. Expects a  object.");
    NAPI_ASSERT(env, valuetype2 == napi_object, "Wrong type of argment. Expects a  object.");
    auto checkPropertyEqualsTo = [env] (napi_value obj, const char *keyStr, napi_value expect) -> bool {
        napi_value result;
        napi_get_named_property(env, obj, keyStr, &result);
        bool equal = false;
        napi_strict_equals(env, result, expect, &equal);
        return equal;
    };

    bool equalRes = false;
    // get obj1.x == true
    equalRes = checkPropertyEqualsTo(obj1, "x", val_true);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // set obj1.x = false
    NAPI_CALL(env, napi_set_named_property(env, obj1, "x", val_false));
    // get obj1.x == false
    equalRes = checkPropertyEqualsTo(obj1, "x", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.a == false
    equalRes = checkPropertyEqualsTo(obj2, "a", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.b == false
    equalRes = checkPropertyEqualsTo(obj2, "b", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // set obj2.b = true (useless)
    NAPI_CALL(env, napi_set_named_property(env, obj2, "b", val_true));
    // get obj2.b == false
    equalRes = checkPropertyEqualsTo(obj2, "b", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.c == obj1
    equalRes = checkPropertyEqualsTo(obj2, "c", obj1);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.c.x == false
    napi_value val_res;
    NAPI_CALL(env, napi_get_named_property(env, obj2, "c", &val_res));
    equalRes = checkPropertyEqualsTo(val_res, "x", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");

    napi_value _value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value CreateObjectWithNamedProperties(napi_env env, napi_callback_info info)
{
    napi_value excep;
    NAPI_CALL(env, napi_get_and_clear_last_exception(env, &excep));
    napi_value val_false;
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, false, &val_false));
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    const char *keys1[] = {
        "x",
    };
    const napi_value values1[] = {
        val_true,
    };
    napi_value obj1;
    NAPI_CALL(env, napi_create_object_with_named_properties(env, &obj1, 1, keys1, values1));
    napi_value obj2;
    const char *keys2[] = {
        "a",
        "b",
    };
    const napi_value values2[] = {
        val_false,
        obj1,
    };

    NAPI_CALL(env, napi_create_object_with_named_properties(env, &obj2, 2, keys2, values2)); // 2 : The property count.
    napi_valuetype valuetype1;
    napi_valuetype valuetype2;
    NAPI_CALL(env, napi_typeof(env, obj1, &valuetype1));
    NAPI_CALL(env, napi_typeof(env, obj2, &valuetype2));
    NAPI_ASSERT(env, valuetype1 == napi_object, "Wrong type of argment. Expects a  object.");
    NAPI_ASSERT(env, valuetype2 == napi_object, "Wrong type of argment. Expects a  object.");

    auto checkPropertyEqualsTo = [env] (napi_value obj, const char *keyStr, napi_value expect) -> bool {
        napi_value result;
        napi_get_named_property(env, obj, keyStr, &result);
        bool equal = false;
        napi_strict_equals(env, result, expect, &equal);
        return equal;
    };

    bool equalRes = false;
    // get obj1.x == true
    equalRes = checkPropertyEqualsTo(obj1, "x", val_true);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // set obj1.x = false
    NAPI_CALL(env, napi_set_named_property(env, obj1, "x", val_false));
    // get obj1.x == false
    equalRes = checkPropertyEqualsTo(obj1, "x", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.a == false
    equalRes = checkPropertyEqualsTo(obj2, "a", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.b == obj1
    equalRes = checkPropertyEqualsTo(obj2, "b", obj1);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.b.x == false
    napi_value val_res;
    NAPI_CALL(env, napi_get_named_property(env, obj2, "b", &val_res));
    equalRes = checkPropertyEqualsTo(val_res, "x", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");

    napi_value _value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value MakeCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 10; // 10 : max arguments.
    size_t n;
    napi_value args[10]; // 10 : max arguments.
    // NOLINTNEXTLINE (readability/null_usage)
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");
    napi_value async_context_wrap = args[0];
    napi_value recv = args[1];
    napi_value func = args[2]; // 2 : create async resouce arguments count.
    napi_value argv[7]; // 7 : remain arguments.
    for (n = 3; n < argc; n += 1) { // 3 : reserved arguments.
        argv[n - 3] = args[n]; // 3 : reserved arguments.
    }
    napi_valuetype func_type;
    NAPI_CALL(env, napi_typeof(env, func, &func_type));
    napi_async_context context;
    NAPI_CALL(env, napi_unwrap(env, async_context_wrap, (void **)&context));
    napi_value result;
    if (func_type == napi_function) {
        NAPI_CALL(env,
                  napi_make_callback(env, context, recv, func, argc - 3, argv, &result)); // 3 : reserved arguments.
    } else {
        NAPI_ASSERT(env, false, "Unexpected argument type");
    }
    return result;
}

static napi_value MakeCallbackOne(napi_env env, napi_callback_info info)
{
    size_t argc = 10; // 10 : max arguments.
    size_t n;
    napi_value args[10]; // 10 : max arguments.
    // NOLINTNEXTLINE (readability/null_usage)
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");
    napi_value resource = args[0];
    napi_value recv = args[1];
    napi_value func = args[2];
    napi_value argv[7]; // 7 : remain arguments.
    for (n = 3; n < argc; n += 1) { // 3 : reserved arguments.
        argv[n - 3] = args[n]; // 3 : reserved arguments.
    }

    napi_valuetype func_type;
    NAPI_CALL(env, napi_typeof(env, func, &func_type));

    napi_value resource_name;
    NAPI_CALL(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &resource_name));

    napi_async_context context;
    NAPI_CALL(env, napi_async_init(env, resource, resource_name, &context));

    napi_value result;
    if (func_type == napi_function) {
        NAPI_CALL(env,
                  napi_make_callback(env, context, recv, func, argc - 3, argv, &result)); // 3 : reserved arguments.
    } else {
        NAPI_ASSERT(env, false, "Unexpected argument type");
    }

    NAPI_CALL(env, napi_async_destroy(env, context));
    return result;
}

static void completeCb(napi_env env, napi_status status, void *data)
{
    g_isTaskFinished = true;
    AsyncContext *callbackData = reinterpret_cast<AsyncContext *>(data);
    napi_delete_async_work(env, callbackData->asyncWork);
}

static napi_value AsyncCallTest(napi_env env, napi_callback_info info)
{
    AsyncContext *context = new AsyncContext();
    context->env = env;
    napi_value resource = nullptr;
    napi_create_string_utf8(env, "add async task", NAPI_AUTO_LENGTH, &resource);
    napi_create_async_work(env, nullptr, resource, [](napi_env env, void *data) {}, completeCb,
        context, &context->asyncWork);
    napi_queue_async_work(env, context->asyncWork);
    return nullptr;
}

static void *NewThreadFunc(void *arg)
{
    napi_env env = nullptr;
    auto ret = napi_create_ark_runtime(&env);
    NAPI_ASSERT(env, ret == napi_ok, "napi_create_ark_runtime failed");
    NAPI_ASSERT(env, env != nullptr, "napi_create_ark_runtime failed");

    napi_value objectUtils = nullptr;
    napi_status status =
        napi_load_module_with_info(env, "pages/ObjectUtils", "com.acts.ace.napitest/entry", &objectUtils);
    NAPI_ASSERT(env, status == napi_ok, "napi_load_module_with_info failed");
    NAPI_ASSERT(env, objectUtils != nullptr, "napi_load_module_with_info failed");

    auto str = reinterpret_cast<char *>(arg);
    if (strcmp(str, "NewThread1") == 0) {
        g_isTaskFinished = false;
        napi_value asyncCallTest = nullptr;
        napi_value args = nullptr;
        status = napi_get_named_property(env, objectUtils, "AsyncCallTest", &asyncCallTest);
        NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property failed");

        status = napi_call_function(env, objectUtils, asyncCallTest, 0, &args, nullptr);
        NAPI_ASSERT(env, status == napi_ok, "napi_call_function failed");
        while (!g_isTaskFinished) {
            napi_run_event_loop(env, napi_event_mode_nowait);
        }
    } else if (strcmp(str, "NewThread2") == 0) {
        // timer
        napi_value SetTimeout;
        napi_value promise;
        status = napi_get_named_property(env, objectUtils, "SetTimeout", &SetTimeout);
        NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property failed");
        status = napi_call_function(env, objectUtils, SetTimeout, 0, nullptr, &promise);
        NAPI_ASSERT(env, status == napi_ok, "napi_call_function failed");
        napi_value thenFunc = nullptr;
        if (napi_get_named_property(env, promise, "then", &thenFunc) != napi_ok) {
            return nullptr;
        }
        napi_value resolvedCallback;
        napi_value rejectedCallback;
        int32_t toStopTheLoop = 1;
        napi_create_function(env, "resolvedCallback", NAPI_AUTO_LENGTH, ResolvedCallback, &toStopTheLoop,
            &resolvedCallback);
        napi_create_function(env, "rejectedCallback", NAPI_AUTO_LENGTH, RejectedCallback, nullptr,
            &rejectedCallback);
        napi_value argv[PARAM_SIZE_TWO] = {resolvedCallback, rejectedCallback};
        status =  napi_call_function(env, promise, thenFunc, PARAM_SIZE_TWO, argv, nullptr);
        NAPI_ASSERT(env, status == napi_ok, "napi_call_function failed");

        napi_run_event_loop(env, napi_event_mode_default);
    } else if (strcmp(str, "NewThread3") == 0) {
        g_isTaskFinished = false;
        napi_value asyncCallTest = nullptr;
        napi_value args = nullptr;
        status = napi_get_named_property(env, objectUtils, "AsyncCallTest", &asyncCallTest);
        NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property failed");
        status = napi_call_function(env, objectUtils, asyncCallTest, 0, &args, nullptr);
        NAPI_ASSERT(env, status == napi_ok, "napi_call_function failed");
        while (!g_isTaskFinished) {
            napi_run_event_loop(env, napi_event_mode_nowait);
        }
        napi_run_event_loop(env, napi_event_mode_nowait);
    } else if (strcmp(str, "NewThread4") == 0) {
        napi_value asyncCallTest = nullptr;
        napi_value args = nullptr;

        status = napi_get_named_property(env, objectUtils, "AsyncCallTest", &asyncCallTest);
        NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property failed");
        status = napi_call_function(env, objectUtils, asyncCallTest, 0, &args, nullptr);
        NAPI_ASSERT(env, status == napi_ok, "napi_call_function failed");
    }
    free(str);
    return objectUtils;
}

static napi_value RunEventLoop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    int32_t value;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &value));

    char *testCaseName = (char *)malloc(sizeof(char) * THREAD_NAME_LENGTH);
    if (testCaseName == nullptr) {
        return nullptr;
    }
    memset_s(testCaseName, THREAD_NAME_LENGTH, 0, THREAD_NAME_LENGTH);
    pthread_t tid;

    napi_status status = napi_ok;
    if (value == INVALID_PARAM_WITH_NOWAIT || value == INVALID_PARAM_WITH_DEFAULT) {
        status= napi_run_event_loop(nullptr, static_cast<napi_event_mode>(value));
        NAPI_ASSERT(env, status == napi_invalid_arg, "stop event loop successfully");
    } else if (value == RUN_IN_MAIN_THREAD_WITH_NOWAIT || value == RUN_IN_MAIN_THREAD_WITH_DEFAULT) {
        status= napi_run_event_loop(env, static_cast<napi_event_mode>(value - DIFF_VALUE_ONE));
        NAPI_ASSERT(env, status == napi_generic_failure, "stop event loop successfully");
    } else if (value == RUN_IN_WORKER_THREAD_WITH_NOWAIT || value == RUN_IN_WORKER_THREAD_WITH_DEFAULT) {
        status= napi_run_event_loop(env, static_cast<napi_event_mode>(value - DIFF_VALUE_TWO));
        NAPI_ASSERT(env, status == napi_generic_failure, "stop event loop successfully");
        char16_t resStr[] = u"napi_generic_failure";
        napi_value resultValue = nullptr;
        napi_create_string_utf16(env, resStr, NAPI_AUTO_LENGTH, &resultValue);
        free(testCaseName);
        return resultValue;
    } else if (value == RUN_NAPI_LOOP_WITH_NOWAIT) {
        strcpy_s(testCaseName, THREAD_NAME_LENGTH, "NewThread1");
        pthread_create(&tid, nullptr, NewThreadFunc, testCaseName);
        pthread_detach(tid);
    } else if (value == RUN_NAPI_LOOP_WITH_DEFAULT) {
        strcpy_s(testCaseName, THREAD_NAME_LENGTH, "NewThread2");
        pthread_create(&tid, nullptr, NewThreadFunc, testCaseName);
        pthread_detach(tid);
    } else if (value == RUN_NAPI_LOOP_AFTER_RUN_FINISH) {
        strcpy_s(testCaseName, THREAD_NAME_LENGTH, "NewThread3");
        pthread_create(&tid, nullptr, NewThreadFunc, testCaseName);
        pthread_detach(tid);
    } else if (value == WITHOUT_RUN_NAPI_LOOP) {
        strcpy_s(testCaseName, THREAD_NAME_LENGTH, "NewThread4");
        pthread_create(&tid, nullptr, NewThreadFunc, testCaseName);
        pthread_detach(tid);
    }
    free(testCaseName);
    napi_value _value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static void *CallBeforeRunningFunc(void *arg)
{
    napi_env env = nullptr;
    auto ret = napi_create_ark_runtime(&env);
    NAPI_ASSERT(env, ret == napi_ok, "napi_create_ark_runtime failed");
    NAPI_ASSERT(env, env != nullptr, "napi_create_ark_runtime failed");

    napi_status res = napi_stop_event_loop(env);
    NAPI_ASSERT(env, res == napi_ok, "stop event loop failed");
    napi_destroy_ark_runtime(&env);
    return nullptr;
}

static void *CallAfterRunFunc(void *arg)
{
    napi_env env;
    auto ret = napi_create_ark_runtime(&env);
    NAPI_ASSERT(env, ret == napi_ok, "napi_create_ark_runtime failed");
    NAPI_ASSERT(env, env != nullptr, "napi_create_ark_runtime failed");

    napi_value objectUtils = nullptr;
    napi_status status =
        napi_load_module_with_info(env, "pages/ObjectUtils", "com.acts.ace.napitest/entry", &objectUtils);
    NAPI_ASSERT(env, status == napi_ok, "napi_load_module_with_info successfully");
    NAPI_ASSERT(env, objectUtils != nullptr, "napi_load_module_with_info failed");
    g_isTaskFinished = false;
    napi_value asyncCallTest = nullptr;
    napi_value args = nullptr;

    status = napi_get_named_property(env, objectUtils, "AsyncCallTest", &asyncCallTest);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property failed");
    status = napi_call_function(env, objectUtils, asyncCallTest, 0, &args, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "napi_call_function failed");
    while (!g_isTaskFinished) {
        napi_run_event_loop(env, napi_event_mode_nowait);
    }

    napi_status res = napi_stop_event_loop(env);
    NAPI_ASSERT(env, res == napi_ok, "napi_stop_event_loop failed");
    napi_destroy_ark_runtime(&env);
    return objectUtils;
}

static napi_value StopEventLoop(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    int32_t value;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &value));

    if (value == INVALID_PARAM_WITH_STOP_LOOP) {
        napi_status status = napi_stop_event_loop(nullptr);
        NAPI_ASSERT(env, status == napi_invalid_arg, "stop event loop successfully");
    } else if (value == STOP_LOOP_IN_MAIN_THREAD || value == STOP_LOOP_IN_WORKER_THREAD) {
        napi_status status = napi_stop_event_loop(env);
        NAPI_ASSERT(env, status == napi_generic_failure, "stop event loop successfully");
    } else if (value == STOP_LOOP_BEFORE_RUN) {
        pthread_t tid;
        napi_value result = nullptr;
        pthread_create(&tid, nullptr, CallBeforeRunningFunc, &result);
        pthread_detach(tid);
    } else if (value == STOP_LOOP_AFTER_RUN) {
        pthread_t tid;
        napi_value result;
        pthread_create(&tid, nullptr, CallAfterRunFunc, &result);
        pthread_detach(tid);
    }

    napi_value _value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value NapiSerialize(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    napi_set_named_property(env, object, "numKey", num);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_set_named_property(env, object, "objKey", obj);

    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    void* data = nullptr;
    napi_status status = napi_serialize(env, object, undefined, undefined, &data);
    NAPI_ASSERT(env, status == napi_ok, "napi_serialize fail");
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result = nullptr;
    napi_deserialize(env, data, &result);
    napi_value number = nullptr;
    napi_get_named_property(env, result, "numKey", &number);
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, number, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_number, "Wrong type of argment. Expects a number.");
    napi_delete_serialization_data(env, data);

    return number;
}

static napi_value NapiDeSerialize(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_number, "Wrong type of argment. Expects a number.");

    napi_value number = nullptr;
    status = napi_deserialize(env, data, &number);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");
    napi_delete_serialization_data(env, data);

    return number;
}

static napi_value NapiDeleteSerializationData(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    napi_set_named_property(env, object, "numKey", num);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_set_named_property(env, object, "objKey", obj);

    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    void* data = nullptr;
    napi_status status = napi_serialize(env, object, undefined, undefined, &data);
    NAPI_ASSERT(env, status == napi_ok, "napi_serialize fail");
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_deserialize(env, data, &result1);
    napi_value obj1 = nullptr;
    napi_get_named_property(env, result1, "objKey", &obj1);
    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, obj1, &valuetype1));
    NAPI_ASSERT(env, valuetype1 == napi_object, "Wrong type of argment. Expects a object.");

    napi_value result2 = nullptr;
    napi_deserialize(env, data, &result2);
    napi_value number = nullptr;
    napi_get_named_property(env, result2, "numKey", &number);
    napi_valuetype valuetype2;
    NAPI_CALL(env, napi_typeof(env, number, &valuetype2));
    NAPI_ASSERT(env, valuetype2 == napi_number, "Wrong type of argment. Expects a number.");
    napi_delete_serialization_data(env, data);

    return number;
}

static napi_value NapiSerializeDate(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value num = nullptr;
    double time = 1679839496000; // 2023.3.17 12:34:56 UTC
    napi_create_date(env, time, &num);

    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    bool isDateVal = false;
    napi_is_date(env, result1, &isDateVal);
    NAPI_ASSERT(env, isDateVal, "napi_is_Date fail");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeString(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value num = nullptr;
    const char* str = "abc";
    napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &num);

    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_string, "Wrong type of argment. Expects a string.");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeArray(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value num = nullptr;
    napi_create_array(env, &num);

    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    bool isArray = false;
    napi_is_array(env, result1, &isArray);
    NAPI_ASSERT(env, isArray, "napi_is_array fail");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeObject(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value result = nullptr;
    napi_create_object(env, &result);

    void* data = nullptr;
    napi_serialize(env, result, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object, "Wrong type of argment. Expects a object.");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeArraybuffer(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value result = nullptr;
    size_t byteLength = 1024;
    void *data = nullptr;
    napi_create_arraybuffer(env, byteLength, &data, &result);

    void *dataVal = nullptr;
    napi_serialize(env, result, undefined, undefined, &dataVal);
    NAPI_ASSERT(env, dataVal != nullptr, " The dataVal is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, dataVal, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    bool retIsArrayBuffer = false;
    napi_is_arraybuffer(env, result1, &retIsArrayBuffer);
    NAPI_ASSERT(env, retIsArrayBuffer, "napi_is_arraybuffer fail");

    napi_delete_serialization_data(env, dataVal);
    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeTypearray(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "getTypedArrayInfo napi_create_arraybuffer fail");
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, "getTypedArrayInfo napi_is_arraybuffer fail");
    napi_value result;
    napi_create_typedarray(env, napi_int32_array, typedArrayLength, arrayBuffer, 0, &result);

    void* data = nullptr;
    napi_serialize(env, result, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");

    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    bool retIsTypedarray = false;
    napi_is_typedarray(env, result1, &retIsTypedarray);
    NAPI_ASSERT(env, retIsTypedarray, "napi_is_typedarray fail");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeSharedarraybuffer(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    size_t argc = 1;
    napi_value args;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    void* data = nullptr;
    napi_serialize(env, args, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");
    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object, "Wrong type of argment. Expects a object.");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeSet(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    size_t argc = 1;
    napi_value args;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    void* data = nullptr;
    napi_serialize(env, args, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");
    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object, "Wrong type of argment. Expects a object.");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeMap(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    size_t argc = 1;
    napi_value args;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    void* data = nullptr;
    napi_serialize(env, args, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");
    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object, "Wrong type of argment. Expects a object.");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSerializeRegExp(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    size_t argc = 1;
    napi_value args;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");

    void* data = nullptr;
    napi_serialize(env, args, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");
    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, data, &result1);
    NAPI_ASSERT(env, status == napi_ok, "napi_deserialize fail");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, result1, &valuetype));
    NAPI_ASSERT(env, valuetype == napi_object, "Wrong type of argment. Expects a object.");
    napi_delete_serialization_data(env, data);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value NapiSetNamedProperty(napi_env env, napi_callback_info info)
{
    napi_value fn = nullptr;
    napi_value resultValue = nullptr;
    NAPI_CALL(env, napi_create_function(env, nullptr, NAPI_AUTO_LENGTH, SayHello, nullptr, &fn));
    if (fn == nullptr) {
        napi_throw_error(env, nullptr, "Napitest: napi_create_function fail");
        return nullptr;
    }
    napi_create_object(env, &resultValue);
    NAPI_CALL(env, napi_set_named_property(env, resultValue, "name", fn));

    napi_value retStrAttribute = nullptr;
    NAPI_CALL(env, napi_get_named_property(env, resultValue, "name", &retStrAttribute));

    napi_valuetype valuetype;
    napi_typeof(env, retStrAttribute, &valuetype);
    NAPI_ASSERT(env, valuetype == napi_function, "Napitest: wrong type of argment. Expects a function.");

    napi_value value = 0;
    napi_create_int32(env, 0, &value);
    return value;
}

static napi_value NapiGetNamedProperty(napi_env env, napi_callback_info info)
{
    napi_value resultValue = nullptr;
    napi_value undefined = nullptr;
    NAPI_CALL(env, napi_get_undefined(env, &undefined));
    NAPI_CALL(env, napi_create_object(env, &resultValue));
    NAPI_CALL(env, napi_set_named_property(env, resultValue, "undefined", undefined));

    napi_value retStrAttribute = nullptr;
    NAPI_CALL(env, napi_get_named_property(env, resultValue, "undefined", &retStrAttribute));

    napi_valuetype valuetype;
    napi_typeof(env, retStrAttribute, &valuetype);
    NAPI_ASSERT(env, valuetype == napi_undefined, "Napitest: wrong type of argment. Expects a undefined.");

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value CallAddNumFunction(napi_env env, napi_callback_info info)
{
    size_t argc = 2; // 2:Number of parameters
    napi_value args[2]; // 2:Number of parameters
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    NAPI_ASSERT(env, valuetype == napi_object, "Napitest: wrong type of argment. Expects a object.");

    napi_valuetype valuetype2;
    napi_typeof(env, args[1], &valuetype2);
    NAPI_ASSERT(env, valuetype2 == napi_function, "Napitest: wrong type of argment. Expects a function.");

    napi_value para[2]; // 2:Number of parameters
    napi_create_int32(env, 6, &para[0]); // 6:numerical value
    napi_create_int32(env, 6, &para[1]); // 6:numerical value

    napi_value *argv = para;
    napi_value ret;
    napi_value callRst;
    NAPI_CALL(env, napi_get_named_property(env, args[0], "add", &callRst));
    NAPI_CALL(env, napi_call_function(env, args[0], callRst, argc, argv, &ret));

    return ret;
}

static napi_value NapiNewInstance(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_define_class(
        env, "TestWrapClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testWrapClass);
    napi_value arg;
    NAPI_CALL(env, napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &arg));

    napi_value *argv = &arg;
    size_t argc = 1;
    napi_value instanceValue = nullptr;
    NAPI_CALL(env, napi_new_instance(env, testWrapClass, argc, argv, &instanceValue));
    if (!instanceValue) {
        napi_throw_error(env, nullptr, "Napitest: instanceValue is nullptr");
        return nullptr;
    }

    bool isInstanceOf = false;
    NAPI_CALL(env, napi_instanceof(env, instanceValue, testWrapClass, &isInstanceOf));
    NAPI_ASSERT(env, isInstanceOf, "Napitest: isInstanceOf fail");

    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, isInstanceOf, &result));

    return result;
}

static napi_value NapiCrateAndGetValueString(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    if (argc != 1) {
        napi_throw_error(env, nullptr, "Napitest: wrong number of parameters");
        return nullptr;
    }
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    NAPI_ASSERT(env, valuetype == napi_string, "Napitest: wrong type of argment. Expects a string.");

    char buffer[256] = ""; // 256:length value
    size_t copied = 0;
    NAPI_CALL(env, napi_get_value_string_utf8(env, args[0], buffer, 255, &copied)); // 255:size of buffer
    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));
    return output;
}

static napi_value ExceptionalSetNamedProperty(napi_env env, napi_callback_info info)
{
    napi_value fn = nullptr;
    NAPI_CALL(env, napi_create_function(env, nullptr, NAPI_AUTO_LENGTH, SayHello, nullptr, &fn));
    if (fn == nullptr) {
        napi_throw_error(env, nullptr, "Napitest: napi_create_function fail");
        return nullptr;
    }
    napi_value value = nullptr;
    napi_create_int32(env, 0, &value);
    NAPI_CALL(env, napi_set_named_property(env, value, "name", fn));
    napi_valuetype valuetype;
    napi_typeof(env, value, &valuetype);
    NAPI_ASSERT(env, valuetype == napi_function, "Napitest: wrong type of argment. Expects a function.");
    napi_value num = 0;
    napi_create_int32(env, 0, &num);
    return num;
}

static napi_value ExceptionalGetNamedProperty(napi_env env, napi_callback_info info)
{
    napi_value resultValue = nullptr;
    napi_value undefined = nullptr;
    NAPI_CALL(env, napi_get_undefined(env, &undefined));
    NAPI_CALL(env, napi_create_object(env, &resultValue));
    NAPI_CALL(env, napi_set_named_property(env, resultValue, "undefined", undefined));

    napi_value retStrAttribute = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &resultValue));
    NAPI_CALL(env, napi_get_named_property(env, resultValue, "undefined", &retStrAttribute));

    napi_valuetype valuetype;
    napi_typeof(env, retStrAttribute, &valuetype);
    NAPI_ASSERT(env, valuetype == napi_undefined, "Napitest: wrong type of argment. Expects a undefined.");

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value ExceptionalCallAddNumFunction(napi_env env, napi_callback_info info)
{
    size_t argc = 2;    // 2:Number of parameters
    napi_value args[2]; // 2:Number of parameters
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    NAPI_ASSERT(env, valuetype == napi_object, "Napitest: wrong type of argment. Expects a object.");

    napi_valuetype valuetype2;
    napi_typeof(env, args[1], &valuetype2);
    NAPI_ASSERT(env, valuetype2 == napi_function, "Napitest: wrong type of argment. Expects a function.");

    napi_value para[2];                  // 2:Number of parameters
    napi_create_int32(env, 6, &para[0]); // 6:numerical value
    napi_create_int32(env, 6, &para[1]); // 6:numerical value

    napi_value *argv = para;
    napi_value ret;
    napi_value callRst;
    NAPI_CALL(env, napi_get_named_property(env, args[0], "add", &callRst));

    NAPI_CALL(env, napi_call_function(env, args[0], nullptr, argc, argv, &ret));
    return ret;
}

static napi_value ExceptionalNapiNewInstance(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_value arg;
    NAPI_CALL(env, napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &arg));
    napi_value *argv = &arg;
    size_t argc = 1;
    napi_value instanceValue = nullptr;
    NAPI_CALL(env, napi_new_instance(env, testWrapClass, argc, argv, &instanceValue));
    if (!instanceValue) {
        napi_throw_error(env, nullptr, "Napitest: napi_new_instance fail");
        return nullptr;
    }
    bool isInstanceOf = false;
    NAPI_CALL(env, napi_instanceof(env, instanceValue, testWrapClass, &isInstanceOf));
    NAPI_ASSERT(env, isInstanceOf, "Napitest: isInstanceOf success");
    napi_value result;
    NAPI_CALL(env, napi_get_boolean(env, isInstanceOf, &result));
    return result;
}

static napi_value ExceptionalNapiCrateAndGetValueString(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    if (argc != 1) {
        napi_throw_error(env, nullptr, "Napitest: wrong number of parameters");
        return nullptr;
    }
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    NAPI_ASSERT(env, valuetype == napi_string, "Napitest: wrong type of argment. Expects a string.");
    char buffer[1] = "";
    size_t copied = 0;
    NAPI_CALL(env, napi_get_value_string_utf8(env, args[0], buffer, 0, &copied));
    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));
    return output;
}

static void CallJsFunc(napi_env env, napi_value jsCb, void *context, void *data)
{
    if (env == nullptr) {
        return;
    }
    napi_value resultNumber = nullptr;
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value number1 = nullptr;
    napi_create_int32(env, 12, &number1); // 12:numerical value
    napi_value number2 = nullptr;
    napi_create_int32(env, 15, &number2); // 15:numerical value
    napi_value argv[2] = {number1, number2}; // 2:array size
    napi_call_function(env, undefined, jsCb, 2, argv, &resultNumber); // 2:number of parameters
    int32_t res = 0;
    napi_get_value_int32(env, resultNumber, &res);
    if (res != 27) { // 27: calculation result
        napi_throw_error(env, nullptr, "Napitest: Return result error");
        return;
    }
}

static void ExecuteWork(napi_env env, void *data)
{
    CallbackData *callbackData = reinterpret_cast<CallbackData *>(data);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_idle, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_low, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_high, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_immediate, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_high, false);
}

static void WorkComplete(napi_env env, napi_status status, void *data)
{
    CallbackData *callbackData = reinterpret_cast<CallbackData *>(data);
    napi_release_threadsafe_function(callbackData->tsfn, napi_tsfn_release);
    napi_delete_async_work(env, callbackData->work);
    callbackData->work = nullptr;
    callbackData->tsfn = nullptr;
}

static napi_value ThreadSafePriority(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value jsCb = nullptr;
    CallbackData *callbackData = nullptr;
    napi_get_cb_info(env, info, &argc, &jsCb, nullptr, reinterpret_cast<void **>(&callbackData));
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "Thread-safe Function Demo", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_threadsafe_function(env, jsCb, nullptr, resourceName, 0, 1, callbackData, nullptr, callbackData,
                                    CallJsFunc, &callbackData->tsfn);
    napi_create_async_work(env, nullptr, resourceName, ExecuteWork, WorkComplete, callbackData, &callbackData->work);
    napi_queue_async_work(env, callbackData->work);

    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value ThreadSafePriorityWithInvalidParam(napi_env env, napi_callback_info info)
{
    napi_status status = napi_call_threadsafe_function_with_priority(nullptr, nullptr, napi_priority_idle, true);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call threadsafe with priority successfully");
    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    return value;
}

static napi_value CheckUnwrapFunc(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    const char *testStr = "test";
    napi_wrap(
        env, argv[0], (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, nullptr);

    char *tmpTestStr = nullptr;
    napi_unwrap(env, argv[0], (void **)&tmpTestStr);
    napi_value value = 0;
    NAPI_CALL(env, napi_create_int32(env, strcmp(tmpTestStr, testStr), &value));
    return value;
}

static napi_value CreateSendableArrayTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object, "Wrong type of arguments. Expects an array as first argument.");

    napi_value ret;
    NAPI_CALL(env, napi_create_sendable_array(env, &ret));

    uint32_t length = 0;
    NAPI_CALL(env, napi_get_array_length(env, args[0], &length));

    for (uint32_t i = 0; i < length; i++) {
        napi_value e;
        NAPI_CALL(env, napi_get_element(env, args[0], i, &e));
        NAPI_CALL(env, napi_set_element(env, ret, i, e));
    }
    return ret;
}

static napi_value CreateSendableArrayWithLengthTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));

    NAPI_ASSERT(env, valuetype0 == napi_object, "Wrong type of arguments. Expects an array as first argument.");

    uint32_t length = 0;
    NAPI_CALL(env, napi_get_array_length(env, args[0], &length));

    napi_value result;
    NAPI_CALL(env, napi_create_sendable_array_with_length(env, length, &result));

    for (uint32_t i = 0; i < length; i++) {
        napi_value e;
        NAPI_CALL(env, napi_get_element(env, args[0], i, &e));
        NAPI_CALL(env, napi_set_element(env, result, i, e));
    }

    return result;
}

static napi_value CreateSendableArrayBufferTest(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_status status = napi_create_sendable_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_sendable_arraybuffer");
    NAPI_ASSERT(env, arrayBuffer != nullptr, "success create_sendable_arrayBuffer");

    return arrayBuffer;
}

static napi_value CreateSendableTypedArrayTest(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_sendable_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);

    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);

    NAPI_ASSERT(env, arrayBufferPtr == tmpArrayBufferPtr, "napi_get_arraybuffer_info success");
    NAPI_ASSERT(env, arrayBufferSize ==  arrayBufferLength, "napi_create_arraybuffer success");

    napi_value result;
    napi_create_sendable_typedarray(env, napi_int32_array, typedArrayLength, arrayBuffer, 0, &result);

    return result;
}

static napi_value createSendableFloat64ArrayTest(napi_env env, napi_callback_info info)
{
    static size_t length = 6;
    static size_t offset = 0;

    napi_value arraybuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_create_sendable_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arraybuffer);
    NAPI_ASSERT(env, arraybuffer != nullptr, "success create_sendable_arrayBuffer");

    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_float64_array, length,
                                                         arraybuffer, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableBigInt64ArrayTest(napi_env env, napi_callback_info info)
{
    static size_t length = 6;
    static size_t offset = 0;

    napi_value arraybuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_create_sendable_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arraybuffer);
    NAPI_ASSERT(env, arraybuffer != nullptr, "success create_sendable_arrayBuffer");

    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_bigint64_array, length,
                                                         arraybuffer, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableBigUint64ArrayTest(napi_env env, napi_callback_info info)
{
    static size_t length = 6;
    static size_t offset = 0;

    napi_value arraybuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1024;
    napi_create_sendable_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arraybuffer);
    NAPI_ASSERT(env, arraybuffer != nullptr, "success create_sendable_arrayBuffer");

    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_biguint64_array, length,
                                                         arraybuffer, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}


static napi_value CreateSendableObjectWithProperties(napi_env env, napi_callback_info info)
{
    napi_value excep;
    NAPI_CALL(env, napi_get_and_clear_last_exception(env, &excep));
    napi_value val_false;
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, false, &val_false));
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    napi_property_descriptor desc1[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    };
    napi_value obj1;
    NAPI_CALL(env, napi_create_sendable_object_with_properties(env, 1, desc1, &obj1));
    napi_valuetype valuetype1;
    NAPI_CALL(env, napi_typeof(env, obj1, &valuetype1));
    napi_value obj2;
    napi_property_descriptor desc2[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("a", val_false),
        DECLARE_NAPI_GETTER_SETTER("b", CreateWithPropertiesTestGetter, CreateWithPropertiesTestSetter),
        DECLARE_NAPI_DEFAULT_PROPERTY("c", obj1),
    };
    NAPI_CALL(env, napi_create_sendable_object_with_properties(env, 3, desc2, &obj2));  // 3 : The property count.
    napi_valuetype valuetype2;
    NAPI_CALL(env, napi_typeof(env, obj2, &valuetype2));
    NAPI_ASSERT(env, valuetype1 == napi_object, "Wrong type of argment. Expects a  object.");
    NAPI_ASSERT(env, valuetype2 == napi_object, "Wrong type of argment. Expects a  object.");
    auto checkPropertyEqualsTo = [env] (napi_value obj, const char *keyStr, napi_value expect) -> bool {
        napi_value result;
        napi_get_named_property(env, obj, keyStr, &result);
        bool equal = false;
        napi_strict_equals(env, result, expect, &equal);
        return equal;
    };

    bool equalRes = false;
    // get obj1.x == true
    equalRes = checkPropertyEqualsTo(obj1, "x", val_true);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // set obj1.x = false
    NAPI_CALL(env, napi_set_named_property(env, obj1, "x", val_false));
    // get obj1.x == false
    equalRes = checkPropertyEqualsTo(obj1, "x", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.a == false
    equalRes = checkPropertyEqualsTo(obj2, "a", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // get obj2.b == false
    equalRes = checkPropertyEqualsTo(obj2, "b", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");
    // set obj2.b = true (useless)
    NAPI_CALL(env, napi_set_named_property(env, obj2, "b", val_true));
    // get obj2.b == false
    equalRes = checkPropertyEqualsTo(obj2, "b", val_false);
    NAPI_ASSERT(env, equalRes == true, "equalRes is false.");

    napi_value result = 0;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

static napi_value NapiWrapSendableTest(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_sendable_class(
        env, "WrapSendableTestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "wrap_sendable_test";
    napi_wrap_sendable(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr);

    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

static napi_value NapiWrapSendableWithSizeTest(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_sendable_class(
        env, "WrapSendableWithSizeTestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "wrap_sendable_with_size_test";
    size_t size = sizeof(*testStr) / sizeof(char);
    napi_wrap_sendable_with_size(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, size);

    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

static napi_value NapiUnWrapSendableTest(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_sendable_class(
        env, "UnWrapSendableTestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "unwrap_sendable_test";
    size_t size = sizeof(*testStr) / sizeof(char);
    napi_wrap_sendable_with_size(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, size);

    const char* tmpTestStr = nullptr;
    NAPI_CALL(env, napi_unwrap_sendable(env, instanceValue, (void**)&tmpTestStr));
    NAPI_ASSERT(env, tmpTestStr == testStr, "napi_unwrap_sendable fail");

    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

static napi_value NapiRemoveWrapSendableTest(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_sendable_class(
        env, "RemoveWrapSendableTestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "remove_wrap_sendable_test";
    napi_wrap_sendable(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr);

    const char* tmpTestStr = nullptr;
    NAPI_CALL(env, napi_unwrap_sendable(env, instanceValue, (void**)&tmpTestStr));
    NAPI_ASSERT(env, tmpTestStr == testStr, "napi_unwrap fail");

    const char* tmpTestStr1 = nullptr;
    napi_remove_wrap_sendable(env, instanceValue, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, tmpTestStr1 == testStr, "napi_remove_wrap_sendable fail 1");

    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

static napi_value getLastErrorInfoNull(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_string_utf8(env, "Error Info", NAPI_ERROR_LENGTH, &value));
    double doubleValue;
    napi_status status = napi_get_value_double(env, value, &doubleValue);
    NAPI_ASSERT(env, status != napi_ok, "Failed to produce error condition");
    status = napi_get_last_error_info(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value throwFunc(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    napi_status status = napi_throw(env, value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value throwFuncNull(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_string_utf8(env, "xyz", NAPI_STRING_LENGTH, &value));
    napi_status status = napi_throw(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isErrorValueNull(napi_env env, napi_callback_info info)
{
    bool r;
    napi_status status = napi_is_error(env, nullptr, &r);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isErrorRstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_is_error(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

napi_value createStringUtf8(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value argv[1];
    status = napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_value strValue = argv[0];
    char str[NAPI_UTF8_LENGTH];
    size_t strLength;
    status = napi_get_value_string_utf8(env, strValue, str, NAPI_UTF8_LENGTH, &strLength);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Invalid string was passed as argument");
        return nullptr;
    }
    napi_value result;
    status = napi_create_string_utf8(env, str, strLength, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create string");
        return nullptr;
    }
    return result;
}

static napi_value createErrorMsgNull(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;

    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "common error", NAPI_AUTO_LENGTH, &message);

    napi_value error = nullptr;
    napi_status status = napi_create_error(env, code, nullptr, &error);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createErrorRstNull(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "common error", NAPI_AUTO_LENGTH, &message);
    napi_status status = napi_create_error(env, code, message, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createTypeErrorMsgNull(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "type error", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_status status = napi_create_type_error(env, code, nullptr, &error);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createTypeErrorRstNull(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "type error", NAPI_AUTO_LENGTH, &message);
    napi_status status = napi_create_type_error(env, code, message, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createRangeErrorRstNull(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "500", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "range error", NAPI_AUTO_LENGTH, &message);
    napi_status status = napi_create_range_error(env, code, message, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getAndClearLastExceptionNull(napi_env env, napi_callback_info info)
{
    napi_value code = nullptr;
    napi_value message = nullptr;
    napi_create_string_latin1(env, "600", NAPI_AUTO_LENGTH, &code);
    napi_create_string_latin1(env, "tag range error", NAPI_AUTO_LENGTH, &message);
    napi_value error = nullptr;
    napi_create_range_error(env, code, message, &error);
    NAPI_ASSERT(env, error != nullptr, "tag error succes");
    bool isError = false;
    napi_is_error(env, error, &isError);
    NAPI_ASSERT(env, isError, "tag isError 1");
    napi_status status = napi_get_and_clear_last_exception(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isExceptionPendingNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_is_exception_pending(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value openAndCloseHandleScopeNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_open_handle_scope(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value openAndCloseEscapableHandleScopeNull(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = nullptr;
    napi_value escapee = nullptr;
    NAPI_CALL(env, napi_create_object(env, &output));
    NAPI_CALL(env, napi_escape_handle(env, scope, output, &escapee));
    napi_status status = napi_close_escapable_handle_scope(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value escapeHandle(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = nullptr;
    napi_value escapee = nullptr;
    NAPI_CALL(env, napi_create_object(env, &output));
    NAPI_CALL(env, napi_escape_handle(env, scope, output, &escapee));
    return escapee;
}

static napi_value escapeHandleScopeNull(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = nullptr;
    napi_value escapee = nullptr;
    NAPI_CALL(env, napi_create_object(env, &output));
    napi_status status = napi_escape_handle(env, nullptr, output, &escapee);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value escapeHandleOutputNull(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = nullptr;
    napi_value escapee = nullptr;
    NAPI_CALL(env, napi_create_object(env, &output));
    napi_status status = napi_escape_handle(env, scope, nullptr, &escapee);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value escapeHandleRstNull(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = nullptr;
    NAPI_CALL(env, napi_create_object(env, &output));
    napi_status status = napi_escape_handle(env, scope, output, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createReferenceValueNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, TAG_NUMBER, &result);
    napi_status status = napi_create_reference(env, nullptr, 1, &test_reference);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getReferenceValue(napi_env env, napi_callback_info info)
{
    NAPI_ASSERT(env, test_reference != nullptr,
                "A reference must have been created.");
    napi_value refValue = nullptr;
    napi_get_reference_value(env, test_reference, &refValue);
    return refValue;
}

static napi_value getReferenceValueRefNull(napi_env env, napi_callback_info info)
{
    NAPI_ASSERT(env, test_reference != nullptr,
                "A reference must have been created.");
    napi_value refValue = nullptr;
    napi_status status = napi_get_reference_value(env, test_reference, &refValue);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getReferenceValueRstNull(napi_env env, napi_callback_info info)
{
    NAPI_ASSERT(env, test_reference != nullptr,
                "A reference must have been created.");
    napi_value refValue = nullptr;
    napi_status status = napi_get_reference_value(env, test_reference, &refValue);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deleteReferenceNull(napi_env env, napi_callback_info info)
{
    napi_value refValue = nullptr;
    napi_get_reference_value(env, test_reference, &refValue);
    int32_t value = 0;
    napi_get_value_int32(env, refValue, &value);
    napi_status status = napi_delete_reference(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value referenceRef(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_ref resultRef = nullptr;
    uint32_t resultRefCount = 0;

    napi_create_object(env, &result);
    napi_create_reference(env, result, 1, &resultRef);
    
    napi_reference_ref(env, resultRef, &resultRefCount);
    NAPI_ASSERT(env, resultRefCount == NAPI_REF_COUNT,
                "resultRefCount expect equal to 2");
    napi_value retValue;
    NAPI_CALL(env, napi_create_int32(env, 0, &retValue));
    
    return retValue;
}

static napi_value referenceRefNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_ref resultRef = nullptr;
    uint32_t resultRefCount = 0;
    napi_create_object(env, &result);
    napi_create_reference(env, result, 1, &resultRef);
    napi_status status = napi_reference_ref(env, nullptr, &resultRefCount);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value referenceRefAndUnrefNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_ref resultRef = nullptr;
    uint32_t resultRefCount = 0;
    napi_create_object(env, &result);
    napi_create_reference(env, result, 1, &resultRef);
    napi_reference_ref(env, resultRef, &resultRefCount);
    napi_status status = napi_reference_unref(env, nullptr, &resultRefCount);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createArrayNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    napi_status status = napi_create_array(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napCreateArrayBufferNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    size_t arrayBufferSize = 1024;
    napi_status status = napi_create_arraybuffer(env, arrayBufferSize, nullptr, &arrayBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createExternalNull(napi_env env, napi_callback_info info)
{
    const char testStr[] = "test";
    napi_value external = nullptr;
    napi_status status = napi_create_external(
        env, (void*)testStr,
        [](napi_env env, void* data, void* hint) {},
        nullptr, &external);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createExternalArraybufferDataNull(napi_env env, napi_callback_info info)
{
    int* testInt = (int*)malloc(sizeof(int));
    if (testInt == nullptr) {
        printf("Memory allocation failed.\n");
        return nullptr;
    }
    *testInt = TAG_NUMBER;
    napi_value external = nullptr;
    size_t arrayBufferSize = 1024;

    napi_status status = napi_create_external_arraybuffer(
        env, nullptr, arrayBufferSize,
        [](napi_env env, void* data, void* hint) {
            int* temp = static_cast<int*>(data);
            free(temp);
            temp = nullptr;
        },
        nullptr, &external);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createObjectNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_object(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSymbolNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_value description = args[0];
    napi_status status = napi_create_symbol(env, description, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSymbolDescriptionNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_value symbol;
    napi_status status = napi_create_symbol(env, nullptr, &symbol);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSymbolDescriptionNotString(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_value description;
    NAPI_CALL(env, napi_create_int32(env, 0, &description));
    napi_value symbol;
    napi_status status = napi_create_symbol(env, description, &symbol);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createTypeArrayBufferNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    napi_value retValue;
    napi_status status = napi_create_typedarray(env, napi_int32_array, typedArrayLength, nullptr, 0, &retValue);
    bool bRet = (status == napi_invalid_arg);
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createTypeArrayResultNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    napi_status status = napi_create_typedarray(env, napi_int32_array, typedArrayLength, arrayBuffer, 0, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createTypeArrayNotBufferObj(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    NAPI_CALL(env, napi_create_int32(env, 0, &arrayBuffer));
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    napi_value retValue;
    napi_status status = napi_create_typedarray(env, napi_int32_array, typedArrayLength, arrayBuffer, 0, &retValue);
    bool bRet = (status == napi_invalid_arg);
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createTypeArrayNotEnumValue(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, &arrayBufferLength);
    napi_value retValue;
    napi_status status = napi_create_typedarray(env, napi_uint8_array, typedArrayLength, arrayBuffer, 0, &retValue);
    bool bRet = (status == napi_invalid_arg);
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createDataViewBufferNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    napi_value result = nullptr;
    napi_status status = napi_create_dataview(env, arrayBufferSize, nullptr, 0, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createDataViewResultNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    napi_status status = napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createDataViewBufferNotObj(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    NAPI_CALL(env, napi_create_int32(env, 0, &arrayBuffer));
    size_t arrayBufferSize = 16;
    napi_value result = nullptr;
    napi_status status = napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createInt32Null(napi_env env, napi_callback_info info)
{
    int32_t value = 5;
    napi_status status = napi_create_int32(env, value, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int32_t value;
    NAPI_CALL(env, napi_get_value_int32(env, args[0], &value));
    napi_value output;
    NAPI_CALL(env, napi_create_int32(env, value, &output));
    return output;
}

static napi_value getValueInt32ValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int32_t value;
    napi_status status = napi_get_value_int32(env, nullptr, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt32RstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_get_value_int32(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt32NotNum(napi_env env, napi_callback_info info)
{
    napi_value args = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &args);
    int32_t value;
    napi_status status = napi_get_value_int32(env, args, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt64(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int64_t value;
    napi_status status = napi_get_value_int64(env, args[0], &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt64ValueNull(napi_env env, napi_callback_info info)
{
    int64_t value;
    napi_status status = napi_get_value_int64(env, nullptr, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt64RstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_get_value_int64(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueInt64NotNum(napi_env env, napi_callback_info info)
{
    napi_value args = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &args);
    int64_t value;
    napi_status status = napi_get_value_int64(env, args, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createUInt32Null(napi_env env, napi_callback_info info)
{
    uint32_t value = 5;
    napi_status status = napi_create_uint32(env, value, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createInt64Null(napi_env env, napi_callback_info info)
{
    int64_t value = 100;
    napi_status status = napi_create_int64(env, (double)value, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createDoubleNull(napi_env env, napi_callback_info info)
{
    double value = 100;
    napi_status status = napi_create_double(env, value, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAndGetStringLatin1BufferNull(napi_env env, napi_callback_info info)
{
    size_t copied = 0;
    napi_value output;
    napi_status status = napi_create_string_latin1(env, nullptr, copied, &output);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAndGetStringLatin1ResultNull(napi_env env, napi_callback_info info)
{
    char buffer[128];
    size_t copied = 0;
    napi_status status = napi_create_string_latin1(env, buffer, copied, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAndGetStringUtf16BufferNull(napi_env env, napi_callback_info info)
{
    size_t copied = 0;
    napi_value result;
    napi_status status = napi_create_string_utf16(env, nullptr, copied, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAndGetStringUtf16ResultNull(napi_env env, napi_callback_info info)
{
    char16_t buffer[128]; // 128: char16_t type of element size
    size_t copied = 0;
    napi_status status = napi_create_string_utf16(env, buffer, copied, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAndGetStringUtf16Exceed(napi_env env, napi_callback_info info)
{
    char16_t buffer[128]; // 128: char16_t type of element size
    size_t length = -1;
    napi_value result;
    napi_status status = napi_create_string_utf16(env, buffer, length, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getArrayLengthResultNull(napi_env env, napi_callback_info info)
{
    uint32_t length;
    napi_status status = napi_get_array_length(env, nullptr, &length);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getArrayLengthValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    napi_status status = napi_get_array_length(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getArrayLengthNotArray(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t length;
    napi_value args1;
    NAPI_CALL(env, napi_create_int32(env, 0, &args1));
    napi_status status = napi_get_array_length(env, args1, &length);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getArrayBufferInfoBufferNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    napi_status status;
    void* yourPointer = nullptr;
    size_t arrayBufferSize = 1024;
    status = napi_create_arraybuffer(env, arrayBufferSize, &yourPointer, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    status = napi_get_arraybuffer_info(env, nullptr, &tmpArrayBufferPtr, &arrayBufferLength);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getArrayBufferInfoLengthNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    napi_status status;
    void* yourPointer = nullptr;
    size_t arrayBufferSize = 1024;
    status = napi_create_arraybuffer(env, arrayBufferSize, &yourPointer, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    void* tmpArrayBufferPtr = nullptr;
    status = napi_get_arraybuffer_info(env, arrayBuffer, &tmpArrayBufferPtr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getArrayBufferInfoNotObj(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    napi_status status;
    void* yourPointer = nullptr;
    size_t arrayBufferSize = 1024;
    status = napi_create_arraybuffer(env, arrayBufferSize, &yourPointer, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "success to napi_create_arraybuffer");
    napi_value arrayBuffer1;
    NAPI_CALL(env, napi_create_int32(env, 0, &arrayBuffer1));
    void* tmpArrayBufferPtr = nullptr;
    size_t arrayBufferLength = 0;
    status = napi_get_arraybuffer_info(env, arrayBuffer1, &tmpArrayBufferPtr, &arrayBufferLength);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPrototypeObjectNull(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH, [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);
    napi_value customClassPrototype = nullptr;
    napi_status status = napi_get_prototype(env, nullptr, &customClassPrototype);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPrototypeResultNull(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH, [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);
    napi_status status = napi_get_prototype(env, testWrapClass, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPrototypeNotObj(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass;
    NAPI_CALL(env, napi_create_int32(env, 0, &testWrapClass));
    napi_value customClassPrototype = nullptr;
    napi_status status = napi_get_prototype(env, testWrapClass, &customClassPrototype);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getTypedArrayInfoNull(napi_env env, napi_callback_info info)
{
    napi_typedarray_type type;
    size_t length = 0;
    void* data = nullptr;
    napi_value retArrayBuffer;
    size_t byteOffset = -1;
    napi_status status = napi_get_typedarray_info(env, nullptr, &type, &length, &data, &retArrayBuffer, &byteOffset);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getDataViewInfoNull(napi_env env, napi_callback_info info)
{
    napi_value retArrayBuffer = nullptr;
    void* data = nullptr;
    size_t byteLength = 0;
    size_t byteOffset = -1;
    napi_status status = napi_get_dataview_info(env, nullptr, &byteLength, &data, &retArrayBuffer, &byteOffset);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getDataViewInfoNotObj(napi_env env, napi_callback_info info)
{
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    napi_value retArrayBuffer = nullptr;
    void* data = nullptr;
    size_t byteLength = 0;
    size_t byteOffset = -1;
    napi_status status = napi_get_dataview_info(env, result, &byteLength, &data, &retArrayBuffer, &byteOffset);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBoolValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    bool value;
    napi_status status = napi_get_value_bool(env, nullptr, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBoolResultNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_get_value_bool(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getBoolean(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    bool value;
    NAPI_CALL(env, napi_get_value_bool(env, args[0], &value));
    napi_value output;
    NAPI_CALL(env, napi_get_boolean(env, value, &output));
    return output;
}

static napi_value getBooleanNull(napi_env env, napi_callback_info info)
{
    bool value = false;
    napi_status status = napi_get_boolean(env, value, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueNotBool(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_value boolValue;
    NAPI_CALL(env, napi_create_int32(env, 0, &boolValue));
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    bool value;
    napi_status status = napi_get_value_bool(env, boolValue, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueDoubleValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_get_value_double(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueDoubleResultNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    double value;
    napi_status status = napi_get_value_double(env, nullptr, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueDoubleNotNum(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    double value;
    napi_status status = napi_get_value_double(env, arrayBuffer, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueExternalValueNull(napi_env env, napi_callback_info info)
{
    const char testStr[] = "test";
    napi_value external = nullptr;
    napi_create_external(
        env, (void*)testStr,
        [](napi_env env, void* data, void* hint) {},
        (void*)testStr, &external);
    void* tempExternal = nullptr;
    napi_status status = napi_get_value_external(env, nullptr, &tempExternal);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueExternalResultNull(napi_env env, napi_callback_info info)
{
    const char testStr[] = "test";
    napi_value external = nullptr;
    napi_create_external(
        env, (void*)testStr,
        [](napi_env env, void* data, void* hint) {},
        (void*)testStr, &external);
    napi_status status = napi_get_value_external(env, external, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueExternalNotPtr(napi_env env, napi_callback_info info)
{
    const char testStr[] = "test";
    napi_value external;
    NAPI_CALL(env, napi_create_int32(env, 0, &external));
    napi_create_external(
        env, (void*)testStr,
        [](napi_env env, void* data, void* hint) {},
        (void*)testStr, &external);
    void* tempExternal = nullptr;
    napi_status status = napi_get_value_external(env, external, &tempExternal);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueStringLatin1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));
    NAPI_ASSERT(env, valuetype == napi_string,
                "Wrong type of argment. Expects a string.");
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    NAPI_CALL(env,
        napi_get_value_string_latin1(env, args[0], buffer, bufferSize, &copied));
    NAPI_ASSERT(env, copied == NAPI_COPIED_VALUE, "napi_get_value_string_latin1 fail");
    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));
    return output;
}

static napi_value getValueStringLatin1Null(napi_env env, napi_callback_info info)
{
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    napi_status status = napi_get_value_string_latin1(env, nullptr, buffer, bufferSize, &copied);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueStringUtf8(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
                "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_utf8(env, args[0], buffer, bufferSize, &copied));
    NAPI_ASSERT(env, copied == NAPI_ARGC_LENGTH, "napi_get_value_string_utf8 fail");

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));

    return output;
}

static napi_value getValueStringUtf8Null(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    napi_status status = napi_get_value_string_utf8(env, nullptr, buffer, bufferSize, &copied);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueStringUtf8NotStr(napi_env env, napi_callback_info info)
{
    napi_value args;
    NAPI_CALL(env, napi_create_int32(env, 0, &args));
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    napi_status status = napi_get_value_string_utf8(env, args, buffer, bufferSize, &copied);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueStringUtf16(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments.");
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));
    NAPI_ASSERT(env, valuetype == napi_string, "Expect a string.");
    char16_t buffer[128]; // 128: char16_t type of element size
    size_t bufferSize = 128; // 128: char16_t type of element size
    size_t copied = 0;
    NAPI_CALL(env, napi_get_value_string_utf16(env, args[0], buffer, bufferSize, &copied));
    napi_value result;
    NAPI_CALL(env, napi_create_string_utf16(env, buffer, copied, &result));
    return result;
}

static napi_value getValueStringUtf16Null(napi_env env, napi_callback_info info)
{
    char16_t buffer[128]; // 128: char16_t type of element size
    size_t bufferSize = 128; // 128: char16_t type of element size
    size_t copied = 0;
    napi_status status = napi_get_value_string_utf16(env, nullptr, buffer, bufferSize, &copied);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueStringUtf16NotStr(napi_env env, napi_callback_info info)
{
    napi_value args;
    NAPI_CALL(env, napi_create_int32(env, 0, &args));
    char16_t buffer[128]; // 128: char16_t type of element size
    size_t bufferSize = 128; // 128: char16_t type of element size
    size_t copied = 0;
    napi_status status = napi_get_value_string_utf16(env, args, buffer, bufferSize, &copied);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueUint32(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    uint32_t value;
    NAPI_CALL(env, napi_get_value_uint32(env, args[0], &value));

    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, value, &output));

    return output;
}

static napi_value getValueUint32Null(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint32_t value;
    napi_status status = napi_get_value_uint32(env, args[0], &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueUint32NotNum(napi_env env, napi_callback_info info)
{
    napi_value args = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &args);
    uint32_t value;
    napi_status status = napi_get_value_uint32(env, args, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToBoolValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_value output;
    napi_status status = napi_coerce_to_bool(env, nullptr, &output);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToBoolResultNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_coerce_to_bool(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNumberValueNull(napi_env env, napi_callback_info info)
{
    napi_value output;
    napi_status status = napi_coerce_to_number(env, nullptr, &output);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNumberRstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_coerce_to_number(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value typeOf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));
    napi_value ret;
    NAPI_CALL(env, napi_create_int32(env, 0, &ret));
    return ret;
}

static napi_value typeOfValueNull(napi_env env, napi_callback_info info)
{
    napi_valuetype valuetype;
    napi_status status = napi_typeof(env, nullptr, &valuetype);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value typeOfRstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_status status = napi_typeof(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value instanceOfObjectNull(napi_env env, napi_callback_info info)
{
    napi_value customClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        }, nullptr, 0, nullptr, &customClass);
    napi_value customClassPrototype = nullptr;
    napi_get_prototype(env, customClass, &customClassPrototype);
    napi_value customInstance = nullptr;
    NAPI_CALL(env, napi_new_instance(env, customClass, 0, nullptr, &customInstance));
    bool isInstanceOf = false;
    napi_status status = napi_instanceof(env, nullptr, customClass, &isInstanceOf);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value instanceOfConstructorNull(napi_env env, napi_callback_info info)
{
    napi_value customClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        }, nullptr, 0, nullptr, &customClass);
    napi_value customClassPrototype = nullptr;
    napi_get_prototype(env, customClass, &customClassPrototype);
    napi_value customInstance = nullptr;
    NAPI_CALL(env, napi_new_instance(env, customClass, 0, nullptr, &customInstance));
    bool isInstanceOf = false;
    napi_status status = napi_instanceof(env, customInstance, nullptr, &isInstanceOf);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value instanceOfResultNull(napi_env env, napi_callback_info info)
{
    napi_value customClass = nullptr;
    napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        }, nullptr, 0, nullptr, &customClass);
    napi_value customClassPrototype = nullptr;
    napi_get_prototype(env, customClass, &customClassPrototype);
    napi_value customInstance = nullptr;
    NAPI_CALL(env, napi_new_instance(env, customClass, 0, nullptr, &customInstance));
    napi_status status = napi_instanceof(env, customInstance, customClass, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isArrayValueNull(napi_env env, napi_callback_info info)
{
    napi_value array = nullptr;
    napi_create_array(env, &array);
    NAPI_ASSERT(env, array != nullptr, "napi_get_undefined success");
    bool isArray = false;
    napi_status status = napi_is_array(env, nullptr, &isArray);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isArrayResultNull(napi_env env, napi_callback_info info)
{
    napi_value array = nullptr;
    napi_create_array(env, &array);
    NAPI_ASSERT(env, array != nullptr, "napi_get_undefined success");
    napi_status status = napi_is_array(env, array, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isDataView(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "napi_create_arraybuffer success");
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, " napi_is_arraybuffer success");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, &result));

    bool isDataView = false;
    napi_is_dataview(env, result, &isDataView);
    NAPI_ASSERT(env, isDataView, " napi_is_dataview success");
    
    return result;
}

static napi_value isDataViewValueNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    size_t arrayBufferSize = 16;
    void* arrayBufferPtr = nullptr;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, &result));
    bool isDataView = false;
    napi_status status = napi_is_dataview(env, nullptr, &isDataView);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isDataViewRstNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    size_t arrayBufferSize = 16;
    void* arrayBufferPtr = nullptr;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_dataview(env, arrayBufferSize, arrayBuffer, 0, &result));
    napi_status status = napi_is_dataview(env, result, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isArrayBuffer(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "napi_create_arraybuffer success");
    bool isArrayBuffer = false;
    napi_is_arraybuffer(env, arrayBuffer, &isArrayBuffer);
    NAPI_ASSERT(env, isArrayBuffer, " napi_is_arraybuffer success");
    napi_value ret;
    NAPI_CALL(env, napi_create_int32(env, 0, &ret));
    return ret;
}

static napi_value isArrayBufferValueNull(napi_env env, napi_callback_info info)
{
    bool isArrayBuffer = false;
    napi_status status = napi_is_arraybuffer(env, nullptr, &isArrayBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isArrayBufferRstNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, arrayBufferPtr != nullptr, "napi_create_arraybuffer success");
    napi_status status = napi_is_arraybuffer(env, arrayBuffer, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isTypedArray(napi_env env, napi_callback_info info)
{
    static size_t length = 10;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);

    napi_value result = nullptr;
    napi_create_sendable_typedarray(env, napi_uint8_array, length, arraybuffer, offset, &result);
    bool isTypedArray = false;
    napi_is_typedarray(env, result, &isTypedArray);
    NAPI_ASSERT(env, isTypedArray, "napi_is_typedarray success");
    napi_value ret;
    NAPI_CALL(env, napi_create_int32(env, 0, &ret));
    return ret;
}

static napi_value isTypedArrayValueNull(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);
    bool isTypedArray = false;
    napi_status status = napi_is_typedarray(env, nullptr, &isTypedArray);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isTypedArrayRstNull(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);
    napi_value result = nullptr;
    napi_create_sendable_typedarray(env, napi_uint8_array, length, arraybuffer, offset, &result);
    napi_status status = napi_is_typedarray(env, result, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isDateValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value date;
    bool isDate = false;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &date, nullptr, nullptr));
    napi_status status = napi_is_date(env, nullptr, &isDate);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isDateResultNull(napi_env env, napi_callback_info info)
{
    napi_value date;
    size_t argc = 1;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &date, nullptr, nullptr));
    napi_status status = napi_is_date(env, date, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value strictEqualsFirstValueNull(napi_env env, napi_callback_info info)
{
    const char* testStringStr = "test";
    napi_value testString = nullptr;
    napi_create_string_utf8(env, testStringStr, strlen(testStringStr), &testString);
    bool isStrictEquals = false;
    napi_status status = napi_strict_equals(env, nullptr, testString, &isStrictEquals);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value strictEqualsSecondValueNull(napi_env env, napi_callback_info info)
{
    const char* testStringStr = "test";
    napi_value testString = nullptr;
    napi_create_string_utf8(env, testStringStr, strlen(testStringStr), &testString);
    bool isStrictEquals = false;
    napi_status status = napi_strict_equals(env, testString, nullptr, &isStrictEquals);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value strictEqualsResultNull(napi_env env, napi_callback_info info)
{
    const char* testStringStr = "test";
    napi_value testString = nullptr;
    napi_create_string_utf8(env, testStringStr, strlen(testStringStr), &testString);
    napi_status status = napi_strict_equals(env, testString, testString, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value strictEqualsNaN(napi_env env, napi_callback_info info)
{
    napi_value value1;
    NAPI_CALL(env, napi_create_int32(env, sqrt(NAPI_INVALID_NUM1), &value1));
    napi_value value2;
    NAPI_CALL(env, napi_create_int32(env, sqrt(NAPI_INVALID_NUM2), &value2));
    bool isStrictEquals = false;
    napi_status status = napi_strict_equals(env, value1, value2, &isStrictEquals);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyNamesObjectNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    const char testStr[] = "1234567";
    napi_value strAttribute = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &strAttribute));
    NAPI_CALL(env, napi_set_named_property(env, result, "strAttribute", strAttribute));
    napi_value retStrAttribute = nullptr;
    napi_status status = napi_get_named_property(env, result, nullptr, &retStrAttribute);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyNamesResultNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    const char testStr[] = "1234567";
    napi_value strAttribute = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &strAttribute));
    NAPI_CALL(env, napi_set_named_property(env, result, "strAttribute", strAttribute));
    napi_status status = napi_get_named_property(env, result, "strAttribute", nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyNamesNotObject(napi_env env, napi_callback_info info)
{
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    napi_value retStrAttribute = nullptr;
    napi_status status = napi_get_named_property(env, result, "strAttribute", &retStrAttribute);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setPropertyValueNull(napi_env env,
                                       napi_callback_info info)
{
    napi_status status;
    napi_value object, key, value;
    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &value));
    status = napi_set_property(nullptr, object, key, value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setPropertyResultNull(napi_env env,
                                        napi_callback_info info)
{
    napi_status status;
    napi_value object, key, value;
    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &value));
    status = napi_set_property(nullptr, object, key, value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setPropertyNoObject(napi_env env,
                                      napi_callback_info info)
{
    napi_status status;
    napi_value object, key, value;
    NAPI_CALL(env, napi_create_int32(env, 0, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &value));
    status = napi_set_property(nullptr, object, key, value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyObjectNull(napi_env env,
                                        napi_callback_info info)
{
    napi_status status;
    napi_value object, key, result;
    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &result));
    status = napi_get_property(nullptr, object, key, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyKeyNull(napi_env env,
                                     napi_callback_info info)
{
    napi_status status;
    napi_value object, key, result;
    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &result));
    status = napi_get_property(nullptr, object, key, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyResultNull(napi_env env,
                                        napi_callback_info info)
{
    napi_status status;
    napi_value object, key, result;
    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &result));
    status = napi_get_property(nullptr, object, key, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getPropertyNotObject(napi_env env,
                                       napi_callback_info info)
{
    napi_status status;
    napi_value object, key, result;
    NAPI_CALL(env, napi_create_int32(env, 0, &object));
    NAPI_CALL(env, napi_create_string_utf8(env, "", NAPI_AUTO_LENGTH, &key));
    NAPI_CALL(env, napi_create_object(env, &result));
    status = napi_get_property(nullptr, object, key, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasPropertyObjectNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    const char testStr[] = "cKey";
    napi_value cKey;
    napi_value cValue;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &cKey));
    NAPI_CALL(env, napi_create_int32(env, 3, &cValue));
    napi_set_property(env, args[0], cKey, cValue);
    bool hasProp = false;
    napi_status status = napi_has_property(env, nullptr, cKey, &hasProp);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasPropertyKeyNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    bool hasProp = false;
    napi_status status = napi_has_property(env, args[0], nullptr, &hasProp);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasPropertyResultNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    const char testStr[] = "cKey";
    napi_value cKey;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &cKey));
    napi_status status = napi_has_property(env, args[0], cKey, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deletePropertyObjectNull(napi_env env, napi_callback_info info)
{
    const char testStr[] = "cKey";
    napi_value cKey;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &cKey));
    bool result;
    napi_status status = napi_delete_property(env, nullptr, cKey, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deletePropertyKeyNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    bool result;
    napi_status status = napi_delete_property(env, args[0], nullptr, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deletePropertyResultNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    const char testStr[] = "cKey";
    napi_value cKey;
    NAPI_CALL(env, napi_create_string_utf8(env, testStr, strlen(testStr), &cKey));
    napi_status status = napi_delete_property(env, args[0], cKey, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasOwnPropertyObjectNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    bool hasProperty;
    napi_status status = napi_has_own_property(env, nullptr, args[1], &hasProperty);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasOwnPropertyKeytNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    bool hasProperty;
    napi_status status = napi_has_own_property(env, args[0], nullptr, &hasProperty);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasOwnPropertyResultNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype valuetype0;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype0));
    napi_status status = napi_has_own_property(env, args[0], args[1], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setNamedPropertyObjectNull(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    char key[256] = "";
    size_t keyLength;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));
    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));
    NAPI_CALL(env,
              napi_get_value_string_utf8(env, args[1], key, NAPI_UTF8_MAX, &keyLength));
    key[NAPI_UTF8_MAX] = 0;
    napi_status status = napi_set_named_property(env, nullptr, key, args[NAPI_ARGS_LENGTH]);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setNamedPropertyKeyNull(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    char key[256] = "";
    size_t keyLength;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));
    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));
    NAPI_CALL(env,
              napi_get_value_string_utf8(env, args[1], key, NAPI_UTF8_MAX, &keyLength));
    key[NAPI_UTF8_MAX] = 0;
    napi_status status = napi_set_named_property(env, args[0], nullptr, args[NAPI_ARGS_LENGTH]);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setNamedPropertyResultNull(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    char key[256] = "";
    size_t keyLength;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));
    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));
    NAPI_CALL(env,
              napi_get_value_string_utf8(env, args[1], key, NAPI_UTF8_MAX, &keyLength));
    key[NAPI_UTF8_MAX] = 0;
    napi_status status = napi_set_named_property(env, args[0], key, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getNamedPropertyObjectNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    char key[256] = "";
    size_t keyLength;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_valuetype value_type0;
    NAPI_CALL(env, napi_typeof(env, args[0], &value_type0));
    napi_valuetype value_type1;
    NAPI_CALL(env, napi_typeof(env, args[1], &value_type1));
    NAPI_CALL(env,
              napi_get_value_string_utf8(env, args[1], key, NAPI_UTF8_MAX, &keyLength));
    key[NAPI_UTF8_MAX] = 0;
    napi_value output;
    napi_status status = napi_get_named_property(env, nullptr, key, &output);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getNamedPropertyKeyNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    napi_value object = args[0];
    napi_value output;
    napi_status status = napi_get_named_property(env, object, nullptr, &output);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getNamedPropertyResultNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    char key[256] = "";
    napi_value object = args[0];
    napi_status status = napi_get_named_property(env, object, key, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasNamedPropertyObjectNull(napi_env env, napi_callback_info info)
{
    char key[256] = "";
    key[NAPI_UTF8_MAX] = 0;
    bool hasProperty;
    napi_status status = napi_has_named_property(env, nullptr, key, &hasProperty);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasNamedPropertyKeyNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    bool hasProperty;
    napi_status status = napi_has_named_property(env, args[0], nullptr, &hasProperty);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasNamedPropertyResultNull(napi_env env, napi_callback_info info)
{
    napi_value args[2];
    char key[256] = "";
    napi_status status = napi_has_named_property(env, args[0], key, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setElementObjectNull(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    napi_status status = napi_set_element(env, nullptr, 0, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setElementRstNull(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    napi_status status = napi_set_element(env, nullptr, 0, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value setElementNotObj(napi_env env, napi_callback_info info)
{
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    napi_status status = napi_set_element(env, nullptr, 0, value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getElementObjNull(napi_env env, napi_callback_info info)
{
    napi_value return_value, object, prop;
    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));
    napi_status status = napi_get_element(nullptr, nullptr, 0, &prop);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getElementRstNull(napi_env env, napi_callback_info info)
{
    napi_value return_value, object;
    NAPI_CALL(env, napi_create_object(env, &return_value));
    NAPI_CALL(env, napi_create_object(env, &object));
    napi_status status = napi_get_element(nullptr, object, 0, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getElementNotObj(napi_env env, napi_callback_info info)
{
    napi_value return_value, prop;
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    NAPI_CALL(env, napi_create_object(env, &return_value));
    napi_status status = napi_get_element(nullptr, value, 0, &prop);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasElementObjNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    napi_value propNames = nullptr;
    NAPI_CALL(env, napi_get_property_names(env, result, &propNames));
    bool isArray = false;
    NAPI_CALL(env, napi_is_array(env, propNames, &isArray));
    uint32_t arrayLength = 0;
    NAPI_CALL(env, napi_get_array_length(env, propNames, &arrayLength));
    bool deletion = false;
    NAPI_CALL(env, napi_delete_element(env, propNames, 1, &deletion));
    bool hasElement = true;
    napi_status status = napi_has_element(env, nullptr, 1, &hasElement);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasElementRstNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    napi_value propNames = nullptr;
    NAPI_CALL(env, napi_get_property_names(env, result, &propNames));
    bool isArray = false;
    NAPI_CALL(env, napi_is_array(env, propNames, &isArray));
    uint32_t arrayLength = 0;
    NAPI_CALL(env, napi_get_array_length(env, propNames, &arrayLength));
    bool deletion = false;
    NAPI_CALL(env, napi_delete_element(env, propNames, 1, &deletion));
    napi_status status = napi_has_element(env, propNames, 1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deleteElementObjNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    napi_value propNames = nullptr;
    NAPI_CALL(env, napi_get_property_names(env, result, &propNames));
    bool isArray = false;
    NAPI_CALL(env, napi_is_array(env, propNames, &isArray));
    uint32_t arrayLength = 0;
    NAPI_CALL(env, napi_get_array_length(env, propNames, &arrayLength));
    bool deletion = false;
    napi_status status = napi_delete_element(env, nullptr, 1, &deletion);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deleteElementRstNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_object(env, &result));
    napi_value propNames = nullptr;
    NAPI_CALL(env, napi_get_property_names(env, result, &propNames));
    bool isArray = false;
    NAPI_CALL(env, napi_is_array(env, propNames, &isArray));
    uint32_t arrayLength = 0;
    NAPI_CALL(env, napi_get_array_length(env, propNames, &arrayLength));
    napi_status status = napi_delete_element(env, propNames, 1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value definePropertiesObjNull(napi_env env, napi_callback_info info)
{
    napi_value object, return_value;
    NAPI_CALL(env, napi_create_object(env, &object));
    NAPI_CALL(env, napi_create_object(env, &return_value));
    napi_status status = napi_define_properties(env, nullptr, 1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value typeTaggedObjNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    uint32_t typeIndex = 0;
    napi_value whichType = nullptr;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &whichType, nullptr, nullptr));
    napi_status status = napi_type_tag_object(env, nullptr, &typeTags[typeIndex]);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value typeTaggedTagNull(napi_env env, napi_callback_info info)
{
    napi_value instance = nullptr;
    NAPI_CALL(env, napi_create_object(env, &instance));
    napi_status status = napi_type_tag_object(env, instance, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value CheckTypeTagObjNull(napi_env env, napi_callback_info info)
{
    bool result;
    uint32_t typeIndex = 0;
    napi_status status = napi_check_object_type_tag(env, nullptr, &typeTags[typeIndex], &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value CheckTypeTagTagNull(napi_env env, napi_callback_info info)
{
    bool result;
    napi_value argv[2];
    napi_status status = napi_check_object_type_tag(env, argv[1], nullptr, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value CheckTypeTagRstNull(napi_env env, napi_callback_info info)
{
    napi_value argv[2];
    uint32_t typeIndex = 0;
    napi_status status = napi_check_object_type_tag(env, argv[1], &typeTags[typeIndex], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value callFunctionNull(napi_env env, napi_callback_info info)
{
    napi_value ret;
    napi_status status = napi_call_function(env, nullptr, nullptr, 0, nullptr, &ret);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiCreateFunctionFuncNull(napi_env env, napi_callback_info info)
{
    napi_value funcValue = nullptr;
    napi_status status = napi_create_function(env, nullptr, NAPI_AUTO_LENGTH, SayHello, nullptr, &funcValue);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiCreateFunctionRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, SayHello, nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiGetCbInfoNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, nullptr, &argc, args, nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value newTargetInfoNull(napi_env env, napi_callback_info info)
{
    bool isConstructor = true;
    napi_value constructor = nullptr;
    napi_get_new_target(env, nullptr, &constructor);
    if (constructor == nullptr) {
        napi_throw_error(env, nullptr, "is not new instance");
        isConstructor = false;
    }
    napi_value value;
    NAPI_CALL(env, napi_get_boolean(env, isConstructor, &value));
    return value;
}

static napi_value newTargetRstNull(napi_env env, napi_callback_info info)
{
    bool isConstructor = true;
    napi_value constructor = nullptr;
    napi_get_new_target(env, info, nullptr);
    if (constructor == nullptr) {
        napi_throw_error(env, nullptr, "is not new instance");
        isConstructor = false;
    }
    napi_value value;
    NAPI_CALL(env, napi_get_boolean(env, isConstructor, &value));
    return value;
}

static napi_value newInstanceNull(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_define_class(
        env, "TestWrapClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testWrapClass);
    napi_value arg;
    NAPI_CALL(env, napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &arg));

    size_t argc = 1;
    napi_value instanceValue = nullptr;
    napi_status status = napi_new_instance(env, nullptr, argc, nullptr, &instanceValue);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value newInstanceNotFunc(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_value arg;
    NAPI_CALL(env, napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &arg));
    napi_value *argv = &arg;
    size_t argc = 1;
    napi_value instanceValue = nullptr;
    NAPI_CALL(env, napi_new_instance(env, testWrapClass, argc, argv, &instanceValue));
    bool isInstanceOf = false;
    napi_status status = napi_instanceof(env, instanceValue, testWrapClass, &isInstanceOf);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineClassUTFNull(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_status status = napi_define_class(env, nullptr, NAPI_AUTO_LENGTH,
                  [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineClassConstructorNull(napi_env env, napi_callback_info info)
{
    napi_value testWrapClass = nullptr;
    napi_status status = napi_define_class(env, "TestWrapClass", NAPI_AUTO_LENGTH, nullptr,
                                           nullptr, 0, nullptr, &testWrapClass);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineClassRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_define_class(env, "TestWrapClass",
                                           NAPI_AUTO_LENGTH,
                                           [](napi_env env,
                                           napi_callback_info info) -> napi_value {
                                           napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineClassLengthExceed(napi_env env, napi_callback_info info)
{
    size_t lengthValue = 4294967295;
    napi_value testWrapClass = nullptr;
    napi_status status = napi_define_class(env, "TestWrapClass", lengthValue, 
                  [](napi_env env, napi_callback_info info) -> napi_value {
                  napi_value thisVar = nullptr;
                  napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
                  return thisVar;
              }, nullptr, 0, nullptr, &testWrapClass);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value unwrapObjNull(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);
    const char* tmpTestStr = nullptr;
    napi_status status = napi_unwrap(env, nullptr, (void**)&tmpTestStr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value unwrapRstNull(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);
    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);
    const char* testStr = "test";
    napi_wrap(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, nullptr);
    napi_status status = napi_unwrap(env, instanceValue, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value removeWrapObjNull(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);
    const char* tmpTestStr1 = nullptr;
    napi_status status = napi_remove_wrap(env, nullptr, (void**)&tmpTestStr1);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value removeWrapRstNull(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);
    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);
    const char* testStr = "test";
    napi_wrap(
        env, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, nullptr, nullptr);
    const char* tmpTestStr = nullptr;
    NAPI_CALL(env, napi_unwrap(env, instanceValue, (void**)&tmpTestStr));
    NAPI_ASSERT(env, tmpTestStr == testStr, "napi_unwrap fail");
    napi_status status = napi_remove_wrap(env, instanceValue, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value cancelAsyncWorkNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_cancel_async_work(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value queueAsyncWork(napi_env env, napi_callback_info info)
{
    AsyncContext *context = new AsyncContext();
    context->env = env;
    napi_value resource = nullptr;
    napi_create_string_utf8(env, "add async task", NAPI_AUTO_LENGTH, &resource);
    napi_create_async_work(env, nullptr, resource, [](napi_env env, void *data) {}, completeCb,
        context, &context->asyncWork);
    napi_queue_async_work(env, context->asyncWork);
    return nullptr;
}

static napi_value queueAsyncWorkNull(napi_env env, napi_callback_info info)
{
    AsyncContext *context = new AsyncContext();
    context->env = env;
    napi_value resource = nullptr;
    napi_create_string_utf8(env, "add async task", NAPI_AUTO_LENGTH, &resource);
    napi_create_async_work(env, nullptr, resource, [](napi_env env, void *data) {}, completeCb,
        context, &context->asyncWork);
    napi_status status = napi_queue_async_work(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deleteAsyncWorkNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_delete_async_work(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineSendableClassEnvNull(napi_env env, napi_callback_info info)
{
    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {
        {"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;
    napi_status status = napi_define_sendable_class(
        nullptr, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {
                {"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr,
                 [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 },
                 nullptr, nullptr, nullptr, napi_default, nullptr},
            };
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        },
        nullptr, sizeof(props) / sizeof(props[0]), props, nullptr, &sendableClass);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineSendableClassNameNull(napi_env env, napi_callback_info info)
{
    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {
        {"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;
    napi_status status = napi_define_sendable_class(
        env, nullptr, NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {
                {"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr,
                 [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 },
                 nullptr, nullptr, nullptr, napi_default, nullptr},
            };
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        },
        nullptr, sizeof(props) / sizeof(props[0]), props, nullptr, &sendableClass);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineSendableClassConstructorNull(napi_env env, napi_callback_info info)
{
    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {
        {"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;
    napi_status status = napi_define_sendable_class(
        env, "SendableClass", NAPI_AUTO_LENGTH, nullptr,
        nullptr, sizeof(props) / sizeof(props[0]), props, nullptr, &sendableClass);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value defineSendableClassRstNull(napi_env env, napi_callback_info info)
{
    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {
        {"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };

    napi_status status = napi_define_sendable_class(
        env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {
                {"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr,
                 [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 },
                 nullptr, nullptr, nullptr, napi_default, nullptr},
            };
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        },
        nullptr, sizeof(props) / sizeof(props[0]), props, nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableObjectWithPropertiesEnvNull(napi_env env, napi_callback_info info)
{
    napi_value excep;
    NAPI_CALL(env, napi_get_and_clear_last_exception(env, &excep));
    napi_value val_false;
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, false, &val_false));
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    napi_property_descriptor desc1[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    };
    napi_value obj1;
    napi_status status = napi_create_sendable_object_with_properties(nullptr, 1, desc1, &obj1);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableObjectWithPropertiesRstNull(napi_env env, napi_callback_info info)
{
    napi_value excep;
    NAPI_CALL(env, napi_get_and_clear_last_exception(env, &excep));
    napi_value val_false;
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, false, &val_false));
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    napi_property_descriptor desc1[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    };
    napi_status status = napi_create_sendable_object_with_properties(env, 1, desc1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayEnvNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_array(nullptr, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_array(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayWithLengthEnvNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_array_with_length(nullptr, 1, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayWithLengthRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_sendable_array_with_length(env, 1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayBufferEnvNull(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    void* data;
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_arraybuffer(nullptr, length, &data, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayBufferDataNull(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_arraybuffer(env, length, nullptr, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableArrayBufferRstNull(napi_env env, napi_callback_info info)
{
    static size_t length = 1024;
    void* data;
    napi_status status = napi_create_sendable_arraybuffer(env, length, &data, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableTypedArrayEnvNull(napi_env env, napi_callback_info info)
{
    static size_t length = 10;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(nullptr, napi_uint8_array, length,
                                                         arraybuffer, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableTypedArraRstNull(napi_env env, napi_callback_info info)
{
    static size_t length = 10;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);
    napi_status status = napi_create_sendable_typedarray(env, napi_uint8_array, length,
                                                         arraybuffer, offset, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableTypedArraBufferNull(napi_env env, napi_callback_info info)
{
    static size_t length = 10;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_uint8_array, length,
                                                         nullptr, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableTypedArrayNotType(napi_env env, napi_callback_info info)
{
    static size_t length = 10;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer = nullptr;
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);

    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env,
	    static_cast<napi_typedarray_type>(-1), length, arraybuffer, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createSendableTypedArrayNotBuffer(napi_env env, napi_callback_info info)
{
    static size_t length = 10;
    static size_t offset = 0;
    void* data;
    napi_value arraybuffer;
    NAPI_CALL(env, napi_create_int32(env, 0, &arraybuffer));
    napi_create_sendable_arraybuffer(env, length, &data, &arraybuffer);
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_typedarray(env, napi_uint8_array, length,
                                                         arraybuffer, offset, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value wrapSendableEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);
    napi_status status = napi_wrap_sendable(
        nullptr, args[0], (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiWrapSendableObj1Null(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);

    napi_status status = napi_wrap_sendable(
        env, nullptr, (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiWrapSendableObj2Null(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);

    napi_status status = napi_wrap_sendable(
        env, args[0], nullptr,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value wrapSendableWithSizeEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);
    static size_t nativeBindingSize = 1024;
    napi_status status = napi_wrap_sendable_with_size(
        nullptr, args[0], (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr, nativeBindingSize);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value wrapSendableWithSizeObj1Null(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);
    static size_t nativeBindingSize = 1024;
    napi_status status = napi_wrap_sendable_with_size(
        env, nullptr, (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr, nativeBindingSize);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value wrapSendableWithSizeObj2Null(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    static size_t length = 256;
    char* data = new char[length];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[1], data, length - 1, &size);
    static size_t nativeBindingSize = 1024;
    napi_status status = napi_wrap_sendable_with_size(
        env, args[0], nullptr,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        nullptr, nativeBindingSize);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value removeWrapSendableEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char* data = nullptr;
    napi_status status = napi_remove_wrap_sendable(nullptr, args[0], (void**)&data);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value removeWrapSendableObjNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char* data = nullptr;
    napi_status status = napi_remove_wrap_sendable(env, nullptr, (void**)&data);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value removeWrapSendableRstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_status status = napi_remove_wrap_sendable(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getNodeVersionEnvNull(napi_env env, napi_callback_info info)
{
    const napi_node_version* version;
    napi_status status = napi_get_node_version(nullptr, &version);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getNodeVersionRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_node_version(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value releaseThreadsafeFunction(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_threadsafe_function func = (napi_threadsafe_function)data;
    napi_threadsafe_function_call_mode blockMode = napi_tsfn_nonblocking;
    void* context = nullptr;
    napi_status status = napi_get_threadsafe_function_context(func, &context);
    NAPI_ASSERT(env, status != napi_ok, "napi_get_threadsafe_function_context fail");
    static int32_t gSendData = 0;
    napi_call_threadsafe_function(func, &gSendData, blockMode);
    status = napi_call_threadsafe_function(func, &gSendData, blockMode);
    NAPI_ASSERT(env, status != napi_ok, "napi_call_threadsafe_function fail");
    status = napi_release_threadsafe_function(func, napi_tsfn_release);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value releaseThreadsafeFunctionNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_release_threadsafe_function(nullptr, napi_tsfn_release);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createThreadsafeFunctionInitialThreadCountNegative(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t  callJstCbDataTestId = 101;
    int32_t  finalCbtDataTestID = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, resourceName,
                                                         0, -1, &callJstCbDataTestId, nullptr,
                                                         &finalCbtDataTestID, nullptr, &tsFunc);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getVersionRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_version(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getVersionEnvNull(napi_env env, napi_callback_info info)
{
    uint32_t version;
    napi_status status = napi_get_version(nullptr, &version);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createPromiseEnvNull(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_status status = napi_create_promise(nullptr, &deferred, &promise);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createPromiseDeferredNull(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    napi_status status = napi_create_promise(env, nullptr, &promise);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createPromisePromiseNull(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value resolveDeferredEnvNull(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value undefined = nullptr;
    napi_status status = napi_resolve_deferred(nullptr, deferred, undefined);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value resolveDeferredNull(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    bool isPromise = false;
    napi_is_promise(env, promise, &isPromise);
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_status status = napi_resolve_deferred(env, nullptr, undefined);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isPromiseEnvNull(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    bool isPromise = false;
    napi_status status = napi_is_promise(nullptr, promise, &isPromise);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isPromiseValueNull(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    NAPI_CALL(env, napi_create_promise(env, &deferred, nullptr));
    bool isPromise = false;
    napi_status status = napi_is_promise(env, nullptr, &isPromise);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isPromiseRstNull(napi_env env, napi_callback_info info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    NAPI_CALL(env, napi_create_promise(env, &deferred, nullptr));
    napi_status status = napi_is_promise(env, promise, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getUvEventLoopEnvNull(napi_env env, napi_callback_info info)
{
    struct uv_loop_s* loop = nullptr;
    napi_status status = napi_get_uv_event_loop(nullptr, &loop);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getUvEventLoopRstNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_uv_event_loop(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createThreadsafeFunctionEnvNull(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    int32_t  callJstCbDataTestId = 101;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t  finalCbtDataTestID = 1001;
    napi_status status = napi_create_threadsafe_function(nullptr, nullptr, nullptr, resourceName,
                                                         0, 1, &callJstCbDataTestId, nullptr,
                                                         &finalCbtDataTestID, nullptr, &tsFunc);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createThreadsafeFunctionNameNull(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    int32_t  callJstCbDataTestId = 101;
    int32_t  finalCbtDataTestID = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, nullptr,
                                                         0, 1, &callJstCbDataTestId, nullptr,
                                                         &finalCbtDataTestID, nullptr, &tsFunc);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiCallThreadsafeFunctionNull(napi_env env, napi_callback_info info)
{
    void* data = nullptr;
    napi_threadsafe_function func = (napi_threadsafe_function)data;
    napi_threadsafe_function_call_mode blockMode = napi_tsfn_nonblocking;
    void* context = nullptr;
    napi_get_threadsafe_function_context(func, &context);
    static int32_t gSendData = 0;
    napi_status status = napi_call_threadsafe_function(func, &gSendData, blockMode);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value refThreadSafeFunctionEnvNull(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t callJsCbDataTestId = 101;
    int32_t finalCbDataTestId = 1001;
    napi_create_threadsafe_function(env, nullptr, nullptr, resourceName,
                                                         0, 1, &callJsCbDataTestId,
                                                         nullptr, &finalCbDataTestId, nullptr, &tsFunc);
    napi_status status = napi_ref_threadsafe_function(nullptr, tsFunc);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value refThreadSafeFunctionFuncNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_ref_threadsafe_function(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createDateEnvNull(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_status status = napi_create_date(nullptr, time, &createResult);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createDateRstNull(napi_env env, napi_callback_info info)
{
    double time = 202110181203150;
    napi_status status = napi_create_date(env, time, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintUint64EnvNull(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
    uint64_t resultValue = 0;
    bool flag = false;
    napi_status status = napi_get_value_bigint_uint64(nullptr, result, &resultValue, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintUint64ValueNull(napi_env env, napi_callback_info info)
{
    uint64_t resultValue = 0;
    bool flag = false;
    napi_status status = napi_get_value_bigint_uint64(env, nullptr, &resultValue, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintUint64RstNull(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
    bool flag = false;
    napi_status status = napi_get_value_bigint_uint64(env, result, nullptr, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintUint64LossNull(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
    uint64_t resultValue = 0;
    napi_status status = napi_get_value_bigint_uint64(env, result, &resultValue, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintInt64EnvNull(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_int64(env, testValue, &result);
    int64_t resultValue = 0;
    bool flag = false;
    napi_status status = napi_get_value_bigint_int64(nullptr, result, &resultValue, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintInt64ValueNull(napi_env env, napi_callback_info info)
{
    int64_t resultValue = 0;
    bool flag = false;
    napi_status status = napi_get_value_bigint_int64(env, nullptr, &resultValue, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintInt64RstNull(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_int64(env, testValue, &result);
    bool flag = false;
    napi_status status = napi_get_value_bigint_int64(env, result, nullptr, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintInt64LossNull(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_int64(env, testValue, &result);
    int64_t resultValue = 0;
    napi_status status = napi_get_value_bigint_int64(env, result, &resultValue, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintWords(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    int retSignBit = -1;
    size_t retWordCount = 4;
    NAPI_CALL(env, napi_get_value_bigint_words(env, result, &retSignBit, &retWordCount, wordsOut));
    bool testResult = true;
    if (retSignBit != signBit || retWordCount != wordCount) {
        testResult = false;
    }
    for (size_t i = 0; i < wordCount; i++) {
        if (wordsOut[i] != words[i]) {
            testResult = false;
            break;
        }
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, testResult, &value));
    return value;
}

static napi_value getValueBigintWordsEnvNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    int retSignBit = -1;
    size_t retWordCount = 4;
    napi_status status = napi_get_value_bigint_words(nullptr, result, &retSignBit, &retWordCount, wordsOut);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintWordsValueNull(napi_env env, napi_callback_info info)
{
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    int retSignBit = -1;
    size_t retWordCount = 4;
    napi_status status = napi_get_value_bigint_words(env, nullptr, &retSignBit, &retWordCount, wordsOut);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintWordsSignNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    size_t retWordCount = 4;
    napi_status status = napi_get_value_bigint_words(env, result, nullptr, &retWordCount, wordsOut);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintWordsCountNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    int retSignBit = -1;
    napi_status status = napi_get_value_bigint_words(env, result, &retSignBit, nullptr, wordsOut);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBigintWordsWordsNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_bigint_words(env, signBit, wordCount, words, &result));
    int retSignBit = -1;
    size_t retWordCount = 4;
    napi_status status = napi_get_value_bigint_words(env, result, &retSignBit, &retWordCount, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintInt64EnvNull(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_int64(nullptr, testValue, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintInt64RstNull(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_status status = napi_create_bigint_int64(env, testValue, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintUint64EnvNull(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_uint64(nullptr, testValue, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintUint64RstNull(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_status status = napi_create_bigint_uint64(env, testValue, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintWordsEnvNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_words(nullptr, signBit, wordCount, words, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintWordsNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_words(env, signBit, wordCount, nullptr, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintWordsRstNull(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    napi_status status = napi_create_bigint_words(env, signBit, wordCount, words, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferEnvNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(nullptr, bufferSize, (void**)(&copyPtr), &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferDataNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, nullptr, &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferRstNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    char* copyPtr;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferCopyEnvNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_value napiBuffer;
    void* dataPtr = nullptr;
    napi_status status = napi_create_buffer_copy(nullptr, bufferSize, TEST_STR, &dataPtr, &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferCopyDataNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_value napiBuffer;
    void* dataPtr = nullptr;
    napi_status status = napi_create_buffer_copy(env, bufferSize, TEST_STR, &dataPtr, &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferCopyRstDataNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_value napiBuffer;
    void* dataPtr = nullptr;
    napi_status status = napi_create_buffer_copy(env, bufferSize, TEST_STR, &dataPtr, &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferCopyRstNull(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_value napiBuffer;
    void* dataPtr = nullptr;
    napi_status status = napi_create_buffer_copy(env, bufferSize, TEST_STR, &dataPtr, &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createExternalBuffereEnvNull(napi_env env, napi_callback_info info)
{
    char* copyPtr = strdup(TEST_STR);
    napi_value napiBuffer;
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_status status = napi_create_external_buffer(nullptr,
                                                     bufferSize,
                                                     copyPtr,
                                                     DelTest,
                                                     nullptr,
                                                     &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createExternalBuffereDataNull(napi_env env, napi_callback_info info)
{
    napi_value napiBuffer;
    const unsigned int bufferSize = sizeof(TEST_STR);
    napi_status status = napi_create_external_buffer(env,
                                                     bufferSize,
                                                     nullptr,
                                                     DelTest,
                                                     nullptr,
                                                     &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getBufferInfoEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_value napiBuffer = args[0];
    char *bufferData;
    size_t bufferLength;
    napi_status status = napi_get_buffer_info(nullptr, napiBuffer, (void**)(&bufferData), &bufferLength);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getBufferInfoValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *bufferData;
    size_t bufferLength;
    napi_status status = napi_get_buffer_info(env, nullptr, (void**)(&bufferData), &bufferLength);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value IsBufferEnvNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    napi_value napiBuffer = args[0];
    bool result;
    napi_status status = napi_is_buffer(nullptr, napiBuffer, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value IsBufferValueNull(napi_env env, napi_callback_info info)
{
    bool result;
    napi_status status = napi_is_buffer(env, nullptr, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value IsBufferRstNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    size_t argc = 1;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    napi_value napiBuffer = args[0];
    napi_status status = napi_is_buffer(env, napiBuffer, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value objectFreezeEnvNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    napi_value object = args[0];
    napi_status status = napi_object_freeze(nullptr, object);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value objectFreezeObjNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_object_freeze(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value objectSealEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_value objectConstructor;
    napi_get_named_property(env, args[0], "Object", &objectConstructor);
    napi_value object = args[0];
    napi_status status =  napi_object_seal(nullptr, object);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value objectSealObjNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_object_seal(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value GetAllPropertyNamesEnvNull(napi_env env, napi_callback_info info)
{
    napi_value returnValue, props;
    NAPI_CALL(env, napi_create_object(env, &returnValue));
    napi_status status = napi_get_all_property_names(nullptr,
                                                     returnValue,
                                                     napi_key_own_only,
                                                     napi_key_writable,
                                                     napi_key_keep_numbers,
                                                     &props);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value GetAllPropertyNamesObjNull(napi_env env, napi_callback_info info)
{
    napi_value returnValue, props;
    NAPI_CALL(env, napi_create_object(env, &returnValue));
    napi_status status = napi_get_all_property_names(env,
                                                     nullptr,
                                                     napi_key_own_only,
                                                     napi_key_writable,
                                                     napi_key_keep_numbers,
                                                     &props);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value GetAllPropertyNamesResNull(napi_env env, napi_callback_info info)
{
    napi_value returnValue;
    NAPI_CALL(env, napi_create_object(env, &returnValue));
    napi_status status = napi_get_all_property_names(env,
                                                     returnValue,
                                                     napi_key_own_only,
                                                     napi_key_writable,
                                                     napi_key_keep_numbers,
                                                     nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value DetachEnvNull(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    NAPI_CALL(env, napi_create_int32(env, 0, &arrayBuffer));
    napi_status status = napi_detach_arraybuffer(nullptr, arrayBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value DetachArrNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_detach_arraybuffer(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

napi_value IsDetachedEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isArraybuffer;
    status = napi_is_arraybuffer(env, args[0], &isArraybuffer);
    bool isDetached;
    status = napi_is_detached_arraybuffer(nullptr, args[0], &isDetached);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

napi_value IsDetachedArrNull(napi_env env, napi_callback_info info)
{
    bool isDetached;
    napi_status status = napi_is_detached_arraybuffer(env, nullptr, &isDetached);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

napi_value IsDetachedResNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    napi_status status = napi_is_detached_arraybuffer(env, args[0], nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiSetInstanceDataEnvNull(napi_env env, napi_callback_info info)
{
    InstanceData* data = reinterpret_cast<InstanceData*>(malloc(sizeof(*data)));
    data->value = 1;
    data->print = true;
    data->jsCbRef = nullptr;
    napi_status status = napi_set_instance_data(nullptr, data, DeleteAddonData, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiGetInstanceDataDataNull(napi_env env, napi_callback_info info)
{
    InstanceData* data = reinterpret_cast<InstanceData*>(malloc(sizeof(*data)));
    data->value = 1;
    data->print = true;
    data->jsCbRef = nullptr;
    NAPI_CALL(env, napi_set_instance_data(env, data, DeleteAddonData, nullptr));
    napi_status status = napi_get_instance_data(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiEnvCleanUpHookEnvNull(napi_env env, napi_callback_info exports)
{
    static int argValue = 42;
    ObjectWrapper(env);
    napi_status status = napi_add_env_cleanup_hook(env, Cleanup, &argValue);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiEnvCleanUpHookFuncNull(napi_env env, napi_callback_info exports)
{
    // Create object wrap before cleanup hooks.
    g_cleanupHookCount = 0;
    static int argValueRemoved = 17;
    ObjectWrapper(env);
    napi_status status = napi_add_env_cleanup_hook(env, nullptr, &argValueRemoved);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiRemoveEnvCleanUpHookEnvNull(napi_env env, napi_callback_info exports)
{
    // Create object wrap before cleanup hooks.
    g_cleanupHookCount = 0;
    static int argValue = 42;
    static int argValueRemoved = 17;
    ObjectWrapper(env);

    napi_add_env_cleanup_hook(env, Cleanup, &argValueRemoved);
    napi_add_env_cleanup_hook(env, Cleanup, &argValue);
    napi_status status = napi_remove_env_cleanup_hook(nullptr, Cleanup, &argValueRemoved);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value NapiRemoveEnvCleanUpHookFuncNull(napi_env env, napi_callback_info exports)
{
    // Create object wrap before cleanup hooks.
    g_cleanupHookCount = 0;
    static int argValue = 42;
    static int argValueRemoved = 17;
    ObjectWrapper(env);

    napi_add_env_cleanup_hook(env, Cleanup, &argValueRemoved);
    napi_add_env_cleanup_hook(env, Cleanup, &argValue);
    napi_status status = napi_remove_env_cleanup_hook(env, nullptr, &argValueRemoved);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value GetModuleFileNameEnvNull(napi_env env, napi_callback_info info)
{
    const char *filename;
    napi_status status = node_api_get_module_file_name(nullptr, &filename);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value GetModuleFileNameResNull(napi_env env, napi_callback_info info)
{
    napi_status status = node_api_get_module_file_name(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAsyncResourceEnvNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    napi_value resource = args[0];
    napi_value resourceName;
    NAPI_CALL(env,
              napi_create_string_utf8(env, "test_async", NAPI_AUTO_LENGTH, &resourceName));
    napi_async_context context;
    NAPI_CALL(env, napi_async_init(env, resource, resourceName, &context));
    napi_status status = napi_add_finalizer(nullptr, resource, reinterpret_cast<void*>(context),
                                            AsyncDestroyCb, nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAsyncResourceObjNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    napi_value resourceName;
    napi_value resource = args[0];
    NAPI_CALL(env,
              napi_create_string_utf8(env, "test_async", NAPI_AUTO_LENGTH, &resourceName));
    napi_async_context context;
    NAPI_CALL(env, napi_async_init(env, resource, resourceName, &context));
    napi_status status = napi_add_finalizer(env, nullptr, reinterpret_cast<void*>(context), AsyncDestroyCb,
                                            nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createAsyncResourceCbNull(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    napi_value resource = args[0];
    napi_value resourceName;
    NAPI_CALL(env,
              napi_create_string_utf8(env, "test_async", NAPI_AUTO_LENGTH, &resourceName));
    napi_async_context context;
    NAPI_CALL(env, napi_async_init(env, resource, resourceName, &context));
    napi_status status = napi_add_finalizer(env, resource, reinterpret_cast<void*>(context),
                                            nullptr, nullptr, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value asyncWorkWithQosEnvNull(napi_env env, napi_callback_info info)
{
    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    napi_status status = napi_queue_async_work_with_qos(nullptr, addonData->asyncWork, napi_qos_default);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value asyncWorkWithQosWorkNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_queue_async_work_with_qos(env, nullptr, napi_qos_default);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiRunScriptPathEnvNull(napi_env env, napi_callback_info info)
{
    napi_value value;
    const char* path =  "pages/index.ets";
    napi_status status = napi_run_script_path(nullptr, path, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiRunScriptPathResNull(napi_env env, napi_callback_info info)
{
    const char* path =  "pages/index.ets";
    napi_status status = napi_run_script_path(env, path, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiLoadModuleEnvNull(napi_env env, napi_callback_info info)
{
    napi_value value;
    const char* path =  "@ohos.hilog";
    napi_status status = napi_load_module(nullptr, path, &value);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value napiLoadModuleResNull(napi_env env, napi_callback_info info)
{
    const char* path =  "@ohos.hilog";
    napi_status status = napi_load_module(env, path, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createObjectWithPropertiesEnvNull(napi_env env, napi_callback_info info)
{
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    napi_property_descriptor desc1[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    };
    napi_value obj1;
    napi_status status = napi_create_object_with_properties(nullptr, &obj1, 1, desc1);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createObjectWithPropertiesResNull(napi_env env, napi_callback_info info)
{
    napi_value obj1;
    napi_status status = napi_create_object_with_properties(env, &obj1, 1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createObjectWithPropertiesEnvResNull(napi_env env, napi_callback_info info)
{
    napi_value obj1;
    napi_status status = napi_create_object_with_properties(nullptr, &obj1, 1, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getDateValue(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_status status = napi_create_date(env, time, &createResult);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_date success");
    double getTime = false;
    napi_get_date_value(env, createResult, &getTime);
    bool result = false;
    if (time == getTime) {
        result = true;
    }
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, result, &value));
    return value;
}

static napi_value getDateValueNotDateObj(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    int time = 2147483647;
    napi_create_date(env, time, &createResult);
    double getTime = false;
    napi_status status = napi_get_date_value(env, createResult, &getTime);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getDateValueEnvNull(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_create_date(env, time, &createResult);
    double getTime = false;
    napi_status status = napi_get_date_value(nullptr, createResult, &getTime);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getDateValueNull(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_create_date(env, time, &createResult);
    double getTime = false;
    napi_status status = napi_get_date_value(env, nullptr, &getTime);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getDateValueRstNull(napi_env env, napi_callback_info info)
{
    napi_value createResult = nullptr;
    double time = 202110181203150;
    napi_create_date(env, time, &createResult);
    napi_status status = napi_get_date_value(env, createResult, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintInt64ValueNotJS(napi_env env, napi_callback_info info)
{
    uint64_t testValue = INT32_MAX;
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_uint64(env, testValue, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintUint64ValueNotJS(napi_env env, napi_callback_info info)
{
    uint64_t testValue = INT32_MAX;
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_uint64(env, testValue, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getValueBiginWordsNotBigInt(napi_env env, napi_callback_info info)
{
    uint64_t testValue = INT32_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
    bool flag = false;
    napi_status status = napi_get_value_bigint_uint64(env, result, nullptr, &flag);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferSizeZero(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = 0;
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBufferCopyLengthZero(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = 0;
    napi_value napiBuffer;
    void* dataPtr = nullptr;
    napi_status status = napi_create_buffer_copy(env, bufferSize, TEST_STR, &dataPtr, &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createExternalBufferLengthZero(napi_env env, napi_callback_info info)
{
    char* copyPtr = strdup(TEST_STR);
    napi_value napiBuffer;
    const unsigned int bufferSize = 0;
    napi_status status = napi_create_external_buffer(env,
                                                     bufferSize,
                                                     copyPtr,
                                                     DelTest,
                                                     nullptr,
                                                     &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createExternalBufferLengthMax(napi_env env, napi_callback_info info)
{
    char* copyPtr = strdup(TEST_STR);
    napi_value napiBuffer;
    const unsigned int bufferSize = 2097153;
    napi_status status = napi_create_external_buffer(env,
                                                     bufferSize,
                                                     copyPtr,
                                                     DelTest,
                                                     nullptr,
                                                     &napiBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value getBufferInfoValueNotBuffer(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    NAPI_CALL(env, napi_create_int32(env, 0, &arrayBuffer));
    char *bufferData;
    size_t bufferLength;
    napi_status status = napi_get_buffer_info(env, arrayBuffer, (void**)(&bufferData), &bufferLength);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value objectSealNotObj(napi_env env, napi_callback_info info)
{
    napi_value object;
    NAPI_CALL(env, napi_create_int32(env, 0, &object));
    napi_status status = napi_object_seal(env, object);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value objectFreezeNotObj(napi_env env, napi_callback_info info)
{
    napi_value object;
    NAPI_CALL(env, napi_create_int32(env, 0, &object));
    napi_status status = napi_object_freeze(env, object);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value detachArraybufferNotObj(napi_env env, napi_callback_info info)
{
    napi_value arrayBuffer;
    NAPI_CALL(env, napi_create_int32(env, 0, &arrayBuffer));
    napi_status status = napi_detach_arraybuffer(env, arrayBuffer);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isSendableEnvNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isSendable = false;
    napi_status status = napi_is_sendable(env, args[0], &isSendable);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isSendableValueNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isSendable = false;
    napi_status status = napi_is_sendable(env, args[0], &isSendable);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value isSendableRstNull(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    bool isSendable = false;
    napi_status status = napi_is_sendable(env, args[0], &isSendable);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deserializeEnvNull(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");
    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(nullptr, data, &result1);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deserializeDataNull(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    napi_value result1 = nullptr;
    napi_status status = napi_deserialize(env, nullptr, &result1);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deserializeRstNull(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    NAPI_ASSERT(env, data != nullptr, " The data is nullptr");
    napi_status status = napi_deserialize(env, data, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value serializeEnvNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    napi_set_named_property(env, object, "numKey", num);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_set_named_property(env, object, "objKey", obj);
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    void* data = nullptr;
    napi_status status = napi_serialize(nullptr, object, undefined, undefined, &data);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value serializeObjNull(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    void* data = nullptr;
    napi_status status = napi_serialize(env, nullptr, undefined, undefined, &data);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value serializeDataNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value num = nullptr;
    uint32_t value = 2000;
    napi_create_uint32(env, value, &num);
    napi_set_named_property(env, object, "numKey", num);
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_set_named_property(env, object, "objKey", obj);
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_status status = napi_serialize(env, object, undefined, undefined, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createObjectWithNamePropertiesEnvNull(napi_env env, napi_callback_info info)
{
    napi_value excep;
    NAPI_CALL(env, napi_get_and_clear_last_exception(env, &excep));
    napi_value val_false;
    napi_value val_true;
    NAPI_CALL(env, napi_get_boolean(env, false, &val_false));
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    const char *keys1[] = {
        "x",
    };
    const napi_value values1[] = {
        val_true,
    };
    napi_value obj1;
    napi_status status = napi_create_object_with_named_properties(nullptr, &obj1, 1, keys1, values1);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNativeBindingObjectEnvNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value hint = nullptr;
    napi_create_object(env, &hint);
    napi_status status = napi_coerce_to_native_binding_object(nullptr, object,
        TestDetachCallback, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNativeBindingObjectObjNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value hint = nullptr;
    napi_create_object(env, &hint);
    napi_status status = napi_coerce_to_native_binding_object(env, nullptr,
        TestDetachCallback, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNativeBindingObjectDetachNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value hint = nullptr;
    napi_create_object(env, &hint);
    napi_status status = napi_coerce_to_native_binding_object(env, object,
        nullptr, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNativeBindingObjectAttachNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value hint = nullptr;
    napi_create_object(env, &hint);
    napi_status status = napi_coerce_to_native_binding_object(env, object,
        TestDetachCallback, nullptr, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value coerceToNativeBindingObjectNativeNull(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value hint = nullptr;
    napi_create_object(env, &hint);
    napi_status status = napi_coerce_to_native_binding_object(env, object,
        TestDetachCallback, TestAttachCallback, nullptr, reinterpret_cast<void*>(hint));
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deleteAsyncWork(napi_env env, napi_callback_info info)
{
    napi_async_work work = nullptr;
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "AsyncWorkTest", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, [](napi_env value, void* data) {},
                           [](napi_env env, napi_status status, void* data) {}, nullptr, &work);
    napi_delete_async_work(env, work);
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 0, &value));
    
    return value;
}

static napi_value deleteSerializationEnvNull(napi_env env, napi_callback_info info)
{
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value num = nullptr;
    uint32_t value = 1;
    napi_create_uint32(env, value, &num);
    void* data = nullptr;
    napi_serialize(env, num, undefined, undefined, &data);
    napi_status status = napi_delete_serialization_data(nullptr, data);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value deleteSerializationDataNull(napi_env env, napi_callback_info info)
{
    napi_status status = napi_delete_serialization_data(env, nullptr);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createBigintWordsCountIntMax(napi_env env, napi_callback_info info)
{
    int signBit = 0;
    int wordCount = 2147483647;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_words(env, signBit, wordCount, words, &result);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value makeCallbackTextNull(napi_env env, napi_callback_info info)
{
    size_t argc = 10;
    size_t n;
    napi_value args[10];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
    NAPI_ASSERT(env, argc > 0, "Wrong number of arguments");
    napi_value async_context_wrap = args[0];
    napi_value recv = args[1];
    napi_value func = args[2];
    napi_value argv[7];
    for (n = 3; n < argc; n += 1) {
        argv[n - 3] = args[n];
    }
    napi_valuetype func_type;
    NAPI_CALL(env, napi_typeof(env, func, &func_type));
    napi_async_context context;
    NAPI_CALL(env, napi_unwrap(env, async_context_wrap, (void **)&context));
    napi_value result;
    if (func_type == napi_function) {
        NAPI_CALL(env,
                  napi_make_callback(env, nullptr, recv, func, argc - 3, argv, &result)); // 3 : reserved arguments.
    } else {
        NAPI_ASSERT(env, false, "Unexpected argument type");
    }
    return result;
}

static napi_value getValueBigintUint64(napi_env env, napi_callback_info info)
{
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_uint64(env, testValue, &result);
    uint64_t resultValue = 0;
    bool flag = false;
    napi_get_value_bigint_uint64(env, result, &resultValue, &flag);
    NAPI_ASSERT(env, resultValue == testValue, "napi_get_value_bigint_int64 failed");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, flag, &value));
    return value;
}

static napi_value getValueBigintInt64(napi_env env, napi_callback_info info)
{
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;
    napi_create_bigint_int64(env, testValue, &result);
    int64_t resultValue = 0;
    bool flag = false;
    napi_get_value_bigint_int64(env, result, &resultValue, &flag);
    NAPI_ASSERT(env, resultValue == testValue, "napi_get_value_bigint_int64 failed");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, flag, &value));
    return value;
}

static napi_value NapiGetInstanceDataEnvNull(napi_env env, napi_callback_info info)
{
    InstanceData* data = reinterpret_cast<InstanceData*>(malloc(sizeof(*data)));
    data->value = 1;
    data->print = true;
    data->jsCbRef = nullptr;
    NAPI_CALL(env, napi_set_instance_data(env, data, DeleteAddonData, nullptr));
    InstanceData* getData = nullptr;
    napi_status status = napi_get_instance_data(nullptr, reinterpret_cast<void**>(&getData));
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value createThreadsafeFunctionMaxQueueSizeNegative(napi_env env, napi_callback_info info)
{
    napi_threadsafe_function tsFunc = nullptr;
    napi_value resourceName = 0;
    napi_create_string_latin1(env, __func__, NAPI_AUTO_LENGTH, &resourceName);
    int32_t  callJstCbDataTestId = 101;
    int32_t  finalCbtDataTestID = 1001;
    napi_status status = napi_create_threadsafe_function(env, nullptr, nullptr, resourceName,
                                                         -1, 1, &callJstCbDataTestId, nullptr,
                                                         &finalCbtDataTestID, nullptr, &tsFunc);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value ThreadSafeTestNull(napi_env env, napi_callback_info info)
{
    void* retContext = nullptr;
    napi_status status = napi_get_threadsafe_function_context(nullptr, &retContext);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

static napi_value hasOwnPropertyCheckpro(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    NAPI_CALL(env, napi_create_object(env, &object));
    
    napi_value name = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "name", NAPI_AUTO_LENGTH, &name));
    
    napi_value value = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "Hello from Node-API", NAPI_AUTO_LENGTH, &value));
    NAPI_CALL(env, napi_set_property(env, object, name, value));
    
    bool hasPro = false;
    NAPI_CALL(env, napi_has_own_property(env, object, name, &hasPro));
    
    napi_value result;
    napi_get_boolean(env, hasPro, &result);
    return result;
}

static napi_value hasOwnPropertyCheckOwnpro(napi_env env, napi_callback_info info)
{
    napi_value object = nullptr;
    NAPI_CALL(env, napi_create_object(env, &object));
    
    napi_value name = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "name", NAPI_AUTO_LENGTH, &name));
    
    napi_value value = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "Hello from Node-API", NAPI_AUTO_LENGTH, &value));
    NAPI_CALL(env, napi_set_property(env, object, name, value));
    
    napi_value key = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "toString", NAPI_AUTO_LENGTH, &key));

    bool hasPro = false;
    NAPI_CALL(env, napi_has_own_property(env, object, key, &hasPro));

    napi_value result;
    napi_get_boolean(env, hasPro, &result);
    return result;
}

static napi_value createTypeErrorRes(napi_env env, napi_callback_info info)
{
    napi_value errorCode = nullptr;
    napi_create_string_utf8(env, "typeErrorCode", NAPI_AUTO_LENGTH, &errorCode);
    napi_value errorMessage = nullptr;
    napi_create_string_utf8(env, "typeErrorMsg", NAPI_AUTO_LENGTH, &errorMessage);
    
    napi_value error = nullptr;
    napi_create_type_error(env, errorCode, errorMessage, &error);
    return error;
}

static napi_value createRangeErrorRes(napi_env env, napi_callback_info info)
{
    napi_value errorCode = nullptr;
    napi_create_string_utf8(env, "typeErrorCode", NAPI_AUTO_LENGTH, &errorCode);
    napi_value errorMessage = nullptr;
    napi_create_string_utf8(env, "typeErrorMsg", NAPI_AUTO_LENGTH, &errorMessage);
    
    napi_value error = nullptr;
    napi_create_range_error(env, errorCode, errorMessage, &error);
    return error;
}
//napi_module_register   void
static napi_value NapiModuleRegisterTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    napi_module_register(nullptr);
    NAPI_ASSERT(env, true, "Registration failed.");

    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_get_last_error_info
static napi_value NapiGetLastErrorInfoTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    const napi_extended_error_info *errorInfo;
    // undefined is not supported
    // env is null
    status = napi_get_last_error_info(nullptr, &errorInfo);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_last_error_info failed.");
    // **errorInfo is null
    status = napi_get_last_error_info(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "**errorInfo is null, napi_get_last_error_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    // all is null
    status = napi_get_last_error_info(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "**errorInfo is null, napi_get_last_error_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_throw
static napi_value NapiThrowTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value errorCode = nullptr;
    napi_create_string_utf8(env, "throw errorCode", NAPI_AUTO_LENGTH, &errorCode);
    napi_value errorMessage = nullptr;
    napi_create_string_utf8(env, "throw errorMessage", NAPI_AUTO_LENGTH, &errorMessage);
    napi_value error = nullptr;
    napi_create_error(env, errorCode, errorMessage, &error);
    // undefined is not supported
    // env is null
    status = napi_throw(nullptr, error);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_throw failed.");
    // error is null
    status = napi_throw(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "error is null, napi_throw failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    // all is null
    status = napi_throw(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "error is null, napi_throw failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_throw_error
static napi_value NapiThrowErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    char* strErrorCode = "throw errorCode";
    char* strErrorMsg = "throw errorMessage";
    napi_value clearRst = nullptr;
    // undefined is not supported
    // env is null
    status = napi_throw_error(nullptr, strErrorCode, strErrorMsg);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_throw_error failed.");
    // strErrorCode is null
    status = napi_throw_error(env, nullptr, strErrorMsg);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_ok, "strErrorCode is null, napi_throw_error OK.");
    // strErrorMsg is null
    status = napi_throw_error(env, strErrorCode, nullptr);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "strErrorMsg is null, napi_throw_error failed.");
    // all is null
    status = napi_throw_error(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_throw_error failed.");

    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_throw_type_error
static napi_value NapiThrowTypeErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    char* strErrorCode = "throw errorCode";
    char* strErrorMsg = "throw errorMessage";
    napi_value clearRst = nullptr;
    // undefined is not supported
    // env is null
    status = napi_throw_type_error(nullptr, strErrorCode, strErrorMsg);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_throw_type_error failed.");
    // strErrorCode is null
    status = napi_throw_type_error(env, nullptr, strErrorMsg);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_ok, "strErrorCode is null, napi_throw_type_error OK.");
    // strErrorMsg is null
    status = napi_throw_type_error(env, strErrorCode, nullptr);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "strErrorMsg is null, napi_throw_type_error failed.");
    // all is null
    status = napi_throw_type_error(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_throw_type_error failed.");

    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_throw_range_error
static napi_value NapiThrowRangeErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    char* strErrorCode = "throw errorCode";
    char* strErrorMsg = "throw errorMessage";
    napi_value clearRst = nullptr;
    // undefined is not supported
    // env is null
    status = napi_throw_range_error(nullptr, strErrorCode, strErrorMsg);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_throw_range_error failed.");
    // strErrorCode is null
    status = napi_throw_range_error(env, nullptr, strErrorMsg);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_ok, "strErrorCode is null, napi_throw_range_error OK.");
    // strErrorMsg is null
    status = napi_throw_range_error(env, strErrorCode, nullptr);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "strErrorMsg is null, napi_throw_range_error failed.");
    // all is null
    status = napi_throw_range_error(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_throw_range_error failed.");

    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_is_error
static napi_value NapiIsErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value value = nullptr;
    bool bRst = false;
    // undefined is not supported
    // env is null
    status = napi_is_error(nullptr, value, &bRst);
    NAPI_ASSERT(env, (status == napi_invalid_arg) && !bRst, "env is null, napi_is_error failed.");
    // value is null
    status = napi_is_error(env, nullptr, &bRst);
    NAPI_ASSERT(env, (status == napi_invalid_arg) && !bRst, "value is null, napi_is_error failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    // *bRst is null
    status = napi_is_error(env, value, nullptr);
    NAPI_ASSERT(env, (status == napi_invalid_arg) && !bRst, "bRst is null, napi_is_error failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    // all is null
    status = napi_is_error(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_error failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_create_error
static napi_value NapiCreateErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value clearRst = nullptr;
    napi_value errorCode = nullptr;
    napi_create_string_utf8(env, "throw errorCode", NAPI_AUTO_LENGTH, &errorCode);
    napi_value errorMessage = nullptr;
    napi_create_string_utf8(env, "throw errorMessage", NAPI_AUTO_LENGTH, &errorMessage);
    napi_value error = nullptr;
    // undefined is not supported
    // env is null
    status = napi_create_error(nullptr, errorCode, errorMessage, &error);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_error failed.");
    // errorCode is null
    status = napi_create_error(env, nullptr, errorMessage, &error);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_ok, "errorCode is null, napi_create_error ok.");
    // errorMessage is null
    status = napi_create_error(env, errorCode, nullptr, &error);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "errorMessage is null, napi_create_error failed.");
    // *error is null
    status = napi_create_error(env, errorCode, errorMessage, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*error is null, napi_create_error failed.");
    // all is null
    status = napi_create_error(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_error failed.");

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_create_type_error
static napi_value NapiCreateTypeErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value clearRst = nullptr;
    napi_value errorCode = nullptr;
    napi_create_string_utf8(env, "throw errorCode", NAPI_AUTO_LENGTH, &errorCode);
    napi_value errorMessage = nullptr;
    napi_create_string_utf8(env, "throw errorMessage", NAPI_AUTO_LENGTH, &errorMessage);
    napi_value error = nullptr;
    // undefined is not supported
    // env is null
    status = napi_create_type_error(nullptr, errorCode, errorMessage, &error);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_type_error failed.");
    // errorCode is null
    status = napi_create_type_error(env, nullptr, errorMessage, &error);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_ok, "errorCode is null, napi_create_type_error ok.");
    // errorMessage is null
    status = napi_create_type_error(env, errorCode, nullptr, &error);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "errorMessage is null, napi_create_type_error failed.");
    // *error is null
    status = napi_create_type_error(env, errorCode, errorMessage, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*error is null, napi_create_type_error failed.");
    // all is null
    status = napi_create_type_error(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_type_error failed.");

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_create_range_error
static napi_value NapiCreateRangeErrorTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value clearRst = nullptr;
    napi_value errorCode = nullptr;
    napi_create_string_utf8(env, "throw errorCode", NAPI_AUTO_LENGTH, &errorCode);
    napi_value errorMessage = nullptr;
    napi_create_string_utf8(env, "throw errorMessage", NAPI_AUTO_LENGTH, &errorMessage);
    napi_value error = nullptr;
    // undefined is not supported
    // env is null
    status = napi_create_range_error(nullptr, errorCode, errorMessage, &error);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_range_error failed.");
    // errorCode is null
    status = napi_create_range_error(env, nullptr, errorMessage, &error);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_ok, "errorCode is null, napi_create_range_error ok.");
    // errorMessage is null
    status = napi_create_range_error(env, errorCode, nullptr, &error);
    napi_get_and_clear_last_exception(env, &clearRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "errorMessage is null, napi_create_range_error failed.");
    // *error is null
    status = napi_create_range_error(env, errorCode, errorMessage, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*error is null, napi_create_range_error failed.");
    // all is null
    status = napi_create_range_error(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_range_error failed.");
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_get_and_clear_last_exception
static napi_value NapiGetAndClearLastExceptionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value rst = nullptr;
    // undefined is not supported
    // env is null
    status = napi_get_and_clear_last_exception(nullptr, &rst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_and_clear_last_exception failed.");
    // result is null
     status = napi_get_and_clear_last_exception(env, nullptr);
     NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_and_clear_last_exception failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
     // all is null
     status = napi_get_and_clear_last_exception(nullptr, nullptr);
     NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_and_clear_last_exception failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_is_exception_pending
static napi_value NapiIsExceptionPendingTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    bool isExceptionPending = false;
    // undefined is not supported
    // env is null
    status = napi_is_exception_pending(nullptr, &isExceptionPending);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_exception_pending failed.");
    // result is null
    status = napi_is_exception_pending(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_exception_pending failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    // all is null
    status = napi_is_exception_pending(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_exception_pending failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_open_handle_scope
static napi_value NapiOpenHandleScopeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    // undefined is not supported
    // env is null
    napi_handle_scope scope;
    status = napi_open_handle_scope(nullptr, &scope);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_open_handle_scope failed.");
    //*scope is null
    status = napi_open_handle_scope(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*scope is null, napi_open_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_open_handle_scope(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_open_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_close_handle_scope
static napi_value NapiCloseHandleScopeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_handle_scope scope;
    status = napi_open_handle_scope(env, &scope);
    // undefined is not supported
    // env is null
    status = napi_close_handle_scope(nullptr, scope);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_close_handle_scope failed.");
    //*scope is null
    status = napi_close_handle_scope(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "scope is null, napi_close_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_close_handle_scope(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_close_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_open_escapable_handle_scope
static napi_value NapiOpenEscapableHandleScopeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_escapable_handle_scope scope;
    // undefined is not supported
    // env is null
    status = napi_open_escapable_handle_scope(nullptr, &scope);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_open_escapable_handle_scope failed.");
    //*scope is null
    status = napi_open_escapable_handle_scope(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "scope is null, napi_open_escapable_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_open_escapable_handle_scope(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_open_escapable_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_close_escapable_handle_scope
static napi_value NapiCloseEscapableHandleScopeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_escapable_handle_scope scope;
    status = napi_open_escapable_handle_scope(env, &scope);
    // undefined is not supported
    // env is null
    status = napi_close_escapable_handle_scope(nullptr, scope);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_open_escapable_handle_scope failed.");
    //*scope is null
    status = napi_close_escapable_handle_scope(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "scope is null, napi_open_escapable_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_close_escapable_handle_scope(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_open_escapable_handle_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_escape_handle
static napi_value NapiEscapeHandleTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_escapable_handle_scope scope;
    napi_open_escapable_handle_scope(env, &scope);

    napi_value obj = nullptr;
    napi_create_object(env, &obj);

    napi_value value = nullptr;
    napi_create_string_utf8(env, "Test napi_escapable_handle_scope", NAPI_AUTO_LENGTH, &value);
    napi_set_named_property(env, obj, "key", value);

    napi_value escapedObj = nullptr;
    //escapee is undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_escape_handle(env, scope, undefined, &escapedObj);
    NAPI_ASSERT(env, status == napi_ok, "escapee is undefined, napi_escape_handle ok.");
    //*result is undefined
    status = napi_escape_handle(env, scope, obj, &undefined);
    NAPI_ASSERT(env, status != napi_ok, "*result is undefined, napi_escape_handle ok.");

    // env is null
    status = napi_escape_handle(nullptr, scope, obj, &escapedObj);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_escape_handle failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //scope is null
    status = napi_escape_handle(env, nullptr, obj, &escapedObj);
    NAPI_ASSERT(env, status == napi_invalid_arg, "scope is null, napi_escape_handle failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //scope is null
    status = napi_escape_handle(env, scope, nullptr, &escapedObj);
    NAPI_ASSERT(env, status == napi_invalid_arg, "escapee is null, napi_escape_handle failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_escape_handle(env, scope, obj, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_escape_handle failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_escape_handle(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_escape_handle failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //close
    napi_close_escapable_handle_scope(env, scope);

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_create_reference
static napi_value NapiCreateReferenceTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value value = nullptr;
    napi_ref ref = nullptr;
    napi_create_string_utf8(env, "CreateReference", NAPI_AUTO_LENGTH, &value);
    napi_set_named_property(env, obj, "key", value);

    //value is undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_create_reference(env, undefined, 1, &ref);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_create_reference ok.");

    //env is null
    status = napi_create_reference(nullptr, obj, 1, &ref);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_reference failed.");
    //value is null
    status = napi_create_reference(env, nullptr, 1, &ref);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_create_reference failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //initial_refcount is not null
    //*result is null
    status = napi_create_reference(env, obj, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_reference failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_reference(nullptr, nullptr, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_reference failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_delete_reference
static napi_value NapiDeleteReferenceTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value value = nullptr;
    napi_ref ref = nullptr;
    napi_create_string_utf8(env, "CreateReference", NAPI_AUTO_LENGTH, &value);
    napi_set_named_property(env, obj, "key", value);
    status = napi_create_reference(env, obj, 1, &ref);

    //value is not undefined
    //env is null
    status = napi_delete_reference(nullptr, ref);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_delete_reference failed.");
    //ref is null
    status = napi_delete_reference(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "ref is null, napi_delete_reference failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_delete_reference(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_delete_reference failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    bool bRet = true;
    napi_value result;
    napi_get_boolean(env, bRet, &result);
    return result;
}
//napi_reference_ref
void Finalizer(napi_env env, void *data, void *hint)
{
}
static napi_value NapiReferenceRefTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_ref ref = nullptr;
    napi_create_object(env, &obj);
    napi_value value = nullptr;
    napi_create_string_utf8(env, "CreateReference", NAPI_AUTO_LENGTH, &value);
    napi_set_named_property(env, obj, "key", value);
    status = napi_create_reference(env, obj, 1, &ref);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_create_reference fail");
        return nullptr;
    }
    void *data = {};
    napi_add_finalizer(env, obj, data, Finalizer, nullptr, &ref);
    uint32_t result = 0;

    //value is not undefined
    //env is null
    status = napi_reference_ref(nullptr, ref, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_reference_ref failed.");
    //ref is null
    status = napi_reference_ref(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "ref is null, napi_reference_ref failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_reference_ref(env, ref, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "*result is null, napi_reference_ref ok.");
    //all is null
    status = napi_reference_ref(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_reference_ref failed.");

    bool bRet = true;
    napi_value rst;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_reference_unref
static napi_value NapiReferenceUnrefTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_ref ref = nullptr;
    napi_create_object(env, &obj);
    napi_value value = nullptr;
    napi_create_string_utf8(env, "CreateReference", NAPI_AUTO_LENGTH, &value);
    napi_set_named_property(env, obj, "key", value);

    status = napi_create_reference(env, obj, 1, &ref);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_create_reference fail");
        return nullptr;
    }
    void *data = {};
    napi_add_finalizer(env, obj, data, Finalizer, nullptr, &ref);
    uint32_t result = 0;

    //value is not undefined
    //env is null
    status = napi_reference_unref(nullptr, ref, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_reference_unref failed.");
    //ref is null
    status = napi_reference_unref(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "ref is null, napi_reference_unref failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_reference_unref(env, ref, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "*result is null, napi_reference_unref ok.");
    //all is null
    status = napi_reference_unref(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_reference_unref failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_reference_value
static napi_value NapiGetReferenceValueTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_ref ref = nullptr;
    napi_create_object(env, &obj);
    napi_value value = nullptr;
    napi_create_string_utf8(env, "CreateReference", NAPI_AUTO_LENGTH, &value);

    napi_set_named_property(env, obj, "key", value);
    status = napi_create_reference(env, obj, 1, &ref);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_create_reference fail");
        return nullptr;
    }
    //result is undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_get_reference_value(env, ref, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_reference ok.");

    //env is null
    napi_value objRst = nullptr;
    status = napi_get_reference_value(nullptr, ref, &objRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_reference_value failed.");
    //ref is null
    status = napi_get_reference_value(env, nullptr, &objRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "ref is null, napi_get_reference_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_get_reference_value(env, ref, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_get_reference_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_reference_value(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_reference_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_array
static napi_value NapiCreateArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_create_array(env, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_array ok.");

    napi_value jsArray = nullptr;
    //env is null
    status = napi_create_array(nullptr, &jsArray);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_array failed.");
    //*result is null
    status = napi_create_array(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_array(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_array_with_length
static napi_value NapiCreateArrayWithLengthTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 0;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_create_array_with_length(env, length, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_array_with_length ok.");

    napi_value jsArray = nullptr;
    //env is null
    status = napi_create_array_with_length(nullptr, length, &jsArray);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_array_with_length failed.");
    //*result is null
    status = napi_create_array_with_length(env, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_array_with_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_array_with_length(nullptr, 0, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_array_with_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_arraybuffer
static napi_value NapiCreateArrayBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 0;
    void *data = nullptr;
    napi_value result = nullptr;
    napi_create_arraybuffer(env, length, &data, &result);
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_create_arraybuffer(env, length, &data, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_arraybuffer ok.");

    //env is null
    status = napi_create_arraybuffer(nullptr, length, &data, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_arraybuffer failed.");
    //*data is null
    status = napi_create_arraybuffer(env, length, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*data is null, napi_create_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_create_arraybuffer(env, length, &data, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_arraybuffer(nullptr, 0, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_external
void finalizeCallback(napi_env env, void *data, void *hint)
{

    free(data);
}

//napi_create_external_arraybuffer
typedef struct {
    uint8_t *data;
    size_t length;
} BufferData;
void FinalizeCallBackBuffer(napi_env env, void *finalizeData, void *finalizeHint)
{
    BufferData *bufferData = static_cast<BufferData *>(finalizeData);
    delete[] bufferData->data;
    delete bufferData;
}

//napi_create_object
static napi_value NapiCreateObjectTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value object = nullptr;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    status = napi_create_object(env, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_object ok.");

    //env is null
    status = napi_create_object(nullptr, &object);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_object failed.");
    //*result is null
    status = napi_create_object(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_object(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_symbol
static napi_value NapiCreateSymbolTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value result = nullptr;
    const char *des = "only";
    napi_create_string_utf8(env, des, NAPI_AUTO_LENGTH, &result);
    napi_value returnSymbol = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //description is undefined
    status = napi_create_symbol(env, undefined, &returnSymbol);
    NAPI_ASSERT(env, status == napi_invalid_arg, "description is undefined, napi_create_symbol failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is undefined
    status = napi_create_symbol(env, result, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_symbol ok.");

    //env is null
    status = napi_create_symbol(nullptr, result, &returnSymbol);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_symbol failed.");
    //description is null
    status = napi_create_symbol(env, nullptr, &returnSymbol);
    NAPI_ASSERT(env, status == napi_ok, "description is null, napi_create_symbol ok.");
    //*result is null
    status = napi_create_symbol(env, result, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_symbol failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_symbol(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_symbol failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_typedarray
static napi_value NapiCreateTypedArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_typedarray_type arrayType = napi_int8_array;
    size_t elementSize = sizeof(int8_t);
    size_t length = 3;
    napi_value arrayBuffer = nullptr;
    napi_value typedArray = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //arraybuffer is undefined
    status = napi_create_typedarray(env, arrayType, length, undefined, 0, &typedArray);
    NAPI_ASSERT(env, status != napi_ok, "arraybuffer is undefined, napi_create_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //*result is undefined
    status = napi_create_typedarray(env, arrayType, length, arrayBuffer, 0, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "*result is undefined, napi_create_typedarray ok.");

    //env is null
    status = napi_create_typedarray(nullptr, arrayType, length, arrayBuffer, 0, &typedArray);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_typedarray failed.");
    //arrayBuffer is null
    status = napi_create_typedarray(env, arrayType, length, nullptr, 0, &typedArray);
    NAPI_ASSERT(env, status == napi_invalid_arg, "arrayBuffer is null, napi_create_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_create_typedarray(env, arrayType, length, arrayBuffer, 0, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_typedarray(nullptr, arrayType, length, nullptr, 0, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_dataview
static napi_value NapiCreateDateViewTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_typedarray_type arrayType = napi_int8_array;
    size_t elementSize = sizeof(int8_t);
    size_t length = 3;
    size_t byteLength = 12;
    size_t byteOffset = 4;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //arraybuffer is undefined
    status = napi_create_dataview(env, byteLength, undefined, byteOffset, &result);
    NAPI_ASSERT(env, status != napi_ok, "arraybuffer is undefined, napi_create_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //env is null
    status = napi_create_dataview(nullptr, byteLength, arrayBuffer, byteOffset, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //arrayBuffer is null
    status = napi_create_dataview(nullptr, byteLength, nullptr, byteOffset, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "arrayBuffer is null, napi_create_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_create_dataview(nullptr, byteLength, arrayBuffer, byteOffset, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_dataview(nullptr, byteLength, nullptr, byteOffset, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_int32
static napi_value NapiCreateInt32Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    int32_t intValue = 0;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_int32(env, intValue, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_int32 ok.");

    //env is null
    status = napi_create_int32(nullptr, intValue, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_int32 failed.");
    //*result is null
    status = napi_create_int32(env, intValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_int32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_int32(nullptr, intValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_uint32
static napi_value NapiCreateUint32Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    uint32_t uintValue = 0;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_uint32(env, uintValue, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_uint32 ok.");

    //env is null
    status = napi_create_uint32(nullptr, uintValue, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_uint32 failed.");
    //*result is null
    status = napi_create_uint32(env, uintValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_uint32(nullptr, uintValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_int64
static napi_value NapiCreateInt64Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    int64_t intValue = 0;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_int64(env, intValue, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_int64 ok.");

    //env is null
    status = napi_create_int64(nullptr, intValue, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_int64 failed.");
    //*result is null
    status = napi_create_int64(env, intValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_int64(nullptr, intValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_double
static napi_value NapiCreateDoubleTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    double value = 0;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_double(env, value, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_double ok.");

    //env is null
    status = napi_create_double(nullptr, value, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_double failed.");
    //*result is null
    status = napi_create_double(env, value, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_double(nullptr, value, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_string_latin1
static napi_value NapiCreateStringLatin1Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 0;
    napi_value result = nullptr;
    const char* str = "null";
    napi_create_string_latin1(env, str, length, &result);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_string_latin1(env, str, length, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_string_latin1 ok.");

    //env is null
    status = napi_create_string_latin1(nullptr, str, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_string_latin1 failed.");
    //str is null
    status = napi_create_string_latin1(env, nullptr, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "str is null, napi_create_string_latin1 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_create_string_latin1(env, str, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_string_latin1 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_string_latin1(nullptr, nullptr, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_string_latin1 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_string_utf8
static napi_value NapiCreateStringUtf8Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 0;
    napi_value result = nullptr;
    const char* str = "null";
    napi_create_string_utf8(env, str, length, &result);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_string_utf8(env, str, length, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_string_utf8 ok.");

    //env is null
    status = napi_create_string_utf8(nullptr, str, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_string_utf8 failed.");
    //str is null
    status = napi_create_string_utf8(env, nullptr, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "str is null, napi_create_string_utf8 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_create_string_utf8(env, str, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_string_utf8 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_string_utf8(nullptr, nullptr, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_string_utf8 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_create_string_utf16
static napi_value NapiCreateStringUtf16Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 0;
    napi_value result = nullptr;
    const char16_t str[] = u"napi_generic_failure";

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_string_utf16(env, str, length, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_string_utf16 ok.");

    //env is null
    status = napi_create_string_utf16(nullptr, str, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_string_utf16 failed.");
    //str is null
    status = napi_create_string_utf16(env, nullptr, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "str is null, napi_create_string_utf16 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //*result is null
    status = napi_create_string_utf16(env, str, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_string_utf16 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_create_string_utf16(nullptr, nullptr, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_string_utf16 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_array_length
static napi_value NapiGetArrayLengthTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value jsArray = nullptr;
    napi_create_array(env, &jsArray);
    for (int i = 0; i < 5; i++) {
        napi_value element;
        napi_create_int32(env, i, &element);
        napi_set_element(env, jsArray, i, element);
    }
    uint32_t length = 0;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_array_length(env, undefined, &length);
    NAPI_ASSERT(env, status != napi_ok, "result is undefined, napi_get_array_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_array_length(nullptr, jsArray, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_array_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_array_length(env, nullptr, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_array_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_array_length(env, jsArray, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_get_array_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_array_length(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_array_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_arraybuffer_info
static napi_value NapiGetArrayBufferInfoTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 5;
    napi_value result = nullptr;
    void *data;
    size_t byteLength = 0;
    napi_create_arraybuffer(env, length, &data, &result);
    napi_get_arraybuffer_info(env, result, &data, &byteLength);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //arraybuffer is undefined
    status = napi_get_arraybuffer_info(env, undefined, &data, &byteLength);
    NAPI_ASSERT(env, status != napi_ok, "arraybuffer is undefined, napi_get_arraybuffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //env is null
    status = napi_get_arraybuffer_info(nullptr, result, &data, &byteLength);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_arraybuffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //arraybuffer is null
    status = napi_get_arraybuffer_info(env, nullptr, &data, &byteLength);
    NAPI_ASSERT(env, status == napi_invalid_arg, "arraybuffer is null, napi_get_arraybuffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //data is null
    status = napi_get_arraybuffer_info(env, result, nullptr, &byteLength);
    NAPI_ASSERT(env, status == napi_ok, "data is null, napi_get_arraybuffer_info ok.");
    //byte_length is null
    status = napi_get_arraybuffer_info(env, result, &data, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "byte_length is null, napi_get_arraybuffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_arraybuffer_info(env, result, &data, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_arraybuffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_prototype
static napi_value NapiGetPrototypeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value name = nullptr;
    napi_create_string_utf8(env, "name", NAPI_AUTO_LENGTH, &name);
    napi_value value = nullptr;
    napi_create_string_utf8(env, "Hello from Node-API!", NAPI_AUTO_LENGTH, &value);
    napi_set_property(env, object, name, value);
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_get_prototype(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_get_prototype failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //result is undefined
    status = napi_get_prototype(env, object, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_get_prototype ok.");

    //env is null
    status = napi_get_prototype(nullptr, object, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_prototype failed.");
    //object is null
    status = napi_get_prototype(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_get_prototype failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_prototype(env, object, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_prototype failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_prototype(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_prototype failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_typedarray_info
static napi_value NapiGetTypedArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 3;
    napi_value arrayBuffer = nullptr;
    napi_value typedArray = nullptr;
    void *data;
    napi_typedarray_type arrayType = napi_int8_array;
    size_t elementSize = sizeof(int8_t);
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
    napi_create_typedarray(env, arrayType, length, arrayBuffer, 0, &typedArray);
    napi_typedarray_type type;
    size_t byteOffset, lengthRst;
    napi_value arrayBufferRst;
    void *dataRst;
    napi_get_typedarray_info(env, typedArray, &type, &lengthRst, &dataRst, &arrayBufferRst, &byteOffset);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //typedarray is undefined
    status = napi_get_typedarray_info(env, undefined, &type, &lengthRst, &data, &arrayBufferRst, &byteOffset);
    NAPI_ASSERT(env, status == napi_invalid_arg, "typedarray is undefined, napi_get_typedarray_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //arraybuffer is undefined
    status = napi_get_typedarray_info(env, typedArray, &type, &lengthRst, &data, &undefined, &byteOffset);
    NAPI_ASSERT(env, status == napi_ok, "arraybuffer is undefined, napi_get_typedarray_info ok.");

    //env is null
    status = napi_get_typedarray_info(nullptr, typedArray, &type, &lengthRst, &dataRst, &arrayBufferRst, &byteOffset);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_typedarray_info failed.");
    //typedarray is null
    status = napi_get_typedarray_info(env, nullptr, &type, &lengthRst, &dataRst, &arrayBufferRst, &byteOffset);
    NAPI_ASSERT(env, status == napi_invalid_arg, "typedarray is null, napi_get_typedarray_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //type is null
    status = napi_get_typedarray_info(env, typedArray, nullptr, &lengthRst, &dataRst, &arrayBufferRst, &byteOffset);
    NAPI_ASSERT(env, status == napi_ok, "type is null, napi_get_typedarray_info ok.");
    //length is null
    status = napi_get_typedarray_info(env, typedArray, &type, nullptr, &dataRst, &arrayBufferRst, &byteOffset);
    NAPI_ASSERT(env, status == napi_ok, "length is null, napi_get_typedarray_info ok.");
    //data is null
    status = napi_get_typedarray_info(env, typedArray, &type, &lengthRst, nullptr, &arrayBufferRst, &byteOffset);
    NAPI_ASSERT(env, status == napi_ok, "data is null, napi_get_typedarray_info ok.");
    //arraybuffer is null
    status = napi_get_typedarray_info(env, typedArray, &type, &lengthRst, &dataRst, nullptr, &byteOffset);
    NAPI_ASSERT(env, status == napi_ok, "arraybuffer is null, napi_get_typedarray_info ok.");
    //byte_offset is null
    status = napi_get_typedarray_info(env, typedArray, &type, &lengthRst, &dataRst, &arrayBufferRst, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "arraybuffer is null, napi_get_typedarray_info ok.");
    //all is null
    status = napi_get_typedarray_info(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_typedarray_info failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_dataview_info
static napi_value NapiGetDataViewInfoTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    status = napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer ok.");
    napi_value result = nullptr;
    size_t byteLength = 12;
    size_t byteOffset = 4;
    status = napi_create_dataview(env, byteLength, arrayBuffer, byteOffset, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer ok.");
    uint8_t *data = nullptr;
    size_t length = 0;
    napi_value arrayBufferRst = nullptr;
    size_t byteOffsetRst = 0;
    napi_get_dataview_info(env, result, &length, (void **)&data, &arrayBufferRst, &byteOffsetRst);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //dataview is undefined
    status = napi_get_dataview_info(env, undefined, &length, (void **)&data, &arrayBufferRst, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "dataview is undefined, napi_get_dataview_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //arraybuffer is undefined
    status = napi_get_dataview_info(env, result, &length, (void **)&data, &undefined, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_ok, "arraybuffer is undefined, napi_get_typedarray_info ok.");

    //env is null
    status = napi_get_dataview_info(nullptr, result, &length, (void **)&data, &arrayBufferRst, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_dataview_info failed.");
    //dataview is null
    status = napi_get_dataview_info(env, nullptr, &length, (void **)&data, &arrayBufferRst, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_invalid_arg, "dataview is null, napi_get_dataview_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //bytelength is null
    status = napi_get_dataview_info(env, result, nullptr, (void **)&data, &arrayBufferRst, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_ok, "bytelength is null, napi_get_dataview_info ok.");
    //data is null
    status = napi_get_dataview_info(env, result, &length, nullptr, &arrayBufferRst, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_ok, "data is null, napi_get_dataview_info ok.");
    //arraybuffer is null
    status = napi_get_dataview_info(env, result, &length, (void **)&data, nullptr, &byteOffsetRst);
    NAPI_ASSERT(env, status == napi_ok, "arraybuffer is null, napi_get_dataview_info ok.");
    //byte_offset is null
    status = napi_get_dataview_info(env, result, &length, (void **)&data, &arrayBufferRst, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "byte_offset is null, napi_get_dataview_info ok.");
    //all is null
    status = napi_get_dataview_info(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_dataview_info failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_bool
static napi_value NapiGetValueBoolTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    
    bool bValue = true;
    napi_value bRst = nullptr;
    napi_get_boolean(env, bValue, &bRst);
    bool bRstValue = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_bool(env, undefined, &bRstValue);
    NAPI_ASSERT(env, status != napi_ok, "value is undefined, napi_get_value_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_value_bool(nullptr, bRst, &bRstValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_value_bool(env, nullptr, &bRstValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_value_bool(env, bRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_value_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_value_bool(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_double
static napi_value NapiGetValueDoubleTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    
    double value = 1.2;
    napi_value result = nullptr;
    napi_create_double(env, value, &result);
    double dRstValue;
    napi_get_value_double(env, result, &dRstValue);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_double(env, undefined, &dRstValue);
    NAPI_ASSERT(env, status == napi_number_expected, "value is undefined, napi_get_value_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_number_expected);
    //env is null
    status = napi_get_value_double(nullptr, result, &dRstValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_value_double(env, nullptr, &dRstValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_value_double(env, result, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_value_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_value_double(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_double failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_value_int32
static napi_value NapiGetValueInt32Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    
    int32_t value = 0;
    napi_value  valueRst = nullptr;
    napi_create_int32(env, value, &valueRst);
    int32_t valueInt = 0;
    napi_get_value_int32(env, valueRst, &valueInt);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_int32(env, undefined, &valueInt);
    NAPI_ASSERT(env, status == napi_number_expected, "value is undefined, napi_get_value_int32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_number_expected);
    //env is null
    status = napi_get_value_int32(nullptr, valueRst, &valueInt);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_external failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_value_int32(env, nullptr, &valueInt);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_int32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_value_int32(env, valueRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_value_int32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_value_int32(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_int32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_int64
static napi_value NapiGetValueInt64Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    
    int64_t value = 0;
    napi_value  valueRst = nullptr;
    napi_create_int64(env, value, &valueRst);
    int64_t valueInt = 0;
    napi_get_value_int64(env, valueRst, &valueInt);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_int64(env, undefined, &valueInt);
    NAPI_ASSERT(env, status == napi_number_expected, "value is undefined, napi_get_value_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_number_expected);
    //env is null
    status = napi_get_value_int64(nullptr, valueRst, &valueInt);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_external failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_value_int64(env, nullptr, &valueInt);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_value_int64(env, valueRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_value_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_value_int64(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_string_latin1
static napi_value NapiGetValueStringLatin1Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    
    const char *str = "string latin1";
    napi_value  valueRst = nullptr;
    status = napi_create_string_latin1(env, str, NAPI_AUTO_LENGTH, &valueRst);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create string latin1 value");
    }
    char buf[128] = {0};
    size_t length = 0;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_string_latin1(env, undefined, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_string_expected, "value is undefined, napi_get_value_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_string_expected);
    //env is null
    status = napi_get_value_string_latin1(nullptr, valueRst, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_string_latin1 failed.");
    //value is null
    status = napi_get_value_string_latin1(env, nullptr, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_string_latin1 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //buf is null
    status = napi_get_value_string_latin1(env, valueRst, nullptr, 128, &length);
    NAPI_ASSERT(env, status == napi_ok, "buf is null, napi_get_value_string_latin1 ok.");
    //bufsize is null
    status = napi_get_value_string_latin1(env, valueRst, buf, 0, &length);
    NAPI_ASSERT(env, status == napi_ok, "bufsize is 0, napi_get_value_string_latin1 ok.");
    //result is null
    status = napi_get_value_string_latin1(env, valueRst, buf, 128, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_get_value_string_latin1 ok.");
    //all is null
    status = napi_get_value_string_latin1(nullptr, nullptr, nullptr, 0, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_string_latin1 failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_string_utf8
static napi_value NapiGetValueStringUtf8Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    const char *str = "string utf8";
    napi_value strRst = nullptr;
    status = napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &strRst);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create string utf8 value");
    }
    char buf[128] = {0};
    size_t length = 0;
    napi_get_value_string_utf8(env, strRst, buf, 128, &length);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_string_utf8(env, undefined, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_string_expected, "value is undefined, napi_get_value_string_utf8 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_string_expected);
    //env is null
    status = napi_get_value_string_utf8(nullptr, strRst, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_string_utf8 failed.");
    //value is null
    status = napi_get_value_string_utf8(env, nullptr, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_string_utf8 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //buf is null
    status = napi_get_value_string_utf8(env, strRst, nullptr, 128, &length);
    NAPI_ASSERT(env, status == napi_ok, "buf is null, napi_get_value_string_utf8 ok.");
    //bufsize is null
    status = napi_get_value_string_utf8(env, strRst, buf, 0, &length);
    NAPI_ASSERT(env, status == napi_ok, "bufsize is 0, napi_get_value_string_utf8 ok.");
    //result is null
    status = napi_get_value_string_utf8(env, strRst, buf, 128, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_get_value_string_utf8 ok.");
    //all is null
    status = napi_get_value_string_utf8(nullptr, nullptr, nullptr, 0, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_string_utf8 failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_string_utf16
static napi_value NapiGetValueStringUtf16Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    const char16_t *str = u"string utf16";
    napi_value strRst = nullptr;
    status = napi_create_string_utf16(env, str, NAPI_AUTO_LENGTH, &strRst);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create string utf16 value");
    }
    char16_t buf[128] = {0};
    size_t length = 0;
    napi_get_value_string_utf16(env, strRst, buf, 128, &length);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_string_utf16(env, undefined, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_string_expected, "value is undefined, napi_get_value_string_utf16 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_string_expected);
    //env is null
    status = napi_get_value_string_utf16(nullptr, strRst, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_string_utf16 failed.");
    //value is null
    status = napi_get_value_string_utf16(env, nullptr, buf, 128, &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_string_utf16 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //buf is null
    status = napi_get_value_string_utf16(env, strRst, nullptr, 128, &length);
    NAPI_ASSERT(env, status == napi_ok, "buf is null, napi_get_value_string_utf16 ok.");
    //bufsize is null
    status = napi_get_value_string_utf16(env, strRst, buf, 0, &length);
    NAPI_ASSERT(env, status == napi_ok, "bufsize is 0, napi_get_value_string_utf16 ok.");
    //result is null
    status = napi_get_value_string_utf16(env, strRst, buf, 128, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_get_value_string_utf16 ok.");
    //all is null
    status = napi_get_value_string_utf16(nullptr, nullptr, nullptr, 0, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_string_utf16 failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_value_uint32
static napi_value NapiGetValueUint32Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];
    
    uint32_t value = 0;
    napi_value uint32Rst = nullptr;
    napi_create_uint32(env, value, &uint32Rst);
    uint32_t result;
    napi_get_value_uint32(env, uint32Rst, &result);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_get_value_uint32(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_number_expected, "value is undefined, napi_get_value_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_number_expected);
    //env is null
    status = napi_get_value_uint32(nullptr, uint32Rst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_value_uint32(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_value_uint32(env, uint32Rst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_value_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_value_uint32(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_uint32 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_boolean
static napi_value NapiGetBooleanTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value result = nullptr;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_get_boolean(env, true, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_get_boolean ok.");

    //env is null
    status = napi_get_boolean(nullptr, true, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_boolean failed.");
    //result is null
    status = napi_get_boolean(env, true, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_boolean failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_boolean(nullptr, true, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_boolean failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_global
static napi_value NapiGetGlobalTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_get_global(env, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_get_global ok.");

    //env is null
    status = napi_get_global(nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_global failed.");
    //result is null
    status = napi_get_global(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_global failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_global(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_global failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_null
static napi_value NapiGetNullTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value result = nullptr;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_get_null(env, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_get_null ok.");

    //env is null
    status = napi_get_null(nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_null failed.");
    //result is null
    status = napi_get_null(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_null failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_null(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_null failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_undefined
static napi_value NapiGetUndefinedTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value result = nullptr;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_get_undefined(env, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_get_undefined ok.");

    //env is null
    status = napi_get_undefined(nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_undefined failed.");
    //result is null
    status = napi_get_undefined(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_undefined failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_undefined(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_undefined failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_coerce_to_bool
static napi_value NapiCoerceToBoolTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    int32_t value = 0;
    napi_value intRst = nullptr;
    napi_create_int32(env, value, &intRst);
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_coerce_to_bool(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_bool ok.");
    //result is undefined
    status = napi_coerce_to_bool(env, intRst, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_bool ok.");

    //env is null
    status = napi_coerce_to_bool(nullptr, intRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_coerce_to_bool failed.");
    //value is null
    status = napi_coerce_to_bool(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_coerce_to_bool(env, intRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_coerce_to_bool(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_coerce_to_bool failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_coerce_to_number
static napi_value NapiCoerceToNumberTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    int32_t value = 0;
    napi_value strRst = nullptr;
    const char *str = "abc";
    napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &strRst);
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_coerce_to_number(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_number ok.");
    //result is undefined
    status = napi_coerce_to_number(env, strRst, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_number ok.");

    //env is null
    status = napi_coerce_to_number(nullptr, strRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_coerce_to_number failed.");
    //value is null
    status = napi_coerce_to_number(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_number failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_coerce_to_number(env, strRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_number failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_coerce_to_number(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_coerce_to_number failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_coerce_to_object
static napi_value NapiCoerceToObjectTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    int32_t value = 0;
    napi_value strRst = nullptr;
    const char *str = "abc";
    napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &strRst);
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_coerce_to_object(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_object ok.");
    //result is undefined
    status = napi_coerce_to_object(env, strRst, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_object ok.");

    //env is null
    status = napi_coerce_to_object(nullptr, strRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_coerce_to_object failed.");
    //value is null
    status = napi_coerce_to_object(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_coerce_to_object(env, strRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_coerce_to_object(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_coerce_to_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_coerce_to_string
static napi_value NapiCoerceToStringTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    int32_t value = 0;
    napi_value intRst = nullptr;
    napi_create_int32(env, value, &intRst);
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_coerce_to_string(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_string ok.");
    //result is undefined
    status = napi_coerce_to_string(env, intRst, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_coerce_to_string ok.");

    //env is null
    status = napi_coerce_to_string(nullptr, intRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_coerce_to_string failed.");
    //value is null
    status = napi_coerce_to_string(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_string failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_coerce_to_string(env, intRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_coerce_to_string failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_coerce_to_string(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_coerce_to_string failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_typeof
static napi_value NapiTypeOfTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value strRst = nullptr;
    const char *str = "abc";
    napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &strRst);
    napi_valuetype result;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_typeof(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_typeof ok.");

    //env is null
    status = napi_typeof(nullptr, strRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_typeof failed.");
    //value is null
    status = napi_typeof(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_typeof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_typeof(env, strRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_typeof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_typeof(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_typeof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_instanceof
static napi_value testfun(napi_env env, napi_callback_info info)
{
    napi_value rstValue = nullptr;
    int32_t value = 2;
    napi_create_int32(env, value, &rstValue);
    return rstValue;
}
static napi_value NapiInstanceOfTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value objRst = nullptr;
    const char *str = "abc";
    napi_create_object(env, &objRst);
    napi_value fn = nullptr;
    napi_value resultValue = nullptr;
    napi_create_function(env, str, NAPI_AUTO_LENGTH, testfun, nullptr, &fn);
    if (fn == nullptr) {
        napi_throw_error(env, nullptr, "Napitest: napi_create_function fail");
    }
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_instanceof(env, undefined, fn, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //constructor is undefined
    status = napi_instanceof(env, objRst, undefined, &result);
    NAPI_ASSERT(env, status != napi_ok, "constructor is undefined, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_instanceof(nullptr, objRst, fn, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //object is null
    status = napi_instanceof(env, nullptr, fn, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //constructor is null
    status = napi_instanceof(env, objRst, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "constructor is null, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_instanceof(env, objRst, fn, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_instanceof(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_instanceof failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_is_array
static napi_value NapiIsArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value arrayRst = nullptr;
    napi_create_array(env, &arrayRst);
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_is_array(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_array ok.");

    //env is null
    status = napi_is_array(nullptr, arrayRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_array failed.");
    //value is null
    status = napi_is_array(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_is_array(env, arrayRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_is_array(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_is_arraybuffer
static napi_value NapiIsArrayBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    status = napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_is_arraybuffer(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_arraybuffer ok.");

    //env is null
    status = napi_is_arraybuffer(nullptr, arrayBuffer, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_arraybuffer failed.");
    //value is null
    status = napi_is_arraybuffer(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_is_arraybuffer(env, arrayBuffer, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_is_arraybuffer(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_is_typedarray
static napi_value NapiIsTypedArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    size_t length = 3;
    napi_value arrayBuffer = nullptr;
    napi_value typedArray = nullptr;
    void *data;
    napi_typedarray_type arrayType = napi_int8_array;
    size_t elementSize = sizeof(int8_t);
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
    napi_create_typedarray(env, arrayType, length, arrayBuffer, 0, &typedArray);
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_is_typedarray(env, undefined, &result);;
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_typedarray ok.");

    //env is null
    status = napi_is_typedarray(nullptr, typedArray, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_typedarray failed.");
    //value is null
    status = napi_is_typedarray(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_is_typedarray(env, typedArray, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_is_typedarray(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_is_dataview
static napi_value NapiIsDataViewTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value arrayBuffer = nullptr;
    void* arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    status = napi_create_arraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer ok.");
    napi_value dataView = nullptr;
    size_t byteLength = 12;
    size_t byteOffset = 4;
    status = napi_create_dataview(env, byteLength, arrayBuffer, byteOffset, &dataView);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_dataview ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_is_dataview(env, undefined, &result);;
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_dataview ok.");

    //env is null
    status = napi_is_dataview(nullptr, dataView, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_dataview failed.");
    //value is null
    status = napi_is_dataview(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_is_dataview(env, dataView, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_is_dataview(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_dataview failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_is_date
static napi_value NapiIsDateTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value date = nullptr;
    double time = 1;
    status = napi_create_date(env, time, &date);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_date ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //value is undefined
    status = napi_is_date(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_date ok.");

    //env is null
    status = napi_is_date(nullptr, date, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_date failed.");
    //value is null
    status = napi_is_date(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_date failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_is_date(env, date, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_date failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_is_date(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_date failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_strict_equals
static napi_value NapiStrictEqualsTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    uint32_t value1 = 1;
    napi_value valueRst1 = nullptr;
    napi_create_uint32(env, value1, &valueRst1);
    uint32_t value2 = 1;
    napi_value valueRst2 = nullptr;
    napi_create_uint32(env, value2, &valueRst2);
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //lhs is undefined
    status = napi_strict_equals(env, undefined, valueRst2, &result);
    NAPI_ASSERT(env, status == napi_ok, "lhs is undefined, napi_strict_equals ok.");
    //rhs is undefined
    status = napi_strict_equals(env, valueRst1, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "rhs is undefined, napi_strict_equals ok.");

    //env is null
    status = napi_strict_equals(nullptr, valueRst1, valueRst2, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_strict_equals failed.");
    //lhs is null
    status = napi_strict_equals(env, nullptr, valueRst2, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "lhs is null, napi_strict_equals failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //rhs is null
    status = napi_strict_equals(env, valueRst1, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "rhs is null, napi_strict_equals failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_strict_equals(env, valueRst1, valueRst2, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_strict_equals failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_strict_equals(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_strict_equals failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_property_names
static napi_value NapiGetPropertyNamesTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value objRst = nullptr;
    napi_create_object(env, &objRst);
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_get_property_names(env, undefined, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_get_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //result is undefined
    status = napi_get_property_names(env, objRst, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_get_property_names ok.");

    //env is null
    status = napi_get_property_names(nullptr, objRst, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_property_names failed.");
    //object is null
    status = napi_get_property_names(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_get_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_property_names(env, objRst, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_property_names(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_set_property
static napi_value NapiSetPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_set_property(env, undefined, key, value);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_set_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //key is undefined
    status = napi_set_property(env, obj, undefined, value);
    NAPI_ASSERT(env, status == napi_ok, "key is undefined, napi_set_property ok.");
    //value is undefined
    status = napi_set_property(env, obj, key, undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_set_property ok.");

    //env is null
    status = napi_set_property(nullptr, obj, key, value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_set_property failed.");
    //object is null
    status = napi_set_property(env, nullptr, key, value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_set_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_set_property(env, obj, nullptr, value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_set_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_set_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_set_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_set_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_property
static napi_value NapiGetPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_get_property(env, undefined, key, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_get_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //key is undefined
    status = napi_get_property(env, obj, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "key is undefined, napi_get_property ok.");
    //result is undefined
    status = napi_get_property(env, obj, key, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_get_property ok.");

    //env is null
    status = napi_get_property(nullptr, obj, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_property failed.");
    //object is null
    status = napi_get_property(env, nullptr, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_get_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_get_property(env, obj, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_get_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_has_property
static napi_value NapiHasPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_has_property(env, undefined, key, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_has_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //key is undefined
    status = napi_has_property(env, obj, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "key is undefined, napi_has_property ok.");

    //env is null
    status = napi_has_property(nullptr, obj, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_has_property failed.");
    //object is null
    status = napi_has_property(env, nullptr, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_has_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_has_property(env, obj, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_has_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_has_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_has_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_has_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_has_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest01(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_delete_property(env, undefined, key, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_delete_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest02(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //key is undefined
    status = napi_delete_property(env, obj, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "key is undefined, napi_delete_property ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest03(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //env is null
    status = napi_delete_property(nullptr, obj, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_delete_property failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest04(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //object is null
    status = napi_delete_property(env, nullptr, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_delete_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest05(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //key is null
    status = napi_delete_property(env, obj, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_delete_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest06(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //result is null
    status = napi_delete_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_delete_property ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_property
static napi_value NapiDeletePropertyTest07(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //all is null
    status = napi_delete_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_delete_property failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_has_own_property
static napi_value NapiHasOwnPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = nullptr;
    napi_create_string_utf8(env, "myProperty", NAPI_AUTO_LENGTH, &key);
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_property ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_has_own_property(env, undefined, key, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_has_own_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //key is undefined
    status = napi_has_own_property(env, obj, undefined, &result);
    NAPI_ASSERT(env, status == napi_ok, "key is undefined, napi_has_own_property ok.");

    //env is null
    status = napi_has_own_property(nullptr, obj, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_has_own_property failed.");
    //object is null
    status = napi_has_own_property(env, nullptr, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_has_own_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_has_own_property(env, obj, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_has_own_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_has_own_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_has_own_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_has_own_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_has_own_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_set_named_property
static napi_value NapiSetNamedPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    const char* key = "my property";
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_named_property(env, obj, key, value);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_set_named_property(env, undefined, key, value);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_set_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //value is undefined
    status = napi_set_named_property(env, obj, key, undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_set_named_property ok.");

    //env is null
    status = napi_set_named_property(nullptr, obj, key, value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_set_named_property failed.");
    //object is null
    status = napi_set_named_property(env, nullptr, key, value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_set_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_set_named_property(env, obj, nullptr, value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_set_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_set_named_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_set_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_set_named_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_set_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_named_property
static napi_value NapiGetNamedPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    const char* key = "my property";
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_named_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_named_property ok.");
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_get_named_property(env, undefined, key, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_set_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //result is undefined
    status = napi_get_named_property(env, obj, key, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_get_named_property ok.");

    //env is null
    status = napi_get_named_property(nullptr, obj, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_named_property failed.");
    //object is null
    status = napi_get_named_property(env, nullptr, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_get_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_get_named_property(env, obj, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_get_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //result is null
    status = napi_get_named_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_named_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_has_named_property
static napi_value NapiHasNamedPropertyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    const char* key = "my property";
    napi_value value = nullptr;
    napi_create_int32(env, 2, &value);
    status = napi_set_named_property(env, obj, key, value);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_named_property ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_has_named_property(env, undefined, key, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_has_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //env is null
    status = napi_has_named_property(nullptr, obj, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_has_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //object is null
    status = napi_has_named_property(env, nullptr, key, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_has_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //key is null
    status = napi_has_named_property(env, obj, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "key is null, napi_has_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_has_named_property(env, obj, key, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_has_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_has_named_property(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_has_named_property failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_set_element
static napi_value NapiSetElementTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_set_element(env, undefined, 1, element);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_set_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //value is undefined
    status = napi_set_element(env, array, 1, undefined);
    NAPI_ASSERT(env, status == napi_ok, "object is undefined, napi_set_element ok.");

    //env is null
    status = napi_set_element(nullptr, array, 1, element);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_set_element failed.");
    //object is null
    status = napi_set_element(env, nullptr, 1, element);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_set_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_set_element(env, array, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_set_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_set_element(nullptr, nullptr, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_set_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_get_element
static napi_value NapiGetElementTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    napi_value result = nullptr;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_get_element(env, undefined, 1, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_set_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //result is undefined
    status = napi_get_element(env, array, 1, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_set_element ok.");

    //env is null
    status = napi_get_element(nullptr, array, 1, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_element failed.");
    //object is null
    status = napi_get_element(env, nullptr, 1, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_get_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_get_element(env, array, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_get_element(nullptr, nullptr, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_has_element
static napi_value NapiHasElementTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_has_element(env, undefined, 1, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_has_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //env is null
    status = napi_has_element(nullptr, array, 1, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_has_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //object is null
    status = napi_has_element(env, nullptr, 1, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_has_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //value is null
    status = napi_has_element(env, array, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_has_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_has_element(nullptr, nullptr, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_has_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_element
static napi_value NapiDeleteElementTest01(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    bool result = false;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_delete_element(env, undefined, 1, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_delete_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_element
static napi_value NapiDeleteElementTest02(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    bool result = false;

    //env is null
    status = napi_delete_element(nullptr, array, 1, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_has_element failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_element
static napi_value NapiDeleteElementTest03(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    bool result = false;

    //object is null
    status = napi_delete_element(env, nullptr, 1, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_has_element failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_element
static napi_value NapiDeleteElementTest04(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    bool result = false;

    //result is null
    status = napi_delete_element(env, array, 1, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "value is null, napi_has_element ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_delete_element
static napi_value NapiDeleteElementTest05(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value array;
    status = napi_create_array_with_length(env, 2, &array);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_array_with_length ok.");
    napi_value element = nullptr;
    status = napi_create_double(env, 1.0, &element);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_double ok.");
    status = napi_set_element(env, array, 1, element);
    NAPI_ASSERT(env, status == napi_ok, "napi_set_element ok.");
    bool result = false;

    //all is null
    status = napi_delete_element(nullptr, nullptr, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_has_element failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_define_properties
static napi_value NapiDefinePropertiesTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj;
    status = napi_create_object(env, &obj);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_object ok.");

    napi_property_descriptor properties[] = {
        { "name", nullptr, nullptr, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "age", nullptr, nullptr, nullptr, nullptr, nullptr, napi_default, nullptr },
    };

    napi_value name_value = nullptr, age_value = nullptr;
    napi_create_string_utf8(env, "Alice", NAPI_AUTO_LENGTH, &name_value);
    napi_create_int32(env, 25, &age_value);

    properties[0].value = name_value;
    properties[1].value = age_value;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_define_properties(env, undefined, 2, properties);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_define_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //env is null
    status = napi_define_properties(nullptr, obj, 2, properties);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_define_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //object is null
    status = napi_define_properties(env, nullptr, 2, properties);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_define_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //properties is null
    status = napi_define_properties(env, obj, 2, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "properties is null, napi_define_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_define_properties(nullptr, nullptr, 2, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_define_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_type_tag_object
static napi_value NapiTypeTagObjectTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1];

    napi_value obj;
    napi_type_tag my_type_tag = {0x123456789ABCDEF0, 0xFEDCBA9876543210};
    status = napi_create_object(env, &obj);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_object ok.");

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //object is undefined
    status = napi_type_tag_object(env, undefined, &my_type_tag);
    NAPI_ASSERT(env, status == napi_object_expected, "object is undefined, napi_type_tag_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);
    //env is null
    status = napi_type_tag_object(nullptr, obj, &my_type_tag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_type_tag_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //object is null
    status = napi_type_tag_object(env, nullptr, &my_type_tag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_type_tag_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //type_tag is null
    status = napi_type_tag_object(env, obj, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "type_tag is null, napi_type_tag_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_type_tag_object(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_type_tag_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_remove_wrap_sendable
static napi_value NapiRemoveWrapSendableTest1(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];
    size_t elementSize = sizeof(int8_t);
    size_t length = 3;
    napi_value arrayBuffer = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //js_object is undefined
    status = napi_remove_wrap_sendable(env, undefined, (void**)&data);
    NAPI_ASSERT(env, status != napi_ok, "js_object is undefined, napi_remove_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //env is null
    status = napi_remove_wrap_sendable(nullptr, args[0], (void**)&data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_remove_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //js_object is null
    status = napi_remove_wrap_sendable(env, nullptr, (void**)&data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_remove_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //** result is null
    status = napi_remove_wrap_sendable(env, args[0], nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "** result is null, napi_remove_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_remove_wrap_sendable(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_remove_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_unwrap_sendable
static napi_value NapiUwrapSendableTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];
    size_t elementSize = sizeof(int8_t);
    size_t length = 3;
    napi_value arrayBuffer = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //js_object is undefined
    status = napi_unwrap_sendable(env, undefined, (void**)&data);
    NAPI_ASSERT(env, status != napi_ok, "js_object is undefined, napi_unwrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //env is null
    status = napi_unwrap_sendable(nullptr, args[0], (void**)&data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_unwrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //js_object is null
    status = napi_unwrap_sendable(env, nullptr, (void**)&data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_unwrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //** result is null
    status = napi_unwrap_sendable(env, args[0], nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "** result is null, napi_unwrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_unwrap_sendable(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_unwrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
//napi_wrap_sendable_with_size
static napi_value NapiWrapSendableWithSizeTest1(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    size_t nativeBindingSize = 1024;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
    napi_value js_obj;  
    napi_create_object(env, &js_obj);
 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //js_object is undefined
    status = napi_wrap_sendable_with_size(env, undefined, (void*)data, [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        }, (void*)data, nativeBindingSize);
    NAPI_ASSERT(env, status != napi_ok, "js_object is undefined, napi_wrap_sendable_with_size failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //env is null
    status = napi_wrap_sendable_with_size(nullptr, args[0], (void*)data, [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        }, (void*)data, nativeBindingSize);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap_sendable_with_size failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //js_object is null
    status = napi_wrap_sendable_with_size(env, nullptr, (void*)data, [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        }, (void*)data, nativeBindingSize);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_wrap_sendable_with_size failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //void* native_object is null
        status = napi_wrap_sendable_with_size(env, args[0], nullptr, [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        }, (void*)data, nativeBindingSize);
    NAPI_ASSERT(env, status == napi_invalid_arg, "void* native_object is null, napi_wrap_sendable_with_size failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //all is null
    status = napi_wrap_sendable_with_size(nullptr, nullptr, nullptr, nullptr, nullptr, nativeBindingSize);
    NAPI_ASSERT(env, status != napi_ok, "all is null, napi_wrap_sendable_with_size failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_wrap_sendable
static napi_value NapiWrapSendableTest1(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
    napi_value js_obj;  
    napi_create_object(env, &js_obj);
 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //js_object is undefined
    status = napi_wrap_sendable(env, undefined, (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        (void*)data);
    NAPI_ASSERT(env, status != napi_ok, "js_object is undefined, napi_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);
    //env is null
    status = napi_wrap_sendable(nullptr, args[0], (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        (void*)data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //js_object is null
    status = napi_wrap_sendable(env, nullptr, (void*)data,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        (void*)data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);
    //void* native_object is null
        status = napi_wrap_sendable(env, args[0], nullptr,
        [](napi_env env, void* data, void* hint) {
            char* tmp = reinterpret_cast<char*>(data);
            delete[] tmp;
        },
        (void*)data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "void* native_object is null, napi_wrap_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_sendable_typedarray
static napi_value NapiCreateSendableTypeArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_typedarray_type arrayType = napi_int8_array;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    size_t byteOffset = 4;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //arraybuffer is undefined
    status = napi_create_sendable_typedarray(env, arrayType, length, undefined, byteOffset, &result);
    NAPI_ASSERT(env, status != napi_ok, "arraybuffer is undefined, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //*result is undefined
    status = napi_create_sendable_typedarray(env, arrayType, length, arrayBuffer, byteOffset, &undefined);
    NAPI_ASSERT(env, status != napi_ok, "result is undefined, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //all is undefined
    status = napi_create_sendable_typedarray(env, arrayType, length, undefined, byteOffset, &undefined);
    NAPI_ASSERT(env, status != napi_ok, "all is undefined, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_create_sendable_typedarray(nullptr, arrayType, length, arrayBuffer, byteOffset, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //arraybuffer is null
    status = napi_create_sendable_typedarray(env, arrayType, length, nullptr, byteOffset, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "arraybuffer is null, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //*result is null
    status = napi_create_sendable_typedarray(env, arrayType, length, nullptr, byteOffset, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "*result is null, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_sendable_typedarray(nullptr, arrayType, length, nullptr, byteOffset, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_sendable_typedarray failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_sendable_arraybuffer
static napi_value NapiCreateSendableArrayBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //arraybuffer is undefined
    status = napi_create_sendable_arraybuffer(env, length, &data, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "arraybuffer is undefined, napi_create_sendable_arraybuffer failed.");

    //env is null
    status = napi_create_sendable_arraybuffer(nullptr, length, &data, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_sendable_arraybuffer failed.");

    //data is null
    status = napi_create_sendable_arraybuffer(env, length, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "data is null, napi_create_sendable_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_create_sendable_arraybuffer(env, length, &data, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_sendable_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_sendable_arraybuffer(nullptr, length, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_sendable_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_sendable_array_with_length
static napi_value NapiCreateSendableArrayWithLengthTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_sendable_array_with_length(env, length, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_sendable_array_with_length failed.");

    //env is null
    status = napi_create_sendable_array_with_length(nullptr, length, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_sendable_array_with_length failed.");

    //result is null
    status = napi_create_sendable_array_with_length(env, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_sendable_array_with_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_sendable_array_with_length(nullptr, length, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_sendable_array_with_length failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_sendable_array
static napi_value NapiCreateSendableArrayTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_sendable_array(env, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_sendable_array failed.");

    //env is null
    status = napi_create_sendable_array(nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_sendable_array failed.");

    //result is null
    status = napi_create_sendable_array(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_sendable_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_sendable_array(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_sendable_array failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_sendable_object_with_properties
static napi_value NapiCreateSendableObjectWithPropertiesTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);
    napi_value val_true;
    napi_get_boolean(env, true, &val_true);
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    }; 
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //result is undefined
    status = napi_create_sendable_object_with_properties(env, 1, desc, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_sendable_object_with_properties failed.");

    //env is null
    status = napi_create_sendable_object_with_properties(nullptr, 1, desc, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_sendable_object_with_properties failed.");

    //result is null
    status = napi_create_sendable_object_with_properties(env, 1, desc, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_sendable_object_with_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_sendable_object_with_properties(nullptr, 1, desc, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_sendable_object_with_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest1(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val; napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val); return val;
         }, nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr}, {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    //result is undefined
    status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {
                {"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val); return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},
            }; napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        }, data, sizeof(props) / sizeof(props[0]), props, result, &undefined);
     NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_define_sendable_class failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest2(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val); return val;
         }, nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;

    //env is null
    status = napi_define_sendable_class(nullptr, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {{"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},
            };
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        },
        data, sizeof(props) / sizeof(props[0]), props, result, &sendableClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_define_sendable_class failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest3(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr}, {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val); return val;},
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr}, {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;

    //utf8name is null
    status = napi_define_sendable_class(env, nullptr, NAPI_AUTO_LENGTH,
            [](napi_env env, napi_callback_info info) -> napi_value {napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {
                {"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},};
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        },
        data, sizeof(props) / sizeof(props[0]), props, result, &sendableClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "utf8name is null, napi_define_sendable_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest4(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {
        {"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr},
        {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;

    //constructor is null
    status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH, nullptr,
                   data, sizeof(props) / sizeof(props[0]), props, result, &sendableClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "constructor is null, napi_define_sendable_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest5(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr}, {"staticFunc", nullptr,
         [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         }, nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr}, {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;
    //data is null
    status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {{"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},
            };
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        }, nullptr, sizeof(props) / sizeof(props[0]), props, result, &sendableClass);
    NAPI_ASSERT(env, status == napi_ok, "data is null, napi_define_sendable_class failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest6(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         },
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr}, {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;
    //properties is null
    status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {{"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},};
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        }, data, sizeof(props) / sizeof(props[0]), nullptr, result, &sendableClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "properties is null, napi_define_sendable_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest7(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
             napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;
         }, nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr}, {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},
    };
    napi_value sendableClass = nullptr;
    //parent is null
    status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {{"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},};
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        }, data, sizeof(props) / sizeof(props[0]), props, nullptr, &sendableClass);
    NAPI_ASSERT(env, status == napi_ok, "parent is null, napi_define_sendable_class failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_sendable_class
static napi_value NapiDefineSendableClassTest8(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    napi_value str;
    napi_create_string_utf8(env, "static str", NAPI_AUTO_LENGTH, &str);
    napi_property_descriptor props[] = {{"staticStr", nullptr, nullptr, nullptr, nullptr, str,
         static_cast<napi_property_attributes>(napi_static | napi_writable), nullptr},
        {"staticFunc", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {napi_value val;
             napi_create_string_utf8(env, "static func", NAPI_AUTO_LENGTH, &val);
             return val;},
         nullptr, nullptr, nullptr, napi_static, nullptr},
        {"str", nullptr, nullptr, nullptr, nullptr, str, static_cast<napi_property_attributes>(1 << 9 | napi_writable),
         nullptr}, {"func", nullptr, nullptr, nullptr, nullptr, nullptr,
         static_cast<napi_property_attributes>(1 << 11 | napi_writable), nullptr},};
    //result is null
    status = napi_define_sendable_class(env, "SendableClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            napi_value str;
            napi_create_string_utf8(env, "instance str", NAPI_AUTO_LENGTH, &str);
            napi_property_descriptor props[] = {{"str", nullptr, nullptr, nullptr, nullptr, str, napi_default, nullptr},
                {"func", nullptr, [](napi_env env, napi_callback_info info) -> napi_value {
                     napi_value val;
                     napi_create_string_utf8(env, "instance func", NAPI_AUTO_LENGTH, &val);
                     return val;
                 }, nullptr, nullptr, nullptr, napi_default, nullptr},};
            napi_define_properties(env, thisVar, sizeof(props) / sizeof(props[0]), props);
            return thisVar;
        }, data, sizeof(props) / sizeof(props[0]), props, result, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_define_sendable_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_define_sendable_class(nullptr, nullptr, NAPI_AUTO_LENGTH, nullptr,
                   nullptr, sizeof(props) / sizeof(props[0]), nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_define_sendable_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_is_sendable
static napi_value NapiIsSendableTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    napi_value result = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    bool isSendable = false;
    //value is undefined
    status = napi_is_sendable(env, undefined, &isSendable);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_sendable failed.");

    //env is null
    status = napi_is_sendable(nullptr, result, &isSendable);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_sendable failed.");

    //value is null
    status = napi_is_sendable(env, nullptr, &isSendable);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_is_sendable(env, result, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_is_sendable(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_sendable failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_call_threadsafe_function_with_priority
static napi_value NapiCallThreadsafeFunctionWithPriorityTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    CallbackData *callbackData = reinterpret_cast<CallbackData *>(data);
    //func is null
    status = napi_call_threadsafe_function_with_priority(nullptr, data, napi_priority_idle, true);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_call_threadsafe_function_with_priority failed.");

    //data is null
    status = napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_idle, true);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_call_threadsafe_function_with_priority failed.");

    //all is null
    status = napi_call_threadsafe_function_with_priority(nullptr, nullptr, napi_priority_idle, true);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_call_threadsafe_function_with_priority failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_delete_serialization_data
static napi_value NapiDeleteSerializationDataTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t elementSize = sizeof(int8_t);
    size_t length = 256;
    napi_value arrayBuffer = nullptr;
    void *data;
    napi_create_arraybuffer(env, length * elementSize, (void **)&data, &arrayBuffer);

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_delete_serialization_data(nullptr, data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_delete_serialization_data failed.");

    //data is null
    status = napi_delete_serialization_data(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_delete_serialization_data failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_delete_serialization_data(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_delete_serialization_data failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_deserialize
static napi_value NapiDeserializeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;
    void *data;

    //env is null
    status = napi_deserialize(nullptr, data, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_deserialize failed.");

    //buffer is null
    status = napi_deserialize(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "buffer is null, napi_deserialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //object is null
    status = napi_deserialize(env, data, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_deserialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_deserialize(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_deserialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_serialize
static napi_value NapiSerializeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    void *data;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //object is undefined
    status = napi_serialize(env, undefined, object, object, &data);
    NAPI_ASSERT(env, status != napi_ok, "object is undefined, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //transfer_list is undefined
    status = napi_serialize(env, object, undefined, object, &data);
    NAPI_ASSERT(env, status != napi_ok, "transfer_list is undefined, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //clone_list is undefined
    status = napi_serialize(env, object, object, undefined, &data);
    NAPI_ASSERT(env, status != napi_ok, "clone_list is undefined, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_serialize(nullptr, object, object, object, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //object is null
    status = napi_serialize(env, nullptr, object, object, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //transfer_list is null
    status = napi_serialize(env, object, nullptr, object, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //clone_list is null
    status = napi_serialize(env, object, object, nullptr, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "clone_list is null, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //data is null
    status = napi_serialize(env, object, object, object, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "clone_list is null, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_serialize(nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_serialize failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_load_module_with_info
static napi_value NapiLoadModuleWithInfoTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_load_module_with_info(nullptr, "pages/ObjectUtils", "com.acts.ace.napitest/entry_test", &result);
    NAPI_ASSERT(env, status != napi_ok, "env is null, napi_load_module_with_info failed.");

    //path is null
    status = napi_load_module_with_info(env, nullptr, "com.acts.ace.napitest/entry_test", &result);
    NAPI_ASSERT(env, status == napi_ok, "path is null, napi_load_module_with_info failed.");

    //result is null
    status = napi_load_module_with_info(env, "pages/ObjectUtils", "com.acts.ace.napitest/entry_test", nullptr);
    NAPI_ASSERT(env, status != napi_ok, "result is null, napi_load_module_with_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //all is null
    status = napi_load_module_with_info(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status != napi_ok, "all is null, napi_load_module_with_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_stop_event_loop
static napi_value NapiStopEventLoopTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_stop_event_loop(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_stop_event_loop failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_run_event_loop
static napi_value NapiRunEventLoopTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_event_mode mode;
    //env is null
    status = napi_run_event_loop(nullptr, mode);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_run_event_loop failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_destroy_ark_runtime
static napi_value NapiDestroyArkRuntimeTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    //env is null
    status = napi_destroy_ark_runtime(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_destroy_ark_runtime failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_ark_runtime
static napi_value NapiCreateArkRuntimeTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_create_ark_runtime(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_ark_runtime failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_coerce_to_native_binding_object
static napi_value NapiCoerceToNativeBindingObjectTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value hint = nullptr;
    napi_create_object(env, &hint);
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //js_object is undefined
    status = napi_coerce_to_native_binding_object(env, undefined,
        TestDetachCallback, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    NAPI_ASSERT(env, status != napi_ok, "js_object is undefined, napi_coerce_to_native_binding_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_coerce_to_native_binding_object(nullptr, object,
        TestDetachCallback, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_coerce_to_native_binding_object failed.");

    //js_object is null
    status = napi_coerce_to_native_binding_object(env, nullptr,
        TestDetachCallback, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_coerce_to_native_binding_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //detach_cb is null
    status = napi_coerce_to_native_binding_object(env, object,
        nullptr, TestAttachCallback, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    NAPI_ASSERT(env, status == napi_invalid_arg, "detach_cb is null, napi_coerce_to_native_binding_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //attach_cb is null
    status = napi_coerce_to_native_binding_object(env, object,
        TestDetachCallback, nullptr, reinterpret_cast<void*>(object), reinterpret_cast<void*>(hint));
    NAPI_ASSERT(env, status == napi_invalid_arg, "attach_cb is null, napi_coerce_to_native_binding_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //native_object is null
    status = napi_coerce_to_native_binding_object(env, object,
        TestDetachCallback, TestAttachCallback, nullptr, reinterpret_cast<void*>(hint));
    NAPI_ASSERT(env, status == napi_invalid_arg, "native_object is null, napi_coerce_to_native_binding_object failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //hint is null
    status = napi_coerce_to_native_binding_object(env, object,
        TestDetachCallback, TestAttachCallback, reinterpret_cast<void*>(object), nullptr);
    NAPI_ASSERT(env, status == napi_ok, "hint is null, napi_coerce_to_native_binding_object failed.");

    //all is null
    status = napi_coerce_to_native_binding_object(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_coerce_to_native_binding_object failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_object_with_named_properties
static napi_value NapiCreateObjectWithNamedPropertiesTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value val_true;
    napi_get_boolean(env, true, &val_true);

    const char *keys[] = {
        "x",
    };
    const napi_value values[] = {
        val_true,
    };

    //result is undefined
    status = napi_create_object_with_named_properties(env, &undefined, 1, keys, values);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_object_with_named_properties failed.");

    //values is undefined
    status = napi_create_object_with_named_properties(env, &object, 1, keys, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "values is undefined, napi_create_object_with_named_properties failed.");

    //env is null
    status = napi_create_object_with_named_properties(nullptr, &object, 1, keys, values);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_object_with_named_properties failed.");

    //result is null
    status = napi_create_object_with_named_properties(env, nullptr, 1, keys, values);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_object_with_named_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_object_with_named_properties(nullptr, nullptr, 1, keys, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_object_with_named_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_object_with_properties
static napi_value NapiCreateObjectWithPropertiesTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value val_true;
    napi_get_boolean(env, true, &val_true);
    NAPI_CALL(env, napi_get_boolean(env, true, &val_true));
    napi_property_descriptor desc1[] = {
        DECLARE_NAPI_DEFAULT_PROPERTY("x", val_true),
    };

    //result is undefined
    status = napi_create_object_with_properties(env, &undefined, 1, desc1);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_object_with_properties failed.");

    //env is null
    status = napi_create_object_with_properties(nullptr, &object, 1, desc1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_object_with_properties failed.");

    //object is null
    status = napi_create_object_with_properties(env, nullptr, 1, desc1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_create_object_with_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_object_with_properties(nullptr, nullptr, 1, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_object_with_properties failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_load_module
static napi_value NapiLoadModuleTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //result is undefined
    const char* path =  "@ohos.hilog";
    status = napi_load_module(env, path, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_load_module failed.");

    //env is null
    status = napi_load_module(nullptr, path, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_load_module failed.");

    //path is null
    status = napi_load_module(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_ok, "path is null, napi_load_module failed.");

    //result is null
    status = napi_load_module(env, path, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_load_module failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_load_module(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_load_module failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_run_script_path
static napi_value NapiRunScriptPathTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //result is undefined
    const char* path =  "@ohos.hilog";
    status = napi_run_script_path(env, path, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_run_script_path failed.");

    //env is null
    status = napi_run_script_path(nullptr, path, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_run_script_path failed.");

    //result is null
    status = napi_run_script_path(env, path, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_run_script_path failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_run_script_path(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_run_script_path failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_queue_async_work_with_qos
static napi_value NapiQueueAsyncWorkWithQosTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    //env is null
    status = napi_queue_async_work_with_qos(nullptr, addonData->asyncWork, napi_qos_default);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_run_script_path failed.");

    //result is null
    status = napi_queue_async_work_with_qos(env, nullptr, napi_qos_default);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_run_script_path failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_queue_async_work_with_qos(nullptr, nullptr, napi_qos_default);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_run_script_path failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    free(addonData);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_fatal_exception
static napi_value NapiFatalExceptionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //error is undefine
    status = napi_fatal_exception(env, undefined);
    NAPI_ASSERT(env, status != napi_ok, "result is undefined, napi_fatal_exception failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_fatal_exception(nullptr, result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_fatal_exception failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_fatal_exception(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_fatal_exception failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_fatal_exception(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_fatal_exception failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_add_finalizer
static napi_value NapiAddFinalizerTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];
    void *data;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    napi_value resource = args[0];
    napi_value resourceName;
    napi_create_string_utf8(env, "test_async", NAPI_AUTO_LENGTH, &resourceName);
    napi_async_context context;
    napi_ref ref = nullptr;

    //all is null
    status = napi_add_finalizer(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_add_finalizer failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//node_api_get_module_file_name
static napi_value NodeApiGetModuleFileNameTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    const char *filename;

    //env is null
    status = node_api_get_module_file_name(nullptr, &filename);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, node_api_get_module_file_name failed.");

    //filename is null
    status = node_api_get_module_file_name(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "filename is null, node_api_get_module_file_name failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = node_api_get_module_file_name(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, node_api_get_module_file_name failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_remove_async_cleanup_hook
static napi_value NapiRemoveAsyncCleanupHookTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //mustNotCallHandle is null
    status = napi_remove_async_cleanup_hook(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "mustNotCallHandle is null, napi_remove_async_cleanup_hook failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_add_async_cleanup_hook
static napi_value NapiAddAsyncCleanupHookTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    AsyncData* data = CreateAsyncData();
    status = napi_add_async_cleanup_hook(nullptr, AsyncCleanupHook, data, &data->handle);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_add_async_cleanup_hook failed.");

    //hook is null
    status = napi_add_async_cleanup_hook(env, nullptr, data, &data->handle);
    NAPI_ASSERT(env, status != napi_ok, "hook is null, napi_add_async_cleanup_hook failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //arg is null
    status = napi_add_async_cleanup_hook(env, AsyncCleanupHook, nullptr, &data->handle);
    NAPI_ASSERT(env, status == napi_ok, "arg is null, napi_add_async_cleanup_hook failed.");

    //remove_handle is null
    status = napi_add_async_cleanup_hook(env, AsyncCleanupHook, data, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "remove_handle is null, napi_add_async_cleanup_hook failed.");

    //all is null
    status = napi_add_async_cleanup_hook(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_add_async_cleanup_hook failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_remove_env_cleanup_hook
static napi_value NapiRemoveEnvCleanupHookTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    static int argValueRemoved = 17;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_remove_env_cleanup_hook(nullptr, Cleanup, &argValueRemoved);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_remove_env_cleanup_hook failed.");

    //fun is null
    status = napi_remove_env_cleanup_hook(env, nullptr, &argValueRemoved);
    NAPI_ASSERT(env, status == napi_invalid_arg, "fun is null, napi_remove_env_cleanup_hook failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //arg is null
    status = napi_remove_env_cleanup_hook(env, Cleanup, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "arg is null, napi_remove_env_cleanup_hook failed.");

    //all is null
    status = napi_remove_env_cleanup_hook(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_remove_env_cleanup_hook failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_add_env_cleanup_hook
static napi_value NapiAddEnvCleanupHookTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    static int argValueRemoved = 17;

    //env is null
    status = napi_add_env_cleanup_hook(nullptr, Cleanup, &argValueRemoved);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_add_env_cleanup_hook failed.");

    //func is null
    status = napi_add_env_cleanup_hook(env, nullptr, &argValueRemoved);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_add_env_cleanup_hook failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //arg is null
    status = napi_add_env_cleanup_hook(env, Cleanup, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "arg is null, napi_add_env_cleanup_hook failed.");

    //all is null
    status = napi_add_env_cleanup_hook(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_add_env_cleanup_hook failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_instance_data
static napi_value NapiGetInstanceDataTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //env is null
    InstanceData *data;
    status = napi_get_instance_data(nullptr, reinterpret_cast<void**>(&data));
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_instance_data failed.");

    //data is null
    status = napi_get_instance_data(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "data is null, napi_get_instance_data failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_instance_data(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_instance_data failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_set_instance_data
static napi_value NapiSetInstanceDataTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    void *result = nullptr;
    InstanceData* data = reinterpret_cast<InstanceData*>(malloc(sizeof(*data)));
    data->value = 1;
    data->print = true;
    data->jsCbRef = nullptr;

    //env is null
    status = napi_set_instance_data(nullptr, data, DeleteAddonData, result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_set_instance_data failed.");

    //all is null
    status = napi_set_instance_data(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_set_instance_data failed.");

    free(data);
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_is_detached_arraybuffer
static napi_value NapiIsDetachedArrayBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    bool isDetached;

    //value is undefined
    status = napi_is_detached_arraybuffer(env, undefined, &isDetached);
    NAPI_ASSERT(env, status != napi_ok, "value is undefined, napi_is_detached_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_is_detached_arraybuffer(nullptr, args[0], &isDetached);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_detached_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //value is null
    status = napi_is_detached_arraybuffer(env, nullptr, &isDetached);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_detached_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_is_detached_arraybuffer(env, args[0], nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_detached_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_is_detached_arraybuffer(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_detached_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_detach_arraybuffer
static napi_value NapiDetachedArrayBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //arraybuffer is undefined
    status = napi_detach_arraybuffer(env, undefined);
    NAPI_ASSERT(env, status != napi_ok, "arraybuffer is undefined, napi_detach_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_detach_arraybuffer(nullptr, args[0]);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_detach_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //arraybuffer is null
    status = napi_detach_arraybuffer(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "arraybuffer is null, napi_detach_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_detach_arraybuffer(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_detach_arraybuffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_all_property_names
static napi_value NapiGetAllPropertyNamesTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //object is undefined
    status = napi_get_all_property_names(env, undefined, napi_key_own_only, napi_key_writable, napi_key_keep_numbers,
                                         &result);
    NAPI_ASSERT(env, status != napi_ok, "object is undefined, napi_get_all_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //result is undefined
    status = napi_get_all_property_names(env, result, napi_key_own_only, napi_key_writable,
                                         napi_key_keep_numbers,
                                         &undefined);
    NAPI_ASSERT(env, status != napi_ok, "result is undefined, napi_get_all_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_all_property_names(nullptr, result, napi_key_own_only,
                                         napi_key_writable,
                                         napi_key_keep_numbers,
                                         &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_all_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //object is null
    status = napi_get_all_property_names(env,
                                         nullptr,
                                         napi_key_own_only,
                                         napi_key_writable,
                                         napi_key_keep_numbers,
                                         &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_get_all_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_get_all_property_names(env,
                                         result,
                                         napi_key_own_only,
                                         napi_key_writable,
                                         napi_key_keep_numbers,
                                         nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_all_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_all_property_names(nullptr,
                                         nullptr,
                                         napi_key_own_only,
                                         napi_key_writable,
                                         napi_key_keep_numbers,
                                         nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_all_property_names failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_object_seal
static napi_value NapiObjectSealTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //object is undefined
    status = napi_object_seal(env, undefined);
    NAPI_ASSERT(env, status != napi_ok, "object is undefined, napi_object_seal failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_object_seal(nullptr, args[0]);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_object_seal failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //object is null
    status = napi_object_seal(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_object_seal failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_object_seal(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_object_seal failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_object_freeze
static napi_value NapiObjectFreezeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //object is undefined
    status = napi_object_freeze(env, undefined);
    NAPI_ASSERT(env, status != napi_ok, "object is undefined, napi_object_freeze failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_object_freeze(nullptr, args[0]);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_object_freeze failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //object is null
    status = napi_object_freeze(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "object is null, napi_object_freeze failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_object_freeze(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_object_freeze failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}


//napi_is_buffer
static napi_value NapiIsBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    bool bresult;
    //value is undefined
    status = napi_is_buffer(env, undefined, &bresult);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_buffer failed.");

    //env is null
    status = napi_is_buffer(nullptr, args[0], &bresult);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_buffer failed.");

    //value is null
    status = napi_is_buffer(env, nullptr, &bresult);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_is_buffer(env, args[0], nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_is_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_is_buffer(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_buffer_info
static napi_value NapiGetBufferInfoTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    char *bufferData;
    napi_value args[1];
    size_t length = 256;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //value is undefined
    status = napi_get_buffer_info(env, undefined, (void**)(&bufferData), &length);
    NAPI_ASSERT(env, status != napi_ok, "value is undefined, napi_get_buffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_buffer_info(nullptr, args[0], (void**)(&bufferData), &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_buffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //value is null
    status = napi_get_buffer_info(env, nullptr, (void**)(&bufferData), &length);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_buffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_buffer_info(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_buffer_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_external_buffer
static napi_value NapiCreateExternalBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t length = 1;
    napi_value arrayBuffer = nullptr;
    void *data;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    char* copyPtr = strdup(TEST_STR);

    //result is undefined
    status = napi_create_external_buffer(env, length, copyPtr, DelTest, data, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_create_external_buffer failed.");

    //env is null
    status = napi_create_external_buffer(nullptr, length, copyPtr, DelTest, data, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_external_buffer failed.");

    //data is null
    status = napi_create_external_buffer(env, length, nullptr, DelTest, data, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_create_external_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //finalize_cb is null
    status = napi_create_external_buffer(env, length, copyPtr, nullptr, data, &arrayBuffer);
    NAPI_ASSERT(env, status == napi_ok, "finalize_cb is null, napi_create_external_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_external_buffer(nullptr, length, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_external_buffer failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_buffer_copy
static napi_value NapiCreateBufferCopyTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t length = 256;
    napi_value result = nullptr;
    void *data;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //result is undefined
    status = napi_create_buffer_copy(env, length, TEST_STR, &data, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_buffer_copy failed.");

    //env is null
    status = napi_create_buffer_copy(nullptr, length, TEST_STR, &data, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_buffer_copy failed.");

    //data is null
    status = napi_create_buffer_copy(env, length, nullptr, &data, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "data is null, napi_create_buffer_copy failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result_data is null
    status = napi_create_buffer_copy(env, length, TEST_STR, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result_data is null, napi_create_buffer_copy failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_create_buffer_copy(env, length, TEST_STR, &data, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_buffer_copy failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_buffer_copy(nullptr, length, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_buffer_copy failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_buffer
static napi_value NapiCreateBufferTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t length = 256;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    char* copyPtr = strdup(TEST_STR);
    
    //result is undefined
    status = napi_create_buffer(env, length, (void**)(&copyPtr), &result);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_buffer failed.");

    //env is null
    status = napi_create_buffer(nullptr, length, (void**)(&copyPtr), &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_buffer failed.");

    //data is null
    status = napi_create_buffer(env, length, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "data is null, napi_create_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result_data is null
    status = napi_create_buffer(env, length, (void**)(&copyPtr), nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result_data is null, napi_create_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_buffer(nullptr, length, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_buffer failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_value_bigint_words
static napi_value NapiGetValueBigintWordsTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL, 0ULL};
    napi_create_bigint_words(env, signBit, wordCount, words, &result);
    int retSignBit = -1;
    size_t retWordCount = 4;
    
    //value is undefined
    status = napi_get_value_bigint_words(env, undefined, &retSignBit, &retWordCount, wordsOut);
    NAPI_ASSERT(env, status != napi_ok, "value is undefined, napi_get_value_bigint_words failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_value_bigint_words(nullptr, result, &retSignBit, &retWordCount, wordsOut);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_bigint_words failed.");

    //value is null
    status = napi_get_value_bigint_words(env, nullptr, &retSignBit, &retWordCount, wordsOut);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_bigint_words failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //sign_bit is null
    status = napi_get_value_bigint_words(env, result, nullptr, &retWordCount, wordsOut);
    NAPI_ASSERT(env, status == napi_ok, "sign_bit is null, napi_get_value_bigint_words failed.");

    //word_count is null
    status = napi_get_value_bigint_words(env, result, &retSignBit, nullptr, wordsOut);
    NAPI_ASSERT(env, status == napi_invalid_arg, "word_count is null, napi_get_value_bigint_words failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //words is null
    status = napi_get_value_bigint_words(env, result, &retSignBit, &retWordCount, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "words is null, napi_get_value_bigint_words failed.");

    //all is null
    status = napi_get_value_bigint_words(nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_bigint_words failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_value_bigint_uint64
static napi_value NapiGetValueBigintUint64Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    uint64_t resultValue = 0;
    bool flag = false;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //value is undefined
    status = napi_get_value_bigint_uint64(env, undefined, &resultValue, &flag);
    NAPI_ASSERT(env, status != napi_ok, "value is undefined, napi_get_value_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_value_bigint_uint64(nullptr, result, &resultValue, &flag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //value is null
    status = napi_get_value_bigint_uint64(env, nullptr, &resultValue, &flag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_get_value_bigint_uint64(env, result, nullptr, &flag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "sign_bit is null, napi_get_value_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //lossless is null
    status = napi_get_value_bigint_uint64(env, result, &resultValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "lossless is null, napi_get_value_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_value_bigint_uint64(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_value_bigint_int64
static napi_value NapiGetValueBigintInt64Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    int64_t resultValue = 0;
    bool flag = false;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //value is undefined
    status = napi_get_value_bigint_int64(env, undefined, &resultValue, &flag);
    NAPI_ASSERT(env, status != napi_ok, "value is undefined, napi_get_value_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_value_bigint_int64(nullptr, result, &resultValue, &flag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_value_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //value is null
    status = napi_get_value_bigint_int64(env, nullptr, &resultValue, &flag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_value_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_get_value_bigint_int64(env, result, nullptr, &flag);
    NAPI_ASSERT(env, status == napi_invalid_arg, "sign_bit is null, napi_get_value_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //lossless is null
    status = napi_get_value_bigint_int64(env, result, &resultValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "lossless is null, napi_get_value_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_value_bigint_int64(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_value_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_bigint_words
static napi_value NapiCreateBigintWordsTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {0ULL, 34ULL, 56ULL, 2ULL};
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //result is undefined
    status = napi_create_bigint_words(env, signBit, wordCount, words, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_create_bigint_words failed.");

    //env is null
    status = napi_create_bigint_words(nullptr, signBit, wordCount, words, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_bigint_words failed.");

    //words is null
    status = napi_create_bigint_words(env, signBit, wordCount, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "words is null, napi_create_bigint_words failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_create_bigint_words(env, signBit, wordCount, words, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "sign_bit is null, napi_create_bigint_words failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_bigint_words(nullptr, signBit, wordCount, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_bigint_words failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_bigint_uint64
static napi_value NapiCreateBigintUint64Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    uint64_t testValue = UINT64_MAX;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //result is undefined
    status = napi_create_bigint_uint64(env, testValue, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_bigint_uint64 failed.");

    //env is null
    status = napi_create_bigint_uint64(nullptr, testValue, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_bigint_uint64 failed.");

    //result is null
    status = napi_create_bigint_uint64(env, testValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "words is null, napi_create_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_bigint_uint64(nullptr, testValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_bigint_uint64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_bigint_int64
static napi_value NapiCreateBigintInt64Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    int64_t testValue = INT64_MAX;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //result is undefined
    status = napi_create_bigint_int64(env, testValue, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_bigint_int64 failed.");

    //env is null
    status = napi_create_bigint_int64(nullptr, testValue, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_bigint_int64 failed.");

    //result is null
    status = napi_create_bigint_int64(env, testValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "words is null, napi_create_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_bigint_int64(nullptr, testValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_bigint_int64 failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_date_value
static napi_value NapiGetDataValueTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    double getTime = false;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //value is undefined
    status = napi_get_date_value(env, undefined, &getTime);
    NAPI_ASSERT(env, status != napi_ok, "result is undefined, napi_get_date_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //env is null
    status = napi_get_date_value(nullptr, result, &getTime);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_date_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //value is null
    status = napi_get_date_value(env, nullptr, &getTime);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_get_date_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_get_date_value(env, result, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_date_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_date_value(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_date_value failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_date
static napi_value NapiCreateDataTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    double time = 202110181203199;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //value is undefined
    status = napi_create_date(env, time, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_date failed.");

    //env is null
    status = napi_create_date(nullptr, time, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_date failed.");

    //result is null
    status = napi_create_date(env, time, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_create_date failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_date(nullptr, time, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_date failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_unref_threadsafe_function
static napi_value NapiUnrefThreadsafeFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_threadsafe_function tsFunc = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //env is null
    status = napi_unref_threadsafe_function(nullptr, tsFunc);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_unref_threadsafe_function failed.");

    //tsFunc is null
    status = napi_unref_threadsafe_function(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "tsFunc is null, napi_unref_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_unref_threadsafe_function(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_unref_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_ref_threadsafe_function
static napi_value NapiRefThreadsafeFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_threadsafe_function tsFunc = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //env is null
    status = napi_ref_threadsafe_function(nullptr, tsFunc);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_ref_threadsafe_function failed.");

    //tsFunc is null
    status = napi_ref_threadsafe_function(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "tsFunc is null, napi_ref_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_ref_threadsafe_function(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_ref_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_release_threadsafe_function
static napi_value NapiReleaseThreadsafeFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    void *data;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //func is null
    status = napi_release_threadsafe_function(nullptr, napi_tsfn_release);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_release_threadsafe_function failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_acquire_threadsafe_function
static napi_value NapiAcquireThreadsafeFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    
    //func is null
    status = napi_acquire_threadsafe_function(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_acquire_threadsafe_function failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_call_threadsafe_function
static napi_value NapiCallThreadsafeFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_threadsafe_function_call_mode blockMode = napi_tsfn_nonblocking;
    static int32_t gSendData = 0;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //func is null
    status = napi_call_threadsafe_function(nullptr, &gSendData, blockMode);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_call_threadsafe_function failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_threadsafe_function_context
static napi_value NapiGetThreadsafeFunctionContextTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_threadsafe_function func;
    void *data;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //func is null
    status = napi_get_threadsafe_function_context(nullptr, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_get_threadsafe_function_context failed.");

    //data is null
    status = napi_get_threadsafe_function_context(func, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_get_threadsafe_function_context failed.");

    //all is null
    status = napi_get_threadsafe_function_context(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_threadsafe_function_context failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_threadsafe_function
static napi_value NapiCreateThreadsafeFunctionTest1(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_finalize thread_finalize_cb;
    napi_value jsCb = nullptr;
    CallbackData *callbackData = nullptr;
    napi_get_cb_info(env, info, &argc, &jsCb, nullptr, reinterpret_cast<void **>(&callbackData));
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "Thread-safe Function Demo", NAPI_AUTO_LENGTH, &resourceName);

    //func is undefined
    status = napi_create_threadsafe_function(env, undefined, result, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb,
                                             callbackData,
                                             CallJsFunc,
                                             &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is undefined, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //async_resource is undefined
    status = napi_create_threadsafe_function(env, jsCb, undefined, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb,
                                             callbackData,
                                             CallJsFunc,
                                             &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg,
                "async_resource is undefined, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //async_resource_name is undefined
    status = napi_create_threadsafe_function(env, jsCb, result, undefined, 0, 1, callbackData,
                                             thread_finalize_cb,
                                             callbackData,
                                             CallJsFunc,
                                             &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg,
                "async_resource_name is undefined, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_threadsafe_function
static napi_value NapiCreateThreadsafeFunctionTest2(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value result = nullptr;

    napi_finalize thread_finalize_cb;
    napi_value jsCb = nullptr;
    CallbackData *callbackData = nullptr;
    napi_get_cb_info(env, info, &argc, &jsCb, nullptr, reinterpret_cast<void **>(&callbackData));
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "Thread-safe Function Demo", NAPI_AUTO_LENGTH, &resourceName);

    //env is null
    status = napi_create_threadsafe_function(nullptr, jsCb, result, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb, callbackData, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_threadsafe_function failed.");

    //func is null
    status = napi_create_threadsafe_function(env, nullptr, result, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb, callbackData, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //async_resource is null
    status = napi_create_threadsafe_function(env, jsCb, nullptr, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb, callbackData, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "async_resource is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //async_resource_name is null
    status = napi_create_threadsafe_function(env, jsCb, result, nullptr, 0, 1, callbackData,
                                             thread_finalize_cb, callbackData, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "async_resource is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //thread_finalize_data is null
    status = napi_create_threadsafe_function(env, jsCb, result, resourceName, 0, 1, nullptr,
                                             thread_finalize_cb, callbackData, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "thread_finalize_data is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_threadsafe_function
static napi_value NapiCreateThreadsafeFunctionTest3(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value result = nullptr;

    napi_finalize thread_finalize_cb;
    napi_value jsCb = nullptr;
    CallbackData *callbackData = nullptr;
    napi_get_cb_info(env, info, &argc, &jsCb, nullptr, reinterpret_cast<void **>(&callbackData));
    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "Thread-safe Function Demo", NAPI_AUTO_LENGTH, &resourceName);

    //thread_finalize_cb is null
    status = napi_create_threadsafe_function(env, jsCb, result, resourceName, 0, 1, callbackData,
                                             nullptr, callbackData, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "thread_finalize_cb is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //context is null
    status = napi_create_threadsafe_function(env, jsCb, result, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb, nullptr, CallJsFunc, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "context is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //call_js_cb is null
    status = napi_create_threadsafe_function(env, jsCb, result, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb, callbackData, nullptr, &callbackData->tsfn);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call_js_cb is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_create_threadsafe_function(env, jsCb, result, resourceName, 0, 1, callbackData,
                                             thread_finalize_cb, callbackData, CallJsFunc, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_threadsafe_function(nullptr, nullptr, nullptr, nullptr, 0, 1, nullptr,
                                             nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_threadsafe_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_uv_event_loop
static napi_value NapiGetUvEventLoopTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    struct uv_loop_s* loop = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_get_uv_event_loop(nullptr, &loop);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_uv_event_loop failed.");

    //loop is null
    status = napi_get_uv_event_loop(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "loop is null, napi_get_uv_event_loop failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_is_promise
static napi_value NapiIsPromiseTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    bool isPromise = false;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //value is undefined
    status = napi_is_promise(env, undefined, &isPromise);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_is_promise failed.");

    //env is null
    status = napi_is_promise(nullptr, result, &isPromise);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_is_promise failed.");

    //value is null
    status = napi_is_promise(env, nullptr, &isPromise);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_is_promise failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //is_promise is null
    status = napi_is_promise(env, result, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "is_promise is null, napi_is_promise failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_is_promise(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_is_promise failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_reject_deferred
static napi_value NapiRejectDeferredTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_deferred deferred;
    napi_value result = nullptr;

    //env is null
    status = napi_reject_deferred(nullptr, deferred, result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_reject_deferred failed.");

    //deferred is null
    status = napi_reject_deferred(env, nullptr, result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "deferred is null, napi_reject_deferred failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_reject_deferred(env, deferred, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_reject_deferred failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_reject_deferred(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_reject_deferred failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_resolve_deferred
static napi_value NapiResolveDeferredTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_deferred deferred;
    napi_value result = nullptr;

    //env is null
    status = napi_resolve_deferred(nullptr, deferred, result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_resolve_deferred failed.");

    //deferred is null
    status = napi_resolve_deferred(env, nullptr, result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "deferred is null, napi_resolve_deferred failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_resolve_deferred(env, deferred, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_resolve_deferred failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_resolve_deferred(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_resolve_deferred failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_promise
static napi_value NapiCreatePromiseTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_deferred deferred;
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //rejection is undefined
    status = napi_create_promise(env, &deferred, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "value is undefined, napi_create_promise failed.");

    //env is null
    status = napi_create_promise(nullptr, &deferred, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_promise failed.");

    //deferred is null
    status = napi_create_promise(env, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "deferred is null, napi_create_promise failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_create_promise(env, &deferred, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_create_promise failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_promise(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_promise failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_version
static napi_value NapiGetVersionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    uint32_t version;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_get_version(nullptr, &version);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_version failed.");

    //version is null
    status = napi_get_version(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "version is null, napi_get_version failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_version(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_version failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_node_version
static napi_value NapiGetNodeVersionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    const napi_node_version* version;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //env is null
    status = napi_get_node_version(nullptr, &version);
    NAPI_ASSERT(env, status == napi_ok, "env is null, napi_get_node_version failed.");

    //version is null
    status = napi_get_node_version(env, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "version is null, napi_get_node_version failed.");

    //all is null
    status = napi_get_node_version(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "all is null, napi_get_node_version failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_close_callback_scope
static napi_value NapiCloseCallbackScopeTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_callback_scope scope = nullptr;

    //env is null
    status = napi_close_callback_scope(nullptr, scope);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_close_callback_scope failed.");

    //scope is null
    status = napi_close_callback_scope(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "version is null, napi_close_callback_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_close_callback_scope(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_close_callback_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_open_callback_scope
static napi_value NapiOpenCallbackScopeTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[1];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_callback_scope scope = nullptr;
    napi_async_context context;

    //env is null
    status = napi_open_callback_scope(nullptr, args[0], context, &scope);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_open_callback_scope failed.");

    //result is null
    status = napi_open_callback_scope(env, args[0], context, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_open_callback_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_open_callback_scope(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_open_callback_scope failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_async_destroy
static napi_value NapiAsyncDestroyTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_async_context asyncContext;

    //env is null
    status = napi_async_destroy(nullptr, asyncContext);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_async_destroy failed.");

    //asyncContext is null
    status = napi_async_destroy(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "asyncContext is null, napi_async_destroy failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_async_destroy(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_async_destroy failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_make_callback
static napi_value NapiMakeCallback1Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value func = args[2];
    napi_value argv[7];
    napi_async_context context;

    //recv is undefined
    status = napi_make_callback(env, context, undefined, func, argc, argv, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "recv is undefined, napi_make_callback failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiMakeCallback2Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 10; // 10 : max arguments.
    size_t n;
    napi_value args[10]; // 10 : max arguments.
    napi_get_cb_info(env, info, &argc, args, NULL, NULL);
    napi_value async_context_wrap = args[0];
    napi_value recv = args[1];
    napi_value argv[7]; // 7 : remain arguments.
    for (n = 3; n < argc; n += 1) { // 3 : reserved arguments.
        argv[n - 3] = args[n]; // 3 : reserved arguments.
    }

    napi_async_context context;
    napi_unwrap(env, async_context_wrap, (void **)&context);
    napi_value result;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //func is undefined
    status = napi_make_callback(env, context, recv, undefined, argc, argv, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "func is undefined, napi_make_callback failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiMakeCallback3Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value recv = args[1];
    napi_value func = args[2];
    napi_value argv[7];
    napi_async_context context;

    //env is null
    status = napi_make_callback(nullptr, context, recv, func, argc, argv, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_make_callback failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiMakeCallback4Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value func = args[2];
    napi_value argv[7];
    napi_async_context context;

    //recv is null
    status = napi_make_callback(env, context, nullptr, func, argc, argv, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "recv is null, napi_make_callback failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiMakeCallback5Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value recv = args[1];
    napi_value argv[7];
    napi_async_context context;

    //func is null
    status = napi_make_callback(env, context, recv, nullptr, argc, argv, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_make_callback failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiMakeCallback6Test(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];
    napi_value result = nullptr;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value recv = args[1];
    napi_value func = args[2];
    napi_async_context context;

    //argv is null
    status = napi_make_callback(env, context, recv, func, argc, nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "argv is null, napi_make_callback failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_async_init
static napi_value NapiAsyncInitTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[2];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value resource = args[0];
    napi_value resourceName;
    napi_create_string_utf8(env, "test_async", NAPI_AUTO_LENGTH, &resourceName);
    napi_async_context context;

    //async_resource is undefined
    status = napi_async_init(env, undefined, resourceName, &context);
    NAPI_ASSERT(env, status == napi_ok, "async_resource is undefined, napi_async_init failed.");


    //env is null
    status = napi_async_init(nullptr, resource, resourceName, &context);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_async_init failed.");

    //async_resource is null
    status = napi_async_init(env, nullptr, resourceName, &context);
    NAPI_ASSERT(env, status == napi_ok, "async_resource is null, napi_async_init failed.");

    //async_resource_name is null
    status = napi_async_init(env, resource, nullptr, &context);
    NAPI_ASSERT(env, status == napi_invalid_arg, "async_resource_name is null, napi_async_init failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_async_init(env, resource, resourceName, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_async_init failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_async_init(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_async_init failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_cancel_async_work
static napi_value NapiCancelAsyncWorkTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_async_work work = nullptr;

    //env is null
    status = napi_cancel_async_work(nullptr, work);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_cancel_async_work failed.");

    //work is null
    status = napi_cancel_async_work(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "work is null, napi_cancel_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_cancel_async_work(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_cancel_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_queue_async_work
static napi_value NapiQueueAsyncWorkTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_async_work work = nullptr;

    //env is null
    status = napi_queue_async_work(nullptr, work);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_queue_async_work failed.");

    //work is null
    status = napi_queue_async_work(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "work is null, napi_queue_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_queue_async_work(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_queue_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_delete_async_work
static napi_value NapiDeleteAsyncWorkTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_async_work work = nullptr;

    //env is null
    status = napi_delete_async_work(nullptr, work);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_delete_async_work failed.");

    //work is null
    status = napi_delete_async_work(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "work is null, napi_delete_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_delete_async_work(nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_delete_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_async_work
static napi_value NapiCreateAsyncWorkTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[2];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    AsyncContext *context = new AsyncContext();
    context->env = env;
    napi_value resourceName;
    napi_value resource = args[0];
    napi_create_string_utf8(env, "add async task", NAPI_AUTO_LENGTH, &resource);

    //resourceName is undefined
    status = napi_create_async_work(env, resource, undefined, [](napi_env env, void *data) {}, completeCb,
        context, &context->asyncWork);
    NAPI_ASSERT(env, status == napi_ok, "resourceName is undefined, napi_create_async_work failed.");

    //env is null
    status = napi_create_async_work(nullptr, resource, resourceName, [](napi_env env, void *data) {}, completeCb,
        context, &context->asyncWork);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_create_async_work failed.");

    //resourceName is null
    status = napi_create_async_work(env, resource, nullptr, [](napi_env env, void *data) {}, completeCb,
        context, &context->asyncWork);
    NAPI_ASSERT(env, status == napi_invalid_arg, "resourceName is null, napi_create_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //execute is null
    status = napi_create_async_work(env, resource, resourceName, nullptr, completeCb,
        context, &context->asyncWork);
    NAPI_ASSERT(env, status == napi_invalid_arg, "execute is null, napi_create_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //complete is null
    status = napi_create_async_work(env, resource, resourceName, [](napi_env env, void *data) {}, nullptr,
        context, &context->asyncWork);
    NAPI_ASSERT(env, status == napi_invalid_arg, "complete is null, napi_create_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    AsyncContext *context1 = new AsyncContext();
    napi_value resourceName1;
    napi_value resource1;
    napi_create_string_utf8(env, "add async task", NAPI_AUTO_LENGTH, &resource1);
    status = napi_create_async_work(env, resource1, resourceName1, [](napi_env env, void *data) {}, completeCb,
        context1, nullptr);
    NAPI_ASSERT(env, status != napi_ok, "result is null, napi_create_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //all is null
    status = napi_create_async_work(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_async_work failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_remove_wrap
static napi_value NapiRemoveWrapTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    const char* tmpTestStr1 = nullptr;
    napi_value instanceValue;

    //js_object is undefined
    status = napi_remove_wrap(env, undefined, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, status == napi_object_expected, "js_object is undefined, napi_remove_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);

    //env is null
    status = napi_remove_wrap(nullptr, instanceValue, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_remove_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //js_object is null
    status = napi_remove_wrap(env, nullptr, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_remove_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_remove_wrap(env, instanceValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_remove_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_remove_wrap(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_remove_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_unwrap
static napi_value NapiUnwrapTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    const char* tmpTestStr1 = nullptr;
    napi_value instanceValue;

    //js_object is undefined
    status = napi_unwrap(env, undefined, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, status == napi_object_expected, "js_object is undefined, napi_unwrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);

    //env is null
    status = napi_unwrap(nullptr, instanceValue, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_unwrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //js_object is null
    status = napi_unwrap(env, nullptr, (void**)&tmpTestStr1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_unwrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_unwrap(env, instanceValue, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_unwrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_unwrap(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_unwrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_wrap
static napi_value NapiWrapTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    const char* testStr = "test";
    void* finalizeHint;
    napi_ref result;
    napi_value instanceValue;

    //js_object is undefined
    status = napi_wrap(
        env, undefined, (void*)testStr, [](napi_env env, void* data, void* hint) {}, finalizeHint, &result);
    NAPI_ASSERT(env, status == napi_object_expected, "js_object is undefined, napi_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);

    //env is null
    status = napi_wrap(
        nullptr, instanceValue, (void*)testStr, [](napi_env env, void* data, void* hint) {}, finalizeHint, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //js_object is null
    status = napi_wrap(
        env, nullptr, (void*)testStr, [](napi_env env, void* data, void* hint) {}, finalizeHint, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //native_object is null
    status = napi_wrap(
        env, instanceValue, nullptr, [](napi_env env, void* data, void* hint) {}, finalizeHint, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "native_object is null, napi_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //finalize_cb is null
    status = napi_wrap(
        env, instanceValue, (void*)testStr, nullptr, finalizeHint, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "finalize_cb is null, napi_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_wrap(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_wrap failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_define_class
static napi_value NapiDefineClassTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    void *data;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_property_descriptor descClass[] = {DECLARE_NAPI_FUNCTION("sayHello", SayHello),};
    napi_value myClass;

    //result is undefined
    status = napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_define_class failed.");

    //env is null
    status = napi_define_class(nullptr, "myClass", NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_define_class failed.");

    //utf8name is null
    status = napi_define_class(env, nullptr, NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "utf8name is null, napi_define_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //constructor is null
    status = napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, nullptr, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "constructor is null, napi_define_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //data is null
    status = napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, MyConstructor, nullptr,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    NAPI_ASSERT(env, status == napi_ok, "data is null, napi_define_class failed.");

    //properties is null
    status = napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), nullptr, &myClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "properties is null, napi_define_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_define_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_define_class(nullptr, "myClass", NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_define_class failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_new_instance
static napi_value NapiNewInstanceTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value customClass;
    napi_value instanceValue;

    //constructor is undefined
    status = napi_new_instance(env, undefined, argc, args, &instanceValue);
    NAPI_ASSERT(env, status == napi_function_expected, "constructor is undefined, napi_new_instance failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_function_expected);

    //env is null
    status = napi_new_instance(nullptr, customClass, argc, args, &instanceValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_new_instance failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //constructor is null
    status = napi_new_instance(env, nullptr, argc, args, &instanceValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "constructor is null, napi_new_instance failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //argv is null
    status = napi_new_instance(env, customClass, argc, nullptr, &instanceValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "argv is null, napi_new_instance failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_new_instance(env, customClass, argc, args, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_new_instance failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_new_instance(nullptr, nullptr, argc, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_new_instance failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_new_target
static napi_value NapiGetNewTargetTest(napi_env env, napi_callback_info info)
{
    napi_status status;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value constructor = nullptr;

    //env is null
    status = napi_get_new_target(nullptr, info, &constructor);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_get_new_target failed.");

    //cbinfo is null
    status = napi_get_new_target(env, nullptr, &constructor);
    NAPI_ASSERT(env, status == napi_invalid_arg, "cbinfo is null, napi_get_new_target failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_get_new_target(env, info, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_get_new_target failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_get_new_target(nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_new_target failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_get_cb_info
static napi_value NapiGetCbInfoTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[2];

    void *data;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value thisVar = nullptr;

    //argv is undefined
    status = napi_get_cb_info(env, info, &argc, &undefined, &thisVar, &data);
    NAPI_ASSERT(env, status == napi_ok, "argv is undefined, napi_get_cb_info failed.");

    //this_arg is undefined
    status = napi_get_cb_info(env, info, &argc, args, &undefined, &data);
    NAPI_ASSERT(env, status == napi_ok, "this_arg is undefined, napi_get_cb_info failed.");

    //env is null
    status = napi_get_cb_info(nullptr, info, &argc, args, &thisVar, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "cbinfo is null, napi_get_cb_info failed.");

    //cbinfo is null
    status = napi_get_cb_info(env, nullptr, &argc, args, &thisVar, &data);
    NAPI_ASSERT(env, status == napi_invalid_arg, "cbinfo is null, napi_get_cb_info failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //argc is null
    status = napi_get_cb_info(env, info, nullptr, args, &thisVar, &data);
    NAPI_ASSERT(env, status == napi_ok, "argc is null, napi_get_cb_info failed.");

    //argv is null
    status = napi_get_cb_info(env, info, &argc, nullptr, &thisVar, &data);
    NAPI_ASSERT(env, status == napi_ok, "argv is null, napi_get_cb_info failed.");

    //this_arg is null
    status = napi_get_cb_info(env, info, &argc, args, nullptr, &data);
    NAPI_ASSERT(env, status == napi_ok, "this_arg is null, napi_get_cb_info failed.");

    //data is null
    status = napi_get_cb_info(env, info, &argc, args, &thisVar, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "data is null, napi_get_cb_info failed.");

    //all is null
    status = napi_get_cb_info(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_get_cb_info failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_create_function
static napi_value NapiCreateFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;

    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    napi_value funcValue = nullptr;

    //result is undefined
    status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, SayHello, &argc, &undefined);
    NAPI_ASSERT(env, status == napi_ok, "result is undefined, napi_create_function failed.");

    //env is null
    status = napi_create_function(nullptr, "func", NAPI_AUTO_LENGTH, SayHello, &argc, &funcValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "cbinfo is null, napi_create_function failed.");

    //utf8name is null
    status = napi_create_function(env, nullptr, NAPI_AUTO_LENGTH, SayHello, &argc, &funcValue);
    NAPI_ASSERT(env, status == napi_ok, "cbinfo is null, napi_create_function failed.");

    //cb is null
    status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, nullptr, &argc, &funcValue);
    NAPI_ASSERT(env, status == napi_invalid_arg, "cb is null, napi_create_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //data is null
    status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, SayHello, nullptr, &funcValue);
    NAPI_ASSERT(env, status == napi_ok, "argv is null, napi_create_function failed.");

    //result is null
    status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, SayHello, &argc, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "this_arg is null, napi_create_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_create_function(nullptr, nullptr, NAPI_AUTO_LENGTH, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_create_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_call_function
static napi_value NapiCallFunctionTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    napi_value result = nullptr;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //func is undefined
    status = napi_call_function(env, args[0], undefined, 0, &result, &result);
    NAPI_ASSERT(env, status == napi_function_expected, "func is undefined, napi_call_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_function_expected);

    //env is null
    status = napi_call_function(nullptr, args[0], args[0], 0, &result, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_call_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //func is null
    status = napi_call_function(env, args[0], nullptr, 0, &result, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "func is null, napi_call_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //argv is null
    status = napi_call_function(env, args[0], args[0], 0, nullptr, &result);
    NAPI_ASSERT(env, status != napi_ok, "argv is null, napi_call_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //result is null
    status = napi_call_function(env, args[0], args[0], 0, &result, nullptr);
    NAPI_ASSERT(env, status != napi_ok, "result is null, napi_call_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status != napi_ok);

    //all is null
    status = napi_call_function(nullptr, nullptr, nullptr, 0, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_call_function failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//napi_check_object_type_tag
static napi_value NapiCheckObjectTypeTagTest(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value args[2];
    bool result;
    //undefined
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);

    //value is undefined
    status = napi_check_object_type_tag(env, undefined, &typeTags[0], &result);
    NAPI_ASSERT(env, status == napi_object_expected, "value is undefined, napi_check_object_type_tag failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_object_expected);

    //env is null
    status = napi_check_object_type_tag(nullptr, args[1], &typeTags[0], &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_check_object_type_tag failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //value is null
    status = napi_check_object_type_tag(env, nullptr, &typeTags[0], &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "value is null, napi_check_object_type_tag failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //type_tag is null
    status = napi_check_object_type_tag(env, args[1], nullptr, &result);
    NAPI_ASSERT(env, status == napi_invalid_arg, "type_tag is null, napi_check_object_type_tag failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //result is null
    status = napi_check_object_type_tag(env, args[1], &typeTags[0], nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "result is null, napi_check_object_type_tag failed.");
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    //all is null
    status = napi_check_object_type_tag(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "all is null, napi_check_object_type_tag failed."); 
    NAPI_CHECK_GET_LAST_ERROR_INFO(env, status == napi_invalid_arg);

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}
static napi_value NapiWrapEnhanceTest(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    auto status = napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_define_class failed.");
    napi_value obj = nullptr;
    status = napi_new_instance(env, testClass, 0, nullptr, &obj);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_new_instance failed.");
    const char testStr[5] = "test";
    napi_ref wrappedRef = nullptr;
    status = napi_wrap_enhance(env, obj, (void*)testStr, [](napi_env env, void* data, void* hint) {}, false, nullptr, sizeof(testStr), &wrappedRef);
    NAPI_ASSERT(env, status == napi_ok, "result is null, napi_wrap_enhance failed.");
    
    napi_value rst;
    napi_create_int32(env, 1, &rst);
    return rst;
}

static napi_value DestroyEnvByNull(napi_env env, napi_callback_info info)
{
    auto status = napi_destroy_ark_context(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "napi_destroy_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value CreateEnv(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(env, &newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value CreateEnvByNotContextEnv(napi_env env, napi_callback_info info)
{
    auto status = napi_create_ark_context(env, nullptr);
    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value DestroyEnv(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(env, &newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context failed.");

    status = napi_destroy_ark_context(newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_destroy_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value CreateEnvByEnvContext(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(env, &newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context failed.");

    napi_env newEnv1 = nullptr;
    status = napi_create_ark_context(newEnv, &newEnv1);
    NAPI_ASSERT(env, status == napi_invalid_arg, "napi_create_ark_context by NewEnv failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value CreateEnvByEnvIsNull(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(nullptr, &newEnv);
    NAPI_ASSERT(env, status == napi_invalid_arg, "napi_create_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value UseContext(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(env, &newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context failed.");

    const char16_t *str = u"你好, World!, successes to create UTF-16 string!";
    size_t length =  NAPI_AUTO_LENGTH;
    napi_value result = nullptr;
    status = napi_create_string_utf16(newEnv, str, length, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_string_utf16 failed.");

    status = napi_destroy_ark_context(newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_destroy_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value UseMutilContext(napi_env env, napi_callback_info info)
{
    napi_env newEnv1 = nullptr;
    auto status = napi_create_ark_context(env, &newEnv1);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context1 failed.");

    napi_env newEnv2 = nullptr;
    status = napi_create_ark_context(env, &newEnv2);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context2 failed.");

    uint32_t nativeInt1 = NAPI_NATIVE_VALUE1;
    napi_value jsInt1;
    status = napi_create_uint32(newEnv1, nativeInt1, &jsInt1);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed.");

    uint32_t nativeInt2 = NAPI_NATIVE_VALUE2;
    napi_value jsInt2;
    status = napi_create_uint32(newEnv2, nativeInt2, &jsInt2);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed.");

    uint32_t nativeInt11;
    status = napi_get_value_uint32(env, jsInt1, &nativeInt11);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_uint32 failed.");

    uint32_t nativeInt22;
    status = napi_get_value_uint32(env, jsInt2, &nativeInt22);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_uint32 failed.");

    NAPI_ASSERT(env, nativeInt11 == NAPI_NATIVE_VALUE1 && nativeInt22 == NAPI_NATIVE_VALUE2,
                "nativeInt11 != nativeInt22.");

    status = napi_destroy_ark_context(newEnv1);
    NAPI_ASSERT(env, status == napi_ok, "napi_destroy_ark_context failed.");

    status = napi_destroy_ark_context(newEnv2);
    NAPI_ASSERT(env, status == napi_ok, "napi_destroy_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value SwitchEnv(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(env, &newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context failed.");

    status = napi_switch_ark_context(env);
    NAPI_ASSERT(env, status == napi_ok, "napi_switch_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value SwitchEnvByNull(napi_env env, napi_callback_info info)
{
    auto status = napi_switch_ark_context(nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "napi_switch_ark_context failed.");
    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

static napi_value SwitchEnvByNewEnv(napi_env env, napi_callback_info info)
{
    napi_env newEnv = nullptr;
    auto status = napi_create_ark_context(env, &newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_ark_context failed.");

    status = napi_switch_ark_context(newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_switch_ark_context failed.");

    status = napi_switch_ark_context(env);
    NAPI_ASSERT(env, status == napi_ok, "napi_switch_ark_context failed.");

    status = napi_destroy_ark_context(newEnv);
    NAPI_ASSERT(env, status == napi_ok, "napi_destroy_ark_context failed.");

    napi_value res;
    napi_get_boolean(env, true, &res);
    return res;
}

//Normal scenario: Synchronize binding of string type object test cases
static napi_value NapiWrapEnhanceTest1(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value obj = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &obj);
    const char* testStr = "test";
    napi_ref wrappedRef = nullptr;
    void* finalizeHint;
    size_t testStrSize = sizeof(char) * (strlen(testStr) + 1);
    napi_status status = napi_wrap_enhance(env, obj, (void*)testStr, 
                      [](napi_env env, void* data, void* hint) {}, false, finalizeHint, testStrSize, &wrappedRef);
    NAPI_ASSERT(env, status == napi_ok, "napi_wrap_enhance is normal, return status napi_ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Normal scenario: Synchronize binding of number type object test cases
static napi_value NapiWrapEnhanceTest2(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    int* number = new int(42);
    napi_status status = napi_wrap_enhance(
         env, jsObject, number,
         [](napi_env env, void* data, void* hint) {
             delete  static_cast<int*>(data);
         },
         false, nullptr, sizeof(int), nullptr);
    NAPI_ASSERT(env, status == napi_ok, "napi_wrap_enhance is normal, return status napi_ok."); 

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Normal scenario: Asynchronous binding of complex object test cases
static napi_value NapiWrapEnhanceTest3(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    napi_property_descriptor descClass[] = {DECLARE_NAPI_FUNCTION("sayHello", SayHello)};
    napi_value myClass;
    void *data;
    napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, MyConstructor, data,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    napi_status status = napi_wrap_enhance(
        env, jsObject, myClass,
        [](napi_env env, void* data, void* hint){}, true, nullptr, sizeof(myClass), nullptr);
    NAPI_ASSERT(env, status == napi_ok, "napi_wrap_enhance is normal, return status napi_ok.");     

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Parameter validity test: Each parameter value is null
static napi_value NapiWrapEnhanceTest4(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value obj = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &obj);
    const char* testStr = "test";
    napi_ref wrappedRef = nullptr;
    void* finalizeHint;
    size_t testStrSize = sizeof(char) * (strlen(testStr) + 1);
    // env is null
    napi_status status = napi_wrap_enhance(nullptr, obj, (void*)testStr, 
                      [](napi_env env, void* data, void* hint) {}, false, finalizeHint, testStrSize, &wrappedRef);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap_enhance failed.");
    // js_object is null
    status = napi_wrap_enhance(env, nullptr, (void*)testStr, 
                      [](napi_env env, void* data, void* hint) {}, false, finalizeHint, testStrSize, &wrappedRef);
    NAPI_ASSERT(env, status == napi_invalid_arg, "js_object is null, napi_wrap_enhance failed.");
    // native_object is null
    status = napi_wrap_enhance(env, obj, nullptr, 
                      [](napi_env env, void* data, void* hint) {}, false, finalizeHint, testStrSize, &wrappedRef);
    NAPI_ASSERT(env, status == napi_invalid_arg, "native_object is null, napi_wrap_enhance failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiWrapEnhanceTest5(napi_env env, napi_callback_info info)
{
    napi_value testClass = nullptr;
    napi_define_class(
        env, "TestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);
            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value obj = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &obj);
    const char* testStr = "test";
    napi_ref wrappedRef = nullptr;
    void* finalizeHint;
    size_t testStrSize = sizeof(char) * (strlen(testStr) + 1);

    // finalize_hint is null
    napi_status status = napi_wrap_enhance(nullptr, obj, (void*)testStr, 
                      [](napi_env env, void* data, void* hint) {}, false, nullptr, testStrSize, &wrappedRef);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap_enhance failed.");
    // result is null
    status = napi_wrap_enhance(nullptr, obj, (void*)testStr, 
                      [](napi_env env, void* data, void* hint) {}, false, finalizeHint, testStrSize, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap_enhance failed.");
    // all is null
    status = napi_wrap_enhance(nullptr, nullptr, nullptr, nullptr, false, nullptr, testStrSize, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is null, napi_wrap_enhance failed.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Callback function test, synchronized callback execution successful
static napi_value NapiWrapEnhanceTest6(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    bool callbackCalled = false;
    int* number = new int(42);
    napi_status status = napi_wrap_enhance(
         env, jsObject, number,
         [](napi_env env, void* data, void* hint) {
             *static_cast<bool*>(hint) = true;
             delete static_cast<int*>(data);
         },
         false, &callbackCalled, sizeof(int), nullptr);
    NAPI_ASSERT(env, status == napi_ok, "parameter is normal, napi_wrap_enhance ok.");
    
    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Callback function test, asynchronous callback execution successful
static napi_value NapiWrapEnhanceTest7(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    std::atomic<bool> callbackCalled(false);
    napi_property_descriptor descClass[] = {DECLARE_NAPI_FUNCTION("sayHello", SayHello)};
    napi_value myClass;
    void *data;

    napi_status status = napi_wrap_enhance(
         env, jsObject, myClass,
         [](napi_env env, void* data, void* hint) {
             auto* flag = static_cast<std::atomic<bool>*>(hint);
             flag->store(true);
         },
         true, &callbackCalled, sizeof(myClass), nullptr);
    NAPI_ASSERT(env, status == napi_ok, "parameter is normal, napi_wrap_enhance ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Reference management test cases, obtaining and managing references
static napi_value NapiWrapEnhanceTest8(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    int* number = new int(42);
    napi_ref ref = nullptr;
    napi_status status = napi_wrap_enhance(
        env, jsObject, number,
        [](napi_env env, void* data, void* hint) {
            delete static_cast<int*>(data);
        },
        false, nullptr, sizeof(int), &ref);
    NAPI_ASSERT(env, status == napi_ok, "parameter is normal, napi_wrap_enhance ok.");
    //Using References
    napi_value referencedObject;
    napi_get_reference_value(env, ref, &referencedObject);
    //clean
    status = napi_delete_reference(env, ref);
    NAPI_ASSERT(env, status == napi_ok, "delete reference, result is ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Exception handling test case, called when there are uncaught exceptions
static napi_value NapiWrapEnhanceTest9(napi_env env, napi_callback_info info)
{
    //Create an uncaught exception
    napi_value error;
    napi_create_string_utf8(env, "Test error", NAPI_AUTO_LENGTH, &error);
    napi_throw(env, error);

    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    int number = 42;
    napi_status status = napi_wrap_enhance(env, jsObject, &number, nullptr, false, nullptr, sizeof(int), nullptr);
    NAPI_ASSERT(env, status == napi_ok, "exist abnormal, napi_wrap_enhance return napi_pending_exception.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Boundary condition test case, zero size binding
static napi_value NapiWrapEnhanceTest10(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    int number = 42;
    napi_status status = napi_wrap_enhance(
        env, jsObject, &number,
        nullptr, false, nullptr, 0, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "parameter is size 0, napi_wrap_enhance return napi_ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Boundary condition test case, binding of super large objects
static napi_value NapiWrapEnhanceTest11(napi_env env, napi_callback_info info)
{
    napi_value jsObject = nullptr;
    napi_create_object(env, &jsObject);
    const size_t largeSize = 1024 * 1024;//1MB
    void* largeData = malloc(largeSize);
    napi_status status = napi_wrap_enhance(
        env, jsObject, largeData,
        [](napi_env env, void* data, void* hint) {
            free(data);
        },
        false, nullptr, largeSize, nullptr);
    NAPI_ASSERT(env, status == napi_ok, "parameter is size 1MB, napi_wrap_enhance return napi_ok.");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

//Comprehensive test cases, multi object binding testing
static napi_value NapiWrapEnhanceTest12(napi_env env, napi_callback_info info)
{
    const int objectCount = 18;
    std::vector<napi_value> jsObjects(objectCount);
    std::vector<napi_ref> refs(objectCount);
    for(int i = 0; i < objectCount; ++i) {
        napi_create_object(env, &jsObjects[i]);
        auto* data = new int(i);
        napi_status status = napi_wrap_enhance(
            env, jsObjects[i], data,
            [](napi_env env, void* data, void* hint) {
                delete static_cast<int*>(data);
            },
            i % 2 == 0, //Alternating between synchronous and asynchronous use
            nullptr, sizeof(int), &refs[i]);
        NAPI_ASSERT(env, status == napi_ok, "parameter is normal, napi_wrap_enhance return napi_ok.");
    }
    //clean
    for(auto ref:refs) {
        napi_status status = napi_delete_reference(env, ref);
        NAPI_ASSERT(env, status == napi_ok, "delete reference, napi_delete_reference return napi_ok.");
    }

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static void StringFinalizerASCII(void* data, void* hint)
{
    // 释放外部资源
    delete[] static_cast<char*>(data);
}

static napi_value NapiCreateExternalStringAscii(napi_env env, napi_callback_info info)
{
    const char source[] = "hello, World!, successes to create ASCII string! 111";
    napi_value result = nullptr;
    int charLength = sizeof(source) / sizeof(char);
    char* str = new char[charLength];
    std::copy(source, source + charLength, str);

    napi_status status = napi_create_external_string_ascii(
        env,
        str,
        NAPI_AUTO_LENGTH,
        StringFinalizerASCII,
        nullptr,
        &result
    );

    NAPI_ASSERT(env, status == napi_ok, "napi_create_external_string_ascii");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static void StringFinalizerUTF16(void* data, void* hint)
{
    // 释放外部资源
    delete[] static_cast<char16_t*>(data);
}

static napi_value NapiCreateExternalStringUtf16(napi_env env, napi_callback_info info)
{
    const char16_t source[] = u"你好, World!, successes to create UTF-16 string! 111";
    napi_value result = nullptr;
    int char16tLength = sizeof(source) / sizeof(char16_t);
    char16_t* str = new char16_t[char16tLength];
    std::copy(source, source + char16tLength, str);

    napi_status status = napi_create_external_string_utf16(
        env,
        str,
        NAPI_AUTO_LENGTH,
        StringFinalizerUTF16,
        nullptr,
        &result
    );
    NAPI_ASSERT(env, status == napi_ok, "napi_create_external_string_utf16");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiCreateStrongSendableRef(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_value sObj = nullptr;
    napi_sendable_ref ref = nullptr;

    napi_status status = napi_create_array(env, &obj);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_array");
    status = napi_create_sendable_array(env, &sObj);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_sendable_array");

    status = napi_create_strong_sendable_reference(nullptr, sObj, &ref);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_create_sendable_array p1");
    status = napi_create_strong_sendable_reference(env, nullptr, &ref);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_create_sendable_array p2");

    status = napi_create_strong_sendable_reference(env, sObj, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_create_sendable_array p3");

    status = napi_create_strong_sendable_reference(env, obj, &ref);
    NAPI_ASSERT(env, status == napi_object_expected, "call napi_create_sendable_array p4");
    NAPI_ASSERT(env, ref == nullptr, "call napi_create_sendable_array p5");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiGetStrongSendableRef(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_value sObj = nullptr;
    napi_sendable_ref ref = nullptr;

    napi_status status = napi_create_array(env, &obj);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_array");
    status = napi_create_sendable_array(env, &sObj);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_sendable_array");

    status = napi_create_strong_sendable_reference(env, sObj, &ref);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_strong_sendable_reference");
    NAPI_ASSERT(env, ref != nullptr, "call napi_create_strong_sendable_reference ref");

    napi_value value = nullptr;
    status = napi_get_strong_sendable_reference_value(nullptr, ref, &value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_get_strong_sendable_reference_value p1");

    status = napi_get_strong_sendable_reference_value(env, nullptr, &value);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_get_strong_sendable_reference_value p2");

    status = napi_get_strong_sendable_reference_value(env, ref, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_get_strong_sendable_reference_value p3");

    status = napi_delete_strong_sendable_reference(env, ref);
    NAPI_ASSERT(env, status == napi_ok, "call napi_delete_strong_sendable_reference");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_value NapiDelStrongSendableRef(napi_env env, napi_callback_info info)
{
    napi_value obj = nullptr;
    napi_value sObj = nullptr;
    napi_sendable_ref ref = nullptr;

    napi_status status = napi_create_array(env, &obj);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_array");
    status = napi_create_sendable_array(env, &sObj);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_sendable_array");

    status = napi_create_strong_sendable_reference(env, sObj, &ref);
    NAPI_ASSERT(env, status == napi_ok, "call napi_create_strong_sendable_reference");
    NAPI_ASSERT(env, ref != nullptr, "call napi_create_strong_sendable_reference ref");

    status = napi_delete_strong_sendable_reference(nullptr, ref);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_delete_strong_sendable_reference p1");
    status = napi_delete_strong_sendable_reference(env, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "call napi_delete_strong_sendable_reference p2");

    status = napi_delete_strong_sendable_reference(env, ref);
    NAPI_ASSERT(env, status == napi_ok, "call napi_delete_strong_sendable_reference");

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

// napi_throw_business_error
// 1.Normal function
static napi_value NapiThrowBusinessError(napi_env env,napi_callback_info info)
{
    NAPI_CALL(env, napi_throw_business_error(env, INT_ARG_100, "Error Message"));
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

// 2. Error parameter test
static napi_value NapiThrowBusinessErrorPar(napi_env env, napi_callback_info info)
{
    // env is nullptr
    napi_status status = napi_throw_business_error(nullptr, INT_ARG_100, "napi_throw_business_error env is nullptr");
    NAPI_ASSERT(env, status == napi_invalid_arg, "env is nullptr, napi_throw_business_error failed.");

    // msg is nullptr
    status = napi_throw_business_error(env, INT_ARG_100, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "msg is nullptr, napi_throw_business_error failed.");
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

// 3. Pending exception test
static napi_value NapiThrowBusinessErrorPendingError(napi_env env, napi_callback_info info)
{
    napi_throw_business_error(env, INT_ARG_100, "This is a pre-existing exception");
    napi_status status = napi_throw_business_error(env, INT_ARG_100, "error message");
    NAPI_ASSERT(env, status == napi_pending_exception, "napi_throw_business_error not napi_pending_exception");

    napi_value error;
    status = napi_get_and_clear_last_exception(env, &error);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_and_clear_last_exception failed.");

    status = napi_throw_business_error(env, INT_ARG_100, "error message after clear");
    NAPI_ASSERT(env, status == napi_ok, "napi_throw_business_error after clear failed.");

    status = napi_get_and_clear_last_exception(env, &error);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_and_clear_last_exception failed.");

    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    napi_value theValue;
    CallbackData *callbackData = new CallbackData();
    NAPI_CALL(env, napi_create_string_utf8(env, TEST_STR, sizeof(TEST_STR), &theValue));
    NAPI_CALL(env, napi_set_named_property(env, exports, "testStr", theValue));
    napi_property_descriptor properties[] = {
        DECLARE_NAPI_FUNCTION("DestroyEnvByNull", DestroyEnvByNull),
        DECLARE_NAPI_FUNCTION("CreateEnv", CreateEnv),
        DECLARE_NAPI_FUNCTION("CreateEnvByNotContextEnv", CreateEnvByNotContextEnv),
        DECLARE_NAPI_FUNCTION("DestroyEnv", DestroyEnv),
        DECLARE_NAPI_FUNCTION("CreateEnvByEnvContext", CreateEnvByEnvContext),
        DECLARE_NAPI_FUNCTION("CreateEnvByEnvIsNull", CreateEnvByEnvIsNull),
        DECLARE_NAPI_FUNCTION("UseContext", UseContext),
        DECLARE_NAPI_FUNCTION("UseMutilContext", UseMutilContext),
        DECLARE_NAPI_FUNCTION("SwitchEnv", SwitchEnv),
        DECLARE_NAPI_FUNCTION("SwitchEnvByNull", SwitchEnvByNull),
        DECLARE_NAPI_FUNCTION("SwitchEnvByNewEnv", SwitchEnvByNewEnv),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest", NapiWrapEnhanceTest),
        DECLARE_NAPI_FUNCTION("getLastErrorInfo", getLastErrorInfo),
        DECLARE_NAPI_FUNCTION("cleanUpErrorInfo", cleanUpErrorInfo),
        DECLARE_NAPI_FUNCTION("throwExistingError", throwExistingError),
        DECLARE_NAPI_FUNCTION("throwError", throwError),
        DECLARE_NAPI_FUNCTION("throwTypeError", throwTypeError),
        DECLARE_NAPI_FUNCTION("throwRangeError", throwRangeError),
        DECLARE_NAPI_FUNCTION("isError", isError),
        DECLARE_NAPI_FUNCTION("createError", createError),
        DECLARE_NAPI_FUNCTION("createTypeError", createTypeError),
        DECLARE_NAPI_FUNCTION("createRangeError", createRangeError),
        DECLARE_NAPI_FUNCTION("getAndClearLastException", getAndClearLastException),
        DECLARE_NAPI_FUNCTION("isExceptionPending", isExceptionPending),
        DECLARE_NAPI_FUNCTION("openAndCloseHandleScope", openAndCloseHandleScope),
        DECLARE_NAPI_FUNCTION("openAndCloseEscapableHandleScope", openAndCloseEscapableHandleScope),
        DECLARE_NAPI_FUNCTION("createReference", createReference),
        DECLARE_NAPI_FUNCTION("getAndDeleteReference", getAndDeleteReference),
        DECLARE_NAPI_FUNCTION("referenceRefAndUnref", referenceRefAndUnref),
        DECLARE_NAPI_FUNCTION("createArrayAndGetLength", createArrayAndGetLength),
        DECLARE_NAPI_FUNCTION("getArrayWithLength", getArrayWithLength),
        DECLARE_NAPI_FUNCTION("createExternal", createExternal),
        DECLARE_NAPI_FUNCTION("createExternalArraybuffer", createExternalArraybuffer),
        DECLARE_NAPI_FUNCTION("createObject", createObject),
        DECLARE_NAPI_FUNCTION("createSymbol", createSymbol),
        DECLARE_NAPI_FUNCTION("createTypeArray", createTypeArray),
        DECLARE_NAPI_FUNCTION("createDataView", createDataView),
        DECLARE_NAPI_FUNCTION("createAndGetInt32", createAndGetInt32),
        DECLARE_NAPI_FUNCTION("createAndGetUInt32", createAndGetUInt32),
        DECLARE_NAPI_FUNCTION("createAndGetInt64", createAndGetInt64),
        DECLARE_NAPI_FUNCTION("createDouble", createDouble),
        DECLARE_NAPI_FUNCTION("createAndGetStringLatin1", createAndGetStringLatin1),
        DECLARE_NAPI_FUNCTION("createAndGetStringUtf8", createAndGetStringUtf8),
        DECLARE_NAPI_FUNCTION("getPrototype", getPrototype),
        DECLARE_NAPI_FUNCTION("getPrototype2", getPrototype2),
        DECLARE_NAPI_FUNCTION("getTypedArrayInfo", getTypedArrayInfo),
        DECLARE_NAPI_FUNCTION("getDataViewInfo", getDataViewInfo),
        DECLARE_NAPI_FUNCTION("getValueBool", getValueBool),
        DECLARE_NAPI_FUNCTION("getValueDouble", getValueDouble),
        DECLARE_NAPI_FUNCTION("getValueExternal", getValueExternal),
        DECLARE_NAPI_FUNCTION("getNull", getNull),
        DECLARE_NAPI_FUNCTION("getUndefined", getUndefined),
        DECLARE_NAPI_FUNCTION("coerceToBool", coerceToBool),
        DECLARE_NAPI_FUNCTION("coerceToNumber", coerceToNumber),
        DECLARE_NAPI_FUNCTION("coerceToObject", coerceToObject),
        DECLARE_NAPI_FUNCTION("coerceToString", coerceToString),
        DECLARE_NAPI_FUNCTION("instanceOf", instanceOf),
        DECLARE_NAPI_FUNCTION("NapiIsSendable", NapiIsSendable),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClass", NapiDefineSendableClass),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableObject", NapiCreateSendableObject),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableArray", NapiCreateSendableArray),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableArrayWithLength", NapiCreateSendableArrayWithLength),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableArrayBuffer", NapiCreateSendableArrayBuffer),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableTypedArray", NapiCreateSendableTypedArray),
        DECLARE_NAPI_FUNCTION("NapiWrapSendable", NapiWrapSendable),
        DECLARE_NAPI_FUNCTION("NapiWrapSendableWithSize", NapiWrapSendableWithSize),
        DECLARE_NAPI_FUNCTION("NapiUnwrapSendable", NapiUnwrapSendable),
        DECLARE_NAPI_FUNCTION("NapiRemoveWrapSendable", NapiRemoveWrapSendable),
        DECLARE_NAPI_FUNCTION("isArray", isArray),
        DECLARE_NAPI_FUNCTION("isDate", isDate),
        DECLARE_NAPI_FUNCTION("strictEquals", strictEquals),
        DECLARE_NAPI_FUNCTION("getPropertyNames", getPropertyNames),
        DECLARE_NAPI_FUNCTION("setProperty", setProperty),
        DECLARE_NAPI_FUNCTION("getProperty", getProperty),
        DECLARE_NAPI_FUNCTION("hasProperty", hasProperty),
        DECLARE_NAPI_FUNCTION("setAndDeleteProperty", setAndDeleteProperty),
        DECLARE_NAPI_FUNCTION("hasOwnProperty", hasOwnProperty),
        DECLARE_NAPI_FUNCTION("setNamedProperty", setNamedProperty),
        DECLARE_NAPI_FUNCTION("getNamedProperty", getNamedProperty),
        DECLARE_NAPI_FUNCTION("hasNamedProperty", hasNamedProperty),
        DECLARE_NAPI_FUNCTION("setElement", setElement),
        DECLARE_NAPI_FUNCTION("getElement", getElement),
        DECLARE_NAPI_FUNCTION("hasElement", hasElement),
        DECLARE_NAPI_FUNCTION("deleteElement", deleteElement),
        DECLARE_NAPI_FUNCTION("defineProperties", defineProperties),
        DECLARE_NAPI_FUNCTION("wrap", wrap),
        DECLARE_NAPI_FUNCTION("unwrap", unwrap),
        DECLARE_NAPI_FUNCTION("removeWrap", removeWrap),
        DECLARE_NAPI_FUNCTION("getVersion", getVersion),
        DECLARE_NAPI_FUNCTION("createPromise", createPromise),
        DECLARE_NAPI_FUNCTION("resolveAndRejectDeferred", resolveAndRejectDeferred),
        DECLARE_NAPI_FUNCTION("isPromise", isPromise),
        DECLARE_NAPI_FUNCTION("TestLatin1", TestLatin1),
        DECLARE_NAPI_FUNCTION("TestUtf16", TestUtf16),
        DECLARE_NAPI_FUNCTION("TestUtf8", TestUtf8),
        DECLARE_NAPI_FUNCTION("runScript", runScript),
        DECLARE_NAPI_FUNCTION("getUvEventLoop", getUvEventLoop),
        DECLARE_NAPI_FUNCTION("napCreateArrayBuffer", napCreateArrayBuffer),
        DECLARE_NAPI_FUNCTION("naiGetArrayBufferInfo", naiGetArrayBufferInfo),
        DECLARE_NAPI_FUNCTION("napiDefineClass", napiDefineClass),
        DECLARE_NAPI_FUNCTION("napiRunScriptPath", napiRunScriptPath),
        DECLARE_NAPI_FUNCTION("napiGetNodeVersion", napiGetNodeVersion),
        DECLARE_NAPI_FUNCTION("napiCallThreadsafeFunction", napiCallThreadsafeFunction),
        DECLARE_NAPI_FUNCTION("napiCreateThreadsafeFunction", napiCreateThreadsafeFunction),
        DECLARE_NAPI_FUNCTION("napiRefthreadSafeFunction", napiRefthreadSafeFunction),
        DECLARE_NAPI_FUNCTION("napiCreateDate", napiCreateDate),
        DECLARE_NAPI_FUNCTION("napiCreateBigintUint64", napiCreateBigintUint64),
        DECLARE_NAPI_FUNCTION("napiCreateBigintInt64", napiCreateBigintInt64),
        DECLARE_NAPI_FUNCTION("napiCreateBigintWords", napiCreateBigintWords),
        DECLARE_NAPI_FUNCTION("napiGetCbInfo", napiGetCbInfo),
        DECLARE_NAPI_FUNCTION("checkTypeTag", CheckTypeTag),
        DECLARE_NAPI_FUNCTION("typeTaggedInstance", TypeTaggedInstance),
        DECLARE_NAPI_FUNCTION("stringUtf16OfCase", StringUtf16OfCase),
        DECLARE_NAPI_FUNCTION("createAndGetStringUtf16", CreateAndGetStringUtf16),
        { "napiCancelAsyncWork", nullptr, napiCancelAsyncWork, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testAsyncWork", nullptr, testAsyncWork, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPromise", nullptr, testPromise, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "napiCreateFunction", nullptr, napiCreateFunction, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "NapiCreateFunctionTwo", nullptr, NapiCreateFunctionTwo, nullptr, nullptr, nullptr, napi_default, nullptr },
        DECLARE_NAPI_FUNCTION("getGlobal", getGlobal),
        DECLARE_NAPI_FUNCTION("callFunction", callFunction),
        DECLARE_NAPI_FUNCTION("ThreadSafeTest", ThreadSafeTest),
        DECLARE_NAPI_FUNCTION("CreateBuffer", CreateBuffer),
        DECLARE_NAPI_FUNCTION("CreateExternalBuffer", CreateExternalBuffer),
        DECLARE_NAPI_FUNCTION("BufferCopy", BufferCopy),
        DECLARE_NAPI_FUNCTION("IsBuffer", IsBuffer),
        DECLARE_NAPI_FUNCTION("GetBufferInfo", GetBufferInfo),
        DECLARE_NAPI_FUNCTION("GetAllPropertyNames", GetAllPropertyNames),
        DECLARE_NAPI_FUNCTION("GetSymbolNames", GetSymbolNames),
        DECLARE_NAPI_FUNCTION("GetEnumerableWritableNames", GetEnumerableWritableNames),
        DECLARE_NAPI_FUNCTION("GetOwnWritableNames", GetOwnWritableNames),
        DECLARE_NAPI_FUNCTION("GetEnumerableConfigurableNames", GetEnumerableConfigurableNames),
        DECLARE_NAPI_FUNCTION("GetOwnConfigurableNames", GetOwnConfigurableNames),
        DECLARE_NAPI_FUNCTION("FreezeTest", FreezeTest),
        DECLARE_NAPI_FUNCTION("SealTest", SealTest),
        DECLARE_NAPI_FUNCTION("StaticBuffer", StaticBuffer),
        DECLARE_NAPI_FUNCTION("External", External),
        DECLARE_NAPI_FUNCTION("DetachTest", DetachTest),
        DECLARE_NAPI_FUNCTION("IsDetachedTest", IsDetachedTest),
        DECLARE_NAPI_FUNCTION("stringUtf16OfLengthLeZero", StringUtf16OfLengthLeZero),
        DECLARE_NAPI_FUNCTION("stringUtf16OfLengthEqOne", StringUtf16OfLengthEqOne),
        DECLARE_NAPI_FUNCTION("stringUtf8OfLengthLeZero", StringUtf8OfLengthLeZero),
        DECLARE_NAPI_FUNCTION("NewTargetTest", NewTargetTest),
        DECLARE_NAPI_FUNCTION("napiLoadModule", napiLoadModule),
        DECLARE_NAPI_FUNCTION("createAsyncResource", CreateAsyncResource),
        DECLARE_NAPI_FUNCTION("destroyAsyncResource", DestroyAsyncResource),
        DECLARE_NAPI_FUNCTION("runInCallbackScope", RunInCallbackScope),
        DECLARE_NAPI_FUNCTION("testResolveAsync", TestResolveAsync),
        DECLARE_NAPI_FUNCTION("napiSetInstanceData", NapiSetInstanceData),
        DECLARE_NAPI_FUNCTION("asyncWorkCallback", AsyncWorkCallback),
        DECLARE_NAPI_FUNCTION("napiAsyncCleanUpHook", NapiAsyncCleanUpHook),
        DECLARE_NAPI_FUNCTION("napiEnvCleanUpHook", NapiEnvCleanUpHook),
        DECLARE_NAPI_FUNCTION("getModuleFileName", GetModuleFileName),
        DECLARE_NAPI_FUNCTION("asyncWorkWithQos", AsyncWorkWithQos),
        DECLARE_NAPI_FUNCTION("createObjectWithProperties", CreateObjectWithProperties),
        DECLARE_NAPI_FUNCTION("createObjectWithNamedProperties", CreateObjectWithNamedProperties),
        DECLARE_NAPI_FUNCTION("makeCallback", MakeCallback),
        DECLARE_NAPI_FUNCTION("makeCallbackOne", MakeCallbackOne),
        DECLARE_NAPI_FUNCTION("runEventLoop", RunEventLoop),
        DECLARE_NAPI_FUNCTION("stopEventLoop", StopEventLoop),
        DECLARE_NAPI_FUNCTION("napiSerialize", NapiSerialize),
        DECLARE_NAPI_FUNCTION("napiDeSerialize", NapiDeSerialize),
        DECLARE_NAPI_FUNCTION("napiDeleteSerializationData", NapiDeleteSerializationData),
        DECLARE_NAPI_FUNCTION("napiSerializeDate", NapiSerializeDate),
        DECLARE_NAPI_FUNCTION("napiSerializeString", NapiSerializeString),
        DECLARE_NAPI_FUNCTION("napiSerializeArray", NapiSerializeArray),
        DECLARE_NAPI_FUNCTION("napiSerializeObject", NapiSerializeObject),
        DECLARE_NAPI_FUNCTION("napiSerializeArraybuffer", NapiSerializeArraybuffer),
        DECLARE_NAPI_FUNCTION("napiSerializeTypearray", NapiSerializeTypearray),
        DECLARE_NAPI_FUNCTION("napiSerializeSharedarraybuffer", NapiSerializeSharedarraybuffer),
        DECLARE_NAPI_FUNCTION("napiSerializeSet", NapiSerializeSet),
        DECLARE_NAPI_FUNCTION("napiSerializeMap", NapiSerializeMap),
        DECLARE_NAPI_FUNCTION("napiSerializeRegExp", NapiSerializeRegExp),
        DECLARE_NAPI_FUNCTION("asyncCallTest", AsyncCallTest),
        {"napiSetNamedProperty", nullptr, NapiSetNamedProperty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"napiGetNamedProperty", nullptr, NapiGetNamedProperty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"callAddNumFunction", nullptr, CallAddNumFunction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"napiNewInstance", nullptr, NapiNewInstance, nullptr, nullptr, nullptr, napi_default, nullptr},
        DECLARE_NAPI_FUNCTION("napiCrateAndGetValueString", NapiCrateAndGetValueString),
        DECLARE_NAPI_FUNCTION("exceptionalSetNamedProperty", ExceptionalSetNamedProperty),
        DECLARE_NAPI_FUNCTION("exceptionalGetNamedProperty", ExceptionalGetNamedProperty),
        DECLARE_NAPI_FUNCTION("exceptionalCallAddNumFunction", ExceptionalCallAddNumFunction),
        DECLARE_NAPI_FUNCTION("exceptionalNapiNewInstance", ExceptionalNapiNewInstance),
        DECLARE_NAPI_FUNCTION("exceptionalNapiCrateAndGetValueString", ExceptionalNapiCrateAndGetValueString),
        {"threadSafePriority", nullptr, ThreadSafePriority, nullptr, nullptr, nullptr, napi_default, callbackData},
        {"threadSafePriorityWithInvalidParam", nullptr, ThreadSafePriorityWithInvalidParam, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        DECLARE_NAPI_FUNCTION("checkUnwrapFunc", CheckUnwrapFunc),
        DECLARE_NAPI_FUNCTION("createSendableArrayTest", CreateSendableArrayTest),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthTest", CreateSendableArrayWithLengthTest),
        DECLARE_NAPI_FUNCTION("createSendableArrayBufferTest", CreateSendableArrayBufferTest),
        DECLARE_NAPI_FUNCTION("createSendableTypedArrayTest", CreateSendableTypedArrayTest),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithProperties", CreateSendableObjectWithProperties),
        DECLARE_NAPI_FUNCTION("napiWrapSendableWithSizeTest", NapiWrapSendableWithSizeTest),
        DECLARE_NAPI_FUNCTION("napiWrapSendableTest", NapiWrapSendableTest),
        DECLARE_NAPI_FUNCTION("napiUnWrapSendableTest", NapiUnWrapSendableTest),
        DECLARE_NAPI_FUNCTION("napiRemoveWrapSendableTest", NapiRemoveWrapSendableTest),
        DECLARE_NAPI_FUNCTION("getLastErrorInfoNull", getLastErrorInfoNull),
        DECLARE_NAPI_FUNCTION("throwFunc", throwFunc),
        DECLARE_NAPI_FUNCTION("throwFuncNull", throwFuncNull),
        DECLARE_NAPI_FUNCTION("isErrorValueNull", isErrorValueNull),
        DECLARE_NAPI_FUNCTION("isErrorRstNull", isErrorRstNull),
        DECLARE_NAPI_FUNCTION("createStringUtf8", createStringUtf8),
        DECLARE_NAPI_FUNCTION("createErrorMsgNull", createErrorMsgNull),
        DECLARE_NAPI_FUNCTION("createErrorRstNull", createErrorRstNull),
        DECLARE_NAPI_FUNCTION("createTypeErrorMsgNull", createTypeErrorMsgNull),
        DECLARE_NAPI_FUNCTION("createTypeErrorRstNull", createTypeErrorRstNull),
        DECLARE_NAPI_FUNCTION("createRangeErrorRstNull", createRangeErrorRstNull),
        DECLARE_NAPI_FUNCTION("getAndClearLastExceptionNull", getAndClearLastExceptionNull),
        DECLARE_NAPI_FUNCTION("isExceptionPendingNull", isExceptionPendingNull),
        DECLARE_NAPI_FUNCTION("openAndCloseHandleScopeNull", openAndCloseHandleScopeNull),
        DECLARE_NAPI_FUNCTION("openAndCloseEscapableHandleScopeNull", openAndCloseEscapableHandleScopeNull),
        DECLARE_NAPI_FUNCTION("escapeHandle", escapeHandle),
        DECLARE_NAPI_FUNCTION("escapeHandleScopeNull", escapeHandleScopeNull),
        DECLARE_NAPI_FUNCTION("escapeHandleOutputNull", escapeHandleOutputNull),
        DECLARE_NAPI_FUNCTION("escapeHandleRstNull", escapeHandleRstNull),
        DECLARE_NAPI_FUNCTION("createReferenceValueNull", createReferenceValueNull),
        DECLARE_NAPI_FUNCTION("getReferenceValue", getReferenceValue),
        DECLARE_NAPI_FUNCTION("getReferenceValueRefNull", getReferenceValueRefNull),
        DECLARE_NAPI_FUNCTION("getReferenceValueRstNull", getReferenceValueRstNull),
        DECLARE_NAPI_FUNCTION("deleteReferenceNull", deleteReferenceNull),
        DECLARE_NAPI_FUNCTION("referenceRef", referenceRef),
        DECLARE_NAPI_FUNCTION("referenceRefNull", referenceRefNull),
        DECLARE_NAPI_FUNCTION("referenceRefAndUnrefNull", referenceRefAndUnrefNull),
        DECLARE_NAPI_FUNCTION("createArrayNull", createArrayNull),
        DECLARE_NAPI_FUNCTION("napCreateArrayBufferNull", napCreateArrayBufferNull),
        DECLARE_NAPI_FUNCTION("createExternalNull", createExternalNull),
        DECLARE_NAPI_FUNCTION("createExternalArraybufferDataNull", createExternalArraybufferDataNull),
        DECLARE_NAPI_FUNCTION("createObjectNull", createObjectNull),
        DECLARE_NAPI_FUNCTION("createSymbolNull", createSymbolNull),
        DECLARE_NAPI_FUNCTION("createSymbolDescriptionNull", createSymbolDescriptionNull),
        DECLARE_NAPI_FUNCTION("createSymbolDescriptionNotString", createSymbolDescriptionNotString),
        DECLARE_NAPI_FUNCTION("createTypeArrayBufferNull", createTypeArrayBufferNull),
        DECLARE_NAPI_FUNCTION("createTypeArrayResultNull", createTypeArrayResultNull),
        DECLARE_NAPI_FUNCTION("createTypeArrayNotBufferObj", createTypeArrayNotBufferObj),
        DECLARE_NAPI_FUNCTION("createTypeArrayNotEnumValue", createTypeArrayNotEnumValue),
        DECLARE_NAPI_FUNCTION("createDataViewBufferNull", createDataViewBufferNull),
        DECLARE_NAPI_FUNCTION("createDataViewResultNull", createDataViewResultNull),
        DECLARE_NAPI_FUNCTION("createDataViewBufferNotObj", createDataViewBufferNotObj),
        DECLARE_NAPI_FUNCTION("createInt32Null", createInt32Null),
        DECLARE_NAPI_FUNCTION("getValueInt32", getValueInt32),
        DECLARE_NAPI_FUNCTION("getValueInt32ValueNull", getValueInt32ValueNull),
        DECLARE_NAPI_FUNCTION("getValueInt32RstNull", getValueInt32RstNull),
        DECLARE_NAPI_FUNCTION("getValueInt32NotNum", getValueInt32NotNum),
        DECLARE_NAPI_FUNCTION("getValueInt64", getValueInt64),
        DECLARE_NAPI_FUNCTION("getValueInt64ValueNull", getValueInt64ValueNull),
        DECLARE_NAPI_FUNCTION("getValueInt64RstNull", getValueInt64RstNull),
        DECLARE_NAPI_FUNCTION("getValueInt64NotNum", getValueInt64NotNum),
        DECLARE_NAPI_FUNCTION("createUInt32Null", createUInt32Null),
        DECLARE_NAPI_FUNCTION("createInt64Null", createInt64Null),
        DECLARE_NAPI_FUNCTION("createDoubleNull", createDoubleNull),
        DECLARE_NAPI_FUNCTION("createAndGetStringLatin1BufferNull", createAndGetStringLatin1BufferNull),
        DECLARE_NAPI_FUNCTION("createAndGetStringLatin1ResultNull", createAndGetStringLatin1ResultNull),
        DECLARE_NAPI_FUNCTION("createAndGetStringUtf16BufferNull", createAndGetStringUtf16BufferNull),
        DECLARE_NAPI_FUNCTION("createAndGetStringUtf16ResultNull", createAndGetStringUtf16ResultNull),
        DECLARE_NAPI_FUNCTION("createAndGetStringUtf16Exceed", createAndGetStringUtf16Exceed),
        DECLARE_NAPI_FUNCTION("getArrayLengthResultNull", getArrayLengthResultNull),
        DECLARE_NAPI_FUNCTION("getArrayLengthValueNull", getArrayLengthValueNull),
        DECLARE_NAPI_FUNCTION("getArrayLengthNotArray", getArrayLengthNotArray),
        DECLARE_NAPI_FUNCTION("getArrayBufferInfoBufferNull", getArrayBufferInfoBufferNull),
        DECLARE_NAPI_FUNCTION("getArrayBufferInfoLengthNull", getArrayBufferInfoLengthNull),
        DECLARE_NAPI_FUNCTION("getArrayBufferInfoNotObj", getArrayBufferInfoNotObj),
        DECLARE_NAPI_FUNCTION("getPrototypeObjectNull", getPrototypeObjectNull),
        DECLARE_NAPI_FUNCTION("getPrototypeResultNull", getPrototypeResultNull),
        DECLARE_NAPI_FUNCTION("getPrototypeNotObj", getPrototypeNotObj),
        DECLARE_NAPI_FUNCTION("getTypedArrayInfoNull", getTypedArrayInfoNull),
        DECLARE_NAPI_FUNCTION("getDataViewInfoNull", getDataViewInfoNull),
        DECLARE_NAPI_FUNCTION("getDataViewInfoNotObj", getDataViewInfoNotObj),
        DECLARE_NAPI_FUNCTION("getValueBoolValueNull", getValueBoolValueNull),
        DECLARE_NAPI_FUNCTION("getValueBoolResultNull", getValueBoolResultNull),
        DECLARE_NAPI_FUNCTION("getBoolean", getBoolean),
        DECLARE_NAPI_FUNCTION("getBooleanNull", getBooleanNull),
        DECLARE_NAPI_FUNCTION("getValueNotBool", getValueNotBool),
        DECLARE_NAPI_FUNCTION("getValueDoubleValueNull", getValueDoubleValueNull),
        DECLARE_NAPI_FUNCTION("getValueDoubleResultNull", getValueDoubleResultNull),
        DECLARE_NAPI_FUNCTION("getValueDoubleNotNum", getValueDoubleNotNum),
        DECLARE_NAPI_FUNCTION("getValueExternalValueNull", getValueExternalValueNull),
        DECLARE_NAPI_FUNCTION("getValueExternalResultNull", getValueExternalResultNull),
        DECLARE_NAPI_FUNCTION("getValueExternalNotPtr", getValueExternalNotPtr),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1", getValueStringLatin1),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1Null", getValueStringLatin1Null),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8", getValueStringUtf8),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8Null", getValueStringUtf8Null),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8NotStr", getValueStringUtf8NotStr),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16", getValueStringUtf16),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16Null", getValueStringUtf16Null),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16NotStr", getValueStringUtf16NotStr),
        DECLARE_NAPI_FUNCTION("getValueUint32", getValueUint32),
        DECLARE_NAPI_FUNCTION("getValueUint32Null", getValueUint32Null),
        DECLARE_NAPI_FUNCTION("getValueUint32NotNum", getValueUint32NotNum),
        DECLARE_NAPI_FUNCTION("coerceToBoolValueNull", coerceToBoolValueNull),
        DECLARE_NAPI_FUNCTION("coerceToBoolResultNull", coerceToBoolResultNull),
        DECLARE_NAPI_FUNCTION("coerceToNumberValueNull", coerceToNumberValueNull),
        DECLARE_NAPI_FUNCTION("coerceToNumberRstNull", coerceToNumberRstNull),
        DECLARE_NAPI_FUNCTION("typeOf", typeOf),
        DECLARE_NAPI_FUNCTION("typeOfValueNull", typeOfValueNull),
        DECLARE_NAPI_FUNCTION("typeOfRstNull", typeOfRstNull),
        DECLARE_NAPI_FUNCTION("instanceOfObjectNull", instanceOfObjectNull),
        DECLARE_NAPI_FUNCTION("instanceOfConstructorNull", instanceOfConstructorNull),
        DECLARE_NAPI_FUNCTION("instanceOfResultNull", instanceOfResultNull),
        DECLARE_NAPI_FUNCTION("isArrayValueNull", isArrayValueNull),
        DECLARE_NAPI_FUNCTION("isArrayResultNull", isArrayResultNull),
        DECLARE_NAPI_FUNCTION("isDataView", isDataView),
        DECLARE_NAPI_FUNCTION("isDataViewValueNull", isDataViewValueNull),
        DECLARE_NAPI_FUNCTION("isDataViewRstNull", isDataViewRstNull),
        DECLARE_NAPI_FUNCTION("isArrayBuffer", isArrayBuffer),
        DECLARE_NAPI_FUNCTION("isArrayBufferValueNull", isArrayBufferValueNull),
        DECLARE_NAPI_FUNCTION("isArrayBufferRstNull", isArrayBufferRstNull),
        DECLARE_NAPI_FUNCTION("isTypedArray", isTypedArray),
        DECLARE_NAPI_FUNCTION("isTypedArrayValueNull", isTypedArrayValueNull),
        DECLARE_NAPI_FUNCTION("isTypedArrayRstNull", isTypedArrayRstNull),
        DECLARE_NAPI_FUNCTION("isDateValueNull", isDateValueNull),
        DECLARE_NAPI_FUNCTION("isDateResultNull", isDateResultNull),
        DECLARE_NAPI_FUNCTION("strictEqualsFirstValueNull", strictEqualsFirstValueNull),
        DECLARE_NAPI_FUNCTION("strictEqualsSecondValueNull", strictEqualsSecondValueNull),
        DECLARE_NAPI_FUNCTION("strictEqualsResultNull", strictEqualsResultNull),
        DECLARE_NAPI_FUNCTION("strictEqualsNaN", strictEqualsNaN),
        DECLARE_NAPI_FUNCTION("getPropertyNamesObjectNull", getPropertyNamesObjectNull),
        DECLARE_NAPI_FUNCTION("getPropertyNamesResultNull", getPropertyNamesResultNull),
        DECLARE_NAPI_FUNCTION("getPropertyNamesNotObject", getPropertyNamesNotObject),
        DECLARE_NAPI_FUNCTION("setPropertyValueNull", setPropertyValueNull),
        DECLARE_NAPI_FUNCTION("setPropertyResultNull", setPropertyResultNull),
        DECLARE_NAPI_FUNCTION("setPropertyNoObject", setPropertyNoObject),
        DECLARE_NAPI_FUNCTION("getPropertyObjectNull", getPropertyObjectNull),
        DECLARE_NAPI_FUNCTION("getPropertyKeyNull", getPropertyKeyNull),
        DECLARE_NAPI_FUNCTION("getPropertyResultNull", getPropertyResultNull),
        DECLARE_NAPI_FUNCTION("getPropertyNotObject", getPropertyNotObject),
        DECLARE_NAPI_FUNCTION("hasPropertyObjectNull", hasPropertyObjectNull),
        DECLARE_NAPI_FUNCTION("hasPropertyKeyNull", hasPropertyKeyNull),
        DECLARE_NAPI_FUNCTION("hasPropertyResultNull", hasPropertyResultNull),
        DECLARE_NAPI_FUNCTION("deletePropertyObjectNull", deletePropertyObjectNull),
        DECLARE_NAPI_FUNCTION("deletePropertyKeyNull", deletePropertyKeyNull),
        DECLARE_NAPI_FUNCTION("deletePropertyResultNull", deletePropertyResultNull),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyObjectNull", hasOwnPropertyObjectNull),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyKeytNull", hasOwnPropertyKeytNull),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyResultNull", hasOwnPropertyResultNull),
        DECLARE_NAPI_FUNCTION("setNamedPropertyObjectNull", setNamedPropertyObjectNull),
        DECLARE_NAPI_FUNCTION("setNamedPropertyKeyNull", setNamedPropertyKeyNull),
        DECLARE_NAPI_FUNCTION("setNamedPropertyResultNull", setNamedPropertyResultNull),
        DECLARE_NAPI_FUNCTION("getNamedPropertyObjectNull", getNamedPropertyObjectNull),
        DECLARE_NAPI_FUNCTION("getNamedPropertyKeyNull", getNamedPropertyKeyNull),
        DECLARE_NAPI_FUNCTION("getNamedPropertyResultNull", getNamedPropertyResultNull),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyObjectNull", hasNamedPropertyObjectNull),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyKeyNull", hasNamedPropertyKeyNull),
        DECLARE_NAPI_FUNCTION("hasNamedPropertyResultNull", hasNamedPropertyResultNull),
        DECLARE_NAPI_FUNCTION("setElementObjectNull", setElementObjectNull),
        DECLARE_NAPI_FUNCTION("setElementRstNull", setElementRstNull),
        DECLARE_NAPI_FUNCTION("setElementNotObj", setElementNotObj),
        DECLARE_NAPI_FUNCTION("getElementObjNull", getElementObjNull),
        DECLARE_NAPI_FUNCTION("getElementRstNull", getElementRstNull),
        DECLARE_NAPI_FUNCTION("getElementNotObj", getElementNotObj),
        DECLARE_NAPI_FUNCTION("hasElementObjNull", hasElementObjNull),
        DECLARE_NAPI_FUNCTION("hasElementRstNull", hasElementRstNull),
        DECLARE_NAPI_FUNCTION("deleteElementObjNull", deleteElementObjNull),
        DECLARE_NAPI_FUNCTION("deleteElementRstNull", deleteElementRstNull),
        DECLARE_NAPI_FUNCTION("definePropertiesObjNull", definePropertiesObjNull),
        DECLARE_NAPI_FUNCTION("typeTaggedObjNull", typeTaggedObjNull),
        DECLARE_NAPI_FUNCTION("typeTaggedTagNull", typeTaggedTagNull),
        DECLARE_NAPI_FUNCTION("CheckTypeTagObjNull", CheckTypeTagObjNull),
        DECLARE_NAPI_FUNCTION("CheckTypeTagTagNull", CheckTypeTagTagNull),
        DECLARE_NAPI_FUNCTION("CheckTypeTagRstNull", CheckTypeTagRstNull),
        DECLARE_NAPI_FUNCTION("callFunctionNull", callFunctionNull),
        DECLARE_NAPI_FUNCTION("napiCreateFunctionFuncNull", napiCreateFunctionFuncNull),
        DECLARE_NAPI_FUNCTION("napiCreateFunctionRstNull", napiCreateFunctionRstNull),
        DECLARE_NAPI_FUNCTION("napiGetCbInfoNull", napiGetCbInfoNull),
        DECLARE_NAPI_FUNCTION("newTargetInfoNull", newTargetInfoNull),
        DECLARE_NAPI_FUNCTION("newTargetRstNull", newTargetRstNull),
        DECLARE_NAPI_FUNCTION("newInstanceNull", newInstanceNull),
        DECLARE_NAPI_FUNCTION("newInstanceNotFunc", newInstanceNotFunc),
        DECLARE_NAPI_FUNCTION("defineClassUTFNull", defineClassUTFNull),
        DECLARE_NAPI_FUNCTION("defineClassConstructorNull", defineClassConstructorNull),
        DECLARE_NAPI_FUNCTION("defineClassRstNull", defineClassRstNull),
        DECLARE_NAPI_FUNCTION("defineClassLengthExceed", defineClassLengthExceed),
        DECLARE_NAPI_FUNCTION("unwrapObjNull", unwrapObjNull),
        DECLARE_NAPI_FUNCTION("unwrapRstNull", unwrapRstNull),
        DECLARE_NAPI_FUNCTION("removeWrapObjNull", removeWrapObjNull),
        DECLARE_NAPI_FUNCTION("removeWrapRstNull", removeWrapRstNull),
        DECLARE_NAPI_FUNCTION("cancelAsyncWorkNull", cancelAsyncWorkNull),
        DECLARE_NAPI_FUNCTION("queueAsyncWork", queueAsyncWork),
        DECLARE_NAPI_FUNCTION("queueAsyncWorkNull", queueAsyncWorkNull),
        DECLARE_NAPI_FUNCTION("deleteAsyncWorkNull", deleteAsyncWorkNull),
        DECLARE_NAPI_FUNCTION("defineSendableClassEnvNull", defineSendableClassEnvNull),
        DECLARE_NAPI_FUNCTION("defineSendableClassNameNull", defineSendableClassNameNull),
        DECLARE_NAPI_FUNCTION("defineSendableClassConstructorNull", defineSendableClassConstructorNull),
        DECLARE_NAPI_FUNCTION("defineSendableClassRstNull", defineSendableClassRstNull),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesEnvNull", createSendableObjectWithPropertiesEnvNull),
        DECLARE_NAPI_FUNCTION("createSendableObjectWithPropertiesRstNull", createSendableObjectWithPropertiesRstNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayEnvNull", createSendableArrayEnvNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayRstNull", createSendableArrayRstNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthEnvNull", createSendableArrayWithLengthEnvNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthRstNull", createSendableArrayWithLengthRstNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayBufferEnvNull", createSendableArrayBufferEnvNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayBufferDataNull", createSendableArrayBufferDataNull),
        DECLARE_NAPI_FUNCTION("createSendableArrayBufferRstNull", createSendableArrayBufferRstNull),
        DECLARE_NAPI_FUNCTION("createSendableTypedArrayEnvNull", createSendableTypedArrayEnvNull),
        DECLARE_NAPI_FUNCTION("createSendableTypedArraRstNull", createSendableTypedArraRstNull),
        DECLARE_NAPI_FUNCTION("createSendableTypedArraBufferNull", createSendableTypedArraBufferNull),
        DECLARE_NAPI_FUNCTION("createSendableTypedArrayNotType", createSendableTypedArrayNotType),
        DECLARE_NAPI_FUNCTION("createSendableTypedArrayNotBuffer", createSendableTypedArrayNotBuffer),
        DECLARE_NAPI_FUNCTION("createSendableFloat64ArrayTest", createSendableFloat64ArrayTest),
        DECLARE_NAPI_FUNCTION("createSendableBigInt64ArrayTest", createSendableBigInt64ArrayTest),
        DECLARE_NAPI_FUNCTION("createSendableBigUint64ArrayTest", createSendableBigUint64ArrayTest),
        DECLARE_NAPI_FUNCTION("wrapSendableEnvNull", wrapSendableEnvNull),
        DECLARE_NAPI_FUNCTION("NapiWrapSendableObj1Null", NapiWrapSendableObj1Null),
        DECLARE_NAPI_FUNCTION("NapiWrapSendableObj2Null", NapiWrapSendableObj2Null),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeEnvNull", wrapSendableWithSizeEnvNull),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeObj1Null", wrapSendableWithSizeObj1Null),
        DECLARE_NAPI_FUNCTION("wrapSendableWithSizeObj2Null", wrapSendableWithSizeObj2Null),
        DECLARE_NAPI_FUNCTION("removeWrapSendableEnvNull", removeWrapSendableEnvNull),
        DECLARE_NAPI_FUNCTION("removeWrapSendableObjNull", removeWrapSendableObjNull),
        DECLARE_NAPI_FUNCTION("removeWrapSendableRstNull", removeWrapSendableRstNull),
        DECLARE_NAPI_FUNCTION("getNodeVersionEnvNull", getNodeVersionEnvNull),
        DECLARE_NAPI_FUNCTION("getNodeVersionRstNull", getNodeVersionRstNull),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunction", releaseThreadsafeFunction),
        DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionNull", releaseThreadsafeFunctionNull),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionInitialThreadCountNegative", createThreadsafeFunctionInitialThreadCountNegative),
        DECLARE_NAPI_FUNCTION("getVersionRstNull", getVersionRstNull),
        DECLARE_NAPI_FUNCTION("getVersionEnvNull", getVersionEnvNull),
        DECLARE_NAPI_FUNCTION("createPromiseEnvNull", createPromiseEnvNull),
        DECLARE_NAPI_FUNCTION("createPromiseDeferredNull", createPromiseDeferredNull),
        DECLARE_NAPI_FUNCTION("createPromisePromiseNull", createPromisePromiseNull),
        DECLARE_NAPI_FUNCTION("resolveDeferredEnvNull", resolveDeferredEnvNull),
        DECLARE_NAPI_FUNCTION("resolveDeferredNull", resolveDeferredNull),
        DECLARE_NAPI_FUNCTION("isPromiseEnvNull", isPromiseEnvNull),
        DECLARE_NAPI_FUNCTION("isPromiseValueNull", isPromiseValueNull),
        DECLARE_NAPI_FUNCTION("isPromiseRstNull", isPromiseRstNull),
        DECLARE_NAPI_FUNCTION("getUvEventLoopEnvNull", getUvEventLoopEnvNull),
        DECLARE_NAPI_FUNCTION("getUvEventLoopRstNull", getUvEventLoopRstNull),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionEnvNull", createThreadsafeFunctionEnvNull),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionNameNull", createThreadsafeFunctionNameNull),
        DECLARE_NAPI_FUNCTION("napiCallThreadsafeFunctionNull", napiCallThreadsafeFunctionNull),
        DECLARE_NAPI_FUNCTION("refThreadSafeFunctionEnvNull", refThreadSafeFunctionEnvNull),
        DECLARE_NAPI_FUNCTION("refThreadSafeFunctionFuncNull", refThreadSafeFunctionFuncNull),
        DECLARE_NAPI_FUNCTION("createDateEnvNull", createDateEnvNull),
        DECLARE_NAPI_FUNCTION("createDateRstNull", createDateRstNull),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64EnvNull", getValueBigintUint64EnvNull),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64ValueNull", getValueBigintUint64ValueNull),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64RstNull", getValueBigintUint64RstNull),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64LossNull", getValueBigintUint64LossNull),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64EnvNull", getValueBigintInt64EnvNull),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64ValueNull", getValueBigintInt64ValueNull),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64RstNull", getValueBigintInt64RstNull),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64LossNull", getValueBigintInt64LossNull),
        DECLARE_NAPI_FUNCTION("getValueBigintWords", getValueBigintWords),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsEnvNull", getValueBigintWordsEnvNull),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsValueNull", getValueBigintWordsValueNull),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsSignNull", getValueBigintWordsSignNull),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsCountNull", getValueBigintWordsCountNull),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsWordsNull", getValueBigintWordsWordsNull),
        DECLARE_NAPI_FUNCTION("createBigintInt64EnvNull", createBigintInt64EnvNull),
        DECLARE_NAPI_FUNCTION("createBigintInt64RstNull", createBigintInt64RstNull),
        DECLARE_NAPI_FUNCTION("createBigintUint64EnvNull", createBigintUint64EnvNull),
        DECLARE_NAPI_FUNCTION("createBigintUint64RstNull", createBigintUint64RstNull),
        DECLARE_NAPI_FUNCTION("createBigintWordsEnvNull", createBigintWordsEnvNull),
        DECLARE_NAPI_FUNCTION("createBigintWordsNull", createBigintWordsNull),
        DECLARE_NAPI_FUNCTION("createBigintWordsRstNull", createBigintWordsRstNull),
        DECLARE_NAPI_FUNCTION("createBufferEnvNull", createBufferEnvNull),
        DECLARE_NAPI_FUNCTION("createBufferDataNull", createBufferDataNull),
        DECLARE_NAPI_FUNCTION("createBufferRstNull", createBufferRstNull),
        DECLARE_NAPI_FUNCTION("createBufferCopyEnvNull", createBufferCopyEnvNull),
        DECLARE_NAPI_FUNCTION("createBufferCopyDataNull", createBufferCopyDataNull),
        DECLARE_NAPI_FUNCTION("createBufferCopyRstDataNull", createBufferCopyRstDataNull),
        DECLARE_NAPI_FUNCTION("createBufferCopyRstNull", createBufferCopyRstNull),
        DECLARE_NAPI_FUNCTION("createExternalBuffereEnvNull", createExternalBuffereEnvNull),
        DECLARE_NAPI_FUNCTION("createExternalBuffereDataNull", createExternalBuffereDataNull),
        DECLARE_NAPI_FUNCTION("getBufferInfoEnvNull", getBufferInfoEnvNull),
        DECLARE_NAPI_FUNCTION("getBufferInfoValueNull", getBufferInfoValueNull),
        DECLARE_NAPI_FUNCTION("IsBufferEnvNull", IsBufferEnvNull),
        DECLARE_NAPI_FUNCTION("IsBufferValueNull", IsBufferValueNull),
        DECLARE_NAPI_FUNCTION("IsBufferRstNull", IsBufferRstNull),
        DECLARE_NAPI_FUNCTION("objectFreezeEnvNull", objectFreezeEnvNull),
        DECLARE_NAPI_FUNCTION("objectFreezeObjNull", objectFreezeObjNull),
        DECLARE_NAPI_FUNCTION("objectSealEnvNull", objectSealEnvNull),
        DECLARE_NAPI_FUNCTION("objectSealObjNull", objectSealObjNull),
        DECLARE_NAPI_FUNCTION("GetAllPropertyNamesEnvNull", GetAllPropertyNamesEnvNull),
        DECLARE_NAPI_FUNCTION("GetAllPropertyNamesObjNull", GetAllPropertyNamesObjNull),
        DECLARE_NAPI_FUNCTION("GetAllPropertyNamesResNull", GetAllPropertyNamesResNull),
        DECLARE_NAPI_FUNCTION("DetachEnvNull", DetachEnvNull),
        DECLARE_NAPI_FUNCTION("DetachArrNull", DetachArrNull),
        DECLARE_NAPI_FUNCTION("IsDetachedEnvNull", IsDetachedEnvNull),
        DECLARE_NAPI_FUNCTION("IsDetachedArrNull", IsDetachedArrNull),
        DECLARE_NAPI_FUNCTION("IsDetachedResNull", IsDetachedResNull),
        DECLARE_NAPI_FUNCTION("NapiSetInstanceDataEnvNull", NapiSetInstanceDataEnvNull),
        DECLARE_NAPI_FUNCTION("NapiGetInstanceDataDataNull", NapiGetInstanceDataDataNull),
        DECLARE_NAPI_FUNCTION("NapiEnvCleanUpHookEnvNull", NapiEnvCleanUpHookEnvNull),
        DECLARE_NAPI_FUNCTION("NapiEnvCleanUpHookFuncNull", NapiEnvCleanUpHookFuncNull),
        DECLARE_NAPI_FUNCTION("NapiRemoveEnvCleanUpHookEnvNull", NapiRemoveEnvCleanUpHookEnvNull),
        DECLARE_NAPI_FUNCTION("NapiRemoveEnvCleanUpHookFuncNull", NapiRemoveEnvCleanUpHookFuncNull),
        DECLARE_NAPI_FUNCTION("GetModuleFileNameEnvNull", GetModuleFileNameEnvNull),
        DECLARE_NAPI_FUNCTION("GetModuleFileNameResNull", GetModuleFileNameResNull),
        DECLARE_NAPI_FUNCTION("createAsyncResourceEnvNull", createAsyncResourceEnvNull),
        DECLARE_NAPI_FUNCTION("createAsyncResourceObjNull", createAsyncResourceObjNull),
        DECLARE_NAPI_FUNCTION("createAsyncResourceCbNull", createAsyncResourceCbNull),
        DECLARE_NAPI_FUNCTION("asyncWorkWithQosEnvNull", asyncWorkWithQosEnvNull),
        DECLARE_NAPI_FUNCTION("asyncWorkWithQosWorkNull", asyncWorkWithQosWorkNull),
        DECLARE_NAPI_FUNCTION("napiRunScriptPathEnvNull", napiRunScriptPathEnvNull),
        DECLARE_NAPI_FUNCTION("napiRunScriptPathResNull", napiRunScriptPathResNull),
        DECLARE_NAPI_FUNCTION("napiLoadModuleEnvNull", napiLoadModuleEnvNull),
        DECLARE_NAPI_FUNCTION("napiLoadModuleResNull", napiLoadModuleResNull),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesEnvNull", createObjectWithPropertiesEnvNull),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesResNull", createObjectWithPropertiesResNull),
        DECLARE_NAPI_FUNCTION("createObjectWithPropertiesEnvResNull", createObjectWithPropertiesEnvResNull),
        DECLARE_NAPI_FUNCTION("getDateValueNotDateObj", getDateValueNotDateObj),
        DECLARE_NAPI_FUNCTION("getDateValue", getDateValue),
        DECLARE_NAPI_FUNCTION("getDateValueEnvNull", getDateValueEnvNull),
        DECLARE_NAPI_FUNCTION("getDateValueNull", getDateValueNull),
        DECLARE_NAPI_FUNCTION("getDateValueRstNull", getDateValueRstNull),
        DECLARE_NAPI_FUNCTION("createBigintInt64ValueNotJS", createBigintInt64ValueNotJS),
        DECLARE_NAPI_FUNCTION("createBigintUint64ValueNotJS", createBigintUint64ValueNotJS),
        DECLARE_NAPI_FUNCTION("getValueBiginWordsNotBigInt", getValueBiginWordsNotBigInt),
        DECLARE_NAPI_FUNCTION("createBufferSizeZero", createBufferSizeZero),
        DECLARE_NAPI_FUNCTION("createBufferCopyLengthZero", createBufferCopyLengthZero),
        DECLARE_NAPI_FUNCTION("createExternalBufferLengthMax", createExternalBufferLengthMax),
        DECLARE_NAPI_FUNCTION("getBufferInfoValueNotBuffer", getBufferInfoValueNotBuffer),
        DECLARE_NAPI_FUNCTION("objectSealNotObj", objectSealNotObj),
        DECLARE_NAPI_FUNCTION("objectFreezeNotObj", objectFreezeNotObj),
        DECLARE_NAPI_FUNCTION("detachArraybufferNotObj", detachArraybufferNotObj),
        DECLARE_NAPI_FUNCTION("isSendableEnvNull", isSendableEnvNull),
        DECLARE_NAPI_FUNCTION("isSendableValueNull", isSendableValueNull),
        DECLARE_NAPI_FUNCTION("isSendableRstNull", isSendableRstNull),
        DECLARE_NAPI_FUNCTION("deserializeEnvNull", deserializeEnvNull),
        DECLARE_NAPI_FUNCTION("deserializeDataNull", deserializeDataNull),
        DECLARE_NAPI_FUNCTION("deserializeRstNull", deserializeRstNull),
        DECLARE_NAPI_FUNCTION("serializeEnvNull", serializeEnvNull),
        DECLARE_NAPI_FUNCTION("serializeObjNull", serializeObjNull),
        DECLARE_NAPI_FUNCTION("serializeDataNull", serializeDataNull),
        DECLARE_NAPI_FUNCTION("createObjectWithNamePropertiesEnvNull", createObjectWithNamePropertiesEnvNull),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectEnvNull", coerceToNativeBindingObjectEnvNull),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectObjNull", coerceToNativeBindingObjectObjNull),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectDetachNull", coerceToNativeBindingObjectDetachNull),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectAttachNull", coerceToNativeBindingObjectAttachNull),
        DECLARE_NAPI_FUNCTION("coerceToNativeBindingObjectNativeNull", coerceToNativeBindingObjectNativeNull),
        DECLARE_NAPI_FUNCTION("deleteSerializationEnvNull", deleteSerializationEnvNull),
        DECLARE_NAPI_FUNCTION("deleteSerializationDataNull", deleteSerializationDataNull),
        DECLARE_NAPI_FUNCTION("createBigintWordsCountIntMax", createBigintWordsCountIntMax),
        DECLARE_NAPI_FUNCTION("makeCallbackTextNull", makeCallbackTextNull),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64", getValueBigintUint64),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64", getValueBigintInt64),
        DECLARE_NAPI_FUNCTION("napiGetInstanceDataEnvNull", NapiGetInstanceDataEnvNull),
        DECLARE_NAPI_FUNCTION("deleteAsyncWork", deleteAsyncWork),
        DECLARE_NAPI_FUNCTION("createThreadsafeFunctionMaxQueueSizeNegative", createThreadsafeFunctionMaxQueueSizeNegative),
        DECLARE_NAPI_FUNCTION("ThreadSafeTestNull", ThreadSafeTestNull),
        DECLARE_NAPI_FUNCTION("createExternalBufferLengthZero", createExternalBufferLengthZero),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyCheckpro", hasOwnPropertyCheckpro),
        DECLARE_NAPI_FUNCTION("hasOwnPropertyCheckOwnpro", hasOwnPropertyCheckOwnpro),
        DECLARE_NAPI_FUNCTION("createTypeErrorRes", createTypeErrorRes),
        DECLARE_NAPI_FUNCTION("createRangeErrorRes", createRangeErrorRes),
        DECLARE_NAPI_FUNCTION("NapiModuleRegisterTest", NapiModuleRegisterTest),
        DECLARE_NAPI_FUNCTION("NapiGetLastErrorInfoTest", NapiGetLastErrorInfoTest),
        DECLARE_NAPI_FUNCTION("NapiThrowTest", NapiThrowTest),
        DECLARE_NAPI_FUNCTION("NapiThrowErrorTest", NapiThrowErrorTest),
        DECLARE_NAPI_FUNCTION("NapiThrowTypeErrorTest", NapiThrowTypeErrorTest),
        DECLARE_NAPI_FUNCTION("NapiThrowRangeErrorTest", NapiThrowRangeErrorTest),
        DECLARE_NAPI_FUNCTION("NapiIsErrorTest", NapiIsErrorTest),
        DECLARE_NAPI_FUNCTION("NapiCreateErrorTest", NapiCreateErrorTest),
        DECLARE_NAPI_FUNCTION("NapiCreateTypeErrorTest", NapiCreateTypeErrorTest),
        DECLARE_NAPI_FUNCTION("NapiCreateRangeErrorTest", NapiCreateRangeErrorTest),
        DECLARE_NAPI_FUNCTION("NapiGetAndClearLastExceptionTest", NapiGetAndClearLastExceptionTest),
        DECLARE_NAPI_FUNCTION("NapiIsExceptionPendingTest", NapiIsExceptionPendingTest),
        DECLARE_NAPI_FUNCTION("NapiOpenHandleScopeTest", NapiOpenHandleScopeTest),
        DECLARE_NAPI_FUNCTION("NapiCloseHandleScopeTest", NapiCloseHandleScopeTest),
        DECLARE_NAPI_FUNCTION("NapiOpenEscapableHandleScopeTest", NapiOpenEscapableHandleScopeTest),
        DECLARE_NAPI_FUNCTION("NapiCloseEscapableHandleScopeTest", NapiCloseEscapableHandleScopeTest),
        DECLARE_NAPI_FUNCTION("NapiEscapeHandleTest", NapiEscapeHandleTest),
        DECLARE_NAPI_FUNCTION("NapiCreateReferenceTest", NapiCreateReferenceTest),
        DECLARE_NAPI_FUNCTION("NapiDeleteReferenceTest", NapiDeleteReferenceTest),
        DECLARE_NAPI_FUNCTION("NapiReferenceRefTest", NapiReferenceRefTest),
        DECLARE_NAPI_FUNCTION("NapiReferenceUnrefTest", NapiReferenceUnrefTest),
        DECLARE_NAPI_FUNCTION("NapiGetReferenceValueTest", NapiGetReferenceValueTest),
        DECLARE_NAPI_FUNCTION("NapiCreateArrayTest", NapiCreateArrayTest),
        DECLARE_NAPI_FUNCTION("NapiCreateArrayWithLengthTest", NapiCreateArrayWithLengthTest),
        DECLARE_NAPI_FUNCTION("NapiCreateArrayBufferTest", NapiCreateArrayBufferTest),
        DECLARE_NAPI_FUNCTION("NapiCreateObjectTest", NapiCreateObjectTest),
        DECLARE_NAPI_FUNCTION("NapiCreateSymbolTest", NapiCreateSymbolTest),
        DECLARE_NAPI_FUNCTION("NapiCreateTypedArrayTest", NapiCreateTypedArrayTest),
        DECLARE_NAPI_FUNCTION("NapiCreateDateViewTest", NapiCreateDateViewTest),
        DECLARE_NAPI_FUNCTION("NapiCreateInt32Test", NapiCreateInt32Test),
        DECLARE_NAPI_FUNCTION("NapiCreateUint32Test", NapiCreateUint32Test),
        DECLARE_NAPI_FUNCTION("NapiCreateInt64Test", NapiCreateInt64Test),
        DECLARE_NAPI_FUNCTION("NapiCreateDoubleTest", NapiCreateDoubleTest),
        DECLARE_NAPI_FUNCTION("NapiCreateStringLatin1Test", NapiCreateStringLatin1Test),
        DECLARE_NAPI_FUNCTION("NapiCreateStringUtf8Test", NapiCreateStringUtf8Test),
        DECLARE_NAPI_FUNCTION("NapiCreateStringUtf16Test", NapiCreateStringUtf16Test),
        DECLARE_NAPI_FUNCTION("NapiGetArrayLengthTest", NapiGetArrayLengthTest),
        DECLARE_NAPI_FUNCTION("NapiGetArrayBufferInfoTest", NapiGetArrayBufferInfoTest),
        DECLARE_NAPI_FUNCTION("NapiGetPrototypeTest", NapiGetPrototypeTest),
        DECLARE_NAPI_FUNCTION("NapiGetTypedArrayTest", NapiGetTypedArrayTest),
        DECLARE_NAPI_FUNCTION("NapiGetDataViewInfoTest", NapiGetDataViewInfoTest),
        DECLARE_NAPI_FUNCTION("NapiGetValueBoolTest", NapiGetValueBoolTest),
        DECLARE_NAPI_FUNCTION("NapiGetValueDoubleTest", NapiGetValueDoubleTest),
        DECLARE_NAPI_FUNCTION("NapiGetValueInt32Test", NapiGetValueInt32Test),
        DECLARE_NAPI_FUNCTION("NapiGetValueInt64Test", NapiGetValueInt64Test),
        DECLARE_NAPI_FUNCTION("NapiGetValueStringLatin1Test", NapiGetValueStringLatin1Test),
        DECLARE_NAPI_FUNCTION("NapiGetValueStringUtf8Test", NapiGetValueStringUtf8Test),
        DECLARE_NAPI_FUNCTION("NapiGetValueStringUtf16Test", NapiGetValueStringUtf16Test),
        DECLARE_NAPI_FUNCTION("NapiGetValueUint32Test", NapiGetValueUint32Test),
        DECLARE_NAPI_FUNCTION("NapiGetBooleanTest", NapiGetBooleanTest),
        DECLARE_NAPI_FUNCTION("NapiGetGlobalTest", NapiGetGlobalTest),
        DECLARE_NAPI_FUNCTION("NapiGetNullTest", NapiGetNullTest),
        DECLARE_NAPI_FUNCTION("NapiGetUndefinedTest", NapiGetUndefinedTest),
        DECLARE_NAPI_FUNCTION("NapiCoerceToBoolTest", NapiCoerceToBoolTest),
        DECLARE_NAPI_FUNCTION("NapiCoerceToNumberTest", NapiCoerceToNumberTest),
        DECLARE_NAPI_FUNCTION("NapiCoerceToObjectTest", NapiCoerceToObjectTest),
        DECLARE_NAPI_FUNCTION("NapiCoerceToStringTest", NapiCoerceToStringTest),
        DECLARE_NAPI_FUNCTION("NapiTypeOfTest", NapiTypeOfTest),
        DECLARE_NAPI_FUNCTION("NapiInstanceOfTest", NapiInstanceOfTest),
        DECLARE_NAPI_FUNCTION("NapiIsArrayTest", NapiIsArrayTest),
        DECLARE_NAPI_FUNCTION("NapiIsArrayBufferTest", NapiIsArrayBufferTest),
        DECLARE_NAPI_FUNCTION("NapiIsTypedArrayTest", NapiIsTypedArrayTest),
        DECLARE_NAPI_FUNCTION("NapiIsDataViewTest", NapiIsDataViewTest),
        DECLARE_NAPI_FUNCTION("NapiIsDateTest", NapiIsDateTest),
        DECLARE_NAPI_FUNCTION("NapiStrictEqualsTest", NapiStrictEqualsTest),
        DECLARE_NAPI_FUNCTION("NapiGetPropertyNamesTest", NapiGetPropertyNamesTest),
        DECLARE_NAPI_FUNCTION("NapiSetPropertyTest", NapiSetPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiGetPropertyTest", NapiGetPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiHasPropertyTest", NapiHasPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest01", NapiDeletePropertyTest01),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest02", NapiDeletePropertyTest02),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest03", NapiDeletePropertyTest03),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest04", NapiDeletePropertyTest04),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest05", NapiDeletePropertyTest05),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest06", NapiDeletePropertyTest06),
        DECLARE_NAPI_FUNCTION("NapiDeletePropertyTest07", NapiDeletePropertyTest07),
        DECLARE_NAPI_FUNCTION("NapiHasOwnPropertyTest", NapiHasOwnPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiSetNamedPropertyTest", NapiSetNamedPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiGetNamedPropertyTest", NapiGetNamedPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiHasNamedPropertyTest", NapiHasNamedPropertyTest),
        DECLARE_NAPI_FUNCTION("NapiSetElementTest", NapiSetElementTest),
        DECLARE_NAPI_FUNCTION("NapiGetElementTest", NapiGetElementTest),
        DECLARE_NAPI_FUNCTION("NapiHasElementTest", NapiHasElementTest),
        DECLARE_NAPI_FUNCTION("NapiDeleteElementTest01", NapiDeleteElementTest01),
        DECLARE_NAPI_FUNCTION("NapiDeleteElementTest02", NapiDeleteElementTest02),
        DECLARE_NAPI_FUNCTION("NapiDeleteElementTest03", NapiDeleteElementTest03),
        DECLARE_NAPI_FUNCTION("NapiDeleteElementTest04", NapiDeleteElementTest04),
        DECLARE_NAPI_FUNCTION("NapiDeleteElementTest05", NapiDeleteElementTest05),
        DECLARE_NAPI_FUNCTION("NapiDefinePropertiesTest", NapiDefinePropertiesTest),
        DECLARE_NAPI_FUNCTION("NapiTypeTagObjectTest", NapiTypeTagObjectTest),
        DECLARE_NAPI_FUNCTION("NapiRemoveWrapSendableTest1", NapiRemoveWrapSendableTest1),
        DECLARE_NAPI_FUNCTION("NapiUwrapSendableTest", NapiUwrapSendableTest),
        DECLARE_NAPI_FUNCTION("NapiWrapSendableWithSizeTest1", NapiWrapSendableWithSizeTest1),
        DECLARE_NAPI_FUNCTION("NapiWrapSendableTest1", NapiWrapSendableTest1),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableTypeArrayTest", NapiCreateSendableTypeArrayTest),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableArrayBufferTest", NapiCreateSendableArrayBufferTest),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableArrayWithLengthTest", NapiCreateSendableArrayWithLengthTest),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableArrayTest", NapiCreateSendableArrayTest),
        DECLARE_NAPI_FUNCTION("NapiCreateSendableObjectWithPropertiesTest", NapiCreateSendableObjectWithPropertiesTest),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest1", NapiDefineSendableClassTest1),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest2", NapiDefineSendableClassTest2),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest3", NapiDefineSendableClassTest3),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest4", NapiDefineSendableClassTest4),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest5", NapiDefineSendableClassTest5),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest6", NapiDefineSendableClassTest6),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest7", NapiDefineSendableClassTest7),
        DECLARE_NAPI_FUNCTION("NapiDefineSendableClassTest8", NapiDefineSendableClassTest8),
        DECLARE_NAPI_FUNCTION("NapiIsSendableTest", NapiIsSendableTest),
        DECLARE_NAPI_FUNCTION("NapiCallThreadsafeFunctionWithPriorityTest", NapiCallThreadsafeFunctionWithPriorityTest),
        DECLARE_NAPI_FUNCTION("NapiDeleteSerializationDataTest", NapiDeleteSerializationDataTest),
        DECLARE_NAPI_FUNCTION("NapiDeserializeTest", NapiDeserializeTest),
        DECLARE_NAPI_FUNCTION("NapiSerializeTest", NapiSerializeTest),
        DECLARE_NAPI_FUNCTION("NapiLoadModuleWithInfoTest", NapiLoadModuleWithInfoTest),
        DECLARE_NAPI_FUNCTION("NapiStopEventLoopTest", NapiStopEventLoopTest),
        DECLARE_NAPI_FUNCTION("NapiRunEventLoopTest", NapiRunEventLoopTest),
        DECLARE_NAPI_FUNCTION("NapiDestroyArkRuntimeTest", NapiDestroyArkRuntimeTest),
        DECLARE_NAPI_FUNCTION("NapiCreateArkRuntimeTest", NapiCreateArkRuntimeTest),
        DECLARE_NAPI_FUNCTION("NapiCoerceToNativeBindingObjectTest", NapiCoerceToNativeBindingObjectTest),
        DECLARE_NAPI_FUNCTION("NapiCreateObjectWithNamedPropertiesTest", NapiCreateObjectWithNamedPropertiesTest),
        DECLARE_NAPI_FUNCTION("NapiCreateObjectWithPropertiesTest", NapiCreateObjectWithPropertiesTest),
        DECLARE_NAPI_FUNCTION("NapiLoadModuleTest", NapiLoadModuleTest),
        DECLARE_NAPI_FUNCTION("NapiRunScriptPathTest", NapiRunScriptPathTest),
        DECLARE_NAPI_FUNCTION("NapiQueueAsyncWorkWithQosTest", NapiQueueAsyncWorkWithQosTest),
        DECLARE_NAPI_FUNCTION("NapiFatalExceptionTest", NapiFatalExceptionTest),
        DECLARE_NAPI_FUNCTION("NapiAddFinalizerTest", NapiAddFinalizerTest),
        DECLARE_NAPI_FUNCTION("NodeApiGetModuleFileNameTest", NodeApiGetModuleFileNameTest),
        DECLARE_NAPI_FUNCTION("NapiRemoveAsyncCleanupHookTest", NapiRemoveAsyncCleanupHookTest),
        DECLARE_NAPI_FUNCTION("NapiAddAsyncCleanupHookTest", NapiAddAsyncCleanupHookTest),
        DECLARE_NAPI_FUNCTION("NapiRemoveEnvCleanupHookTest", NapiRemoveEnvCleanupHookTest),
        DECLARE_NAPI_FUNCTION("NapiAddEnvCleanupHookTest", NapiAddEnvCleanupHookTest),
        DECLARE_NAPI_FUNCTION("NapiGetInstanceDataTest", NapiGetInstanceDataTest),
        DECLARE_NAPI_FUNCTION("NapiSetInstanceDataTest", NapiSetInstanceDataTest),
        DECLARE_NAPI_FUNCTION("NapiIsDetachedArrayBufferTest", NapiIsDetachedArrayBufferTest),
        DECLARE_NAPI_FUNCTION("NapiDetachedArrayBufferTest", NapiDetachedArrayBufferTest),
        DECLARE_NAPI_FUNCTION("NapiGetAllPropertyNamesTest", NapiGetAllPropertyNamesTest),
        DECLARE_NAPI_FUNCTION("NapiObjectSealTest", NapiObjectSealTest),
        DECLARE_NAPI_FUNCTION("NapiObjectFreezeTest", NapiObjectFreezeTest),
        DECLARE_NAPI_FUNCTION("NapiIsBufferTest", NapiIsBufferTest),
        DECLARE_NAPI_FUNCTION("NapiGetBufferInfoTest", NapiGetBufferInfoTest),
        DECLARE_NAPI_FUNCTION("NapiCreateExternalBufferTest", NapiCreateExternalBufferTest),
        DECLARE_NAPI_FUNCTION("NapiCreateBufferCopyTest", NapiCreateBufferCopyTest),
        DECLARE_NAPI_FUNCTION("NapiCreateBufferTest", NapiCreateBufferTest),
        DECLARE_NAPI_FUNCTION("NapiGetValueBigintWordsTest", NapiGetValueBigintWordsTest),
        DECLARE_NAPI_FUNCTION("NapiGetValueBigintUint64Test", NapiGetValueBigintUint64Test),
        DECLARE_NAPI_FUNCTION("NapiGetValueBigintInt64Test", NapiGetValueBigintInt64Test),
        DECLARE_NAPI_FUNCTION("NapiCreateBigintWordsTest", NapiCreateBigintWordsTest),
        DECLARE_NAPI_FUNCTION("NapiCreateBigintUint64Test", NapiCreateBigintUint64Test),
        DECLARE_NAPI_FUNCTION("NapiCreateBigintInt64Test", NapiCreateBigintInt64Test),
        DECLARE_NAPI_FUNCTION("NapiGetDataValueTest", NapiGetDataValueTest),
        DECLARE_NAPI_FUNCTION("NapiCreateDataTest", NapiCreateDataTest),
        DECLARE_NAPI_FUNCTION("NapiUnrefThreadsafeFunctionTest", NapiUnrefThreadsafeFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiRefThreadsafeFunctionTest", NapiRefThreadsafeFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiReleaseThreadsafeFunctionTest", NapiReleaseThreadsafeFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiAcquireThreadsafeFunctionTest", NapiAcquireThreadsafeFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiCallThreadsafeFunctionTest", NapiCallThreadsafeFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiGetThreadsafeFunctionContextTest", NapiGetThreadsafeFunctionContextTest),
        DECLARE_NAPI_FUNCTION("NapiCreateThreadsafeFunctionTest1", NapiCreateThreadsafeFunctionTest1),
        DECLARE_NAPI_FUNCTION("NapiCreateThreadsafeFunctionTest2", NapiCreateThreadsafeFunctionTest2),
        DECLARE_NAPI_FUNCTION("NapiCreateThreadsafeFunctionTest3", NapiCreateThreadsafeFunctionTest3),
        DECLARE_NAPI_FUNCTION("NapiGetUvEventLoopTest", NapiGetUvEventLoopTest),
        DECLARE_NAPI_FUNCTION("NapiIsPromiseTest", NapiIsPromiseTest),
        DECLARE_NAPI_FUNCTION("NapiRejectDeferredTest", NapiRejectDeferredTest),
        DECLARE_NAPI_FUNCTION("NapiResolveDeferredTest", NapiResolveDeferredTest),
        DECLARE_NAPI_FUNCTION("NapiCreatePromiseTest", NapiCreatePromiseTest),
        DECLARE_NAPI_FUNCTION("NapiGetVersionTest", NapiGetVersionTest),
        DECLARE_NAPI_FUNCTION("NapiGetNodeVersionTest", NapiGetNodeVersionTest),
        DECLARE_NAPI_FUNCTION("NapiCloseCallbackScopeTest", NapiCloseCallbackScopeTest),
        DECLARE_NAPI_FUNCTION("NapiOpenCallbackScopeTest", NapiOpenCallbackScopeTest),
        DECLARE_NAPI_FUNCTION("NapiAsyncDestroyTest", NapiAsyncDestroyTest),
        DECLARE_NAPI_FUNCTION("NapiMakeCallback1Test", NapiMakeCallback1Test),
        DECLARE_NAPI_FUNCTION("NapiMakeCallback2Test", NapiMakeCallback2Test),
        DECLARE_NAPI_FUNCTION("NapiMakeCallback3Test", NapiMakeCallback3Test),
        DECLARE_NAPI_FUNCTION("NapiMakeCallback4Test", NapiMakeCallback4Test),
        DECLARE_NAPI_FUNCTION("NapiMakeCallback5Test", NapiMakeCallback5Test),
        DECLARE_NAPI_FUNCTION("NapiMakeCallback6Test", NapiMakeCallback6Test),
        DECLARE_NAPI_FUNCTION("NapiAsyncInitTest", NapiAsyncInitTest),
        DECLARE_NAPI_FUNCTION("NapiCancelAsyncWorkTest", NapiCancelAsyncWorkTest),
        DECLARE_NAPI_FUNCTION("NapiQueueAsyncWorkTest", NapiQueueAsyncWorkTest),
        DECLARE_NAPI_FUNCTION("NapiDeleteAsyncWorkTest", NapiDeleteAsyncWorkTest),
        DECLARE_NAPI_FUNCTION("NapiCreateAsyncWorkTest", NapiCreateAsyncWorkTest),
        DECLARE_NAPI_FUNCTION("NapiRemoveWrapTest", NapiRemoveWrapTest),
        DECLARE_NAPI_FUNCTION("NapiUnwrapTest", NapiUnwrapTest),
        DECLARE_NAPI_FUNCTION("NapiWrapTest", NapiWrapTest),
        DECLARE_NAPI_FUNCTION("NapiDefineClassTest", NapiDefineClassTest),
        DECLARE_NAPI_FUNCTION("NapiNewInstanceTest", NapiNewInstanceTest),
        DECLARE_NAPI_FUNCTION("NapiGetNewTargetTest", NapiGetNewTargetTest),
        DECLARE_NAPI_FUNCTION("NapiGetCbInfoTest", NapiGetCbInfoTest),
        DECLARE_NAPI_FUNCTION("NapiCreateFunctionTest", NapiCreateFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiCallFunctionTest", NapiCallFunctionTest),
        DECLARE_NAPI_FUNCTION("NapiCheckObjectTypeTagTest", NapiCheckObjectTypeTagTest),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest1", NapiWrapEnhanceTest1),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest2", NapiWrapEnhanceTest2),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest3", NapiWrapEnhanceTest3),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest4", NapiWrapEnhanceTest4),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest5", NapiWrapEnhanceTest5),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest6", NapiWrapEnhanceTest6),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest7", NapiWrapEnhanceTest7),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest8", NapiWrapEnhanceTest8),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest9", NapiWrapEnhanceTest9),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest10", NapiWrapEnhanceTest10),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest11", NapiWrapEnhanceTest11),
        DECLARE_NAPI_FUNCTION("NapiWrapEnhanceTest12", NapiWrapEnhanceTest12),
        DECLARE_NAPI_FUNCTION("NapiCreateExternalStringUtf16", NapiCreateExternalStringUtf16),
        DECLARE_NAPI_FUNCTION("NapiCreateExternalStringAscii", NapiCreateExternalStringAscii),
        DECLARE_NAPI_FUNCTION("NapiCreateStrongSendableRef", NapiCreateStrongSendableRef),
        DECLARE_NAPI_FUNCTION("NapiGetStrongSendableRef", NapiGetStrongSendableRef),
        DECLARE_NAPI_FUNCTION("NapiDelStrongSendableRef", NapiDelStrongSendableRef),
        DECLARE_NAPI_FUNCTION("NapiThrowBusinessError", NapiThrowBusinessError),
        DECLARE_NAPI_FUNCTION("NapiThrowBusinessErrorPar", NapiThrowBusinessErrorPar),
        DECLARE_NAPI_FUNCTION("NapiThrowBusinessErrorPendingError", NapiThrowBusinessErrorPendingError),
    };
    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(properties) / sizeof(properties[0]), properties));

    napi_property_descriptor descClass[] = {
        DECLARE_NAPI_FUNCTION("sayHello", SayHello),
    };
    napi_value myClass;
    napi_define_class(env, "myClass", NAPI_AUTO_LENGTH, MyConstructor, nullptr,
                      sizeof(descClass) / sizeof(descClass[0]), descClass, &myClass);
    napi_set_named_property(env, exports, "myClass", myClass);
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