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
#include <vector>
#include <string>
#include "NNcoreUtilsTest.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "NNRtExecutorTest"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace OHOS {
namespace NeuralNetworkCore {

// 回调函数
void RunDone(void *pointer, OH_NN_ReturnCode returnCode, void *pointerArray[], int32_t intNum)
{ return; }

void ServiceDied(void *point)
{ return; }

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_Construct0100
 * @tc.desc   compilation为空，返回失败
 */
int TestExecutorConstruct0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorConstruct0100 START");

    OH_NNCompilation *compilation = nullptr;
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor != nullptr) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected nullptr but got executor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorConstruct0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy0100
 * @tc.desc   重复释放executor，返回失败
 */
int TestExecutorDestroy0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorDestroy0100 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    OH_NNExecutor_Destroy(&executor);
    if (executor != nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Executor should be nullptr after destroy");
        return -1;
    }

    OH_NNExecutor_Destroy(&executor); // 重复释放

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorDestroy0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy0200
 * @tc.desc   正常释放，检查executor为空
 */
int TestExecutorDestroy0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorDestroy0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    OH_NNExecutor_Destroy(&executor);
    if (executor != nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Executor should be nullptr after destroy");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorDestroy0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0100
 * @tc.desc   在推理完成时设置executor，executor为空，返回失败
 */
int TestExecutorSetOnRunDone0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnRunDone0100 START");

    NN_OnRunDone onRunDone = RunDone;
    OH_NNExecutor *executor = nullptr;
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOnRunDone(executor, onRunDone);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnRunDone0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0200
 * @tc.desc   在推理完成时设置executor，合法参数返回不支持
 */
int TestExecutorSetOnRunDone0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnRunDone0200 START");

    NN_OnRunDone onRunDone = RunDone;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOnRunDone(executor, onRunDone);
    if (ret != OH_NN_OPERATION_FORBIDDEN) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_OPERATION_FORBIDDEN but got %{public}d", ret);
        return -1;
    }

    OH_NNExecutor_Destroy(&executor);
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnRunDone0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorSetOnServiceDied0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnServiceDied0100 START");

    NN_OnServiceDied onServiceDied = ServiceDied;
    OH_NNExecutor *executor = nullptr;
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOnServiceDied(executor, onServiceDied);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnServiceDied0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0200
 * @tc.desc   合法参数，返回不支持
 */
int TestExecutorSetOnServiceDied0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnServiceDied0200 START");

    NN_OnServiceDied onServiceDied = ServiceDied;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOnServiceDied(executor, onServiceDied);
    if (ret != OH_NN_OPERATION_FORBIDDEN) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_OPERATION_FORBIDDEN but got %{public}d", ret);
        return -1;
    }

    OH_NNExecutor_Destroy(&executor);
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorSetOnServiceDied0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Executor_RunSync0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorRunSync0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0100 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);
    OH_NNExecutor_Destroy(&executor);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), outputCount);
    if (ret != OH_NN_INVALID_PARAMETER) {
        DestroyTensor(inputTensors, outputTensors);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    DestroyTensor(inputTensors, outputTensors);
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0200
 * @tc.desc   executor sync推理，inputTensor数组为空,返回失败
 */
int TestExecutorRunSync0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0200 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret = OH_NNExecutor_RunSync(executor, nullptr, inputCount, outputTensors.data(), outputCount);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0300
 * @tc.desc   executor sync推理，outputTensor数组为空,返回失败
 */
int TestExecutorRunSync0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0300 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret = OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, nullptr, outputCount);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0400
 * @tc.desc   executor sync推理，inputCount为0，返回失败
 */
int TestExecutorRunSync0400()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0400 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret = OH_NNExecutor_RunSync(executor, inputTensors.data(), 0, outputTensors.data(), outputCount);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0400 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0500
 * @tc.desc   executor sync推理，outputCount为0，返回失败
 */
int TestExecutorRunSync0500()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0500 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret = OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), 0);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0500 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0600
 * @tc.desc   executor sync推理，inputTensor个数不足，小于正确的输入数量，返回错误
 */
