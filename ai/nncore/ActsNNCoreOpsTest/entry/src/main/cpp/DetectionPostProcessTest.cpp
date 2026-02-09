/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <iostream>
#include <string>
#include <vector>
#include "OhosCommonTest.h"
#include "nncore_utils.h"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace {

struct DetectionPostProcessModel1 {
    const std::vector<int32_t> bbox_shape = { 1, 16 };
    const std::vector<int32_t> scores_shape = { 1, 4 };
    const std::vector<int32_t> anchors_shape = { 1, 2, 8 };
    const std::vector<int32_t> output_shape = { 2, 8 };

    int64_t inputSizeValue[1] = { 45 };
    std::vector<float> scaleValue = { 10, 10, 5, 5 };
    float nmsIoUThresholdValue[1] = { 0.5 };
    float nmsScoreThresholdValue[1] = { 0.4 };
    int64_t maxDetectionsValue[1] = { 5 };
    int64_t detectionsPerClassValue[1] = { 2 };
    int64_t maxClassesPerDetectionValue[1] = { 1 };
    int64_t numClassesValue[1] = { 5 };
    bool useRegularNmsValue[1] = { false };
    bool outQuantizedValue[1] = { false };

    float bboxValue[1][16] = { 1 };
    float scoresValue[1][4] = { 1 };
    float anchorsValue[1][2][8] = { 1 };

    float bboxesValue[1][16] = { 0 };
    float classesValue[1][4] = { 0 };
    float confidencesValue[1][16] = { 0 };
    float numDetectionsValue[1][16] = { 0 };

    OHNNOperandTest bbox = { OH_NN_FLOAT32, OH_NN_TENSOR, bbox_shape, bboxValue, 16 * sizeof(float) };
    OHNNOperandTest scores = { OH_NN_FLOAT32, OH_NN_TENSOR, scores_shape, scoresValue, 4 * sizeof(float) };
    OHNNOperandTest anchors = { OH_NN_FLOAT32, OH_NN_TENSOR, anchors_shape, anchorsValue, 16 * sizeof(float) };

    OHNNOperandTest bboxes = { OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, bboxesValue, 16 * sizeof(float) };
    OHNNOperandTest classes = { OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, classesValue, 16 * sizeof(float) };
    OHNNOperandTest confidences = { OH_NN_FLOAT32, OH_NN_TENSOR, output_shape, confidencesValue, 16 * sizeof(float) };
    OHNNOperandTest numDetections = { OH_NN_FLOAT32,
                                      OH_NN_TENSOR,
                                      output_shape,
                                      numDetectionsValue,
                                      16 * sizeof(float) };

    OHNNOperandTest inputSize = { OH_NN_INT64,
                                  OH_NN_DETECTION_POST_PROCESS_INPUT_SIZE,
                                  { 1 },
                                  inputSizeValue,
                                  sizeof(int64_t) };
    OHNNOperandTest scale = { OH_NN_FLOAT32,
                              OH_NN_DETECTION_POST_PROCESS_SCALE,
                              { 4 },
                              &scaleValue,
                              4 * sizeof(float) };
    OHNNOperandTest nmsIoUThreshold = { OH_NN_FLOAT32,
                                        OH_NN_DETECTION_POST_PROCESS_NMS_IOU_THRESHOLD,
                                        { 1 },
                                        nmsIoUThresholdValue,
                                        sizeof(float) };
    OHNNOperandTest nmsScoreThreshold = { OH_NN_FLOAT32,
                                          OH_NN_DETECTION_POST_PROCESS_NMS_SCORE_THRESHOLD,
                                          { 1 },
                                          nmsScoreThresholdValue,
                                          sizeof(float) };
    OHNNOperandTest maxDetections = { OH_NN_INT64,
                                      OH_NN_DETECTION_POST_PROCESS_MAX_DETECTIONS,
                                      { 1 },
                                      maxDetectionsValue,
                                      sizeof(int64_t) };
    OHNNOperandTest detectionsPerClass = { OH_NN_INT64,
                                           OH_NN_DETECTION_POST_PROCESS_DETECTIONS_PER_CLASS,
                                           { 1 },
                                           detectionsPerClassValue,
                                           sizeof(int64_t) };
    OHNNOperandTest maxClassesPerDetection = { OH_NN_INT64,
                                               OH_NN_DETECTION_POST_PROCESS_MAX_CLASSES_PER_DETECTION,
                                               { 1 },
                                               maxClassesPerDetectionValue,
                                               sizeof(int64_t) };
    OHNNOperandTest numClasses = { OH_NN_INT64,
                                   OH_NN_DETECTION_POST_PROCESS_NUM_CLASSES,
                                   { 1 },
                                   numClassesValue,
                                   sizeof(int64_t) };
    OHNNOperandTest useRegularNms = { OH_NN_BOOL,
                                      OH_NN_DETECTION_POST_PROCESS_USE_REGULAR_NMS,
                                      { 1 },
                                      useRegularNmsValue,
                                      sizeof(bool) };
    OHNNOperandTest outQuantized = { OH_NN_BOOL,
                                     OH_NN_DETECTION_POST_PROCESS_OUT_QUANTIZED,
                                     { 1 },
                                     outQuantizedValue,
                                     sizeof(bool) };
    OHNNGraphArgs graphArgs = { .operationType = OH_NN_OPS_DETECTION_POST_PROCESS,
                                .operands = { bbox,
                                              scores,
                                              anchors,
                                              bboxes,
                                              classes,
                                              confidences,
                                              numDetections,
                                              inputSize,
                                              scale,
                                              nmsIoUThreshold,
                                              nmsScoreThreshold,
                                              maxDetections,
                                              detectionsPerClass,
                                              maxClassesPerDetection,
                                              numClasses,
                                              useRegularNms,
                                              outQuantized },
                                .paramIndices = { 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 },
                                .inputIndices = { 0, 1, 2 },
                                .outputIndices = { 3, 4, 5, 6 } };
};
} // namespace

