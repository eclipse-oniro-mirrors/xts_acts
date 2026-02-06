/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <cmath>
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

namespace ActsMindSporeConstants {
extern const std::string FILES_DIR;
extern const std::string DEFAULT_TAG;
extern const std::string CACHE_DIR;
} // namespace ActsMindSporeConstants

namespace ActsMindSporeValues {
constexpr float DEFAULT_TOLERANCE = 0.01F;
constexpr float STRICT_TOLERANCE = 0.02F;
constexpr int OUTPUT_PRINT_LIMIT = 20;
constexpr size_t DEFAULT_PREDICT_LOOP = 50;
constexpr int NPU_SKIP_STATUS = 0;
} // namespace ActsMindSporeValues

void OHPrintf(const char* fmt, ...);

bool CompFp32WithTData(float* actualOutputData,
                       const std::string& expectedDataFile,
                       float rtol,
                       float atol,
                       bool isquant);

bool CompUint8WithTData(uint8_t* actualOutputData,
                        const std::string& expectedDataFile,
                        float rtol,
                        float atol,
                        bool isquant);
//// add for mslite test of int64:
void GetDimInfo(FILE* fp, std::vector<int64_t>* dim_info);
char* ReadFile(const char* file, size_t* size);
void PackNCHWToNHWCFp32(const char* src, char* dst, int batch, int plane, int channel);

uint64_t GetTimeInUs();
std::map<std::string, float> CalculateIntVector(std::vector<float> vec);

int SafeCopyNoInclude(char* dst, size_t maxLen, const char* src);

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len);

#define OH_AUDIO_STATUS_SUCCESS 0

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

template <typename T1, typename T2>
inline void AssertLeImpl(const T1& v1, const T2& v2, const char* expr1, const char* expr2, const AssertLocation& loc)
{
    if (v1 > v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + expr1 + " <= " + expr2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

#define ASSERT_NE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertNeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_GT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_GE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_LT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertLtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define ASSERT_LE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertLeImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

// EXPECT 宏与 ASSERT 宏行为相同（都抛出异常）
#define EXPECT_EQ(v1, v2) ASSERT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */
#define EXPECT_NE(v1, v2) ASSERT_NE(v1, v2) /* NOLINT(G.PRE.02-CPP) */
#define EXPECT_GE(v1, v2) ASSERT_GE(v1, v2) /* NOLINT(G.PRE.02-CPP) */
#define EXPECT_GT(v1, v2) ASSERT_GT(v1, v2) /* NOLINT(G.PRE.02-CPP) */
#define EXPECT_LE(v1, v2) ASSERT_LE(v1, v2) /* NOLINT(G.PRE.02-CPP) */
#define EXPECT_LT(v1, v2) ASSERT_LT(v1, v2) /* NOLINT(G.PRE.02-CPP) */

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

inline std::string FilePath(const char* name)
{
    return std::string(ActsMindSporeConstants::FILES_DIR) + name;
}

#endif // GE_COMMON_H