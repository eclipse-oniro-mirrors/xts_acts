/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ACTSMINDSPORECTEST_ACTS_MINDSPORE_COMMON_TEST_H
#define ACTSMINDSPORECTEST_ACTS_MINDSPORE_COMMON_TEST_H

#include <mindspore/context.h>
#include <mindspore/model.h>
#include <mindspore/tensor.h>
#include <string>
#include <vector>

namespace Acts {
namespace MindSpore {
constexpr int SHAPE_INDEX_0 = 0;
constexpr int SHAPE_INDEX_1 = 1;
constexpr int SHAPE_INDEX_2 = 2;
constexpr int SHAPE_INDEX_3 = 3;
constexpr int FORMAT_PRINT_LIMIT = 20;

// Common test constants to replace magic numbers in test cases.
constexpr int EXPECT_SUCCESS = 0;
constexpr int EXPECT_FAILURE = 1;

// Thread configuration related constants.
constexpr int THREAD_NUM_ZERO = 0;
constexpr int THREAD_NUM_SINGLE = 1;
constexpr int THREAD_NUM_DOUBLE = 2;
constexpr int THREAD_NUM_FOUR = 4;
constexpr int THREAD_NUM_TEN = 10;
constexpr int INVALID_THREAD_NUM = -100;

// Thread affinity mode constants.
constexpr int THREAD_AFFINITY_NONE = 0;
constexpr int THREAD_AFFINITY_BIG_CORE = 1;
constexpr int THREAD_AFFINITY_MIDDLE_CORE = 2;

// Generic loop count constants.
constexpr int LOOP_COUNT_TEN = 10;

// String comparison result constants.
constexpr int STRCMP_EQUAL = 0;

bool PrintBeforeCallback(const OH_AI_TensorHandleArray inputs,
                         const OH_AI_TensorHandleArray outputs,
                         const OH_AI_CallBackParam kernel_Info);
bool PrintAfterCallback(const OH_AI_TensorHandleArray inputs,
                        const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info);

void AddContextDeviceCPU(OH_AI_ContextHandle context);
bool IsNNRTAvailable();
bool IsNPU();
void AddContextDeviceNNRT(OH_AI_ContextHandle context);
void AddContextDeviceNNRTWithCache(OH_AI_ContextHandle context, const char* cachePath, const char* cacheVersion);
void AddContextDeviceNNRTByType(OH_AI_ContextHandle context);
void AddContextDeviceNNRTByName(OH_AI_ContextHandle context);

void FillInputsData(OH_AI_TensorHandleArray inputs, std::string modelName, bool isTranspose);
void CompareResult(OH_AI_TensorHandleArray outputs,
                   std::string modelName,
                   float atol = 0.01,
                   float rtol = 0.01,
                   bool isquant = false);

struct ModelPredictOptions {
    std::string modelName;
    OH_AI_ShapeInfo shapeInfos;
    bool buildByGraph;
    bool isTranspose;
    bool isCallback;
    ModelPredictOptions(const std::string& modelNameP,
                        const OH_AI_ShapeInfo& shapeInfosP,
                        bool buildByGraphP,
                        bool isTransposeP,
                        bool isCallbackP)
        : modelName(modelNameP),
          shapeInfos(shapeInfosP),
          buildByGraph(buildByGraphP),
          isTranspose(isTransposeP),
          isCallback(isCallbackP)
    {
    }
};

void ModelPredict(OH_AI_ModelHandle mode, OH_AI_ContextHandle context, ModelPredictOptions options);

struct ModelTrainOptions {
    std::string modelName;
    OH_AI_ShapeInfo shapeInfos;
    bool buildByGraph;
    bool isTranspose;
    bool isCallback;

    explicit ModelTrainOptions(const std::string& name)
        : modelName(name), shapeInfos{}, buildByGraph(false), isTranspose(false), isCallback(false)
    {
    }
};

void ModelTrain(OH_AI_ModelHandle model, OH_AI_ContextHandle context, ModelTrainOptions& options);

char** TransStrVectorToCharArrays(const std::vector<std::string>& s);
std::vector<std::string> TransCharArraysToStrVector(char** c, const size_t& num);

void PrintTrainLossName(OH_AI_TrainCfgHandle trainCfg);

void PredictCPU();

void PredictNPU();

} // namespace MindSpore
} // namespace Acts

#endif // ACTSMINDSPORECTEST_ACTS_MINDSPORE_COMMON_TEST_H
