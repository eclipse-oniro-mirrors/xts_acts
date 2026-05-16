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

#include "component/Component.h"

namespace ArkUICapiTest {

// 构造函数：根据节点类型创建组件
Component::Component(ArkUI_NodeType type)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    // 创建指定类型的节点
    _component = _nodeAPI->createNode(type);
    // 创建对应XComponent
    _xcomponent = OH_NativeXComponent_GetNativeXComponent(_component);
    // 设置用户数据指向当前对象
    _nodeAPI->setUserData(_component, this);
    // 注册节点事件接收器
    _nodeAPI->addNodeEventReceiver(_component, Component::NodeEventReceiver);
}

// 构造函数：从已有节点句柄创建组件
Component::Component(ArkUI_NodeHandle handle)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, _nodeAPI);
    _component = handle;
    // 创建对应XComponent
    _xcomponent = OH_NativeXComponent_GetNativeXComponent(_component);
    _nodeAPI->setUserData(_component, this);
    _nodeAPI->addNodeEventReceiver(_component, Component::NodeEventReceiver);

    // 递归构建子组件树
    int32_t count = _nodeAPI->getTotalChildCount(_component);
    for (int32_t i = PARAM_0; i < count; i++) {
        auto temp = _nodeAPI->getChildAt(_component, i);
        children_.emplace_back(std::make_shared<Component>(temp));
    }
}

// 设置节点属性
int32_t Component::setAttribute(ArkUI_NodeAttributeType attribute, const ArkUI_AttributeItem* item)
{
    return _nodeAPI->setAttribute(_component, attribute, item);
}

// 获取节点属性
const ArkUI_AttributeItem* Component::getAttribute(ArkUI_NodeAttributeType attribute)
{
    return _nodeAPI->getAttribute(_component, attribute);
}

// 重置节点属性
int32_t Component::resetAttribute(ArkUI_NodeAttributeType attribute)
{
    return _nodeAPI->resetAttribute(_component, attribute);
}

// 设置宽度（像素值）
void Component::SetWidth(float width)
{
    ArkUI_NumberValue value[] = { { .f32 = width } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_WIDTH, &item);
}

// 设置宽度百分比
void Component::SetPercentWidth(float percent)
{
    ArkUI_NumberValue value[] = { { .f32 = percent } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_WIDTH_PERCENT, &item);
}

// 设置高度（像素值）
void Component::SetHeight(float height)
{
    ArkUI_NumberValue value[] = { { .f32 = height } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_HEIGHT, &item);
}

// 设置高度百分比
void Component::SetPercentHeight(float percent)
{
    ArkUI_NumberValue value[] = { { .f32 = percent } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_HEIGHT_PERCENT, &item);
}

// 设置背景颜色（ARGB格式）
void Component::SetBackgroundColor(uint32_t color)
{
    ArkUI_NumberValue value[] = { { .u32 = color } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_BACKGROUND_COLOR, &item);
}

// 设置背景图片路径
void Component::SetBackgroundImage(const std::string& backgroundImage)
{
    ArkUI_AttributeItem item = { nullptr, PARAM_0, backgroundImage.c_str() };
    _nodeAPI->setAttribute(_component, NODE_BACKGROUND_IMAGE, &item);
}

// 设置背景图片尺寸样式
void Component::SetBackgroundImageSizeWithStyle(int32_t imageSize)
{
    ArkUI_NumberValue value[] = { { .i32 = imageSize } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_BACKGROUND_IMAGE_SIZE_WITH_STYLE, &item);
}

// 设置圆角半径（四个角分别设置）
void Component::SetBorderRadius(float topLeft, float topRight, float bottomLeft, float bottomRight)
{
    ArkUI_NumberValue value[] = { { .f32 = topLeft }, { .f32 = topRight }, { .f32 = bottomLeft },
        { .f32 = bottomRight } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_RADIUS, &item);
}

// 设置内边距（像素值）
void Component::SetPadding(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_PADDING, &item);
}

// 设置内边距百分比
void Component::SetPaddingPercent(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_PADDING_PERCENT, &item);
}

// 设置外边距（四个方向分别设置）
void Component::SetMargin(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_MARGIN, &item);
}

// 设置外边距（统一设置四个方向）
void Component::SetMargin(float margin)
{
    ArkUI_NumberValue value[] = { { .f32 = margin }, { .f32 = margin }, { .f32 = margin }, { .f32 = margin } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_MARGIN, &item);
}

// 设置外边距百分比
void Component::SetMarginPercent(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_MARGIN_PERCENT, &item);
}

// 设置组件是否启用
void Component::SetEnabled(int32_t enable)
{
    ArkUI_NumberValue value[] = { { .i32 = enable } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_ENABLED, &item);
}

// 设置对齐方式
void Component::SetAlign(int32_t align)
{
    ArkUI_NumberValue value[] = { { .i32 = align } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_ALIGNMENT, &item);
}

// 设置对齐规则（复杂布局使用）
void Component::SetAlignRules(ArkUI_AlignmentRuleOption* option)
{
    ArkUI_AttributeItem item = { .object = option };
    _nodeAPI->setAttribute(_component, NODE_ALIGN_RULES, &item);
}

