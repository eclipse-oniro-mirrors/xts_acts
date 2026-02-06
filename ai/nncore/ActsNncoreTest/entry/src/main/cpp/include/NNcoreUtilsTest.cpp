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
#include <fstream>
#include <dirent.h>
#include <sys/stat.h>
#include <cstring>
#include <cerrno>

#include "NNcoreUtilsTest.h"
#include "NNcoreConstTest.h"

namespace OHOS {
namespace NeuralNetworkRuntime {
namespace Test {
OH_NN_UInt32Array TransformUInt32Array(const std::vector<uint32_t>& vector)
{
    uint32_t* data = (vector.empty()) ? nullptr : const_cast<uint32_t*>(vector.data());
    return {data, static_cast<uint32_t>(vector.size())};
}

NN_TensorDesc* createTensorDesc(const int32_t* shape, size_t shapeNum, OH_NN_DataType dataType, OH_NN_Format format)
{
    NN_TensorDesc* tensorDescTmp = OH_NNTensorDesc_Create();
    if (tensorDescTmp == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest]OH_NNTensorDesc_Create failed!");
        return nullptr;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetDataType(tensorDescTmp, dataType);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest]OH_NNTensorDesc_SetDataType failed!ret = %{public}d", ret);
        return nullptr;
    }

    if (shape != nullptr) {
        ret = OH_NNTensorDesc_SetShape(tensorDescTmp, shape, shapeNum);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest]OH_NNTensorDesc_SetShape failed!ret = %{public}d", ret);
            return nullptr;
        }
    }

    ret = OH_NNTensorDesc_SetFormat(tensorDescTmp, format);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest]OH_NNTensorDesc_SetFormat failed!ret = %{public}d", ret);
        return nullptr;
    }

    return tensorDescTmp;
}

int SingleModelBuildEndStep(OH_NNModel *model, const OHNNGraphArgs &graphArgs)
{
    int ret = 0;
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
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%{public}d", ret);
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

int BuildSingleOpGraph(OH_NNModel *model, const OHNNGraphArgs &graphArgs)
{
    int ret = 0;
    for (size_t i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = graphArgs.operands[i];
        NN_TensorDesc* tensorDesc = createTensorDesc(operandTem.shape.data(),
                                                     (uint32_t) operandTem.shape.size(),
                                                     operandTem.dataType, operandTem.format);
        ret = OH_NNModel_AddTensorToModel(model, tensorDesc);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddTensor failed! ret=%{public}d", ret);
            return ret;
        }
        ret = OH_NNModel_SetTensorType(model, i, operandTem.type);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNBackend_SetModelTensorType failed! ret=%{public}d", ret);
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
        OH_NNTensorDesc_Destroy(&tensorDesc);
    }
    ret = SingleModelBuildEndStep(model, graphArgs);
    return ret;
}

int BuildSingleOpGraphWithQuantParams(OH_NNModel *model, const OHNNGraphArgs &graphArgs)
{
    int ret = 0;
    for (size_t i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = graphArgs.operands[i];
        NN_TensorDesc* tensorDesc = createTensorDesc(operandTem.shape.data(),
                                                     (uint32_t) operandTem.shape.size(),
                                                     operandTem.dataType, operandTem.format);
        ret = OH_NNModel_AddTensorToModel(model, tensorDesc);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddTensor failed! ret=%{public}d", ret);
            return ret;
        }

        NN_QuantParam* quantParam = OH_NNQuantParam_Create();
        double scales = 0.2;
        int32_t zeroPoints = 0;
        uint32_t numBits = 8;
        ret = OH_NNQuantParam_SetScales(quantParam, &scales, 1);
        ret = OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, 1);
        ret = OH_NNQuantParam_SetNumBits(quantParam, &numBits, 1);
        ret = OH_NNModel_SetTensorQuantParams(model, i, quantParam);
        ret = OH_NNQuantParam_Destroy(&quantParam);
        ret = OH_NNModel_SetTensorType(model, i, operandTem.type);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNBackend_SetModelTensorType failed! ret=%{public}d", ret);
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
        OH_NNTensorDesc_Destroy(&tensorDesc);
    }
    ret = SingleModelBuildEndStep(model, graphArgs);
    return ret;
}

