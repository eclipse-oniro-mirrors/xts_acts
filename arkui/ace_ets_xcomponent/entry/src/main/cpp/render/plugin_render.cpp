/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <cstdint>

#include "native_common.h"
#include "plugin_common.h"
#include "plugin_manager.h"
#include "plugin_render.h"

#ifdef __cplusplus
extern "C" {
#endif

std::unordered_map<std::string, PluginRender*> PluginRender::instance_;

OH_NativeXComponent_Callback PluginRender::callback_;

uint32_t PluginRender::isCreated_ = 0;
uint32_t PluginRender::xcHeight_ = 0;
uint32_t PluginRender::xcWidth_ = 0;
double PluginRender::off_x = 0;
double PluginRender::off_y = 0;
uint32_t PluginRender::toolType_ = 5;
uint32_t PluginRender::mousecallback_ = 0;
float PluginRender::tiltX_ = 0;
float PluginRender::tiltY_ = 0;
uint32_t PluginRender::touchType = 4;
int32_t three = 3;
int32_t eight = 8;
OH_NativeXComponent_TouchEvent PluginRender::testTouchEvent_;
OH_NativeXComponent_MouseEvent PluginRender::testMouseEvent_;
OH_NativeXComponent_MouseEvent_Callback PluginRender::mouseEventcallback_;

ArkUI_AccessibilityProvider* provider_ = nullptr;

void OnSurfaceCreatedCB(OH_NativeXComponent* component, void* window)
{
    LOGE("OnSurfaceCreatedCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->OnSurfaceCreated(component, window);
    
    PluginRender::GetInstance(id)->InterfaceDesignTest(component);
}

void OnSurfaceChangedCB(OH_NativeXComponent* component, void* window)
{
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->OnSurfaceChanged(component, window);
}

void OnSurfaceDestroyedCB(OH_NativeXComponent* component, void* window)
{
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->OnSurfaceDestroyed(component, window);
}

void DispatchTouchEventCB(OH_NativeXComponent* component, void* window)
{
    LOGE("DispatchTouchEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->DispatchTouchEvent(component, window);
}

void DispatchMouseEventCB(OH_NativeXComponent* component, void* window)
{
    LOGD("DispatchMouseEventCB");
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    ret = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return;
    }
    std::string id(idStr);
    auto render = PluginRender::GetInstance(id);
    render->DispatchMouseEvent(component, window);
}

PluginRender::PluginRender(std::string& id)
{
    id_ = id;
    component_ = nullptr;
    eglCore_ = new EGLCore(id);
    auto renderCallback = PluginRender::GetNXComponentCallback();
    renderCallback->OnSurfaceCreated = OnSurfaceCreatedCB;
    renderCallback->OnSurfaceChanged = OnSurfaceChangedCB;
    renderCallback->OnSurfaceDestroyed = OnSurfaceDestroyedCB;
    renderCallback->DispatchTouchEvent = DispatchTouchEventCB;
    auto renderMouseEventCallback = PluginRender::GetNXComponentMouseEventCallback();
    renderMouseEventCallback->DispatchMouseEvent = DispatchMouseEventCB;
}

PluginRender* PluginRender::GetInstance(std::string& id)
{
    if (instance_.find(id) == instance_.end()) {
        PluginRender*  instance = new PluginRender(id);
        instance_[id] = instance;
        return instance;
    } else {
        return instance_[id];
    }
}

OH_NativeXComponent_Callback* PluginRender::GetNXComponentCallback()
{
    return &PluginRender::callback_;
}

OH_NativeXComponent_MouseEvent_Callback* PluginRender::GetNXComponentMouseEventCallback()
{
    return &PluginRender::mouseEventcallback_;
}

void PluginRender::SetNativeXComponent(OH_NativeXComponent* component)
{
    component_ = component;
    OH_NativeXComponent_RegisterCallback(component_, &PluginRender::callback_);
    uint32_t mousecallback = OH_NativeXComponent_RegisterMouseEventCallback(component_,
        &PluginRender::mouseEventcallback_);
    mousecallback_ = mousecallback;
}

void PluginRender::OnSurfaceCreated(OH_NativeXComponent* component, void* window)
{
    LOGE("xclog PluginRender::OnSurfaceCreated");

    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);

    LOGE("xclog Offset : x = %{public}f, y = %{public}f ", x_, y_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        eglCore_->GLContextInit(window, width_, height_);
        isCreated_++;
        xcHeight_ = height_;
        xcWidth_ = width_;

        LOGE("xclog PluginRender::OnSurfaceCreated success ");
        LOGE("xclog PluginRender::OnSurfaceCreated iscreated %{public}d", isCreated_);
    } else {
        LOGE("xclog PluginRender::OnSurfaceCreated failed");
    }
}

void PluginRender::OnSurfaceChanged(OH_NativeXComponent* component, void* window)
{
    LOGE("PluginRender::OnSurfaceChanged");
    int32_t ret = OH_NativeXComponent_GetXComponentSize(component, window, &width_, &height_);
    int32_t ret1;
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        xcHeight_ = height_;
        xcWidth_ = width_;
        LOGE("xclog after width = %{public}d, height = %{public}d", xcWidth_, xcHeight_);
        ret1= OH_NativeXComponent_GetXComponentOffset(component, window, &x_, &y_);
        off_x = x_;
        off_y = y_;

        if (ret1 == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
            LOGE("xclog Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
        } else {
            LOGE("xclog Offset get failed");
        }

        LOGE("xclog PluginRender::GetOffset ");
        LOGE("xclog Offset : x = %{public}lf, y = %{public}lf ", off_x, off_y);
    }
}

void PluginRender::OnSurfaceDestroyed(OH_NativeXComponent* component, void* window)
{
    LOGE("xclog PluginRender::OnSurfaceDestroyed");
    isCreated_--;
    LOGE("xclog PluginRender::OnSurfaceDestroyed iscreated %{public}d", isCreated_);
}

void PluginRender::DispatchTouchEvent(OH_NativeXComponent* component, void* window)
{
    int32_t ret = OH_NativeXComponent_GetTouchEvent(component, window, &touchEvent_);
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        testTouchEvent_ = touchEvent_;
        LOGE("Touch Info : x = %{public}f, y = %{public}f screenx = %{public}f, screeny = %{public}f",
            touchEvent_.x, touchEvent_.y, touchEvent_.screenX, touchEvent_.screenY);
        for (uint32_t i = 0; i < touchEvent_.numPoints; i++) {
            LOGE("Touch Info : dots[%{public}d] id %{public}d x = %{public}f, y = %{public}f", i,
                touchEvent_.touchPoints[i].id, touchEvent_.touchPoints[i].x, touchEvent_.touchPoints[i].y);
            LOGE("Touch Info : screenx = %{public}f, screeny = %{public}f",
                touchEvent_.touchPoints[i].screenX, touchEvent_.touchPoints[i].screenY);
            OH_NativeXComponent_TouchPointToolType toolType = OH_NativeXComponent_TouchPointToolType::OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN;
            float tiltX = 123.0;
            float tiltY = 321.0;
            [[maybe_unused]] int32_t ret1;
            [[maybe_unused]] int32_t ret2;
            [[maybe_unused]] int32_t ret3;
            ret1 = OH_NativeXComponent_GetTouchPointToolType(component, i, &toolType);
            ret2 = OH_NativeXComponent_GetTouchPointTiltX(component, i, &tiltX);
            ret3 = OH_NativeXComponent_GetTouchPointTiltY(component, i, &tiltY);
            toolType_ = toolType;
            tiltX_ = tiltX;
            tiltY_ = tiltY;
            LOGE("Touch Info : DispatchTouchEvent dots[%{public}d] toolType=%{public}u, tiltX=%{public}f, tiltY=%{public}f",
                i, toolType, tiltX, tiltY);
        }
    } else {
        LOGE("Touch fail");
    }
}