// 设置自身对齐方式（覆盖父容器设置）
void Component::SetAlignSelf(int32_t value)
{
    ArkUI_NumberValue val[] = { { .i32 = value } };
    ArkUI_AttributeItem item = { val, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_ALIGN_SELF, &item);
}

// 设置透明度（0.0-1.0）
void Component::SetOpacity(float opacity)
{
    ArkUI_NumberValue value[] = { { .f32 = opacity } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_OPACITY, &item);
}

// 设置边框宽度（四个方向分别设置）
void Component::SetBorderWidth(float top, float right, float bottom, float left)
{
    ArkUI_NumberValue value[] = { { .f32 = top }, { .f32 = right }, { .f32 = bottom }, { .f32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_WIDTH, &item);
}

// 设置边框宽度（统一设置四个方向）
void Component::SetBorderWidth(float borderWidth)
{
    ArkUI_NumberValue value[] = { { .f32 = borderWidth }, { .f32 = borderWidth }, { .f32 = borderWidth },
        { .f32 = borderWidth } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_WIDTH, &item);
}

// 设置边框颜色（四个方向分别设置）
void Component::SetBorderColor(uint32_t top, uint32_t right, uint32_t bottom, uint32_t left)
{
    ArkUI_NumberValue value[] = { { .u32 = top }, { .u32 = right }, { .u32 = bottom }, { .u32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_COLOR, &item);
}

// 设置边框样式（四个方向分别设置）
void Component::SetBorderStyle(int32_t top, int32_t right, int32_t bottom, int32_t left)
{
    ArkUI_NumberValue value[] = { { .i32 = top }, { .i32 = right }, { .i32 = bottom }, { .i32 = left } };
    ArkUI_AttributeItem item = { value, PARAM_4 };
    _nodeAPI->setAttribute(_component, NODE_BORDER_STYLE, &item);
}

// 设置可否获焦
void Component::SetFocusable(bool flag)
{
    ArkUI_NumberValue FocusValue[] = {{.i32 = flag?1:0}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    _nodeAPI->setAttribute(_component, NODE_FOCUSABLE, &FocusItem);
}

// 设置默认获焦
void Component::SetFocusDefault(bool flag)
{
    ArkUI_NumberValue FocusValue[] = {{.i32 = flag?1:0}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    _nodeAPI->setAttribute(_component, NODE_DEFAULT_FOCUS, &FocusItem);
}

// 设置组件可见性
void Component::SetVisibility(int32_t visibility)
{
    ArkUI_NumberValue value[] = { { .i32 = visibility } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_VISIBILITY, &item);
}

// 设置组件ID（用于查询或事件绑定）
void Component::SetId(const std::string& id)
{
    ArkUI_AttributeItem item = { nullptr, PARAM_0, id.c_str() };
    _nodeAPI->setAttribute(_component, NODE_ID, &item);
}

// 添加子组件
void Component::AddChild(const std::shared_ptr<Component>& child)
{
    children_.emplace_back(child);
    OnAddChild(child);
}

// 移除指定子组件
void Component::RemoveChild(const std::shared_ptr<Component>& child)
{
    children_.remove(child);
    OnRemoveChild(child);
}

// 移除所有子组件
void Component::RemoveAll()
{
    children_.clear();
    OnRemoveAll();
}

// 在指定位置插入子组件
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

// 获取前一个兄弟节点
std::shared_ptr<Component> Component::GetPreviousSibling()
{
    auto previousSibling = _nodeAPI->getPreviousSibling(_component);
    return std::make_shared<Component>(previousSibling);
};

// 获取下一个兄弟节点
std::shared_ptr<Component> Component::GetNextSibling()
{
    auto nextSibling = _nodeAPI->getNextSibling(_component);
    return std::make_shared<Component>(nextSibling);
};

// 节点事件接收器（静态方法）
void Component::NodeEventReceiver(ArkUI_NodeEvent* event)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandle = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    // 从用户数据中获取组件实例
    auto* node = reinterpret_cast<Component*>(nodeAPI->getUserData(nodeHandle));
    if (node) {
        node->ProcessNodeEvent(event);
    }
}

// 设置字体大小
void Component::SetFontSize(float fontSize)
{
    ArkUI_NumberValue value[] = { { .f32 = fontSize } };
    ArkUI_AttributeItem item = { value, PARAM_1 };
    _nodeAPI->setAttribute(_component, NODE_FONT_SIZE, &item);
}

// 处理节点事件
void Component::ProcessNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(
        LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "commonEvent", "ProcessNodeEvent eventType=%{public}d", eventType);
    // 优先查找已注册的事件回调
    if (eventMap_.find(eventType) != eventMap_.end()) {
        eventMap_[eventType](event);
    } else {
        // 调用虚函数处理未注册事件
        OnNodeEvent(event);
    }
}

// 注册点击事件回调
void Component::RegisterOnClick(const std::function<void()>& onClick)
{
    auto onClickCallback = [onClick](ArkUI_NodeEvent*) {
        if (onClick) {
            onClick();
        }
    };
    eventMap_[NODE_ON_CLICK] = onClickCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_ON_CLICK, PARAM_0, nullptr);
}

// 注册按键事件回调
void Component::RegisterOnKey(const std::function<void(ArkUI_NodeEvent* event)>& onKey)
{
    auto onKeyCallback = [onKey](ArkUI_NodeEvent* event) {
        if (onKey) {
            onKey(event);
        }
    };
    eventMap_[NODE_ON_KEY_EVENT] = onKeyCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_ON_KEY_EVENT, PARAM_0, _xcomponent);
}

