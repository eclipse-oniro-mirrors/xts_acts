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

bool CreateFolder(const std::string &path)
{
    if (path.empty()) {
        OH_LOG_INFO(LOG_APP, "CreateFolder: path is empty");
        return false;
    }
    OH_LOG_INFO(LOG_APP, "CreateFolder:%{public}s", path.c_str());
    mode_t mode = 0700;
    for (size_t i = 1; i < path.size() - 1; i++) {
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

} // namespace Test
} // namespace NeuralNetworkRuntime
} // namespace OHOS