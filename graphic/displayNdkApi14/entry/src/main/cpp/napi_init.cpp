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
#include "napi/native_api.h"
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstring>
#define LOG_TAG "DisplayManager_NDK"
#include <hilog/log.h>
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>
#include <window_manager/oh_display_capture.h>
#include <multimedia/image_framework/image/pixelmap_native.h>


static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}
static napi_value CreateJsValue(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env,value,&result);
    return result;
}

static napi_value CreateJsValue(napi_env env, uint32_t value)
{
    napi_value result = nullptr;
    napi_create_uint32(env,value,&result);
    return result;
}

static napi_value CreateJsValue(napi_env env, double value)
{
    napi_value result = nullptr;
    napi_create_double(env,value,&result);
    return result;
}

static napi_value CreateJsString(napi_env env, char* value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env,value,strlen(value),&result);
    return result;
}

static napi_value CreateJsColorSpaceArray(napi_env env, NativeDisplayManager_DisplayColorSpace *colorSpaces)
{
    napi_value arrayValue = nullptr;
    if(colorSpaces != nullptr){
        napi_create_array_with_length(env,colorSpaces->colorSpaceLength,&arrayValue);
        for(int index = 0;index < colorSpaces->colorSpaceLength;index++){
            napi_set_element(env,arrayValue,index,CreateJsValue(env,colorSpaces->colorSpaces[index]));
        }
    }else{
        napi_create_array_with_length(env,0,&arrayValue);
    }
    return arrayValue;
}

static napi_value CreateJsHDRFormatArray(napi_env env, NativeDisplayManager_DisplayHdrFormat *hdrFormats)
{
    napi_value arrayValue = nullptr;
    if(hdrFormats != nullptr){
        napi_create_array_with_length(env,hdrFormats->hdrFormatLength,&arrayValue);
        for(int index = 0;index < hdrFormats->hdrFormatLength;index++){
            napi_set_element(env,arrayValue,index,CreateJsValue(env,hdrFormats->hdrFormats[index]));
        }
    }else{
        napi_create_array_with_length(env,0,&arrayValue);
    }
    return arrayValue;
}

static void NapiSetNameProperty(napi_env env,napi_value objValue,NativeDisplayManager_DisplayInfo *info)
{
    if(objValue == nullptr || info == nullptr){
        OH_LOG_INFO(LOG_APP, "objValue or DisplayInfo is null");
        return;
    }
    napi_set_named_property(env,objValue,"id",CreateJsValue(env,info->id));
    napi_set_named_property(env,objValue,"name",CreateJsString(env,info->name));
    napi_set_named_property(env,objValue,"alive",CreateJsValue(env,info->isAlive));
    napi_set_named_property(env,objValue,"width",CreateJsValue(env,info->width));
    napi_set_named_property(env,objValue,"height",CreateJsValue(env,info->height));
    napi_set_named_property(env,objValue,"physicalWidth",CreateJsValue(env,info->physicalWidth));
    napi_set_named_property(env,objValue,"physicalHeight",CreateJsValue(env,info->physicalHeight));
    napi_set_named_property(env,objValue,"refreshRate",CreateJsValue(env,info->refreshRate));
    napi_set_named_property(env,objValue,"availableWidth",CreateJsValue(env,info->availableWidth));
    napi_set_named_property(env,objValue,"availableHeight",CreateJsValue(env,info->availableHeight));
    napi_set_named_property(env,objValue,"densityDPI",CreateJsValue(env,info->densityDPI));
    napi_set_named_property(env,objValue,"densityPixels",CreateJsValue(env,info->densityPixels));
    napi_set_named_property(env,objValue,"scaledDensity",CreateJsValue(env,info->scaledDensity));
    napi_set_named_property(env,objValue,"xDPI",CreateJsValue(env,info->xDPI));
    napi_set_named_property(env,objValue,"yDPI",CreateJsValue(env,info->yDPI));
    napi_set_named_property(env,objValue,"rotation",CreateJsValue(env,info->rotation));
    napi_set_named_property(env,objValue,"state",CreateJsValue(env,info->state));
    napi_set_named_property(env,objValue,"orientation",CreateJsValue(env,info->orientation));
    napi_set_named_property(env,objValue,"hdrFormat",CreateJsHDRFormatArray(env,info->hdrFormat));
    napi_set_named_property(env,objValue,"colorSpace",CreateJsColorSpaceArray(env,info->colorSpace));
}

static napi_value GetPrimaryDisplay(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "get primary display");
    NativeDisplayManager_DisplayInfo *displayInfo = nullptr;
    napi_value objValue = nullptr;

    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreatePrimaryDisplay(&displayInfo);
    OH_LOG_INFO(LOG_APP, "get primary diaplay errCode =%{public}d.",errCode);
    if(errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK){
        napi_create_object(env,&objValue);
        NapiSetNameProperty(env,objValue,displayInfo);
        OH_NativeDisplayManager_DestroyDisplay(displayInfo);
    }else{
        napi_create_uint32(env,errCode,&objValue);
    }
    return objValue;
}

static napi_value DestroyDisplayWithoutCreate(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "destroy display without create.");
    NativeDisplayManager_DisplayInfo *displayInfo = nullptr;
    napi_value objValue = nullptr;

    OH_NativeDisplayManager_DestroyDisplay(displayInfo);
    napi_create_uint32(env,NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK,&objValue);   
    return objValue;
}