void FillElementInfo1(ArkUI_AccessibilityElementInfo* elementInfo)
{
    if (elementInfo == nullptr) {
        LOGI("FillElementInfo1 elementInfo1 is null");
        return;
    }
    //1.
    ArkUI_AccessibleRect rect = { 0, 0, 1000, 1000 };
    OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, &rect);
    //2.
    int32_t size = 2;
    ArkUI_AccessibleAction actions[size];
    actions[0].actionType =
        ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLEAR_ACCESSIBILITY_FOCUS;
    actions[0].description = "nativeAce";
    actions[1].actionType =
        ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_GAIN_ACCESSIBILITY_FOCUS;
    actions[1].description = "nativeAce";
    OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo, size, actions);
    //3.
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(elementInfo, "yes");
    //4.
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityGroup(elementInfo, false);
    //5.
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityText(elementInfo, "FillElementInfo1Text");
    //6.
    //7.
    OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, "root");
    //8.
    OH_ArkUI_AccessibilityElementInfoSetFocusable(elementInfo, true);
    //9.
    const int32_t kInvalidParentId = 2100000;
    OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, -kInvalidParentId);
    //10.
    OH_ArkUI_AccessibilityElementInfoSetVisible(elementInfo, true);
    //11.
    OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, 0);
    
    // 12.
    int64_t childNodeIds[3] =  {1, 2, 3};
    const int32_t CHILD_NODE_COUNT = 3;
    OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, CHILD_NODE_COUNT, childNodeIds);
    
    //13.
    OH_ArkUI_AccessibilityElementInfoSetEnabled(elementInfo, true);
    OH_ArkUI_AccessibilityElementInfoSetClickable(elementInfo, true);
    OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, "root_content");
    OH_ArkUI_AccessibilityElementInfoSetCheckable(elementInfo, true);
    OH_ArkUI_AccessibilityElementInfoSetChecked(elementInfo, true);
}


