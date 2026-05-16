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

#ifndef HDI_MODEL_TEST_H
#define HDI_MODEL_TEST_H

namespace OHOS {
namespace NeuralNetworkCore {

// Model Test Cases
int TestModelCreateQuantParam0100();
int TestModelDestroyQuantParam0100();
int TestModelDestroyQuantParam0200();
int TestModelSetQuantParam0100();
int TestModelSetQuantParam0200();
int TestModelSetQuantParam0300();
int TestModelSetQuantParam0400();
int TestModelSetQuantParam0500();
int TestModelSetQuantParam0600();
int TestModelSetQuantParam0700();
int TestModelSetQuantParam0800();
int TestModelSetQuantParam0900();
int TestModelAddTensorToModel0100();
int TestModelAddTensorToModel0200();
int TestModelSetTensorData0100();
int TestModelSetTensorData0200();
int TestModelSetTensorData0300();
int TestModelSetTensorData0400();
int TestModelSetTensorType0100();
int TestModelSetTensorType0200();
int TestModelSetTensorType0300();

} // namespace NeuralNetworkCore
} // namespace OHOS

#endif // HDI_MODEL_TEST_H

