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
#include "ConstTest.h"
#include <fstream>

namespace OHOS {
namespace NeuralNetworkRuntime {
namespace Test {

// 安全的内存拷贝函数实现
int SafeMemcpy(void* dest, size_t destSize, const void* src, size_t count)
{
    // 参数验证：检查空指针
    if (dest == nullptr || src == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] SafeMemcpy: null pointer");
        return ERROR_CODE_NEGATIVE_ONE;
    }
    
    // 空操作直接返回成功
    if (count == 0) {
        return SUCCESS_CODE;
    }
    
    // 检查缓冲区溢出
    if (count > destSize) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] SafeMemcpy: buffer overflow, count=%{public}zu, destSize=%{public}zu",
            count, destSize);
        return ERROR_CODE_NEGATIVE_TWO;
    }
    
    // 处理重叠情况的安全复制
    unsigned char* destPtr = static_cast<unsigned char*>(dest);
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    
    // 源和目标相同，无需复制
    if (destPtr == srcPtr) {
        return SUCCESS_CODE;
    }
    
    // 判断是否有重叠以及重叠类型
    if (destPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < count; ++i) {
            destPtr[i] = srcPtr[i];
        }
    } else {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = count; i > 0; --i) {
            destPtr[i - 1] = srcPtr[i - 1];
        }
    }
    
    return SUCCESS_CODE;
}

OH_NN_UInt32Array TransformUInt32Array(const std::vector<uint32_t>& vector)
{
    uint32_t* data = (vector.empty()) ? nullptr : const_cast<uint32_t*>(vector.data());
    return {data, static_cast<uint32_t>(vector.size())};
}

int BuildMultiOpGraph(OH_NNModel *model, const OHNNGraphArgsMulti &graphArgs)
{
    int ret = 0;
    int opCnt = 0;
    for (int j = 0; j < graphArgs.operationTypes.size(); j++) {
        for (int i = 0; i < graphArgs.operands[j].size(); i++) {
            const OHNNOperandTest &operandTem = graphArgs.operands[j][i];
            auto quantParam = operandTem.quantParam;
            OH_NN_Tensor operand = {operandTem.dataType, (uint32_t) operandTem.shape.size(),
                operandTem.shape.data(), quantParam, operandTem.type};
            ret = OH_NNModel_AddTensor(model, &operand);
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddTensor failed! ret=%{public}d", ret);
                return ret;
            }
            if (std::find(graphArgs.paramIndices[j].begin(), graphArgs.paramIndices[j].end(), opCnt) !=
                graphArgs.paramIndices[j].end()) {
                ret = OH_NNModel_SetTensorData(model, opCnt, operandTem.data, operandTem.length);
            }
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_SetTensorData failed! ret=%{public}d", ret);
                return ret;
            }
            opCnt += 1;
        }
        auto paramIndices = TransformUInt32Array(graphArgs.paramIndices[j]);
        auto inputIndices = TransformUInt32Array(graphArgs.inputIndices[j]);
        auto outputIndices = TransformUInt32Array(graphArgs.outputIndices[j]);

        ret = OH_NNModel_AddOperation(model, graphArgs.operationTypes[j], &paramIndices, &inputIndices,
        &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddOperation failed! ret=%{public}d", ret);
            return ret;
        }
    }
    auto graphInputs = TransformUInt32Array(graphArgs.graphInput);
    auto graphOutputs = TransformUInt32Array(graphArgs.graphOutput);
    ret = OH_NNModel_SpecifyInputsAndOutputs(model, &graphInputs, &graphOutputs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
            "[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%{public}d", ret);
        return ret;
    }
    ret = OH_NNModel_Finish(model);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_Finish failed! ret=%{public}d", ret);
        return ret;
    }
    return ret;
}

int BuildSingleOpGraph(OH_NNModel *model, const OHNNGraphArgs &graphArgs)
{
    int ret = 0;
    for (int i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = graphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t) operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam, operandTem.type};
        ret = OH_NNModel_AddTensor(model, &operand);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddTensor failed! ret=%{public}d", ret);
            return ret;
        }

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            ret = OH_NNModel_SetTensorData(model, i, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_SetTensorData failed! ret=%{public}d", ret);
                return ret;
            }
        }
    }
    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    if (graphArgs.addOperation) {
        ret = OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices,
                                      &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddOperation failed! ret=%{public}d", ret);
            return ret;
        }
    }
    if (graphArgs.specifyIO) {
        ret = OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP,
                "[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%{public}d", ret);
            return ret;
        }
    }
    if (graphArgs.build) {
        ret = OH_NNModel_Finish(model);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_Finish failed! ret=%{public}d", ret);
            return ret;
        }
    }
    return ret;
}

