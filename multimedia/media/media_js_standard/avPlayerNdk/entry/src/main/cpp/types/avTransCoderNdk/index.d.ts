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

interface AvTransCoderNdkUser {}
interface AvPlayerNdkUser {}
interface AvTransCoderResult {
    userData: AvTransCoderNdkUser;
    result: number;
}

export const AvTransCoderNdkSetResolutionError: (srcFd: number, srcOffset: number, srcLength: number,
    width: number, height: number) => number;
export const AvTransCoderPrepareParamError1: () => number;
export const AvTransCoderPrepareParamError2: (srcFd: number, srcOffset: number, srcLength: number) => number;
export const AvTransCoderParamError: (interfaceName: string) => number;
export const AvTransCoderOperateError: (interfaceName: string) => number;
export const AvTransCoderNdkCancelled: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number) => number;
export const AvTransCoderSetStateCbError: () => number;
export const AvTransCoderSetErrorCbError: () => number;
export const AvTransCoderSetProgressUpdateCbError: () => number;
export const AvTransCoderNdkProgressUpdateCb: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number) => number;
export const AvTransCoderConfigSetSrcFDError: (srcFd: number, srcOffset: number, srcLength: number) => number;
export const AvTransCoderConfigParamError: (interfaceName: string, paramNum: number) => number;
export const AvTransCoderConfigSetDstFDError: (dstFd: number) => number;
export const AvTransCodeConfigSetDstVideoType: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    mimeType: string) => number;
export const AvTransCodeConfigSetDstAudioType: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    mimeType: string) => number;
export const AvTransCodeConfigSetDstFileType: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    mimeType: number) => number;
export const AvTransCodeConfigSetDstAudioBitrate: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    bitrate: number) => AvTransCoderResult;
export const AvTransCodeConfigSetDstVideoBitrate: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    bitrate: number) => number;
export const AvTransCodeConfigEnableBFrame: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    enableBFrame: boolean) => number;
export const AvTransCodeConfigSetDstVideoResolution: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    width: number, height: number) => number;
export const AvTransCoderErrorCode: (srcFd: number, srcOffset: number, srcLength: number) => number;
export const AvTransCoderNdkPrepareNotPermit: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number) => number;
export const AvPlayerNdkPlayVideo: (srcFd: number, srcLength: number) => number;
export const AvTransCoderNdkTest: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number) => AvTransCoderNdkUser;
export const CheckAvTransCoderComplete: (user: AvTransCoderNdkUser) => number;
export const AvTransCodeConfigSetDstFileTypeError: (srcFd: number, srcOffset: number, srcLength: number, dstFd: number,
    mimeType: number) => AvTransCoderResult;
export const CheckAvTransCoderCallBackError: (user: AvTransCoderNdkUser) => number;
