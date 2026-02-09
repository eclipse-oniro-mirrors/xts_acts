/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/OhosCommonTest.h"
#include <cfloat>
#include <cinttypes>
#include <climits>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <fstream>
#include <functional>
#include <hilog/log.h>
#include <iostream>
#include <malloc.h>
#include <map>
#include <numeric>
#include <regex>
#include <sstream>
#include <string>
#include <sys/time.h>
#include <unistd.h>
#include <vector>

namespace ActsMindSporeConstants {
const std::string DEFAULT_TAG = "ActsMindSporeCTest";
const std::string FILES_DIR = "/data/storage/el2/base/haps/mind_spore_test/files/";
const std::string CACHE_DIR = "/data/storage/el2/base/haps/mind_spore_test/cache/";
} // namespace ActsMindSporeConstants

namespace {
constexpr size_t FORMAT_PUBLIC_RESERVED = 25;
constexpr size_t PRINTF_BUFFER_SIZE = 1024;
constexpr int MAX_HEAD_SIZE = 50;
constexpr uint32_t FAIL_PRINT_LIMIT = 100;
constexpr float QUANT_TOL_THRESHOLD = 0.04f;
constexpr uint32_t PREVIEW_ELEMENT_LIMIT = 10;
constexpr uint64_t DATA_SIZE_INIT = 1;
constexpr float DEFAULT_RTOL = 1e-05f;
constexpr float DEFAULT_ATOL = 1e-08f;
constexpr float EPSILON_OFFSET = 1.0f;
constexpr int INDEX_OFFSET_ONE = 1;
constexpr int CSV_SUCCESS_FLAG = 1;
constexpr int CSV_FAIL_FLAG = 0;
constexpr float ZERO_THRESHOLD = 0.0f;
constexpr int FLOAT32_BYTE_SIZE = 4;
constexpr int FLOAT32_BYTE_OFFSET_1 = 1;
constexpr int FLOAT32_BYTE_OFFSET_2 = 2;
constexpr int FLOAT32_BYTE_OFFSET_3 = 3;
constexpr uint64_t MICROSECONDS_PER_SECOND = 1000000;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
constexpr int ERROR_CODE_NEGATIVE_THREE = -3;
constexpr int SUCCESS_CODE = 0;
constexpr int STRING_OFFSET_ONE = 1;
constexpr int FILE_SEEK_START = 0;

struct AllCloseInt8Options {
    uint8_t* a;
    uint8_t* b;
    uint64_t count;
    float rTol;
    float aTol;
    bool isQuant;
};

struct AllCloseFloatOptions {
    float* a;
    float* b;
    uint64_t count;
    float rTol;
    float aTol;
    bool isQuant;
};
} // namespace

void ConvertToPublic(const char* fmt, char* out, size_t outSize)
{
    const char* p = fmt;
    char* q = out;

    while (*p && static_cast<size_t>(q - out) < outSize - FORMAT_PUBLIC_RESERVED) {
        // 格式起点：% 但不是 %{public}
        if (*p == '%' && *(p + 1) != '{') {
            p++; // 跳过%
            // 写入 %{public}
            SafeMemcpy(q, outSize - (q - out), "%{public}", outSize - (q - out) - 1);
            q += strlen("%{public}");
            // 拷贝所有格式修饰符（如 03、-20、.2、ll、h 等）
            while (*p && strchr("0123456789.+-hlLjzt", *p)) {
                *q++ = *p++;
            }
            // 最终的类型符号（s d f p x c g u l 等等）
            if (*p) {
                *q++ = *p++;
            }

            continue;
        }
        // 普通字符
        *q++ = *p++;
    }

    *q = '\0';
}

void OHPrintf(const char* fmt, ...)
{
    char fmtPublic[PRINTF_BUFFER_SIZE];
    ConvertToPublic(fmt, fmtPublic, sizeof(fmtPublic));

    va_list args;
    va_start(args, fmt);
    OH_LOG_VPrint(LOG_APP, LOG_DEBUG, LOG_DOMAIN, ActsMindSporeConstants::DEFAULT_TAG.c_str(), fmtPublic, args);
    va_end(args);
}

/*
 * GetDimInfo: get dim info from data file(int64_t)
 * fp: the testing datafile object
 * dim_info: array to store the info of the dim in datafile, like
 * [4,3,3,6,3,162(3*3*6*3)],4 is dim size,3,3,6,3 is the dim shape data_size:
 * the size of the testing data including the data file
 * */