int TestExecutorRunSync0600()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0600 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount - 1, outputTensors.data(), outputCount);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0600 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0700
 * @tc.desc   executor sync推理，inputTensor数组个数超过inputNum，返回错误
 */
int TestExecutorRunSync0700()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0700 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount + 1, outputTensors.data(), outputCount);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0700 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0800
 * @tc.desc   executor sync推理，outputTensor个数不足，小于正确的输入数量，返回错误
 */
int TestExecutorRunSync0800()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0800 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), outputCount - 1);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0800 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0900
 * @tc.desc   executor sync推理，outputTensor数组个数超过outputNum，返回错误
 */
int TestExecutorRunSync0900()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0900 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), outputCount + 1);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunSync0900 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0100
 * @tc.desc   executor async推理，executor为空，返回失败
 */
int TestExecutorRunAsync0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0100 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    int32_t timeout = 60;
    void *userData = (void *)executor;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);
    OH_NNExecutor_Destroy(&executor);

    OH_NN_ReturnCode ret = OH_NNExecutor_RunAsync(executor, inputTensors.data(), inputCount, outputTensors.data(),
                                                  outputCount, timeout, userData);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0200
 * @tc.desc   executor async推理，inputCount为0，返回失败
 */
int TestExecutorRunAsync0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0200 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    int32_t timeout = 60;
    void *userData = (void *)executor;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunAsync(executor, inputTensors.data(), 0, outputTensors.data(), outputCount, timeout, userData);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0300
 * @tc.desc   executor async推理，outputCount为0，返回失败
 */
int TestExecutorRunAsync0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0300 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    int32_t timeout = 60;
    void *userData = (void *)executor;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunAsync(executor, inputTensors.data(), inputCount, outputTensors.data(), 0, timeout, userData);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0400
 * @tc.desc   executor async推理，inputTensor为空指针
 */
int TestExecutorRunAsync0400()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0400 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    int32_t timeout = 60;
    void *userData = (void *)executor;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunAsync(executor, nullptr, inputCount, outputTensors.data(), outputCount, timeout, userData);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0400 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0500
 * @tc.desc   executor async推理，outputTensor为空指针
 */
int TestExecutorRunAsync0500()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0500 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    int32_t timeout = 60;
    void *userData = (void *)executor;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunAsync(executor, inputTensors.data(), inputCount, nullptr, outputCount, timeout, userData);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0500 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0600
 * @tc.desc   executor async推理，定长模型返回不支持
 */
int TestExecutorRunAsync0600()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0600 START");

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);
    int32_t timeout = 60;
    void *userData = (void *)executor;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    OH_NN_ReturnCode ret = OH_NNExecutor_RunAsync(executor, inputTensors.data(), inputCount, outputTensors.data(),
                                                  outputCount, timeout, userData);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_OPERATION_FORBIDDEN) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_OPERATION_FORBIDDEN but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorRunAsync0600 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorGetOutputShape0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputShape0100 START");

    int32_t *outputDimensions = nullptr;
    uint32_t outputDimensionCount = 0;
    uint32_t outputIndex = 0;

    OH_NN_ReturnCode ret = OH_NNExecutor_GetOutputShape(nullptr, outputIndex, &outputDimensions, &outputDimensionCount);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputShape0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0200
 * @tc.desc   outputindex不存在，等于输出个数，返回失败
 */
int TestExecutorGetOutputShape0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputShape0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    int32_t *outputDimensions = nullptr;
    uint32_t outputDimensionCount = 0;
    uint32_t addOutputIndex = 4;

    OH_NN_ReturnCode ret =
        OH_NNExecutor_GetOutputShape(executor, addOutputIndex, &outputDimensions, &outputDimensionCount);
    OH_NNExecutor_Destroy(&executor);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputShape0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0300
 * @tc.desc   定长模型推理成功，获取输出维度成功
 */
