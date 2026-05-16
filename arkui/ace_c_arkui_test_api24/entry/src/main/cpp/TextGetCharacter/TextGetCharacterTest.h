/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_XTS_TEXTGETCHARACTER_TEST_H
#define ARKUI_CAPI_XTS_TEXTGETCHARACTER_TEST_H

#include "../common/common.h"

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

namespace ArkUICApiDemo {

struct Boundary {
    int32_t leftIndex = 0;  // include leftIndex_
    int32_t rightIndex = 0; // not include rightIndex_

    Boundary (int32_t left, int32_t right) 
    {
        leftIndex = left;
        rightIndex = right;
    }
    bool operator==(const Boundary &rhs) const { return leftIndex == rhs.leftIndex && rightIndex == rhs.rightIndex; }
};

class TextGetCharacterTest {
public:
    ~TextGetCharacterTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
};
} // namespace ArkUICApiDemo

#endif //ARKUI_CAPI_XTS_TEXTGETCHARACTER_TEST_H