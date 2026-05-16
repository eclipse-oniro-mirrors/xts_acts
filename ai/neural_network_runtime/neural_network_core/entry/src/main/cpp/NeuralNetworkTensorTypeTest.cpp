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

#include "NeuralNetworkCoreTest.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <neural_network_runtime/neural_network_core.h>
#include <neural_network_runtime/neural_network_runtime.h>

namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
}

static const OH_NN_TensorType tensorTypeMap[] = {
    OH_NN_TENSOR,
    OH_NN_ADD_ACTIVATIONTYPE,
    OH_NN_AVG_POOL_KERNEL_SIZE,
    OH_NN_AVG_POOL_STRIDE,
    OH_NN_AVG_POOL_PAD_MODE,
    OH_NN_AVG_POOL_PAD,
    OH_NN_AVG_POOL_ACTIVATION_TYPE,
    OH_NN_BATCH_NORM_EPSILON,
    OH_NN_BATCH_TO_SPACE_ND_BLOCKSIZE,
    OH_NN_BATCH_TO_SPACE_ND_CROPS,
    OH_NN_CONCAT_AXIS,
    OH_NN_CONV2D_STRIDES,
    OH_NN_CONV2D_PAD,
    OH_NN_CONV2D_DILATION,
    OH_NN_CONV2D_PAD_MODE,
    OH_NN_CONV2D_ACTIVATION_TYPE,
    OH_NN_CONV2D_GROUP,
    OH_NN_CONV2D_TRANSPOSE_STRIDES,
    OH_NN_CONV2D_TRANSPOSE_PAD,
    OH_NN_CONV2D_TRANSPOSE_DILATION,
    OH_NN_CONV2D_TRANSPOSE_OUTPUT_PADDINGS,
    OH_NN_CONV2D_TRANSPOSE_PAD_MODE,
    OH_NN_CONV2D_TRANSPOSE_ACTIVATION_TYPE,
    OH_NN_CONV2D_TRANSPOSE_GROUP,
    OH_NN_DEPTHWISE_CONV2D_NATIVE_STRIDES,
    OH_NN_DEPTHWISE_CONV2D_NATIVE_PAD,
    OH_NN_DEPTHWISE_CONV2D_NATIVE_DILATION,
    OH_NN_DEPTHWISE_CONV2D_NATIVE_PAD_MODE,
    OH_NN_DEPTHWISE_CONV2D_NATIVE_ACTIVATION_TYPE,
    OH_NN_DIV_ACTIVATIONTYPE,
    OH_NN_ELTWISE_MODE,
    OH_NN_FULL_CONNECTION_AXIS,
    OH_NN_FULL_CONNECTION_ACTIVATIONTYPE,
    OH_NN_MATMUL_TRANSPOSE_A,
    OH_NN_MATMUL_TRANSPOSE_B,
    OH_NN_MATMUL_ACTIVATION_TYPE,
    OH_NN_MAX_POOL_KERNEL_SIZE,
    OH_NN_MAX_POOL_STRIDE,
    OH_NN_MAX_POOL_PAD_MODE,
    OH_NN_MAX_POOL_PAD,
    OH_NN_MAX_POOL_ACTIVATION_TYPE,
    OH_NN_MUL_ACTIVATION_TYPE,
    OH_NN_ONE_HOT_AXIS,
    OH_NN_PAD_CONSTANT_VALUE,
    OH_NN_SCALE_ACTIVATIONTYPE,
    OH_NN_SCALE_AXIS,
    OH_NN_SOFTMAX_AXIS,
    OH_NN_SPACE_TO_BATCH_ND_BLOCK_SHAPE,
    OH_NN_SPACE_TO_BATCH_ND_PADDINGS,
    OH_NN_SPLIT_AXIS,
    OH_NN_SPLIT_OUTPUT_NUM,
    OH_NN_SPLIT_SIZE_SPLITS,
    OH_NN_SQUEEZE_AXIS,
    OH_NN_STACK_AXIS,
    OH_NN_STRIDED_SLICE_BEGIN_MASK,
    OH_NN_STRIDED_SLICE_END_MASK,
    OH_NN_STRIDED_SLICE_ELLIPSIS_MASK,
    OH_NN_STRIDED_SLICE_NEW_AXIS_MASK,
    OH_NN_STRIDED_SLICE_SHRINK_AXIS_MASK,
    OH_NN_SUB_ACTIVATIONTYPE,
    OH_NN_REDUCE_MEAN_KEEP_DIMS,
    OH_NN_RESIZE_BILINEAR_NEW_HEIGHT,
    OH_NN_RESIZE_BILINEAR_NEW_WIDTH,
    OH_NN_RESIZE_BILINEAR_PRESERVE_ASPECT_RATIO,
    OH_NN_RESIZE_BILINEAR_COORDINATE_TRANSFORM_MODE,
    OH_NN_RESIZE_BILINEAR_EXCLUDE_OUTSIDE,
    OH_NN_LAYER_NORM_BEGIN_NORM_AXIS,
    OH_NN_LAYER_NORM_EPSILON,
    OH_NN_LAYER_NORM_BEGIN_PARAM_AXIS,
    OH_NN_LAYER_NORM_ELEMENTWISE_AFFINE,
    OH_NN_REDUCE_PROD_KEEP_DIMS,
    OH_NN_REDUCE_ALL_KEEP_DIMS,
    OH_NN_QUANT_DTYPE_CAST_SRC_T,
    OH_NN_QUANT_DTYPE_CAST_DST_T,
    OH_NN_TOP_K_SORTED,
    OH_NN_ARG_MAX_AXIS,
    OH_NN_ARG_MAX_KEEPDIMS,
    OH_NN_UNSQUEEZE_AXIS,
    OH_NN_UNSTACK_AXIS,
    OH_NN_FLATTEN_AXIS,
    OH_NN_DEPTH_TO_SPACE_BLOCK_SIZE,
    OH_NN_DEPTH_TO_SPACE_MODE,
    OH_NN_RANGE_START,
    OH_NN_RANGE_LIMIT,
    OH_NN_RANGE_DELTA,
    OH_NN_CONSTANT_OF_SHAPE_DATA_TYPE,
    OH_NN_CONSTANT_OF_SHAPE_VALUE,
    OH_NN_BROADCAST_TO_SHAPE,
    OH_NN_INSTANCE_NORM_EPSILON,
    OH_NN_EXP_BASE,
    OH_NN_EXP_SCALE,
    OH_NN_EXP_SHIFT,
    OH_NN_LEAKY_RELU_NEGATIVE_SLOPE,
    OH_NN_LSTM_BIDIRECTIONAL,
    OH_NN_LSTM_HAS_BIAS,
    OH_NN_LSTM_INPUT_SIZE,
    OH_NN_LSTM_HIDDEN_SIZE,
    OH_NN_LSTM_NUM_LAYERS,
    OH_NN_LSTM_NUM_DIRECTIONS,
    OH_NN_LSTM_DROPOUT,
    OH_NN_LSTM_ZONEOUT_CELL,
    OH_NN_LSTM_ZONEOUT_HIDDEN,
    OH_NN_LSTM_PROJ_SIZE,
    OH_NN_CLIP_MAX,
    OH_NN_CLIP_MIN,
    OH_NN_ALL_KEEP_DIMS,
    OH_NN_ASSERT_SUMMARIZE,
    OH_NN_POW_SCALE,
    OH_NN_POW_SHIFT,
    OH_NN_AVG_POOL_ROUND_MODE,
    OH_NN_AVG_POOL_GLOBAL,
    OH_NN_FULL_CONNECTION_HAS_BIAS,
    OH_NN_FULL_CONNECTION_USE_AXIS,
    OH_NN_GELU_APPROXIMATE,
    OH_NN_MAX_POOL_ROUND_MODE,
    OH_NN_MAX_POOL_GLOBAL,
    OH_NN_PAD_PADDING_MODE,
    OH_NN_REDUCE_MEAN_REDUCE_TO_END,
    OH_NN_REDUCE_MEAN_COEFF,
    OH_NN_REDUCE_PROD_REDUCE_TO_END,
    OH_NN_REDUCE_PROD_COEFF,
    OH_NN_REDUCE_ALL_REDUCE_TO_END,
    OH_NN_REDUCE_ALL_COEFF,
    OH_NN_TOP_K_AXIS,
    OH_NN_ARG_MAX_TOP_K,
    OH_NN_ARG_MAX_OUT_MAX_VALUE,
    OH_NN_QUANT_DTYPE_CAST_AXIS,
    OH_NN_SLICE_AXES,
    OH_NN_TILE_DIMS,
    OH_NN_CROP_AXIS,
    OH_NN_CROP_OFFSET,
    OH_NN_DETECTION_POST_PROCESS_INPUT_SIZE,
    OH_NN_DETECTION_POST_PROCESS_SCALE,
    OH_NN_DETECTION_POST_PROCESS_NMS_IOU_THRESHOLD,
    OH_NN_DETECTION_POST_PROCESS_NMS_SCORE_THRESHOLD,
    OH_NN_DETECTION_POST_PROCESS_MAX_DETECTIONS,
    OH_NN_DETECTION_POST_PROCESS_DETECTIONS_PER_CLASS,
    OH_NN_DETECTION_POST_PROCESS_MAX_CLASSES_PER_DETECTION,
    OH_NN_DETECTION_POST_PROCESS_NUM_CLASSES,
    OH_NN_DETECTION_POST_PROCESS_USE_REGULAR_NMS,
    OH_NN_DETECTION_POST_PROCESS_OUT_QUANTIZED,
    OH_NN_L2_NORMALIZE_AXIS,
    OH_NN_L2_NORMALIZE_EPSILON,
    OH_NN_L2_NORMALIZE_ACTIVATION_TYPE,
    OH_NN_LOG_SOFTMAX_AXIS,
    OH_NN_LRN_DEPTH_RADIUS,
    OH_NN_LRN_BIAS,
    OH_NN_LRN_ALPHA,
    OH_NN_LRN_BETA,
    OH_NN_LRN_NORM_REGION,
    OH_NN_SPACE_TO_DEPTH_BLOCK_SIZE,
    OH_NN_REDUCE_MAX_KEEP_DIMS,
    OH_NN_REDUCE_MAX_REDUCE_TO_END,
    OH_NN_REDUCE_MAX_COEFF,
    OH_NN_REDUCE_MIN_KEEP_DIMS,
    OH_NN_REDUCE_MIN_REDUCE_TO_END,
    OH_NN_REDUCE_MIN_COEFF,
    OH_NN_REDUCE_SUM_KEEP_DIMS,
    OH_NN_REDUCE_SUM_REDUCE_TO_END,
    OH_NN_REDUCE_SUM_COEFF,
    OH_NN_REDUCE_L2_KEEP_DIMS,
    OH_NN_REDUCE_L2_REDUCE_TO_END,
    OH_NN_REDUCE_L2_COEFF
};

