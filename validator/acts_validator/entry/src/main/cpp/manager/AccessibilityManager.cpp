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

#include <arkui/native_interface_accessibility.h>
#include "common/common.h"
#include "AccessibilityManager.h"
#include <cassert>
#include <string>
class AccessibleObject {
public:
    AccessibleObject(const std::string &name) : name_(name), originName_(name) {}
    void SetFocus(bool focus) { focus_ = focus; }
    void SetName(const std::string &name) { name_ = name; }
    bool Focused() const { return focus_; }
    virtual bool Focusable() const { return true; }
    std::string Name() const { return name_; }
    std::string OriginName() const { return originName_; }

    virtual const char *ObjectType() const { return "object"; }
    virtual const char *Hint() const { return "It's object"; }

    virtual void onClick() {}
    virtual bool Clickable() const { return false; }

    void fillAccessibilityElement(ArkUI_AccessibilityElementInfo *element) {
        OH_ArkUI_AccessibilityElementInfoSetComponentType(element, ObjectType());
        OH_ArkUI_AccessibilityElementInfoSetContents(element, Name().data());
        OH_ArkUI_AccessibilityElementInfoSetHintText(element, Hint());
        OH_ArkUI_AccessibilityElementInfoSetVisible(element, true);

        OH_ArkUI_AccessibilityElementInfoSetEnabled(element, true);

        OH_ArkUI_AccessibilityElementInfoSetClickable(element, Clickable());
        OH_ArkUI_AccessibilityElementInfoSetFocusable(element, Focusable());
        OH_ArkUI_AccessibilityElementInfoSetFocused(element, Focused());
        OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(element, "yes");

        //         OH_ArkUI_AccessibilityElementInfoSetClickable(element, true);
        //         OH_ArkUI_AccessibilityElementInfoSetFocusable(element, true);
        //         OH_ArkUI_AccessibilityElementInfoSetFocused(element, true);

        ArkUI_AccessibleAction actions[10];
        int index = 0;
        if (this->Clickable()) {
            actions[index].actionType = ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLICK;
            actions[index].description = "Click";
            index++;
        }

        if (this->Focusable()) {
            actions[index].actionType = ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_GAIN_ACCESSIBILITY_FOCUS;
            actions[index].description = "Focus";
            index++;
            actions[index].actionType = ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLEAR_ACCESSIBILITY_FOCUS;
            actions[index].description = "ClearFocus";
            index++;
        }
        if (index > 0) {
            OH_ArkUI_AccessibilityElementInfoSetOperationActions(element, index, actions);
        }
    }

private:
    bool focus_ = false;
    std::string name_;
    std::string originName_;
};

class FakeButton : public AccessibleObject {
public:
    FakeButton(const std::string &name) : AccessibleObject(name) {}
    const char *Hint() const { return "It's a button"; }
    virtual const char *ObjectType() const { return "QButton"; }
    virtual void onClick() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AccessibleObject", "FakeButton onClick");
    }
    virtual bool Clickable() const { return true; }
};

class FakeText : public AccessibleObject {
public:
    FakeText(const std::string &name) : AccessibleObject(name) {}

    const char *Hint() const { return "It's a text"; }
    virtual const char *ObjectType() const { return "QText"; }
    virtual void onClick() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AccessibleObject", "FakeText onClick");
    }
    virtual bool Clickable() const { return false; }
};


class FakeWidget : public AccessibleObject {
public:
    static FakeWidget &instance() {
        static FakeWidget w;
        return w;
    }

    const std::vector<AccessibleObject *> &getAllObjects(std::string instanceId) const {
        for (int i = 0; i < objects.size(); i++) {
            objects[i]->SetName(objects[i]->OriginName() + instanceId);
        }
        return objects;
    }

    AccessibleObject *getChild(int elementId) const {
        if (elementId <= 0) {
            return nullptr;
        }
        if (elementId - 1 >= objects.size()) {
            return nullptr;
        }
        return objects.at(elementId - 1);
    }

