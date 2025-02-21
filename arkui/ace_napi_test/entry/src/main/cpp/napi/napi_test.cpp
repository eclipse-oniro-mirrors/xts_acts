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

#include "common/native_common.h"
#include "napi/native_api.h"
#include <stdint.h>
#include <string>
#include <stdio.h>
#include <vector>
#include <malloc.h>
#include <ctime>
#include <thread>
#include <uv.h>

static napi_ref test_reference = NULL;
const int TAG_NUMBER = 666;

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
                    (p_last_error->error_message == NULL ?
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
    napi_throw_type_error(env, NULL, "type error1");

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
    napi_throw_range_error(env, NULL, "range error");

    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value isError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    bool exceptionWasPending = false;
    napi_is_exception_pending(env, &exceptionWasPending);

    NAPI_ASSERT(env, exceptionWasPending, "error succes");
    
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 0, &_value));
    return _value;
}

static napi_value openAndCloseHandleScope(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope;
    NAPI_CALL(env, napi_open_handle_scope(env, &scope));
    napi_value output = NULL;
    NAPI_CALL(env, napi_create_object(env, &output));
    NAPI_CALL(env, napi_close_handle_scope(env, scope));
    return output;
}

static napi_value openAndCloseEscapableHandleScope(napi_env env, napi_callback_info info)
{
    napi_escapable_handle_scope scope;
    NAPI_CALL(env, napi_open_escapable_handle_scope(env, &scope));
    napi_value output = NULL;
    napi_value escapee = NULL;
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
    NAPI_ASSERT(env, test_reference != NULL,
            "A reference must have been created.");

    napi_value refValue = nullptr;
    napi_get_reference_value(env, test_reference, &refValue);

    int32_t value = 0;
    napi_get_value_int32(env, refValue, &value);
    NAPI_ASSERT(env, value == TAG_NUMBER,
            "refValue expect equal to 666.");

    NAPI_CALL(env, napi_delete_reference(env, test_reference));
    test_reference = NULL;
    return NULL;
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
    NAPI_ASSERT(env, refValue != NULL,
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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value description = NULL;
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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_latin1(env, args[0], buffer, buffer_size, &copied));
    NAPI_ASSERT(env, copied == 3, "napi_get_value_string_latin1 fail");

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

    return output;
}

static napi_value createAndGetStringUtf8(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied = 0;

    NAPI_CALL(env,
        napi_get_value_string_utf8(env, args[0], buffer, buffer_size, &copied));
    NAPI_ASSERT(env, copied == 2, "napi_get_value_string_utf8 fail");

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, buffer, copied, &output));

    return output;
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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_bool(env, args[0], &output));

    return output;
}

static napi_value coerceToNumber(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_number(env, args[0], &output));

    return output;
}

static napi_value coerceToObject(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    napi_value output;
    NAPI_CALL(env, napi_coerce_to_object(env, args[0], &output));

    return output;
}

