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

#include "include/NnrtUtilsTest.h"
#include <cstring>
#include <dirent.h>
#include <fstream>
#include <hilog/log.h>
#include <neural_network_runtime/neural_network_runtime.h>
#include <stdexcept>
#include <sys/stat.h>
#include "include/const.h"

namespace {
constexpr size_t PRINTF_BUFFER_SIZE = 1024;
const std::string DEFAULT_TAG = "NNRTTest";
constexpr size_t FORMAT_PUBLIC_RESERVED = 25;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
constexpr int ERROR_CODE_NEGATIVE_THREE = -3;
constexpr int SUCCESS_CODE = 0;
} // namespace

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
    OH_LOG_VPrint(LOG_APP, LOG_DEBUG, LOG_DOMAIN, DEFAULT_TAG.c_str(), fmtPublic, args);
    va_end(args);
}

namespace OHOS {
namespace NeuralNetworkRuntime {
namespace Test {

OH_NN_UInt32Array TransformUInt32Array(const std::vector<uint32_t>& vector)
{
    uint32_t* data = (vector.empty()) ? nullptr : const_cast<uint32_t*>(vector.data());
    return { data, static_cast<uint32_t>(vector.size()) };
}

int BuildMultiOpGraph(OH_NNModel* model, const OHNNGraphArgsMulti& graphArgs)
{
    int ret = 0;
    int opCnt = 0;
    for (int j = 0; j < graphArgs.operationTypes.size(); j++) {
        for (int i = 0; i < graphArgs.operands[j].size(); i++) {
            const OHNNOperandTest& operandTem = graphArgs.operands[j][i];
            auto quantParam = operandTem.quantParam;
            OH_NN_Tensor operand = { operandTem.dataType,
                                     (uint32_t)operandTem.shape.size(),
                                     operandTem.shape.data(),
                                     quantParam,
                                     operandTem.type };
            ret = OH_NNModel_AddTensor(model, &operand);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNModel_AddTensor failed! ret=%d\n", ret);
                return ret;
            }
            if (std::find(graphArgs.paramIndices[j].begin(), graphArgs.paramIndices[j].end(), opCnt) !=
                graphArgs.paramIndices[j].end()) {
                ret = OH_NNModel_SetTensorData(model, opCnt, operandTem.data, operandTem.length);
            }
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNModel_SetTensorData failed! ret=%d\n", ret);
                return ret;
            }
            opCnt += 1;
        }
        auto paramIndices = TransformUInt32Array(graphArgs.paramIndices[j]);
        auto inputIndices = TransformUInt32Array(graphArgs.inputIndices[j]);
        auto outputIndices = TransformUInt32Array(graphArgs.outputIndices[j]);

        ret = OH_NNModel_AddOperation(model, graphArgs.operationTypes[j], &paramIndices, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNModel_AddOperation failed! ret=%d\n", ret);
            return ret;
        }
    }
    auto graphInputs = TransformUInt32Array(graphArgs.graphInput);
    auto graphOutputs = TransformUInt32Array(graphArgs.graphOutput);
    ret = OH_NNModel_SpecifyInputsAndOutputs(model, &graphInputs, &graphOutputs);
    if (ret != OH_NN_SUCCESS) {
        OHPrintf("[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%d\n", ret);
        return ret;
    }
    ret = OH_NNModel_Finish(model);
    if (ret != OH_NN_SUCCESS) {
        OHPrintf("[NNRtTest] OH_NNModel_Finish failed! ret=%d\n", ret);
        return ret;
    }
    return ret;
}

int BuildSingleOpGraph(OH_NNModel* model, const OHNNGraphArgs& graphArgs)
{
    int ret = 0;
    for (int i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest& operandTem = graphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(), quantParam, operandTem.type
        };
        ret = OH_NNModel_AddTensor(model, &operand);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNModel_AddTensor failed! ret=%d\n", ret);
            return ret;
        }

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            ret = OH_NNModel_SetTensorData(model, i, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNModel_SetTensorData failed! ret=%d\n", ret);
                return ret;
            }
        }
    }
    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    if (graphArgs.addOperation) {
        ret = OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNModel_AddOperation failed! ret=%d\n", ret);
            return ret;
        }
    }
    if (graphArgs.specifyIO) {
        ret = OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%d\n", ret);
            return ret;
        }
    }
    if (graphArgs.build) {
        ret = OH_NNModel_Finish(model);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNModel_Finish failed! ret=%d\n", ret);
            return ret;
        }
    }
    return ret;
}

