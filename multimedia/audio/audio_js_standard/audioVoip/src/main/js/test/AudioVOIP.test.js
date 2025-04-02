/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility'
import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { UiDriver, BY} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';


export default function audioVoip() {
describe('audioVoip', function () {
    let mediaDir;
    let fdRead;
    let readpath;
    let fdPath;
    let filePath;
    let TagRender = "AudioFrameworkRenderLog";
    let TagRec = "AudioFrameworkRecLog";
    const AUDIOMANAGER = audio.getAudioManager();
    console.info(`${TagRender}: Create AudioManger Object JS Framework`);
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    async function getPermission() {
        let permissions = ['ohos.permission.MICROPHONE',
        'ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
        'ohos.permission.MANAGE_AUDIO_CONFIG'];
        featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
            console.info("request success" + JSON.stringify(data));
        })
    }
    async function driveFn() {
        console.info(`come in driveFn`);
        let driver = await UiDriver.create();
        console.info(`driver is ${JSON.stringify(driver)}`);
        await sleep(100);
        console.info(`UiDriver start`);
        let button = await driver.findComponent(BY.text('允许'));
        if(button == null){
            let cmd = "hidumper -s WindowManagerService -a'-a'"
            await delegator.executeShellCommand(cmd);
        }
        console.info(`button is ${JSON.stringify(button)}`);
        await sleep(100);
        await button.click();
    }

    beforeAll(async function () {
        console.info(`AudioFrameworkTest: beforeAll: Prerequisites at the test suite level`);
        await getPermission();
        await driveFn();
        console.info(`AudioFrameworkTest: beforeAll: END`);
    })

    beforeEach(async function () {
        console.info(`AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
        await sleep(1000);
    })

    afterEach(function () {
        console.info(`AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
    })

    afterAll(function () {
        console.info(`AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
    })

    function sleep(ms) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    async function getAbilityInfo(fileName) {
        let context = await featureAbility.getContext();
        console.info(`case0 context is  " ${context}`);
        await context.getFilesDir().then((data) => {
            console.info(`case1 getFilesDir path is : ${data}`);
            mediaDir = data + '/' + fileName;
            console.info(`case2 mediaDir is : ${mediaDir}`);
        }).catch(error => {
            console.log(`${TagRender}:case getFileDir err: ${error}`);
        });
    }
    async function closeFileDescriptor(fileName) {
        await resourceManager.getResourceManager().then(async (mgr) => {
            await mgr.closeRawFileDescriptor(fileName).then(value => {
                console.log(`${TagRender}:case closeRawFileDescriptor success for file: ${fileName}`);
            }).catch(err => {
                console.log(`${TagRender}:case closeRawFileDescriptor err:  ${err}`);
            });
        }).catch(error => {
            console.log(`${TagRender}:case getResourceManager err:  ${error}`);
        });
    }
    async function getFdRead(pathName) {
        let context = await featureAbility.getContext();
        console.info(`case0 context is  ${context}`);

        await context.getFilesDir().then((data) => {
            console.info(`case1 getFilesDir path is : ${data}`);
            filePath = data + '/' + pathName;
            console.info(`case4 filePath is : ${filePath}`);
        }).catch(err => {
            console.log(`${TagRender}:case getFilesDir err:  ${err}`);
        });
        fdPath = 'fd://';
        await fileio.open(filePath).then((fdNumber) => {
            fdPath = fdPath + '' + fdNumber;
            fdRead = fdNumber;
            console.info(`[fileIO]case open fd success,fdPath is : ${fdPath}`);
            console.info(`[fileIO]case open fd success,fdRead is : ${fdRead}`);

        }, (err) => {
            console.info(`[fileIO]case open fd err : ${err}`);
        }).catch((error) => {
            console.info(`[fileIO]case catch open fd failed : ${error}`);
        });
    }

    async function playbackPromise(AudioRendererOptions, pathName) {
        let resultFlag = 'new';
        console.info(`${TagRender}: Promise : Audio Playback Function`);

        let audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagRender}: AudioRender Created : ERROR : ${err.message}`);
            return resultFlag;
        });

        console.info(`${TagRender}: AudioRenderer : Path : ${pathName}`);

        console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagRender}: Renderer getStreamInfo:`);
            console.info(`${TagRender}: Renderer sampleFormat: ${audioParamsGet.sampleFormat}`);
            console.info(`${TagRender}: Renderer samplingRate: ${audioParamsGet.samplingRate}`);
            console.info(`${TagRender}: Renderer channels: ${audioParamsGet.channels}`);
            console.info(`${TagRender}: Renderer encodingType: ${audioParamsGet.encodingType}`);
        }).catch((err) => {
            console.log(`${TagRender}: getStreamInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagRender}: Renderer RendererInfo:`);
            console.info(`${TagRender}: Renderer content type: ${audioParamsGet.content}`);
            console.info(`${TagRender}: Renderer usage: ${audioParamsGet.usage}`);
            console.info(`${TagRender}: Renderer rendererFlags: ${audioParamsGet.rendererFlags}`);
        }).catch((err) => {
            console.log(`${TagRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        await audioRen.start().then(() => {
            console.info(`${TagRender}: renderInstant started :SUCCESS `);
        }).catch((err) => {
            console.info(`${TagRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagRender}: case2: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagRender}: case3: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagRender}: BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 2)) {
                await AUDIOMANAGER.getAudioScene().then((data) => {
                    console.info(`${TagRender}:AudioFrameworkAudioScene: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagRender}:AudioFrameworkAudioScene: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        console.info(`${TagRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagRender}: Renderer drain: ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagRender}: Renderer stopped : SUCCESS`);
            resultFlag = true;
            console.info(`${TagRender}: resultFlagRen : ${resultFlag}`);
        }).catch((err) => {
            console.info(`${TagRender}: Renderer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagRender}: Renderer release :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagRender}: AudioRenderer : STATE : ${audioRen.state}`);
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);

        return resultFlag;
    }

    async function recPromise(AudioCapturerOptions, fpath) {

        let resultFlag = 'new';
        console.info(`${TagRec}: Promise : Audio Recording Function`);

        let audioCap;

        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
            audioCap = data;
            console.info(`${TagRec}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagRec}: AudioCapturer Created : ERROR : ${err.message}`);
            return resultFlag;
        });

        console.info(`${TagRec}: AudioCapturer : Path : ${fpath}`);

        console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

        await audioCap.getStreamInfo().then((audioParamsGet) => {
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
        }).catch((err) => {
            console.log(`${TagRec}: getStreamInfo  :ERROR: ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRec}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        await audioCap.getCapturerInfo().then((audioParamsGet) => {
            if (audioParamsGet != undefined) {
                console.info(`${TagRec}: Capturer CapturerInfo:`);
                console.info(`${TagRec}: Capturer SourceType: ${audioParamsGet.source}`);
                console.info(`${TagRec}: Capturer capturerFlags: ${audioParamsGet.capturerFlags}`);
            } else {
                console.info(`${TagRec}: audioParamsGet is : ${audioParamsGet}`);
                console.info(`${TagRec}: audioParams getCapturerInfo are incorrect: `);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagRec}: CapturerInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRec}: resultFlag : ${esultFlag}`);
            return resultFlag;
        }

        await audioCap.start().then(() => {
            console.info(`${TagRec}: Capturer started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagRec}: Capturer start :ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagRec}: resultFlag :  ${resultFlag}`);
            return resultFlag;
        }

        console.info(`${TagRec}: AudioCapturer : STATE :  ${audioCap.state}`);

        let bufferSize = await audioCap.getBufferSize();
        console.info(`${TagRec}: buffer size: ${bufferSize}`);

        let fd = fileio.openSync(fpath, 0o102, 0o777);
        if (fd !== null) {
            console.info(`${TagRec}: file fd created`);
        }
        else {
            console.info(`${TagRec}: Capturer start :ERROR : `);
            resultFlag = false;
            return resultFlag;
        }

        fd = fileio.openSync(fpath, 0o2002, 0o666);
        if (fd !== null) {
            console.info(`${TagRec}: file fd opened : Append Mode :PASS`);
        }
        else {
            console.info(`${TagRec}: file fd Open: Append Mode : FAILED`);
            resultFlag = false;
            return resultFlag;
        }
        await sleep(100);
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
            console.info(`${TagRec}: ---------READ BUFFER---------`);
            let buffer = await audioCap.read(bufferSize, true);
            await sleep(50);
            console.info(`${TagRec}: ---------WRITE BUFFER---------`);
            let number = fileio.writeSync(fd, buffer);
            console.info(`${TagRec}:BufferRecLog: data written: ${number}`);
            await sleep(50);
            numBuffersToCapture--;
        }
        await sleep(1000);
        console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

        await audioCap.stop().then(() => {
            console.info(`${TagRec}: Capturer stopped : SUCCESS`);
            resultFlag = true;
            console.info(`${TagRec}: resultFlag : ${resultFlag}`);
        }).catch((err) => {
            console.info(`${TagRec}: Capturer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

        await audioCap.release().then(() => {
            console.info(`${TagRec}: Capturer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagRec}: Capturer release :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagRec}: AudioCapturer : STATE : ${audioCap.state}`);

        return resultFlag;

    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_0100
     * @tc.name      : AudioRenderer-Set1-Media
     * @tc.desc      : AudioRenderer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_PLAY_0100', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        await getFdRead("StarWars10s-1C-44100-2SW.wav");
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(filePath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_0100', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
            capturerFlags: 0
        }

        let AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
        }

        await getAbilityInfo("capture_js-44100-2C-16B.pcm");
        let resultFlag = await recPromise(AudioCapturerOptions, mediaDir);
        await sleep(100);
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_RECPLAY_0100', 2, async function (done) {

        let AudioStreamInfoCap = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
            capturerFlags: 0
        }

        let AudioCapturerOptions = {
            streamInfo: AudioStreamInfoCap,
            capturerInfo: AudioCapturerInfo
        }

        let AudioStreamInfoRen = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfoRen,
            rendererInfo: AudioRendererInfo
        }

        await getAbilityInfo("capture_js-44100-2C-16B-2.pcm");
        recPromise(AudioCapturerOptions, mediaDir);
        await sleep(500);

        readpath = 'StarWars10s-1C-44100-2SW.wav';
        await getFdRead(readpath);
        let resultFlag = await playbackPromise(AudioRendererOptions, readpath);
        await sleep(100);
        console.info(`${TagRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readpath);
        done();
    })


});}