OH_NN_ReturnCode GetDeviceID(size_t *deviceId)
{
    OH_NN_ReturnCode ret = OH_NN_FAILED;
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    
    OH_LOG_INFO(LOG_APP, "[NNRtTest] Getting all available devices...");
    ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNDevice_GetAllDevicesID failed! ret=%{public}d", ret);
        return ret;
    }
    
    OH_LOG_INFO(LOG_APP, "[NNRtTest] Found %{public}u device(s)", devicesCount);
    if (devicesCount <= NO_DEVICE_COUNT) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] No devices available, devicesCount=%{public}d", devicesCount);
        return OH_NN_FAILED;
    }

    // 列出所有可用设备
    const char *name = nullptr;
    for (uint32_t i = 0; i < devicesCount; i++) {
        name = nullptr;
        ret = OH_NNDevice_GetName(devicesID[i], &name);
        if (ret == OH_NN_SUCCESS && name != nullptr) {
            OH_LOG_INFO(LOG_APP, "[NNRtTest] Device[%{public}u]: ID=%{public}zu, Name=%{public}s",
                i, devicesID[i], name);
        }
    }

    // 使用第一个可用设备（通常是 CPU 设备）
    *deviceId = devicesID[0];
    name = nullptr;
    ret = OH_NNDevice_GetName(devicesID[0], &name);
    if (ret == OH_NN_SUCCESS && name != nullptr) {
        OH_LOG_INFO(LOG_APP, "[NNRtTest] Selected device: ID=%{public}zu, Name=%{public}s", *deviceId, name);
    } else {
        OH_LOG_INFO(LOG_APP, "[NNRtTest] Selected device: ID=%{public}zu", *deviceId);
    }
    
    return OH_NN_SUCCESS;
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

static bool CreateParentDirectories(const std::string &path, mode_t mode)
{
    for (size_t i = 1; i < path.size() - 1; i++) {
        if (path[i] != '/') {
            continue;
        }
        
        std::string subPath = path.substr(0, i);
        PathType ret = CheckPath(subPath);
        
        switch (ret) {
            case PathType::DIR:
                continue;
            case PathType::NOT_FOUND:
                OH_LOG_INFO(LOG_APP, "[CreateFolder] Creating intermediate dir: %{public}s", subPath.c_str());
                if (mkdir(subPath.c_str(), mode) != 0) {
                    OH_LOG_ERROR(LOG_APP, "[CreateFolder] Failed to create dir: %{public}s, errno: %{public}d",
                                 subPath.c_str(), errno);
                }
                break;
            default:
                OH_LOG_ERROR(LOG_APP, "[CreateFolder] Path exists but not a dir: %{public}s", subPath.c_str());
                return false;
        }
    }
    return true;
}

static bool CreateFinalDirectory(const std::string &path, mode_t mode)
{
    OH_LOG_INFO(LOG_APP, "[CreateFolder] Creating final dir: %{public}s", path.c_str());
    if (mkdir(path.c_str(), mode) != 0) {
        if (errno != EEXIST) {
            OH_LOG_ERROR(LOG_APP,
                "[CreateFolder] Failed to create final dir: %{public}s, errno: %{public}d, error: %{public}s",
                path.c_str(), errno, strerror(errno));
            return false;
        }
        OH_LOG_INFO(LOG_APP, "[CreateFolder] Directory already exists (EEXIST)");
    }
    
    bool success = (CheckPath(path) == PathType::DIR);
    if (success) {
        OH_LOG_INFO(LOG_APP, "[CreateFolder] Successfully created: %{public}s", path.c_str());
    } else {
        OH_LOG_ERROR(LOG_APP, "[CreateFolder] Failed to verify directory: %{public}s", path.c_str());
    }
    return success;
}

