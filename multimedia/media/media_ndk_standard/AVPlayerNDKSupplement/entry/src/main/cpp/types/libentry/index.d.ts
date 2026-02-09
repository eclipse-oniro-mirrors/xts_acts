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

import resourceManager from '@ohos.resourceManager';
import media from '@ohos.multimedia.media';

interface NdkAVPlayerUser {}
interface NdkAVPlayerResult {
    userData: NdkAVPlayerUser;
    result: number;
}

export const testSetVideoSuperResolution: (fdSrc: media.AVFileDescriptor, isEnableSuperResolution: boolean) => NdkAVPlayerResult;
export const testSetVideoSuperResolutionError: () => number;
export const testSetTargetVideoWindowSize: (fdSrc: media.AVFileDescriptor, width: number, height: number) => NdkAVPlayerResult;
export const testSetTargetVideoWindowSizeError: () => number;
export const testSetDataSource: (filePath: string, fileSize: number) => NdkAVPlayerResult;
export const testGetPlaybackInfo: (fdSrc: media.AVFileDescriptor) => NdkAVPlayerResult;
export const checkPlaybackInfo: (userData: NdkAVPlayerUser) => Record<string, object>;
export const testGetPlaybackInfoError: () => number;
export const testGetTrackCount: (fdSrc: media.AVFileDescriptor, nullAvPlayer: boolean) => NdkAVPlayerResult;
export const testGetTrackFormat: (fdSrc: media.AVFileDescriptor, trackIndex: number, nullAvPlayer: boolean) => Record<string, object> | undefined;
export const playVideo: (fdSrc: media.AVFileDescriptor) => NdkAVPlayerResult;
export const checkPlaybackPosition: (userData: NdkAVPlayerUser) => number;
export const testGetPlaybackPositionError: () => number;
export const releaseUserData: (userData: NdkAVPlayerUser) => void;
export const checkAVPlayer: (userData: NdkAVPlayerUser) => number;
export const checkSuperResolutionState: (userData: NdkAVPlayerUser, expectValue: boolean) => number;
export const testTrackChange: (fdSrc: media.AVFileDescriptor, index: number) => NdkAVPlayerResult;
export const checkTrackChange: (userData: NdkAVPlayerUser) => number;
export const testMediaSourceWithFd: (fdSrc: media.AVFileDescriptor) => NdkAVPlayerResult;
export const testMediaSourceWithUrl: (url: string) => NdkAVPlayerResult;
export const testSetDataSourceDelegate: (respondDataCount: number, loadingError: number, fdSrc: media.AVFileDescriptor) => NdkAVPlayerResult;
export const testAVHttpHeaderDestroyError: () => number;
export const testAVHttpHeaderAddRecordError: (a: number, b: number) => number;  // a:[0,1], b[0,1]
export const testAVHttpHeaderGetCount: () => number;  // return count
export const testAVHttpHeaderGetCountError: (a: number) => number;  // a:[0,1]
export const testAVHttpHeaderGetRecord: (a: number, b: number, c: number) => number;  // a:[0,1], b:[0,1], c:[0,1]
export const testMediaSourceCreateWithUrl: (a: number, b: number) => number;  // a:[0,2], b:[0,1]
export const testMediaSourceCreateWithFD: (fdSrc: media.AVFileDescriptor) => number;
export const testMediaSourceCreateWithDataSource: (a: number, fdSrc: media.AVFileDescriptor) => number;
export const testMediaSourceSetMimeType: (a: number, b: number) => number;  // a:[0,1], b:[0,2]
export const testAVPlayerSetMediaSource: (a: number, b: number) => number;  // a:[0,1], b:[0,1]
export const testAVMediaSourceLoaderDestroyError: () => number;
export const testAVMediaSourceSetMediaSourceLoaderError: (a: number) => number;  // a:[0,1]
export const testAVMetaSourceLoadingRequestGetUrlError: () => number;
export const testAVMediaSourceLoaderSetSourceOpenCallback: (a: number) => number;  // a:[0,2]
export const testAVMediaSourceLoaderSetSourceReadCallback: (a: number) => number;  // a:[0,2]
export const testAVMediaSourceLoaderSetSourceCloseCallback: (a: number) => number;  // a:[0,2]
export const testAVMediaSourceLoadingRequestGetHttpHeaderError: () => number;

