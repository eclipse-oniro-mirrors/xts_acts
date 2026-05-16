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

#include <cfloat>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <map>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <napi/native_api.h>
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_color_space.h>
#include <native_drawing/drawing_error_code.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_gpu_context.h>
#include <native_drawing/drawing_image.h>
#include <native_drawing/drawing_image_filter.h>
#include <native_drawing/drawing_mask_filter.h>
#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_memory_stream.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_record_cmd.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_round_rect.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_shader_effect.h>
#include <native_drawing/drawing_shadow_layer.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_typeface.h>
#include <native_drawing/drawing_types.h>
#include <native_drawing/drawing_surface.h>
#include <native_drawing/drawing_path_effect.h>
#include <native_drawing/drawing_lattice.h>
#include <native_drawing/drawing_path_iterator.h>
#include <stdexcept>
#include <string>
#include <vector>

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

constexpr float FLOAT_DATA_EPSILON = 1e-6f;
constexpr int RESULT_ERROR = -1;

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
inline void AssertGtImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 <= v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " > " + exp2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
}

template <typename T1, typename T2>
inline void AssertGEImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 < v2) {
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " >= " + exp2 + ", file: " + loc.file +
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

#define EXPECT_TRUE(v1) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), true, #v1, "true", AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_FALSE(v1) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), false, #v1, "false", AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_GT(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGtImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

#define EXPECT_GE(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertGEImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

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