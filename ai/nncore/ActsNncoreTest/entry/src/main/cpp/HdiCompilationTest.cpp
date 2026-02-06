/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <unistd.h>
#include <vector>
#include <string>
#include "NNcoreUtilsTest.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "NNRtCompilationTest"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace OHOS {
namespace NeuralNetworkCore {

// 辅助函数：生成缓存文件
static int GenCacheFile(const std::string &cachePath)
{
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);
    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = CACHEVERSION,
    };

    int ret = CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] CompileGraphMock failed, ret=%{public}d", ret);
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }

    if (CheckPath(cachePath + CACHE_FILE) != PathType::FILE) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Cache file not found");
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }

    if (CheckPath(cachePath + CACHE_INFO_FILE) != PathType::FILE) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Cache info file not found");
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }

    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    return 0;
}

// 辅助函数：保存支持的模型
static int SaveSupportModel()
{
    OH_NNModel *model = nullptr;
    ConstructAddModel(&model);
    std::ofstream ofs(SUPPORTMODELPATH, std::ios::out | std::ios::binary);
    if (ofs) {
        ofs.write(reinterpret_cast<char *>(model), sizeof(reinterpret_cast<char *>(model)));
        ofs.close();
    }
    OH_NNModel_Destroy(&model);
    return 0;
}

// 辅助函数：配置编译参数
static int ConfigureCompilation(OH_NNCompilation *compilation, OH_NNModel *model)
{
    OH_NN_ReturnCode returnCode = OH_NNCompilation_SetCache(compilation, CACHE_DIR.c_str(), CACHEVERSION);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_SetCache failed, ret=%{public}d", returnCode);
        return -1;
    }
    returnCode = SetDevice(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetDevice failed, ret=%{public}d", returnCode);
        return -1;
    }
    returnCode = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_EXTREME);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetPerformanceMode failed, ret=%{public}d", returnCode);
        return -1;
    }
    returnCode = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_HIGH);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetPriority failed, ret=%{public}d", returnCode);
        return -1;
    }
    returnCode = OH_NNCompilation_EnableFloat16(compilation, false);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] EnableFloat16 failed, ret=%{public}d", returnCode);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0100
 * @tc.desc   创建compilation，检查返回值为空，设置正确的cache路径，build成功，推理成功
 */
int TestCompilationConstructForCache0100()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructForCache0100 START");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "core_build01_" + std::to_string(pid);
    CreateFolder(cachePath);

    int ret = GenCacheFile(cachePath);
    if (ret != 0) {
        DeleteFolder(cachePath);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] GenCacheFile failed");
        return -1;
    }

    OH_NNCompilation *compilation = OH_NNCompilation_ConstructForCache();
    if (compilation == nullptr) {
        DeleteFolder(cachePath);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_ConstructForCache returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode returnCode = OH_NNCompilation_SetCache(compilation, cachePath.c_str(), CACHEVERSION);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNCompilation_Destroy(&compilation);
        DeleteFolder(cachePath);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_SetCache failed, ret=%{public}d", returnCode);
        return -1;
    }

    returnCode = SetDevice(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNCompilation_Destroy(&compilation);
        DeleteFolder(cachePath);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetDevice failed, ret=%{public}d", returnCode);
        return -1;
    }

    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNCompilation_Destroy(&compilation);
        DeleteFolder(cachePath);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_Build failed, ret=%{public}d", returnCode);
        return -1;
    }

    OH_NNCompilation_Destroy(&compilation);
    DeleteFolder(cachePath);

    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructForCache0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructForCache0200
 * @tc.desc   创建compilation，检查返回值非空，不设置cache，build失败
 */
int TestCompilationConstructForCache0200()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructForCache0200 START");

    OH_NNCompilation *compilation = OH_NNCompilation_ConstructForCache();
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_ConstructForCache returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_INVALID_PARAMETER) {
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", returnCode);
        return -1;
    }

    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructForCache0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0100
 * @tc.desc   创建compilation，增加config，传入compilation为空，返回错误
 */