export const OhAVPlayerSetPlaybackRange: (fd: media.AVFileDescriptor, a : number, b : number, c : boolean) => NdkAVPlayerResult;
export const OhAVPlayerSetMediaMuted: (a : number, b : boolean, fd: media.AVFileDescriptor) => NdkAVPlayerResult;
export const OhAVPlayerAddURLSubtitleSource: (a : string, fd: media.AVFileDescriptor) => NdkAVPlayerResult;
export const OhAVPlayerAddFDSubtitleSource: (fd: media.AVFileDescriptor, subtitleFd: media.AVFileDescriptor) => NdkAVPlayerResult;
export const OhAVPlayerIsSeekContinuousSupported: () => number;
export const OhAVPlayerSelectTrackWithMode: (a : number, b : number, fd: media.AVFileDescriptor) => NdkAVPlayerResult;
export const OhAVPlayerSetAmplitudeUpdateCallback: () => number;
export const OhAVPlayerSetSeiReceivedCallback: (a : number[], b : number) => number;
export const OhAVPlayerSetSeiReceivedCallbackWithUserData: (fd: media.AVFileDescriptor) => NdkAVPlayerResult;
export const OhAVPlaybackStrategyCreate: () => number;
export const OhAVPlayerSetPlaybackStrategy: () => NdkAVPlayerResult;
export const OhAVPlaybackStrategySetSuperResolutionEnable: (a:boolean) => number;
export const OhAVPlaybackStrategySetPreferHDR: (a:boolean) => number;
export const OhAVPlaybackStrategySetPreferredHeight: (a:number) => number;
export const OhAVPlaybackStrategySetPreferredWidth: (a:number) => number;
export const OhAVPlaybackStrategySetPreferredBufferDuration: (a:number) => number;
export const OhAVPlaybackStrategySetMutedMediaType: (a:number) => number;
export const OhAVPlaybackStrategySetPreferredAudioLanguage: (a:string) => number;
export const OhAVPlaybackStrategySetPreferredSubtitleLanguage: (a:string) => number;
export const OhAVPlaybackStrategySetShowFirstFrameOnPrepare: (a:boolean) => number;
export const OhAVPlaybackStrategySetPreferredBufferDurationForPlaying: (a:number) => number;
export const OhAVPlaybackStrategySetThresholdForAutoQuickPlay: (a:number) => number;
export const OhAVPlaybackStrategySetKeepDecodingOnMute: (a:boolean) => number;
export const checkErrorCode: (userData: NdkAVPlayerUser) => number;
export const checkCallbackErrorCode: (userData: NdkAVPlayerUser) => number;
export const checkTrackCount: (userData: NdkAVPlayerUser) => number;
export const checkTrackFormat: (userData: NdkAVPlayerUser) => Record<string, object> | undefined;
export const checkSeiMessageGetCount: (userData: NdkAVPlayerUser) => number;
export const checkSeiMessageGetSEI: (userData: NdkAVPlayerUser, index: number) => Array<Record<string, object>> | number;
export const setPlaybackRate: (fd: media.AVFileDescriptor, rate: number) => NdkAVPlayerResult;
export const checkPlaybackRate: (userData: NdkAVPlayerUser) => number;
export const testGetSubtitleTrackFormat: (fd: media.AVFileDescriptor, index: number, subfd: media.AVFileDescriptor) => NdkAVPlayerResult;
export const OhAVPlayerSetPlaybackStrategyError: (type: number) => number;
export const testAVPlayerSetMediaSourceStateError: () => number;
export const testAVPlayerGetPlaybackRateError: () => number;
export const AVPlayerSetAmplitudeUpdateCallbackError: () => number;
export const AVLoadingRequestError: () => number;
export const AVHttpHeaderDestroy: () => number;
export const AVHttpHeaderDestroyError: () => number;
export const AVHttpHeaderCreate: () => number;
export const AVPlayerTrackSwitchMode: () => number;
export const AVPlayerSeekMode: () => number;
export const AVErrCode: () => number;
export const AVPlayerSetMediaMutedErr: () => number;
export const AVPlayerSetMediaMutedErr1: () => number;
export const AVPlayerSetSeiReceivedCallbackErr: () => number;
export const AVMediaSourceLoaderCreate: () => number;
export const AVPlaybackStrategyDestoy: () => number;
export const AVPlaybackStrategyDestoyErr: () => number;