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
// Train related functions
export const SUB_AI_MindSpore_Train_UpdateWeights: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_SetLearningRate: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_SetupVirtualBatch: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_SetOptimizationLevel: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_TrainCfg: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_ModelBuild: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_ExportModel: (caseName: number) => number;
export const SUB_AI_MindSpore_Train_ExportWeights: (caseName: number) => number;

// Context related functions
export const SUB_AI_MindSpore_ContextCreate: (caseName: number) => number;
export const SUB_AI_MindSpore_ContextDestroy: (caseName: number) => number;

// Model related functions
export const SUB_AI_MindSpore_ModelCreate: (caseName: number) => number;
export const SUB_AI_MindSpore_ModelLoadConfig: (caseName: number) => number;

// Tensor related functions
export const SUB_AI_MindSpore_TensorCreate: (caseName: number) => number;

// NNRT related functions
export const SUB_AI_MindSpore_NNRT_Cache: (caseName: number) => number;
export const SUB_AI_MindSpore_NNRT_copy_free: (caseName: number) => number;

// CPU related functions
export const SUB_AI_MindSpore_CPU_copy_free: (caseName: number) => number;

// HIAI OfflineModel related functions
export const SUB_AI_MindSpore_HIAI_OfflineModel: (caseName: number) => number;

// Other functions
export const SUB_AI_MindSpore_Covered: (caseName: number) => number;

// OHOS Context
export const OHOS_Context_CPU: (caseName: number) => number;
export const OHOS_Context_NPU: (caseName: number) => number;

// OHOS Model
export const OHOS_Model_Build: (caseName: number) => number;
export const OHOS_Model_Resize: (caseName: number) => number;
export const OHOS_Model_Predict: (caseName: number) => number;
export const OHOS_Model_GetInputByTensorName: (caseName: number) => number;
export const OHOS_Model_GetOutputByTensorName: (caseName: number) => number;

// OHOS Tensor
export const OHOS_Tensor_Create: (caseName: number) => number;

// OHOS Input / Multiple / Parallel / Compatible
export const OHOS_Input: (caseName: number) => number;
export const OHOS_Multiple: (caseName: number) => number;
export const OHOS_Parallel: (caseName: number) => number;
export const OHOS_Compatible: (caseName: number) => number;

// OHOS OfflineModel
export const OHOS_OfflineModel: (caseName: number) => number;

// OHOS NNRT
export const OHOS_NNRT: (caseName: number) => number;
export const OHOS_NNRT_QUANT: (caseName: number) => number;
export const SUB_AI_MindSpore_AIPP: (caseName: number) => number;