// 注册触摸事件回调
void Component::RegisterOnTouch(const std::function<void(ArkUI_NodeEvent* event)>& onTouch)
{
    auto onTouchCallback = [onTouch](ArkUI_NodeEvent* event) {
        if (onTouch) {
            onTouch(event);
        }
    };
    eventMap_[NODE_TOUCH_EVENT] = onTouchCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_TOUCH_EVENT, PARAM_0, nullptr);
}

// 注册组件消失事件回调
void Component::RegisterOnDisappear(const std::function<void()>& onDisappear)
{
    auto onDisappearCallback = [onDisappear](ArkUI_NodeEvent*) {
        if (onDisappear) {
            onDisappear();
        }
    };
    eventMap_[NODE_EVENT_ON_DISAPPEAR] = onDisappearCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_EVENT_ON_DISAPPEAR, PARAM_0, nullptr);
}

// 注册组件出现事件回调
void Component::RegisterOnAppear(const std::function<void()>& onAppear)
{
    auto onAppearCallback = [onAppear](ArkUI_NodeEvent*) {
        if (onAppear) {
            onAppear();
        }
    };
    eventMap_[NODE_EVENT_ON_APPEAR] = onAppearCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_EVENT_ON_APPEAR, PARAM_0, nullptr);
}

// 注册悬停事件回调
void Component::RegisterOnHover(const std::function<void(bool isHover)>& onHover)
{
    auto onHoverCallback = [onHover](ArkUI_NodeEvent* event) {
        if (onHover) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "commonEvent", "NODE_ON_HOVER");
            // 解析事件数据
            ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
            int32_t isHover = result->data[PARAM_0].i32;
            onHover(static_cast<bool>(isHover));
        }
    };
    eventMap_[NODE_ON_HOVER] = onHoverCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_ON_HOVER, PARAM_0, nullptr);
}

// 注册鼠标事件回调
void Component::RegisterOnMouse(const std::function<void(ArkUI_NodeEvent* event)>& onMouse)
{
    auto onMouseCallback = [onMouse](ArkUI_NodeEvent* event) {
        if (onMouse) {
            onMouse(event);
        }
    };
    eventMap_[NODE_ON_MOUSE] = onMouseCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_ON_MOUSE, PARAM_0, nullptr);
}

// 注册触摸拦截事件回调
void Component::RegisterOnTouchIntercept(const std::function<void(ArkUI_NodeEvent* event)>& onTouchIntercept)
{
    auto onTouchInterceptCallback = [onTouchIntercept](ArkUI_NodeEvent* event) {
        if (onTouchIntercept) {
            onTouchIntercept(event);
        }
    };
    eventMap_[NODE_ON_TOUCH_INTERCEPT] = onTouchInterceptCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_ON_TOUCH_INTERCEPT, PARAM_0, nullptr);
}

// 注册焦点事件回调
void Component::RegisterOnFocus(const std::function<void()>& onFocus)
{
    auto onFocusCallback = [onFocus](ArkUI_NodeEvent*) {
        if (onFocus) {
            onFocus();
        }
    };
    eventMap_[NODE_ON_FOCUS] = onFocusCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_ON_FOCUS, PARAM_0, nullptr);
}

// 注册可视区域变化事件回调
void Component::RegisterOnVisibleAreaChange(
    const std::function<void(bool isVisible, float ratio)>& onVisibleAreaChange, std::vector<float> ratioArray)
{
    // 构造阈值数组
    ArkUI_NumberValue value[ratioArray.size()];
    for (size_t i = PARAM_0; i < ratioArray.size(); i++) {
        value[i].f32 = { ratioArray[i] };
    }
    ArkUI_AttributeItem item = { value, static_cast<int32_t>(ratioArray.size()) };

    auto onVisibleAreaChangeCallback = [onVisibleAreaChange](ArkUI_NodeEvent* event) {
        if (onVisibleAreaChange) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "commonEvent", "NODE_EVENT_ON_VISIBLE_AREA_CHANGE");
            // 解析可视区域事件数据
            ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
            bool visible = static_cast<bool>(result->data[PARAM_0].i32);
            float ratio = result->data[PARAM_1].f32;
            onVisibleAreaChange(visible, ratio);
        }
    };
    eventMap_[NODE_EVENT_ON_VISIBLE_AREA_CHANGE] = onVisibleAreaChangeCallback;
    // 注册事件并传递阈值参数
    _nodeAPI->registerNodeEvent(_component, NODE_EVENT_ON_VISIBLE_AREA_CHANGE, PARAM_0, &item);
}
} // namespace ArkUICapiTest