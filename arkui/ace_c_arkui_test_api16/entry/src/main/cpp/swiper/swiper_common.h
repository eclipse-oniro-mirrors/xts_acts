/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_DEMO_SWIPER_COMMON_H
#define ARKUI_CAPI_DEMO_SWIPER_COMMON_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include "../common/common.h"

namespace ArkUICapiTest {
#define ON_ANIMATION_START_EVENT_ID 6015
#define ON_ANIMATION_END_EVENT_ID 6016
#define ON_GESTURE_SWIPE_EVENT_ID 6017
#define ON_DID_SCROLL_EVENT_ID 6018
#define DID_SCROLL_EVENT_ID 6019
#define PARAM_NEGATIVE_1 (-1)
#define PARAM_NEGATIVE_10 (-10)
#define PARAM_NEGATIVE_30 (-30)
#define PARAM_20 20
#define ABNORMAL_PARAM 1000
#define PARAM_800 800

class SwiperCommon {
public:
    ~SwiperCommon();
    struct SwiperPropertiesInit {
        bool initWidthFlag;
        bool initHeightFlag;
        bool initBackgroundColorFlag;
        bool initChildNodeFlag;
    };

    static ArkUI_NodeHandle CreateSwiper(SwiperPropertiesInit flags);
};
} // namespace ArkUICApiDemo
#endif // ARKUI_CAPI_DEMO_SWIPER_COMMON_H
