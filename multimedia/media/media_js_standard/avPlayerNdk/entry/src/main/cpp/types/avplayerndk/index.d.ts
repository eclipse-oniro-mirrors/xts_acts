/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

interface NdkUser {}

export const AvPlayerCreate: () => number;
export const OhAvPlayerSetCurrentPathId: (a:number) => number;
export const AvPlayerSetURLSourceAbnormalOne: () => number;
export const AvPlayerSetURLSourceAbnormalTwo: () => number;
export const AvPlayerSetFDSource: () => number;
export const AvPlayerSetFDSourceAbnormalOne: () => number;
export const AvPlayerSetFDSourceAbnormalTwo: () => number;
export const AvPlayerSetFDSourceAbnormalThree: () => number;
export const AvPlayerPrepare: (a:number,b:number,c:number) => number;
export const AvPlayerSetAudioRendererInfo: () => number;
export const AvPlayerSetVolumeMode: () => number;
export const AvPlayerSetAudioInterruptMode: () => number;
export const AvPlayerSetAudioEffectMode: () => number;
export const AvPlayerSetOnInfoCallback: (a:number,b:number) => number;
export const AvPlayerSetOnInfoCallbackAbnormal: (a:number, b:number, c:number, d:number) => number;
export const AvPlayerSetOnInfoCallbackWithPrepare: () => number;
export const AvPlayerSetOnErrorCallback: (a:number, b:number) => number;
export const AvPlayerSetOnErrorCallbackAbnormal: (a:number, b:number, c:number, d:number) => number;
export const OhAvPlayerPlaySuccess: (a:number,b:number,c:number, d:number) => number;
export const AvPlayerPlay: (a:number,b:number,c:number, d:number) => number;
export const OhAvPlayerPauseSuccess: (a:number,b:number,c:number, d:number, e:number) => number;
export const AvPlayerPause: (a:number,b:number,c:number, d:number, e:number) => number;
export const AvPlayerStop: (a:number,b:number,c:number, d:number) => number;
export const AvPlayerReset: (a:number,b:number,c:number, d:number, e:number, f:number, g:number) => number;
export const AvPlayerRelease: () => number;
export const AvPlayerReleaseAbnormalOne: () => number;
export const AvPlayerReleaseSync: () => number;
export const AvPlayerReleaseSyncAbnormalOne: () => number;
export const AvPlayerSetVolume: () => number;
export const AvPlayerSetVolumeAbnormalOne: () => number;
export const AvPlayerSeek: () => number;
export const AvPlayerSeekAbnormalOne: () => number;
export const AvPlayerGetCurrentTime: () => number;
export const AvPlayerGetCurrentTimeAbnormalOne: () => number;
export const AvPlayerGetVideoWidth: () => number;
export const AvPlayerGetVideoWidthAbnormalOne: () => number;
export const AvPlayerGetVideoHeight: () => number;
export const AvPlayerGetVideoHeightAbnormalOne: () => number;
export const AvPlayerSetPlaybackSpeed: () => number;
export const AvPlayerSetPlaybackSpeedAbnormalOne: () => number;
export const AvPlayerGetPlaybackSpeed: () => number;
export const AvPlayerGetPlaybackSpeedAbnormalOne: () => number;
export const AvPlayerSetPlaybackSpeedNormalThree: () => number;
export const AvPlayerSetPlaybackSpeedAbnormalThree: () => number;
export const AvPlayerGetPlaybackSpeedNormalThree: () => number;
export const AvPlayerGetPlaybackSpeedAbnormalThree: () => number;
export const AvPlayerSelectBitRate: () => number;
export const AvPlayerSelectBitRateAbnormalOne: () => number;
export const AvPlayerSetVideoSurface: () => number;
export const AvPlayerSetVideoSurfaceAbnormalOne: () => number;
export const AvPlayerSetVideoSurfaceAbnormalTwo: () => number;
export const AvPlayerSetVideoSurfaceAbnormalThree: () => number;
export const AvPlayerGetDuration: () => number;
export const AvPlayerGetDurationAbnormalOne: () => number;
export const AvPlayerGetState: (a:number,b:number,c:number, d:number, e:number) => number;
export const AvPlayerIsPlaying: () => number;
export const AvPlayerIsPlayingAbnormalOne: () => number;
export const AvPlayerIsLooping: () => number;
export const AvPlayerIsLoopingAbnormalOne: () => number;
export const AvPlayerSetLooping: () => number;
export const AvPlayerSetLoopingAbnormalOne: () => number;
export const AvPlayerSetPlayerCallback: () => number;
export const AvPlayerSetPlayerCallbackAbnormalOne: () => number;
export const AvPlayerSetPlayerCallbackAbnormalTwo: () => number;
export const AvPlayerSetPlayerCallbackAbnormalThree: () => number;
export const AvPlayerSelectTrack: () => number;
export const AvPlayerSelectTrackAbnormalOne: () => number;
export const AvPlayerDeselectTrack: () => number;
export const AvPlayerDeselectTrackAbnormalOne: () => number;
export const AvPlayerGetCurrentTrack: () => number;
export const AvPlayerGetCurrentTrackAbnormalOne: () => number;
export const dummy: (a:number,b:number) => number;
export const dummyForSize: (a:number,b:number) => number;
export const AvPlayerPrepareSetPlaybackRate: (a:number) => number;
export const AvPlayerPlaySetPlaybackRate: (a:number) => number;
export const AvPlayerPauseSetPlaybackRate: (a:number) => number;
export const AvPlayerSetPlaybackRateError: (a:number) => number;
export const AvPlayerSetPlaybackRateTwice: (a:number, b: number) => number;
export const AvPlayerSetPlaybackRateAfterSeek: (a:number) => number;
export const AvPlayerSetPlaybackRateBeforeSeek: (a:number) => number;
export const AvPlayerStopSetPlaybackRate: (a:number) => number;
export const AvPlayerIdleSetPlaybackRate: (a:number) => number;
export const AvPlayerInitSetPlaybackRate: (a:number) => number;
export const AvPlayerReleaseSetPlaybackRate: (a:number) => number;
export const AvPlayerErrorSetPlaybackRate: (a:number) => number;
export const AvPlayerCompleteSetPlaybackRate: (a:number) => NdkUser;
export const AvPlayerSetPlaybackRateBeforePause: (a:number) => number;
export const CheckAvPlayerPlaybackRate: (a:NdkUser) => number;
export const setup: (filePath: string, type: number, offset: number, size: number) => number;
export const release: () => number;
export const setLoudnessGain: (loudness:number) => number;
export const setLoudnessGain1: (loudness:number) => number;
export const setLoudnessGain2: (loudness:number) => number;
export const getMediaDescription: () => number;
export const getMediaDescriptionOne: () => number;
export const getTrackDescription: (loudness:number) => number;
export const getTrackDescriptionOne: (loudness:number) => number;
export const getPlaybackStatisticMetrics: (fd: number, offset: number, length: number) => Record<string, number>;
export const getPlaybackStatisticMetricsAbnormal: () => number;
