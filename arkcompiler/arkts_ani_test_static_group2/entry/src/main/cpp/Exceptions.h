/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_EXCEPTIONS_H
#define ARKTS_ANI_TEST_EXCEPTIONS_H
#include "Common.h"
#include <sstream>
#include <regex>

ani_int test_ExistUnhandledError([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr const ani_size EXPECTED_SIZE = 10U;
    ani_arraybuffer arrayBuffer;
    int8_t *data = nullptr;
    auto status = env->CreateArrayBuffer(EXPECTED_SIZE, reinterpret_cast<void **>(&data), &arrayBuffer);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(arrayBuffer, nullptr);
    ASSERT_NE(data, nullptr);
    ani_boolean hasError = ANI_FALSE;
    ASSERT_EQ(env->ExistUnhandledError(&hasError), ANI_OK);
    ASSERT_EQ(hasError, ANI_FALSE);
    return ANI_TRUE;
}

ani_int GetFunctionFromModule(ani_env *env, ani_namespace *ns, ani_function *func, const char *functionName,
                              const char *signature)
{
    ASSERT_NE(ns, nullptr);
    ASSERT_NE(func, nullptr);

    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.Exception.testing", ns), ANI_OK);
    ASSERT_EQ(env->Namespace_FindFunction(*ns, functionName, signature, func), ANI_OK);

    return ANI_TRUE;
}

ani_function GetThrowErrorFunction(ani_env *env)
{
    ani_namespace ns = nullptr;
    ani_function func = nullptr;
    GetFunctionFromModule(env, &ns, &func, "throwError", "i:i");
    return func;
}

ani_int test_ResetError([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);

    ani_int errorResult = 0;
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ani_int tmpNum = 5;
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, tmpNum), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_function GetThrowErrorNested(ani_env *env)
{
    ani_namespace ns = nullptr;
    ani_function func = nullptr;
    GetFunctionFromModule(env, &ns, &func, "throwErrorNested", "i:i");
    return func;
}

ani_int GetThrowErrorThroughNative(ani_env *env, ani_namespace *ns, ani_function *func)
{
    GetFunctionFromModule(env, ns, func, "throwErrorThroughNative", "i:i");
    return ANI_TRUE;
}

ani_int test_Handling_Error_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int magicNumber = 5;
    auto func = GetThrowErrorFunction(env);

    ani_int errorResult = 0;
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Handling_Error_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->c_api->ExistUnhandledError(nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Handling_Error_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int magicNumber = 5;
    auto func = GetThrowErrorFunction(env);

    ani_int errorResult = 0;
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Handling_Error_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int magicNumber = 5;
    auto func = GetThrowErrorFunction(env);

    ani_int errorResult = 0;
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ani_error error {};
    ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);
    ASSERT_NE(error, nullptr);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Handling_Error_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_boolean result = ANI_FALSE;

    auto func = GetThrowErrorFunction(env);
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ani_error error {};
    ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);

    ASSERT_EQ(env->ThrowError(error), ANI_OK);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    ASSERT_EQ(env->ThrowError(nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->ThrowError(nullptr, error), ANI_INVALID_ARGS);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

std::string GetTraceLine(std::string_view functionName)
{
    constexpr std::string_view NAMESPACE_NAME = "testing";
    std::stringstream ss;
    ss << "at error_handling_test." << NAMESPACE_NAME << '.' << functionName;
    return ss.str();
}

size_t CountSubstr(const std::string &str, const std::string &substr)
{
    if (substr.empty()) {
        return 0;
    }
    size_t count = 0;
    size_t pos = str.find(substr);
    while (pos != std::string::npos) {
        ++count;
        pos = str.find(substr, pos + substr.length());
    }
    return count;
}

ani_int GetErrorDescription(ani_env *env, std::string &output)
{
    std::ostringstream buffer;

    std::streambuf *oldStderr = std::cerr.rdbuf(buffer.rdbuf());
    ani_status status = env->DescribeError();
    std::cerr.rdbuf(oldStderr);

    ASSERT_EQ(status, ANI_OK);
    output = buffer.str();
    return ANI_TRUE;
}

ani_int CheckErrorDescription(const std::string &errorDescription, const std::string &errorMessage,
                              const std::vector<std::string> &stackTrace)
{
    std::vector<size_t> stackTraceIndexes;
    stackTraceIndexes.reserve(stackTrace.size() + 1);
    stackTraceIndexes.push_back(errorDescription.find(errorMessage));
    for (const auto &traceLine : stackTrace) {
        stackTraceIndexes.push_back(errorDescription.find(traceLine));
    }

    for (size_t i = 0; i < stackTraceIndexes.size(); ++i) {
        ASSERT_NE(stackTraceIndexes[i], std::string::npos);
    }
    std::string stackTracePrefix = "at ";
    ASSERT_EQ(CountSubstr(errorDescription, stackTracePrefix), stackTrace.size());
    return ANI_TRUE;
}

ani_int TestDescribeError(ani_env *env, ani_function func, ani_int arg, std::string &output)
{
    ani_boolean errorExists = ANI_FALSE;
    ASSERT_EQ(env->ExistUnhandledError(&errorExists), ANI_OK);
    ASSERT_EQ(errorExists, ANI_FALSE);
    ani_int ignored = 0;
    ASSERT_EQ(env->Function_Call_Int(func, &ignored, arg), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    ASSERT_EQ(env->ExistUnhandledError(&errorExists), ANI_OK);
    ASSERT_EQ(errorExists, ANI_TRUE);

    GetErrorDescription(env, output);

    // Check that error still exists
    ASSERT_EQ(env->ExistUnhandledError(&errorExists), ANI_OK);
    ASSERT_EQ(errorExists, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_Handling_Error_Test1([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    constexpr ani_int magicNumber = 5;
    constexpr std::string_view MESSAGE_FROM_THROW_ERROR = "some error message from throwError";
    std::string output;
    TestDescribeError(env, func, magicNumber, output);

    CheckErrorDescription(output, std::string(MESSAGE_FROM_THROW_ERROR),
                          {"at escompat.Error.<ctor>", GetTraceLine("throwError")});
    return ANI_TRUE;
}

ani_int test_Handling_Error_Test2([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorNested(env);
    constexpr ani_int magicNumber = 5;
    constexpr std::string_view MESSAGE_FROM_THROW_ERROR = "some error message from throwError";
    std::string output;
    TestDescribeError(env, func, magicNumber, output);

    CheckErrorDescription(output, std::string(MESSAGE_FROM_THROW_ERROR),
                          {"at escompat.Error.<ctor>", GetTraceLine("throwError"), GetTraceLine("bar"),
                           GetTraceLine("baz"), GetTraceLine("throwErrorNested")});
    return ANI_TRUE;
}

ani_long callThroughNative([[maybe_unused]] ani_env *env, ani_int a)
{
    const std::string namespaceDescriptor;
    ani_namespace ns = nullptr;
    [[maybe_unused]] auto status = env->FindNamespace(namespaceDescriptor.data(), &ns);
    ASSERT_EQ(status, ANI_OK);

    std::string_view methodName = "throwToNativeCaller";
    ani_function func = nullptr;
    status = env->Namespace_FindFunction(ns, methodName.data(), "i:i", &func);
    ASSERT_EQ(status, ANI_OK);

    ani_int result = 0;
    status = env->Function_Call_Int(func, &result, a);
    if (status == ANI_PENDING_ERROR) {
        return 0;
    }

    ani_boolean errorExists = ANI_FALSE;
    status = env->ExistUnhandledError(&errorExists);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(errorExists, ANI_FALSE);
    return a + result;
}

ani_int test_Handling_Error_Test3([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int magicNumber = 5;
    ani_namespace ns = nullptr;
    ani_function func = nullptr;
    GetThrowErrorThroughNative(env, &ns, &func);

    ani_native_function fn {"callThroughNative", "i:i", reinterpret_cast<void *>(callThroughNative)};
    ASSERT_EQ(env->Namespace_BindNativeFunctions(ns, &fn, 1), ANI_OK);

    std::string output;
    TestDescribeError(env, func, magicNumber, output);

    CheckErrorDescription(output, "Error",
                          {"at escompat.Error.<ctor>", GetTraceLine("throwToNativeCaller"),
                           GetTraceLine("callThroughNative"), GetTraceLine("throwErrorThroughNative")});
    return ANI_TRUE;
}


ani_int test_Handling_Error_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->ExistUnhandledError(nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Handling_Error_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_boolean result = ANI_TRUE;
        ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
        ASSERT_EQ(result, ANI_FALSE);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);

        ani_boolean result = ANI_FALSE;
        ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
    }
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Handling_Error_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);

        ani_boolean result = ANI_FALSE;
        ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);

        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
        ASSERT_EQ(result, ANI_FALSE);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_boolean result = ANI_TRUE;
        ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
        ASSERT_EQ(result, ANI_FALSE);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->ResetError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);

        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);

        ani_boolean result = ANI_TRUE;
        ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
        ASSERT_EQ(result, ANI_FALSE);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->ResetError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->c_api->ResetError(nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Handling_Error_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }

    return ANI_TRUE;
}

ani_int test_Handling_Error_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);

        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->ResetError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->c_api->ResetError(nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Handling_Error_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);

        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    for (int32_t i = 0; i < loopCount; i++) {
        ani_int errorResult = 0;
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);

        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    for (int i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->c_api->DescribeError(nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Handling_Error_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_boolean result = ANI_FALSE;
    ani_error error {};
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->ThrowError(error), ANI_OK);
    }
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Handling_Error_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string_view MESSAGE_FROM_THROW_ERROR = "some error message from throwError";
    ani_class errorClass {};
    ASSERT_EQ(env->FindClass("escompat.Error", &errorClass), ANI_OK);
    ASSERT_NE(errorClass, nullptr);

    ani_method constructor {};
    ASSERT_EQ(env->Class_FindMethod(errorClass, "<ctor>", "C{std.core.String}:", &constructor), ANI_OK);
    ASSERT_NE(constructor, nullptr);

    ani_string errorMessage {};
    ASSERT_EQ(env->String_NewUTF8(MESSAGE_FROM_THROW_ERROR.data(), MESSAGE_FROM_THROW_ERROR.size(), &errorMessage),
              ANI_OK);
    ASSERT_NE(errorMessage, nullptr);

    ani_object errorObject {};
    ASSERT_EQ(env->Object_New(errorClass, constructor, &errorObject, errorMessage), ANI_OK);
    ASSERT_NE(errorObject, nullptr);

    ani_boolean hasError = ANI_TRUE;
    ASSERT_EQ(env->ExistUnhandledError(&hasError), ANI_OK);
    ASSERT_EQ(hasError, ANI_FALSE);

    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}


