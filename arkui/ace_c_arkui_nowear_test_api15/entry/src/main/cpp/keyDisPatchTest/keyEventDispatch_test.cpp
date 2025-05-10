/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "keyEventDispatch_test.h"
#include "common/common.h"
#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_key_event.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>

namespace ArkUICapiTest {

uint32_t defalutColor = 0xffff0000;
uint32_t actionedColor = 0xff00ff00;
bool flag = false;
ArkUI_NodeHandle  columnContainer;

TestEventData KeyEventDispatchTest::testKeyEventData;

void setKeyEventData(TestEventData data) {
    KeyEventDispatchTest::testKeyEventData = data;
    
}


// test data
void TestEvent(ArkUI_UIInputEvent *arkUI_UIInputEvent, std::string tag) {
    
     OH_ArkUI_KeyEvent_SetConsumed(arkUI_UIInputEvent, false);
     // key type;
     auto type = OH_ArkUI_KeyEvent_GetType(arkUI_UIInputEvent);
     // key code 
     auto keyCode = OH_ArkUI_KeyEvent_GetKeyCode(arkUI_UIInputEvent);
     // key text
     auto keyText = OH_ArkUI_KeyEvent_GetKeyText(arkUI_UIInputEvent);
     // key source
     auto keySource = OH_ArkUI_KeyEvent_GetKeySource(arkUI_UIInputEvent);
        // key deviceId
     auto deviceId = OH_ArkUI_UIInputEvent_GetDeviceId(arkUI_UIInputEvent);
     // timestamp
     auto timestamp = OH_ArkUI_UIInputEvent_GetEventTime(arkUI_UIInputEvent);
     // intentionCode
     auto intentionCode = OH_ArkUI_KeyEvent_GetKeyIntensionCode(arkUI_UIInputEvent);
    
     int32_t count = 2;
     int32_t pressKeys[2] = {0, 0};
     auto value = OH_ArkUI_UIInputEvent_GetPressedKeys(arkUI_UIInputEvent, pressKeys, &count);
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventPatchTest", "%{public}s_modifierkeys count = %{public}d",
        tag.c_str(), count);
    
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventPatchTest", "%{public}s_modifierkeys value = %{public}d",
        tag.c_str(), value);
     
     // unicode
    auto unicode = OH_ArkUI_KeyEvent_GetUnicode(arkUI_UIInputEvent);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventPatchTest", "%{public}s_ type = %{public}d,keyCode = %{public}d,"
        "keyText = %{public}s, keysourceType = %{public}d, deviceId = %{public}d, timeStamp = %{public}lld,"
        "intentionCode = %{public}d, unicode = %{public}d",
        tag.c_str(), type, keyCode, keyText, keySource, deviceId, timestamp, intentionCode, unicode);

     // return C data to ts;
    
    TestEventData testEventData;
    testEventData.unicode = unicode;
    testEventData.timestamp = timestamp;
    testEventData.type = type;
    testEventData.keSource = keySource;
    testEventData.deviceId = deviceId;
    testEventData.intentionCode = intentionCode;
    testEventData.keyText = keyText;
    testEventData.keycode = keyCode;
    setKeyEventData(testEventData);
       
}

napi_value KeyEventDispatchTest::GetKeyEventData(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventDispatchTest", "GetKeyEventData");
    napi_value result;
    napi_create_object(env, &result);
    napi_value value;
    napi_create_int32(env, testKeyEventData.unicode ,&value);
    napi_set_named_property(env, result, "unicode", value);
    
    napi_create_int32(env, testKeyEventData.type,&value);
    napi_set_named_property(env, result, "type", value);
    
    napi_create_double(env, testKeyEventData.timestamp ,&value);
    napi_set_named_property(env, result, "timestamp", value);
    
    napi_create_int32(env, testKeyEventData.keSource ,&value);
    napi_set_named_property(env, result, "keySource", value);
    
    napi_create_int32(env, testKeyEventData.deviceId ,&value);
    napi_set_named_property(env, result, "deviceId", value);
    
    napi_create_int32(env, testKeyEventData.intentionCode ,&value);
    napi_set_named_property(env, result, "intentionCode", value);
    
    const char* cStr = testKeyEventData.keyText.c_str();
    napi_create_string_utf8(env, cStr, NAPI_AUTO_LENGTH, &value);
    napi_set_named_property(env, result, "keyText", value);
    
    napi_create_int32(env, testKeyEventData.keycode ,&value);
    napi_set_named_property(env, result, "keyCode", value);
    
    return result;
}