static napi_value coerceToString(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &date, NULL, NULL));
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

    status = napi_set_property(NULL, object, key, value);

    add_returned_status(env,
            "envIsNull",
            object,
            "Invalid argument",
            napi_invalid_arg,
            status);

    napi_set_property(env, NULL, key, value);

    add_last_status(env, "objectIsNull", object);

    napi_set_property(env, object, NULL, value);

    add_last_status(env, "keyIsNull", object);

    napi_set_property(env, object, key, NULL);

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

    status = napi_get_property(NULL, object, key, &result);

    add_returned_status(env,
            "envIsNull",
            object,
            "Invalid argument",
            napi_invalid_arg,
            status);

    napi_get_property(env, NULL, key, &result);

    add_last_status(env, "objectIsNull", object);

    napi_get_property(env, object, NULL, &result);

    add_last_status(env, "keyIsNull", object);

    napi_get_property(env, object, key, NULL);

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

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));
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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
            napi_set_element(NULL, object, 0, object));

    napi_set_element(env, NULL, 0, object);
    add_last_status(env, "objectIsNull", return_value);


    napi_set_property(env, object, 0, NULL);
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
            napi_get_element(NULL, object, 0, &prop));

    napi_get_property(env, NULL, 0, &prop);
    add_last_status(env, "objectIsNull", return_value);

    napi_get_property(env, object, 0, NULL);
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
            api(NULL, object, 0, &result));

    api(env, NULL, 0, &result);
    add_last_status(env, "objectIsNull", return_value);

    api(env, object, 0, NULL);
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
            napi_define_properties(NULL, object, 1, &desc));

    napi_define_properties(env, NULL, 1, &desc);
    add_last_status(env, "objectIsNull", return_value);

    napi_define_properties(env, object, 1, NULL);
    add_last_status(env, "descriptorListIsNull", return_value);

    desc.utf8name = NULL;
    napi_define_properties(env, object, 1, NULL);
    add_last_status(env, "utf8nameIsNull", return_value);
    desc.utf8name = "prop";

    desc.method = NULL;
    napi_define_properties(env, object, 1, NULL);
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

    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &script, NULL, NULL));

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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied;

    NAPI_CALL(env,
            napi_get_value_string_latin1(env, args[0], buffer, buffer_size, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

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
    napi_status status = napi_get_cb_info(env, info, &argc, args, NULL, NULL);
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
    const char* path =  "index/page";
    napi_status status = napi_run_script_path(env, path, &value);
    NAPI_ASSERT(env, status == napi_ok, "napi_run_script_path ok");
    NAPI_ASSERT(env, value == nullptr, "napi_run_script_path fail");
    
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

struct AddonData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    napi_ref callback = nullptr;
    double args = 0;
    double result = 0;
};
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

    struct AddonData* addonData = (struct AddonData*)malloc(sizeof(struct AddonData));
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

    struct AddonData* addonData = (struct AddonData*)malloc(sizeof(struct AddonData));
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
                           [](napi_env env, napi_status status, void* data) {
                           napi_async_work workData = (napi_async_work)data;
                           napi_delete_async_work(env, workData);
                           }, work, &work);
    napi_queue_async_work(env, work);
    NAPI_CALL(env, napi_cancel_async_work(env, work));
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
    napi_status status = napi_create_function(env, "func", NAPI_AUTO_LENGTH, SayHello, NULL, &funcValue);
    NAPI_ASSERT(env, funcValue != nullptr, "napi_create_function fail");
    NAPI_ASSERT(env, status == napi_ok, "napi_create_function fail");
    napi_value value;
    NAPI_CALL(env, napi_create_int32(env, 1, &value));
    
    return funcValue;
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
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

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
static void CallJs(napi_env env, napi_value js_cb, void *context, void *data) {
    
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
    napi_value js_cb, work_name;
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, &js_cb, NULL, NULL));
    napi_create_reference(env, js_cb, 1, &functionRef);

    NAPI_CALL(env, napi_create_string_utf8(env, "work_name", NAPI_AUTO_LENGTH, &work_name));

    napi_valuetype valueType = napi_undefined;
    NAPI_CALL(env, napi_typeof(env, js_cb, &valueType));
    NAPI_ASSERT(env, valueType == napi_function, "valueType expect equal to napi_function");
    
    const char context[] = "context";
    NAPI_CALL(env, napi_create_threadsafe_function(
        env, js_cb, NULL, work_name, 0, 1, NULL, NULL, (void*)context, CallJs, &tsfn));
    void* retContext = nullptr;
    NAPI_CALL(env, napi_get_threadsafe_function_context(tsfn, &retContext));
    NAPI_ASSERT(env, retContext == context, "napi_get_threadsafe_function_context failed");

    napi_acquire_threadsafe_function(tsfn);
    napi_call_threadsafe_function(tsfn, NULL, napi_tsfn_blocking);
    
    NAPI_CALL(env, napi_ref_threadsafe_function(env, tsfn));
    NAPI_CALL(env, napi_unref_threadsafe_function(env, tsfn));
    NAPI_CALL(env, napi_release_threadsafe_function(tsfn, napi_tsfn_release));
    napi_value _value;
    NAPI_CALL(env, napi_create_int32(env, 1, &_value));
    return _value;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
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
        { "napiCancelAsyncWork", nullptr, napiCancelAsyncWork, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testAsyncWork", nullptr, testAsyncWork, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPromise", nullptr, testPromise, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "napiCreateFunction", nullptr, napiCreateFunction, nullptr, nullptr, nullptr, napi_default, nullptr },
        DECLARE_NAPI_FUNCTION("getGlobal", getGlobal),
        DECLARE_NAPI_FUNCTION("callFunction", callFunction),
        DECLARE_NAPI_FUNCTION("ThreadSafeTest", ThreadSafeTest),
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