int TestExecutorGetOutputShape0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputShape0300 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    size_t inputCount = 0;
    size_t outputCount = 0;
    GetExecutorInputOutputTensor(executor, inputTensors, inputCount, outputTensors, outputCount);

    if (OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), outputCount) !=
        OH_NN_SUCCESS) {
        OH_NNExecutor_Destroy(&executor);
        DestroyTensor(inputTensors, outputTensors);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_RunSync failed");
        return -1;
    }

    int32_t *outputDimensions = nullptr;
    uint32_t outputDimensionCount = 0;
    uint32_t addOutputIndex = 0;

    OH_NN_ReturnCode ret =
        OH_NNExecutor_GetOutputShape(executor, addOutputIndex, &outputDimensions, &outputDimensionCount);
    OH_NNExecutor_Destroy(&executor);
    DestroyTensor(inputTensors, outputTensors);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_SUCCESS but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputShape0300 PASSED");
    return 0;
}


/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorGetInputCount0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputCount0100 START");

    size_t inputCount = 0;
    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputCount(nullptr, &inputCount);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputCount0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0200
 * @tc.desc   inputCount为空，返回失败
 */
int TestExecutorGetInputCount0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputCount0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputCount(executor, nullptr);
    OH_NNExecutor_Destroy(&executor);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputCount0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0300
 * @tc.desc   获取输入个数，返回成功
 */
int TestExecutorGetInputCount0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputCount0300 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    size_t inputCount = 0;
    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputCount(executor, &inputCount);
    OH_NNExecutor_Destroy(&executor);
    if (ret != OH_NN_SUCCESS || inputCount == 0) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_SUCCESS and inputCount > 0");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputCount0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorGetOutputCount0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputCount0100 START");

    size_t outputCount = 0;
    OH_NN_ReturnCode ret = OH_NNExecutor_GetOutputCount(nullptr, &outputCount);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputCount0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0200
 * @tc.desc   outputCount为空，返回失败
 */
int TestExecutorGetOutputCount0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputCount0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    OH_NN_ReturnCode ret = OH_NNExecutor_GetOutputCount(executor, nullptr);
    OH_NNExecutor_Destroy(&executor);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputCount0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0300
 * @tc.desc   获取输出个数，返回成功
 */
int TestExecutorGetOutputCount0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputCount0300 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    size_t outputCount = 0;
    OH_NN_ReturnCode ret = OH_NNExecutor_GetOutputCount(executor, &outputCount);
    OH_NNExecutor_Destroy(&executor);
    if (ret != OH_NN_SUCCESS || outputCount == 0) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_SUCCESS and outputCount > 0");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetOutputCount0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorCreateInputTensorDesc0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateInputTensorDesc0100 START");

    size_t index = 0;
    NN_TensorDesc *tensorDesc = OH_NNExecutor_CreateInputTensorDesc(nullptr, index);
    if (tensorDesc != nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected nullptr but got valid tensorDesc");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateInputTensorDesc0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0200
 * @tc.desc   遍历创建输入tensorDesc，index小于输入个数，成功
 */
int TestExecutorCreateInputTensorDesc0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateInputTensorDesc0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    size_t inputCount = 0;
    if (OH_NNExecutor_GetInputCount(executor, &inputCount) != OH_NN_SUCCESS) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetInputCount failed");
        return -1;
    }

    NN_TensorDesc *tensorDesc = nullptr;
    for (size_t i = 0; i < inputCount; i++) {
        tensorDesc = OH_NNExecutor_CreateInputTensorDesc(executor, i);
        if (tensorDesc == nullptr) {
            OH_NNExecutor_Destroy(&executor);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_CreateInputTensorDesc failed for index %{public}zu", i);
            return -1;
        }
        OH_NNTensorDesc_Destroy(&tensorDesc);
    }

    OH_NNExecutor_Destroy(&executor);
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateInputTensorDesc0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0300
 * @tc.desc   index等于输入个数，返回失败
 */