    virtual bool Focusable() const { return false; }
    virtual const char *Hint() const { return "It's a widget"; }
    virtual const char *ObjectType() const { return "QWidget"; }
    virtual void onClick() {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AccessibleObject", "FakeWidget onClick");
    }

private:
    FakeWidget() : AccessibleObject("fakeWidget") {
        this->AddButton();
        this->AddButton();
        this->AddButton();
        this->AddText();
        this->AddText();
        this->AddText();
    }
    ~FakeWidget() {
        for (auto &obj : objects) {
            delete obj;
        }
    }

private:
    void AddButton() {
        static int i = 1;
        objects.push_back(new FakeButton("button" + std::to_string(i)));
        i++;
    }
    void AddText() {
        static int i = 1;
        objects.push_back(new FakeText("text" + std::to_string(i)));
        i++;
    }

private:
    std::vector<AccessibleObject *> objects;
};

const char *LOG_PRINT_TEXT = "AccessibilityManager";
namespace NativeXComponentSample {
void FillEvent(ArkUI_AccessibilityEventInfo *eventInfo, ArkUI_AccessibilityElementInfo *elementInfo,
               ArkUI_AccessibilityEventType eventType) {
    if (eventInfo == nullptr) {
        return;
    }
    if (elementInfo == nullptr) {
        return;
    }
    OH_ArkUI_AccessibilityEventSetEventType(eventInfo, eventType);

    OH_ArkUI_AccessibilityEventSetElementInfo(eventInfo, elementInfo);
}


ArkUI_AccessibilityProvider *g_provider = nullptr;

void AccessibilityManager::SendAccessibilityAsyncEvent(ArkUI_AccessibilityElementInfo *elementInfo,
                                                       ArkUI_AccessibilityEventType eventType) {

    auto eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();

    // 1.填写event内容
    FillEvent(eventInfo, elementInfo, eventType);
    // 2.callback
    auto callback = [](int32_t errorCode) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "result: %{public}d", errorCode);
    };
    // 3. 调用接口发送事件给OH侧
    OH_ArkUI_SendAccessibilityAsyncEvent(g_provider, eventInfo, callback);
}

AccessibilityManager::AccessibilityManager() {
    accessibilityProviderCallbacksWithInstance_.findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById;
    accessibilityProviderCallbacksWithInstance_.findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText;
    accessibilityProviderCallbacksWithInstance_.findFocusedAccessibilityNode = FindFocusedAccessibilityNode;
    accessibilityProviderCallbacksWithInstance_.findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode;
    accessibilityProviderCallbacksWithInstance_.executeAccessibilityAction = ExecuteAccessibilityAction;
    accessibilityProviderCallbacksWithInstance_.clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode;
    accessibilityProviderCallbacksWithInstance_.getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition;
}

void AccessibilityManager::Initialize(const std::string &id, OH_NativeXComponent *nativeXComponent) {

    int32_t ret = OH_NativeXComponent_GetNativeAccessibilityProvider(nativeXComponent, &provider);

    if (provider == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "get provider is null");
        return;
    }

    // 2.注册回调函数
    //     ret = OH_ArkUI_AccessibilityProviderRegisterCallback(provider, &accessibilityProviderCallbacks_);
    ret = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(id.c_str(), provider,
                                                                     &accessibilityProviderCallbacksWithInstance_);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                     "InterfaceDesignTest OH_ArkUI_AccessibilityProviderRegisterCallback failed");
        return;
    }
    g_provider = provider;
}

void FillElementInfo1(ArkUI_AccessibilityElementInfo* elementInfo)
{
    if(elementInfo == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FillElementInfo1 elementInfo1 is null");
        return;
    }
    //1.
    ArkUI_AccessibleRect rect = { 0, 0, 1000, 1000 };
    OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, &rect);
    //2.
    int32_t size = 2;
    ArkUI_AccessibleAction actions[size];
    actions[0].actionType = ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLEAR_ACCESSIBILITY_FOCUS;
    actions[0].description = "nativeAce";
    actions[1].actionType = ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_GAIN_ACCESSIBILITY_FOCUS;
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
    OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, -2100000);
    //10.
    OH_ArkUI_AccessibilityElementInfoSetVisible(elementInfo, true);
    //11.
    OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, 0);
    
    // 12.
    int64_t childNodeIds[3] =  {1, 2, 3};
    OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, 3, childNodeIds);
    
    //13.
    OH_ArkUI_AccessibilityElementInfoSetEnabled(elementInfo, true);
    
    OH_ArkUI_AccessibilityElementInfoSetClickable(elementInfo, true);
    
    OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, "root_content");
    
    OH_ArkUI_AccessibilityElementInfoSetCheckable(elementInfo, true);
    
    OH_ArkUI_AccessibilityElementInfoSetChecked(elementInfo, true);

}