void GetDimInfo(FILE* fp, std::vector<int64_t>* dimInfo)
{
    uint32_t* dimBuffer = reinterpret_cast<uint32_t*>(malloc(MAX_HEAD_SIZE * sizeof(uint32_t)));
    size_t readSize = fread(dimBuffer, sizeof(uint32_t), MAX_HEAD_SIZE, fp);
    if (readSize == 0) {
        free(dimBuffer);
        return;
    }
    dimInfo->push_back(*dimBuffer); // get dim size

    // get data shape to compute the datasize
    uint64_t dataSize = DATA_SIZE_INIT;
    uint32_t index = INDEX_OFFSET_ONE;
    for (; index <= dimInfo->at(0); index++) {
        dimInfo->push_back(*(dimBuffer + index));
        dataSize *= *(dimBuffer + index);
    }
    dimInfo->push_back(dataSize);

    free(dimBuffer);
}

/*
 * readTestDataFile: 从HISI .t 数据文件中读取测试数据（int64）
 * infile: HISI .t 数据文件的路径
 * return: dim_info: 存储数据文件中维度信息的数组，如 [4,3,3,,3]，4 是维度大小，3,3,6,3 是维度形状
 */
void* ReadTestDataFile(std::string infile, std::vector<int64_t>* dimInfoOut)
{
    OHPrintf("\n [common.cpp] Loading data from: %s\n", infile.c_str());
    FILE* fp = fopen(infile.c_str(), "r");
    if (fp == nullptr) {
        OHPrintf("ERROR: cant't open file %s\n", infile.c_str());
        return nullptr;
    } else {
        std::vector<int64_t> dimInfo;
        std::vector<int64_t>* dimInfoPtr = &dimInfo;
        GetDimInfo(fp, dimInfoPtr);
        uint64_t dataSize = dimInfoPtr->at(dimInfoPtr->size() - 1);
        fclose(fp);
        fp = fopen(infile.c_str(), "r");
        if (fp == nullptr) {
            OHPrintf("ERROR: cant't open file %s\n", infile.c_str());
            return nullptr;
        }
        uint32_t* memory = reinterpret_cast<uint32_t*>(malloc((dimInfo[0] + INDEX_OFFSET_ONE) * sizeof(uint32_t)));
        size_t ret = fread(memory, sizeof(uint32_t), (dimInfo[0] + INDEX_OFFSET_ONE), fp);
        if (ret == 0 || dataSize == 0 || dataSize > SIZE_MAX / sizeof(uint32_t)) {
            free(memory);
            fclose(fp);
            return nullptr;
        }
        uint32_t* data = reinterpret_cast<uint32_t*>(malloc(dataSize * sizeof(uint32_t)));
        size_t ret2 = fread(data, sizeof(uint32_t), dataSize, fp);
        if (ret2 == 0) {
            free(data);
            fclose(fp);
            return nullptr;
        }
        free(memory);
        fclose(fp);
        for (int i = 0; i < dimInfo[0]; i++) {
            dimInfoOut->push_back(dimInfo[i + INDEX_OFFSET_ONE]);
        }
        OHPrintf("\n [common.cpp] Read test data file Over, get dimInfo as: (");
        int count = dimInfoOut->size();
        for (int i = 0; i < count; i++) {
            OHPrintf("%" PRId64, dimInfoOut->at(i));
        }
        OHPrintf(")\n");
        return data;
    }
}

/*
 * allclose
 * param:
 *  a:compared file a
 *  b:compared file b
 *  count: the count size which will compare
 *  rtol: 相对容差
 *  atol: 绝对容差
 * return:
 *  true or false
 * */