int TestExecutorCreateInputTensorDesc0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateInputTensorDesc0300 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    size_t inputCount = 0;
    if (OH_NNExecutor_GetInputCount(executor, &inputCount) != OH_NN_SUCCESS) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetInputCount failed");
        return -1;
    }

    NN_TensorDesc *tensorDesc = OH_NNExecutor_CreateInputTensorDesc(executor, inputCount);
    OH_NNExecutor_Destroy(&executor);

    if (tensorDesc != nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected nullptr but got valid tensorDesc");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateInputTensorDesc0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorCreateOutputTensorDesc0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateOutputTensorDesc0100 START");

    size_t index = 0;
    NN_TensorDesc *tensorDesc = OH_NNExecutor_CreateOutputTensorDesc(nullptr, index);
    if (tensorDesc != nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected nullptr but got valid tensorDesc");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateOutputTensorDesc0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0200
 * @tc.desc   遍历创建输出tensorDesc，index小于输出个数，成功
 */
int TestExecutorCreateOutputTensorDesc0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateOutputTensorDesc0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    size_t outputCount = 0;
    if (OH_NNExecutor_GetOutputCount(executor, &outputCount) != OH_NN_SUCCESS) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetOutputCount failed");
        return -1;
    }

    NN_TensorDesc *tensorDesc = nullptr;
    for (size_t i = 0; i < outputCount; i++) {
        tensorDesc = OH_NNExecutor_CreateOutputTensorDesc(executor, i);
        if (tensorDesc == nullptr) {
            OH_NNExecutor_Destroy(&executor);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_CreateOutputTensorDesc failed for index %{public}zu",
                         i);
            return -1;
        }
        OH_NNTensorDesc_Destroy(&tensorDesc);
    }

    OH_NNExecutor_Destroy(&executor);
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateOutputTensorDesc0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0300
 * @tc.desc   index等于输出个数，返回失败
 */
int TestExecutorCreateOutputTensorDesc0300()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateOutputTensorDesc0300 START");

    OH_NNExecutor *executor = nullptr;
    CreateExecutor(&executor);

    size_t outputCount = 0;
    if (OH_NNExecutor_GetOutputCount(executor, &outputCount) != OH_NN_SUCCESS) {
        OH_NNExecutor_Destroy(&executor);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetOutputCount failed");
        return -1;
    }

    NN_TensorDesc *tensorDesc = OH_NNExecutor_CreateOutputTensorDesc(executor, outputCount);
    OH_NNExecutor_Destroy(&executor);
    if (tensorDesc != nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected nullptr but got valid tensorDesc");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorCreateOutputTensorDesc0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0100
 * @tc.desc   executor为空，返回失败
 */
int TestExecutorGetInputDimRange0100()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0100 START");

    OH_NNExecutor *executor = nullptr;
    size_t index = 0;
    size_t *minInputDims = nullptr;
    size_t *maxInputDims = nullptr;
    size_t shapeLength = 0;

    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputDimRange(executor, index, &minInputDims, &maxInputDims, &shapeLength);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0200
 * @tc.desc   获取动态输入范围，设置index等于输入个数，超出限制，获取失败
 */
int TestExecutorGetInputDimRange0200()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0200 START");

    OH_NNExecutor *executor = nullptr;
    CreateDynamicExecutor(&executor);

    size_t index = 6;
    size_t *minInputDims = nullptr;
    size_t *maxInputDims = nullptr;
    size_t shapeLength = 0;

    OH_NN_ReturnCode ret = OH_NNExecutor_GetInputDimRange(executor, index, &minInputDims, &maxInputDims, &shapeLength);
    OH_NNExecutor_Destroy(&executor);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0200 PASSED");
    return 0;
}


static int SetInputDimsBelowMin(OH_NNExecutor *executor, std::vector<NN_TensorDesc *> &inputTensorDescs,
                                std::vector<NN_TensorDesc *> &outputTensorDescs)
{
    size_t *minInputDims = nullptr;
    size_t *maxInputDims = nullptr;
    size_t shapeLength = 0;

    for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
        if (OH_NNExecutor_GetInputDimRange(executor, i, &minInputDims, &maxInputDims, &shapeLength) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetInputDimRange failed");
            return -1;
        }

        std::vector<int32_t> minInputDimsT;
        for (size_t j = 0; j < shapeLength; ++j) {
            minInputDimsT.emplace_back(static_cast<int32_t>(minInputDims[j] - 1));
        }

        if (OH_NNTensorDesc_SetShape(inputTensorDescs[i], minInputDimsT.data(), shapeLength) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNTensorDesc_SetShape failed");
            return -1;
        }
    }
    return 0;
}

