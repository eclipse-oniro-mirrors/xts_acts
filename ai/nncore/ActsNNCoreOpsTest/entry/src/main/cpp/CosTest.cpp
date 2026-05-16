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

namespace Acts {
namespace NnCoreOps {

struct CosModel1 {
    const std::vector<int32_t> tensor_shape = { 3 };
    int64_t inputValue[3] = { 0, 1, 2 };
    float outputValue[3] = { 0 };

    OHNNOperandTest input = { OH_NN_INT64, OH_NN_TENSOR, tensor_shape, inputValue, 3 * sizeof(int64_t) };
    OHNNOperandTest output = { OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 3 * sizeof(float) };
    OHNNGraphArgs graphArgs = { .operationType = OH_NN_OPS_COS,
                                .operands = { input, output },
                                .paramIndices = {},
                                .inputIndices = { 0 },
                                .outputIndices = { 1 } };
};

struct CosModel2 {
    const std::vector<int32_t> tensor_shape = { 2 };
    bool inputValue[2] = { false, true };
    float outputValue[2] = { 0 };

    OHNNOperandTest input = { OH_NN_BOOL, OH_NN_TENSOR, tensor_shape, inputValue, 2 * sizeof(bool) };
    OHNNOperandTest output = { OH_NN_FLOAT32, OH_NN_TENSOR, tensor_shape, outputValue, 2 * sizeof(float) };
    OHNNGraphArgs graphArgs = { .operationType = OH_NN_OPS_COS,
                                .operands = { input, output },
                                .paramIndices = {},
                                .inputIndices = { 0 },
                                .outputIndices = { 1 } };
};

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Build_03
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Build_03
 * @tc.desc   CosModel1模型输入Tensor+1进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosBuild03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel2 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
    graphArgs.operands = { cosModel.input, cosModel.input, cosModel.output };
    graphArgs.inputIndices = { 0, 1 };
    graphArgs.outputIndices = { 2 };
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Build_04
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Build_04
 * @tc.desc   CosModel1模型输出Tensor+1进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosBuild04()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel2 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
    graphArgs.operands = { cosModel.input, cosModel.output, cosModel.output };
    graphArgs.inputIndices = { 0 };
    graphArgs.outputIndices = { 1, 2 };
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Build_05
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Build_05
 * @tc.desc   CosModel1模型传入非法参数进行build测试
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosBuild05()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel2 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;

    int8_t activationValue = OH_NN_FUSED_NONE;
    OHNNOperandTest activation = { OH_NN_INT8, OH_NN_ADD_ACTIVATIONTYPE, {}, &activationValue, sizeof(int8_t) };
    graphArgs.operands = { cosModel.input, cosModel.output, activation };
    graphArgs.paramIndices = { 2 };
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_Finish_01
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_Finish_01
 * @tc.desc   模型构图，未添加操作数
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelFinish01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    OHNNGraphArgs graphArgs;
    EXPECT_EQ(OH_NN_INVALID_PARAMETER, SingleModelBuildEndStep(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_Finish_02
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_Finish_02
 * @tc.desc   模型构图，未设置输入输出
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelFinish02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
    graphArgs.specifyIO = false;
    EXPECT_EQ(OH_NN_OPERATION_FORBIDDEN, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_Finish_03
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_Finish_03
 * @tc.desc   模型构图，设置输入输出，构图成功
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SUBAINNRtFuncNorthCosModelFinish03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SetOperandValue_01
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SetOperandValue_01
 * @tc.desc   设置操作数值，操作数不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSetOperandValue01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;

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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SetOperandValue_02
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SetOperandValue_02
 * @tc.desc   设置操作数值，buufer为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSetOperandValue02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;

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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SetOperandValue_03
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SetOperandValue_03
 * @tc.desc   设置操作数值，length为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSetOperandValue03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;

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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_01
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_01
 * @tc.desc   设置输入输出，inputIndices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_02
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_02
 * @tc.desc   设置输入输出，inputindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_03
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_03
 * @tc.desc   设置输入输出，inputindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_04
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_04
 * @tc.desc   设置输入输出，inputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs04()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_05
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_05
 * @tc.desc   设置输入输出，outputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs05()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_06
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_06
 * @tc.desc   设置输入输出，outputindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs06()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_07
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_07
 * @tc.desc   设置输入输出，outputindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs07()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_08
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_SpecifyInputsAndOutputs_08
 * @tc.desc   设置输入输出，outputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelSpecifyInputsAndOutputs08()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_01
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_01
 * @tc.desc   添加算子，paramindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation01()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_02
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_02
 * @tc.desc   添加算子，paramindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation02()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    paramIndices.data = nullptr;
    EXPECT_EQ(OH_NN_SUCCESS,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_03
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_03
 * @tc.desc   添加算子，paramindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation03()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_04
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_04
 * @tc.desc   添加算子，paramindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation04()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
    graphArgs.addOperation = false;
    graphArgs.specifyIO = false;
    graphArgs.build = false;
    EXPECT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model, graphArgs));

    auto paramIndices = TransformUInt32Array(graphArgs.paramIndices);
    auto inputIndices = TransformUInt32Array(graphArgs.inputIndices);
    auto outputIndices = TransformUInt32Array(graphArgs.outputIndices);
    paramIndices.size = 0;
    EXPECT_EQ(OH_NN_SUCCESS,
              OH_NNModel_AddOperation(model, graphArgs.operationType, &paramIndices, &inputIndices, &outputIndices));

    Free(model, nullptr, nullptr);
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_05
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_05
 * @tc.desc   添加算子，inputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation05()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_06
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_06
 * @tc.desc   添加算子，inputindices中data为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation06()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_07
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_07
 * @tc.desc   添加算子，inputindices中data对应序号不存在
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation07()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_08
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_08
 * @tc.desc   添加算子，inputindices中size为0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation08()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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
 * @tc.name   SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_09
 * @tc.number SUB_AI_NNRt_Func_North_Cos_Model_AddOperation_09
 * @tc.desc   添加算子，outputindices为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SUBAINNRtFuncNorthCosModelAddOperation09()
{
    OH_NNModel* model = OH_NNModel_Construct();
    EXPECT_NE(nullptr, model);

    CosModel1 cosModel;
    OHNNGraphArgs graphArgs = cosModel.graphArgs;
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