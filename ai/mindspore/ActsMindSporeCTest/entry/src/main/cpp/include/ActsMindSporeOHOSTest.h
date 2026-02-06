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

#ifndef ACTSMINDSPORECTEST_ACTS_MINDSPORE_OHOS_TEST_H
#define ACTSMINDSPORECTEST_ACTS_MINDSPORE_OHOS_TEST_H

namespace Acts {
namespace MindSpore {
// OHOS Context
int OHOSContextCPU0001();
int OHOSContextCPU0002();
int OHOSContextCPU0003();
int OHOSContextCPU0004();
int OHOSContextCPU0005();
int OHOSContextCPU0006();
int OHOSContextCPU0007();
int OHOSContextCPU0008();
int OHOSContextCPU0009();
int OHOSContextCPU0010();
int OHOSContextCPU0011();
int OHOSContextCPU0012();
int OHOSContextCPU0013();
int OHOSContextCPU0014();
int OHOSContextCPU0015();
int OHOSContextCPU0016();
int OHOSContextCPU0017();
int OHOSContextCPU0018();
int OHOSContextCPU0019();
int OHOSContextCPU0020();
int OHOSContextNPU0002();

// OHOS Model build / resize / predict
int OHOSModelBuild0001();
int OHOSModelBuild0002();
int OHOSModelBuild0003();
int OHOSModelBuild0004();
int OHOSModelBuild0005();
int OHOSModelBuild0006();
int OHOSModelBuild0007();
int OHOSModelBuild0008();
int OHOSModelBuild0009();
int OHOSModelResize0001();
int OHOSModelResize0002();
int OHOSModelResize0003();
int OHOSModelResize0004();
int OHOSModelResize0005();
int OHOSModelPredict0001();
int OHOSModelPredict0002();
int OHOSModelPredict0003();
int OHOSModelPredict0004();
int OHOSModelGetInputByTensorName0001();
int OHOSModelGetInputByTensorName0002();
int OHOSModelGetOutputByTensorName0001();
int OHOSModelGetOutputByTensorName0002();

// OHOS Tensor create
int OHOSTensorCreate0001();
int OHOSTensorCreate0002();
int OHOSTensorCreate0003();
int OHOSTensorCreate0004();
int OHOSTensorCreate0005();
int OHOSTensorCreate0006();
int OHOSTensorCreate0007();
int OHOSTensorCreate0008();
int OHOSTensorCreate0009();
int OHOSTensorCreate0010();
int OHOSTensorCreate0011();
int OHOSTensorCreate0012();
int OHOSTensorCreate0013();
int OHOSTensorCreate0014();
int OHOSTensorCreate0015();
int OHOSTensorCreate0016();

// OHOS Input / Multiple / Parallel / Compatible
int OHOSInput0001();
int OHOSInput0002();
int OHOSInput0003();
int OHOSInput0004();
int OHOSMultiple0001();
int OHOSMultiple0002();
int OHOSMultiple0003();
int OHOSMultiple0004();
int OHOSParallel0001();
int OHOSParallel0002();
int OHOSParallel0003();
int OHOSCompatible0001();

// OHOS OfflineModel
int OHOSOfflineModel0001();
int OHOSOfflineModel0002();
int OHOSOfflineModel0004();
int OHOSOfflineModel0005();
int OHOSOfflineModel0006();
int OHOSOfflineModel0007();
int OHOSOfflineModel0008();
int OHOSOfflineModel0009();
} // namespace MindSpore
} // namespace Acts

#endif // ACTSMINDSPORECTEST_ACTS_MINDSPORE_OHOS_TEST_H
