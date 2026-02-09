/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

// Created on 2024/12/3.
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".


#include <arkui/native_interface_accessibility.h>
#include <hilog/log.h>
#include "AccessibilityManagerTest.h"
#include <cassert>
#include <string>
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static int NUMBER_100 = 100;
static int NUMBER_500 = 500;
static int NUMBER_800 = 800;

class AccessibleObject {
public:
    AccessibleObject(const std::string &name) : name_(name), originName_(name) {}
    void SetFocus(bool focus) { focus_ = focus; }
    void SetName(const std::string &name) {name_ = name;}
    bool Focused() const { return focus_; }
    virtual bool Focusable() const { return true; }
    std::string Name() const { return name_; }
    std::string OriginName() const { return originName_; }

    virtual const char *ObjectType() const { return "object"; }
    virtual const char *Hint() const { return "It's object"; }

    virtual void onClick() {}
    virtual bool Clickable() const { return false; }

    void fillAccessibilityElement(ArkUI_AccessibilityElementInfo *element)
    {
        OH_ArkUI_AccessibilityElementInfoSetComponentType(element, ObjectType());
        OH_ArkUI_AccessibilityElementInfoSetContents(element, Name().data());
        OH_ArkUI_AccessibilityElementInfoSetHintText(element, Hint());
        OH_ArkUI_AccessibilityElementInfoSetVisible(element, true);

        OH_ArkUI_AccessibilityElementInfoSetEnabled(element, true);

        OH_ArkUI_AccessibilityElementInfoSetFocusable(element, Focusable());
        OH_ArkUI_AccessibilityElementInfoSetFocused(element, Focused());
        OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(element, "yes");
        OH_ArkUI_AccessibilityElementInfoSetEditable(element, true);

        ArkUI_AccessibleAction actions[12];
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
        
        actions[index].actionType = ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_NEXT_HTML_ITEM;
        actions[index].description = "Next FocusMove";
        index++;
        actions[index].actionType = ARKUI_ACCESSIBILITY_NATIVE_ACTION_TYPE_PREVIOUS_HTML_ITEM;
        actions[index].description = "Previous FocusMove";
        index++;
        
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
    virtual void onClick()
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AccessibleObject", "FakeButton onClick");
    }
    virtual bool Clickable() const { return true; }
};

class FakeText : public AccessibleObject {
public:
    FakeText(const std::string &name) : AccessibleObject(name) {}

    const char *Hint() const { return "It's a text"; }
    virtual const char *ObjectType() const { return "QText"; }
    virtual void onClick()
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AccessibleObject", "FakeText onClick");
    }
    virtual bool Clickable() const { return false; }
};


class FakeWidget : public AccessibleObject {
public:
    static FakeWidget &instance()
    {
        static FakeWidget w;
        return w;
    }

    const std::vector<AccessibleObject *> &getAllObjects(std::string instanceId) const
    {
        for (int i = 0; i < objects.size(); i++) {
            objects[i]->SetName(objects[i]->OriginName() + instanceId);
        }
        return objects;
    }

    AccessibleObject *getChild(int elementId) const
    {
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
    virtual void onClick()
    {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AccessibleObject", "FakeWidget onClick");
    }

private:
    FakeWidget() : AccessibleObject("fakeWidget")
    {
        this->AddButton();
        this->AddButton();
        this->AddButton();
        this->AddText();
        this->AddText();
        this->AddText();
    }
    ~FakeWidget()
    {
        for (auto &obj : objects) {
            delete obj;
        }
    }

private:
    void AddButton()
    {
        static int i = 1;
        objects.push_back(new FakeButton("button" + std::to_string(i)));
        i++;
    }
    void AddText()
    {
        static int i = 1;
        objects.push_back(new FakeText("text" + std::to_string(i)));
        i++;
    }

private:
    std::vector<AccessibleObject *> objects;
};

const char *LOG_PRINT_TEXT = "AccessibilityManager";

void FillEvent(ArkUI_AccessibilityEventInfo *eventInfo, ArkUI_AccessibilityElementInfo *elementInfo,
               ArkUI_AccessibilityEventType eventType)
{
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
                                                       ArkUI_AccessibilityEventType eventType)
{
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

AccessibilityManager::AccessibilityManager()
{
    accessibilityProviderCallbacksWithInstance_.findAccessibilityNodeInfosById = FindAccessibilityNodeInfosById;
    accessibilityProviderCallbacksWithInstance_.findAccessibilityNodeInfosByText = FindAccessibilityNodeInfosByText;
    accessibilityProviderCallbacksWithInstance_.findFocusedAccessibilityNode = FindFocusedAccessibilityNode;
    accessibilityProviderCallbacksWithInstance_.findNextFocusAccessibilityNode = FindNextFocusAccessibilityNode;
    accessibilityProviderCallbacksWithInstance_.executeAccessibilityAction = ExecuteAccessibilityAction;
    accessibilityProviderCallbacksWithInstance_.clearFocusedFocusAccessibilityNode = ClearFocusedFocusAccessibilityNode;
    accessibilityProviderCallbacksWithInstance_.getAccessibilityNodeCursorPosition = GetAccessibilityNodeCursorPosition;
}

void AccessibilityManager::Initialize(const std::string &id, ArkUI_NodeHandle handle)
{
    provider = OH_ArkUI_AccessibilityProvider_Create(handle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "wds get provider=%{public}p", provider);

    if (provider == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "wds get provider is null");
        return;
    }

    // 2.注册回调函数
    auto ret = OH_ArkUI_AccessibilityProviderRegisterCallbackWithInstance(id.c_str(),
                                                                          provider,
                                                                          &accessibilityProviderCallbacksWithInstance_);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                     "InterfaceDesignTest OH_ArkUI_AccessibilityProviderRegisterCallback failed");
        return;
    }
    g_provider = provider;
}