OH_NN_ReturnCode SetDevice(OH_NNCompilation* compilation)
{
    OH_NN_ReturnCode ret = OH_NN_FAILED;
    const size_t* devicesID{ nullptr };
    uint32_t devicesCount{ 0 };
    ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS) {
        OHPrintf("[NNRtTest] OH_NNDevice_GetAllDevicesID failed! ret=%d\n", ret);
        return ret;
    }
    OHPrintf("[NNRtTest] Found %d devices\n", devicesCount);
    if (devicesCount <= NO_DEVICE_COUNT) {
        OHPrintf("[NNRtTest] No devices available! devicesCount=%d\n", devicesCount);
        return OH_NN_FAILED;
    }

    const char* name = nullptr;
    std::string mDeviceName{ "Device-CPU_TestVendor_v1_0" };
    OHPrintf("[NNRtTest] Preferred device: %s\n", mDeviceName.c_str());

    // 首先尝试查找首选设备
    for (uint32_t i = 0; i < devicesCount; i++) {
        name = nullptr;
        ret = OH_NNDevice_GetName(devicesID[i], &name);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNDevice_GetName failed for device %d! ret=%d\n", i, ret);
            continue;
        }

        std::string sName(name);
        OHPrintf("[NNRtTest] Device %d: %s\n", i, sName.c_str());

        if (mDeviceName == sName) {
            OHPrintf("[NNRtTest] Found preferred device: %s\n", sName.c_str());
            ret = OH_NNCompilation_SetDevice(compilation, devicesID[i]);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%d\n", ret);
                return ret;
            }
            return OH_NN_SUCCESS;
        }
    }

    // 如果未找到首选设备，使用第一个可用设备
    OHPrintf("[NNRtTest] Preferred device not found, using first available device\n");
    ret = OH_NNCompilation_SetDevice(compilation, devicesID[0]);
    if (ret != OH_NN_SUCCESS) {
        OHPrintf("[NNRtTest] OH_NNCompilation_SetDevice failed for first device! ret=%d\n", ret);
        return ret;
    }

    // 获取并打印实际使用的设备名称
    name = nullptr;
    ret = OH_NNDevice_GetName(devicesID[0], &name);
    if (ret == OH_NN_SUCCESS && name != nullptr) {
        OHPrintf("[NNRtTest] Using device: %s\n", name);
    }

    return OH_NN_SUCCESS;
}

int CompileGraphMock(OH_NNCompilation* compilation, const OHNNCompileParam& compileParam)
{
    int ret = 0;
    ret = SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OHPrintf("[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%d\n", ret);
        return ret;
    }
    // set cache
    if (!compileParam.cacheDir.empty()) {
        ret = OH_NNCompilation_SetCache(compilation, compileParam.cacheDir.c_str(), compileParam.cacheVersion);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNCompilation_SetCache failed! ret=%d\n", ret);
            return ret;
        }
    }
    // set performance
    if (compileParam.performanceMode != OH_NN_PERFORMANCE_NONE) {
        ret = OH_NNCompilation_SetPerformanceMode(compilation, compileParam.performanceMode);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNCompilation_SetPerformanceMode failed! ret=%d\n", ret);
            return ret;
        }
    }
    // set priority
    if (compileParam.priority != OH_NN_PRIORITY_NONE) {
        ret = OH_NNCompilation_SetPriority(compilation, compileParam.priority);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNCompilation_SetPriority failed! ret=%d\n", ret);
            return ret;
        }
    }
    // enable fp16
    if (compileParam.enableFp16) {
        ret = OH_NNCompilation_EnableFloat16(compilation, compileParam.enableFp16);
        if (ret != OH_NN_SUCCESS) {
            OHPrintf("[NNRtTest] OH_NNCompilation_EnableFloat16 failed! ret=%d\n", ret);
            return ret;
        }
    }
    // build
    ret = OH_NNCompilation_Build(compilation);
    return ret;
}