bool CreateFolder(const std::string &path)
{
    if (path.empty()) {
        OH_LOG_ERROR(LOG_APP, "[CreateFolder] path is empty");
        return false;
    }
    
    OH_LOG_INFO(LOG_APP, "[CreateFolder] Creating path: %{public}s", path.c_str());
    
    PathType existingPath = CheckPath(path);
    if (existingPath == PathType::DIR) {
        OH_LOG_INFO(LOG_APP, "[CreateFolder] Path already exists: %{public}s", path.c_str());
        return true;
    } else if (existingPath == PathType::FILE) {
        OH_LOG_ERROR(LOG_APP, "[CreateFolder] Path exists but is a file: %{public}s", path.c_str());
        return false;
    }
    
    mode_t mode = 0777;
    
    if (!CreateParentDirectories(path, mode)) {
        return false;
    }
    
    return CreateFinalDirectory(path, mode);
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

int MultiModelBuildEndStep(OH_NNModel *model, const OHNNGraphArgsMulti &graphArgs)
{
    int ret = 0;
    auto graphInputs = TransformUInt32Array(graphArgs.graphInput);
    auto graphOutputs = TransformUInt32Array(graphArgs.graphOutput);
    ret = OH_NNModel_SpecifyInputsAndOutputs(model, &graphInputs, &graphOutputs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_SpecifyInputsAndOutputs failed! ret=%{public}d\n", ret);
        return ret;
    }
    ret = OH_NNModel_Finish(model);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_Finish failed! ret=%{public}d\n", ret);
        return ret;
    }
    return ret;
}

static int SetTensorDataIfNeeded(OH_NNModel *model, int opCnt, const OHNNOperandTest &operandTem,
                                 const std::vector<uint32_t> &paramIndices)
{
    bool isParamIndex = (std::find(paramIndices.begin(), paramIndices.end(), opCnt) != paramIndices.end());
    if (!isParamIndex) {
        return OH_NN_SUCCESS;
    }
    
    int ret = OH_NNModel_SetTensorData(model, opCnt, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_SetTensorData failed! ret=%{public}d\n", ret);
    }
    return ret;
}

static int ProcessOperandForMultiOp(OH_NNModel *model, const OHNNOperandTest &operandTem,
                                    size_t i, int opCnt, const std::vector<uint32_t> &paramIndices)
{
    NN_TensorDesc* tensorDesc = createTensorDesc(operandTem.shape.data(),
                                                 static_cast<uint32_t>(operandTem.shape.size()),
                                                 operandTem.dataType, operandTem.format);
    int ret = OH_NNModel_AddTensorToModel(model, tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddTensor failed! ret=%{public}d\n", ret);
        return ret;
    }
    ret = OH_NNModel_SetTensorType(model, i, operandTem.type);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNBackend_SetModelTensorType failed! ret=%{public}d\n", ret);
        return ret;
    }
    return SetTensorDataIfNeeded(model, opCnt, operandTem, paramIndices);
}

int BuildMultiOpGraph(OH_NNModel *model, const OHNNGraphArgsMulti &graphArgs)
{
    int ret = 0;
    int opCnt = 0;
    for (size_t j = 0; j < graphArgs.operationTypes.size(); j++) {
        for (size_t i = 0; i < graphArgs.operands[j].size(); i++) {
            const OHNNOperandTest &operandTem = graphArgs.operands[j][i];
            ret = ProcessOperandForMultiOp(model, operandTem, i, opCnt, graphArgs.paramIndices[j]);
            if (ret != OH_NN_SUCCESS) {
                return ret;
            }
            opCnt++;
        }
        auto inputIndices = TransformUInt32Array(graphArgs.inputIndices[j]);
        auto outputIndices = TransformUInt32Array(graphArgs.outputIndices[j]);
        auto paramIndices = TransformUInt32Array(graphArgs.paramIndices[j]);
        ret = OH_NNModel_AddOperation(model, graphArgs.operationTypes[j], &paramIndices, &inputIndices, &outputIndices);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_AddOperation failed! ret=%{public}d\n", ret);
            return ret;
        }
    }
    return MultiModelBuildEndStep(model, graphArgs);
}

