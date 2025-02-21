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
import featureAbility from '@ohos.ability.featureAbility';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { UiDriver, BY } from '@ohos.UiTest'
export default function audioCapturer() {

    describe('audioCapturer', function () {
        let Tag = 'AudioCpaturer';
        let dirPath;
        let bufferSize;
        const LE24 = -1;
        const LE32 = -1;
        let markReachState = 'unknow';
        let periodReachState = 'unknow';
        let events = require('events');
        const CREATE_EVENT = 'create';
        const START_EVENT = 'start';
        const GET_BUFFERSIZE_EVENT = 'get_buffersize';
        const READ_EVENT = 'read';
        const STOP_EVENT = 'stop';
        const RELEASE_EVENT = 'release';
        const STATE_CHANGE_EVENT = 'on_state_change';
        const MARK_REACH_EVENT = 'on_mark_reach';
        const OFF_MARK_REACH_EVENT = 'off_mark_reach'
        const PERIODR_REACH_EVENT = 'on_period_reach';
        const OFF_PERIODR_REACH_EVENT = 'off_period_reach';
        const END_EVENT = 'end';
        const GET_AUDIOTIME_EVENT = 'getAudioTime';
        const GET_CAPTURERINFO_EVENT = 'getCapturerInfo';
        const GET_STREAMINFO_EVENT = 'getStreamInfo';
        const GET_AUDIOSCENE_EVENT = 'getAudioScene';
        const ERROR_EVENT = 'error';
        let eventEmitter = new events.EventEmitter();
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        async function toNextStep(audioCap, steps, done) {
            if (steps[0] == END_EVENT) {
                await sleep(1000);
                if (markReachState == 'success' || markReachState == 'invalid_failure') {
                    console.log(`${Tag} markReachState: ${JSON.stringify(markReachState)}`);
                    expect(true).assertTrue();
                } else if (markReachState == 'failure') {
                    expect(false).assertTrue();
                }
                markReachState = 'unknow';//recover state

                if (periodReachState == 'success' || periodReachState == 'invalid_failure') {
                    console.log(`${Tag} periodReachState: ${JSON.stringify(periodReachState)}`);
                    expect(true).assertTrue();
                } else if (periodReachState == 'failure') {
                    expect(false).assertTrue();
                }
                periodReachState = 'unknow';

                console.info(`${Tag} case done!!`);
                done();
            } else {
                eventEmitter.emit(steps[0], audioCap, steps, done);
            }
        }
        eventEmitter.on(CREATE_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(CREATE_EVENT)}`);
            steps.shift();
            audio.createAudioCapturer(steps[0], (err, data) => {
                console.log(`${Tag} enter createAudioCapturer`);
                steps.shift();
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} CREATE_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} create err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    steps = [END_EVENT];
                    toNextStep(audioCap, steps, done);
                } else {
                    console.log(`${Tag} create success`);
                    audioCap = data;
                    expect(audioCap.state).assertEqual(audio.AudioState.STATE_PREPARED);
                    toNextStep(audioCap, steps, done);
                }
            });
        });
        eventEmitter.on(START_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(START_EVENT)}`);
            steps.shift();
            audioCap.start(async (err) => {
                console.log(`${Tag} enter start`);
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} START_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} start err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                } else {
                    console.log(`${Tag} start success`);
                    expect(audioCap.state).assertEqual(audio.AudioState.STATE_RUNNING);
                    toNextStep(audioCap, steps, done);
                }
            });
        });
        eventEmitter.on(GET_BUFFERSIZE_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(GET_BUFFERSIZE_EVENT)}`);
            steps.shift();
            audioCap.getBufferSize(async (err, size) => {
                console.log(`${Tag} enter getBufferSize`);
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} GET_BUFFERSIZE_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} start err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                } else {
                    console.log(`${Tag} getBufferSize success`);
                    bufferSize = size;
                    console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)}`);
                    toNextStep(audioCap, steps, done);
                }
            });
        });

        eventEmitter.on(READ_EVENT, async (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(READ_EVENT)}`);
            steps.shift();
            let fd = fileio.openSync(dirPath, 0o102, 0o777);
            if (fd !== null) {
                console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
            }
            else {
                console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
                expect(false).assertTrue();
                done();
                return;
            }

            fd = fileio.openSync(dirPath, 0o2002, 0o666);
            if (fd !== null) {
                console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode : PASS`);
            }
            else {
                console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
                expect(false).assertTrue();
                done();
                return;
            }
            let numBuffersToCapture = 45;
            while (numBuffersToCapture) {
                try {
                    await new Promise((resolve, reject) => {
                        audioCap.read(bufferSize, true, (err, buffer) => {
                            if (err) {
                                console.info(`${Tag} AudioFrameworkRecLog: Capturer release :ERROR :  ${JSON.stringify(err.message)}`);
                                reject(err);
                            } else {
                                let number = fileio.writeSync(fd, buffer);
                                console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
                                resolve();
                            }
                        });
                    })
                } catch (err) {
                    console.info(`${Tag} read err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                }
                numBuffersToCapture--;
            }
            console.log(`${Tag} read success`);
            toNextStep(audioCap, steps, done);
        });

        eventEmitter.on(STOP_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(STOP_EVENT)}`);
            steps.shift();
            audioCap.stop(async (err) => {
                console.log(`${Tag} enter stop`);
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} STOP_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} stop err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                } else {
                    console.log(`${Tag} stop success`);
                    expect(audioCap.state).assertEqual(audio.AudioState.STATE_STOPPED);
                    toNextStep(audioCap, steps, done);
                }
            });
        });
        eventEmitter.on(RELEASE_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(RELEASE_EVENT)}`);
            steps.shift();
            audioCap.release(async (err) => {
                console.log(`${Tag} enter release`);
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} RELEASE_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} release err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                    return;
                } else {
                    console.log(`${Tag} release success`);
                    expect(audioCap.state).assertEqual(audio.AudioState.STATE_RELEASED);
                    toNextStep(audioCap, steps, done);
                }
            });
        });
        eventEmitter.on(GET_AUDIOTIME_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(GET_AUDIOTIME_EVENT)}`);
            steps.shift();
            audioCap.getAudioTime(async (err, audioTime) => {
                console.log(`${Tag} enter getAudioTime`);
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} GET_AUDIOTIME_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} getAudioTime err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                    return;
                } else {
                    console.log(`${Tag} getAudioTime success`);
                    expect(audioTime).assertLarger(0);
                    toNextStep(audioCap, steps, done);
                }
            });
        });
        eventEmitter.on(GET_CAPTURERINFO_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(GET_CAPTURERINFO_EVENT)}`);
            steps.shift();
            audioCap.getCapturerInfo(async (err, audioParamsGet) => {
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} GET_CAPTURERINFO_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} getCapturerInfo err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                    return;
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo:`);
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer SourceType: ${JSON.stringify(audioParamsGet.source)}`);
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer capturerFlags: ${JSON.stringify(audioParamsGet.capturerFlags)}`);
                    toNextStep(audioCap, steps, done);
                }
            });
        });
        eventEmitter.on(GET_STREAMINFO_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(GET_STREAMINFO_EVENT)}`);
            steps.shift();
            audioCap.getStreamInfo(async (err, audioParamsGet) => {
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} GET_STREAMINFO_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} getStreamInfo err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                    return;
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:`);
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer sampleFormat: ${JSON.stringify(audioParamsGet.sampleFormat)}`);
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer samplingRate: ${JSON.stringify(audioParamsGet.samplingRate)}`);
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer channels: ${JSON.stringify(audioParamsGet.channels)}`);
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer encodingType: ${JSON.stringify(audioParamsGet.encodingType)}`);
                    toNextStep(audioCap, steps, done);
                }
            });
        });

        eventEmitter.on(GET_AUDIOSCENE_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(GET_AUDIOSCENE_EVENT)}`);
            steps.shift();
            AUDIOMANAGERREC.getAudioScene(async (err, getValue) => {
                if (err && steps[0] == ERROR_EVENT) {
                    console.log(`${Tag} GET_AUDIOSCENE_EVENT error success`);
                    steps.shift();
                    toNextStep(audioCap, steps, done);
                } else if (err) {
                    console.log(`${Tag} getStreamInfo err : ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    await releaseFun(audioCap, done);
                    return;
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: getAudioScene : Value :  ${JSON.stringify(getValue)}`);
                    toNextStep(audioCap, steps, done);
                }
            });
        });

        eventEmitter.on(STATE_CHANGE_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(STATE_CHANGE_EVENT)}`);
            steps.shift();
            console.log(`${Tag} STATE_CHANGE_EVENT register success`);
            audioCap.on('stateChange', (AudioState) => {
                console.info(`${Tag} AudioCapturerLog: Changed State to :  ${JSON.stringify(AudioState)}`);
                switch (AudioState) {
                    case audio.AudioState.STATE_NEW:
                        console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------NEW--------------`);
                        console.info(`${Tag} AudioFrameworkTest: Audio State is : New`);
                        break;
                    case audio.AudioState.STATE_PREPARED:
                        console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------PREPARED--------------`);
                        console.info(`${Tag} AudioFrameworkTest: Audio State is : Prepared`);
                        break;
                    case audio.AudioState.STATE_RUNNING:
                        console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------RUNNING--------------`);
                        console.info(`${Tag} AudioFrameworkTest: Audio State is : Running`);
                        break;
                    case audio.AudioState.STATE_STOPPED:
                        console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------STOPPED--------------`);
                        console.info(`${Tag} AudioFrameworkTest: Audio State is : stopped`);
                        break;
                    case audio.AudioState.STATE_RELEASED:
                        console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------RELEASED--------------`);
                        console.info(`${Tag} AudioFrameworkTest: Audio State is : released`);
                        break;
                    default:
                        console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------INVALID--------------`);
                        console.info(`${Tag} AudioFrameworkTest: Audio State is : invalid`);
                        break;
                }
            });
            toNextStep(audioCap, steps, done);
        });

        eventEmitter.on(MARK_REACH_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(MARK_REACH_EVENT)}`);
            steps.shift();
            let markReachParam = steps[0];
            steps.shift();
            try {
                audioCap.on('markReach', markReachParam, (position) => {
                    console.log(`${Tag} position: ${JSON.stringify(position)}`);
                    console.log(`${Tag} markReachParam: ${JSON.stringify(markReachParam)}`);
                    if (position == markReachParam) {
                        markReachState = 'success'
                        console.info(`${Tag} AudioRenderLog: mark reached:  ${JSON.stringify(position)}`);
                    }
                });
                toNextStep(audioCap, steps, done);
            }
            catch (error) {
                if (error.code == 401) {
                    markReachState = 'invalid_failure';
                    toNextStep(audioCap, steps, done);
                } else {
                    console.info("err" + error.code);
                    toNextStep(audioCap, steps, done);
                }
            }
        });

        eventEmitter.on(OFF_MARK_REACH_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(OFF_MARK_REACH_EVENT)}`);
            steps.shift();
            audioCap.off('markReach');
            toNextStep(audioCap, steps, done);
        });

        eventEmitter.on(PERIODR_REACH_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(PERIODR_REACH_EVENT)}`);
            steps.shift();
            let periodReachParam = steps[0];
            steps.shift();
            try {
                audioCap.on('periodReach', periodReachParam, (position) => {
                    console.log(`${Tag} position: ${JSON.stringify(position)}`);
                    console.log(`${Tag} periodReachParam: ${JSON.stringify(periodReachParam)}`);
                    if (position == periodReachParam) {
                        periodReachState = 'success'
                        console.info(`${Tag} AudioRenderLog: mark reached:  ${JSON.stringify(position)}`);
                    }
                });
                toNextStep(audioCap, steps, done);
            }
            catch (error) {
                if (error.code == 401) {
                    markReachState = 'invalid_failure';
                    toNextStep(audioCap, steps, done);
                } else {
                    console.info("err" + error.code);
                    toNextStep(audioCap, steps, done);
                }
            }

        });
        eventEmitter.on(OFF_PERIODR_REACH_EVENT, (audioCap, steps, done) => {
            console.log(`${Tag} emit: ${JSON.stringify(OFF_PERIODR_REACH_EVENT)}`);
            steps.shift();
            audioCap.off('periodReach');
            toNextStep(audioCap, steps, done);
        });
        async function releaseFun(audioCap, done) {
            try {
                await audioCap.release();
                console.log(`${Tag} release success`);
                done();
            } catch (err) {
                console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                dirPath = data + '/' + fileName;
                console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
            })
        }
        const AUDIOMANAGERREC = audio.getAudioManager();
        console.info(`${Tag} AudioFrameworkRecLog: Create AudioManger Object JS Framework`);

        async function getPermission() {
            let permissions = ['ohos.permission.MICROPHONE'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info("request success" + JSON.stringify(data));
            })
        }
        async function driveFn() {
            try {
                let driver = await UiDriver.create()
                console.info(`case come in driveFn 222`)
                console.info(`driver is ${JSON.stringify(driver)}`)
                await sleep(100);
                let button = await driver.findComponent(BY.text('允许'));
                console.info(`button is ${JSON.stringify(button)}`);
                await sleep(100);
                await button.click();
            } catch (err) {
                console.info('err is ' + err);
                return;
            }
           
        }

        beforeAll(async function () {
            await getPermission();
            await driveFn();
            console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
        })

        beforeEach(async function () {
            console.info(`${Tag} AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
            await sleep(1000);
        })

        afterEach(function () {
            console.info(`${Tag} AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
        })

        afterAll(function () {
            console.info(`${Tag} AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
        })

        async function recPromise(AudioCapturerOptions, done) {
            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
            } catch (err) {
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
                LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
                LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
                let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
                if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                    done();
                    return;
                }
                expect(false).assertTrue();
                done();
                return;
            }

            try {
                let audioParamsGet = await audioCap.getStreamInfo();
                if (audioParamsGet != undefined && audioParamsGet != null) {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
                expect(false).assertTrue();
            }

            try {
                let audioParamsGet = await audioCap.getCapturerInfo();
                if (audioParamsGet != undefined) {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCap.start();
                console.log(`${Tag} start ok`);
                let bufferSize = await audioCap.getBufferSize();
                console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
                let fd = fileio.openSync(dirPath, 0o102, 0o777);
                console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
                }
                else {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
                    expect(false).assertTrue();
                }

                fd = fileio.openSync(dirPath, 0o2002, 0o666);
                console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
                }
                else {
                    console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
                    expect(false).assertTrue();
                }

                let numBuffersToCapture = 45;
                while (numBuffersToCapture) {
                    console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
                    let buffer = await audioCap.read(bufferSize, true);
                    console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
                    let number = fileio.writeSync(fd, buffer);
                    console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
                    numBuffersToCapture--;
                }
                console.log(`${Tag} read ok`);
                await audioCap.stop();
                console.log(`${Tag} stop ok`);
            } catch (err) {
                console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCap.release();
                console.log(`${Tag} release ok`);
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        }

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_PREPARED_STATE_0100
         *@tc.name      : 
         *@tc.desc      : createAudioCapturer callback
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_PREPARED_STATE_0100', 1, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            console.log(`${Tag} AudioCapturerOptions= ${JSON.stringify(AudioCapturerOptions)}`);
            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, RELEASE_EVENT, END_EVENT];
            console.log(`${Tag} mySteps= ${JSON.stringify(mySteps)}`);
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_RUNNING_STATE_0100
         *@tc.name      : AudioCapturer-Check-STATE-RUNNING
         *@tc.desc      : AudioCapturer with state running
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_RUNNING_STATE_0100', 1, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_STOPPED_STATE_0100
         *@tc.name      : AudioCapturer-Check-STATE-STOPPED
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_STOPPED_STATE_0100', 1, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_BUFFER_SIZE_0100
         *@tc.name      : AudioCapturer-get_buffer_size
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_BUFFER_SIZE_0100', 1, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, GET_BUFFERSIZE_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_0100
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_0100', 1, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_0100
         *@tc.name      : AudioCapturer-Check-STATE-PREPARED
         *@tc.desc      : AudioCapturer with state prepared
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_0100', 0, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            await audio.createAudioCapturer(AudioCapturerOptions).then(function (data) {
                audioCapPromise = data;
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_PREPARED);
                expect(audioCapPromise.state).assertEqual(1);
            }).catch((err) => {
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_0100
         *@tc.name      : AudioCapturer-Check-STATE-RUNNING
         *@tc.desc      : AudioCapturer with state running
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_0100', 0, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                await audioCapPromise.start();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
                expect(audioCapPromise.state).assertEqual(2);
                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_0100
         *@tc.name      : AudioCapturer-Check-STATE-STOPPED
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                await audioCapPromise.start();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
                await audioCapPromise.stop();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_STOPPED);
                expect(audioCapPromise.state).assertEqual(3);
                await audioCapPromise.release()
            } catch (err) {
                console.log(`${Tag} err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_0100
         *@tc.name      : AudioCapturer-Check-STATE-RELEASED
         *@tc.desc      : AudioCapturer with state released
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                await audioCapPromise.start();
                await audioCapPromise.stop();
                await audioCapPromise.release();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
                expect(audioCapPromise.state).assertEqual(4);
            } catch (err) {
                console.log(`${Tag} err : ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_0100
         *@tc.name      : AudioCapturer-get_buffer_size
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
                return;
            }
            try {
                await audioCapPromise.start();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
                let bufferSize = await audioCapPromise.getBufferSize();
                console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
            } catch (err) {
                console.log(`${Tag} start-getBufferSize err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCapPromise.release();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_0100
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_0100', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkpromisereadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
                return;
            }
            try {
                await audioCapPromise.start();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
                bufferSize = await audioCapPromise.getBufferSize();
                console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
            } catch (err) {
                console.log(`${Tag} start-getBufferSize err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            let fd = fileio.openSync(dirPath, 0o102, 0o777);
            if (fd !== null) {
                console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
            }
            else {
                console.info(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
                expect(false).assertTrue();
                done();
                return;
            }

            fd = fileio.openSync(dirPath, 0o2002, 0o666);
            if (fd !== null) {
                console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
            }
            else {
                console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
                expect(false).assertTrue();
                done();
                return;
            }

            try {
                let numBuffersToCapture = 45;
                while (numBuffersToCapture) {
                    let buffer = await audioCapPromise.read(bufferSize, true);
                    console.info(`${Tag} AudioFrameworkRecLog: ---------AFTER PROMISE READ ---------`);
                    let number = fileio.writeSync(fd, buffer);
                    console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(number)}`);
                    numBuffersToCapture--;
                }
            } catch (err) {
                console.info(`${Tag} AudioFrameworkRecLog: read err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCapPromise.release();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_0100
         *@tc.name      : AudioCapturer-Set1-Media
         *@tc.desc      : AudioCapturer with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            await getFd("capture_CB_js-44100-2C-16B.pcm");
            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, GET_AUDIOSCENE_EVENT, GET_STREAMINFO_EVENT, GET_CAPTURERINFO_EVENT, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_ENUM_0100
         *@tc.name      : AudioCapturer-Set1-Media
         *@tc.desc      : AudioCapturer with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_ENUM_0100', 2, async function (done) {

            let AudioStreamInfo = {
                samplingRate: 44100,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0
            }
            let AudioCapturerInfo = {
                source: 3,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            await getFd("capture_CB_js-44100-2C-16B.pcm");
            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, ERROR_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0100
         *@tc.name      : AudioCapturer-Set1-Media
         *@tc.desc      : AudioCapturer with parameter set 7
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0100', 2, async function (done) {
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

            await getFd("capture_js-44100-2C-16B.pcm");
            await recPromise(AudioCapturerOptions, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0100
         *@tc.name      : AudioCapturer-Set1-Media
         *@tc.desc      : AudioCapturer with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: 44100,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0
            }
            let AudioCapturerInfo = {
                source: 0,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            await getFd("capture_js-44100-2C-16B.pcm");
            await recPromise(AudioCapturerOptions, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0200
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
          */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0200', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo44100 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions44100 = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            await getFd("capture_js-44100-1C-16LE.pcm");
            await recPromise(audioCapturerOptions44100, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0200
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0200', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: 44100,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo44100 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions44100 = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            await getFd("capture_js-44100-1C-16LE.pcm");
            await recPromise(audioCapturerOptions44100, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0300
         *@tc.name      : AudioRec-Set2
         *@tc.desc      : record audio with parameter set 2
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0300', 2, async function (done) {
            let audioStreamInfo96000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo96000 = {
                source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
                capturerFlags: 0
            }
            let audioCapturerOptions96000 = {
                streamInfo: audioStreamInfo96000,
                capturerInfo: audioCapturerInfo96000,
            }

            await getFd("capture_js-96000-1C-S24LE.pcm");
            await recPromise(audioCapturerOptions96000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0300
         *@tc.name      : AudioRec-Set2
         *@tc.desc      : record audio with parameter set 2
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0300', 2, async function (done) {
            let audioStreamInfo96000 = {
                samplingRate: 96000,
                channels: 1,
                sampleFormat: 2,
                encodingType: 0,
            };
            let audioCapturerInfo96000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions96000 = {
                streamInfo: audioStreamInfo96000,
                capturerInfo: audioCapturerInfo96000,
            }

            await getFd("capture_js-96000-1C-S24LE.pcm");
            await recPromise(audioCapturerOptions96000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0400
         *@tc.name      : AudioRec-Set3
         *@tc.desc      : record audio with parameter set 3
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0400', 2, async function (done) {
            let audioStreamInfo48000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo48000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions48000 = {
                streamInfo: audioStreamInfo48000,
                capturerInfo: audioCapturerInfo48000,
            }

            await getFd("capture_js-48000-2C-1S32LE.pcm");
            await recPromise(audioCapturerOptions48000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0400
         *@tc.name      : AudioRec-Set3
         *@tc.desc      : record audio with parameter set 3
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0400', 2, async function (done) {
            let audioStreamInfo48000 = {
                samplingRate: 48000,
                channels: 2,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo48000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions48000 = {
                streamInfo: audioStreamInfo48000,
                capturerInfo: audioCapturerInfo48000,
            }

            await getFd("capture_js-48000-2C-1S32LE.pcm");
            await recPromise(audioCapturerOptions48000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0500
         *@tc.name      : AudioRec-Set4
         *@tc.desc      : record audio with parameter set 4
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0500', 2, async function (done) {
            let audioStreamInfo8000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo8000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions8000 = {
                streamInfo: audioStreamInfo8000,
                capturerInfo: audioCapturerInfo8000,
            }

            await getFd("capture_js-8000-1C-8B.pcm");
            await recPromise(audioCapturerOptions8000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0500
         *@tc.name      : AudioRec-Set4
         *@tc.desc      : record audio with parameter set 4
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0500', 2, async function (done) {
            let audioStreamInfo8000 = {
                samplingRate: 8000,
                channels: 1,
                sampleFormat: 0,
                encodingType: 0,
            };
            let audioCapturerInfo8000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions8000 = {
                streamInfo: audioStreamInfo8000,
                capturerInfo: audioCapturerInfo8000,
            }

            await getFd("capture_js-8000-1C-8B.pcm");
            await recPromise(audioCapturerOptions8000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0600
         *@tc.name      : AudioRec-Set5
         *@tc.desc      : record audio with parameter set 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0600', 2, async function (done) {
            let audioStreamInfo11025 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo11025 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions11025 = {
                streamInfo: audioStreamInfo11025,
                capturerInfo: audioCapturerInfo11025,
            }

            await getFd("capture_js-11025-2C-16B.pcm");
            await recPromise(audioCapturerOptions11025, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0600
         *@tc.name      : AudioRec-Set5
         *@tc.desc      : record audio with parameter set 5
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0600', 2, async function (done) {
            let audioStreamInfo11025 = {
                samplingRate: 11025,
                channels: 2,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo11025 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions11025 = {
                streamInfo: audioStreamInfo11025,
                capturerInfo: audioCapturerInfo11025,
            }

            await getFd("capture_js-11025-2C-16B.pcm");
            await recPromise(audioCapturerOptions11025, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0700
         *@tc.name      : AudioRec-Set6
         *@tc.desc      : record audio with parameter set 6
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0700', 2, async function (done) {
            let audioStreamInfo12000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo12000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions12000 = {
                streamInfo: audioStreamInfo12000,
                capturerInfo: audioCapturerInfo12000,
            }

            await getFd("capture_js-12000-1C-24B.pcm");
            await recPromise(audioCapturerOptions12000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0700
         *@tc.name      : AudioRec-Set6
         *@tc.desc      : record audio with parameter set 6
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0700', 2, async function (done) {
            let audioStreamInfo12000 = {
                samplingRate: 12000,
                channels: 1,
                sampleFormat: 2,
                encodingType: 0
            };
            let audioCapturerInfo12000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions12000 = {
                streamInfo: audioStreamInfo12000,
                capturerInfo: audioCapturerInfo12000,
            }

            await getFd("capture_js-12000-1C-24B.pcm");
            await recPromise(audioCapturerOptions12000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0800
         *@tc.name      : AudioRec-Set7
         *@tc.desc      : record audio with parameter set 7
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0800', 2, async function (done) {
            let audioStreamInfo16000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo16000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions16000 = {
                streamInfo: audioStreamInfo16000,
                capturerInfo: audioCapturerInfo16000,
            }

            await getFd("capture_js-16000-2C-32B.pcm");
            await recPromise(audioCapturerOptions16000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0800
         *@tc.name      : AudioRec-Set7
         *@tc.desc      : record audio with parameter set 7
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0800', 2, async function (done) {
            let audioStreamInfo16000 = {
                samplingRate: 16000,
                channels: 2,
                sampleFormat: 3,
                encodingType: 0,
            };
            let audioCapturerInfo16000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions16000 = {
                streamInfo: audioStreamInfo16000,
                capturerInfo: audioCapturerInfo16000,
            }

            await getFd("capture_js-16000-2C-32B.pcm");
            await recPromise(audioCapturerOptions16000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0900
         *@tc.name      : AudioRec-Set8
         *@tc.desc      : record audio with parameter set 8
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0900', 2, async function (done) {
            let audioStreamInfo22050 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo22050 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions22050 = {
                streamInfo: audioStreamInfo22050,
                capturerInfo: audioCapturerInfo22050,
            }

            await getFd("capture_js-22050-1C-8B.pcm");
            await recPromise(audioCapturerOptions22050, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0900
         *@tc.name      : AudioRec-Set8
         *@tc.desc      : record audio with parameter set 8
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0900', 2, async function (done) {
            let audioStreamInfo22050 = {
                samplingRate: 22050,
                channels: 1,
                sampleFormat: 0,
                encodingType: 0,
            };
            let audioCapturerInfo22050 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions22050 = {
                streamInfo: audioStreamInfo22050,
                capturerInfo: audioCapturerInfo22050,
            }

            await getFd("capture_js-22050-1C-8B.pcm");
            await recPromise(audioCapturerOptions22050, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1000
         *@tc.name      : AudioRec-Set9
         *@tc.desc      : record audio with parameter set 9
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1000', 2, async function (done) {
            let audioStreamInfo24000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo24000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions24000 = {
                streamInfo: audioStreamInfo24000,
                capturerInfo: audioCapturerInfo24000,
            }

            await getFd("capture_js-24000-2C-16B.pcm");
            await recPromise(audioCapturerOptions24000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1000
         *@tc.name      : AudioRec-Set9
         *@tc.desc      : record audio with parameter set 9
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1000', 2, async function (done) {
            let audioStreamInfo24000 = {
                samplingRate: 24000,
                channels: 2,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo24000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions24000 = {
                streamInfo: audioStreamInfo24000,
                capturerInfo: audioCapturerInfo24000,
            }

            await getFd("capture_js-24000-2C-16B.pcm");
            await recPromise(audioCapturerOptions24000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1100
         *@tc.name      : AudioRec-Set10
         *@tc.desc      : record audio with parameter set 010
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1100', 2, async function (done) {
            let audioStreamInfo32000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo32000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions32000 = {
                streamInfo: audioStreamInfo32000,
                capturerInfo: audioCapturerInfo32000,
            }

            await getFd("capture_js-32000-1C-24B.pcm");
            await recPromise(audioCapturerOptions32000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1100
         *@tc.name      : AudioRec-Set10
         *@tc.desc      : record audio with parameter set 010
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1100', 2, async function (done) {
            let audioStreamInfo32000 = {
                samplingRate: 32000,
                channels: 1,
                sampleFormat: 2,
                encodingType: 0,
            };
            let audioCapturerInfo32000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions32000 = {
                streamInfo: audioStreamInfo32000,
                capturerInfo: audioCapturerInfo32000,
            }

            await getFd("capture_js-32000-1C-24B.pcm");
            await recPromise(audioCapturerOptions32000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1200
         *@tc.name      : AudioRec-Set11
         *@tc.desc      : record audio with parameter set 011
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1200', 2, async function (done) {
            let audioStreamInfo64000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo64000 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions64000 = {
                streamInfo: audioStreamInfo64000,
                capturerInfo: audioCapturerInfo64000,
            }

            await getFd("capture_js-64000-2C-32B.pcm");
            await recPromise(audioCapturerOptions64000, done);
        })


        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1200
         *@tc.name      : AudioRec-Set11
         *@tc.desc      : record audio with parameter set 011
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1200', 2, async function (done) {
            let audioStreamInfo64000 = {
                samplingRate: 64000,
                channels: 2,
                sampleFormat: 3,
                encodingType: 0,
            };
            let audioCapturerInfo64000 = {
                source: 0,
                capturerFlags: 0
            }
            let audioCapturerOptions64000 = {
                streamInfo: audioStreamInfo64000,
                capturerInfo: audioCapturerInfo64000,
            }

            await getFd("capture_js-64000-2C-32B.pcm");
            await recPromise(audioCapturerOptions64000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1300
         *@tc.name      : AudioRec-Set11 , SourceType set SOURCE_TYPE_VOICE_RECOGNITION
         *@tc.desc      : record audio with parameter set 011
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1300', 2, async function (done) {
            let audioStreamInfo64000 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo64000 = {
                source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
                capturerFlags: 0
            }
            let audioCapturerOptions64000 = {
                streamInfo: audioStreamInfo64000,
                capturerInfo: audioCapturerInfo64000,
            }

            await getFd("capture_js-64000-2C-32B.pcm");
            await recPromise(audioCapturerOptions64000, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_0100
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_0100', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo44100 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions44100 = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            await getFd("capture_js-44100-1C-16LE.pcm");
            await recPromise(audioCapturerOptions44100, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_0100
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_0100', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
            };
            let audioCapturerInfo44100 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let audioCapturerOptions44100 = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            await getFd("capture_js-44100-1C-16LE.pcm");
            await recPromise(audioCapturerOptions44100, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_START_0100
         *@tc.name      : AudioCapturer-GET_AUDIO_TIME
         *@tc.desc      : AudioCapturer GET_AUDIO_TIME
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_START_0100', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, GET_AUDIOTIME_EVENT, GET_AUDIOTIME_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_0100
         *@tc.name      : AudioCapturer-GET_AUDIO_TIME
         *@tc.desc      : AudioCapturer GET_AUDIO_TIME
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_0100', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                console.log(`${Tag} createAudioCapturer ok`);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                await audioCapPromise.start();
                console.log(`${Tag} start ok`);
                let audioTime = await audioCapPromise.getAudioTime();
                console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`);
                expect(audioTime).assertLarger(0);

                let bufferSize = await audioCapPromise.getBufferSize();
                console.log(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
                let fd = fileio.openSync(dirPath, 0o102, 0o777);
                console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.log(`${Tag} AudioFrameworkRecLog: file fd created`);
                } else {
                    console.log(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
                    expect(false).assertTrue();
                    done();
                    return;
                }

                fd = fileio.openSync(dirPath, 0o2002, 0o666);
                console.log(`${Tag} fd1: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.log(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
                } else {
                    console.log(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                let numBuffersToCapture = 45;
                while (numBuffersToCapture) {
                    let buffer = await audioCapPromise.read(bufferSize, true);
                    let audioTime1 = await audioCapPromise.getAudioTime();
                    console.log(`${Tag} audioTime1: ${JSON.stringify(audioTime1)}`);
                    expect(audioTime1).assertLarger(0);
                    let number = fileio.writeSync(fd, buffer);
                    console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
                    numBuffersToCapture--;
                }

                let audioTime2 = await audioCapPromise.getAudioTime();
                console.log(`${Tag} audioTime2: ${JSON.stringify(audioTime2)}`);
                expect(audioTime2).assertLarger(0);
            } catch (err) {
                console.log(`${Tag} start-getAudioTime-getBufferSize-read-getAudioTimein- err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_0100
         *@tc.name      : AudioCapturer-GET_AUDIO_TIME
         *@tc.desc      : AudioCapturer GET_AUDIO_TIME
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_0100', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                console.log(`${Tag} createAudioCapturer ok`);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                await audioCapPromise.start();
                console.log(`${Tag} start ok`);
                let audioTime = await audioCapPromise.getAudioTime();
                console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`);
                expect(audioTime).assertLarger(0);

                let bufferSize = await audioCapPromise.getBufferSize();
                console.log(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
                let fd = fileio.openSync(dirPath, 0o102, 0o777);
                console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.log(`${Tag} AudioFrameworkRecLog: file fd created`);
                }
                else {
                    console.log(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
                    expect(false).assertTrue();
                    done();
                    return;
                }

                fd = fileio.openSync(dirPath, 0o2002, 0o666);
                console.log(`${Tag} fd1: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.log(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
                }
                else {
                    console.log(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                let numBuffersToCapture = 45;
                while (numBuffersToCapture) {
                    let buffer = await audioCapPromise.read(bufferSize, true);
                    let audioTime1 = await audioCapPromise.getAudioTime();
                    console.log(`${Tag} audioTime1: ${JSON.stringify(audioTime1)}`);
                    expect(audioTime1).assertLarger(0);
                    let number = fileio.writeSync(fd, buffer);
                    console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
                    numBuffersToCapture--;
                }
            } catch (err) {
                console.log(`${Tag} start-getAudioTime-getBufferSize-read-getAudioTimein- err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCapPromise.stop();
                let audioTime2 = await audioCapPromise.getAudioTime();
                console.log(`${Tag} audioTime2: ${JSON.stringify(audioTime2)}`);
                expect(audioTime2).assertLarger(0);
            } catch (err) {
                console.log(`${Tag} stop-getAudioTimein- err: ${JSON.stringify(err)}`);
                expect(true).assertTrue();
            }

            try {
                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_0100
         *@tc.name      : AudioCapturer-GET_AUDIO_TIME
         *@tc.desc      : AudioCapturer GET_AUDIO_TIME
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }
            try {
                await audioCapPromise.start();
                let audioTime = await audioCapPromise.getAudioTime();
                console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`)
                expect(audioTime).assertLarger(0);
            } catch (err) {
                console.log(`${Tag} start-getAudioTime err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_0100
         *@tc.name      : AudioCapturer-GET_AUDIO_TIME
         *@tc.desc      : AudioCapturer createAudioCapturer->stop->release
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                console.log(`${Tag} createAudioCapturer ok`);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                await audioCapPromise.start();
                console.log(`${Tag} start ok`);
            } catch (err) {
                console.log(`${Tag} start err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCapPromise.stop();
                console.log(`${Tag} stop ok`);
                expect(true).assertTrue();
            } catch (err) {
                console.log(`${Tag} stop err: ${JSON.stringify(err)}`);
                expect(true).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_0100
         *@tc.name      : AudioCapturer-GET_AUDIO_TIME
         *@tc.desc      : AudioCapturer GET_AUDIO_TIME
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                await audioCapPromise.release();
                expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} re-release err: ${JSON.stringify(err)}`);
                expect(true).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_0100
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_0100', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }

            let audioCapturerInfo44100 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                let audioParamsGet = await audioCap.getStreamInfo();
                console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
            } catch (err) {
                console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCap.release();
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_0100
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_0100', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: 44100,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo44100 = {
                source: 0,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                let audioParamsGet = await audioCap.getStreamInfo();
                console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
            } catch (err) {
                console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCap.release();
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                console.log(`${Tag} audioCap.state: ${JSON.stringify(audioCap.state)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_0200
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_0200', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let audioCapturerInfo44100 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                let audioParamsGet = await audioCap.getStreamInfo();
                console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
            } catch (err) {
                console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            audioCap.release((err) => {
                if (err) {
                    console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                expect(audioCap.state).assertEqual(audio.AudioState.STATE_RELEASED);
                done();
            })
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_0300
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_0300', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }

            let audioCapturerInfo44100 = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                let audioParamsGet = await audioCap.getCapturerInfo();
                console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
            } catch (err) {
                console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCap.release();
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_0300
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_0300', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: 44100,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo44100 = {
                source: 0,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
            } catch (err) {
                console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                return done();
            }

            try {
                let audioParamsGet = await audioCap.getCapturerInfo();
                console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
            } catch (err) {
                console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }

            try {
                await audioCap.release();
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_STREAM_INFO_INVALID_0100
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_STREAM_INFO_INVALID_0100', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: 0,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo44100 = {
                source: 0,
                capturerFlags: 0
            }
            let AudioCapturerOptionsInvalid = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }
            await audio.createAudioCapturer(AudioCapturerOptionsInvalid).then(function (data) {
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success: ${JSON.stringify(data)}`);
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
                expect(true).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_CAPTURER_INFO_INVALID_0100
         *@tc.name      : AudioRec-Set1
         *@tc.desc      : record audio with parameter set 1
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_CAPTURER_INFO_INVALID_0100', 2, async function (done) {
            let audioStreamInfo44100 = {
                samplingRate: 44100,
                channels: 1,
                sampleFormat: 1,
                encodingType: 0,
            };
            let audioCapturerInfo44100 = {
                source: 1000,
                capturerFlags: 0
            }
            let AudioCapturerOptionsInvalid = {
                streamInfo: audioStreamInfo44100,
                capturerInfo: audioCapturerInfo44100,
            }

            await audio.createAudioCapturer(AudioCapturerOptionsInvalid).then(function (data) {
                if (data == undefined) {
                    console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Unsuccess : ${JSON.stringify(data)}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success: ${JSON.stringify(data)}`);
                    expect(false).assertTrue();
                }

            }).catch((err) => {
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
                expect(true).assertTrue();
            });
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0100
         *@tc.name      : AudioCapturer-Check-STATE-STOPPED
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0100', 2, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, START_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0200
         *@tc.name      : AudioCapturer-Check-STATE-STOPPED
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0200', 2, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0300
         *@tc.name      : AudioCapturer-Check-STATE-STOPPED
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0300', 2, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, START_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0400
         *@tc.name      : AudioCapturer-Check-STATE-STOPPED
         *@tc.desc      : AudioCapturer with state stopped
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0400', 2, function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, START_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0100
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0100', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 5000;
            markReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0200
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0200', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 1000;
            markReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0300
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0300', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 10000;
            markReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0400
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0400', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 100;
            markReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0500
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0500', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 1;
            markReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0600
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0600', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 0;
            markReachState = 'fail';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0700
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0700', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = 1234567890;
            markReachState = 'invalid_failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0800
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0800', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let markReachParam = -2;
            markReachState = 'fail';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0100
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0100', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let periodReachParam = 1000;
            periodReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0200
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0200', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let periodReachParam = 1;
            periodReachState = 'failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0300
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0300', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let periodReachParam = -2;
            periodReachState = 'fail';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0400
         *@tc.name      : AudioCapturer-Check-READ_BUFFER
         *@tc.desc      : AudioCapturer with read buffer
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0400', 2, async function (done) {
            await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            let audioCap = null;
            let periodReachParam = 223750;
            periodReachState = 'invalid_failure';
            let mySteps = [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
            eventEmitter.emit(mySteps[0], audioCap, mySteps, done);
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0100
         *@tc.name      : AudioCapturer - getAudioStreamId
         *@tc.desc      : AudioCapturer - getAudioStreamId
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0100', 0, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            let audioCapPromise;
            try {
                audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                await audioCapPromise.getAudioStreamId((err, data) => {
                    if (err) {
                        console.info(`${Tag}: getAudioStreamId : ERROR : code: ${err.code}, mesage: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        expect(true).assertTrue();
                        console.info(`${Tag}: getAudioStreamId : Converted: ${data}`);
                    }
                });
                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        })


        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0200
         *@tc.name      : AudioCapturer - getAudioStreamId
         *@tc.desc      : AudioCapturer - getAudioStreamId
         *@tc.size      : MEDIUM
         *@tc.type      : Function
         *@tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0200', 0, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_1,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            try {
                let audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
                await audioCapPromise.getAudioStreamId().then((data) => {
                    expect(true).assertTrue();
                    console.info(`${Tag}: getAudioStreamId : Converted: ${data}`);
                }).catch((err) => {
                    expect(true).assertTrue();
                    console.error(`${Tag}: getAudioStreamId : ERROR : ${err}`);
                });

                await audioCapPromise.release();
            } catch (err) {
                console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })
    })
}