namespace {
struct FloatCompareStats {
    uint32_t failCount = 0;
    float tol = 0;
    float tol1 = 0;
    float tol2 = 0;
    bool nanOccurInAccuray = false;
    float sum = 0.0f;
    float rtol;
    float atol;
};

void ProcessFloatElement(float aVal, float bVal, uint32_t idx, FloatCompareStats& stats)
{
    float diff = fabs(aVal - bVal);
    if (isnan(aVal) || isinf(aVal)) {
        stats.failCount++;
        stats.nanOccurInAccuray = true;
        if (stats.failCount < FAIL_PRINT_LIMIT) {
            OHPrintf("     i = %2u:   %+f  |  %+f\n", idx, aVal, bVal);
        }
    } else if (diff > (stats.atol + stats.rtol * fabs(bVal))) {
        stats.tol += diff / (fabs(bVal) + EPSILON_OFFSET);
        stats.tol1 += diff;
        stats.tol2 += diff / fabs(bVal);
        stats.failCount++;
        if (stats.failCount < FAIL_PRINT_LIMIT) {
            OHPrintf("     i = %2u:   %+f  |  %+f\n", idx, aVal, bVal);
        }
    }
}

struct PrintFloatStatsAndWriteCsvParams {
    uint64_t count;
    float sumAll;
    float maximum;
    float minimum;
};

void PrintFloatStatsAndWriteCsv(const FloatCompareStats& stats, uint64_t& c, PrintFloatStatsAndWriteCsvParams params)
{
    OHPrintf("     ......\n");
    OHPrintf("\n *** Total fail_count: %u\n", stats.failCount);
    if (stats.failCount != 0) {
        float avgTol = stats.tol / stats.failCount;
        float avgAbsDiff = stats.tol1 / stats.failCount;
        float avgRelDiff = stats.tol2 / stats.failCount;
        OHPrintf("\n     fabs(a[i] - b[i])/(fabs(b[i])+1) : %f\n", avgTol);
        OHPrintf("\n     fabs(a[i] - b[i]) : %f\n", avgAbsDiff);
        OHPrintf("\n     fabs(a[i] - b[i])/fabs(b[i]) : %f\n", avgRelDiff);
    }
    c += params.count;
    float avg = (params.count > 0) ? (stats.sum / params.count) : 0.0f;
    OHPrintf("\n     avg : %f\n", avg);
    OHPrintf("\n     min : %f\n", params.minimum);
    OHPrintf("\n     max :  %f\n", params.maximum);
    if (c != 0) {
        OHPrintf("\n     avg_all :  %f\n", params.sumAll / c);
    }
    OHPrintf("\n");

    fstream file;
    file.open("cout.csv", ios::app);
    file << "," << CSV_SUCCESS_FLAG << "," << CSV_FAIL_FLAG << "," << params.maximum;
    float csvAvg = (stats.failCount == 0 && c > 0) ? (params.sumAll / c)
                                                   : ((stats.failCount > 0) ? (stats.tol / stats.failCount) : 0.0f);
    file << "," << csvAvg;
    file.close();
}

bool CheckFloatFinalResult(const FloatCompareStats& stats, float rtol, float atol, bool isquant)
{
    if (stats.nanOccurInAccuray) {
        OHPrintf("\n[common.cpp] eval output include some NAN/INF\n");
        return false;
    }
    if (stats.failCount > 0) {
        OHPrintf("\n *** These data compare failed: atol = %f, rtol = %f\n", atol, rtol);
        OHPrintf("\n");
        if (isquant && (stats.tol / stats.failCount) < QUANT_TOL_THRESHOLD) {
            return true;
        }
        return false;
    }
    return true;
}

} // namespace

/*
 * allclose
 * param:
 *  a:compared file a
 *  b:compared file b
 *  count: the count size which will compare
 *  rtol: 相对容差
 *  atol: 绝对容差
 * return:
 *  true or false
 * */
bool AllCloseFloat(const AllCloseFloatOptions options)
{
    if (options.a == nullptr || options.a == nullptr) {
        return false;
    }
    FloatCompareStats stats;
    static float sumAll;
    static float maximum = 0;
    static float minimum = 0;
    static uint64_t c = 0;

    for (uint32_t i = 0; i < options.count; ++i) {
        float diff = fabs(options.a[i] - options.b[i]);
        float denom = options.aTol + options.rTol * fabs(options.b[i]);
        if (denom == 0.0f) {
            denom = EPSILON_OFFSET;
        }
        float normDiff = diff / denom;
        stats.sum += normDiff;
        sumAll += normDiff;
        maximum = max(maximum, normDiff);
        minimum = min(minimum, normDiff);
        stats.rtol = options.rTol;
        stats.atol = options.aTol;
        ProcessFloatElement(options.a[i], options.b[i], i, stats);
        if (i == options.count - INDEX_OFFSET_ONE) {
            PrintFloatStatsAndWriteCsvParams params;
            params.count = options.count;
            params.sumAll = sumAll;
            params.maximum = maximum;
            params.minimum = minimum;
            PrintFloatStatsAndWriteCsv(stats, c, params);
        }
    }
    return CheckFloatFinalResult(stats, options.rTol, options.aTol, options.isQuant);
}

