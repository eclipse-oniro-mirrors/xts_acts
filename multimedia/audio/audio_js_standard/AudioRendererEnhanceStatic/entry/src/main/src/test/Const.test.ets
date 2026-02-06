/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import audio from '@ohos.multimedia.audio';
export namespace testConst {
  //ts-nocheck
  //public invalid
  export const OUTPUT_NUMBER_0: int = 0;
  export const OUTPUT_NUMBER_1: int = 1;
  export const OUTPUT_NUMBER_2: int = 2;
  export const INPUT_PARAMETER_TYPE_NUMBER: int = -1;
  export const INPUT_PARAMETER_TYPE_NUMBER_4: int = 4;
  export const INVALID_PARAMETER_STRING: string = '123'

  //--------------------------------------------------------------
  export const INVALID_INPUT_PARAMETER_401: int = 401;
  export const INVALID_INPUT_PARAMETER_6800101: int = 6800101;
  export const UNSUPORTED_OPTION_6800104: int = 6800104;
  export const UNSUPORTED_OPTION_6800103: int = 6800103;

  //----------------StreamUsage: not streamapi--------------------
  // export const StreamUsage = [0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13];
  export const StreamUsage: audio.StreamUsage[] = [
    audio.StreamUsage.STREAM_USAGE_UNKNOWN,
    audio.StreamUsage.STREAM_USAGE_MUSIC,
    audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
    audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
    audio.StreamUsage.STREAM_USAGE_ALARM,
    audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
    audio.StreamUsage.STREAM_USAGE_RINGTONE,
    audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
    audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
    audio.StreamUsage.STREAM_USAGE_MOVIE,
    audio.StreamUsage.STREAM_USAGE_GAME,
    audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
    audio.StreamUsage.STREAM_USAGE_NAVIGATION,
  ];
}