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
#include "NnrtUtilsTest.h"
#include <cstring>
#include <fstream>
#include <hilog/log.h>
#include <stdexcept>
#include "const.h"

// 日志宏定义
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "NnrtUtilsTest"
#define LOGE(...) OH_LOG_ERROR(LOG_APP, __VA_ARGS__)
#define LOGI(...) OH_LOG_INFO(LOG_APP, __VA_ARGS__)

#define ASSERT_EQ(v1, v2) /* NOLINT(G.PRE.02-CPP) */ \
    AssertEqImpl((v1), (v2), #v1, #v2, AssertLocation({ __FILE__, __LINE__ }))

namespace OHOS {
namespace NeuralNetworkRuntime {
namespace Test {

struct AssertLocation {
    const char* file;
    int line;
};

template <typename T1, typename T2>
inline void AssertEqImpl(const T1& v1, const T2& v2, const char* exp1, const char* exp2, const AssertLocation& loc)
{
    if (v1 != v2) {
        LOGE("Assertion failed: %s == %s, file: %s, line: %d", exp1, exp2, loc.file, loc.line);
        throw std::runtime_error(std::string("Assertion failed: ") + exp1 + " == " + exp2 + ", file: " + loc.file +
                                 ", line: " + std::to_string(loc.line));
    }
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
                LOGE("[NNRtTest] OH_NNModel_AddTensor failed! ret=%d\n", ret);
                return ret;
            }
            if (std::find(graphArgs.paramIndices[j].begin(), graphArgs.paramIndices[j].end(), opCnt) !=
                graphArgs.paramIndices[j].end()) {
                ret = OH_NNModel_SetTensorData(model, opCnt, operandTem.data, operandTem.length);
            }
            if (ret != OH_NN_SUCCESS) {
                LOGE("[NNRtTest] OH_NNModel_SetTensorData failed! ret=%d\n", ret);
                return ret;
            }
            opCnt += 1;
        }
        auto paramIndices = TransformUInt32Array(graphArgs.paramIndices[j]);
        auto inputIndices = TransformUInt32Array(graphArgs.inputIndices[j]);
        auto outputIndices = TransformUInt32Array(graphArgs.outputIndices[j]);

        ret = OH_NNModel_AddOperation(model, graphArgs.operationTypes[j], &paramIndices, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNModel_AddOperation failed! ret=%d\n", ret);
            return ret;
        }
    }
    auto graphInputs = TransformUInt32Array(graphArgs.graphInput);
    auto graphOutputs = TransformUInt32Array(graphArgs.graphOutput);
    ret = OH_NNModel_SpecifyInputsAndOutputs(model, &graphInputs, &graphOutputs);
    if (ret != OH_NN_SUCCESS) {
        LOGE("[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%d\n", ret);
        return ret;
    }
    ret = OH_NNModel_Finish(model);
    if (ret != OH_NN_SUCCESS) {
        LOGE("[NNRtTest] OH_NNModel_Finish failed! ret=%d\n", ret);
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
            LOGE("[NNRtTest] OH_NNModel_AddTensor failed! ret=%d\n", ret);
            return ret;
        }

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            ret = OH_NNModel_SetTensorData(model, i, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                LOGE("[NNRtTest] OH_NNModel_SetTensorData failed! ret=%d\n", ret);
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
            LOGE("[NNRtTest] OH_NNModel_AddOperation failed! ret=%d\n", ret);
            return ret;
        }
    }
    if (graphArgs.specifyIO) {
        ret = OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%d\n", ret);
            return ret;
        }
    }
    if (graphArgs.build) {
        ret = OH_NNModel_Finish(model);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNModel_Finish failed! ret=%d\n", ret);
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
        LOGE("[NNRtTest] OH_NNDevice_GetAllDevicesID failed! ret=%d\n", ret);
        return ret;
    }
    if (devicesCount <= NO_DEVICE_COUNT) {
        LOGE("[NNRtTest] devicesCount <= 0  devicesCount=%d\n", devicesCount);
        return OH_NN_FAILED;
    }

    // 打印所有可用设备，并使用第一个可用设备
    const char* name = nullptr;
    LOGE("[NNRtTest] Found %d device(s):\n", devicesCount);
    for (uint32_t i = 0; i < devicesCount; i++) {
        name = nullptr;
        ret = OH_NNDevice_GetName(devicesID[i], &name);
        if (ret == OH_NN_SUCCESS && name != nullptr) {
            LOGE("[NNRtTest]   Device[%d]: %s\n", i, name);
        }
    }

    // 使用第一个可用的设备（适配真实设备环境）
    if (devicesCount > 0) {
        ret = OH_NNCompilation_SetDevice(compilation, devicesID[0]);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%d\n", ret);
            return ret;
        }

        // 获取并打印使用的设备名称
        const char* usedDeviceName = nullptr;
        OH_NNDevice_GetName(devicesID[0], &usedDeviceName);
        LOGE("[NNRtTest] Using device: %s\n", usedDeviceName ? usedDeviceName : "Unknown");
        return OH_NN_SUCCESS;
    }

    return OH_NN_FAILED;
}