namespace {
struct Int8CompareStats {
    uint32_t failCount = 0;
    float tol = 0;
    float tol1 = 0;
    float tol2 = 0;
    bool nanOccurInAccuray = false;
    float sum = 0.0f;
};

void ProcessInt8Element(uint8_t aVal, uint8_t bVal, uint32_t idx, Int8CompareStats& stats)
{
    if (isnan(aVal) || isinf(aVal)) {
        stats.failCount++;
        stats.nanOccurInAccuray = true;
        if (stats.failCount < FAIL_PRINT_LIMIT) {
            OHPrintf("     i = %2u:   %+f  |  %+f\n", idx, static_cast<float>(aVal), static_cast<float>(bVal));
        }
    } else if (fabs(aVal - bVal) > ZERO_THRESHOLD) {
        stats.tol += fabs(aVal - bVal) / (fabs(bVal) + EPSILON_OFFSET);
        stats.tol1 += fabs(aVal - bVal);
        stats.tol2 += fabs(aVal - bVal) / fabs(bVal);
        stats.failCount++;
        OHPrintf("%2d", static_cast<int>(fabs(aVal - bVal)));
        OHPrintf("     i = %2u:   %2d  |  %2d\n", idx, aVal, bVal);
    }
}

struct PrintInt8StatsAndWriteCsvParams {
    uint64_t count;
    float sumAll;
    float maximum;
    float minimum;
    uint64_t& countAll;

    explicit PrintInt8StatsAndWriteCsvParams(uint64_t& countAll) : countAll(countAll) {}
};

void PrintInt8StatsAndWriteCsv(const Int8CompareStats& stats, PrintInt8StatsAndWriteCsvParams params)
{
    OHPrintf("     ……\n");
    OHPrintf("\n *** Total fail_count: %u\n", stats.failCount);
    if (stats.failCount != 0) {
        float avgTol = stats.tol / stats.failCount;
        float avgAbsDiff = stats.tol1 / stats.failCount;
        float avgRelDiff = stats.tol2 / stats.failCount;
        OHPrintf("\n     fabs(a[i] - b[i])/(fabs(b[i])+1) : %f\n", avgTol);
        OHPrintf("\n     fabs(a[i] - b[i]) : %f\n", avgAbsDiff);
        OHPrintf("\n     fabs(a[i] - b[i])/fabs(b[i]) : %f\n", avgRelDiff);
    }
    params.countAll += params.count;
    float avg = (params.count > 0) ? (stats.sum / params.count) : 0.0f;
    OHPrintf("\n     avg : %f\n", avg);
    OHPrintf("\n     min : %f\n", params.minimum);
    OHPrintf("\n     max :  %f\n", params.maximum);
    OHPrintf("\n     avg_all :  %f\n", params.sumAll / params.countAll);
    OHPrintf("\n");

    fstream file;
    file.open("cout.csv", ios::app);
    file << "," << CSV_SUCCESS_FLAG << "," << CSV_FAIL_FLAG << "," << params.maximum;
    float csvAvg = (stats.failCount == 0 && params.countAll > 0)
                       ? (params.sumAll / params.countAll)
                       : ((stats.failCount > 0) ? (stats.tol / stats.failCount) : 0.0f);
    file << "," << csvAvg;
    file.close();
}

bool CheckInt8FinalResult(const Int8CompareStats& stats, float rtol, float atol, bool isquant)
{
    if (stats.nanOccurInAccuray) {
        OHPrintf("\n[common.cpp] eval output include some NAN/INF\n");
        return false;
    }
    if (stats.failCount > 0) {
        OHPrintf("\n *** These data compare failed: atol = %f, rtol = %f\n", atol, rtol);
        OHPrintf("\n");
        if (isquant && (stats.tol / stats.failCount) < QUANT_TOL_THRESHOLD) {
            return true;
        }
        return false;
    }
    return true;
}

} // namespace