OH_NN_ReturnCode SetDevice(OH_NNCompilation *compilation)
{
    size_t deviceId = 0;
    OH_NN_ReturnCode ret = GetDeviceID(&deviceId);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNDevice_GetAllDevicesID failed! ret=%{public}d\n", ret);
        return ret;
    }

    ret = OH_NNCompilation_SetDevice(compilation, deviceId);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetDevice failed! ret=%{public}d\n", ret);
        return ret;
    }
    return ret;
}

int CompileGraphMock(OH_NNCompilation *compilation, const OHNNCompileParam &compileParam)
{
    int ret = 0;
    if (!compileParam.cacheDir.empty()) {
        ret = OH_NNCompilation_SetCache(compilation, compileParam.cacheDir.c_str(), compileParam.cacheVersion);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetCache failed! ret=%{public}d\n", ret);
            return ret;
        }
    }

    if (compileParam.performanceMode != OH_NN_PERFORMANCE_NONE) {
        ret = OH_NNCompilation_SetPerformanceMode(compilation, compileParam.performanceMode);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetPerformanceMode failed! ret=%{public}d\n", ret);
            return ret;
        }
    }

    if (compileParam.priority != OH_NN_PRIORITY_NONE) {
        ret = OH_NNCompilation_SetPriority(compilation, compileParam.priority);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_SetPriority failed! ret=%{public}d\n", ret);
            return ret;
        }
    }

    if (compileParam.enableFp16) {
        ret = OH_NNCompilation_EnableFloat16(compilation, compileParam.enableFp16);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_EnableFloat16 failed! ret=%{public}d\n", ret);
            return ret;
        }
    }

    ret = SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] SetDevice failed! ret=%{public}d\n", ret);
        return ret;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_Build failed! ret=%{public}d\n", ret);
        return ret;
    }
    return ret;
}

bool CheckOutput(const float* output, const float* expect)
{
    if (output == nullptr || expect == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] output or expect is nullptr\n");
        return false;
    }

    const int neuronCount = 4;
    const double tolerance = 1e-6;
    for (int j = 0; j < neuronCount; j++) {
        if (std::fabs(output[j] - expect[j]) > tolerance) {
                OH_LOG_ERROR(LOG_APP, "[NNRtTest] output %{public}d not match: expect:%{public}f, "
                                      "actual:%{public}f\n", j, float(expect[j]), float(output[j]));
            return false;
        }
    }
    return true;
}

//创建定长模型
int ConstructAddModel(OH_NNModel **model)
{
    *model = OH_NNModel_Construct();
    if (*model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_Construct failed");
        return -1;
    }
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    int ret = BuildSingleOpGraph(*model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] BuildSingleOpGraph failed, ret=%{public}d", ret);
        return -1;
    }
    return 0;
}

//定长模型创建compilation
int ConstructCompilation(OH_NNCompilation **compilation, OH_NNModel **model)
{
    int ret = ConstructAddModel(model);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] ConstructAddModel failed");
        return -1;
    }
    *compilation = OH_NNCompilation_Construct(*model);
    if (*compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_Construct failed");
        return -1;
    }
    return 0;
}

//通过定长compilation创建executor
int CreateExecutor(OH_NNExecutor **executor)
{
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    int ret = ConstructCompilation(&compilation, &model);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] ConstructCompilation failed");
        return -1;
    }
    OHNNCompileParam compileParam{
        .performanceMode = OH_NN_PERFORMANCE_HIGH,
        .priority = OH_NN_PRIORITY_HIGH,
    };
    ret = CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] CompileGraphMock failed, ret=%{public}d", ret);
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }
    *executor = OH_NNExecutor_Construct(compilation);
    if (*executor == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_Construct failed");
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    return 0;
}

