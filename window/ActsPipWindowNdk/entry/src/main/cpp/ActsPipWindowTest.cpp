/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#define LOG_TAG "PipWindow"
#include <hilog/log.h>
#include <window_manager/oh_window_pip.h>
#include <chrono>
#include <thread>

constexpr int32_t TWO = 2;
constexpr int32_t THREE = 3;
constexpr int32_t FOUR = 4;
constexpr int32_t FIVE = 5;
constexpr int32_t SIX = 6;
constexpr int32_t SEVEN = 7;
constexpr int32_t EIGHT = 8;
constexpr int32_t NINE = 9;
constexpr int32_t SIXTEEN = 16;
constexpr int32_t ONE_ZERO_ONE = 101;
constexpr int32_t ONE_ZERO_TWO = 102;
constexpr int32_t TWO_ZERO_ONE = 201;
constexpr int32_t TWO_ZERO_TWO = 202;
constexpr int32_t TWO_ZERO_THREE = 203;
constexpr int32_t TWO_ZERO_FOUR = 204;
constexpr int32_t THREE_ZERO_ONE = 301;
constexpr int32_t THREE_ZERO_TWO = 302;
constexpr int32_t THREE_ZERO_THREE = 303;
constexpr int32_t THREE_ZERO_FOUR = 304;
constexpr int32_t FOUR_ZERO_ONE = 401;
constexpr int32_t FOUR_ZERO_TWO = 402;
constexpr int32_t FAIL = -1;
constexpr int32_t SUCCESS = 0;
constexpr int32_t WIDTH = 50;
constexpr int32_t HEIGHT = 50;
constexpr int32_t RECT_VALUE = 1000;
int32_t g_timer1 = 0;
int32_t g_timer2 = 0;
int32_t g_timer3 = 0;
int32_t g_timer4 = 0;
int32_t g_timer5 = 0;
int32_t g_timer6 = 0;
int32_t g_timer7 = 0;
int32_t g_timer8 = 0;

static napi_value TestPipTemplateTypeEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    napi_value enum1;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_PLAY, &enum1);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_PLAY=%{public}d",
        PictureInPicture_PipTemplateType::VIDEO_PLAY);
    napi_set_named_property(env, result, "VIDEO_PLAY", enum1);
    napi_value enum2;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_CALL, &enum2);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_CALL=%{public}d",
        PictureInPicture_PipTemplateType::VIDEO_CALL);
    napi_set_named_property(env, result, "VIDEO_CALL", enum2);
    napi_value enum3;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_MEETING, &enum3);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_MEETING=%{public}d",
        PictureInPicture_PipTemplateType::VIDEO_MEETING);
    napi_set_named_property(env, result, "VIDEO_MEETING", enum3);
    napi_value enum4;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_LIVE, &enum4);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_LIVE=%{public}d",
        PictureInPicture_PipTemplateType::VIDEO_LIVE);
    napi_set_named_property(env, result, "VIDEO_LIVE", enum4);
    return result;
}