bool AllCloseInt8(const AllCloseInt8Options options)
{
    if (options.a == nullptr || options.b == nullptr) {
        return false;
    }
    Int8CompareStats stats;
    static float sumAll;
    static float maximum = 0;
    static float minimum = 0;
    static uint64_t countAll = 0;

    for (uint32_t i = 0; i < options.count; ++i) {
        float diff = fabs(options.a[i] - options.b[i]);
        float denom = options.aTol + options.rTol * fabs(options.b[i]);
        if (denom == 0.0f) {
            denom = EPSILON_OFFSET;
        }
        float normDiff = diff / denom;
        stats.sum += normDiff;
        sumAll += normDiff;
        maximum = max(static_cast<double>(maximum), static_cast<double>(normDiff));
        minimum = min(static_cast<double>(minimum), static_cast<double>(normDiff));

        ProcessInt8Element(options.a[i], options.b[i], i, stats);

        if (i == options.count - INDEX_OFFSET_ONE) {
            PrintInt8StatsAndWriteCsvParams params = PrintInt8StatsAndWriteCsvParams(countAll);
            params.count = options.count;
            params.sumAll = sumAll;
            params.maximum = maximum;
            params.minimum = minimum;
            PrintInt8StatsAndWriteCsv(stats, params);
        }
    }
    return CheckInt8FinalResult(stats, options.rTol, options.aTol, options.isQuant);
}

/*
 * CompFp32WithTData: compare the data with the data in hisi .t file
 * param:
 *  actualOutputData: the result of ge
 *  expectedDataFile: the path of hisi .t result file
 *  rtol: 相对容差
 *  atol: 绝对容差
 * return:
 *  true of false
 * */
bool CompFp32WithTData(float* actualOutputData,
                       const std::string& expectedDataFile,
                       float rTol = DEFAULT_RTOL,
                       float aTol = DEFAULT_ATOL,
                       bool isQuant = false)
{
    std::vector<int64_t> dimInfo;
    std::vector<int64_t>* dimInfoPtr = &dimInfo;
    float* expectedOutputData = reinterpret_cast<float*>(ReadTestDataFile(expectedDataFile, dimInfoPtr));
    uint32_t i = 0;
    uint64_t dataSize =
        accumulate(dimInfo.begin(), dimInfo.end(), static_cast<uint64_t>(1), std::multiplies<uint64_t>());

    // print caffe/tf output:
    OHPrintf("[common.cpp] expected output data:");
    for (; i < dataSize && i < PREVIEW_ELEMENT_LIMIT; i++) {
        OHPrintf("%4f ", expectedOutputData[i]);
    }
    OHPrintf("\n");
    AllCloseFloatOptions options;
    options.a = actualOutputData;
    options.b = expectedOutputData;
    options.count = dataSize;
    options.rTol = rTol;
    options.aTol = aTol;
    options.isQuant = isQuant;
    bool ret = AllCloseFloat(options);
    free(expectedOutputData);
    return ret;
}

bool CompUint8WithTData(uint8_t* actualOutputData,
                        const std::string& expectedDataFile,
                        float rTol = DEFAULT_RTOL,
                        float aTol = DEFAULT_ATOL,
                        bool isQuant = false)
{
    std::vector<int64_t> dimInfo;
    std::vector<int64_t>* dimInfoPtr = &dimInfo;
    auto dataFile = ReadTestDataFile(expectedDataFile, dimInfoPtr);
    if (dataFile == nullptr) {
        return false;
    }
    uint8_t* expectedOutputData = reinterpret_cast<uint8_t*>(dataFile);
    uint32_t i = 0;
    uint64_t dataSize = accumulate(dimInfo.begin(), dimInfo.end(), DATA_SIZE_INIT, std::multiplies<uint64_t>());

    // print caffe/tf output:
    OHPrintf("\n [common.cpp] expected output data:\n");
    for (; i < dataSize && i < PREVIEW_ELEMENT_LIMIT; i++) {
        OHPrintf("%4hhu ", static_cast<unsigned char>(expectedOutputData[i]));
    }
    OHPrintf("\n");
    AllCloseInt8Options options;
    options.a = actualOutputData;
    options.b = expectedOutputData;
    options.count = dataSize;
    options.rTol = rTol;
    options.aTol = aTol;
    options.isQuant = isQuant;
    bool ret = AllCloseInt8(options);
    free(expectedOutputData);
    return ret;
}

/*
 * ReadFile: read file of model
 * param:
 *  file: file location
 *  size: file size
 * return:
 *  buf of file
 * */