static int SetOutputShape(OH_NNExecutor *executor, std::vector<NN_TensorDesc *> &outputTensorDescs,
                          std::vector<NN_TensorDesc *> &inputTensorDescs)
{
    std::vector<int32_t> outputShape{1, 2, 2, 1};
    for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
        if (OH_NNTensorDesc_SetShape(outputTensorDescs[i], outputShape.data(), outputShape.size()) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNTensorDesc_SetShape failed");
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0500
 * @tc.desc   变长模型推理，获取输入维度，获取成功，设置输入维度小于最小临界值，推理失败
 */
int TestExecutorGetInputDimRange0500()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0500 START");

    OH_NNExecutor *executor = nullptr;
    CreateDynamicExecutor(&executor);

    std::vector<NN_TensorDesc *> inputTensorDescs;
    std::vector<NN_TensorDesc *> outputTensorDescs;
    size_t inputCount = 0;
    size_t outputCount = 0;
    GetExecutorInputOutputTensorDesc(executor, inputTensorDescs, inputCount, outputTensorDescs, outputCount);

    if (SetInputDimsBelowMin(executor, inputTensorDescs, outputTensorDescs) != 0) {
        return -1;
    }

    if (SetOutputShape(executor, outputTensorDescs, inputTensorDescs) != 0) {
        return -1;
    }

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    GetExecutorInputOutputTensorByDesc(executor, inputTensors, inputTensorDescs, outputTensors, outputTensorDescs);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), outputCount);

    OH_NNExecutor_Destroy(&executor);
    DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
    DestroyTensor(inputTensors, outputTensors);

    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0500 PASSED");
    return 0;
}

static int SetInputDimsAboveMax(OH_NNExecutor *executor, std::vector<NN_TensorDesc *> &inputTensorDescs,
                                std::vector<NN_TensorDesc *> &outputTensorDescs)
{
    size_t *minInputDims = nullptr;
    size_t *maxInputDims = nullptr;
    size_t shapeLength = 0;
    for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
        if (OH_NNExecutor_GetInputDimRange(executor, i, &minInputDims, &maxInputDims, &shapeLength) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetInputDimRange failed");
            return -1;
        }
        std::vector<int32_t> maxInputDimsT;
        for (size_t j = 0; j < shapeLength; ++j) {
            maxInputDimsT.emplace_back(static_cast<int32_t>(maxInputDims[j] + 1));
        }
        if (OH_NNTensorDesc_SetShape(inputTensorDescs[i], maxInputDimsT.data(), shapeLength) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNTensorDesc_SetShape failed");
            return -1;
        }
    }
    return 0;
}

