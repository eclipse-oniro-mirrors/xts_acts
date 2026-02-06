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
#include "imageanimator_component.h"

namespace ArkUIAniTest {
void ImageAnimatorComponent::SetState(int32_t state)
{
    ArkUI_NumberValue value[] = { { .i32 = state } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_STATE, &item);
}

void ImageAnimatorComponent::SetIteration(int32_t iteration)
{
    ArkUI_NumberValue value[] = { { .i32 = iteration } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_ITERATION, &item);
}

void ImageAnimatorComponent::SetImage(std::vector<ArkUI_ImageAnimatorFrameInfo*>& vector)
{
    ArkUI_AttributeItem item = { .object = vector.data(), .size = static_cast<int>(vector.size()) };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_IMAGES, &item);
}

void ImageAnimatorComponent::SetFixedSize(int32_t fixedSize)
{
    ArkUI_NumberValue value[] = { { .i32 = fixedSize } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_FIXED_SIZE, &item);
}

void ImageAnimatorComponent::SetReverse(int32_t reverse)
{
    ArkUI_NumberValue value[] = { { .i32 = reverse } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_REVERSE, &item);
}

void ImageAnimatorComponent::SetFillMode(int32_t mode)
{
    ArkUI_NumberValue value[] = { { .i32 = mode } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_FILL_MODE, &item);
}

void ImageAnimatorComponent::SetDuration(int32_t duration)
{
    ArkUI_NumberValue value[] = { { .i32 = duration } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_IMAGE_ANIMATOR_DURATION, &item);
}

void ImageAnimatorComponent::RegisterOnStart(const std::function<void(ArkUI_NodeEvent *event)> &onStart)
{
    onStart_ = onStart;
    _nodeAPI->registerNodeEvent(_component, NODE_IMAGE_ANIMATOR_EVENT_ON_START, 0, nullptr);
}

void ImageAnimatorComponent::RegisterOnCancel(const std::function<void(ArkUI_NodeEvent *event)> &onCancel)
{
    onCancel_ = onCancel;
    _nodeAPI->registerNodeEvent(_component, NODE_IMAGE_ANIMATOR_EVENT_ON_CANCEL, 0, nullptr);
}

void ImageAnimatorComponent::RegisterOnPause(const std::function<void(ArkUI_NodeEvent *event)> &onPause)
{
    onPause_ = onPause;
    _nodeAPI->registerNodeEvent(_component, NODE_IMAGE_ANIMATOR_EVENT_ON_PAUSE, 0, nullptr);
}

void ImageAnimatorComponent::RegisterOnRepeat(const std::function<void(ArkUI_NodeEvent *event)> &onRepeat)
{
    onRepeat_ = onRepeat;
    _nodeAPI->registerNodeEvent(_component, NODE_IMAGE_ANIMATOR_EVENT_ON_REPEAT, 0, nullptr);
}

void ImageAnimatorComponent::RegisterOnFinish(const std::function<void(ArkUI_NodeEvent *event)> &onFinish)
{
    onFinish_ = onFinish;
    _nodeAPI->registerNodeEvent(_component, NODE_IMAGE_ANIMATOR_EVENT_ON_FINISH, 0, nullptr);
}

void ImageAnimatorComponent::OnNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    switch (eventType) {
        case NODE_IMAGE_ANIMATOR_EVENT_ON_START:
            if (onStart_) {
                onStart_(event);
            }
            break;
        case NODE_IMAGE_ANIMATOR_EVENT_ON_CANCEL:
            if (onCancel_) {
                onCancel_(event);
            }
            break;
        case NODE_IMAGE_ANIMATOR_EVENT_ON_PAUSE:
            if (onPause_) {
                onPause_(event);
            }
            break;
        case NODE_IMAGE_ANIMATOR_EVENT_ON_REPEAT:
            if (onRepeat_) {
                onRepeat_(event);
            }
            break;
        case NODE_IMAGE_ANIMATOR_EVENT_ON_FINISH:
            if (onFinish_) {
                onFinish_(event);
            }
            break;
        default:
            break;
    }
}
} // namespace ArkUIAniTest
