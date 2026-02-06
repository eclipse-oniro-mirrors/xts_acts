/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#ifndef GE_COMMON_H
#define GE_COMMON_H

#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <map>
#include <stdexcept>
#include <string>
#include <vector>
#include "napi/native_api.h"

using std::cout;
using std::endl;
using std::fstream;
using std::ifstream;
using std::ios;
using std::map;
using std::max;
using std::min;
using std::string;
using std::stringstream;
using std::to_string;
using std::vector;

constexpr int TEST_SUCCESS_CODE = 0;
constexpr float FLOAT_DATA_EPSILON = 1e-6f;

// Common numeric constants
constexpr int ZERO = 0;
constexpr int ONE = 1;
constexpr int TWO = 2;
constexpr int THREE = 3;
constexpr int SIX = 6;
constexpr int TEN = 10;
constexpr uint32_t FONT_BUFFER_SIZE = 128;
constexpr uint32_t COLOR_ALPHA_OPAQUE = 0xFF;
constexpr uint32_t COLOR_RGB_BLACK = 0x00;
constexpr uint32_t COLOR_RGB_WHITE = 0xFF;
constexpr uint32_t COLOR_RGB_01 = 0x01;
constexpr uint32_t COLOR_RGB_02 = 0x02;
constexpr uint32_t COLOR_RGB_03 = 0x03;

namespace ActsNNCoreOpsConstants {
extern const std::string DEFAULT_TAG;
} // namespace ActsNNCoreOpsConstants

void OHPrintf(const char* fmt, ...);

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len);

const char* GetSystemDefaultFont(bool replaceUnderline = false);

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

template <typename T1, typename T2, typename T3>
inline void AssertNearImpl(const T1& v1, const T2& v2, const T3& absError, const char* exp3, const AssertLocation& loc)
{
    if (std::fabs(static_cast<double>(v1 - v2)) > static_cast<double>(absError)) {
        throw std::runtime_error(std::string("Assertion failed: | diff limit is ") + exp3 +
                                 ", actual diff: " + std::to_string(static_cast<double>(v1 - v2)) +
                                 ", file: " + loc.file + ", line: " + std::to_string(loc.line));
    }
}

inline void AssertTrueImpl(bool value, const char* expr, const AssertLocation& loc)
{
    if (!value) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr + " is false, file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

inline void AssertFalseImpl(bool value, const char* expr, const AssertLocation& loc)
{
    if (value) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr + " is true, file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertLeImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 > v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " > " + exp2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertGeImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 < v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " < " + exp2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertGtImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 <= v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " <= " + exp2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

inline void AssertFloatEqImpl(float v1, float v2, const char* expr1, const char* expr2, const AssertLocation& loc)
{
    if (std::fabs(v1 - v2) > FLOAT_DATA_EPSILON) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr1 + " ~= " + expr2 +
                                 " (lhs=" + std::to_string(v1) + ", rhs=" + std::to_string(v2) +
                                 ", eps=" + std::to_string(FLOAT_DATA_EPSILON) + ")" + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

#define EXPECT_NE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertNeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_NE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertNeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_NEAR(v1, v2, abs_error) /* NOLINT(G.PRE.02-CPP) */ \
    AssertNearImpl((v1), (v2), (abs_error), #abs_error, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_TRUE(expr) /* NOLINT(G.PRE.02-CPP) */ \
    AssertTrueImpl(static_cast<bool>(expr), #expr, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_TRUE(expr) /* NOLINT(G.PRE.02-CPP) */ \
    AssertTrueImpl(static_cast<bool>(expr), #expr, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_FALSE(expr) /* NOLINT(G.PRE.02-CPP) */ \
    AssertFalseImpl(static_cast<bool>(expr), #expr, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_LE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertLeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_GE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_LE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertLeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_GE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_GT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_GT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_NO_FATAL_FAILURE(stmt) /* NOLINT(G.PRE.02-CPP) */                                     \
    do {                                                                                             \
        try {                                                                                        \
            stmt;                                                                                    \
        } catch (const std::exception& e) {                                                          \
            throw std::runtime_error(std::string("EXPECT_NO_FATAL_FAILURE failed: ") + e.what() +    \
                                     ", file: " + __FILE__ + ", line: " + std::to_string(__LINE__)); \
        }                                                                                            \
    } while (0)

#define EXPECT_FLOAT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertFloatEqImpl(static_cast<float>(v1), static_cast<float>(v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

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

#endif // GE_COMMON_H