static int SetOutputShapeForTest0600(std::vector<NN_TensorDesc *> &outputTensorDescs, OH_NNExecutor *executor,
                                     std::vector<NN_TensorDesc *> &inputTensorDescs)
{
    std::vector<int32_t> outputShape{1, 2, 2, 1};
    for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
        if (OH_NNTensorDesc_SetShape(outputTensorDescs[i], outputShape.data(), outputShape.size()) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNTensorDesc_SetShape failed");
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0600
 * @tc.desc   变长模型推理，依次获取输入维度，获取成功，设置输入维度大于最大临界值，推理失败
 */
int TestExecutorGetInputDimRange0600()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0600 START");

    OH_NNExecutor *executor = nullptr;
    CreateDynamicExecutor(&executor);

    std::vector<NN_TensorDesc *> inputTensorDescs;
    std::vector<NN_TensorDesc *> outputTensorDescs;
    size_t inputCount = 0;
    size_t outputCount = 0;
    GetExecutorInputOutputTensorDesc(executor, inputTensorDescs, inputCount, outputTensorDescs, outputCount);

    if (SetInputDimsAboveMax(executor, inputTensorDescs, outputTensorDescs) != 0) {
        return -1;
    }

    if (SetOutputShapeForTest0600(outputTensorDescs, executor, inputTensorDescs) != 0) {
        return -1;
    }

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    GetExecutorInputOutputTensorByDesc(executor, inputTensors, inputTensorDescs, outputTensors, outputTensorDescs);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount, outputTensors.data(), outputCount);

    OH_NNExecutor_Destroy(&executor);
    DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
    DestroyTensor(inputTensors, outputTensors);

    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0600 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0700
 * @tc.desc   变长模型推理，依次获取输入维度，获取成功，设置输入shape个数超过shapeNum,推理失败
 */
static int SetInputDimsToMax(OH_NNExecutor *executor, std::vector<NN_TensorDesc *> &inputTensorDescs,
                             std::vector<NN_TensorDesc *> &outputTensorDescs)
{
    size_t *minInputDims = nullptr;
    size_t *maxInputDims = nullptr;
    size_t shapeLength = 0;
    for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
        if (OH_NNExecutor_GetInputDimRange(executor, i, &minInputDims, &maxInputDims, &shapeLength) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNExecutor_GetInputDimRange failed");
            return -1;
        }
        std::vector<int32_t> maxInputDimsT;
        for (size_t j = 0; j < shapeLength; ++j) {
            maxInputDimsT.emplace_back(static_cast<int32_t>(maxInputDims[j]));
        }
        if (OH_NNTensorDesc_SetShape(inputTensorDescs[i], maxInputDimsT.data(), shapeLength) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNTensorDesc_SetShape failed");
            return -1;
        }
    }
    return 0;
}

static int SetOutputShapeForAll(std::vector<NN_TensorDesc *> &outputTensorDescs, OH_NNExecutor *executor,
                                std::vector<NN_TensorDesc *> &inputTensorDescs)
{
    std::vector<int32_t> outputShape{1, 2, 2, 1};
    for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
        if (OH_NNTensorDesc_SetShape(outputTensorDescs[i], outputShape.data(), outputShape.size()) != OH_NN_SUCCESS) {
            OH_NNExecutor_Destroy(&executor);
            DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
            OH_LOG_ERROR(LOG_APP, "[ExecutorTest] OH_NNTensorDesc_SetShape failed");
            return -1;
        }
    }
    return 0;
}

int TestExecutorGetInputDimRange0700()
{
    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0700 START");

    OH_NNExecutor *executor = nullptr;
    CreateDynamicExecutor(&executor);

    std::vector<NN_TensorDesc *> inputTensorDescs;
    std::vector<NN_TensorDesc *> outputTensorDescs;
    size_t inputCount = 0;
    size_t outputCount = 0;
    GetExecutorInputOutputTensorDesc(executor, inputTensorDescs, inputCount, outputTensorDescs, outputCount);

    if (SetInputDimsToMax(executor, inputTensorDescs, outputTensorDescs) != 0) {
        return -1;
    }

    if (SetOutputShapeForAll(outputTensorDescs, executor, inputTensorDescs) != 0) {
        return -1;
    }

    std::vector<NN_Tensor *> inputTensors;
    std::vector<NN_Tensor *> outputTensors;
    GetExecutorInputOutputTensorByDesc(executor, inputTensors, inputTensorDescs, outputTensors, outputTensorDescs);

    OH_NN_ReturnCode ret =
        OH_NNExecutor_RunSync(executor, inputTensors.data(), inputCount + 1, outputTensors.data(), outputCount);

    OH_NNExecutor_Destroy(&executor);
    DestroyTensorDesc(inputTensorDescs, outputTensorDescs);
    DestroyTensor(inputTensors, outputTensors);

    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ExecutorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ExecutorTest] TestExecutorGetInputDimRange0700 PASSED");
    return 0;
}


// 导出所有测试函数
struct ExecutorTestCase {
    const char *name;
    int (*func)();
};