NN_TensorDesc *createTensorDesc(const int32_t *shape, size_t shapeNum, OH_NN_DataType dataType, OH_NN_Format format)
{
    NN_TensorDesc *tensorDescTmp = OH_NNTensorDesc_Create();
    if (tensorDescTmp == nullptr) {
        return nullptr;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetDataType(tensorDescTmp, dataType);
    if (ret != OH_NN_SUCCESS) {
        return nullptr;
    }

    if (shape != nullptr) {
        ret = OH_NNTensorDesc_SetShape(tensorDescTmp, shape, shapeNum);
        if (ret != OH_NN_SUCCESS) {
            return nullptr;
        }
    }

    ret = OH_NNTensorDesc_SetFormat(tensorDescTmp, format);
    if (ret != OH_NN_SUCCESS) {
        return nullptr;
    }

    return tensorDescTmp;
}

napi_value HandleTensorOperations(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    OH_NN_TensorType opType = OH_NN_TENSOR; // 默认类型

    // 解析输入参数
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok && argc >= 1) {
        int32_t opTypeInt;
        if (napi_get_value_int32(env, args[0], &opTypeInt) == napi_ok) {
            opType = static_cast<OH_NN_TensorType>(opTypeInt);
        }
    }

    // 计算数组大小并检查索引有效性
    const size_t mapSize = sizeof(tensorTypeMap) / sizeof(tensorTypeMap[0]);
    const int32_t typeIndex = static_cast<int32_t>(opType);
    if (typeIndex < 0 || static_cast<size_t>(typeIndex) >= mapSize) {
        napi_value ret;
        napi_create_int32(env, OH_NN_INVALID_PARAMETER, &ret);
        return ret;
    }

    // 通过数组映射获取对应的tensorType
    OH_NN_TensorType tensorType = tensorTypeMap[typeIndex];

    // 执行核心逻辑
    OH_NNModel* model = OH_NNModel_Construct();
    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc* tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    OH_NNModel_AddTensorToModel(model, tensorDesc);
    auto ret = OH_NNModel_SetTensorType(model, 0, tensorType);
    
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_value OhNnQuantParamCode(napi_env env, napi_callback_info info)
{
    int32_t dimensions[3]{3, 2, 2};
    uint32_t quantCount = 1;
    uint32_t numBits = 8;
    double scale = 0.f;
    int32_t zeroPoint = 0;
    OH_NN_QuantParam quantParam = {
        .quantCount = quantCount, .numBits = &numBits, .scale = &scale, .zeroPoint = &zeroPoint
    };
    OH_NNModel *model = OH_NNModel_Construct();
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, &quantParam, OH_NN_TENSOR};
    auto ret = OH_NNModel_AddTensor(model, &operand);
    if (ret == OH_NN_SUCCESS) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    return nullptr;
}

napi_value OhNnMemoryCode(napi_env env, napi_callback_info info)
{
    void * const data = nullptr;
    const size_t length = 256;
    OH_NNModel *model = OH_NNModel_Construct();
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    uint32_t inputIndex = 1;
    OH_NN_Memory* ohnnmemory = new OH_NN_Memory{data, length};
    try {
        OH_NNExecutor_DestroyInputMemory(executor, inputIndex, &ohnnmemory);
        napi_value napiRet;
        napi_create_int32(env, 0, &napiRet);
        return napiRet;
    } catch (char msg) {
        return nullptr;
    }
    return nullptr;
}