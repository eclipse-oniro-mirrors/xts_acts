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
//取值范围     a:1-5, b:大于0, c:0或1, d:大于0, e:0-100, f:0-100
export const AvPlayerInit: (a : number, b : number, c : number, d : number, e : number, f : number) => number;
export const OhAvPlayerCreate: () => number;
export const OhAvPlayerPrepare: () => number;
export const OhAvPlayerGetDuration: () => number;
export const OhAvPlayerPlay: () => number;
export const OhAvPlayerIsPlaying: () => number;
export const OhAvPlayerGetCurrentTime: () => number;
export const OhAvPlayerPause: () => number;
export const OhAvPlayerGetState: () => number;
export const OhAvPlayerGetPlaybackSpeed: () => number;
export const OhAvPlayerIsLooping: () => number;
export const OhAvPlayerGetCurrentTrack: () => number;
export const OhAvPlayerGetVideoHeight: () => number;
export const OhAvPlayerGetVideoWidth: () => number;

export const OhAvPlayerDeselectTrack: () => number;
export const OhAvPlayerRelease: () => number;

export const OhAvPlayerReleaseSync: () => number;
export const OhAvPlayerReset: () => number;
export const OhAvPlayerSeek: (a : number, b :number) => number;  //a < 视频总长度， b 0 或 1
export const OhAvPlayerSelectBitRate: (a : number) => number;   // 取值范围：a > 0
export const OhAvPlayerSelectTrack: (a : number) => number;
export const OhAvPlayerSetLooping: (a : number) => number;   // 取值范围：0 或 1
export const OhAvPlayerSetPlayerCallback: () => number;
export const OhAvPlayerSetPlaybackSpeed: (a : number) => number;   // 取值范围：1 - 5
export const OhAvPlayerSetVideoSurface: () => number;
export const OhAvPlayerSetVolume: (a : number, b : number) => number;// 取值范围：a >= 0, a <= 100;b >= 0.b <= 100;
export const OhAvPlayerStop: () => number;
export const OhAvPlayerSetFdPathSource: () => number;
export const OhCloseFile: () => number;
export const OhAvPlayerSetFdPathIndex: (a : number) => number; //获取文件名，设置默认参数
export const OhAvPlayerSetFdPathSourceTwo: () => number;