void setElementInfo(ArkUI_AccessibilityElementInfo* elementInfo, int32_t i)
{
    int32_t x = 0;
    int32_t y = (i < 4)?(x + (i -1) * 500) : (x + (i -4) * 100);
    double min = 0.0;
    double max = 100.0;
    double current = 50.0;
    int32_t rowCount = 10;
    int32_t columnCount = 10;
    int32_t selectionMode = 0;
    int32_t columnIndex = 0;
    int32_t rowIndex = 0;
    int32_t columnSpan = 0;
    int32_t rowSpan = 0;
    ArkUI_AccessibleRangeInfo rangeInfo = { min, max, current };
    ArkUI_AccessibleGridInfo gridInfo = { rowCount, columnCount, selectionMode };
    ArkUI_AccessibleGridItemInfo gridItemInfo = { false, false, columnIndex, rowIndex, columnSpan, rowSpan};
    OH_ArkUI_AccessibilityElementInfoSetHintText(elementInfo, "hinttext");
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityDescription(elementInfo, "AccessibilityDescription");
    OH_ArkUI_AccessibilityElementInfoSetFocused(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetSelected(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetLongClickable(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetIsPassword(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetScrollable(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetEditable(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetIsHint(elementInfo, false);
    OH_ArkUI_AccessibilityElementInfoSetRangeInfo(elementInfo, &rangeInfo);
    OH_ArkUI_AccessibilityElementInfoSetGridInfo(elementInfo, &gridInfo);
    OH_ArkUI_AccessibilityElementInfoSetGridItemInfo(elementInfo, &gridItemInfo);
    OH_ArkUI_AccessibilityElementInfoSetSelectedTextStart(elementInfo, x);
    OH_ArkUI_AccessibilityElementInfoSetSelectedTextEnd(elementInfo, y);
    OH_ArkUI_AccessibilityElementInfoSetCurrentItemIndex(elementInfo, x);
    OH_ArkUI_AccessibilityElementInfoSetStartItemIndex(elementInfo, x);
    OH_ArkUI_AccessibilityElementInfoSetEndItemIndex(elementInfo, y);
    OH_ArkUI_AccessibilityElementInfoSetItemCount(elementInfo, rowCount * columnCount);
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityOffset(elementInfo, rowCount);
    OH_ArkUI_AccessibilityElementInfoSetZIndex(elementInfo, x);
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityOpacity(elementInfo, min);
    OH_ArkUI_AccessibilityElementInfoSetBackgroundColor(elementInfo, "red");
    OH_ArkUI_AccessibilityElementInfoSetBackgroundImage(elementInfo, "app.media.icon");
    OH_ArkUI_AccessibilityElementInfoSetBlur(elementInfo, "blur");
    OH_ArkUI_AccessibilityElementInfoSetHitTestBehavior(elementInfo, "default");
    return;
}

void FillElementInfo2(ArkUI_AccessibilityElementInfo* elementInfo, int32_t i)
{
    if (elementInfo == nullptr) {
        LOGI("FillElementInfo1 elementInfo1 is null");
        return;
    }
    //1.
    int32_t x = 0;
    int32_t y = (i < 4)?(x + (i -1) * 500) : (x + (i -4) * 100);
    int32_t zx = x + ((i < 4)? 500 : 100);
    int32_t zy = y + ((i < 4)? 500 : 100);
    ArkUI_AccessibleRect rect = { x, y, zx, zy };
    OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, &rect);
    //2.
    int32_t size = 3;
    ArkUI_AccessibleAction actions[size];
    actions[0].actionType =
        ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLEAR_ACCESSIBILITY_FOCUS;
    actions[0].description = "ace";
    actions[1].actionType =
        ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_GAIN_ACCESSIBILITY_FOCUS;
    actions[1].description = "ace";
    const int32_t second = 2;
    actions[second].actionType =
        ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLICK;
    actions[second].description = "ace";
    setElementInfo(elementInfo, i);
    OH_ArkUI_AccessibilityElementInfoSetOperationActions(elementInfo, size, actions);
    //3.
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(elementInfo, "yes");
    //4.
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityGroup(elementInfo, false);
    //5.
    std::string text = "FillElementInfo222Text_" + std::to_string(i);
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityText(elementInfo, text.c_str());
    //6.
    //7.
    const int32_t two = 2;
    if (i % two == 0) {
        OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, "button");
    } else {
        OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, "text");
    }
}

void ExtractFunction(ArkUI_AccessibilityElementInfo* elementInfo, int32_t i)
{
    //8.
    OH_ArkUI_AccessibilityElementInfoSetFocusable(elementInfo, true);
    //9.
    const int32_t kNoParent = 0;
    const int32_t kHasParent = 1;
    const int32_t four = 4;
    OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, i < four? kNoParent : kHasParent);
    //10.
    OH_ArkUI_AccessibilityElementInfoSetVisible(elementInfo, true);
    //11.
    OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, i);
    //12.
    OH_ArkUI_AccessibilityElementInfoSetEnabled(elementInfo, true);

    if (i == 1) {
        int64_t childNodeIds[6] =  {4, 5, 6, 7, 8, 9};
        const int32_t NUMBER_OF_CHILDREN = 6;
        OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, NUMBER_OF_CHILDREN, childNodeIds);
    }
    OH_ArkUI_AccessibilityElementInfoSetClickable(elementInfo, true);
    std::string ss;
    ss.append("contenttest_").append(std::to_string(i));
    OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, ss.c_str());
    
    OH_ArkUI_AccessibilityElementInfoSetCheckable(elementInfo, true);
    OH_ArkUI_AccessibilityElementInfoSetChecked(elementInfo, true);
}