namespace Acts {
namespace NnCoreOps {

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Build_02
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Build_02
 * @tc.desc   DetectionPostProcessModel1模型输入Tensor+1进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessBuild02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.operands = { dppModel.bbox,
                           dppModel.bbox,
                           dppModel.scores,
                           dppModel.anchors,
                           dppModel.bboxes,
                           dppModel.classes,
                           dppModel.confidences,
                           dppModel.numDetections,
                           dppModel.inputSize,
                           dppModel.scale,
                           dppModel.nmsIoUThreshold,
                           dppModel.nmsScoreThreshold,
                           dppModel.maxDetections,
                           dppModel.detectionsPerClass,
                           dppModel.maxClassesPerDetection,
                           dppModel.numClasses,
                           dppModel.useRegularNms,
                           dppModel.outQuantized };
    graphArgs.inputIndices = { 0, 1, 2, 3 };
    graphArgs.outputIndices = { 4, 5, 6, 7 };
    graphArgs.paramIndices = { 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 };
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Build_03
 * @tc.desc   DetectionPostProcessModel1模型输出Tensor+1进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessBuild03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.operands = { dppModel.bbox,
                           dppModel.scores,
                           dppModel.anchors,
                           dppModel.bboxes,
                           dppModel.bboxes,
                           dppModel.classes,
                           dppModel.confidences,
                           dppModel.numDetections,
                           dppModel.inputSize,
                           dppModel.scale,
                           dppModel.nmsIoUThreshold,
                           dppModel.nmsScoreThreshold,
                           dppModel.maxDetections,
                           dppModel.detectionsPerClass,
                           dppModel.maxClassesPerDetection,
                           dppModel.numClasses,
                           dppModel.useRegularNms,
                           dppModel.outQuantized };
    graphArgs.inputIndices = { 0, 1, 2 };
    graphArgs.outputIndices = { 3, 4, 5, 6, 7 };
    graphArgs.paramIndices = { 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 };
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Build_04
 * @tc.desc   DetectionPostProcessModel1模型传入非法参数进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessBuild04()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;

    int8_t activationValue = OH_NN_FUSED_NONE;
    OHNNOperandTest activation = { OH_NN_INT8, OH_NN_ADD_ACTIVATIONTYPE, {}, &activationValue, sizeof(int8_t) };
    graphArgs.operands = { dppModel.bbox,
                           dppModel.scores,
                           dppModel.anchors,
                           dppModel.bboxes,
                           dppModel.classes,
                           dppModel.confidences,
                           dppModel.numDetections,
                           dppModel.inputSize,
                           dppModel.scale,
                           dppModel.nmsIoUThreshold,
                           dppModel.nmsScoreThreshold,
                           dppModel.maxDetections,
                           dppModel.detectionsPerClass,
                           dppModel.maxClassesPerDetection,
                           dppModel.numClasses,
                           dppModel.useRegularNms,
                           dppModel.outQuantized,
                           activation };
    graphArgs.paramIndices = { 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 };
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_Finish_01
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_Finish_01
 * @tc.desc   模型构图，未添加操作数
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelFinish01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    OHNNGraphArgs graphArgs;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, SingleModelBuildEndStep(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_Finish_02
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_Finish_02
 * @tc.desc   模型构图，未设置输入输出
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelFinish02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    EXPECT_EQ(OH_NN_OPERATION_FORBIDDEN, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_Finish_03
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_Finish_03
 * @tc.desc   模型构图，设置输入输出，构图成功
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelFinish03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SetOperandValue_01
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SetOperandValue_01
 * @tc.desc   设置操作数值，操作数不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSetOperandValue01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;

    NN_TensorDesc* tensorDesc = nullptr;
    std::vector<NN_TensorDesc*> tensorDescVec;

    for (size_t i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest& operandTem = graphArgs.operands[i];
        tensorDesc = createTensorDesc(
            operandTem.shape.data(), (uint32_t)operandTem.shape.size(), operandTem.dataType, operandTem.format);
        tensorDescVec.emplace_back(tensorDesc);
        EXPECT_EQ(OH_NN_SUCCESS, OH_NNModel_AddTensorToModel(model, tensorDesc));
        EXPECT_EQ(OH_NN_SUCCESS, OH_NNModel_SetTensorType(model, i, operandTem.type));

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            EXPECT_EQ(
                OH_NN_INVALID_PARAMETER,
                OH_NNModel_SetTensorData(model, INVALID_TENSOR_INDEX_OFFSET + i, operandTem.data, operandTem.length));
        }
    }

    FreeTensorDescVec(tensorDescVec);
    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SetOperandValue_02
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SetOperandValue_02
 * @tc.desc   设置操作数值，buufer为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSetOperandValue02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;

    NN_TensorDesc* tensorDesc = nullptr;
    std::vector<NN_TensorDesc*> tensorDescVec;

    for (size_t i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest& operandTem = graphArgs.operands[i];
        tensorDesc = createTensorDesc(
            operandTem.shape.data(), (uint32_t)operandTem.shape.size(), operandTem.dataType, operandTem.format);
        tensorDescVec.emplace_back(tensorDesc);
        EXPECT_EQ(OH_NN_SUCCESS, OH_NNModel_AddTensorToModel(model, tensorDesc));
        EXPECT_EQ(OH_NN_SUCCESS, OH_NNModel_SetTensorType(model, i, operandTem.type));

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SetTensorData(model, i, nullptr, operandTem.length));
        }
    }

