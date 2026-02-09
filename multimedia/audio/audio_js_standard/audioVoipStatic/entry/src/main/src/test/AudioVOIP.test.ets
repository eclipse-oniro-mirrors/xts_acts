/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import fileio from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level, TestType, Size } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

interface AudioStreamInfo {
    samplingRate: number,
    channels: number,
    sampleFormat: number,
    encodingType: number
}

interface AudioRendererInfo {
    content: number,
    usage: number,
    rendererFlags: number
}

interface AudioRendererOptions {
    streamInfo: AudioStreamInfo,
    rendererInfo: AudioRendererInfo
}

interface AudioCapturerInfo {
    source: number,
    capturerFlags: number
}

interface AudioCapturerOptions {
    streamInfo: AudioStreamInfo,
    capturerInfo: AudioCapturerInfo
}

interface AudioStreamInfoCap {
    samplingRate: number,
    channels: number,
    sampleFormat: number,
    encodingType: number
}

interface AudioStreamInfoRen {
    samplingRate: number,
    channels: number,
    sampleFormat: number,
    encodingType: number
}

interface AudioCapturerOptionsRecplay {
    streamInfo: AudioStreamInfoCap,
    capturerInfo: AudioCapturerInfo
}

interface AudioRendererOptionsRecplay {
    streamInfo: AudioStreamInfoRen,
    rendererInfo: AudioRendererInfo
}

let g_context: common.UIAbilityContext;