int32_t FindAccessibilityNodeInfosById(int64_t elementId, ArkUI_AccessibilitySearchMode mode,
    int32_t requestId, ArkUI_AccessibilityElementInfoList* elementList)
{
    if (elementList == nullptr) {
        LOGI("FindAccessibilityNodeInfosById elementList is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    // 传第一个info
    ArkUI_AccessibilityElementInfo* elementInfo = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
    if (elementInfo == nullptr) {
        LOGI("FindAccessibilityNodeInfosById elementInfo1 is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    if (mode == eight) {
        FillElementInfo1(elementInfo);
        const int32_t AccessibilityStartIndex = 1;
        const int32_t AccessibilityEndIndex = 10;
        for (int32_t i = AccessibilityStartIndex; i< AccessibilityEndIndex; i++) {
            ArkUI_AccessibilityElementInfo* elementInfox = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
            if (elementInfox == nullptr) {
                LOGI("FindAccessibilityNodeInfosById elementInfox is null");
                return OH_NATIVEXCOMPONENT_RESULT_FAILED;
            }
            FillElementInfo2(elementInfox, i);
        }
    } else if (elementId == 0) {
        FillElementInfo1(elementInfo);
    } else if (elementId == -1) {
        FillElementInfo1(elementInfo);
    } else {
        FillElementInfo2(elementInfo, static_cast<int32_t>(elementId));
    }
    
    LOGI("FindAccessibilityNodeInfosById end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t FindAccessibilityNodeInfosByText(int64_t elementId, const char* text, int32_t requestId,
                                         ArkUI_AccessibilityElementInfoList* elementList)
{
    LOGI("FindAccessibilityNodeInfosByText start,requestId: %{public}d, text: %{public}s",
         requestId, text);
    if (elementList == nullptr) {
        LOGI("FindAccessibilityNodeInfosByText elementInfo is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    // 传第一个info
    ArkUI_AccessibilityElementInfo* elementInfo1 = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
    if (elementInfo1 == nullptr) {
        LOGI("FindFocusedAccessibilityNode elementInfo1 is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    int32_t two = 2;
    FillElementInfo2(elementInfo1, two);
    
    // 传第二个info
    ArkUI_AccessibilityElementInfo* elementInfo2 = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
    if (elementInfo2 == nullptr) {
        LOGI("FindFocusedAccessibilityNode elementInfo2 is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    FillElementInfo2(elementInfo2, three);

    LOGI("FindAccessibilityNodeInfosByText end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t FindFocusedAccessibilityNode(int64_t elementId, ArkUI_AccessibilityFocusType focusType, int32_t requestId,
                                     ArkUI_AccessibilityElementInfo* elementInfo)
{
    LOGI("FindFocusedAccessibilityNode start,requestId: %{public}d, focusType: %{public}d",
        requestId, static_cast<int32_t>(focusType));
    if (elementInfo == nullptr) {
        LOGI("FindFocusedAccessibilityNode elementInfo is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    const int32_t four = 4;
    OH_ArkUI_DestoryAccessibilityElementInfo(elementInfo);
    FillElementInfo2(elementInfo, four);

    LOGI("FindFocusedAccessibilityNode end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t FindNextFocusAccessibilityNode(int64_t elementId, ArkUI_AccessibilityFocusMoveDirection direction,
                                       int32_t requestId, ArkUI_AccessibilityElementInfo* elementInfo)
{
    LOGI(
        "FindNextFocusAccessibilityNode start,requestId: %{public}d, direction: %{public}d",
        requestId, static_cast<int32_t>(direction));
    if (elementInfo == nullptr) {
        LOGI("FindNextFocusAccessibilityNode elementInfo is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    const int32_t CHILD_NODE_COUNT = 5;
    FillElementInfo2(elementInfo, CHILD_NODE_COUNT);
    LOGI("FindNextFocusAccessibilityNode end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

void FillEvent(ArkUI_AccessibilityEventInfo* eventInfo, ArkUI_AccessibilityElementInfo* elementInfo)
{
    if (eventInfo == nullptr) {
        LOGI("FillEvent eventInfo is null");
        return;
    }
    int32_t x = 0;
    OH_ArkUI_AccessibilityEventSetRequestFocusId(eventInfo, x);
    OH_ArkUI_AccessibilityEventSetTextAnnouncedForAccessibility(eventInfo, "TextAnnounced");
    OH_ArkUI_AccessibilityEventSetEventType(eventInfo,
        ArkUI_AccessibilityEventType::ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ACCESSIBILITY_FOCUSED);
    
    OH_ArkUI_AccessibilityEventSetElementInfo(eventInfo, elementInfo);
}

void SendAccessibilityAsyncEvent(int64_t elementId, bool accessibilityFocus)
{
    if (provider_ == nullptr) {
        LOGI("OH_ArkUI_SendAccessibilityAsyncEvent provider is null");
        return;
    }
    // 1.调用CreateArkUI_AccessibilityEventInfo创建ArkUI_AccessibilityEventInfo对象
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    if (eventInfo == nullptr) {
        LOGI("OH_ArkUI_SendAccessibilityAsyncEvent eventInfo is null");
        return;
    }
    
    ArkUI_AccessibilityElementInfo* elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    if (elementInfo == nullptr) {
        LOGI("OH_ArkUI_SendAccessibilityAsyncEvent elementInfo is null");
        return;
    }
    // 2.为info赋值
    FillElementInfo2(elementInfo, static_cast<int32_t>(elementId));
    OH_ArkUI_AccessibilityElementInfoSetAccessibilityFocused(elementInfo, accessibilityFocus);
    FillEvent(eventInfo, elementInfo);
    // 3.callack
    auto callback = [](int32_t errorCode) {
        LOGI("errorCode: %{public}d", errorCode);
    };
    // 4.调用接口发给OH侧
    LOGI("OH_ArkUI_SendAccessibilityAsyncEvent doing");
    OH_ArkUI_SendAccessibilityAsyncEvent(provider_, eventInfo, callback);
    // 销毁info
    OH_ArkUI_DestoryAccessibilityEventInfo(eventInfo);
};

int32_t ExecuteAccessibilityAction(int64_t elementId, ArkUI_Accessibility_ActionType action,
    ArkUI_AccessibilityActionArguments *actionArguments, int32_t requestId)
{
    LOGI("ExecuteAccessibilityAction start,requestId: %{public}d, action: %{public}d",
        requestId, static_cast<int32_t>(action));
    if (actionArguments == nullptr) {
        LOGI("ExecuteAccessibilityAction actionArguments is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    std::string key = "key1";
    char* value;
    OH_ArkUI_FindAccessibilityActionArgumentByKey(actionArguments, key.c_str(), &value);
    if (value == nullptr) {
        LOGI("ExecuteAccessibilityAction value is null");
    } else {
        LOGI("ExecuteAccessibilityAction 11111 value : %{public}s", value);
    }
    bool accessibilityFocu = (action == 64);
    SendAccessibilityAsyncEvent(elementId, accessibilityFocu);

    LOGI("ExecuteAccessibilityAction end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t ClearFocusedFocusAccessibilityNode()
{
    LOGI("ClearFocusedFocusAccessibilityNode ");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t GetAccessibilityNodeCursorPosition(int64_t elementId, int32_t requestId, int32_t* index)
{
    const int32_t cursorPosition = 17805;
    *index = cursorPosition;
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

void PluginRender::InterfaceDesignTest(OH_NativeXComponent* nativeXComponent)
{
    LOGI("InterfaceDesignTest start");
    if (nativeXComponent == nullptr) {
        LOGI("InterfaceDesignTest nativeXComponent is null");
        return;
    }
    
    //1.获得provider实例
    int32_t ret = OH_NativeXComponent_GetNativeAccessibilityProvider(nativeXComponent, &provider_);
    if (provider_ == nullptr) {
        LOGI("InterfaceDesignTest get provider is null");
        return;
    }
    
    accessibilityProviderCallbacks_ = new ArkUI_AccessibilityProviderCallbacks();
    accessibilityProviderCallbacks_->findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById;
    accessibilityProviderCallbacks_->findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText;
    accessibilityProviderCallbacks_->findFocusedAccessibilityNode = FindFocusedAccessibilityNode;
    accessibilityProviderCallbacks_->findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode;
    accessibilityProviderCallbacks_->executeAccessibilityAction = ExecuteAccessibilityAction;
    accessibilityProviderCallbacks_->clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode;
    accessibilityProviderCallbacks_->getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition;
    ret = OH_ArkUI_AccessibilityProviderRegisterCallback(provider_, accessibilityProviderCallbacks_);
    if (ret != 0) {
        LOGI("InterfaceDesignTest OH_ArkUI_AccessibilityProviderRegisterCallback failed");
        return;
    }
}

napi_value PluginRender::Export(napi_env env, napi_value exports)
{
    LOGE("PluginRender::Export");
    // Register JS API
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("changeShape", PluginRender::NapiChangeShape),
        DECLARE_NAPI_FUNCTION("drawTriangle", PluginRender::NapiDrawTriangle),
        DECLARE_NAPI_FUNCTION("changeColor", PluginRender::NapiChangeColor),
        DECLARE_NAPI_FUNCTION("TestGetXComponentId", PluginRender::TestGetXComponentId),
        DECLARE_NAPI_FUNCTION("TestOnSurfaceCreated", PluginRender::TestOnSurfaceCreated),
        DECLARE_NAPI_FUNCTION("TestGetXComponentSize_Height", PluginRender::TestGetXComponentSize_Height),
        DECLARE_NAPI_FUNCTION("TestGetXComponentSize_Width", PluginRender::TestGetXComponentSize_Width),
        DECLARE_NAPI_FUNCTION("TestGetXComponentOffset_x", PluginRender::TestGetXComponentOffset_x),
        DECLARE_NAPI_FUNCTION("TestGetXComponentOffset_y", PluginRender::TestGetXComponentOffset_y),
        DECLARE_NAPI_FUNCTION("TestGetXComponent_TouchEvent", PluginRender::TestGetXComponent_TouchEvent),
        DECLARE_NAPI_FUNCTION("TestGetXComponent_MouseEvent", PluginRender::TestGetXComponent_MouseEvent),
        DECLARE_NAPI_FUNCTION("TestGetXComponentpointtool_tilty", PluginRender::TestGetXComponentpointtool_tilty),
        DECLARE_NAPI_FUNCTION("TestGetXComponentpointtool_type", PluginRender::TestGetXComponentpointtool_type),
        DECLARE_NAPI_FUNCTION("TestGetXComponentpointtool_tiltx", PluginRender::TestGetXComponentpointtool_tiltx),
        DECLARE_NAPI_FUNCTION("TestGetXComponent_RegisterMouseEventCallback",
            PluginRender::TestGetXComponent_RegisterMouseEventCallback),
        
        DECLARE_NAPI_FUNCTION("TestXComponentFindAccessibilityNodeInfosById",
            PluginRender::TestXComponentFindAccessibilityNodeInfosById),
        DECLARE_NAPI_FUNCTION("TestXComponentFindAccessibilityNodeInfosByText",
            PluginRender::TestXComponentFindAccessibilityNodeInfosByText),
        DECLARE_NAPI_FUNCTION("TestXComponentFindFocusedAccessibilityNode",
            PluginRender::TestXComponentFindFocusedAccessibilityNode),
        DECLARE_NAPI_FUNCTION("TestXComponentFindNextFocusAccessibilityNode",
            PluginRender::TestXComponentFindNextFocusAccessibilityNode),
        DECLARE_NAPI_FUNCTION("TestXComponentSendAccessibilityAsyncEvent",
            PluginRender::TestXComponentSendAccessibilityAsyncEvent),
        DECLARE_NAPI_FUNCTION("TestXComponentExecuteAccessibilityAction",
            PluginRender::TestXComponentExecuteAccessibilityAction),
        DECLARE_NAPI_FUNCTION("TestXComponentClearFocusedFocusAccessibilityNode",
            PluginRender::TestXComponentClearFocusedFocusAccessibilityNode),
        DECLARE_NAPI_FUNCTION("TestXComponentGetAccessibilityNodeCursorPosition",
            PluginRender::TestXComponentGetAccessibilityNodeCursorPosition),

    };
    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc));
    return exports;
}

napi_value PluginRender::TestXComponentFindAccessibilityNodeInfosById(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentFindAccessibilityNodeInfosByText(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentFindFocusedAccessibilityNode(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentFindNextFocusAccessibilityNode(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentSendAccessibilityAsyncEvent(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentExecuteAccessibilityAction(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentClearFocusedFocusAccessibilityNode(napi_env env, napi_callback_info info)
{
    return nullptr;
}

napi_value PluginRender::TestXComponentGetAccessibilityNodeCursorPosition(napi_env env, napi_callback_info info)
{
    return nullptr;
}

void PluginRender::DispatchMouseEvent(OH_NativeXComponent* component, void* window)
{
    LOGE("----------TestMouse Mouse Info DispatchMouseEvent 11");
    int32_t ret = OH_NativeXComponent_GetMouseEvent(component, window, &mouseEvent_);
    LOGE("----------TestMouse Mouse Info DispatchMouseEvent");
    if (ret == OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        testMouseEvent_ = mouseEvent_;
        LOGE("TestMouse Mouse Info : x = %{public}f, y = %{public}f screenx = %{public}f, screeny = %{public}f",
            mouseEvent_.x, mouseEvent_.y, mouseEvent_.screenX, mouseEvent_.screenY);
        LOGE("TestMouse Mouse Info : action = %{public}d, button = %{public}d", mouseEvent_.action, mouseEvent_.button);
    } else {
        LOGE("Mouse Info fail");
    }
}

napi_value PluginRender::NapiChangeShape(napi_env env, napi_callback_info info)
{
    LOGE("NapiChangeShape");
    napi_value exportInstance;
    napi_value thisArg;
    [[maybe_unused]] napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* instance = PluginRender::GetInstance(id);
    if (instance) {
        instance->eglCore_->ChangeShape();
    }
    return nullptr;
}

napi_value PluginRender::NapiDrawTriangle(napi_env env, napi_callback_info info)
{
    LOGE("NapiDrawTriangle");
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* instance = PluginRender::GetInstance(id);
    if (instance) {
        instance->eglCore_->DrawTriangle();
    }
    return nullptr;
}

napi_value PluginRender::NapiChangeColor(napi_env env, napi_callback_info info)
{
    LOGE("NapiChangeColor");
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    }

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* instance = PluginRender::GetInstance(id);
    if (instance) {
        instance->eglCore_->ChangeColor();
    }
    return nullptr;
}

napi_value PluginRender::TestGetXComponentId(napi_env env, napi_callback_info info)
{
    napi_value thisArg;
    [[maybe_unused]] napi_status status;
    napi_value exportInstance;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    NAPI_CALL(env, napi_get_cb_info(env, info, NULL, NULL, &thisArg, NULL));
    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    };

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return nullptr;
    }

    std::string id(idStr);

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, idStr, id.length(), &output));

    return output;
}

napi_value PluginRender::TestOnSurfaceCreated(napi_env env, napi_callback_info info)
{
    LOGE("xclog iscreated instance.size ");

    napi_value output;
    NAPI_CALL(env, napi_get_boolean(env, isCreated_ == instance_.size(), &output));
    LOGE("xclog iscreated instance.size ");

    return output;
}

napi_value PluginRender::TestGetXComponentSize_Height(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentSize_Height");
    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, xcHeight_, &output));
    LOGE("xclog  TestGetXComponentSize_Height %{public}d ", xcHeight_);
    return output;
}

napi_value PluginRender::TestGetXComponentSize_Width(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentSize_Width");
    napi_value output;
    NAPI_CALL(env, napi_create_uint32(env, xcWidth_, &output));
    LOGE("xclog  TestGetXComponentSize_Width %{public}d ", xcWidth_);
    return output;
}

napi_value PluginRender::TestGetXComponentOffset_x(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentOffset_x");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, off_x, &output));
    LOGE("xclog TestGetXComponentOffset_x : %{public}f", off_x);

    return output;
}

napi_value PluginRender::TestGetXComponentOffset_y(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentOffset_y");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, off_y, &output));
    LOGE("xclog TestGetXComponentOffset_y : %{public}f", off_y);

    return output;
}

napi_value PluginRender::TestGetXComponentpointtool_tiltx(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentpointtool_tiltx");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, tiltX_, &output));
    LOGE("xclog TestGetXComponentpointtool_tiltx : %{public}f", tiltX_);

    return output;
}

napi_value PluginRender::TestGetXComponentpointtool_tilty(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentpointtool_tilty");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, tiltY_, &output));
    LOGE("xclog TestGetXComponentpointtool_tilty : %{public}f", tiltY_);

    return output;
}

napi_value PluginRender::TestGetXComponentpointtool_type(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponentpointtool_type");

    napi_value output;
    NAPI_CALL(env, napi_create_double(env, toolType_, &output));
    LOGE("xclog TestGetXComponentpointtool_type : %{public}u", toolType_);

    return output;
}

napi_value PluginRender::TestGetXComponent_TouchEvent(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponent_TouchEvent");

    napi_value surf_x;
    napi_value surf_y;
    napi_value t_type;

    NAPI_CALL(env, napi_create_double(env, testTouchEvent_.x, &(surf_x)));
    NAPI_CALL(env, napi_create_double(env, testTouchEvent_.y, &(surf_y)));
    NAPI_CALL(env, napi_create_uint32(env, testTouchEvent_.type, &(t_type)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_X", surf_x));  // float x
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_Y", surf_y));  // float y
    NAPI_CALL(env, napi_set_named_property(env, obj, "touchType", t_type));  // int32_t

    return obj;
}

napi_value PluginRender::TestGetXComponent_MouseEvent(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponent_MouseEvent");

    napi_value surf_x;
    napi_value surf_y;
    napi_value t_button;

    NAPI_CALL(env, napi_create_double(env, testMouseEvent_.x, &(surf_x)));
    NAPI_CALL(env, napi_create_double(env, testMouseEvent_.y, &(surf_y)));
    NAPI_CALL(env, napi_create_uint32(env, testMouseEvent_.button, &(t_button)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_X1", surf_x));  // float x
    NAPI_CALL(env, napi_set_named_property(env, obj, "surface_Y1", surf_y));  // float y
    NAPI_CALL(env, napi_set_named_property(env, obj, "mousebutton", t_button));  // int32_t

    return obj;
}


napi_value PluginRender::TestGetXComponent_RegisterMouseEventCallback(napi_env env, napi_callback_info info)
{
    LOGE("xclog running PluginRender::TestGetXComponent_RegisterMouseEventCallback");

    napi_value callback_;
    NAPI_CALL(env, napi_create_double(env, mousecallback_, &(callback_)));

    napi_value obj;
    NAPI_CALL(env, napi_create_object(env, &obj));
    NAPI_CALL(env, napi_set_named_property(env, obj, "MouseCallback_", callback_));  // float x

    return obj;
}

#ifdef __cplusplus
}
#endif