void FillElementInfo2(ArkUI_AccessibilityElementInfo* elementInfo, int32_t i)
{
    if(elementInfo == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FillElementInfo1 elementInfo1 is null");
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
    actions[0].actionType = ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLEAR_ACCESSIBILITY_FOCUS;
    actions[0].description = "ace";
    actions[1].actionType = ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_GAIN_ACCESSIBILITY_FOCUS;
    actions[1].description = "ace";
    actions[2].actionType = ArkUI_Accessibility_ActionType::ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLICK;
    actions[2].description = "ace";
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
    if (i % 2 == 0) {
        OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, "button");
    } else {
        OH_ArkUI_AccessibilityElementInfoSetComponentType(elementInfo, "text");
    }
    
    //8.
    OH_ArkUI_AccessibilityElementInfoSetFocusable(elementInfo, true);
    //9.
    OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, i < 4? 0 : 1);
    //10.
    OH_ArkUI_AccessibilityElementInfoSetVisible(elementInfo, true);
    //11.
    OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, i);
    //12.
    OH_ArkUI_AccessibilityElementInfoSetEnabled(elementInfo, true);
    
    if (i == 1) {
        int64_t childNodeIds[6] =  {4, 5, 6, 7, 8, 9};
        OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(elementInfo, 6, childNodeIds);
    }
    OH_ArkUI_AccessibilityElementInfoSetClickable(elementInfo, true);
    std::string ss;
    ss.append("contenttest_").append(std::to_string(i));
    OH_ArkUI_AccessibilityElementInfoSetContents(elementInfo, ss.c_str());
    
    OH_ArkUI_AccessibilityElementInfoSetCheckable(elementInfo, true);
    OH_ArkUI_AccessibilityElementInfoSetChecked(elementInfo, true);
}

