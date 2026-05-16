/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#ifndef COMMONTOOL_H
#define COMMONTOOL_H

#ifndef SUCCESS_CODE
#define SUCCESS_CODE 0
#endif

#ifndef SHA512_DIGEST_LENGTH
#define SHA512_DIGEST_LENGTH 64
#endif

#ifndef COMMON_TOOL_H
#define COMMON_TOOL_H

#include <cstddef>
#include <cstdint>
#include <ctime>
#include <iostream>
#include <string>
#include "napi/native_api.h"

// 自定义断言，如果失败，直接throw runtime_error，最小化逻辑变动
#ifndef CUSTOM_ASSERT
#define CUSTOM_ASSERT

struct AssertLocation {
    const char* file;
    int line;
};

template <typename T1, typename T2>
inline void AssertNeImpl(const T1& v1, const T2& v2, const char* expr1, const char* expr2, const AssertLocation& loc)
{
    if (v1 == v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr1 + " != " + expr2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertEqImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 != v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " == " + exp2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertGtImpl(const T1& v1, const T2& v2, const char* expr1, const char* expr2, const AssertLocation& loc)
{
    if (v1 <= v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr1 + " > " + expr2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertGeImpl(const T1& v1, const T2& v2, const char* expr1, const char* expr2, const AssertLocation& loc)
{
    if (v1 < v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr1 + " >= " + expr2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertLtImpl(const T1& v1, const T2& v2, const char* expr1, const char* expr2, const AssertLocation& loc)
{
    if (v1 >= v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr1 + " < " + expr2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1> inline void AssertTrueImpl(const T1& v1, const char* exp1, const AssertLocation& loc)
{
    if (!v1) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " == True , file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1> inline void AssertFalseImpl(const T1& v1, const char* exp1, const AssertLocation& loc)
{
    if (v1) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " == False , file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

#define ASSERT_NE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertNeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_GT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_GE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_LT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertLtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_TRUE(v1) /* NOLINT(G.PRE.02-CPP) */ AssertTrueImpl((v1), #v1, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_FALSE(v1) /* NOLINT(G.PRE.02-CPP) */ AssertFalseImpl((v1), #v1, AssertLocation({ __FILE__, __LINE__ }))

#endif // CUSTOM_ASSERT

int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue);

inline int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    return GetInt32ArgImpl(env, info, index, defaultValue);
}

template <typename Func> napi_value NapiTry(napi_env env, Func&& func)
{
    try {
        return func();
    } catch (const std::exception& e) {
        napi_throw_error(env, nullptr, e.what());
    } catch (...) {
        napi_throw_error(env, nullptr, "Unknown native error");
    }
    return nullptr;
}

void OHPrintf(const char* fmt, ...);

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len);

#endif // COMMON_TOOL_H
#endif // COMMONTOOL_H