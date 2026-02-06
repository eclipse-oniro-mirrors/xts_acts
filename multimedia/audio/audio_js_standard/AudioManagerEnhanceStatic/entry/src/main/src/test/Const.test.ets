/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import audio from '@ohos.multimedia.audio';
export namespace TestConst {
  //public invalid
  export const SAMPLING_RATE_44100: int = 44100;

  export const SAMPLING_RATE_48000: int = 48000;

  export const OUTPUT_NUMBER_0: int = 0;

  export const OUTPUT_NUMBER_1: int = 1;

  //--------------------------------------------------------------
  export const INVALID_INPUT_PARAMETER_401: int = 401;

  export const INVALID_INPUT_PARAMETER_6800101: int = 6800101;

  export const UNSUPORTED_OPTION_6800104: int = 6800104;

  //export const DEAFULT_MEDIA_DB: int = 0.08370080590248108;

  //---------------AudioVolumeType: not steamapi------------------

  export const AudioVolumeType: audio.AudioVolumeType[] = [
    audio.AudioVolumeType.VOICE_CALL,
    audio.AudioVolumeType.RINGTONE,
    audio.AudioVolumeType.MEDIA,
    audio.AudioVolumeType.ALARM,
    audio.AudioVolumeType.ACCESSIBILITY,
    audio.AudioVolumeType.VOICE_ASSISTANT
  ];
}