static napi_value TestPipControlGroupEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_PLAY_VIDEO_PREVIOUS_NEXT=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_PLAY_VIDEO_PREVIOUS_NEXT);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_MICROPHONE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_MICROPHONE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_HANG_UP_BUTTON=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_HANG_UP_BUTTON);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_CAMERA_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_CAMERA_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_MUTE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_HANG_UP_BUTTON=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_HANG_UP_BUTTON);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_CAMERA_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_CAMERA_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MUTE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_MICROPHONE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MICROPHONE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_LIVE_VIDEO_PLAY_PAUSE=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_LIVE_VIDEO_PLAY_PAUSE);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_LIVE_MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_LIVE_MUTE_SWITCH);
    if (PictureInPicture_PipControlGroup::VIDEO_PLAY_VIDEO_PREVIOUS_NEXT != ONE_ZERO_ONE ||
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD != ONE_ZERO_TWO ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_MICROPHONE_SWITCH != TWO_ZERO_ONE ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_HANG_UP_BUTTON != TWO_ZERO_TWO ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_CAMERA_SWITCH != TWO_ZERO_THREE ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_MUTE_SWITCH != TWO_ZERO_FOUR ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_HANG_UP_BUTTON != THREE_ZERO_ONE ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_CAMERA_SWITCH != THREE_ZERO_TWO ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MUTE_SWITCH != THREE_ZERO_THREE ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MICROPHONE_SWITCH != THREE_ZERO_FOUR ||
        PictureInPicture_PipControlGroup::VIDEO_LIVE_VIDEO_PLAY_PAUSE != FOUR_ZERO_ONE ||
        PictureInPicture_PipControlGroup::VIDEO_LIVE_MUTE_SWITCH != FOUR_ZERO_TWO) {
            napi_create_int32(env, FAIL, &result);
            return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestPipControlTypeEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::VIDEO_PLAY_PAUSE=%{public}d",
        PictureInPicture_PipControlType::VIDEO_PLAY_PAUSE);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::VIDEO_PREVIOUS=%{public}d",
        PictureInPicture_PipControlType::VIDEO_PREVIOUS);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::VIDEO_NEXT=%{public}d",
        PictureInPicture_PipControlType::VIDEO_NEXT);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::FAST_FORWARD=%{public}d",
        PictureInPicture_PipControlType::FAST_FORWARD);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::FAST_BACKWARD=%{public}d",
        PictureInPicture_PipControlType::FAST_BACKWARD);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::HANG_UP_BUTTON=%{public}d",
        PictureInPicture_PipControlType::HANG_UP_BUTTON);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::MICROPHONE_SWITCH=%{public}d",
        PictureInPicture_PipControlType::MICROPHONE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::CAMERA_SWITCH=%{public}d",
        PictureInPicture_PipControlType::CAMERA_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlType::MUTE_SWITCH);
    
    if (PictureInPicture_PipControlType::VIDEO_PLAY_PAUSE != 0 ||
        PictureInPicture_PipControlType::VIDEO_PREVIOUS != 1 ||
        PictureInPicture_PipControlType::VIDEO_NEXT != TWO ||
        PictureInPicture_PipControlType::FAST_FORWARD != THREE ||
        PictureInPicture_PipControlType::FAST_BACKWARD != FOUR ||
        PictureInPicture_PipControlType::HANG_UP_BUTTON != FIVE ||
        PictureInPicture_PipControlType::MICROPHONE_SWITCH != SIX ||
        PictureInPicture_PipControlType::CAMERA_SWITCH != SEVEN ||
        PictureInPicture_PipControlType::MUTE_SWITCH != EIGHT) {
            napi_create_int32(env, FAIL, &result);
            return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestPipControlStatusEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::PLAY=%{public}d",
        PictureInPicture_PipControlStatus::PLAY);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::PAUSE=%{public}d",
        PictureInPicture_PipControlStatus::PAUSE);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::OPEN=%{public}d",
        PictureInPicture_PipControlStatus::OPEN);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::CLOSE=%{public}d",
        PictureInPicture_PipControlStatus::CLOSE);
    
    if (PictureInPicture_PipControlStatus::PLAY != 1 ||
        PictureInPicture_PipControlStatus::PAUSE != 0 ||
        PictureInPicture_PipControlStatus::OPEN != 1 ||
        PictureInPicture_PipControlStatus::CLOSE != 0) {
            napi_create_int32(env, FAIL, &result);
            return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestCreatePip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestCreatePip_ControllerId_Nullptr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip_ControllerId_Nullptr mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, nullptr);
    OH_LOG_INFO(LOG_APP, "TestCreatePip_ControllerId_Nullptr ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestCreatePip_SetPipMainWindowId_Zero(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip_SetPipMainWindowId_Zero mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip_SetPipMainWindowId_Zero ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestCreatePip_SetErrPipTemplateType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip_SetErrPipTemplateType mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_CALL;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestCreatePip_SetErrPipTemplateType ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestStartStopPip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestStartStopPip mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestStartStopPip res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    int32_t ret = OH_PictureInPicture_StartPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestStartStopPip ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestStartPipRepeat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestStartPipRepeat mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestStartPipRepeat res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_StartPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestStartPipRepeat ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestStopPipRepeat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestStopPipRepeat mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestStopPipRepeat res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestStopPipRepeat ret=%{public}d", ret);
    std::this_thread::sleep_for(std::chrono::seconds(1));
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestStopPipRepeat 2 ret=%{public}d", ret);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestDeletePipWithStopPip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestDeletePipWithStopPip mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestDeletePipWithStopPip res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    OH_PictureInPicture_StopPip(controllerId);
    int32_t ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestDeletePipWithStopPip ret=%{public}d", ret);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestDeletePipWithoutStopPip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestDeletePipWithoutStopPip mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestDeletePipWithoutStopPip ret=%{public}d", ret);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestUpdatePipContentSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentSize mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentSize res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 1, 1);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentSize ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestUpdatePipContentStatus(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentStatus res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    int32_t ret0 = OH_PictureInPicture_StartPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentStatus ret0=%{public}d", ret0);
    uint32_t controlType = 0;
    uint32_t status2 = 0;
    uint32_t status = 1;
    int32_t ret = OH_PictureInPicture_UpdatePipControlStatus(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType),
        static_cast<PictureInPicture_PipControlStatus>(status));
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentStatus ret=%{public}d", ret);
    int32_t ret2 = OH_PictureInPicture_SetPipControlEnabled(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType), status2);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentStatus ret2=%{public}d", ret2);
    if (ret != 0 || ret2 != 0 || ret0 != 0) {
        napi_create_int32(env, ret0 == 0? (ret == 0? ret2: ret): ret0, &result);
        return result;
    }
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUpdatePipContentEnabled(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentEnabled res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    int32_t ret0 = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentEnabled ret0=%{public}d", ret0);
    if (ret0 != 0) {
        napi_create_int32(env, ret0, &result);
        return result;
    }
    uint32_t controlType = 0;
    int32_t ret = OH_PictureInPicture_SetPipControlEnabled(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType), 1);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentEnabled ret=%{public}d", ret);
    int32_t ret2 = OH_PictureInPicture_SetPipControlEnabled(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType), 0);
    OH_LOG_INFO(LOG_APP, "TestUpdatePipContentEnabled ret2=%{public}d", ret2);
    if (ret != 0 || ret2 != 0) {
        napi_create_int32(env, ret == 0? ret2: ret, &result);
        return result;
    }
   
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipStartPipCallback1(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    g_timer1++;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback1 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback1 surfaceId=%{public}lu.", surfaceId);
}