export default function audioVoip() {
    describe('audioVoip', (): void => {
        let mediaDir: string = '';
        let fdRead: int;
        let readpath: string;
        let fdPath: string;
        let filePath: string = '';
        let TagRender = "AudioFrameworkRenderLog";
        let TagRec = "AudioFrameworkRecLog";
        const AUDIOMANAGER = audio.getAudioManager();
        console.info(`${TagRender}: Create AudioManger Object JS Framework`);
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();

        beforeAll(async () => {
            try {
                console.info('beforeAll start');
                g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.MICROPHONE')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        console.info("request success permissions" + JSON.stringify(data));
                        console.info("getPermissionRequestResult err" + JSON.stringify(err));
                    });
                let driver = Driver.create();
                let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000);
                if (permissionButton != null) {
                    await permissionButton.click();
                }
            } catch (err) {
                console.error('beforeAll failed, err: ' + err);
            }
            console.info(`AudioFrameworkTest: beforeAll: END`);
        })

        beforeEach(async () => {
            console.info(`AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
            Utils.msSleep(1000);
        })

        afterEach(() => {
            console.info(`AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
        })

        afterAll(() => {
            console.info(`AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
        })

        let getAbilityInfo = async (fileName: string) => {
            try {
                let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                let filesDir = testContext.filesDir;
                mediaDir = filesDir + '/' + fileName;
                console.info(`case2 filesDir is : ${filesDir}`);
                console.info(`case2 fileName is : ${fileName}`);
                console.info(`case2 mediaDir is : ${mediaDir}`);
            } catch (err) {
                console.log(`${TagRender}:case getFileDir err: ${err}`);
            }
        }

        let getFdRead = async (pathName: string) => {
            try {
                let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                let filesDir = testContext.filesDir;
                filePath = filesDir + '/' + pathName;
                console.info(`case4 filePath is : ${filePath}`);
            } catch (err) {
                console.log(`${TagRender}:case getFilesDir err:  ${err}`);
            }
            fdPath = 'fd://';
            await fileio.open(filePath).then((fdNumber: fileio.File) => {
                fdPath = fdPath + '' + fdNumber.fd;
                fdRead = fdNumber.fd;
                console.info(`[fileIO]case open fd success,fdPath is : ${fdPath}`);
                console.info(`[fileIO]case open fd success,fdRead is : ${fdRead}`);

            }, (err: Error) => {
                console.info(`[fileIO]case open fd err : ${err}`);
            }).catch((error: Error) => {
                console.info(`[fileIO]case catch open fd failed : ${error}`);
            });
        }

        let playbackPromise = async (AudioRendererOptions: audio.AudioRendererOptions, pathName: string): Promise<boolean> =>{
            let resultFlag: boolean = true;
            console.info(`${TagRender}: Promise : Audio Playback Function`);

            let audioRen: audio.AudioRenderer | null;

            try {
                audioRen = await audio.createAudioRenderer(AudioRendererOptions);
                console.info(`${TagRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
            } catch (err) {
                console.info(`${TagRender}: AudioRender Created : ERROR : ${err.message}`);
                resultFlag = false;
                return resultFlag;
            }

            console.info(`${TagRender}: AudioRenderer : Path : ${pathName}`);

            console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen!.state}`);

            await audioRen!.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
                console.info(`${TagRender}: Renderer getStreamInfo:`);
                console.info(`${TagRender}: Renderer sampleFormat: ${audioParamsGet.sampleFormat}`);
                console.info(`${TagRender}: Renderer samplingRate: ${audioParamsGet.samplingRate}`);
                console.info(`${TagRender}: Renderer channels: ${audioParamsGet.channels}`);
                console.info(`${TagRender}: Renderer encodingType: ${audioParamsGet.encodingType}`);
            }).catch((err: Error) => {
                console.log(`${TagRender}: getStreamInfo :ERROR: ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRender}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }

            await audioRen!.getRendererInfo().then((audioParamsGet: audio.AudioRendererInfo) => {
                console.info(`${TagRender}: Renderer RendererInfo:`);
                console.info(`${TagRender}: Renderer usage: ${audioParamsGet.usage}`);
                console.info(`${TagRender}: Renderer rendererFlags: ${audioParamsGet.rendererFlags}`);
            }).catch((err: Error) => {
                console.log(`${TagRender}: RendererInfo :ERROR: ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRender}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }

            await audioRen!.start().then(() => {
                console.info(`${TagRender}: renderInstant started :SUCCESS `);
            }).catch((err: Error) => {
                console.info(`${TagRender}: renderInstant start :ERROR : ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRender}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }

            console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen!.state}`);

            let bufferSize: Long;
            audioRen!.getBufferSize().then((data: Long) => {
                console.info(`${TagRender}: getBufferSize :SUCCESS ${data}`);
                bufferSize = data;
            }).catch((err: Error) => {
                console.info(`${TagRender}: getBufferSize :ERROR : ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRender}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }

            let ss = fileio.fdopenStreamSync(fdRead, 'r');
            console.info(`${TagRender}: case2: File Path: ${ss}`);
            let discardHeader = new ArrayBuffer(44);
            ss.readSync(discardHeader);
            let totalSize = fileio.statSync(fdRead).size;
            console.info(`${TagRender}: case3: File totalSize size: ${totalSize}`);
            totalSize = totalSize - 44;
            console.info(`${TagRender}: File size : Removing header: ${totalSize}`);
            console.info(`${TagRender}: Renderer after read`);

            await audioRen!.drain().then(() => {
                console.info(`${TagRender}: Renderer drained : SUCCESS`);
            }).catch((err: Error) => {
                console.error(`${TagRender}: Renderer drain: ERROR : ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean | string == false) {
                console.info(`${TagRender}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }

            console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen!.state}`);

            await audioRen!.stop().then(() => {
                console.info(`${TagRender}: Renderer stopped : SUCCESS`);
                resultFlag = true;
                console.info(`${TagRender}: resultFlagRen : ${resultFlag}`);
            }).catch((err: Error) => {
                console.info(`${TagRender}: Renderer stop:ERROR : ${err.message}`);
                resultFlag = false;
            });

            console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen!.state}`);

            await audioRen!.release().then(() => {
                console.info(`${TagRender}: Renderer release : SUCCESS`);
            }).catch((err: Error) => {
                console.info(`${TagRender}: Renderer release :ERROR : ${err.message}`);
                resultFlag = false;
            });

            console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen!.state}`);
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);

            return resultFlag;
        }

        let recPromise = async (AudioCapturerOptions: audio.AudioCapturerOptions, fpath: string): Promise<boolean> =>{
            let resultFlag: boolean = true;
            console.info(`${TagRec}: Promise : Audio Recording Function`);

            let audioCap: audio.AudioCapturer | null;

            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
                console.info(`${TagRec}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
            } catch (err) {
                console.info(`${TagRec}: AudioCapturer Created : ERROR : ${err.message}`);
                resultFlag = false;
                return resultFlag;
            }
            console.info(`${TagRec}: AudioCapturer : Path : ${fpath}`);
            console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap!.state}`);
            await audioCap!.getStreamInfo().then((audioParamsGet: audio.AudioStreamInfo) => {
                if (audioParamsGet != undefined) {
                    console.info(`${TagRec}: Capturer getStreamInfo:`);
                    console.info(`${TagRec}: Capturer sampleFormat: ${audioParamsGet.sampleFormat}`);
                    console.info(`${TagRec}: Capturer samplingRate: ${audioParamsGet.samplingRate}`);
                    console.info(`${TagRec}: Capturer channels: ${audioParamsGet.channels}`);
                    console.info(`${TagRec}: Capturer encodingType: ${audioParamsGet.encodingType}`);
                } else {
                    console.info(`${TagRec}: audioParamsGet is : ${audioParamsGet}`);
                    console.info(`${TagRec}: audioParams getStreamInfo are incorrect: `);
                    resultFlag = false;
                }
            }).catch((err: Error) => {
                console.log(`${TagRec}: getStreamInfo  :ERROR: ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRec}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }
            await audioCap!.getCapturerInfo().then((audioParamsGet: audio.AudioCapturerInfo) => {
                if (audioParamsGet != undefined) {
                    console.info(`${TagRec}: Capturer CapturerInfo:`);
                    console.info(`${TagRec}: Capturer SourceType: ${audioParamsGet.source}`);
                    console.info(`${TagRec}: Capturer capturerFlags: ${audioParamsGet.capturerFlags}`);
                } else {
                    console.info(`${TagRec}: audioParamsGet is : ${audioParamsGet}`);
                    console.info(`${TagRec}: audioParams getCapturerInfo are incorrect: `);
                    resultFlag = false;
                }
            }).catch((err: Error) => {
                console.log(`${TagRec}: CapturerInfo :ERROR:  ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRec}: resultFlag : ${resultFlag}`);
                return resultFlag;
            }

            await audioCap!.start().then(() => {
                console.info(`${TagRec}: Capturer started :SUCCESS`);
            }).catch((err: Error) => {
                console.info(`${TagRec}: Capturer start :ERROR : ${err.message}`);
                resultFlag = false;
            });
            if (resultFlag as boolean == false) {
                console.info(`${TagRec}: resultFlag :  ${resultFlag}`);
                return resultFlag;
            }
            console.info(`${TagRec}: AudioCapturer : STATE :  ${audioCap!.state}`);

            let bufferSize: long = await audioCap!.getBufferSize();
            console.info(`${TagRec}: buffer size: ${bufferSize}`);

            let fd = fileio.openSync(fpath, fileio.OpenMode.READ_WRITE | fileio.OpenMode.CREATE);
            if (fd !== null) {
                console.info(`${TagRec}: file fd created`);
            } else {
                console.info(`${TagRec}: Capturer start :ERROR : `);
                resultFlag = false;
                return resultFlag;
            }

            fd = fileio.openSync(fpath, fileio.OpenMode.READ_WRITE | fileio.OpenMode.APPEND);
            if (fd !== null) {
                console.info(`${TagRec}: file fd opened : Append Mode :PASS`);
            } else {
                console.info(`${TagRec}: file fd Open: Append Mode : FAILED`);
                resultFlag = false;
                return resultFlag;
            }
            Utils.msSleep(100);

            await audioCap!.stop().then(() => {
                console.info(`${TagRec}: Capturer stopped : SUCCESS`);
                resultFlag = true;
                console.info(`${TagRec}: resultFlag : ${resultFlag}`);
            }).catch((err: Error) => {
                console.info(`${TagRec}: Capturer stop:ERROR : ${err.message}`);
                resultFlag = false;
            });

            console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap!.state}`);

            await audioCap!.release().then(() => {
                console.info(`${TagRec}: Capturer release : SUCCESS`);
            }).catch((err: Error) => {
                console.info(`${TagRec}: Capturer release :ERROR : ${err.message}`);
                resultFlag = false;
            });

            console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap!.state}`);

            return resultFlag;
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_STATIC_0100
         * @tc.desc   AudioRenderer with parameter set 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {

            let AudioStreamInfo: audio.AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }

            let AudioRendererInfo: audio.AudioRendererInfo = {
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
                rendererFlags: 0
            }

            let AudioRendererOptions: audio.AudioRendererOptions = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo
            }
            await getFdRead("StarWars10s-1C-44100-2SW.wav");
            let resultFlag = await playbackPromise(AudioRendererOptions, filePath);
            Utils.msSleep(100);
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            expect(resultFlag).assertTrue();
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_REC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_REC_STATIC_0100
         * @tc.desc   AudioCapturer with parameter set 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

            let AudioStreamInfo: audio.AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }

            let AudioCapturerInfo: audio.AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
                capturerFlags: 0
            }

            let AudioCapturerOptions: audio.AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            await getAbilityInfo("capture_js-44100-2C-16B.pcm");
            let resultFlag = await recPromise(AudioCapturerOptions, mediaDir);
            Utils.msSleep(100);
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            expect(resultFlag).assertTrue();
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_STATIC_0100
         * @tc.desc   AudioCapturer with parameter set 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

            let AudioStreamInfoCap: audio.AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }

            let AudioCapturerInfo: audio.AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
                capturerFlags: 0
            }

            let AudioCapturerOptions: audio.AudioCapturerOptions = {
                streamInfo: AudioStreamInfoCap,
                capturerInfo: AudioCapturerInfo
            }

            let AudioStreamInfoRen: audio.AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }

            let AudioRendererInfo: audio.AudioRendererInfo = {
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
                rendererFlags: 0
            }

            let AudioRendererOptions: audio.AudioRendererOptions = {
                streamInfo: AudioStreamInfoRen,
                rendererInfo: AudioRendererInfo
            }

            await getAbilityInfo("capture_js-44100-2C-16B-2.pcm");
            recPromise(AudioCapturerOptions, mediaDir);
            Utils.msSleep(500);

            readpath = 'StarWars10s-1C-44100-2SW.wav';
            await getFdRead(readpath);
            let resultFlag = await playbackPromise(AudioRendererOptions, readpath);
            Utils.msSleep(100);
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            expect(resultFlag).assertTrue();
            done();
        })
    });
}