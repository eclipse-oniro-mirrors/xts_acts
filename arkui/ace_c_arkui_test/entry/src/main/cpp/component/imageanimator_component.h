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

#ifndef ARKUI_CAPI_DEMO_IMAGEANIMATOR_COMPONENT_H
#define ARKUI_CAPI_DEMO_IMAGEANIMATOR_COMPONENT_H

#include <cassert>
#include <string>

#include "component.h"

namespace ArkUICapiTest {
class ImageAnimatorComponent : public Component {
public:
    explicit ImageAnimatorComponent() : Component(ARKUI_NODE_IMAGE_ANIMATOR) {}
    explicit ImageAnimatorComponent(ArkUI_NodeHandle handle) : Component(handle) {}
    void SetState(int32_t state);
    void SetIteration(int32_t iteration);
    void SetImage(std::vector<ArkUI_ImageAnimatorFrameInfo*>& vector);
    void SetFixedSize(int32_t fixedSize);
    void SetReverse(int32_t reverse);
    void SetFillMode(int32_t mode);
    void SetDuration(int32_t duration);
    void RegisterOnStart(const std::function<void(ArkUI_NodeEvent *event)> &onStart);
    void RegisterOnCancel(const std::function<void(ArkUI_NodeEvent *event)> &onCancel);
    void RegisterOnPause(const std::function<void(ArkUI_NodeEvent *event)> &onPause);
    void RegisterOnRepeat(const std::function<void(ArkUI_NodeEvent *event)> &onRepeat);
    void RegisterOnFinish(const std::function<void(ArkUI_NodeEvent *event)> &onFinish);
    void OnNodeEvent(ArkUI_NodeEvent *event) override;

    std::function<void(ArkUI_NodeEvent *event)> onStart_;
    std::function<void(ArkUI_NodeEvent *event)> onCancel_;
    std::function<void(ArkUI_NodeEvent *event)> onPause_;
    std::function<void(ArkUI_NodeEvent *event)> onRepeat_;
    std::function<void(ArkUI_NodeEvent *event)> onFinish_;
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_DEMO_IMAGEANIMATOR_COMPONENT_H