int32_t AccessibilityManager::FindAccessibilityNodeInfosById(const char* instanceId, int64_t elementId,
                                                             ArkUI_AccessibilitySearchMode mode,
                                                             int32_t requestId,
                                                             ArkUI_AccessibilityElementInfoList *elementList)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "FindAccessibilityNodeInfosById start,instanceId %{public}s elementId: %{public}ld, requestId: %{public}d, mode: %{public}d",
                 instanceId, elementId, requestId, static_cast<int32_t>(mode));

    if (elementList == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                     "FindAccessibilityNodeInfosById elementList is null");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    int ret = 0;
    const int parentOfRoot = -2100000;
    if (elementId == -1) {
        elementId = 0;
    }
    
    if (mode == ARKUI_ACCESSIBILITY_NATIVE_SEARCH_MODE_PREFETCH_RECURSIVE_CHILDREN) {
        // arkUi框架设计的特殊值，根节点必须设置parentId为这个值

        // fill some fake nodes
        auto rootNode = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
        assert(rootNode);

        OH_ArkUI_AccessibilityElementInfoSetElementId(rootNode, 0);
        OH_ArkUI_AccessibilityElementInfoSetParentId(rootNode, parentOfRoot);
        FakeWidget::instance().fillAccessibilityElement(rootNode);

        ArkUI_AccessibleRect rect;
        rect.leftTopX = 0;
        rect.leftTopY = 0;
        rect.rightBottomX = NUMBER_800;
        rect.rightBottomY = NUMBER_800;
        ret = OH_ArkUI_AccessibilityElementInfoSetScreenRect(rootNode, &rect);
        OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(rootNode, "no");
        auto objects = FakeWidget::instance().getAllObjects(instanceId);
        int64_t childNodes[1024];
        for (int i = 0; i < objects.size(); i++) {
            int elementId = i + 1;

            childNodes[i] = elementId;
        }

        for (int i = 0; i < objects.size(); i++) {
            int elementId = i + 1;

            childNodes[i] = elementId;
            auto child = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
            OH_ArkUI_AccessibilityElementInfoSetElementId(child, elementId);
            OH_ArkUI_AccessibilityElementInfoSetParentId(child, 0);
            OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(child, "yes");
            objects[i]->fillAccessibilityElement(child);

            ArkUI_AccessibleRect rect;
            rect.leftTopX = i * NUMBER_100;
            rect.leftTopY = NUMBER_100;
            rect.rightBottomX = i * NUMBER_100 + NUMBER_100;
            rect.rightBottomY = NUMBER_500;
            OH_ArkUI_AccessibilityElementInfoSetScreenRect(child, &rect);
        }

        ret = OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(rootNode, objects.size(), childNodes);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                     "FindAccessibilityNodeInfosById child count: %{public}ld %{public}d",
                     objects.size(), ret);
    } else {
        if (mode == ARKUI_ACCESSIBILITY_NATIVE_SEARCH_MODE_PREFETCH_CURRENT) {
            auto &widget = FakeWidget::instance();
            AccessibleObject *obj = nullptr;
            if (elementId == 0) {
                obj = &widget;
            } else {
                obj = widget.getChild(elementId);
            }
            if (obj) {
                auto node = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
                OH_ArkUI_AccessibilityElementInfoSetElementId(node, elementId);
                OH_ArkUI_AccessibilityElementInfoSetParentId(node, elementId == 0 ? parentOfRoot : 0);
                OH_ArkUI_AccessibilityElementInfoSetAccessibilityLevel(node, elementId == 0 ?  "no" : "yes");
                obj->fillAccessibilityElement(node);
                ArkUI_AccessibleRect rect;
                if (elementId == 0) {
                    rect.leftTopX = 0;
                    rect.leftTopY = 0;
                    rect.rightBottomX = NUMBER_800;
                    rect.rightBottomY = NUMBER_800;
                } else {
                    int i = elementId - 1;
                    rect.leftTopX = i * NUMBER_100;
                    rect.leftTopY = NUMBER_100;
                    rect.rightBottomX = i * NUMBER_100 + NUMBER_100;
                    rect.rightBottomY = NUMBER_500;
                }

                OH_ArkUI_AccessibilityElementInfoSetScreenRect(node, &rect);
                if (elementId == 0) {
                    auto objects = FakeWidget::instance().getAllObjects(instanceId);
                    int64_t childNodes[1024];

                    for (int i = 0; i < objects.size(); i++) {
                        int elementId = i + 1;

                        childNodes[i] = elementId;
                        auto child = OH_ArkUI_AddAndGetAccessibilityElementInfo(elementList);
                        OH_ArkUI_AccessibilityElementInfoSetElementId(child, elementId);
                        OH_ArkUI_AccessibilityElementInfoSetParentId(child, 0);

                        objects[i]->fillAccessibilityElement(child);

                        ArkUI_AccessibleRect rect;
                        rect.leftTopX = i * NUMBER_100;
                        rect.leftTopY = 0;
                        rect.rightBottomX = i * NUMBER_100 + NUMBER_100;
                        rect.rightBottomY = NUMBER_500;
                        OH_ArkUI_AccessibilityElementInfoSetScreenRect(child, &rect);
                    }

                    ret = OH_ArkUI_AccessibilityElementInfoSetChildNodeIds(node, objects.size(), childNodes);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                        "FindAccessibilityNodeInfosById child2 count: %{public}ld",
                        objects.size());
                }
            }
        }
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "FindAccessibilityNodeInfosById end");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::FindAccessibilityNodeInfosByText(const char* instanceId, int64_t elementId,
                                                               const char *text,
                                                               int32_t requestId,
                                                               ArkUI_AccessibilityElementInfoList *elementList)
{
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::FindFocusedAccessibilityNode(const char* instanceId, int64_t elementId,
                                                           ArkUI_AccessibilityFocusType focusType,
                                                           int32_t requestId,
                                                           ArkUI_AccessibilityElementInfo *elementInfo)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "FindFocusedAccessibilityNode elementId: %{public}ld, requestId: %{public}d, focusType: %{public}d",
                 elementId, requestId, static_cast<int32_t>(focusType));

    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::FindNextFocusAccessibilityNode(const char* instanceId, int64_t elementId,
                                                             ArkUI_AccessibilityFocusMoveDirection direction,
                                                             int32_t requestId,
                                                             ArkUI_AccessibilityElementInfo *elementInfo)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "zhk FindNextFocusAccessibilityNode instanceId %{public}s elementId: %{public}ld, requestId: %{public}d, direction: %{public}d",
                 instanceId, elementId, requestId, static_cast<int32_t>(direction));

    auto objects = FakeWidget::instance().getAllObjects(instanceId);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "zhk objects.size() %{public}d", objects.size());
    // object.size 不包含 root节点
    if ((elementId < 0) || (elementId > objects.size())) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "zhk 1");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    int64_t nextElementId = -1;
    if (direction == ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_FORWARD) {
        nextElementId = elementId + 1;
    } else {
        nextElementId = elementId - 1;
    }
    
    // 屏幕朗读约束 如果是根节点 然后backward的话需要回到最后一个节点
    if ((nextElementId == -1) && (direction == ARKUI_ACCESSIBILITY_NATIVE_DIRECTION_BACKWARD)) {
        nextElementId = objects.size();
    }
    
    if (nextElementId >  objects.size()) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "zhk 2");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    if (nextElementId <=  0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "zhk 3");
        return OH_NATIVEXCOMPONENT_RESULT_FAILED;
    }
    
    OH_ArkUI_AccessibilityElementInfoSetElementId(elementInfo, nextElementId);
    OH_ArkUI_AccessibilityElementInfoSetParentId(elementInfo, 0);

    // id 比object索引大1
    objects[nextElementId - 1]->fillAccessibilityElement(elementInfo);

    ArkUI_AccessibleRect rect;
    rect.leftTopX = nextElementId * NUMBER_100;
    rect.leftTopY = 0;
    rect.rightBottomX = nextElementId * NUMBER_100 + NUMBER_100;
    rect.rightBottomY = NUMBER_500;
    OH_ArkUI_AccessibilityElementInfoSetScreenRect(elementInfo, &rect);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "zhk 4 %{public}ld", nextElementId);
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

ArkUI_AccessibilityProvider* AccessibilityManager::getProvider()
{
    return provider;
}

int32_t AccessibilityManager::ExecuteAccessibilityAction(const char* instanceId, int64_t elementId,
                                                         ArkUI_Accessibility_ActionType action,
                                                         ArkUI_AccessibilityActionArguments *actionArguments,
                                                         int32_t requestId)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT,
                 "ExecuteAccessibilityAction elementId: %{public}ld, requestId: %{public}ld,  action: %{public}d",
                 elementId, requestId, action);
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

int32_t AccessibilityManager::ClearFocusedFocusAccessibilityNode(const char* instanceId)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "ClearFocusedFocusAccessibilityNode");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}

int32_t AccessibilityManager::GetAccessibilityNodeCursorPosition(const char* instanceId, int64_t elementId,
                                                                 int32_t requestId, int32_t *index)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, LOG_PRINT_TEXT, "GetAccessibilityNodeCursorPosition");
    return OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
}