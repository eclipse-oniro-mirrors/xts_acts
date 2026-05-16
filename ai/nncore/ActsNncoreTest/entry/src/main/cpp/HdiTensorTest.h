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

#ifndef HDI_TENSOR_TEST_H
#define HDI_TENSOR_TEST_H

namespace OHOS {
namespace NeuralNetworkCore {

// Tensor Test Cases
int TestTensorCreate0100();
int TestTensorCreate0200();
int TestTensorCreate0300();
int TestTensorCreateWithSize0100();
int TestTensorCreateWithSize0200();
int TestTensorCreateWithSize0300();
int TestTensorCreateWithFd0100();
int TestTensorCreateWithFd0200();
int TestTensorCreateWithFd0300();
int TestTensorCreateWithFd0400();
int TestTensorCreateWithFd0500();
int TestTensorGetDataBuffer0100();
int TestTensorGetDataBuffer0200();
int TestTensorDestroy0100();
int TestTensorDestroy0200();
int TestTensorGetTensorDesc0100();
int TestTensorGetTensorDesc0200();
int TestTensorGetSize0100();
int TestTensorGetSize0200();
int TestTensorGetSize0300();
int TestTensorGetFd0100();
int TestTensorGetFd0200();
int TestTensorGetOffset0100();
int TestTensorGetOffset0200();

} // namespace NeuralNetworkCore
} // namespace OHOS

#endif // HDI_TENSOR_TEST_H