static napi_value NapiCreateAllDisplay(napi_env env,NativeDisplayManager_DisplaysInfo *infos)
{
    napi_value arrayValue;
    if(infos == nullptr){
        napi_create_array_with_length(env,0,&arrayValue);
    }else{
        napi_create_array_with_length(env,infos->displaysLength,&arrayValue);
        for(int32_t i = 0;i<infos->displaysLength;i++){
            napi_value objValue = nullptr;
            napi_create_object(env,&objValue);
            NativeDisplayManager_DisplayInfo displayItem = infos->displaysInfo[i];
            NapiSetNameProperty(env,objValue,&(displayItem));
            napi_set_element(env,arrayValue,i,objValue);
        }
    }
    return arrayValue;
}

static napi_value GetAllDisplay(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "get all display");
    NativeDisplayManager_DisplaysInfo *displaysInfo = nullptr;
    napi_value arrayValue = nullptr;
                                            
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateAllDisplays(&displaysInfo);
    OH_LOG_INFO(LOG_APP, "get all diaplay errCode =%{public}d.",errCode);
    if(errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK){
        arrayValue = NapiCreateAllDisplay(env,displaysInfo);
        OH_NativeDisplayManager_DestroyAllDisplays(displaysInfo);
    }else{
        napi_create_uint32(env,errCode,&arrayValue);
    }
    return arrayValue;
}

static napi_value GetDisplayById(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env,info,&argc,args,nullptr,nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env,args[0],&valuetype0);
    int32_t displayId;
    napi_get_value_int32(env,args[0],&displayId);
    OH_LOG_INFO(LOG_APP, "get display by id=%{public}d.",displayId);

    NativeDisplayManager_DisplayInfo *displayInfo = nullptr;
    napi_value objValue = nullptr;

    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CreateDisplayById(displayId,&displayInfo);
    OH_LOG_INFO(LOG_APP, "get display by id errCode=%{public}d.",errCode);
    if(errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK){
        napi_create_object(env,&objValue);
        NapiSetNameProperty(env,objValue,displayInfo);
        OH_NativeDisplayManager_DestroyDisplay(displayInfo);
    }else{
        napi_create_uint32(env,errCode,&objValue);
    }
    return objValue;
}

static napi_value GetDisplayState_UNKNOWN(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_UNKNOWN;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_UNKNOWN =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}

static napi_value GetDisplayState_OFF(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_OFF;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_OFF =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}

static napi_value GetDisplayState_ON(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_ON;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_ON =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}

static napi_value GetDisplayState_DOZE(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_DOZE;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_DOZE =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}

static napi_value GetDisplayState_DOZE_SUSPEND(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_DOZE_SUSPEND;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_DOZE_SUSPEND =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}

static napi_value GetDisplayState_VR(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_VR;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_VR =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}

static napi_value GetDisplayState_ON_SUSPEND(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_DisplayState DisplayState = DISPLAY_MANAGER_DISPLAY_STATE_ON_SUSPEND;
    OH_LOG_INFO(LOG_APP, "DISPLAY_MANAGER_DISPLAY_STATE_ON_SUSPEND =%{public}d.",DisplayState);
    napi_value result;
    napi_create_uint32(env,DisplayState,&result);
    return result;
}
static napi_value GetDisplayCapture(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env,info,&argc,args,nullptr,nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env,args[0],&valuetype0);
    int32_t displayId;
    napi_get_value_int32(env,args[0],&displayId);
    OH_LOG_INFO(LOG_APP, "get capture displayId=%{public}d.",displayId);

    OH_PixelmapNative *imagePixelMap = nullptr;
    napi_value objValue = nullptr;
    NativeDisplayManager_ErrorCode errCode = OH_NativeDisplayManager_CaptureScreenPixelmap(displayId,&imagePixelMap);
    OH_LOG_INFO(LOG_APP, "get capture errCode=%{public}d.",errCode);
    if(errCode == NativeDisplayManager_ErrorCode::DISPLAY_MANAGER_OK){
        if(imagePixelMap != nullptr){
            napi_value pixelValue;
            OH_PixelmapNative_ConvertPixelmapNativeToNapi(env,imagePixelMap,&pixelValue);
            OH_PixelmapNative_Release(imagePixelMap);
            return pixelValue;
        }
    }
    napi_create_uint32(env,errCode,&objValue);
    return objValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getPrimaryDisplay", nullptr, GetPrimaryDisplay, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getAllDisplay", nullptr, GetAllDisplay, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayById", nullptr, GetDisplayById, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "destroyDisplayWithoutCreate", nullptr, DestroyDisplayWithoutCreate, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_UNKNOWN", nullptr, GetDisplayState_UNKNOWN, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_OFF", nullptr, GetDisplayState_OFF, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_ON", nullptr, GetDisplayState_ON, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_DOZE_SUSPEND", nullptr, GetDisplayState_DOZE_SUSPEND, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_DOZE", nullptr, GetDisplayState_DOZE, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_VR", nullptr, GetDisplayState_VR, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayState_ON_SUSPEND", nullptr, GetDisplayState_ON_SUSPEND, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getDisplayCapture", nullptr, GetDisplayCapture, nullptr, nullptr, nullptr, napi_default, nullptr },
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