ani_int test_Handling_Error_30([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error error {};
    ASSERT_EQ(env->GetUnhandledError(nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->c_api->GetUnhandledError(nullptr, &error), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Handling_Error_31([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_error error {};
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);
        ASSERT_EQ(env->ResetError(), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_32([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    ani_error error {};
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->GetUnhandledError(&error), ANI_ERROR);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_33([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const int32_t loopCount = 3;
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_error error {};
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
        ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);

        ASSERT_EQ(env->ResetError(), ANI_OK);
        ASSERT_EQ(env->GetUnhandledError(&error), ANI_ERROR);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_35([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    ani_error error {};
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->GetUnhandledError(&error), ANI_ERROR);
    }
    return ANI_TRUE;
}

ani_int test_Handling_Error_36([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_error error {};
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);
    ASSERT_EQ(env->ThrowError(error), ANI_OK);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    ASSERT_EQ(env->ExistUnhandledError(&result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Handling_Error_37([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_error error {};
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);
    ASSERT_EQ(env->ThrowError(error), ANI_OK);
    ASSERT_EQ(env->ResetError(), ANI_OK);
    return ANI_TRUE;
}

std::string GetErrorProperty(ani_env *aniEnv, ani_error aniError, const char *property)
{
    std::string propertyValue;
    ani_type errorType = nullptr;
    if ((aniEnv->Object_GetType(aniError, &errorType)) != ANI_OK) {
        return propertyValue;
    }
    ani_method getterMethod = nullptr;
    if ((aniEnv->Class_FindGetter(static_cast<ani_class>(errorType), property, &getterMethod)) != ANI_OK) {
        return propertyValue;
    }
    ani_ref aniRef = nullptr;
    if ((aniEnv->Object_CallMethod_Ref(aniError, getterMethod, &aniRef)) != ANI_OK) {
        return propertyValue;
    }
    auto aniString = reinterpret_cast<ani_string>(aniRef);
    ani_size sz {};
    if ((aniEnv->String_GetUTF8Size(aniString, &sz)) != ANI_OK) {
        return propertyValue;
    }
    propertyValue.resize(sz + 1);
    if ((aniEnv->String_GetUTF8SubString(aniString, 0, sz, propertyValue.data(), propertyValue.size(), &sz)) !=
        ANI_OK) {
        return propertyValue;
    }
    propertyValue.resize(sz);
    return propertyValue;
}

ani_int test_Handling_Error_38([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto func = GetThrowErrorFunction(env);
    const ani_int magicNumber = 5;
    ani_int errorResult = 0;
    ani_error error {};
    ASSERT_EQ(env->Function_Call_Int(func, &errorResult, magicNumber), ANI_PENDING_ERROR);
    ASSERT_EQ(env->GetUnhandledError(&error), ANI_OK);
    ASSERT_EQ(env->ResetError(), ANI_OK);

    std::string stack = GetErrorProperty(env, error, "stack");
    std::stringstream ss(stack);
    std::regex pattern(R"(\s*at .*(\d+):(\d+)\))");
    std::string token;

    while (std::getline(ss, token, '\n')) {
        ASSERT_EQ(std::regex_match(token, pattern), ANI_TRUE);
    }
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_EXCEPTIONS_H