int CreateDynamicExecutor(OH_NNExecutor **executor)
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNModel_Construct failed");
        return -1;
    }
    AvgPoolDynamicModel avgModel;
    OHNNGraphArgs graphArgs = avgModel.graphArgs;
    int ret = BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] BuildSingleOpGraph failed, ret=%{public}d", ret);
        OH_NNModel_Destroy(&model);
        return -1;
    }

    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNCompilation_Construct failed");
        OH_NNModel_Destroy(&model);
        return -1;
    }

    OHNNCompileParam compileParam{
        .performanceMode = OH_NN_PERFORMANCE_HIGH,
        .priority = OH_NN_PRIORITY_HIGH,
    };
    ret = CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] CompileGraphMock failed, ret=%{public}d", ret);
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }
    *executor = OH_NNExecutor_Construct(compilation);
    if (*executor == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_Construct failed");
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    return 0;
}

int GetExecutorInputOutputTensorDesc(
    OH_NNExecutor* executor,
    std::vector<NN_TensorDesc*>& inputTensorDescs,
    size_t& inputCount,
    std::vector<NN_TensorDesc*>& outputTensorDescs,
    size_t& outputCount
)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputCount(executor, &inputCount);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_GetInputCount failed, ret=%{public}d", ret);
        return -1;
    }
    NN_TensorDesc* tensorDescTmp = nullptr;
    for (size_t i = 0; i < inputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateInputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_CreateInputTensorDesc failed, i=%{public}zu", i);
            return -1;
        }
        inputTensorDescs.emplace_back(tensorDescTmp);
    }

    ret = OH_NNExecutor_GetOutputCount(executor, &outputCount);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_GetOutputCount failed, ret=%{public}d", ret);
        return -1;
    }
    for (size_t i = 0; i < outputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateOutputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_CreateOutputTensorDesc failed, i=%{public}zu", i);
            return -1;
        }
        outputTensorDescs.emplace_back(tensorDescTmp);
    }
    return 0;
}

int GetExecutorInputOutputTensorByDesc(
    OH_NNExecutor* executor,
    std::vector<NN_Tensor*>& inputTensors,
    const std::vector<NN_TensorDesc*>& inputTensorDescs,
    std::vector<NN_Tensor*>& outputTensors,
    const std::vector<NN_TensorDesc*>& outputTensorDescs
)
{
    size_t deviceID = 0;
    if (OH_NN_SUCCESS != GetDeviceID(&deviceID)) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] Get deviceid failed");
        return -1;
    }
    NN_Tensor* tensor = nullptr;
    for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
        tensor = nullptr;
        tensor = OH_NNTensor_Create(deviceID, inputTensorDescs[i]);
        if (tensor == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNTensor_Create failed for input, i=%{public}zu", i);
            return -1;
        }
        inputTensors.emplace_back(tensor);
    }

    for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
        tensor = nullptr;
        tensor = OH_NNTensor_Create(deviceID, outputTensorDescs[i]);
        if (tensor == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNTensor_Create failed for output, i=%{public}zu", i);
            return -1;
        }
        outputTensors.emplace_back(tensor);
    }
    return 0;
}

static int CreateInputTensorDescs(
    OH_NNExecutor* executor,
    size_t& inputCount,
    std::vector<NN_TensorDesc*>& inputTensorDescs
)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputCount(executor, &inputCount);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_GetInputCount failed, ret=%{public}d", ret);
        return -1;
    }
    
    NN_TensorDesc* tensorDescTmp = nullptr;
    for (size_t i = 0; i < inputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateInputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_CreateInputTensorDesc failed, i=%{public}zu", i);
            return -1;
        }
        inputTensorDescs.emplace_back(tensorDescTmp);
    }
    return 0;
}

static int CreateOutputTensorDescs(
    OH_NNExecutor* executor,
    size_t& outputCount,
    std::vector<NN_TensorDesc*>& outputTensorDescs
)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_GetOutputCount(executor, &outputCount);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_GetOutputCount failed, ret=%{public}d", ret);
        return -1;
    }
    
    NN_TensorDesc* tensorDescTmp = nullptr;
    for (size_t i = 0; i < outputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateOutputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNExecutor_CreateOutputTensorDesc failed, i=%{public}zu", i);
            return -1;
        }
        outputTensorDescs.emplace_back(tensorDescTmp);
    }
    return 0;
}