int TestCompilationAddExtensionConfig0100()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0100 START");
    const char *configName = "test";
    const void *configValue = reinterpret_cast<const void *>(10);
    const size_t configValueSize = 1;
    OH_NN_ReturnCode ret = OH_NNCompilation_AddExtensionConfig(nullptr, configName, configValue, configValueSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0200
 * @tc.desc   创建compilation，增加config，传入configNames为空指针，返回错误
 */
int TestCompilationAddExtensionConfig0200()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0200 START");
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);

    const void *configValue = reinterpret_cast<const void *>(10);
    const size_t configValueSize = 1;
    OH_NN_ReturnCode ret = OH_NNCompilation_AddExtensionConfig(compilation, nullptr, configValue, configValueSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0300
 * @tc.desc   创建compilation，增加config，传入configNames为空字符串，报错
 */
int TestCompilationAddExtensionConfig0300()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0300 START");
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);
    const char *configName = "";
    int num = 10;
    const void *configValue = &num;
    const size_t configValueSize = sizeof(num);
    OH_NN_ReturnCode ret = OH_NNCompilation_AddExtensionConfig(compilation, configName, configValue, configValueSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0400
 * @tc.desc   创建compilation，增加config，传入configValues为空，报错
 */
int TestCompilationAddExtensionConfig0400()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0400 START");
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);
    const char *configName = "test";
    const size_t configValueSize = 1;
    OH_NN_ReturnCode ret = OH_NNCompilation_AddExtensionConfig(compilation, configName, nullptr, configValueSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0400 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_AddExtensionConfig0500
 * @tc.desc   创建compilation，增加config，传入configValueSize为0
 */
int TestCompilationAddExtensionConfig0500()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0500 START");
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);
    const char *configName = "test";
    const void *configValue = reinterpret_cast<const void *>(10);
    const size_t configValueSize = 0;
    OH_NN_ReturnCode ret = OH_NNCompilation_AddExtensionConfig(compilation, configName, configValue, configValueSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationAddExtensionConfig0500 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0100
 * @tc.desc   传入filepath为空指针，返回不支持
 */
int TestCompilationConstructWithOfflineModelFile0100()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelFile0100 START");

    OH_NNCompilation *compilation = OH_NNCompilation_ConstructWithOfflineModelFile(nullptr);
    if (compilation != nullptr) {
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected nullptr but got compilation");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelFile0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelFile0200
 * @tc.desc   传入合法文件，返回不支持
 */
int TestCompilationConstructWithOfflineModelFile0200()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelFile0200 START");

    int ret = SaveSupportModel();
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SaveSupportModel failed");
        return -1;
    }

    OH_NNCompilation *compilation = OH_NNCompilation_ConstructWithOfflineModelFile(SUPPORTMODELPATH.c_str());
    if (compilation == nullptr) {
        DeleteFile(SUPPORTMODELPATH);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_ConstructWithOfflineModelFile returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode returnCode = SetDevice(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNCompilation_Destroy(&compilation);
        DeleteFile(SUPPORTMODELPATH);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetDevice failed, ret=%{public}d", returnCode);
        return -1;
    }

    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_FAILED) {
        OH_NNCompilation_Destroy(&compilation);
        DeleteFile(SUPPORTMODELPATH);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_FAILED but got %{public}d", returnCode);
        return -1;
    }

    DeleteFile(SUPPORTMODELPATH);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelFile0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0100
 * @tc.desc   传入modelData为空指针，返回错误
 */
int TestCompilationConstructWithOfflineModelBuffer0100()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelBuffer0100 START");

    int modelSize = 0;
    const void *buffer = nullptr;
    OH_NNCompilation *compilation = OH_NNCompilation_ConstructWithOfflineModelBuffer(buffer, modelSize);

    if (compilation != nullptr) {
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected nullptr but got compilation");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelBuffer0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ConstructWithOfflineModelBuffer0200
 * @tc.desc   传入modelData为合法离线模型buffer，返回不支持
 */
int TestCompilationConstructWithOfflineModelBuffer0200()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelBuffer0200 START");

    OH_NNCompilation *compilation =
        OH_NNCompilation_ConstructWithOfflineModelBuffer(reinterpret_cast<const void *>(TEST_BUFFER), 28);

    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_ConstructWithOfflineModelBuffer returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode returnCode = SetDevice(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetDevice failed, ret=%{public}d", returnCode);
        return -1;
    }

    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_FAILED) {
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_FAILED but got %{public}d", returnCode);
        return -1;
    }

    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationConstructWithOfflineModelBuffer0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0100
 * @tc.desc   传入空指针返回失败
 */
int TestCompilationExportCacheToBuffer0100()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationExportCacheToBuffer0100 START");

    const char *any = "123456789";
    const void *buffer = reinterpret_cast<const void *>(any);
    size_t length = 10;
    size_t *modelSize = &length;
    OH_NN_ReturnCode ret = OH_NNCompilation_ExportCacheToBuffer(nullptr, buffer, length, modelSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationExportCacheToBuffer0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ExportCacheToBuffer0200
 * @tc.desc   参数正确，nnrt模型返回不支持
 */
int TestCompilationExportCacheToBuffer0200()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationExportCacheToBuffer0200 START");

    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);

    OH_NN_ReturnCode returnCode = SetDevice(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] SetDevice failed, ret=%{public}d", returnCode);
        return -1;
    }

    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] OH_NNCompilation_Build failed, ret=%{public}d", returnCode);
        return -1;
    }

    const char *any = "123456789";
    const void *buffer = reinterpret_cast<const void *>(any);
    size_t length = 10;
    size_t *modelSize = &length;
    OH_NN_ReturnCode ret = OH_NNCompilation_ExportCacheToBuffer(compilation, buffer, length, modelSize);
    if (ret != OH_NN_UNSUPPORTED) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_UNSUPPORTED but got %{public}d", ret);
        return -1;
    }

    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationExportCacheToBuffer0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0100
 * @tc.desc   buffer为空，返回错误
 */
