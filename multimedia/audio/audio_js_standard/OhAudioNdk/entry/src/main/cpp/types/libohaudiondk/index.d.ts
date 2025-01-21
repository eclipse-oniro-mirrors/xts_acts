/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export const CreateAudioCapturerRecorder: (fileIndex: number) => number; // 输入流媒体初始化方法 返回值为 200 - 1200 200表示成功，其他的表示失败 如果是0 表示创建路径错误
export const CreatRendererAudioPlayer: ()=>number;  // 输出流初始化
export const CloseAudioCapture: () => number; // 音频捕获器销毁
export const CloseAudioRender: () => number; // 音频播放器销毁
export const CreatCapturerRecorderWithParam: (rateValue  :number,channelCount: number,frameSizeValue :number,latencyMode :number,SampleFormat:number) => number; // 录音属性初始化
export const TestRendererAudioStreamUsage: (usage: number) => number; // 播放流工作场景类型测试  usage取值范围 0-8 10-13

export const CreatAudioPlayerWithWavFile: (fileIndex: number) => number;
export  const CreatAudioPlayerWithFileAndParam: (fileIndex: number,rendererInfo:number,channelCount: number,encodingType:number,frameSize:number,framesWritten:number,latencyMode:number,sampleFormat:number,samplingRate:number) => number;
export const OHAudioStreamBuilderCreate: (a: number) => number; // 初始化builder
export const OHAudioStreamBuilderDestroy: (a: number) => number; // 销毁builder
export const OHAudioStreamBuilderGenerateCapturer:() => number;  // 初始化输入音频流实例
export const OHAudioStreamBuilderGenerateRenderer:() => number;
export const OHAudioStreamBuilderSetCapturerCallback:() => number;
export const OHAudioStreamBuilderSetCapturerInfo: (a: number) => number; // a取值范围 -1, 0 , 1, 2, 7
export const OHAudioStreamBuilderSetChannelCount: (a: number, b: number) => number; // a表示输入与输出 取值范围 0、1；b表示通道个数
export const OHAudioStreamBuilderSetEncodingType: (a: number, b: number) => number; // a表示输入与输出 取值范围 0、1；b暂时可以随便取值
export const OHAudioStreamBuilderSetFrameSizeInCallback: (a: number, b: number) => number; // a 同上；b 取值范围至少为音频硬件一次处理的数据大小，并且小于内部缓冲容量的一半
export const OHAudioStreamBuilderSetLatencyMode: (a: number, b: number) => number; // a 同上；b 取值范围0、1
export const OHAudioStreamBuilderSetSampleFormat: (a: number, b: number) => number; // a  a表示输入与输出 取值范围 0、1；b 取值范围 0、1、2、3、其他
export const OHAudioStreamBuilderSetSamplingRate: (a: number, b: number) => number; // a 同上；b 可能是 0~8
export const OHAudioStreamBuilderSetRendererCallback:() => number;
export const OHAudioStreamBuilderSetRendererInfo: (a: number) => number; // a取值范围 0~8 10~13
export const OHAudioStreamBuilderSetRendererOutputDeviceChangeCallback: () => number;

// Renderer - set
export const OHAudioRendererSetSpeed: (a: number) => number; // a表示播放倍速 float类型 1 2 3 4能设置成功。
// Renderer - get
export const OHAudioRendererGetSampleFormat: () => number; // 返回值为当前输出音频流采样格式
export const OHAudioRendererGetSamplingRate: () => number; // 返回值为当前输出音频流采样率
export const OHAudioRendererGetStreamId: () =>number;
export const OHAudioRendererGetTimestamp: () => number;
export const OHAudioRendererGetSpeed: () => number;
export const OHAudioRendererGetChannelCount: () => number;
export const OHAudioRendererGetCurrentState: () => number;
export const OHAudioRendererGetEncodingType: () => number;
export const OHAudioRendererGetFrameSizeInCallback: () => number;
export const OHAudioRendererGetFramesWritten: () => number;
export const OHAudioRendererGetLatencyMode: () => number;
export const OHAudioRendererGetRendererInfo: () => number;
export const OHAudioRendererStart: () => number;
export const OHAudioRendererPause: () => number;
export const OHAudioRendererStop: () => number;
export const OHAudioRendererFlush: () => number;
export const OHAudioRendererRelease: () => number;


export const OHAudioCapturerPause: () => number;
export const OHAudioCapturerRelease: () => number;
export const OHAudioCapturerStart: () => number;
export const OHAudioCapturerStop: () => number;
export const OHAudioCapturerFlush: () => number;
export const OHAudioCapturerGetCapturerInfo: () => number;
export const OHAudioCapturerGetChannelCount: () => number;
export const OHAudioCapturerGetCurrentState: () => number;
export const OHAudioCapturerGetEncodingType: () => number;
export const OHAudioCapturerGetFrameSizeInCallback: () => number;
export const OHAudioCapturerGetFramesRead: () => number;
export const OHAudioCapturerGetLatencyMode: () => number;
export const OHAudioCapturerGetSampleFormat: () => number;
export const OHAudioCapturerGetSamplingRate: () => number;
export const OHAudioCapturerGetStreamId: () => number;
export const OHAudioCapturerGetTimestamp: () => number;
export const OHAudioCapturerGetFramePosition: () => number;
export const OpenFileName: (file: string) => number;
export const CloseCapturerPCMFile: () => number;