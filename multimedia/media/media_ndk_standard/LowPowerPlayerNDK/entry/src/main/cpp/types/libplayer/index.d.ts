/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
export const InitFdNative: (
  inputFileFd: number,
  inputFileOffset: number,
  inputFileSize: number,
  cbFn: () => void
) => void;

export const createLppSetNative: () => number
export const syncAudioNative: () => number
export const createLppAudioNative: () => number
export const createLppAudioNativeNull: () => number
export const createLppVideoNative: () => number
export const createLppVideoNativeNull: () => number
export const audioStreamerConfigure: () => number
export const AudioStreamerSetCallbackCreate: () => number
export const AudioStreamerSetCallbackCreateNull: () => number
export const AudioStreamerSetDataNeededListener: () => number
export const AudioStreamerSetPositionUpdateListener: () => number
export const AudioSetErrorCallback: () => number
export const AudioStreamerSetCallback: () => number
export const AudioSetInterruptListener: () => number
export const AudioSetEosCallback: () => number
export const AudioSetOnDeviceChanged: () => number
export const AudioreturnFrames: () => number
export const AudioCallbackDestroy: () => number
export const AudioDestroy: () => number
export const audioSetParameterNative: () => number
export const audioGetParameterNative: () => number
export const audioPrepareNative: () => number
export const VideoStreamerSetCallbackCreateNull: () => number
export const VideoStreamerSetDataNeededListener: () => number
export const VideoStreamerSetStreamChangedListener: () => number
export const VideoStreamerSetCallback: () => number
export const VideoStreamerSetErrorCallback: () => number
export const VideoStreamerSetFirstFrameDecodedCallback: () => number
export const VideoStreamerSetRenderStartCallback: () => number
export const VideoStreamerSetEosCallback: () => number
export const VideoStreamerCallbackDestroy: () => number
export const VideoStreamerDestroy: () => number
export const VideoStreamerreturnFrames: () => number
export const VideoStreamerSetTargetStartFrame: () => number
export const videoConfigureNative: () => number
export const videoStreamerSetParameter: () => number
export const videoStreamerGetParameter: () => number
export const videoSetSurfaceNative: () => number
export const videoPrepareNative: () => number

export const flushNative: () => number
export const audioFlushNative: () => number
export const videoFlushNative: () => number

export const stopNative: () => number
export const audioStopNative: () => number
export const videoStopNative: () => number

export const releaseNative: () => number

export const resetNative: () => number
export const audioResetNative: () => number
export const videoResetNative: () => number

export const pauseNative: () => number
export const audioPauseNative: () => number
export const videoPauseNative: () => number

export const resumeNative: () => number
export const audioResumeNative: () => number
export const videoResumeNative: () => number

export const speedNative: (
  speed: number
) => number

export const setAudioSpeedNative: (
  speed: number
) => number

export const setVideoSpeedNative: (
  speed: number
) => number

export const configureNative: () => number

export const seekNative: (
  seekTime: number,
  mode: number,
  acc: boolean,
) => number

export const seekAccNative: (
  seekTime: number,
) => number

export const setVolumeNative: (
  volume: number,
) => number

export const getDurationTime: (
) => number

export const getProgressTime: (
) => number



export const startNative: () => number

export const createPrepareNative: () => number

export const startDecoderNative: () => number

export const renderFirstFrameNative: () => number

export const startRenderNative: () => number

export const startAudioNative: () => number