OH_NN_ReturnCode SetDevice(OH_NNCompilation *compilation)
{
    OH_NN_ReturnCode ret = OH_NN_FAILED;
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNDevice_GetAllDevicesID failed! ret=%{public}d", ret);
        return ret;
    }
    if (devicesCount <= NO_DEVICE_COUNT) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] devicesCount <= 0  devicesCount=%{public}d", devicesCount);
        return OH_NN_FAILED;
    }

    // 真机测试模式:使用第一个可用设备,而不是查找特定名称的测试设备
    const char *name = nullptr;
    ret = OH_NNDevice_GetName(devicesID[0], &name);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNDevice_GetName failed! ret=%{public}d", ret);
        return ret;
    }
    
    OH_LOG_INFO(LOG_APP, "[NNRtTest] Using device: %{public}s (ID: %{public}zu)", name, devicesID[0]);
    
    ret = OH_NNCompilation_SetDevice(compilation, devicesID[0]);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%{public}d", ret);
        return ret;
    }
    
    return OH_NN_SUCCESS;
}

int CompileGraphMock(OH_NNCompilation *compilation, const OHNNCompileParam &compileParam)
{
    int ret = 0;
    ret = SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%{public}d", ret);
        return ret;
    }
    // set cache
    if (!compileParam.cacheDir.empty()) {
        ret = OH_NNCompilation_SetCache(compilation, compileParam.cacheDir.c_str(),
        compileParam.cacheVersion);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetCache failed! ret=%{public}d", ret);
            return ret;
        }
    }
    // set performance
    if (compileParam.performanceMode != OH_NN_PERFORMANCE_NONE) {
        ret = OH_NNCompilation_SetPerformanceMode(compilation, compileParam.performanceMode);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP,
                "[NNRtTest] OH_NNCompilation_SetPerformanceMode failed! ret=%{public}d", ret);
            return ret;
        }
    }
    // set priority
    if (compileParam.priority != OH_NN_PRIORITY_NONE) {
        ret = OH_NNCompilation_SetPriority(compilation, compileParam.priority);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetPriority failed! ret=%{public}d", ret);
            return ret;
        }
    }
    // enable fp16
    if (compileParam.enableFp16) {
        ret = OH_NNCompilation_EnableFloat16(compilation, compileParam.enableFp16);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_EnableFloat16 failed! ret=%{public}d", ret);
            return ret;
        }
    }
    // build
    ret = OH_NNCompilation_Build(compilation);
    return ret;
}


// 真机测试版本的ExecuteGraphMock - 移除了MockIDevice依赖
int ExecuteGraphMock(OH_NNExecutor *executor, const OHNNGraphArgs &graphArgs,
    float* expect)
{
    // 真机测试模式:不使用MockIDevice,直接执行
    int ret = 0;
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    for (auto i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = graphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t) operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam, operandTem.type};
        if (std::find(graphArgs.inputIndices.begin(), graphArgs.inputIndices.end(), i) !=
            graphArgs.inputIndices.end()) {
            ret = OH_NNExecutor_SetInput(executor, inputIndex, &operand, operandTem.data,
            operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_SetInput failed! ret=%{public}d", ret);
                return ret;
            }
            inputIndex += 1;
        } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                   graphArgs.outputIndices.end()) {
            ret = OH_NNExecutor_SetOutput(executor, outputIndex, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_SetOutput failed! ret=%{public}d", ret);
                return ret;
            }
            // 真机测试模式:不使用MockIDevice设置expect,直接跳过
            outputIndex += 1;
        }
    }
    ret = OH_NNExecutor_Run(executor);
    return ret;
}

// 真机测试版本的ExecutorWithMemory - 移除了MockIDevice依赖
int ExecutorWithMemory(OH_NNExecutor *executor, const OHNNGraphArgs &graphArgs, OH_NN_Memory *OHNNMemory[],
    float* expect)
{
    // 真机测试模式:不使用MockIDevice,直接执行
    int ret = 0;
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    for (auto i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = graphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t) operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam, operandTem.type};
        if (std::find(graphArgs.inputIndices.begin(), graphArgs.inputIndices.end(), i) !=
            graphArgs.inputIndices.end()) {
            OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, inputIndex,
            operandTem.length);
            ret = OH_NNExecutor_SetInputWithMemory(executor, inputIndex, &operand, inputMemory);
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_SetInputWithMemory failed! ret=%{public}d", ret);
                return ret;
            }
            // 使用安全函数SafeMemcpy进行内存拷贝
            int copyRet = SafeMemcpy(inputMemory->data, operandTem.length,
                static_cast<void*>(operandTem.data), operandTem.length);
            if (copyRet != 0) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] SafeMemcpy failed!");
                return OH_NN_FAILED;
            }
            OHNNMemory[inputIndex] = inputMemory;
            inputIndex += 1;
        } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                   graphArgs.outputIndices.end()) {
            OH_NN_Memory *outputMemory = OH_NNExecutor_AllocateOutputMemory(executor, outputIndex,
            operandTem.length);
            ret = OH_NNExecutor_SetOutputWithMemory(executor, outputIndex, outputMemory);
            if (ret != OH_NN_SUCCESS) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_SetOutputWithMemory failed! ret=%{public}d", ret);
                return ret;
            }
            // 真机测试模式:不使用MockIDevice设置expect,直接跳过
            OHNNMemory[inputIndex + outputIndex] = outputMemory;
            outputIndex += 1;
        }
    }
    ret = OH_NNExecutor_Run(executor);
    return ret;
}