char* ReadFile(const char* file, size_t* size)
{
    OHPrintf("[common.cpp] Loading data from: %s\n", file);

    std::ifstream ifs(file);
    if (!ifs.good()) {
        return nullptr;
    }

    if (!ifs.is_open()) {
        ifs.close();
        return nullptr;
    }

    ifs.seekg(FILE_SEEK_START, std::ios::end);
    *size = ifs.tellg();

    char* buf = new char[*size];
    if (buf == nullptr) {
        ifs.close();
        return nullptr;
    }

    ifs.seekg(FILE_SEEK_START, std::ios::beg);
    ifs.read(buf, *size);
    ifs.close();
    OHPrintf("[common.cpp]Read Binary Data Over, get tensorSize as: %" PRId64 ".\n", static_cast<int64_t>(*size));

    return buf;
}

void PackNCHWToNHWCFp32(const char* src, char* dst, int batch, int plane, int channel)
{
    for (int n = 0; n < batch; n++) {
        for (int c = 0; c < channel; c++) {
            for (int hw = 0; hw < plane; hw++) {
                int nhwcIndex = n * channel * plane + hw * channel + c;
                int nchwIndex = n * channel * plane + c * plane + hw;
                dst[nhwcIndex * FLOAT32_BYTE_SIZE] = src[nchwIndex * FLOAT32_BYTE_SIZE];
                dst[nhwcIndex * FLOAT32_BYTE_SIZE + FLOAT32_BYTE_OFFSET_1] =
                    src[nchwIndex * FLOAT32_BYTE_SIZE + FLOAT32_BYTE_OFFSET_1];
                dst[nhwcIndex * FLOAT32_BYTE_SIZE + FLOAT32_BYTE_OFFSET_2] =
                    src[nchwIndex * FLOAT32_BYTE_SIZE + FLOAT32_BYTE_OFFSET_2];
                dst[nhwcIndex * FLOAT32_BYTE_SIZE + FLOAT32_BYTE_OFFSET_3] =
                    src[nchwIndex * FLOAT32_BYTE_SIZE + FLOAT32_BYTE_OFFSET_3];
            }
        }
    }
    return;
}

uint64_t GetTimeInUs()
{
    uint64_t time;
    struct timeval tv;
    gettimeofday(&tv, nullptr);
    time = static_cast<uint64_t>(tv.tv_sec) * MICROSECONDS_PER_SECOND + tv.tv_usec;
    return time;
}

std::map<std::string, float> CalculateIntVector(std::vector<float> vec)
{
    float max = 0;
    float min = FLT_MAX;
    float sum = 0;
    float avg;
    for (auto v : vec) {
        max = fmax(max, v);
        min = fmin(min, v);
        sum += v;
    }
    avg = vec.size() > SUCCESS_CODE ? sum / vec.size() : SUCCESS_CODE;
    std::map<std::string, float> result = { { "MIN", min }, { "MAX", max }, { "AVG", avg }, { "SUM", sum } };
    return result;
}

int SafeCopyNoInclude(char* dst, size_t maxLen, const char* src)
{
    if (!dst || !src || maxLen == SUCCESS_CODE) {
        return ERROR_CODE_NEGATIVE_ONE;
    }

    size_t i = 0;
    for (; i < maxLen - STRING_OFFSET_ONE && src[i] != '\0'; i++) {
        dst[i] = src[i];
    }
    dst[i] = '\0'; // 手动补结尾符
    return SUCCESS_CODE;
}

int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[index + 1];

    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        napi_throw_type_error(env, nullptr, "Argument missing");
        return defaultValue;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return defaultValue;
    }

    int32_t result = defaultValue;
    status = napi_get_value_int32(env, args[index], &result);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Value is not int32");
        return defaultValue;
    }

    return result;
}

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return ERROR_CODE_NEGATIVE_ONE;
    }
    if (len == 0) {
        return SUCCESS_CODE; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return ERROR_CODE_NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return SUCCESS_CODE; // 源和目标相同，无需复制
    }
    // 判断是否有重叠以及重叠类型
    if (dstPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < len; ++i) {
            dstPtr[i] = srcPtr[i];
        }
    } else if (dstPtr > srcPtr) {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = len; i > 0; --i) {
            dstPtr[i - 1] = srcPtr[i - 1];
        }
    }
    return SUCCESS_CODE;
}