int ExecuteGraphMock(OH_NNExecutor* executor, const OHNNGraphArgs& graphArgs, float* expect)
{
    int ret = 0;
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    for (auto i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest& operandTem = graphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(), quantParam, operandTem.type
        };
        if (std::find(graphArgs.inputIndices.begin(), graphArgs.inputIndices.end(), i) !=
            graphArgs.inputIndices.end()) {
            ret = OH_NNExecutor_SetInput(executor, inputIndex, &operand, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNExecutor_SetInput failed! ret=%d\n", ret);
                return ret;
            }
            inputIndex += 1;
        } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                   graphArgs.outputIndices.end()) {
            ret = OH_NNExecutor_SetOutput(executor, outputIndex, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNExecutor_SetOutput failed! ret=%d\n", ret);
                return ret;
            }
            outputIndex += 1;
        }
    }
    ret = OH_NNExecutor_Run(executor);
    return ret;
}

int ExecutorWithMemory(OH_NNExecutor* executor,
                       const OHNNGraphArgs& graphArgs,
                       OH_NN_Memory* OHNNMemory[],
                       float* expect)
{
    // OHOS::sptr<V1_0::MockIDevice> device = V1_0::MockIDevice::GetInstance();
    int ret = 0;
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    for (auto i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest& operandTem = graphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(), quantParam, operandTem.type
        };
        if (std::find(graphArgs.inputIndices.begin(), graphArgs.inputIndices.end(), i) !=
            graphArgs.inputIndices.end()) {
            OH_NN_Memory* inputMemory = OH_NNExecutor_AllocateInputMemory(executor, inputIndex, operandTem.length);
            ret = OH_NNExecutor_SetInputWithMemory(executor, inputIndex, &operand, inputMemory);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNExecutor_SetInputWithMemory failed! ret=%d\n", ret);
                return ret;
            }
            SafeMemcpy(inputMemory->data, operandTem.length, static_cast<void*>(operandTem.data), operandTem.length);
            OHNNMemory[inputIndex] = inputMemory;
            inputIndex += 1;
        } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                   graphArgs.outputIndices.end()) {
            OH_NN_Memory* outputMemory = OH_NNExecutor_AllocateOutputMemory(executor, outputIndex, operandTem.length);
            ret = OH_NNExecutor_SetOutputWithMemory(executor, outputIndex, outputMemory);
            if (ret != OH_NN_SUCCESS) {
                OHPrintf("[NNRtTest] OH_NNExecutor_SetOutputWithMemory failed! ret=%d\n", ret);
                return ret;
            }
            OHNNMemory[inputIndex + outputIndex] = outputMemory;
            outputIndex += 1;
        }
    }
    ret = OH_NNExecutor_Run(executor);
    return ret;
}

void Free(OH_NNModel* model, OH_NNCompilation* compilation, OH_NNExecutor* executor)
{
    if (model != nullptr) {
        OH_NNModel_Destroy(&model);
        ASSERT_EQ(nullptr, model);
    }
    if (compilation != nullptr) {
        OH_NNCompilation_Destroy(&compilation);
        ASSERT_EQ(nullptr, compilation);
    }
    if (executor != nullptr) {
        OH_NNExecutor_Destroy(&executor);
        ASSERT_EQ(nullptr, executor);
    }
}

PathType CheckPath(const std::string& path)
{
    if (path.empty()) {
        OHPrintf("CheckPath: path is null");
        return PathType::NOT_FOUND;
    }
    struct stat buf {};
    if (stat(path.c_str(), &buf) == 0) {
        if (buf.st_mode & S_IFDIR) {
            return PathType::DIR;
        } else if (buf.st_mode & S_IFREG) {
            return PathType::FILE;
        } else {
            return PathType::UNKNOWN;
        }
    }
    OHPrintf("%s not found", path.c_str());
    return PathType::NOT_FOUND;
}

