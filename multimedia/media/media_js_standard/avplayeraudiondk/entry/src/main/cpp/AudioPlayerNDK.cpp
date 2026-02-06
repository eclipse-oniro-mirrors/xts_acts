/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include <bits/alltypes.h>
#include <iostream>
#include "multimedia/player_framework/native_averrors.h"
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <hilog/log.h>
#include <cstdio>

static int32_t g_playTime = 1;

#define LOG(cond, fmt, ...)                                                                                            \
    if (!(cond)) {                                                                                                     \
        (void)printf(fmt, ##__VA_ARGS__);                                                                              \
    }

// OH_PLAYER_PlayerStateSetURLSource_001
static napi_value PlayerStateSetURLSource(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}
// OH_PLAYER_PlayerStatePrepare_002
static napi_value PlayerStatePrepare(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    sleep(g_playTime);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStatePlayer_003
static napi_value PlayerStatePlayer(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVErrCode result3 = OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStatePause_004
static napi_value PlayerStatePause(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVErrCode result3 = OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result4 = OH_AVPlayer_Pause(player);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK && result4 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateStop_005
static napi_value PlayerStateStop(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVErrCode result3 = OH_AVPlayer_Stop(player);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}
// OH_PLAYER_PlayerStateReset_006
static napi_value PlayerStateReset(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Reset(player);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateSetvolume_007
static napi_value PlayerStateSetvolume(napi_env env, napi_callback_info info) {
    float leftVolume = 0.5;
    float rightVolume = 0.5;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVErrCode result3 = OH_AVPlayer_SetVolume(player, leftVolume, rightVolume);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateSeek_008
static napi_value PlayerStateSeek(napi_env env, napi_callback_info info) {
    int32_t mSeconds = 5000;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result3 = OH_AVPlayer_Seek(player, mSeconds, AV_SEEK_NEXT_SYNC);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}
// OH_PLAYER_PlayerStateGetCurrentTime_009
static napi_value PlayerStateGetCurrentTime(napi_env env, napi_callback_info info) {
    int current = 0;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVErrCode result3 = OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result4 = OH_AVPlayer_GetCurrentTime(player, &current);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK && result4 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateSetSpeed_010
static napi_value PlayerStateSetSpeed(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result1 = OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_0_75_X);
    OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_1_00_X);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateGetSpeed_011
static napi_value PlayerStateGetSpeed(napi_env env, napi_callback_info info) {
    AVPlaybackSpeed speed;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVErrCode result1 = OH_AVPlayer_SetURLSource(player, path);
    OH_AVErrCode result2 = OH_AVPlayer_Prepare(player);
    OH_AVErrCode result3 = OH_AVPlayer_Play(player);
    OH_AVPlayer_GetPlaybackSpeed(player, &speed);
    sleep(g_playTime);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == AV_ERR_OK && result3 == AV_ERR_OK && speed == AV_SPEED_FORWARD_1_00_X) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateIsPlaying_012
static napi_value PlayerStateIsPlaying(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    bool result1 = OH_AVPlayer_IsPlaying(player);
    sleep(g_playTime);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == true) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateGetDuration_013
static napi_value PlayerStateGetDuration(napi_env env, napi_callback_info info) {
    int duration = 0;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVErrCode result1 = OH_AVPlayer_GetDuration(player, &duration);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateLoop_014
static napi_value PlayerStateLoop(napi_env env, napi_callback_info info) {
    bool loop = 1;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    OH_AVErrCode result1 = OH_AVPlayer_SetLooping(player, loop);
    sleep(g_playTime);
    bool result2 = OH_AVPlayer_IsLooping(player);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK && result2 == true) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateSetSpeed_1_25_X_015
static napi_value PlayerStateSetSpeed_1_25_X(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result1 = OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_1_25_X);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateSetSpeed_1_75_X_016
static napi_value PlayerStateSetSpeed_1_75_X(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result1 = OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_1_75_X);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_PLAYER_PlayerStateSetSpeed_2_00_X_017
static napi_value PlayerStateSetSpeed_2_00_X(napi_env env, napi_callback_info info) {
    OH_AVPlayer *player = OH_AVPlayer_Create();
    const char *path = "data/test/01.mp3";
    OH_AVPlayer_SetURLSource(player, path);
    OH_AVPlayer_Prepare(player);
    OH_AVPlayer_Play(player);
    sleep(g_playTime);
    OH_AVErrCode result1 = OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_2_00_X);
    OH_AVPlayer_Release(player);
    napi_value res;
    OH_AVErrCode result;
    if (result1 == AV_ERR_OK) {
        result = AV_ERR_OK;
    } else {
        result = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, result, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"PlayerStateSetURLSource", nullptr, PlayerStateSetURLSource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStatePrepare", nullptr, PlayerStatePrepare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStatePlayer", nullptr, PlayerStatePlayer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStatePause", nullptr, PlayerStatePause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateStop", nullptr, PlayerStateStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateReset", nullptr, PlayerStateReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateSetvolume", nullptr, PlayerStateSetvolume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateSeek", nullptr, PlayerStateSeek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateGetCurrentTime", nullptr, PlayerStateGetCurrentTime, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"PlayerStateSetSpeed", nullptr, PlayerStateSetSpeed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateGetSpeed", nullptr, PlayerStateGetSpeed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateIsPlaying", nullptr, PlayerStateIsPlaying, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateGetDuration", nullptr, PlayerStateGetDuration, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateLoop", nullptr, PlayerStateLoop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateSetSpeed_1_25_X", nullptr, PlayerStateSetSpeed_1_25_X, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateSetSpeed_1_75_X", nullptr, PlayerStateSetSpeed_1_75_X, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PlayerStateSetSpeed_2_00_X", nullptr, PlayerStateSetSpeed_2_00_X, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
