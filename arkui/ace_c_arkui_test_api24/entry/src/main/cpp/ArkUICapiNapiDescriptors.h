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

#ifndef ARKUI_CAPI_NAPI_DESCRIPTORS_H
#define ARKUI_CAPI_NAPI_DESCRIPTORS_H

#include <cstddef>
#include <napi/native_api.h>

namespace ArkUICapiTest {

extern const napi_property_descriptor kArkUICapiTestPropertyDescriptors[];
extern const size_t K_ARK_UI_CAPI_TEST_PROPERTY_DESCRIPTORS_COUNT;

} // namespace ArkUICapiTest

#endif // ARKUI_CAPI_NAPI_DESCRIPTORS_H