void WebPipStartPipUnRegisterCallback1(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    g_timer1--;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback1 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback1 surfaceId=%{public}lu.", surfaceId);
}

void WebPipStartPipCallback2(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    g_timer2++;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback2 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback2 surfaceId=%{public}lu.", surfaceId);
}

void WebPipStartPipUnRegisterCallback2(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    g_timer2--;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback2 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback2 surfaceId=%{public}lu.", surfaceId);
}

static napi_value TestRegisterStartPipCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback g_timer1=%{public}d", g_timer1);
    if (ret != 0 || g_timer1 != 1) {
        napi_create_int32(env, ret == 0? g_timer1: ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestTwoRegisterStartPipCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback2);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback g_timer1=%{public}d", g_timer1);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback g_timer2=%{public}d", g_timer2);
    if (ret != 0 || g_timer1 != 1 || g_timer2 != 1) {
        napi_create_int32(env, ret == 0? (g_timer1 == 1? g_timer2: g_timer1): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipUnRegisterCallback1);
    OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterStartPipCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback2);
    OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback g_timer1=%{public}d", g_timer1);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback g_timer2=%{public}d", g_timer2);
    if (ret != 0 || g_timer1 != 0 || g_timer2 != 1) {
        napi_create_int32(env, ret == 0? (g_timer1 == 0? g_timer2: g_timer1): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllStartPipCallbacks(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllStartPipCallbacks mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllStartPipCallbacks res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback2);
    OH_PictureInPicture_UnregisterAllStartPipCallbacks(controllerId);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllStartPipCallbacks OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllStartPipCallbacks OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllStartPipCallbacks OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback g_timer1=%{public}d", g_timer1);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback g_timer2=%{public}d", g_timer2);
    if (ret != 0 || g_timer1 != 0 || g_timer2 != 0) {
        napi_create_int32(env, ret == 0? (g_timer1 == 0? g_timer2: g_timer1): ret, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipResizeCallback1(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    g_timer3++;
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 scale=%{public}lu.", scale);
}

void WebPipResizeUnRegisterCallback1(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    g_timer3--;
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 scale=%{public}lu.", scale);
}

void WebPipResizeCallback2(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    g_timer4++;
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 scale=%{public}lu.", scale);
}

void WebPipResizeUnRegisterCallback2(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    g_timer4--;
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 scale=%{public}lu.", scale);
}

static napi_value TestRegisterResizeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener g_timer3=%{public}d", g_timer3);
    if (ret != 0 || g_timer3 != 1) {
        napi_create_int32(env, ret == 0? g_timer3: ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestTwoRegisterResizeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback2);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener g_timer3=%{public}d", g_timer3);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener g_timer4=%{public}d", g_timer4);
    if (ret != 0 || g_timer3 != 1 || g_timer4 != 1) {
        napi_create_int32(env, ret == 0? (g_timer3 == 1? g_timer4: g_timer3): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeUnRegisterCallback1);
    OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterResizeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback2);
    OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener g_timer3=%{public}d", g_timer3);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener g_timer4=%{public}d", g_timer4);
    if (ret != 0 || g_timer3 != 0 || g_timer4 != 1) {
        napi_create_int32(env, ret == 0? (g_timer3 == 0? g_timer4: g_timer3): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllResizeListeners(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_UnregisterAllResizeListeners(controllerId);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners g_timer3=%{public}d", g_timer3);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners g_timer4=%{public}d", g_timer4);
    if (ret != 0 || g_timer3 != 0 || g_timer4 != 0) {
        napi_create_int32(env, ret == 0? (g_timer3 == 0? g_timer4: g_timer3): ret, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipControlEventCallback1(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    g_timer5++;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback1 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback1 status=%{public}lu.", status);
}

void WebPipControlEventUnRegisterCallback1(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    g_timer5--;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback1 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback1 status=%{public}lu.", status);
}

void WebPipControlEventCallback2(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    g_timer6++;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback2 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback2 status=%{public}lu.", status);
}

void WebPipControlEventUnRegisterCallback2(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    g_timer6--;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback2 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback2 status=%{public}lu.", status);
}

static napi_value TestRegisterControlEventListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener g_timer5=%{public}d", g_timer5);
    if (ret != 0 || g_timer5 != 1) {
        napi_create_int32(env, ret == 0? g_timer5: ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterControlEventListener(controllerId, WebPipControlEventUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterControlEventListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback1);
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback2);
    OH_PictureInPicture_UnregisterControlEventListener(controllerId, WebPipControlEventUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener g_timer5=%{public}d", g_timer5);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener g_timer6=%{public}d", g_timer6);
    if (ret != 0 || g_timer5 != 0 || g_timer6 != 1) {
        napi_create_int32(env, ret == 0? (g_timer5 == 0? g_timer6: g_timer5): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterControlEventListener(controllerId, WebPipControlEventUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllControlEventListeners(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback1);
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback2);
    OH_PictureInPicture_UnregisterAllControlEventListeners(controllerId);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, WIDTH, HEIGHT);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners g_timer5=%{public}d", g_timer5);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners g_timer6=%{public}d", g_timer6);
    if (ret != 0 || g_timer5 != 0 || g_timer6 != 0) {
        napi_create_int32(env, ret == 0? (g_timer5 == 0? g_timer6: g_timer5): ret, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipLifecycleCallback1(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    g_timer7++;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback1 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback1 errcode=%{public}lu.", errcode);
}

void WebPipLifecycleUnRegisterCallback1(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    g_timer7 = g_timer7 - TWO;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback1 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback1 errcode=%{public}lu.", errcode);
}

void WebPipLifecycleCallback2(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    g_timer8++;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback2 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback2 errcode=%{public}lu.", errcode);
}

void WebPipLifecycleUnRegisterCallback2(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    g_timer8 = g_timer8 - TWO;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback2 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback2 errcode=%{public}lu.", errcode);
}

static napi_value TestRegisterLifeCycleListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestRegisterLifeCycleListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterLifeCycleListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestRegisterLifeCycleListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterLifeCycleListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestRegisterLifeCycleListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener g_timer7=%{public}d", g_timer7);
    if (ret != 0 || g_timer7 != TWO) {
        napi_create_int32(env, ret == 0? g_timer7: ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestTwoRegisterLifeCycleListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback2);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener g_timer7=%{public}d", g_timer7);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener g_timer8=%{public}d", g_timer8);
    if (ret != 0 || g_timer7 != TWO || g_timer8 != TWO) {
        napi_create_int32(env, ret == 0? (g_timer7 == TWO? g_timer8: g_timer7): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleUnRegisterCallback1);
    OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterLifeCycleListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback2);
    OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener g_timer7=%{public}d", g_timer7);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener g_timer8=%{public}d", g_timer8);
    if (ret != 0 || g_timer7 != 0 || g_timer8 != TWO) {
        napi_create_int32(env, ret == 0? (g_timer7 == 0? g_timer8: g_timer7): ret, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllLifeCycleListeners(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t res = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners res=%{public}d", res);
    if (res != 0) {
        napi_create_int32(env, res, &result);
        return result;
    }
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback2);
    OH_PictureInPicture_UnregisterAllLifecycleListeners(controllerId);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners g_timer7=%{public}d", g_timer7);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners g_timer8=%{public}d", g_timer8);
    if (ret != 0 || g_timer7 != 0 || g_timer8 != 0) {
        napi_create_int32(env, ret == 0? (g_timer7 == 0? g_timer8: g_timer7): ret, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestSetPipInitialSurfaceRect(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestSetPipInitialSurfaceRect mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestSetPipInitialSurfaceRect ret=%{public}d", ret);
    int32_t res = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, RECT_VALUE, RECT_VALUE,
        RECT_VALUE, RECT_VALUE);
    OH_LOG_INFO(LOG_APP, "TestSetPipInitialSurfaceRect res=%{public}d", res);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    if (ret != 0 || res != 0) {
        napi_create_int32(env, ret == 0? res: ret, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestSetPipInitialSurfaceRectwithInvalidWidth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestSetPipInitialSurfaceRectwithInvalidWidth mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestSetPipInitialSurfaceRectwithInvalidWidth ret=%{public}d", ret);
    int32_t res = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, RECT_VALUE, RECT_VALUE, 0, RECT_VALUE);
    OH_LOG_INFO(LOG_APP, "TestSetPipInitialSurfaceRectwithInvalidWidth res=%{public}d", res);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    if (ret != 0) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value TestUnsetPipInitialSurfaceRect(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestUnsetPipInitialSurfaceRect mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, NINE, SIXTEEN);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnsetPipInitialSurfaceRect ret=%{public}d", ret);
    int32_t res = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, RECT_VALUE, RECT_VALUE,
        RECT_VALUE, RECT_VALUE);
    int32_t res1 = OH_PictureInPicture_UnsetPipInitialSurfaceRect(controllerId);
    OH_LOG_INFO(LOG_APP, "TestUnsetPipInitialSurfaceRect res=%{public}d", res);
    OH_LOG_INFO(LOG_APP, "TestUnsetPipInitialSurfaceRect res1=%{public}d", res1);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    if (ret != 0 || res1 != 0) {
        napi_create_int32(env, ret == 0? res1: ret, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestPipSetParentWindowIdwithNonExistedWindowId(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "TestPipSetParentWindowIdwithNonExistedWindowId windowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    int32_t ret = OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = 0;
    ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    int32_t res = OH_PictureInPicture_SetParentWindowId(controllerId, mainWindowId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value TestPipSetParentWindowId(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t subWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &subWindowId);
    OH_LOG_INFO(LOG_APP, "TestPipSetParentWindowId windowId =%{public}d.", subWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    int32_t ret = OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = 0;
    ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    int32_t res = OH_PictureInPicture_SetParentWindowId(controllerId, subWindowId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value TestPictureInPicture_PipState_enum(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    napi_value retValue;
    if (PictureInPicture_PipState::ABOUT_TO_START == 1 &&
        PictureInPicture_PipState::STARTED == TWO &&
        PictureInPicture_PipState::ABOUT_TO_STOP == THREE &&
        PictureInPicture_PipState::STOPPED == FOUR &&
        PictureInPicture_PipState::ABOUT_TO_RESTORE == FIVE &&
        PictureInPicture_PipState::ERROR == SIX) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, -1, &retValue);
    }
    return retValue;
}

static napi_value pipWindowInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "testPipTemplateTypeEnum", nullptr, TestPipTemplateTypeEnum,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipControlGroupEnum", nullptr, TestPipControlGroupEnum,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipControlTypeEnum", nullptr, TestPipControlTypeEnum,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipControlStatusEnum", nullptr, TestPipControlStatusEnum,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip", nullptr, TestCreatePip, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip_ControllerId_Nullptr", nullptr, TestCreatePip_ControllerId_Nullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip_SetPipMainWindowId_Zero", nullptr, TestCreatePip_SetPipMainWindowId_Zero,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip_SetErrPipTemplateType", nullptr, TestCreatePip_SetErrPipTemplateType,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStartStopPip", nullptr, TestStartStopPip, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStartPipRepeat", nullptr, TestStartPipRepeat, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStopPipRepeat", nullptr, TestStopPipRepeat, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testDeletePipWithStopPip", nullptr, TestDeletePipWithStopPip,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testDeletePipWithoutStopPip", nullptr, TestDeletePipWithoutStopPip,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUpdatePipContentSize", nullptr, TestUpdatePipContentSize,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUpdatePipContentStatus", nullptr, TestUpdatePipContentStatus,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUpdatePipContentEnabled", nullptr, TestUpdatePipContentEnabled,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterStartPipCallback", nullptr, TestRegisterStartPipCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testTwoRegisterStartPipCallback", nullptr, TestTwoRegisterStartPipCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterStartPipCallback", nullptr, TestUnregisterStartPipCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllStartPipCallbacks", nullptr, TestUnregisterAllStartPipCallbacks,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterResizeListener", nullptr, TestRegisterResizeListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testTwoRegisterResizeListener", nullptr, TestTwoRegisterResizeListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterResizeListener", nullptr, TestUnregisterResizeListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

static napi_value pipWindowInit2(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testPictureInPicture_PipState_enum", nullptr,
            TestPictureInPicture_PipState_enum, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "testPipSetParentWindowIdwithNonExistedWindowId", nullptr, TestPipSetParentWindowIdwithNonExistedWindowId,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipSetParentWindowId", nullptr, TestPipSetParentWindowId,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    pipWindowInit(env, exports);
    pipWindowInit2(env, exports);
    napi_property_descriptor desc[] = {
        { "testUnregisterAllResizeListeners", nullptr, TestUnregisterAllResizeListeners,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterControlEventListener", nullptr, TestRegisterControlEventListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterControlEventListener", nullptr, TestUnregisterControlEventListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllControlEventListeners", nullptr, TestUnregisterAllControlEventListeners,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterLifeCycleListener", nullptr, TestRegisterLifeCycleListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testTwoRegisterLifeCycleListener", nullptr, TestTwoRegisterLifeCycleListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterLifeCycleListener", nullptr, TestUnregisterLifeCycleListener,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllLifeCycleListeners", nullptr, TestUnregisterAllLifeCycleListeners,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testSetPipInitialSurfaceRect", nullptr, TestSetPipInitialSurfaceRect,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testSetPipInitialSurfaceRectwithInvalidWidth", nullptr, TestSetPipInitialSurfaceRectwithInvalidWidth,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnsetPipInitialSurfaceRect", nullptr, TestUnsetPipInitialSurfaceRect,
            nullptr, nullptr, nullptr, napi_default, nullptr },
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
