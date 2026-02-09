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

export const LOG_TAG = '[MediaXts].';

export const MAX_COUNT = 999999999;

export const SLEEP_TIME_2: number = 2;

export const SLEEP_TIME_20: number = 20;

export const SLEEP_TIME_100: number = 100;

export const SLEEP_TIME_200: number = 200;

export const SLEEP_TIME_500: number = 500;

export const SLEEP_TIME_2000: number = 2000;

export const SLEEP_TIME_3000: number = 3000;

export const SLEEP_TIME_5000: number = 5000;

export const PLAY_TIME: number = 3000;

export enum MediaErrorCode {
  /**
   * Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types.
   * 3.Parameter verification failed.
   */
  PARAMETER_ERROR = 401,
  /**
   * Operate not permit. Return by callback..
   */
  OPERATE_NOT_PERMIT = 5400102,

  /**
   * IO error. Return by callback.
   */
  IO_ERROR = 5400103,

  /**
   * Service died. Return by callback.
   */
  SERVICE_DIED = 5400105,

  /**
   * Unsupported media format.
   */
  AVERR_UNSUPPORT_FORMAT = 5400106,

  /**
   * No memory. Return by promise.
   */
  NO_MEMORY = 5400101,

  /**
   * Seek continuous unsupported.
   */
  AVERR_SEEK_CONTINUOUS_UNSUPPORTED = 5410002,

  /**
   * Super-resolution unsupported.
   */
  AVERR_SUPER_RESOLUTION_UNSUPPORTED = 5410003,

  /**
   * No PlaybackStrategy set to enable super-resolution feature.
   */
  AVERR_SUPER_RESOLUTION_NOT_ENABLED = 5410004
}

export const VIDEO_SOURCES = [
  'H264_AAC.mp4',
  'h263_aac.mp4',
  'h263_mp3.mp4',
  'MPEG2_AAC.mp4',
  'MPEG2_MP3.mp4',
  'h264_1280x720_30.mp4',
  'H263.mp4',
  'MPEG2.mp4',
  'h264_aac_480p_25r.ts',
  'h264_mp3_480p_25r.ts',
  'H263_AAC.ts',
  'H263_MP3.ts',
  'mpeg2_aac_720p_30r.ts',
  'mpeg2_mp3_480p_25r.ts',
  'mpeg4_aac_720p_30r.ts',
  'mpeg4_mp3_480p_25r.ts',
  'h264_320x240_60.ts',
  'h263_1408x1152_30.ts',
  'MPEG2.ts',
  'mpeg4_320x240_60.ts',
  'H264_AAC.mkv',
  'H264_MP3.mkv',
  'h263_aac_640x480_30r.mkv',
  'h263_mp3_176x144_25r.mkv',
  'MPEG2_AAC.mkv',
  'MPEG2_MP3.mkv',
  'mpeg4_aac_720p_30r.mkv',
  'MPEG4_MP3.mkv',
  'h264_320x240_30.mkv',
  'h263_1408x1152_60.mkv',
  'MPEG2.mkv',
  'mpeg4_320x240_60.mkv',
  'AAC_48000_32_1.aac',
  '01.mp3',
  '56.m4a',
  'OGG_48000_1.ogg',
  'vorbis_48000_32_1.wav',
  'flac_48ksr_16kbr_1ch.flac',
  'H264_MP3_1s.mp4',
  'H264_AAC.m3u8'
];

export const TEST_MP3_FILE = '01.mp3';