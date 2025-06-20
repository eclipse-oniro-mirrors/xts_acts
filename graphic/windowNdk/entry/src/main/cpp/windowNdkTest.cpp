/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <cstdio>
#include "napi/native_api.h"
#include "window_manager/oh_window_comm.h"
#include "window_manager/oh_window.h"
#include "window_manager/oh_window_event_filter.h"
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <string>
#include <type_traits>
#include "multimedia/image_framework/image/pixelmap_native.h"
#include "multimedia/image_framework/image/image_packer_native.h"
#include "native_drawing/drawing_pixel_map.h"
#include <cstdint>
#include <memory>
#include <unistd.h>
#include <future>
#define Check_Napi_Create_Object_Return_If_Null(env,objValue)\
    do{                                                      \
        napi_create_object((env),&(objValue));               \
        if((objValue) == nullptr){                           \
            return nullptr;                                  \
        }                                                    \
    }while (0)                                               
    
static int keyCode1 = -1;
static bool filterESC(Input_KeyEvent *event){
    auto keyCode = OH_Input_GetKeyEventKeyCode(event);
    auto actionTime = OH_Input_GetKeyEventActionTime(event);
    auto action = OH_Input_GetKeyEventAction(event);
    return keyCode == keyCode1;
}

static napi_value filterKeyCode(napi_env env, napi_callback_info info){
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    int32_t keyCode;
    napi_get_value_int32(env, args[1], &keyCode);
    keyCode1 = keyCode;
    auto result = OH_NativeWindowManager_RegisterKeyEventFilter(windowId, filterESC);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
static napi_value unFilterKeyCode(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    auto result = OH_NativeWindowManager_UnregisterKeyEventFilter(windowId);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value IsWindowShown(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    napi_value retValue;
    napi_create_object(env,&retValue);
    napi_value resultCode;
    napi_value isShowWindow;

    bool isShow = false;
    int32_t resultInt32 = OH_WindowManager_IsWindowShown(static_cast<int>(windowId),&isShow);
    napi_create_int32(env,resultInt32,&resultCode);
    napi_create_int32(env,(int)isShow,&isShowWindow);
    napi_set_named_property(env,retValue,"isShow",isShowWindow);
    napi_set_named_property(env,retValue,"resultCode",resultCode);
    return retValue;
}

static napi_value ShowWindow(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    napi_value retValue;
    napi_create_object(env,&retValue);
    napi_value resultCode;

    int32_t resultInt32 = OH_WindowManager_ShowWindow(static_cast<int>(windowId));
    napi_create_int32(env,resultInt32,&resultCode);
    napi_set_named_property(env,retValue,"resultCode",resultCode);
    return retValue;
}

static napi_value SetWindowStatusBarEnabled(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    bool enabled = false;
    napi_get_value_bool(env, args[1], &enabled);

    bool enableAnimation = false;
    napi_get_value_bool(env, args[2], &enableAnimation);
    
    napi_value resultCode;

    auto res = OH_WindowManager_SetWindowStatusBarEnabled(windowId,enabled,enableAnimation);
    napi_create_int32(env,res,&resultCode);
    return resultCode;
}

static napi_value SetWindowNavigationBarEnabled(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    bool enabled = false;
    napi_get_value_bool(env, args[1], &enabled);

    bool enableAnimation = false;
    napi_get_value_bool(env, args[2], &enableAnimation);
    
    napi_value resultCode;

    auto res = OH_WindowManager_SetWindowNavigationBarEnabled(windowId,enabled,enableAnimation);
    napi_create_int32(env,res,&resultCode);
    return resultCode;
}

static napi_value SetWindowStatusBarColor(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    int32_t color;
    napi_get_value_int32(env, args[1], &color);
             
    napi_value resultCode;

    auto res = OH_WindowManager_SetWindowStatusBarColor(windowId,color);
    napi_create_int32(env,res,&resultCode);
    return resultCode;
}

inline napi_value CreateJsNumber(napi_env env,double value){
    napi_value result = nullptr;
    napi_create_double(env,value,&result);
    return result;
}

template<class T>
bool ConvertFromJsValue(napi_env env,napi_value jsValue,T& value){
    if(jsValue == nullptr){
        return false;
    }

    using ValueType = std::remove_cv_t<std::remove_reference_t<T>>;
    napi_value result = nullptr;
    if constexpr (std::is_same_v<ValueType,bool>){
        return napi_get_value_bool(env,jsValue,nullptr) == napi_ok;
    }else if constexpr(std::is_arithmetic_v<ValueType>){
        return ConvertFromJsNumber(env,jsValue,value);
    }else if constexpr(std::is_same_v<ValueType,std::string>){
        size_t len = 0;
        if(napi_get_value_string_utf8(env,jsValue,nullptr,0,&len)!=napi_ok){
            return false;
        }
        auto buffer = std::make_unique<char[]>(len + 1);
        size_t strLength = 0;
        if(napi_get_value_string_utf8(env,jsValue,buffer.get(),len+1,&strLength)==napi_ok){
            value = buffer.get();
            return true;
        }
        return false;
    }else if constexpr(std::is_enum_v<ValueType>){
        std::make_signed_t<ValueType> numberValue = 0;
        if(!ConvertFromJsNumber(env,jsValue,numberValue)){
            return true;
        }
        value = static_cast<ValueType>(numberValue);
        return true;
    }
    return false;
}

template<class T>
napi_value CreateJsValue(napi_env env,const T& value){
    using ValueType = std::remove_cv_t<std::remove_reference_t<T>>;
    napi_value result = nullptr;
    if constexpr (std::is_same_v<ValueType,bool>){
        napi_get_boolean(env,value,&result);
        return result;
    }else if constexpr(std::is_arithmetic_v<ValueType>){
        return CreateJsNumber(env,value);
    }else if constexpr(std::is_same_v<ValueType,std::string>){
        napi_create_string_utf8(env,value.c_str(),value.length(),&result);
        return result;
    }else if constexpr(std::is_enum_v<ValueType>){
        return CreateJsNumber(env,static_cast<std::make_signed_t<ValueType>>(value));
    }else if constexpr(std::is_same_v<ValueType,const char*>){
        (value != nullptr)?napi_create_string_utf8(env,value,strlen(value),&result):
        napi_get_undefined(env,&result);
        return result;
    }else {
        return result;
    }
}

napi_value GetRectAndConvertToJsValue(napi_env env, const WindowManager_Rect& rect){
    napi_value objValue = nullptr;
    Check_Napi_Create_Object_Return_If_Null(env,objValue);

    napi_set_named_property(env,objValue,"left",CreateJsValue(env,rect.posX));
    napi_set_named_property(env,objValue,"top",CreateJsValue(env,rect.posY));
    napi_set_named_property(env,objValue,"width",CreateJsValue(env,rect.width));
    napi_set_named_property(env,objValue,"height",CreateJsValue(env,rect.height));
    return objValue;
}

napi_value ConvertAvoidAreaToJsValue(napi_env env, WindowManager_AvoidArea* avoidArea){
    napi_value objValue = nullptr;
    Check_Napi_Create_Object_Return_If_Null(env,objValue);

    napi_set_named_property(env,objValue,"leftRect",GetRectAndConvertToJsValue(env,avoidArea->leftRect));
    napi_set_named_property(env,objValue,"topRect",GetRectAndConvertToJsValue(env,avoidArea->topRect));
    napi_set_named_property(env,objValue,"rightRect",GetRectAndConvertToJsValue(env,avoidArea->rightRect));
    napi_set_named_property(env,objValue,"bottomRect",GetRectAndConvertToJsValue(env,avoidArea->bottomRect));
    return objValue;
}

static napi_value GetAvoidAreaByType(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    int32_t resultValue = 0;
    napi_get_value_int32(env, args[1], &resultValue);

    WindowManager_AvoidAreaType avoidAreaType = static_cast<WindowManager_AvoidAreaType>(resultValue);
    WindowManager_AvoidArea* avoidArea = new WindowManager_AvoidArea();
    
    auto res = OH_WindowManager_GetWindowAvoidArea(windowId,avoidAreaType,avoidArea);
    if(res == 0){
        napi_value avoidAreaObj = ConvertAvoidAreaToJsValue(env,avoidArea);
        return avoidAreaObj;
    }else{
        napi_value resultValue;
        napi_create_int32(env,res,&resultValue);
        return resultValue;
    }
    
}

static napi_value SetBackgroundColor(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    std::string color;
    ConvertFromJsValue(env,args[1],color);
    
    auto res = OH_WindowManager_SetWindowBackgroundColor(windowId,color.c_str());
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value SetBrightness(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    double brightness;
    napi_get_value_double(env,args[1],&brightness);
    
    auto res = OH_WindowManager_SetWindowBrightness(windowId,brightness);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value SetKeepScreenOn(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    bool isKeepScreenOn;
    napi_get_value_bool(env,args[1],&isKeepScreenOn);
    
    auto res = OH_WindowManager_SetWindowKeepScreenOn(windowId,isKeepScreenOn);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value SetWindowPrivacyMode(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    bool isPrivacy;
    napi_get_value_bool(env,args[1],&isPrivacy);
    
    auto res = OH_WindowManager_SetWindowPrivacyMode(windowId,isPrivacy);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value Snapshot(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    OH_PixelmapNative* pixelMap;
    
    OH_Pixelmap_InitializationOptions* createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts,6);
    OH_PixelmapInitializationOptions_SetHeight(createOpts,4);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts,PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts,PIXELMAP_ALPHA_TYPE_UNKNOWN);

    auto d = OH_PixelmapNative_CreateEmptyPixelmap(createOpts,&pixelMap);
    OH_LOG_INFO(LOG_APP,"OH_PixelmapNative_CreateEmptyPixelmap pixelMap %{public}d",pixelMap);

    auto res = OH_WindowManager_Snapshot(windowId,pixelMap);
    OH_LOG_INFO(LOG_APP,"OH_WindowManager_Snapshot res=%{public}d.",res);
    if(res == 0){
        napi_value pixelValue;
        Image_ErrorCode ans = OH_PixelmapNative_ConvertPixelmapNativeToNapi(env,pixelMap,&pixelValue);
        OH_PixelmapNative_Release(pixelMap);
        return pixelValue;
        
    }else{
        napi_value resultValue;
        napi_create_int32(env,res,&resultValue);
        return resultValue;
    }
}

static napi_value SetWindowFocusable(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    bool isFocusable;
    napi_get_value_bool(env,args[1],&isFocusable);
    
    auto res = OH_WindowManager_SetWindowFocusable(windowId,isFocusable);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value SetWindowTouchable(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    bool isTouchable;
    napi_get_value_bool(env,args[1],&isTouchable);
    
    auto res = OH_WindowManager_SetWindowTouchable(windowId,isTouchable);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

napi_value CreateJsWindowPropertiesObject(napi_env env, WindowManager_WindowProperties* windowProperties){
    napi_value objValue = nullptr;
    Check_Napi_Create_Object_Return_If_Null(env,objValue);

    napi_value windowRectObj = GetRectAndConvertToJsValue(env,windowProperties->windowRect);
    napi_set_named_property(env,objValue,"windowRect",windowRectObj);
    napi_value drawableRectObj = GetRectAndConvertToJsValue(env,windowProperties->drawableRect);
    napi_set_named_property(env,objValue,"drawableRect",drawableRectObj);
    napi_set_named_property(env,objValue,"type",CreateJsValue(env,windowProperties->type));
    napi_set_named_property(env,objValue,"isLayoutFullScreen",CreateJsValue(env,windowProperties->isLayoutFullScreen));
    napi_set_named_property(env,objValue,"isFullScreen",CreateJsValue(env,windowProperties->isFullScreen));
    napi_set_named_property(env,objValue,"touchable",CreateJsValue(env,windowProperties->touchable));
    napi_set_named_property(env,objValue,"focusable",CreateJsValue(env,windowProperties->focusable));
    napi_set_named_property(env,objValue,"isPrivacyMode",CreateJsValue(env,windowProperties->isPrivacyMode));
    napi_set_named_property(env,objValue,"isKeepScreenOn",CreateJsValue(env,windowProperties->isKeepScreenOn));
    napi_set_named_property(env,objValue,"brightness",CreateJsValue(env,windowProperties->brightness));
    napi_set_named_property(env,objValue,"isTransparent",CreateJsValue(env,windowProperties->isTransparent));
    napi_set_named_property(env,objValue,"id",CreateJsValue(env,windowProperties->id));
    napi_set_named_property(env,objValue,"displayId",CreateJsValue(env,static_cast<int64_t>(windowProperties->displayId)));
    return objValue;
}

static napi_value GetWindowPorperties(napi_env env, napi_callback_info info) {
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    WindowManager_WindowProperties* windowProperties = new WindowManager_WindowProperties();

    auto res = OH_WindowManager_GetWindowProperties(windowId,windowProperties);
    if(res == 0){
        auto objValue = CreateJsWindowPropertiesObject(env,windowProperties);
        return objValue;
    }else{
        napi_value resultValue;
        napi_create_int32(env,res,&resultValue);
        return resultValue;
    }
}

//设置鼠标过滤函数
static bool filterMouseEvent(Input_MouseEvent* mouseEvent){
    int32_t action = OH_Input_GetMouseEventAction(mouseEvent);
    int32_t displayX = OH_Input_GetMouseEventDisplayX(mouseEvent);
    int32_t displayY = OH_Input_GetMouseEventDisplayY(mouseEvent);
    int32_t mouseButton = OH_Input_GetMouseEventButton(mouseEvent);
    int32_t actionTime = OH_Input_GetMouseEventActionTime(mouseEvent);
    static bool flag = false;
    OH_LOG_INFO(LogType::LOG_APP,"testTag filterMouseEvent in action=%{public}d displayX=%{public}d "
    "displayY=%{public}d mouseButton=%{public}d actionTime=%{public}ld ",action,displayX,displayY,mouseButton,actionTime);
    //过滤鼠标右键按下
    if(mouseButton == Input_MouseEventButton::MOUSE_BUTTON_RIGHT){
        flag = true;

    }else{
        flag = false;
    }
    return flag;
}

static napi_value registerMouseFilter(napi_env env, napi_callback_info info){
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);

    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    auto res = OH_NativeWindowManager_RegisterMouseEventFilter(windowId,filterMouseEvent);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value clearMouseFilter(napi_env env, napi_callback_info info){
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);

    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    auto res = OH_NativeWindowManager_UnregisterMouseEventFilter(windowId);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

//设置触摸过滤函数
static bool filterTouchEvent(Input_TouchEvent* touchEvent){
    int32_t action = OH_Input_GetTouchEventAction(touchEvent);
    int32_t displayX = OH_Input_GetTouchEventDisplayX(touchEvent);
    int32_t displayY = OH_Input_GetTouchEventDisplayY(touchEvent);
    int32_t id = OH_Input_GetTouchEventFingerId(touchEvent);
    int32_t actionTime = OH_Input_GetTouchEventActionTime(touchEvent);
    static bool flag = false;
    OH_LOG_INFO(LogType::LOG_APP,"testTag filterTouchEvent in action=%{public}d displayX=%{public}d "
    "displayY=%{public}d mouseButton=%{public}d actionTime=%{public}ld ",action,displayX,displayY,id,actionTime);
    //过滤触摸移动事件
    if(action == Input_TouchEventAction::TOUCH_ACTION_MOVE){
        flag = true;

    }else{
        flag = false;
    }
    return flag;
}

static napi_value registerTouchFilter(napi_env env, napi_callback_info info){
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);

    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    auto res = OH_NativeWindowManager_RegisterTouchEventFilter(windowId,filterTouchEvent);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}

static napi_value clearTouchFilter(napi_env env, napi_callback_info info){
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);

    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);

    auto res = OH_NativeWindowManager_UnregisterTouchEventFilter(windowId);
    napi_value resultValue;
    napi_create_int32(env,res,&resultValue);
    return resultValue;
}


napi_value CreateJsWindowLayoutInfoObject(napi_env env,const WindowManager_Rect& rect){
    napi_value objValue = nullptr;
    Check_Napi_Create_Object_Return_If_Null(env,objValue);
    napi_set_named_property(env,objValue,"rect",GetRectAndConvertToJsValue(env,rect));
    return objValue;
}

static napi_value getAllWIndowLayOutInfo(napi_env env, napi_callback_info info){
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);

    int32_t displayId;
    napi_get_value_int32(env, args[0], &displayId);
    WindowManager_Rect** windowLayoutInfo = (WindowManager_Rect**)malloc(sizeof(WindowManager_Rect));
    size_t* windowLayoutInfoSize = (size_t*)malloc(sizeof(size_t));
    auto res = OH_WindowManager_GetAllWindowLayoutInfoList(displayId,windowLayoutInfo,windowLayoutInfoSize);

    if(res != 0){
        napi_value resultValue;
        napi_create_int32(env,res,&resultValue);
        return resultValue;
    }else{
        napi_value arrayValue = nullptr;
        napi_create_array_with_length(env,*windowLayoutInfoSize,&arrayValue);
        for(size_t i = 0;i < *windowLayoutInfoSize;i++){
            OH_LOG_INFO(LOG_APP,"*windowLayoutInfoSize : %{public}d",*windowLayoutInfoSize);
            napi_set_element(env,arrayValue,i,CreateJsWindowLayoutInfoObject(env,*(windowLayoutInfo[0]+i)));
        }
        OH_WindowManager_ReleaseAllWindowLayoutInfoList(*windowLayoutInfo);
        *windowLayoutInfo = NULL;
        windowLayoutInfo = NULL;
        return arrayValue;
    }
    
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"filterKeyCode", nullptr, filterKeyCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unFilterKeyCode", nullptr, unFilterKeyCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isWindowShown", nullptr, IsWindowShown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"showWindow", nullptr, ShowWindow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWindowStatusBarEnabled", nullptr, SetWindowStatusBarEnabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWindowNavigationBarEnabled", nullptr, SetWindowNavigationBarEnabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWindowStatusBarColor", nullptr, SetWindowStatusBarColor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAvoidAreaByType", nullptr, GetAvoidAreaByType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setBackgroundColor", nullptr, SetBackgroundColor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setBrightness", nullptr, SetBrightness, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setKeepScreenOn", nullptr, SetKeepScreenOn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWindowPrivacyMode", nullptr, SetWindowPrivacyMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"snapshot", nullptr, Snapshot, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWindowFocusable", nullptr, SetWindowFocusable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWindowTouchable", nullptr, SetWindowTouchable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getWindowPorperties", nullptr, GetWindowPorperties, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerMouseFilter", nullptr, registerMouseFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearMouseFilter", nullptr, clearMouseFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerTouchFilter", nullptr, registerTouchFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearTouchFilter", nullptr, clearTouchFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAllWIndowLayOutInfo", nullptr, getAllWIndowLayOutInfo, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
