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

#include "ComponentTest.h"

#include <arkui/native_interface.h>
#include <string>

namespace ArkUICapiTest {

Component::Component(ArkUI_NodeType type)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    _component = _nodeAPI->createNode(type);
    _nodeAPI->setUserData(_component, this);
    _nodeAPI->addNodeEventReceiver(_component, Component::NodeEventReceiver);
}

Component::Component(ArkUI_NodeHandle handle)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    _component = handle;
    _nodeAPI->setUserData(_component, this);
    _nodeAPI->addNodeEventReceiver(_component, Component::NodeEventReceiver);

    int32_t count = _nodeAPI->getTotalChildCount(_component);
    for (int32_t i = 0; i < count; i++) {
        auto temp = _nodeAPI->getChildAt(_component, i);
        children_.emplace_back(std::make_shared<Component>(temp));
    }
}

int32_t Component::setAttribute(ArkUI_NodeAttributeType attribute, const ArkUI_AttributeItem* item)
{
    return _nodeAPI->setAttribute(_component, attribute, item);
}

const ArkUI_AttributeItem* Component::getAttribute(ArkUI_NodeAttributeType attribute)
{
    return _nodeAPI->getAttribute(_component, attribute);
}

int32_t Component::resetAttribute(ArkUI_NodeAttributeType attribute)
{
    return _nodeAPI->resetAttribute(_component, attribute);
}

void Component::SetWidth(float width)
{
    ArkUI_NumberValue value[] = { { .f32 = width } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_WIDTH, &item);
}
void Component::SetPercentWidth(float percent)
{
    ArkUI_NumberValue value[] = { { .f32 = percent } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_WIDTH_PERCENT, &item);
}
void Component::SetHeight(float height)
{
    ArkUI_NumberValue value[] = { { .f32 = height } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_HEIGHT, &item);
}
void Component::SetPercentHeight(float percent)
{
    ArkUI_NumberValue value[] = { { .f32 = percent } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_HEIGHT_PERCENT, &item);
}
void Component::SetBackgroundColor(uint32_t color)
{
    ArkUI_NumberValue value[] = { { .u32 = color } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_BACKGROUND_COLOR, &item);
}
void Component::SetBackgroundImage(const std::string& backgroundImage)
{
    ArkUI_AttributeItem item = { nullptr, 0, backgroundImage.c_str() };
    _nodeAPI->setAttribute(_component, NODE_BACKGROUND_IMAGE, &item);
}
void Component::SetBackgroundImageSizeWithStyle(int32_t imageSize)
{
    ArkUI_NumberValue value[] = { { .i32 = imageSize } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &item);
}
void Component::SetBorderRadius(float topLeft, float topRight, float bottomLeft, float bottomRight)
{
    ArkUI_NumberValue value[] = { { .f32 = topLeft }, { .f32 = topRight }, { .f32 = bottomLeft },
        { .f32 = bottomRight } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_RADIUS, &item);
}

void Component::SetPadding(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_PADDING, &item);
}

void Component::SetPaddingPercent(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_PADDING_PERCENT, &item);
}

void Component::SetMargin(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_MARGIN, &item);
}
void Component::SetMargin(float margin)
{
    ArkUI_NumberValue value[] = { { .f32 = margin }, { .f32 = margin }, { .f32 = margin }, { .f32 = margin } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_MARGIN, &item);
}

void Component::SetMarginPercent(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_MARGIN_PERCENT, &item);
}

void Component::SetEnabled(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_ENABLED, &item);
}

void Component::SetAlign(int32_t align)
{
    ArkUI_NumberValue value[] = { { .i32 = align } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_ALIGNMENT, &item);
}

void Component::SetAlignRules(ArkUI_AlignmentRuleOption* option)
{
    ArkUI_AttributeItem item = { .object = option };
    _nodeAPI->setAttribute(_component, NODE_ALIGN_RULES, &item);
}

void Component::SetAlignSelf(int32_t value)
{
    ArkUI_NumberValue val[] = { { .i32 = value } };
    ArkUI_AttributeItem item = { val, 1 };
    _nodeAPI->setAttribute(_component, NODE_ALIGN_SELF, &item);
}

void Component::SetOpacity(float opacity)
{
    ArkUI_NumberValue value[] = { { .f32 = opacity } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_OPACITY, &item);
}

void Component::SetBorderWidth(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_WIDTH, &item);
}

void Component::SetBorderWidth(float borderWidth)
{
    ArkUI_NumberValue value[] = { { .f32 = borderWidth }, { .f32 = borderWidth }, { .f32 = borderWidth },
        { .f32 = borderWidth } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_WIDTH, &item);
}

