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


struct CallbackData {
    napi_threadsafe_function tsfn;
    napi_async_work work;
};

struct InstanceData {
    size_t value;
    bool print;
    napi_ref jsCbRef;
};

struct InstanceAddonData {
    napi_ref jsCbRef;
    napi_ref jsTsfnFinalizerRef;
    napi_threadsafe_function tsfn;
    uv_thread_t thread;
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

    if (optionalRef == nullptr) {
        InstanceAddonData *data;
        napi_get_instance_data(env, (void **)&data);
        optionalRef = &data->jsCbRef;
    }

    napi_get_reference_value(env, *optionalRef, &jsCb);
    napi_get_undefined(env, &undefined);
    napi_call_function(env, undefined, jsCb, 0, nullptr, nullptr);
    napi_delete_reference(env, *optionalRef);

    *optionalRef = nullptr;
}

static bool EstablishCallbackRef(napi_env env, napi_callback_info info)
{
    InstanceAddonData *data;
    size_t argc = 1;
    napi_value jsCb;

    napi_get_instance_data(env, (void **)&data);

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
    }
    free(data);
}

static napi_value NapiSetInstanceData(napi_env env, napi_callback_info info)
{
    InstanceData* data = reinterpret_cast<InstanceData*>(malloc(sizeof(*data)));
    data->value = 1;
    data->print = true;
    data->jsCbRef = nullptr;

    NAPI_CALL(env, napi_set_instance_data(env, data, DeleteAddonData, nullptr));

    InstanceData* getData = nullptr;
    NAPI_CALL(env, napi_get_instance_data(env, (void**)&getData));
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
    free(ref);
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
    // 执行任务为napi_priority_idle优先级，入队方式为队列尾部入队
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_idle, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_low, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_high, true);
    napi_call_threadsafe_function_with_priority(callbackData->tsfn, nullptr, napi_priority_immediate, true);
    // 执行任务为napi_priority_high优先级，入队方式为队列头部入队
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
    napi_status status = napi_create_sendable_typedarray(env, napi_float64_array, length,
                                                         arraybuffer, offset, &result);
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
    napi_status status = napi_get_instance_data(nullptr, (void**)&getData);
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


EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    napi_value theValue;
    CallbackData *callbackData = new CallbackData();
    NAPI_CALL(env, napi_create_string_utf8(env, TEST_STR, sizeof(TEST_STR), &theValue));
    NAPI_CALL(env, napi_set_named_property(env, exports, "testStr", theValue));
    napi_property_descriptor properties[] = {
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