bool DeleteFile(const std::string& path)
{
    if (path.empty()) {
        OHPrintf("DeleteFile: path is null");
        return false;
    }
    if (CheckPath(path) == PathType::NOT_FOUND) {
        OHPrintf("not found: %s", path.c_str());
        return true;
    }
    if (remove(path.c_str()) == 0) {
        OHPrintf("deleted: %s", path.c_str());
        return true;
    }
    OHPrintf("delete failed: %s", path.c_str());
    return false;
}

void CopyFile(const std::string& srcPath, const std::string& dstPath)
{
    std::ifstream src(srcPath, std::ios::binary);
    std::ofstream dst(dstPath, std::ios::binary);

    dst << src.rdbuf();
}

std::string ConcatPath(const std::string& str1, const std::string& str2)
{
    // boundary
    if (str2.empty()) {
        return str1;
    }
    if (str1.empty()) {
        return str2;
    }
    // concat
    char end = str1[str1.size() - 1];
    if (end == '\\' or end == '/') {
        return str1 + str2;
    } else {
        return str1 + '/' + str2;
    }
}

void DeleteFolder(const std::string& path)
{
    if (path.empty()) {
        OHPrintf("DeletePath: path is null");
        return;
    }

    DIR* dir = opendir(path.c_str());
    // check is dir ?
    if (dir == nullptr) {
        OHPrintf("[NNRtTest] Can not open dir. Check path or permission! path: %s", path.c_str());
        return;
    }
    struct dirent* file;
    // read all the files in dir
    std::vector<std::string> pathList;
    while ((file = readdir(dir)) != nullptr) {
        // skip "." and ".."
        if (strcmp(file->d_name, ".") == 0 || strcmp(file->d_name, "..") == 0) {
            continue;
        }
        if (file->d_type == DT_DIR) {
            std::string filePath = path + "/" + file->d_name;
            DeleteFolder(filePath); // 递归执行
        } else {
            pathList.emplace_back(ConcatPath(path, file->d_name));
        }
    }
    closedir(dir);
    pathList.emplace_back(path);
    OHPrintf("[Common] Delete folder %s", path.c_str());
    for (auto& i : pathList) {
        DeleteFile(i);
    }
}

bool CreateFolder(const std::string& path)
{
    if (path.empty()) {
        OHPrintf("CreateFolder: path is empty");
        return false;
    }
    OHPrintf("CreateFolder:%s", path.c_str());
    mode_t mode = 0700;
    for (int i = 1; i < path.size() - 1; i++) {
        if (path[i] != '/') {
            continue;
        }
        PathType ret = CheckPath(path.substr(0, i));
        switch (ret) {
            case PathType::DIR:
                continue;
            case PathType::NOT_FOUND:
                OHPrintf("mkdir: %s", path.substr(0, i).c_str());
                mkdir(path.substr(0, i).c_str(), mode);
                break;
            default:
                OHPrintf("error: %s", path.substr(0, i).c_str());
                return false;
        }
    }
    mkdir(path.c_str(), mode);
    return CheckPath(path) == PathType::DIR;
}

bool CheckOutput(const float* output, const float* expect)
{
    if (output == nullptr || expect == nullptr) {
        OHPrintf("[NNRtTest] output or expect is nullptr\n");
        return false;
    }
    for (int i = 0; i < ELEMENT_COUNT; i++) {
        if (std::abs(float(output[i]) - float(expect[i])) > 1e-8) {
            for (int j = 0; j < ELEMENT_COUNT; j++) {
                OHPrintf(
                    "[NNRtTest] output %d not match: expect:%f, actual:%f\n", j, float(expect[j]), float(output[j]));
            }
            return false;
        }
    }
    return true;
}

} // namespace Test
} // namespace NeuralNetworkRuntime
} // namespace OHOS
