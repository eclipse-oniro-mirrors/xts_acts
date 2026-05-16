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
import { media } from '@kit.MediaKit';

interface CustomUserData {}

export const ohAvMetadataExtractorCreate: () => number;
export const ohAvMetadataExtractorSetFdPathSource: (a : number) => number;
export const ohAvMetadataExtractorFetchMetadata: (a : number) => number;
export const ohAvMetadataExtractorFetchMetadataAll: (a : number) => media.AVMetadata;
export const ohAvMetadataExtractorFetchAlbumCover: (a : number) => number;
export const ohAvMetadataExtractorRelease: () => number;
export const ohAvMetadataExtractorReleaseTwo: () => number;
export const OhAvMetadataExtractorPixelMapParamsCreate: () => number;
export const OhAvMetadataExtractorPixelMapParamsSetSize: (width : number, height : number) => boolean;
export const OhAvMetadataExtractorFetchFrameByTime: (fd : number, timeUs : number, option : number, thumbWidth: number,
  thumbHeight: number) => number;
export const OhAvMetadataExtractorGetCustomInfo: (fd : number) => Record<string, object>;
export const OhAvMetadataExtractorGetTrackDescription: (fd : number, trackIndex : number) => Record<string, object>;
export const OhAvMetadataExtractorFetchFileMetadata: (fd : number) => Record<string, object>;
export const OhAvMetadataExtractorGetRefTrackMetaData: (fd : number, trackIndex : number) => Record<string, object>;
export const OhAVMetadataExtractorOutputParamsDestroyError: () => number;
export const OhAVMetadataExtractorOutputParamsSetSizeError: () => boolean;
export const OhAVMetadataExtractorFetchFrameByTimeError: (a: number) => number;
export const OhAVMetadataExtractorGetTrackDescriptionError: (a: number) => number;
export const OhAVMetadataExtractorGetCustomInfoError: () => number;
export const OhAvMetadataExtractorSetUrlMediaSource: (url: string) => number;
export const OhAvMetadataExtractorSetFdMediaSource: (fd: number, offset: number, length: number) => number;
export const OhAvMetadataExtractorSetDataSourceMediaSource: () => number;
export const OhAVMetadataExtractorFetchFramesByTimes: (a:number,b:number,c:number,d:number,e:number,f:number, timeUs: number[]) => number;
export const OhAVMetadataExtractorFetchFramesByTimesErr: () => number;
export const OhAVMetadataExtractorFetchFramesByTimesErr1: () => number;
export const OhAVMetadataExtractorFetchFramesByTimesErr2: () => number;
export const OHAVMetadataExtractorUserDataGetTestResult: (a: CustomUserData) => boolean;
export const OhAVMetadataExtractorCancelAllFetchFrames: () => number;
export const OhAVMetadataExtractorSetMediaSourceError: (params: number) => number;
export const OhAVMetadataExtractorFetchState: () => number;
export const OhAVMediaSeekMode: () => number;
export enum OH_AVErrCode {
  /**
   * @error the operation completed successfully.
   */
  AV_ERR_OK = 0,
  /**
   * @error invalid argument.
   */
  AV_ERR_INVALID_VAL = 3,
}