ArkUI_NodeHandle button11;
ArkUI_NodeHandle text1;
ArkUI_NodeHandle text2;
ArkUI_NativeNodeAPI_1 * nodeAPI;
// test dispatchTestEvent
ArkUI_NodeHandle  dispatchTest(ArkUI_NativeNodeAPI_1 * nodeAPI) {
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
     ArkUI_NumberValue columnWidthValue[] = { {.f32 = 150} };
     ArkUI_AttributeItem columnWidth= { .value = columnWidthValue, .size = sizeof(columnWidthValue) / sizeof(ArkUI_NumberValue) };
     nodeAPI->setAttribute(column, NODE_WIDTH, &columnWidth);
     
     ArkUI_NumberValue columnHeightValue[] = { {.f32 = 150} };
     ArkUI_AttributeItem columnHeight= { .value = columnHeightValue, .size = sizeof( columnHeightValue) / sizeof(ArkUI_NumberValue) };
     nodeAPI->setAttribute(column, NODE_WIDTH, &columnHeight);
    
     ArkUI_NumberValue value[] = {{.u32 = defalutColor}};
     ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
     nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &value_item);
    
     ArkUI_AttributeItem id_item = {};
     id_item.string = "parentColumn";
     nodeAPI->setAttribute(column, NODE_ID, &id_item);
    
     // create child component
     auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel = {.string = "button-组件存在"};
     nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &buttonLabel);
    
     button11 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
     ArkUI_AttributeItem buttonLabel11 = {.string = "button11"};
     nodeAPI->setAttribute(button11, NODE_BUTTON_LABEL, &buttonLabel11);
    
       

      text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
      ArkUI_AttributeItem contentItem = {.string =  ""};

      ArkUI_AttributeItem id_text1 = {};
      id_text1.string = "keyText1";
      nodeAPI->setAttribute(text1, NODE_ID, &id_text1);

      nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &contentItem);
    
      text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
      ArkUI_AttributeItem contentItem2 = {.string =  ""};
      text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
      ArkUI_AttributeItem id_text2 = {};
      id_text2.string = "keyText2";
      nodeAPI->setAttribute(text2, NODE_ID, &id_text2);
      nodeAPI->setAttribute(text2, NODE_TEXT_CONTENT, &contentItem2);
     
     nodeAPI->addChild(column,text1);
     nodeAPI->addChild(column,text2);
     nodeAPI->addChild(column, button);
     nodeAPI->addChild(column, button11);
     struct CallData {
         int a;
     };
      
     CallData callData = {2};
     nodeAPI->registerNodeEvent(column, NODE_DISPATCH_KEY_EVENT, 1, &callData);
     nodeAPI->registerNodeEvent(column, NODE_ON_CLICK, 111, &callData);
    
     ArkUI_NumberValue focusValue[] = {{.i32 = 1}};
     ArkUI_AttributeItem focusItem = {focusValue, 1};
     nodeAPI->setAttribute(column, NODE_DEFAULT_FOCUS, &focusItem);
     nodeAPI->registerNodeEvent(button11, NODE_ON_KEY_EVENT, 3 ,&callData);
    
     nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
         auto userData = OH_ArkUI_NodeEvent_GetUserData(event);
         auto realData = static_cast<CallData*>(userData);
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventPatchTest", "get userData == %{public}d",
                      realData->a);
        
         auto targetID = OH_ArkUI_NodeEvent_GetTargetId(event);
        
         // get the eventType
         auto getEventType = OH_ArkUI_NodeEvent_GetInputEvent(event);
        
         if (targetID == 1) {
             // dispatch Event
              ArkUI_AttributeItem contentItem = {.string =  "ParentC"};
             ArkUI_NativeNodeAPI_1 *nodeAPIP = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(
             ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
             nodeAPIP->setAttribute(text2, NODE_TEXT_CONTENT, &contentItem);
             TestEvent(getEventType, "column NODE_DISPATCH_KEY_EVENT");
             OH_ArkUI_FocusRequest(button11);
             OH_ArkUI_KeyEvent_Dispatch(button11, getEventType);
            
             
         } else if (targetID == 3 ) {
             // onKey Event
             ArkUI_AttributeItem contentItem = {.string =  "keyRe"};
             ArkUI_NativeNodeAPI_1 *nodeAPIC = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(OH_ArkUI_QueryModuleInterfaceByName(
             ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
             nodeAPIC->setAttribute(text1, NODE_TEXT_CONTENT, &contentItem);
             TestEvent(getEventType, "button11 NODE_KEY_EVENT");
         }
        
     });
     
    return column;
}


napi_value KeyEventDispatchTest::KeyEventPatchTest(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventPatchTest", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
        "KeyEventPatchTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
   columnContainer = nodeAPI->createNode(ARKUI_NODE_COLUMN);
   nodeAPI->addChild(columnContainer, dispatchTest(nodeAPI));
    
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), columnContainer) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ListItemHitTestBehaviorTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}



} // namespace ArkUICapiTest
