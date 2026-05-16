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

#ifndef HDI_TENSOR_DESC_TEST_H
#define HDI_TENSOR_DESC_TEST_H

namespace OHOS {
namespace NeuralNetworkCore {

// TensorDesc Test Cases
int TestTensorDescCreate0100();
int TestTensorDescDestroy0100();
int TestTensorDescDestroy0200();
int TestTensorDescDestroy0300();
int TestTensorDescSetDataType0100();
int TestTensorDescSetDataType0200();
int TestTensorDescSetDataType0300();
int TestTensorDescGetDataType0100();
int TestTensorDescGetDataType0200();
int TestTensorDescSetShape0100();
int TestTensorDescSetShape0200();
int TestTensorDescGetShape0100();
int TestTensorDescGetShape0200();
int TestTensorDescGetShape0300();
int TestTensorDescSetFormat0100();
int TestTensorDescSetFormat0200();
int TestTensorDescGetFormat0100();
int TestTensorDescGetFormat0200();
int TestTensorDescGetFormat0300();
int TestTensorDescGetElementCount0100();
int TestTensorDescGetElementCount0200();
int TestTensorDescGetElementCount0300();
int TestTensorDescGetByteSize0100();
int TestTensorDescGetByteSize0200();
int TestTensorDescGetByteSize0300();
int TestTensorDescSetName0100();
int TestTensorDescSetName0200();
int TestTensorDescGetName0100();
int TestTensorDescGetName0200();
int TestTensorDescGetName0300();

} // namespace NeuralNetworkCore
} // namespace OHOS

#endif // HDI_TENSOR_DESC_TEST_H