static std::vector<ExecutorTestCase> g_executorTests = {
    {"TestExecutorConstruct0100", TestExecutorConstruct0100},
    {"TestExecutorDestroy0100", TestExecutorDestroy0100},
    {"TestExecutorDestroy0200", TestExecutorDestroy0200},
    {"TestExecutorSetOnRunDone0100", TestExecutorSetOnRunDone0100},
    {"TestExecutorSetOnRunDone0200", TestExecutorSetOnRunDone0200},
    {"TestExecutorSetOnServiceDied0100", TestExecutorSetOnServiceDied0100},
    {"TestExecutorSetOnServiceDied0200", TestExecutorSetOnServiceDied0200},
    {"TestExecutorRunSync0100", TestExecutorRunSync0100},
    {"TestExecutorRunSync0200", TestExecutorRunSync0200},
    {"TestExecutorRunSync0300", TestExecutorRunSync0300},
    {"TestExecutorRunSync0400", TestExecutorRunSync0400},
    {"TestExecutorRunSync0500", TestExecutorRunSync0500},
    {"TestExecutorRunSync0600", TestExecutorRunSync0600},
    {"TestExecutorRunSync0700", TestExecutorRunSync0700},
    {"TestExecutorRunSync0800", TestExecutorRunSync0800},
    {"TestExecutorRunSync0900", TestExecutorRunSync0900},
    {"TestExecutorRunAsync0100", TestExecutorRunAsync0100},
    {"TestExecutorRunAsync0200", TestExecutorRunAsync0200},
    {"TestExecutorRunAsync0300", TestExecutorRunAsync0300},
    {"TestExecutorRunAsync0400", TestExecutorRunAsync0400},
    {"TestExecutorRunAsync0500", TestExecutorRunAsync0500},
    {"TestExecutorRunAsync0600", TestExecutorRunAsync0600},
    {"TestExecutorGetOutputShape0100", TestExecutorGetOutputShape0100},
    {"TestExecutorGetOutputShape0200", TestExecutorGetOutputShape0200},
    {"TestExecutorGetOutputShape0300", TestExecutorGetOutputShape0300},
    {"TestExecutorGetInputCount0100", TestExecutorGetInputCount0100},
    {"TestExecutorGetInputCount0200", TestExecutorGetInputCount0200},
    {"TestExecutorGetInputCount0300", TestExecutorGetInputCount0300},
    {"TestExecutorGetOutputCount0100", TestExecutorGetOutputCount0100},
    {"TestExecutorGetOutputCount0200", TestExecutorGetOutputCount0200},
    {"TestExecutorGetOutputCount0300", TestExecutorGetOutputCount0300},
    {"TestExecutorCreateInputTensorDesc0100", TestExecutorCreateInputTensorDesc0100},
    {"TestExecutorCreateInputTensorDesc0200", TestExecutorCreateInputTensorDesc0200},
    {"TestExecutorCreateInputTensorDesc0300", TestExecutorCreateInputTensorDesc0300},
    {"TestExecutorCreateOutputTensorDesc0100", TestExecutorCreateOutputTensorDesc0100},
    {"TestExecutorCreateOutputTensorDesc0200", TestExecutorCreateOutputTensorDesc0200},
    {"TestExecutorCreateOutputTensorDesc0300", TestExecutorCreateOutputTensorDesc0300},
    {"TestExecutorGetInputDimRange0100", TestExecutorGetInputDimRange0100},
    {"TestExecutorGetInputDimRange0200", TestExecutorGetInputDimRange0200},
    {"TestExecutorGetInputDimRange0500", TestExecutorGetInputDimRange0500},
    {"TestExecutorGetInputDimRange0600", TestExecutorGetInputDimRange0600},
    {"TestExecutorGetInputDimRange0700", TestExecutorGetInputDimRange0700},
};

// 运行所有Executor测试
int RunAllExecutorTests()
{
    int passCount = 0;
    int failCount = 0;

    OH_LOG_INFO(LOG_APP, "========== Running Executor Tests ==========");
    OH_LOG_INFO(LOG_APP, "Total test cases: %{public}zu", g_executorTests.size());

    for (const auto &testCase : g_executorTests) {
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

    OH_LOG_INFO(LOG_APP, "========== Executor Tests Summary ==========");
    OH_LOG_INFO(LOG_APP, "Passed: %{public}d, Failed: %{public}d", passCount, failCount);

    return (failCount == 0) ? 0 : -1;
}

} // namespace NeuralNetworkCore
} // namespace OHOS
