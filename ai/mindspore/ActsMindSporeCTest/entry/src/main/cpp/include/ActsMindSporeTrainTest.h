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

#ifndef ACTSMINDSPORECTEST_ACTS_MINDSPORE_TRAIN_TEST_H
#define ACTSMINDSPORECTEST_ACTS_MINDSPORE_TRAIN_TEST_H

namespace Acts {
namespace MindSpore {
constexpr float DEFAULT_LEARNING_RATE = 0.01F;
constexpr float EXTREME_LEARNING_RATE = 1000.0F;

// Train related functions
int SUBAIMindSporeTrainUpdateWeights0001();
int SUBAIMindSporeTrainUpdateWeights0002();
int SUBAIMindSporeTrainUpdateWeights0003();
int SUBAIMindSporeTrainUpdateWeights0004();
int SUBAIMindSporeTrainUpdateWeights0005();
int SUBAIMindSporeTrainUpdateWeights0006();
int SUBAIMindSporeTrainSetLearningRate0001();
int SUBAIMindSporeTrainSetLearningRate0002();
int SUBAIMindSporeTrainSetupVirtualBatch0001();
int SUBAIMindSporeTrainSetOptimizationLevel0001();
int SUBAIMindSporeTrainTrainCfg0001();
int SUBAIMindSporeTrainTrainCfg0002();
int SUBAIMindSporeTrainTrainCfg0003();
int SUBAIMindSporeTrainTrainCfg0004();
int SUBAIMindSporeTrainModelBuild0001();
int SUBAIMindSporeTrainModelBuild0002();
int SUBAIMindSporeTrainModelBuild0003();
int SUBAIMindSporeTrainModelBuild0004();
int SUBAIMindSporeTrainModelBuild0005();
int SUBAIMindSporeTrainExportModel0001();
int SUBAIMindSporeTrainExportModel0002();
int SUBAIMindSporeTrainExportModel0003();
int SUBAIMindSporeTrainExportModel0004();
int SUBAIMindSporeTrainExportModel0005();
int SUBAIMindSporeTrainExportModel0006();
int SUBAIMindSporeTrainExportModel0007();
int SUBAIMindSporeTrainExportModel0008();
int SUBAIMindSporeTrainExportModel0009();
int SUBAIMindSporeTrainExportModel0010();
int SUBAIMindSporeTrainExportModel0011();
int SUBAIMindSporeTrainExportModel0012();
int SUBAIMindSporeTrainExportModel0013();
int SUBAIMindSporeTrainExportModel0014();
int SUBAIMindSporeTrainExportWeights0001();
int SUBAIMindSporeTrainExportWeights0002();
int SUBAIMindSporeTrainExportWeights0003();
int SUBAIMindSporeTrainExportWeights0004();
int SUBAIMindSporeTrainExportWeights0005();
int SUBAIMindSporeTrainExportWeights0006();
} // namespace MindSpore
} // namespace Acts

#endif // ACTSMINDSPORECTEST_ACTS_MINDSPORE_TRAIN_TEST_H