    FreeTensorDescVec(tensorDescVec);
    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SetOperandValue_03
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SetOperandValue_03
 * @tc.desc   设置操作数值，length为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSetOperandValue03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;

    NN_TensorDesc* tensorDesc = nullptr;
    std::vector<NN_TensorDesc*> tensorDescVec;

    for (size_t i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest& operandTem = graphArgs.operands[i];
        tensorDesc = createTensorDesc(
            operandTem.shape.data(), (uint32_t)operandTem.shape.size(), operandTem.dataType, operandTem.format);
        tensorDescVec.emplace_back(tensorDesc);
        EXPECT_EQ(OH_NN_SUCCESS, OH_NNModel_AddTensorToModel(model, tensorDesc));
        EXPECT_EQ(OH_NN_SUCCESS, OH_NNModel_SetTensorType(model, i, operandTem.type));

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            EXPECT_EQ(OH_NN_INVALID_PARAMETER,
                      OH_NNModel_SetTensorData(model, INVALID_TENSOR_INDEX_OFFSET + i, operandTem.data, 0));
        }
    }

    FreeTensorDescVec(tensorDescVec);
    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_01
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_01
 * @tc.desc   设置输入输出，inputIndices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, nullptr, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_02
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_02
 * @tc.desc   设置输入输出，inputindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    inputIndices.data = nullptr;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_03
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_03
 * @tc.desc   设置输入输出，inputindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    graphArgs.inputIndices = { 100000 };
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_04
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_04
 * @tc.desc   设置输入输出，inputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs04()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    inputIndices.size = 0;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_05
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_05
 * @tc.desc   设置输入输出，outputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs05()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, nullptr));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_06
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_06
 * @tc.desc   设置输入输出，outputindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs06()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    outputIndices.data = nullptr;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_07
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_07
 * @tc.desc   设置输入输出，outputindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs07()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    graphArgs.outputIndices = { 100000 };
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_08
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_SpecifyInputsAndOutputs_08
 * @tc.desc   设置输入输出，outputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs08()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    outputIndices.size = 0;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_01
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_01
 * @tc.desc   添加算子，paramindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, nullptr, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_02
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_02
 * @tc.desc   添加算子，paramindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    paramIndices.data = nullptr;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_03
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_03
 * @tc.desc   添加算子，paramindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    graphArgs.paramIndices = { 100000 };
    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_04
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_04
 * @tc.desc   添加算子，paramindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation04()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    paramIndices.size = 0;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_05
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_05
 * @tc.desc   添加算子，inputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation05()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, nullptr, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_06
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_06
 * @tc.desc   添加算子，inputindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation06()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    inputIndices.data = nullptr;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_07
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_07
 * @tc.desc   添加算子，inputindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation07()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    graphArgs.inputIndices = { 100000 };
    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_08
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_08
 * @tc.desc   添加算子，inputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation08()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    inputIndices.size = 0;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_09
 * @tc.number SUB_AI_NNRt_Func_North_DetectionPostProcess_Model_AddOperation_09
 * @tc.desc   添加算子，outputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation09()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    DetectionPostProcessModel1 dppModel;
    OHNNGraphArgs graphArgs = dppModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    EXPECT_EQ(OH_NN_INVALID_PARAMETER,
              OH_NNModel_AddOperation(nullptr, graphArgs.operationType, &paramIndices, &inputIndices, nullptr));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

} // namespace NnCoreOps
} // namespace Acts