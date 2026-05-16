/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

/**
 * @addtogroup MultiMedia_AudioCommon
 * @{
 *
 * @brief Provides data types and audio formats required for recording and playing and recording audio.
 *
 *
 * @since 1.0
 * @version 1.0
 */

/**
 * @file audio_errors.h
 *
 * @brief Declares the <b>audio_errors</b> class to define errors that may occur during audio operations.
 *
 *
 * @since 1.0
 * @version 1.0
 */

#ifndef AUDIO_ERRORS_H
#define AUDIO_ERRORS_H

#include <cstdint>

namespace OHOS {
namespace AudioStandard {
constexpr int MODULE_AUDIO = 1;
constexpr int SUBSYS_AUDIO = 30;
constexpr uint32_t OPEN_PORT_FAILURE = static_cast<uint32_t>(-1);

using ErrCode = int32_t;
constexpr int SUBSYSTEM_BIT_NUM = 21;
constexpr int MODULE_BIT_NUM = 16;

constexpr ErrCode ErrCodeOffset(unsigned int subsystem, unsigned int module = 0)
{
    return (subsystem << SUBSYSTEM_BIT_NUM) | (module << MODULE_BIT_NUM);
}

constexpr int32_t BASE_AUDIO_ERR_OFFSET = -ErrCodeOffset(SUBSYS_AUDIO, MODULE_AUDIO);

/** Success */
const int32_t SUCCESS = 0;

/** Fail */
const int32_t ERROR = BASE_AUDIO_ERR_OFFSET;

/** Status error */
const int32_t ERR_ILLEGAL_STATE = BASE_AUDIO_ERR_OFFSET - 1;

/** Invalid parameter */
const int32_t ERR_INVALID_PARAM = BASE_AUDIO_ERR_OFFSET - 2;

/** Early media preparation */
const int32_t ERR_EARLY_PREPARE = BASE_AUDIO_ERR_OFFSET - 3;

/** Invalid operation */
const int32_t ERR_INVALID_OPERATION = BASE_AUDIO_ERR_OFFSET - 4;

/** error operation failed */
const int32_t ERR_OPERATION_FAILED = BASE_AUDIO_ERR_OFFSET - 5;

/** Buffer reading failed */
const int32_t ERR_READ_BUFFER = BASE_AUDIO_ERR_OFFSET - 6;

/** Buffer writing failed */
const int32_t ERR_WRITE_BUFFER = BASE_AUDIO_ERR_OFFSET - 7;

/**  Device not started */
const int32_t ERR_NOT_STARTED = BASE_AUDIO_ERR_OFFSET - 8;

/**  Invalid Device handle */
const int32_t ERR_INVALID_HANDLE = BASE_AUDIO_ERR_OFFSET - 9;

/**  unsupported operation */
const int32_t ERR_NOT_SUPPORTED = BASE_AUDIO_ERR_OFFSET - 10;

/**  unsupported device */
const int32_t ERR_DEVICE_NOT_SUPPORTED = BASE_AUDIO_ERR_OFFSET - 11;

/**  write operation failed */
const int32_t ERR_WRITE_FAILED = BASE_AUDIO_ERR_OFFSET - 12;

/**  read operation failed */
const int32_t ERR_READ_FAILED = BASE_AUDIO_ERR_OFFSET - 13;

/**  device init failed */
const int32_t ERR_DEVICE_INIT = BASE_AUDIO_ERR_OFFSET - 14;

/** Invalid data size that has been read */
const int32_t ERR_INVALID_READ = BASE_AUDIO_ERR_OFFSET - 15;

/** Invalid data size that has been written */
const int32_t ERR_INVALID_WRITE = BASE_AUDIO_ERR_OFFSET - 16;

/** set invalid index < 0 */
const int32_t ERR_INVALID_INDEX = BASE_AUDIO_ERR_OFFSET - 17;

/** focus request denied */
const int32_t ERR_FOCUS_DENIED = BASE_AUDIO_ERR_OFFSET - 18;

/** incorrect render/capture mode */
const int32_t ERR_INCORRECT_MODE = BASE_AUDIO_ERR_OFFSET - 19;

/** incorrect render/capture mode */
const int32_t ERR_PERMISSION_DENIED = BASE_AUDIO_ERR_OFFSET - 20;

/** Memory alloc failed */
const int32_t ERR_MEMORY_ALLOC_FAILED = BASE_AUDIO_ERR_OFFSET - 21;

/** microphone is disabled by EDM */
const int32_t ERR_MICROPHONE_DISABLED_BY_EDM = BASE_AUDIO_ERR_OFFSET - 22;

/** system permission denied */
const int32_t ERR_SYSTEM_PERMISSION_DENIED = BASE_AUDIO_ERR_OFFSET - 23;

/** callback not registered */
const int32_t ERR_CALLBACK_NOT_REGISTERED = BASE_AUDIO_ERR_OFFSET - 24;

/** need not switch device */
const int32_t ERR_NEED_NOT_SWITCH_DEVICE = BASE_AUDIO_ERR_OFFSET - 25;

const int32_t ERR_CONCEDE_INCOMING_STREAM = BASE_AUDIO_ERR_OFFSET - 26;

const int32_t ERR_RENDERER_IN_SERVER_UNDERRUN = BASE_AUDIO_ERR_OFFSET - 27;

/**exceed max audio stream cnt*/
const int32_t ERR_EXCEED_MAX_STREAM_CNT = BASE_AUDIO_ERR_OFFSET - 28;

/**exceed max audio stream cnt per uid*/
const int32_t ERR_EXCEED_MAX_STREAM_CNT_PER_UID = BASE_AUDIO_ERR_OFFSET - 29;

/**null pointer*/
const int32_t ERR_NULL_POINTER = BASE_AUDIO_ERR_OFFSET - 30;

/**multimode subscription failed*/
const int32_t ERR_MMI_SUBSCRIBE = BASE_AUDIO_ERR_OFFSET - 31;

/**multimode creation failed*/
const int32_t ERR_MMI_CREATION = BASE_AUDIO_ERR_OFFSET - 32;

/** set volume failed for not complying with safe volume regulation */
const int32_t ERR_SET_VOL_FAILED_BY_SAFE_VOL = BASE_AUDIO_ERR_OFFSET - 33;

/** add capture over limit */
const int32_t ERR_ADD_CAPTURE_OVER_LIMIT = BASE_AUDIO_ERR_OFFSET - 34;

/** add capture over limit */
const int32_t ERR_CONFIG_NAME_ERROR = BASE_AUDIO_ERR_OFFSET - 35;

/** retry in client */
const int32_t ERR_RETRY_IN_CLIENT = BASE_AUDIO_ERR_OFFSET - 36;

/** stream register num exceed max */
const int32_t ERR_AUDIO_STREAM_REGISTER_EXCEED_MAX = BASE_AUDIO_ERR_OFFSET - 37;

/** stream register repeat */
const int32_t ERR_AUDIO_STREAM_REGISTER_REPEAT = BASE_AUDIO_ERR_OFFSET - 38;

/** pro streams do not support for setting loudness*/
const int32_t ERR_PRO_STREAM_NOT_SUPPORTED = BASE_AUDIO_ERR_OFFSET - 39;

/** failed to set volume because isVolumeControlDisabled is true */
const int32_t ERR_SET_VOL_FAILED_BY_VOLUME_CONTROL_DISABLED = BASE_AUDIO_ERR_OFFSET - 40;

/** unsupported audio format, such as unsupported sample, channelCount format etc. */
const int32_t ERR_AUDIO_SUITE_UNSUPPORTED_FORMAT = BASE_AUDIO_ERR_OFFSET - 41;

/** audio engine not exist. */
const int32_t ERR_AUDIO_SUITE_ENGINE_NOT_EXIST = BASE_AUDIO_ERR_OFFSET - 42;

/** audio pipeline not exist. */
const int32_t ERR_AUDIO_SUITE_PIPELINE_NOT_EXIST = BASE_AUDIO_ERR_OFFSET - 43;

/** audio node not exist. */
const int32_t ERR_AUDIO_SUITE_NODE_NOT_EXIST = BASE_AUDIO_ERR_OFFSET - 44;

/** the connect or disconnect betwen the nodes is unsupported. */
const int32_t ERR_AUDIO_SUITE_UNSUPPORT_CONNECT = BASE_AUDIO_ERR_OFFSET - 45;

/** The number of created pipelines or nodes exceeds the system specification. */
const int32_t ERR_AUDIO_SUITE_CREATED_EXCEED_SYSTEM_LIMITS = BASE_AUDIO_ERR_OFFSET - 46;

/** Audio suite function timed out during execution. */
const int32_t ERR_AUDIO_SUITE_TIMEOUT = BASE_AUDIO_ERR_OFFSET - 47;

/** Unknown error */
const int32_t ERR_UNKNOWN = BASE_AUDIO_ERR_OFFSET - 200;

/** success but not continue */
const int32_t SUCCESS_BUT_NOT_CONTINUE = BASE_AUDIO_ERR_OFFSET - 300;
} // namespace AudioStandard
} // namespace OHOS
#endif // AUDIO_ERRORS_H
