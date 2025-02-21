/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
export const Test_AVPlayer_SetMediaKeySystemInfoCallback: (handle:string, callback:string) => number;
export const Test_AVPlayer_GetMediaKeySystemInfo: (handle:string, callback:string) => number;
export const Test_AVPlayer_SetDecryptionConfig: () => number;
export const Test_AudioCodec_SetDecryptionConfig: (a: string, b: string, c:number) => number;
export const Test_VideoDecoder_SetDecryptionConfig: (a: string, b: string, c:number) => number;
export const TestAVDemuxer_SetMediaKeySystemInfoCallback: (a: string, b: string) => number;
export const TestAVDemuxer_SetDemuxerMediaKeySystemInfoCallback: (a: string, b: string) => number;
export const TestAVDemuxer_GetMediaKeySystemInfo: (a: string, b: string) => number;