static int CreateTensorsFromDescs(
    size_t deviceID,
    const std::vector<NN_TensorDesc*>& inputTensorDescs,
    const std::vector<NN_TensorDesc*>& outputTensorDescs,
    std::vector<NN_Tensor*>& inputTensors,
    std::vector<NN_Tensor*>& outputTensors
)
{
    NN_Tensor* tensor = nullptr;
    for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
        tensor = OH_NNTensor_Create(deviceID, inputTensorDescs[i]);
        if (tensor == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNTensor_Create failed for input, i=%{public}zu", i);
            return -1;
        }
        inputTensors.emplace_back(tensor);
    }

    for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
        tensor = OH_NNTensor_Create(deviceID, outputTensorDescs[i]);
        if (tensor == nullptr) {
            OH_LOG_ERROR(LOG_APP, "[NNRtTest] OH_NNTensor_Create failed for output, i=%{public}zu", i);
            return -1;
        }
        outputTensors.emplace_back(tensor);
    }
    return 0;
}

int GetExecutorInputOutputTensor(OH_NNExecutor* executor,
                                 std::vector<NN_Tensor*>& inputTensors,
                                 size_t& inputCount,
                                 std::vector<NN_Tensor*>& outputTensors,
                                 size_t& outputCount)
{
    std::vector<NN_TensorDesc*> inputTensorDescs;
    std::vector<NN_TensorDesc*> outputTensorDescs;
    
    if (CreateInputTensorDescs(executor, inputCount, inputTensorDescs) != 0) {
        return -1;
    }

    if (CreateOutputTensorDescs(executor, outputCount, outputTensorDescs) != 0) {
        DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
        return -1;
    }

    size_t deviceID = 0;
    if (OH_NN_SUCCESS != GetDeviceID(&deviceID)) {
        OH_LOG_ERROR(LOG_APP, "[NNRtTest] Get deviceid failed");
        DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
        return -1;
    }

    if (CreateTensorsFromDescs(deviceID, inputTensorDescs, outputTensorDescs,
                               inputTensors, outputTensors) != 0) {
        DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
        return -1;
    }

    DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
    return 0;
}

OH_NN_ReturnCode DestroyTensorDesc(
    std::vector<NN_TensorDesc*>& inputTensorDescs, std::vector<NN_TensorDesc*>& outputTensorDescs)
{
    OH_NN_ReturnCode returnCode {OH_NN_FAILED};
    for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
        returnCode = OH_NNTensorDesc_Destroy(&inputTensorDescs[i]);
        if (returnCode != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "End2EndTest::OH_NNTensorDesc_Destroy failed.");
            return returnCode;
        }
    }
    for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
        returnCode = OH_NNTensorDesc_Destroy(&outputTensorDescs[i]);
        if (returnCode != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "End2EndTest::OH_NNTensorDesc_Destroy failed.");
            return returnCode;
        }
    }

    return OH_NN_SUCCESS;
}

OH_NN_ReturnCode DestroyTensor(
    std::vector<NN_Tensor*>& inputTensors, std::vector<NN_Tensor*>& outputTensors)
{
    // 清理输入输出Tensor
    OH_NN_ReturnCode returnCode {OH_NN_FAILED};
    for (size_t i = 0; i < inputTensors.size(); ++i) {
        returnCode = OH_NNTensor_Destroy(&inputTensors[i]);
        if (returnCode != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "End2EndTest::OH_NNTensor_Destroy failed.");
            return returnCode;
        }
    }
    for (size_t i = 0; i < outputTensors.size(); ++i) {
        returnCode = OH_NNTensor_Destroy(&outputTensors[i]);
        if (returnCode != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "End2EndTest::OH_NNTensor_Destroy failed.");
            return returnCode;
        }
    }

    return OH_NN_SUCCESS;
}

} // namespace Test
} // namespace NeuralNetworkRuntime
} // namespace OHOS