void Free(OH_NNModel *model, OH_NNCompilation *compilation, OH_NNExecutor *executor)
{
    if (model != nullptr) {
        OH_NNModel_Destroy(&model);
    }
    if (compilation != nullptr) {
        OH_NNCompilation_Destroy(&compilation);
    }
    if (executor != nullptr) {
        OH_NNExecutor_Destroy(&executor);
    }
}

PathType CheckPath(const std::string &path)
{
    if (path.empty()) {
        OH_LOG_INFO(LOG_APP, "CheckPath: path is null");
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
    OH_LOG_INFO(LOG_APP, "%{public}s not found", path.c_str());
    return PathType::NOT_FOUND;
}

bool DeleteFile(const std::string &path)
{
    if (path.empty()) {
        OH_LOG_INFO(LOG_APP, "DeleteFile: path is null");
        return false;
    }
    if (CheckPath(path) == PathType::NOT_FOUND) {
        OH_LOG_INFO(LOG_APP, "not found: %{public}s", path.c_str());
        return true;
    }
    if (remove(path.c_str()) == 0) {
        OH_LOG_INFO(LOG_APP, "deleted: %{public}s", path.c_str());
        return true;
    }
    OH_LOG_INFO(LOG_APP, "delete failed: %{public}s", path.c_str());
    return false;
}

void CopyFile(const std::string &srcPath, const std::string &dstPath)
{
    std::ifstream src(srcPath, std::ios::binary);
    std::ofstream dst(dstPath, std::ios::binary);

    dst << src.rdbuf();
}

std::string ConcatPath(const std::string &str1, const std::string &str2)
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

void DeleteFolder(const std::string &path)
{
    if (path.empty()) {
        OH_LOG_INFO(LOG_APP, "DeletePath: path is null");
        return;
    }

    DIR *dir = opendir(path.c_str());
    // check is dir ?
    if (dir == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[NNRtTest] Can not open dir. Check path or permission! path: %{public}s", path.c_str());
        return;
    }
    struct dirent *file;
    // read all the files in dir
    std::vector <std::string> pathList;
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
    OH_LOG_INFO(LOG_APP, "[Common] Delete folder %{public}s", path.c_str());
    for (auto &i : pathList) {
        DeleteFile(i);
    }
}

bool CreateFolder(const std::string &path)
{
    if (path.empty()) {
        OH_LOG_INFO(LOG_APP, "CreateFolder: path is empty");
        return false;
    }
    OH_LOG_INFO(LOG_APP, "CreateFolder:%{public}s", path.c_str());
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
                OH_LOG_INFO(LOG_APP, "mkdir: %{public}s", path.substr(0, i).c_str());
                mkdir(path.substr(0, i).c_str(), mode);
                break;
            default:
                OH_LOG_INFO(LOG_APP, "error: %{public}s", path.substr(0, i).c_str());
                return false;
        }
    }
    mkdir(path.c_str(), mode);
    return CheckPath(path) == PathType::DIR;
}

bool CheckOutput(const float* output, const float* expect)
{
    if (output == nullptr || expect == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] output or expect is nullptr");
        return false;
    }
    for (int i = 0; i < ELEMENT_COUNT; i++) {
        if (std::abs(float(output[i]) - float(expect[i])) > 1e-8) {
            for (int j = 0; j < ELEMENT_COUNT; j++) {
                OH_LOG_ERROR(LOG_APP,
                    "[NNRtTest] output %{public}d not match: expect:%{public}f, actual:%{public}f",
                    j, float(expect[j]), float(output[j]));
            }
            return false;
        }
    }
    return true;
}

} // namespace Test
} // namespace NeuralNetworkRuntime
} // namespace OHOS