void Component::SetBorderColor(uint32_t top, uint32_t right, uint32_t bottom, uint32_t left)
{
    ArkUI_NumberValue value[] = { { .u32 = top }, { .u32 = right }, { .u32 = bottom }, { .u32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_COLOR, &item);
}

void Component::SetBorderStyle(int32_t top, int32_t right, int32_t bottom, int32_t left)
{
    ArkUI_NumberValue value[] = { { .i32 = top }, { .i32 = right }, { .i32 = bottom }, { .i32 = left } };
    ArkUI_AttributeItem item = { value, 4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_STYLE, &item);
}

void Component::SetVisibility(int32_t visibility)
{
    ArkUI_NumberValue value[] = { { .i32 = visibility } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_VISIBILITY, &item);
}
void Component::SetId(const std::string& id)
{
    ArkUI_AttributeItem item = { nullptr, 0, id.c_str() };
    _nodeAPI->setAttribute(_component, NODE_ID, &item);
}
void Component::AddChild(const std::shared_ptr<Component>& child)
{
    children_.emplace_back(child);
    OnAddChild(child);
}

void Component::RemoveChild(const std::shared_ptr<Component>& child)
{
    children_.remove(child);
    OnRemoveChild(child);
}

void Component::RemoveAll()
{
    children_.clear();
    OnRemoveAll();
}

void Component::InsertChild(const std::shared_ptr<Component>& child, int32_t index)
{
    if (index >= children_.size()) {
        AddChild(child);
    } else {
        auto iter = children_.begin();
        std::advance(iter, index);
        children_.insert(iter, child);
        OnInsertChild(child, index);
    }
}

std::shared_ptr<Component> Component::GetPreviousSibling()
{
    auto previousSibling = _nodeAPI->getPreviousSibling(_component);
    return std::make_shared<Component>(previousSibling);
};

std::shared_ptr<Component> Component::GetNextSibling()
{
    auto nextSibling = _nodeAPI->getNextSibling(_component);
    return std::make_shared<Component>(nextSibling);
};

void Component::NodeEventReceiver(ArkUI_NodeEvent* event)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 获取事件发生的UI组件对象。
    auto nodeHandle = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    // 获取保持在UI组件对象中的自定义数据，返回封装类指针。
    auto* node = reinterpret_cast<Component*>(nodeAPI->getUserData(nodeHandle));
    // 基于封装类实例对象处理事件。
    if (node) {
        node->ProcessNodeEvent(event);
    }
}
void Component::SetFontSize(float fontSize)
{
    ArkUI_NumberValue value[] = { { .f32 = fontSize } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_FONT_SIZE, &item);
}
void Component::ProcessNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(
        LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "commonEvent", "ProcessNodeEvent eventType=%{public}d", eventType);
    switch (eventType) {
        case NODE_ON_CLICK: {
            if (onClick_) {
                onClick_();
            }
            break;
        }
        case NODE_TOUCH_EVENT: {
            if (onTouch_) {
                onTouch_(event);
            }
            break;
        }
        case NODE_EVENT_ON_DISAPPEAR: {
            if (onDisappear_) {
                onDisappear_();
            }
            break;
        }
        case NODE_EVENT_ON_APPEAR: {
            if (onAppear_) {
                onAppear_();
            }
            break;
        }
        case NODE_ON_HOVER: {
            if (onHover_) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "commonEvent", "NODE_ON_HOVER");
                ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
                int32_t isHover = result->data[0].i32;
                onHover_(static_cast<bool>(isHover));
            }
            break;
        }
        case NODE_EVENT_ON_VISIBLE_AREA_CHANGE: {
            if (onVisibleAreaChange_) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "commonEvent", "NODE_EVENT_ON_VISIBLE_AREA_CHANGE");
                ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
                bool visible = static_cast<bool>(result->data[0].i32);
                float ratio = result->data[1].f32;
                onVisibleAreaChange_(visible, ratio);
            }
            break;
        }
        case NODE_ON_MOUSE: {
            if (onMouse_) {
                onMouse_(event);
            }
            break;
        }
        case NODE_ON_TOUCH_INTERCEPT: {
            if (onTouchIntercept_) {
                onTouchIntercept_(event);
            }
            break;
        }
        case NODE_ON_FOCUS: {
            if (onFocus_) {
                onFocus_();
            }
            break;
        }
        default: {
            OnNodeEvent(event);
        }
    }
}

void Component::RegisterOnVisibleAreaChange(
    const std::function<void(bool isVisible, float ratio)>& onVisibleAreaChange, std::vector<float> ratioArray)
{
    ArkUI_NumberValue value[ratioArray.size()];

    for (size_t i = 0; i < ratioArray.size(); i++) {
        value[i].f32 = { ratioArray[i] };
    }
    ArkUI_AttributeItem item = { value, static_cast<int32_t>(ratioArray.size()) };

    onVisibleAreaChange_ = onVisibleAreaChange;
    _nodeAPI->registerNodeEvent(_component, NODE_EVENT_ON_VISIBLE_AREA_CHANGE, 0, &item);
}
} // namespace ArkUICapiTest