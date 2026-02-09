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
#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_gesture.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "drag/DragReturnNullTest.h"

namespace ArkUICapiTest {

struct ArkUI_VisibleAreaEventOptions_ {
    std::vector<float> ratios;
    int32_t expectedUpdateInterval;
    bool measureFromViewport;
};

static napi_value True_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_VisibleAreaEventOptions_ *ent = new ArkUI_VisibleAreaEventOptions_;
    ent->measureFromViewport = true;
    auto result = OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport((ArkUI_VisibleAreaEventOptions*)ent);
    ASSERT_EQ(result, true);
    NAPI_END;
}

static napi_value False_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport(nullptr);
    ASSERT_EQ(result, false);
    NAPI_END;
}

} // namespace ArkUICapiTest