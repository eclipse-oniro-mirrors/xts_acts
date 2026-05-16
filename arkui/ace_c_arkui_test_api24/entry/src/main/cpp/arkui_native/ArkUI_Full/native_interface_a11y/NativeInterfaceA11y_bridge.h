/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef NATIVE_INTERFACE_A11Y_BRIDGE_H
#define NATIVE_INTERFACE_A11Y_BRIDGE_H

#include <cstdint>

namespace ArkUICapiTest {
namespace NativeElemTestBridge {

void *CreateElem();

int32_t SetComponentId(void *elem, const char *componentId);

void DisposeElem(void *elem);

int32_t ExpectedSuccessCode();

} // namespace NativeElemTestBridge
} // namespace ArkUICapiTest

#endif // NATIVE_INTERFACE_A11Y_BRIDGE_H