int TestCompilationImportCacheFromBuffer0100()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationImportCacheFromBuffer0100 START");
    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);
    const void *buffer = nullptr;
    size_t modelSize = MODEL_SIZE;
    OH_NN_ReturnCode ret = OH_NNCompilation_ImportCacheFromBuffer(compilation, buffer, modelSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationImportCacheFromBuffer0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0200
 * @tc.desc   modelSize为0，返回错误
 */
int TestCompilationImportCacheFromBuffer0200()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationImportCacheFromBuffer0200 START");

    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);

    const char *any = "123456789";
    const void *buffer = reinterpret_cast<const void *>(any);
    size_t modelSize = ZERO;
    OH_NN_ReturnCode ret = OH_NNCompilation_ImportCacheFromBuffer(compilation, buffer, modelSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationImportCacheFromBuffer0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_ImportCacheFromBuffer0300
 * @tc.desc   参数正确，返回不支持
 */
int TestCompilationImportCacheFromBuffer0300()
{
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationImportCacheFromBuffer0300 START");

    OH_NNCompilation *compilation = nullptr;
    OH_NNModel *model = nullptr;
    ConstructCompilation(&compilation, &model);

    if (ConfigureCompilation(compilation, model) != 0) {
        return -1;
    }

    const char *any = "123456789";
    const void *buffer = reinterpret_cast<const void *>(any);
    size_t modelSize = MODEL_SIZE;
    OH_NN_ReturnCode returnCode = OH_NNCompilation_ImportCacheFromBuffer(compilation, buffer, modelSize);
    if (returnCode != OH_NN_SUCCESS) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] ImportCacheFromBuffer failed, ret=%{public}d", returnCode);
        return -1;
    }

    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_NNCompilation_Destroy(&compilation);
        OH_LOG_ERROR(LOG_APP, "[CompilationTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", returnCode);
        return -1;
    }

    OH_NNModel_Destroy(&model);
    OH_NNCompilation_Destroy(&compilation);
    OH_LOG_INFO(LOG_APP, "[CompilationTest] TestCompilationImportCacheFromBuffer0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0100
 * @tc.desc   错误码断言测试 OH_NN_MEMORY_ERROR
 */
int TestCompilationReturnCodeCheck0100()
{
    OH_NN_ReturnCode focusMode = OH_NN_MEMORY_ERROR;
    if (focusMode != OH_NN_MEMORY_ERROR) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0200
 * @tc.desc   错误码断言测试 OH_NN_NULL_PTR
 */
int TestCompilationReturnCodeCheck0200()
{
    OH_NN_ReturnCode focusMode = OH_NN_NULL_PTR;
    if (focusMode != OH_NN_NULL_PTR) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0300
 * @tc.desc   错误码断言测试 OH_NN_INVALID_FILE
 */
int TestCompilationReturnCodeCheck0300()
{
    OH_NN_ReturnCode focusMode = OH_NN_INVALID_FILE;
    if (focusMode != OH_NN_INVALID_FILE) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0400
 * @tc.desc   错误码断言测试 OH_NN_UNAVALIDABLE_DEVICE
 */
int TestCompilationReturnCodeCheck0400()
{
    OH_NN_ReturnCode focusMode = OH_NN_UNAVALIDABLE_DEVICE;
    if (focusMode != OH_NN_UNAVALIDABLE_DEVICE) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0500
 * @tc.desc   错误码断言测试 OH_NN_INVALID_PATH
 */
int TestCompilationReturnCodeCheck0500()
{
    OH_NN_ReturnCode focusMode = OH_NN_INVALID_PATH;
    if (focusMode != OH_NN_INVALID_PATH) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0600
 * @tc.desc   错误码断言测试 OH_NN_TIMEOUT
 */
int TestCompilationReturnCodeCheck0600()
{
    OH_NN_ReturnCode focusMode = OH_NN_TIMEOUT;
    if (focusMode != OH_NN_TIMEOUT) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0700
 * @tc.desc   错误码断言测试 OH_NN_CONNECTION_EXCEPTION
 */
int TestCompilationReturnCodeCheck0700()
{
    OH_NN_ReturnCode focusMode = OH_NN_CONNECTION_EXCEPTION;
    if (focusMode != OH_NN_CONNECTION_EXCEPTION) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0800
 * @tc.desc   错误码断言测试 OH_NN_SAVE_CACHE_EXCEPTION
 */
int TestCompilationReturnCodeCheck0800()
{
    OH_NN_ReturnCode focusMode = OH_NN_SAVE_CACHE_EXCEPTION;
    if (focusMode != OH_NN_SAVE_CACHE_EXCEPTION) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_ReturnCodeCheck0900
 * @tc.desc   错误码断言测试 OH_NN_UNAVAILABLE_DEVICE
 */
int TestCompilationReturnCodeCheck0900()
{
    OH_NN_ReturnCode focusMode = OH_NN_UNAVAILABLE_DEVICE;
    if (focusMode != OH_NN_UNAVAILABLE_DEVICE) {
        return -1;
    }
    return 0;
}

// 导出所有测试函数的注册函数
struct CompilationTestCase {
    const char *name;
    int (*func)();
};

static std::vector<CompilationTestCase> g_compilationTests = {
    {"TestCompilationConstructForCache0100", TestCompilationConstructForCache0100},
    {"TestCompilationConstructForCache0200", TestCompilationConstructForCache0200},
    {"TestCompilationAddExtensionConfig0100", TestCompilationAddExtensionConfig0100},
    {"TestCompilationAddExtensionConfig0200", TestCompilationAddExtensionConfig0200},
    {"TestCompilationAddExtensionConfig0300", TestCompilationAddExtensionConfig0300},
    {"TestCompilationAddExtensionConfig0400", TestCompilationAddExtensionConfig0400},
    {"TestCompilationAddExtensionConfig0500", TestCompilationAddExtensionConfig0500},
    {"TestCompilationConstructWithOfflineModelFile0100", TestCompilationConstructWithOfflineModelFile0100},
    {"TestCompilationConstructWithOfflineModelFile0200", TestCompilationConstructWithOfflineModelFile0200},
    {"TestCompilationConstructWithOfflineModelBuffer0100", TestCompilationConstructWithOfflineModelBuffer0100},
    {"TestCompilationConstructWithOfflineModelBuffer0200", TestCompilationConstructWithOfflineModelBuffer0200},
    {"TestCompilationExportCacheToBuffer0100", TestCompilationExportCacheToBuffer0100},
    {"TestCompilationExportCacheToBuffer0200", TestCompilationExportCacheToBuffer0200},
    {"TestCompilationImportCacheFromBuffer0100", TestCompilationImportCacheFromBuffer0100},
    {"TestCompilationImportCacheFromBuffer0200", TestCompilationImportCacheFromBuffer0200},
    {"TestCompilationImportCacheFromBuffer0300", TestCompilationImportCacheFromBuffer0300},
    {"TestCompilationReturnCodeCheck0100", TestCompilationReturnCodeCheck0100},
    {"TestCompilationReturnCodeCheck0200", TestCompilationReturnCodeCheck0200},
    {"TestCompilationReturnCodeCheck0300", TestCompilationReturnCodeCheck0300},
    {"TestCompilationReturnCodeCheck0400", TestCompilationReturnCodeCheck0400},
    {"TestCompilationReturnCodeCheck0500", TestCompilationReturnCodeCheck0500},
    {"TestCompilationReturnCodeCheck0600", TestCompilationReturnCodeCheck0600},
    {"TestCompilationReturnCodeCheck0700", TestCompilationReturnCodeCheck0700},
    {"TestCompilationReturnCodeCheck0800", TestCompilationReturnCodeCheck0800},
    {"TestCompilationReturnCodeCheck0900", TestCompilationReturnCodeCheck0900},
};

// 运行所有Compilation测试
int RunAllCompilationTests()
{
    int passCount = 0;
    int failCount = 0;

    OH_LOG_INFO(LOG_APP, "========== Running Compilation Tests ==========");
    OH_LOG_INFO(LOG_APP, "Total test cases: %{public}zu", g_compilationTests.size());

    for (const auto &testCase : g_compilationTests) {
        OH_LOG_INFO(LOG_APP, "Running: %{public}s", testCase.name);
        int ret = testCase.func();
        if (ret == 0) {
            passCount++;
            OH_LOG_INFO(LOG_APP, "[PASSED] %{public}s", testCase.name);
        } else {
            failCount++;
            OH_LOG_ERROR(LOG_APP, "[FAILED] %{public}s", testCase.name);
        }
    }

    OH_LOG_INFO(LOG_APP, "========== Compilation Tests Summary ==========");
    OH_LOG_INFO(LOG_APP, "Passed: %{public}d, Failed: %{public}d", passCount, failCount);

    return (failCount == 0) ? 0 : -1;
}

} // namespace NeuralNetworkCore
} // namespace OHOS