int CompileGraphMock(OH_NNCompilation* compilation, const OHNNCompileParam& compileParam)
{
    int ret = 0;
    ret = SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        LOGE("[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%d\n", ret);
        return ret;
    }
    // set cache
    if (!compileParam.cacheDir.empty()) {
        ret = OH_NNCompilation_SetCache(compilation, compileParam.cacheDir.c_str(), compileParam.cacheVersion);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNCompilation_SetCache failed! ret=%d\n", ret);
            return ret;
        }
    }
    // set performance
    if (compileParam.performanceMode != OH_NN_PERFORMANCE_NONE) {
        ret = OH_NNCompilation_SetPerformanceMode(compilation, compileParam.performanceMode);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNCompilation_SetPerformanceMode failed! ret=%d\n", ret);
            return ret;
        }
    }
    // set priority
    if (compileParam.priority != OH_NN_PRIORITY_NONE) {
        ret = OH_NNCompilation_SetPriority(compilation, compileParam.priority);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNCompilation_SetPriority failed! ret=%d\n", ret);
            return ret;
        }
    }
    // enable fp16
    if (compileParam.enableFp16) {
        ret = OH_NNCompilation_EnableFloat16(compilation, compileParam.enableFp16);
        if (ret != OH_NN_SUCCESS) {
            LOGE("[NNRtTest] OH_NNCompilation_EnableFloat16 failed! ret=%d\n", ret);
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
                LOGE("[NNRtTest] OH_NNExecutor_SetInput failed! ret=%d\n", ret);
                return ret;
            }
            inputIndex += 1;
        } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                   graphArgs.outputIndices.end()) {
            ret = OH_NNExecutor_SetOutput(executor, outputIndex, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                LOGE("[NNRtTest] OH_NNExecutor_SetOutput failed! ret=%d\n", ret);
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
                LOGE("[NNRtTest] OH_NNExecutor_SetInputWithMemory failed! ret=%d\n", ret);
                return ret;
            }
            int retCopy = SafeMemcpy(
                inputMemory->data, operandTem.length, static_cast<void*>(operandTem.data), operandTem.length);
            if (retCopy != SUCCESS_CODE) {
                LOGE("[NNRtTest] SafeMemcpy failed! ret=%d\n", retCopy);
                return retCopy;
            }
            OHNNMemory[inputIndex] = inputMemory;
            inputIndex += 1;
        } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                   graphArgs.outputIndices.end()) {
            OH_NN_Memory* outputMemory = OH_NNExecutor_AllocateOutputMemory(executor, outputIndex, operandTem.length);
            ret = OH_NNExecutor_SetOutputWithMemory(executor, outputIndex, outputMemory);
            if (ret != OH_NN_SUCCESS) {
                LOGE("[NNRtTest] OH_NNExecutor_SetOutputWithMemory failed! ret=%d\n", ret);
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
    try {
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
    } catch (const std::exception& e) {
        LOGE("Free function assertion failed: %s", e.what());
    }
}

PathType CheckPath(const std::string& path)
{
    if (path.empty()) {
        LOGI("CheckPath: path is null");
        return PathType::NOT_FOUND;
    }
    struct stat buf{};
    if (stat(path.c_str(), &buf) == 0) {
        if (buf.st_mode & S_IFDIR) {
            return PathType::DIR;
        } else if (buf.st_mode & S_IFREG) {
            return PathType::FILE;
        } else {
            return PathType::UNKNOWN;
        }
    }
    LOGI("%s not found", path.c_str());
    return PathType::NOT_FOUND;
}

bool DeleteFile(const std::string& path)
{
    if (path.empty()) {
        LOGI("DeleteFile: path is null");
        return false;
    }
    if (CheckPath(path) == PathType::NOT_FOUND) {
        LOGI("not found: %s", path.c_str());
        return true;
    }
    if (remove(path.c_str()) == 0) {
        LOGI("deleted: %s", path.c_str());
        return true;
    }
    LOGI("delete failed: %s", path.c_str());
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
        LOGI("DeletePath: path is null");
        return;
    }

    DIR* dir = opendir(path.c_str());

    if (dir == nullptr) {
        LOGE("[NNRtTest] Can not open dir. Check path or permission! path: %s", path.c_str());
        return;
    }
    struct dirent* file;

    std::vector<std::string> pathList;
    while ((file = readdir(dir)) != nullptr) {
        if (strcmp(file->d_name, ".") == 0 || strcmp(file->d_name, "..") == 0) {
            continue;
        }
        if (file->d_type == DT_DIR) {
            std::string filePath = path + "/" + file->d_name;
            DeleteFolder(filePath);
        } else {
            pathList.emplace_back(ConcatPath(path, file->d_name));
        }
    }
    closedir(dir);
    pathList.emplace_back(path);
    LOGI("[Common] Delete folder %s", path.c_str());
    for (auto& i : pathList) {
        DeleteFile(i);
    }
}

bool CreateFolder(const std::string& path)
{
    if (path.empty()) {
        LOGI("CreateFolder: path is empty");
        return false;
    }
    LOGI("CreateFolder:%s", path.c_str());
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
                LOGI("mkdir: %s", path.substr(0, i).c_str());
                mkdir(path.substr(0, i).c_str(), mode);
                break;
            default:
                LOGI("error: %s", path.substr(0, i).c_str());
                return false;
        }
    }
    mkdir(path.c_str(), mode);
    return CheckPath(path) == PathType::DIR;
}

bool CheckOutput(const float* output, const float* expect)
{
    if (output == nullptr || expect == nullptr) {
        LOGE("[NNRtTest] output or expect is nullptr\n");
        return false;
    }
    for (int i = 0; i < ELEMENT_COUNT; i++) {
        if (std::abs(float(output[i]) - float(expect[i])) > 1e-8) {
            for (int j = 0; j < ELEMENT_COUNT; j++) {
                LOGE("[NNRtTest] output %d not match: expect:%f, actual:%f\n", j, float(expect[j]), float(output[j]));
            }
            return false;
        }
    }
    return true;
}

} // namespace Test
} // namespace NeuralNetworkRuntime
} // namespace OHOS
