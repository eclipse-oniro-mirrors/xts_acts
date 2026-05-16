/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_DEMO_SWIPER_INDICATOR_TEST_H
#define ARKUI_CAPI_DEMO_SWIPER_INDICATOR_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <cstdint>
#include "../common/common.h"
#include "swiper_common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {
struct SwiperIndicator {
    float topPosition;
    float bottomPosition;
    float startPosition;
    float endPosition;
    float itemWidth;
    float itemHeight;
    float selectedItemWidth;
    float selectedItemHeight;
    int32_t mask = 0;
    uint32_t color = COLOR_GRAY;
    uint32_t selectedColor = COLOR_RED;
    float space;
    int32_t ignoreSize = 0;
    float bottom;
};

class SwiperIndicatorTest {
public:
    ~SwiperIndicatorTest();

    static void CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent);
    static void CreateNativeNodeAbnormal(ani_env* env, ani_object info, ani_object NodeContent);
    
private:
    static int32_t spaceIndex_;
    static int32_t ignoreSizeIndex_;
    static int32_t bottomIndex_;
    static int32_t maskIndex_;
};
} // namespace ArkUICApiDemo
#endif // ARKUI_CAPI_DEMO_SWIPER_INDICATOR_TEST_H