int32_t AccessibilityManager::FindAccessibilityNodeInfosById(const char *instanceId, int64_t elementId,
                                                             ArkUI_AccessibilitySearchMode mode, int32_t requestId,
                                                             ArkUI_AccessibilityElementInfoList *elementList) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
        "FindAccessibilityNodeInfosById start,elementId: %{public}ld, requestId: %{public}d, mode: %{public}d, instanceId:%{public}s",
        elementId, requestId, static_cast<int32_t>(mode),instanceId);
    if(elementList == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosById elementList is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    // 传第一个info
    ArkUI_AccessibilityElementInfo* elementInfo = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
    if(elementInfo == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosById elementInfo1 is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    if (mode == 8) {
        FillElementInfo1(elementInfo);
        for (int32_t i = 1; i< 10; i++) {
            ArkUI_AccessibilityElementInfo* elementInfox = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
            if(elementInfox == nullptr) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosById elementInfox is null");
                return OH_NATIVEXCOMPONENT_RESULT_FAILED;
            }
            FillElementInfo2(elementInfox,i);
        }
    } else if (elementId == 0) {
        FillElementInfo1(elementInfo);
    } else if (elementId == -1){
        FillElementInfo1(elementInfo);
    } else {
        FillElementInfo2(elementInfo,static_cast<int32_t>(elementId));
    }
    
    
    // 传第二个info
//     ArkUI_AccessibilityElementInfo* elementInfo2 = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
//     if(elementInfo2 == nullptr) {
//         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosById elementInfo2 is null");
//         return OH_NATIVEXCOMPONENT_RESULT_FAILED;
//     }
//     FillElementInfo2(elementInfo2);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosById end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::FindAccessibilityNodeInfosByText(const char *instanceId, int64_t elementId,
                                                               const char *text, int32_t requestId,
                                                               ArkUI_AccessibilityElementInfoList *elementList) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
        "FindAccessibilityNodeInfosByText start,elementId: %{public}ld, requestId: %{public}d, text: %{public}s, instanceId:%{public}s",
        elementId, requestId, text,instanceId);
    if(elementList == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosByText elementInfo is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    // 传第一个info
    ArkUI_AccessibilityElementInfo* elementInfo1 = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
    if(elementInfo1 == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindFocusedAccessibilityNode elementInfo1 is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    FillElementInfo2(elementInfo1, 2);
    
    // 传第二个info
    ArkUI_AccessibilityElementInfo* elementInfo2 = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
    if(elementInfo2 == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindFocusedAccessibilityNode elementInfo2 is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    FillElementInfo2(elementInfo2, 3);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosByText end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::FindFocusedAccessibilityNode(const char *instanceId, int64_t elementId,
                                                           ArkUI_AccessibilityFocusType focusType, int32_t requestId,
                                                           ArkUI_AccessibilityElementInfo *elementInfo)

{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
        "FindFocusedAccessibilityNode start,elementId: %{public}ld, requestId: %{public}d, focusType: %{public}d, instanceId:%{public}s",
        elementId, requestId, static_cast<int32_t>(focusType),instanceId);
    if(elementInfo == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindFocusedAccessibilityNode elementInfo is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }

    FillElementInfo2(elementInfo, 4);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindFocusedAccessibilityNode end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::FindNextFocusAccessibilityNode(const char *instanceId, int64_t elementId,
                                                             ArkUI_AccessibilityFocusMoveDirection direction,
                                                             int32_t requestId,
                                                             ArkUI_AccessibilityElementInfo *elementInfo) {

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "FindNextFocusAccessibilityNode elementId: %{public}ld, requestId: %{public}d, direction: %{public}d, instanceId:%{public}s",
                 elementId, requestId, static_cast<int32_t>(direction),instanceId);

    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::ExecuteAccessibilityAction(const char *instanceId, int64_t elementId,
                                                         ArkUI_Accessibility_ActionType action,
                                                         ArkUI_AccessibilityActionArguments *actionArguments,
                                                         int32_t requestId) {

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "ExecuteAccessibilityAction elementId: %{public}ld, action: %{public}d, instanceId:%{public}s", elementId, action,instanceId);
    auto object = FakeWidget::instance().getChild(elementId);

    if (!object)
        return 0;

    auto element = OH_ArkUI_CreateAccessibilityElementInfo();
    OH_ArkUI_AccessibilityElementInfoSetElementId(element, elementId);

    switch (action) {
    case ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLICK:
        if (object) {
            object->onClick();
            object->fillAccessibilityElement(element);
        }
        AccessibilityManager::SendAccessibilityAsyncEvent(element, ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_CLICKED);
        break;
    case ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_GAIN_ACCESSIBILITY_FOCUS:
        if (object) {
            object->SetFocus(true);

            object->fillAccessibilityElement(element);
        }

        AccessibilityManager::SendAccessibilityAsyncEvent(element,
                                                          ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ACCESSIBILITY_FOCUSED);

        break;
    case ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_CLEAR_ACCESSIBILITY_FOCUS:
        if (object) {
            object->SetFocus(false);
            object->fillAccessibilityElement(element);
        }
        AccessibilityManager::SendAccessibilityAsyncEvent(
            element, ARKUI_ACCESSIBILITY_NATIVE_EVENT_TYPE_ACCESSIBILITY_FOCUS_CLEARED);
        break;
    }

    OH_ArkUI_DestoryAccessibilityElementInfo(element);
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::ClearFocusedFocusAccessibilityNode(const char *instanceId) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "ClearFocusedFocusAccessibilityNode, instanceId:%{public}s",instanceId);
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::GetAccessibilityNodeCursorPosition(const char *instanceId, int64_t elementId,
                                                                 int32_t requestId, int32_t *index) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "GetAccessibilityNodeCursorPosition, instanceId:%{public}s",instanceId);
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}
} // namespace NativeXComponentSample