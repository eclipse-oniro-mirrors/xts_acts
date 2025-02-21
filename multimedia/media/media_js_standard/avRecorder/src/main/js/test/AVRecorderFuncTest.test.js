/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import media from '@ohos.multimedia.media'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avRecorderTest() {
    describe('avRecorderTest', function () {
        let avRecorder = null;
        const RECORDER_TIME = 3000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const FORMAT_MP3 = media.ContainerFormatType.CFT_MP3;
        const FORMAT_WAV = media.ContainerFormatType.CFT_WAV;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ENCORDER_MP3 = media.CodecMimeType.AUDIO_MP3;
        const ENCORDER_WAV = media.CodecMimeType.AUDIO_G711MU;
        let fdObject;
        let fdPath;

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        const SETONCALLBACK_EVENT = 'setAvRecorderCallback'
        const CREATE_EVENT = 'create';
        const PREPARE_EVENT = 'prepare';
        const STARTRECORDER_EVENT = 'start';
        const STOPRECORDER_EVENT = 'stop';
        const PAUSERECORDER_EVENT = 'pause';
        const RESUMERECORDER_EVENT = 'resume';
        const RELEASECORDER_EVENT = 'release';
        const RELEASECORDER_TIMETEST_EVENT = 'release_time_test';
        const START_TIMETEST_EVENT = 'start_time_test';
        const END_TIMETEST_EVENT = 'end_time_test';
        const END_EVENT = 'end';
        const FAIL_EVENT = 'fail';

        let TAG = "[AvRecorderLocalTest] ";
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioSampleRate : 48000,
            audioCodec : ENCORDER_AAC,
            fileFormat : FORMAT_M4A,
        }
        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            profile : avProfile,
            url : 'fd://',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }

        let execTimes;

        beforeAll(async function () {
            console.info('beforeAll in1');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(2000);
            await mediaTestBase.driveFn(3)
            console.info('beforeAll out');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await avRecorderTestBase.sleep(3000);
            fdObject = null;
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avRecorder != null) {
                avRecorder.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            mediaTestBase.closeFd(fdObject?.fdNumber);
            await avRecorderTestBase.sleep(1000);
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })

        function toNextStep(avRecorder, avConfig, recorderTime, steps, done) {
            if (steps[0] == END_EVENT) {
                console.info('case success!!');
                done();
            } else if (steps[0] == FAIL_EVENT) {
                console.error('case failed!!');
                done();
            } else {
                avRecorderTestBase.sleep(1000)
                console.info('next step: ' + steps[0])
                eventEmitter.emit(steps[0], avRecorder, avConfig, recorderTime, steps, done);
            }
        }

        function setAVRecorderCallback(avRecorder, done) {
            // 状态机变化回调函数
            avRecorder.on('stateChange', (state, reason) => {
                console.info(TAG + 'current state is: ' + state);
            })
            // 录制监听回调函数
            avRecorder.on('audioCapturerChange', (AudioCapturerChangeInfo) => {
                console.info(TAG + 'audioCapturerChange');
            });
            // 错误上报回调函数
            avRecorder.on('error', async (err) => {
                try {
                    console.error(TAG + 'error ocConstantSourceNode, error message is ' + err);
                    await releaseRecorderPromise(avRecorder, done);
                } catch (error) {
                    // 处理错误
                    console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
                }
            });
        }

        eventEmitter.on(SETONCALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                setAVRecorderCallback(avRecorder, done)
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }catch(error){
                console.info('setAVRecorderCallback failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(CREATE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            media.createAVRecorder((error, recorder) => {
                console.info('case createAVRecorder called');
                if (recorder != null) {
                    avRecorder = recorder;
                    expect(avRecorder.state).assertEqual('idle');
                    console.info('createAVRecorder idleCallback success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info(`createAVRecorder idleCallback fail, error:${error}`);
                }
            });
        });

        eventEmitter.on(PREPARE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.prepare(avConfig, (err) => {
                console.info('case prepare called');
                if (err == null) {
                    console.error(`case prepare success, state is ${avRecorder.state}`);
                    expect(avRecorder.state).assertEqual(avRecorderTestBase.AV_RECORDER_STATE.PREPARED);
                    console.info('prepare success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.error(`case prepare error, errMessage is ${err.message}`);
                }
            })
        });

        eventEmitter.on(STARTRECORDER_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.start((err) => {
                console.info('case start called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avRecorderTestBase.AV_RECORDER_STATE.STARTED);
                    console.info('start AVRecorder success');
                    if (recorderTime != undefined) {
                        avRecorderTestBase.sleep(recorderTime);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }
                } else {
                    console.error('start AVRecorder failed and error is ' + err.message);

                    let failedSteps = new Array(
                        // release avRecorder
                        RELEASECORDER_EVENT,
                        // failed
                        FAIL_EVENT
                    )

                    toNextStep(avRecorder, avConfig, recorderTime, failedSteps, done);
                }
            })
        });

        eventEmitter.on(STOPRECORDER_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.stop((err) => {
                console.info('case stop called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avRecorderTestBase.AV_RECORDER_STATE.STOPPED);
                    console.info('stop AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('stop AVRecorder failed and error is ' + err.message);

                    let failedSteps = new Array(
                        // release avRecorder
                        RELEASECORDER_EVENT,
                        // failed
                        FAIL_EVENT
                    )

                    toNextStep(avRecorder, avConfig, recorderTime, failedSteps, done);
                }
            })
        });

        eventEmitter.on(PAUSERECORDER_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.pause((err) => {
                console.info('case pause called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avRecorderTestBase.AV_RECORDER_STATE.PAUSED);
                    console.info('pause AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('pause AVRecorder failed and error is ' + err.message);

                    let failedSteps = new Array(
                        // release avRecorder
                        RELEASECORDER_EVENT,
                        // failed
                        FAIL_EVENT
                    )

                    toNextStep(avRecorder, avConfig, recorderTime, failedSteps, done);
                }
            })
        });

        eventEmitter.on(RESUMERECORDER_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.resume((err) => {
                console.info('case resume called');
                if (err == null) {
                    console.info('resume AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('resume AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);

                    let failedSteps = new Array(
                        // release avRecorder
                        RELEASECORDER_EVENT,
                        // failed
                        FAIL_EVENT
                    )

                    toNextStep(avRecorder, avConfig, recorderTime, failedSteps, done);
                }
            })
        });

        eventEmitter.on(RELEASECORDER_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.release((err) => {
                console.info('case release called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avRecorderTestBase.AV_RECORDER_STATE.RELEASED);
                    console.info('release AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('release AVRecorder failed and error is ' + err.message);
                }
            })
        });

        eventEmitter.on(RELEASECORDER_TIMETEST_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();

            let end;
            let start = Date.now();
            console.info(`releaseTimeTestCallback start time is : ${start}`)
            avRecorder.release((err) => {
                if (err == null) {
                    console.info(`releaseTimeTestCallback current state is : ${avRecorder.state}`)
                    console.info('release releaseTimeTestCallback success');
                    end = Date.now()
                    console.info(`releaseTimeTestCallback end time is : ${end}`)
                    let execution = parseInt(end - start)
                    console.info("releaseTimeTestCallback execution time  is :" + execution)

                    execTimes.push(execution)

                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('resume releaseTimeTestCallback failed and error is ' + err.message);
                }
            });
        });

        eventEmitter.on(START_TIMETEST_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            execTimes = new Array();
            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        });

        eventEmitter.on(END_TIMETEST_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let length = execTimes.length;
            let sum = execTimes.reduce(function (prev, curr) { return prev + curr; }, 0);
            let avg = sum / length;
            console.info("releaseTimeTestCallback avg time  is :" + avg)
            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        });

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100
            * @tc.name      : 001.test pause
            * @tc.desc      : Recorder audio 001.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderWithCallBack(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200
            * @tc.name      : 002.pause->resume
            * @tc.desc      : Recorder audio pause->resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack2(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300
            * @tc.name      : 003.test recording 3 seconds to stop
            * @tc.desc      : Local Video recording 3 seconds to stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400
            * @tc.name      : 004.pause->resume->pause
            * @tc.desc      : Local Video pause->resume->pause
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack4(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500
            * @tc.name      : 005.pause->stop->reset
            * @tc.desc      : Local Video pause->stop->reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack5(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600
           * @tc.name      : 006.pause->resume->stop->reset
           * @tc.desc      : Local Video pause->resume->stop->reset
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack6(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700
           * @tc.name      : 007.stop->reset->pause->resume->stop->reset
           * @tc.desc      : Local Video stop->reset->pause->resume->stop->reset
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack7(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800
            * @tc.name      : 008.stop->reset->pause->stop->reset
            * @tc.desc      : Local Video stop->reset->pause->stop->reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack8(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900
           * @tc.name      : 009.start->pause->start(error)
           * @tc.desc      : Local Video start->pause->start(error)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack9(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000
            * @tc.name      : 010.start->stop->pause(error)
            * @tc.desc      : Local Video start->stop->pause(error)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack10(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100
            * @tc.name      : 011. API8 audioEncoderMime
            * @tc.desc      : Local Video audioEncoderMime
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avRecorderTestBase.avRecorderWithCallBack11(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100
           * @tc.name      : 音频录制，location对应的latitude和longitude为-30和60
           * @tc.desc      : Local Video recorder with designated latitude and longitude
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            let newAvConfig = {
                audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                profile: avProfile,
                url: 'fd://',
                rotation: 0,
                location: { latitude: -30, longitude: 60 }
            }
            newAvConfig.url = fdPath;
            console.info('avConfig.url ' + newAvConfig.url);
            avRecorderTestBase.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200
           * @tc.name      : 音频录制，location对应的latitude和longitude为90和180
           * @tc.desc      : Local Video recorder with designated latitude and longitude
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            let newAvConfig = {
                audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                profile: avProfile,
                url: 'fd://',
                rotation: 0,
                location: { latitude: 90, longitude: 180 }
            }
            newAvConfig.url = fdPath;
            console.info('avConfig.url ' + newAvConfig.url);
            avRecorderTestBase.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300
           * @tc.name      : 音频录制，location对应的latitude和longitude为60和-90
           * @tc.desc      : Local Video recorder with designated latitude and longitude
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            let newAvConfig = {
                audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                profile: avProfile,
                url: 'fd://',
                rotation: 0,
                location: { latitude: 60, longitude: -90 }
            }
            newAvConfig.url = fdPath;
            console.info('avConfig.url ' + newAvConfig.url);
            avRecorderTestBase.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400
           * @tc.name      : 音频录制，location对应的latitude和longitude为0和0
           * @tc.desc      : Local Video recorder with designated latitude and longitude
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            let newAvConfig = {
                audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                profile: avProfile,
                url: 'fd://',
                rotation: 0,
                location: { latitude: 0, longitude: 0 }
            }
            newAvConfig.url = fdPath;
            console.info('avConfig.url ' + newAvConfig.url);
            avRecorderTestBase.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500
           * @tc.name      : 音频录制，location对应的latitude和longitude为0和180
           * @tc.desc      : Local Video recorder with designated latitude and longitude
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            let newAvConfig = {
                audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                profile: avProfile,
                url: 'fd://',
                rotation: 0,
                location: { latitude: 0, longitude: 180 }
            }
            newAvConfig.url = fdPath;
            console.info('avConfig.url ' + newAvConfig.url);
            avRecorderTestBase.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600
            * @tc.name      : 音频录制，location对应的latitude和longitude为-90和-180
            * @tc.desc      : Local Video recorder with designated latitude and longitude
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            let newAvConfig = {
                audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                profile: avProfile,
                url: 'fd://',
                rotation: 0,
                location: { latitude: -90, longitude: -180 }
            }
            newAvConfig.url = fdPath;
            console.info('avConfig.url ' + newAvConfig.url);
            avRecorderTestBase.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600 end')
        })


        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100
            * @tc.name      : 001.test pause->prepare
            * @tc.desc      : Recorder pause->prepare 1000 times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest01(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101
            * @tc.name      : 001.test pause
            * @tc.desc      : Recorder audio 001.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest001(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200
            * @tc.name      : 001.test channel
            * @tc.desc      : Recorder audio channel
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest02(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300
            * @tc.name      : 001.test channel
            * @tc.desc      : Recorder audio channel
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest03(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400
            * @tc.name      : 001.test resume->prepare
            * @tc.desc      : Recorder audio resume->prepare
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest04(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500
            * @tc.name      : 001.test channel
            * @tc.desc      : Recorder audio channel
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest05(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600
            * @tc.name      : 001.test pause->start
            * @tc.desc      : Recorder audio pause->start
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest06(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700
            * @tc.name      : 001.test resume->start
            * @tc.desc      : Recorder audio resume->start
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest07(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800
            * @tc.name      : 001.test creatAVRecorder->pause
            * @tc.desc      : Recorder audio creatAVRecorder->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800', 0, async function (done) {
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest08(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900
            * @tc.name      : 001.test prepare->pause
            * @tc.desc      : Recorder audio prepare->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest09(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000
            * @tc.name      : 001.test start->pause
            * @tc.desc      : Recorder audio start->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest10(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100
            * @tc.name      : 001.test resume->pause
            * @tc.desc      : Recorder audio resume->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest11(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200
            * @tc.name      : 001.test stop->pause
            * @tc.desc      : Recorder audio stop->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest12(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300
            * @tc.name      : 001.test reset->pause
            * @tc.desc      : Recorder audio reset->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest13(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400
            * @tc.name      : 001.test all step->pause
            * @tc.desc      : Recorder audio all step->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest14(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500
            * @tc.name      : 001.test pause three times
            * @tc.desc      : Recorder audio pause three times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest15(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600
            * @tc.name      : 001.test creatAVRecorder->resume
            * @tc.desc      : Recorder audio creatAVRecorder->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest16(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700
            * @tc.name      : 001.test prepare->resume
            * @tc.desc      : Recorder audio prepare->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest17(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800
            * @tc.name      : 001.test start->resume
            * @tc.desc      : Recorder audio start->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest18(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900
            * @tc.name      : 001.test pause->resume
            * @tc.desc      : Recorder audio pause->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest19(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000
            * @tc.name      : 001.test stop->resume
            * @tc.desc      : Recorder audio stop->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest20(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100
            * @tc.name      : 001.test reset->resume
            * @tc.desc      : Recorder audio reset->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest21(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200
            * @tc.name      : 001.test all->resume
            * @tc.desc      : Recorder audio all->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest22(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300
            * @tc.name      : 001.test resume threee times
            * @tc.desc      : Recorder audio resume threee times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest23(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400
            * @tc.name      : 001.test pause->stop
            * @tc.desc      : Recorder audio pause->stop
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest24(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500
            * @tc.name      : 001.test resume->stop
            * @tc.desc      : Recorder audio resume->stop
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest25(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600
            * @tc.name      : 001.test pause->reset
            * @tc.desc      : Recorder audio pause->reset
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest26(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700
            * @tc.name      : 001.test resume->reset
            * @tc.desc      : Recorder audio resume->reset
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest27(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800
            * @tc.name      : 001.test pause->release
            * @tc.desc      : Recorder audio pause->release
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest28(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900
            * @tc.name      : 001.test resume->release
            * @tc.desc      : Recorder audio resume->release
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest29(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000
            * @tc.name      : 001.test release 3 times
            * @tc.desc      : Recorder audio release 3 times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest30(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100
            * @tc.name      : 001.test create->getInputSurface
            * @tc.desc      : Recorder audio create->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest31(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200
            * @tc.name      : 001.test  prepare->getInputSurface
            * @tc.desc      : Recorder audio  prepare->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest32(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300
            * @tc.name      : 001.test  start->getInputSurface
            * @tc.desc      : Recorder audio  start->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest33(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400
            * @tc.name      : 001.test pause->getInputSurface
            * @tc.desc      : Recorder audio pause->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest34(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500
            * @tc.name      : 001.test resume->getInputSurface
            * @tc.desc      : Recorder audio resume->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest35(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600
            * @tc.name      : 001.test stop->getInputSurface
            * @tc.desc      : Recorder audio stop->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700
            * @tc.name      : 001.test reset->getInputSurface
            * @tc.desc      : Recorder audio reset->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest37(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800
            * @tc.name      : 001.test getInputSurface 3 times
            * @tc.desc      : Recorder audio getInputSurface 3 times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest38(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100
            * @tc.name      : 001.test createAVRecorder
            * @tc.desc      : Recorder audio createAVRecorder
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.createTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200
            * @tc.name      : 02.AvRecorder.prepare
            * @tc.desc      : Recorder audio AvRecorder.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.prepareTimeCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300
            * @tc.name      : 03.AvRecorder.getInputSurface
            * @tc.desc      : AvRecorder.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.getInputSurfaceTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400
            * @tc.name      : 04.AvRecorder.start
            * @tc.desc      : AvRecorder.start
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.startTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500
            * @tc.name      : 05.AvRecorder.pause
            * @tc.desc      : AvRecorder.pause
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.pauseTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600
            * @tc.name      : 06.AvRecorder.resume
            * @tc.desc      : AvRecorder.resume
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.resumeTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700
            * @tc.name      : 07.AvRecorder.stop
            * @tc.desc      : AvRecorder.stop
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.stopTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800
            * @tc.name      : 08.AvRecorder.reset
            * @tc.desc      : AvRecorder.reset
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.resetTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900
            * @tc.name      : 09.AvRecorder.release
            * @tc.desc      : AvRecorder.release
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;

            let mySteps = new Array(START_TIMETEST_EVENT);

            for (let i = 0; i < 10; i++) {
                mySteps.push(
                    // create
                    CREATE_EVENT,
                    // prepare
                    PREPARE_EVENT,
                    // start recorder
                    STARTRECORDER_EVENT,
                    // release time test
                    RELEASECORDER_TIMETEST_EVENT,
                )
            }

            mySteps.push(
                END_TIMETEST_EVENT,
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfig, 3000, mySteps, done);

            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100
            * @tc.name      : 01.createAVRecorder
            * @tc.desc      : AvRecorder.createAVRecorder
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.createTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200
            * @tc.name      : 02.AvRecorder.prepare
            * @tc.desc      : AvRecorder.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.prepareTimePromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300
            * @tc.name      : 03.AvRecorder.getInputSurface
            * @tc.desc      : AvRecorder.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.getInputSurfaceTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300 end')
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400
            * @tc.name      : 04.AvRecorder.start
            * @tc.desc      : AvRecorder.start
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.startTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500
            * @tc.name      : 05.AvRecorder.pause
            * @tc.desc      : AvRecorder.pause
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.pauseTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600
            * @tc.name      : 06.AvRecorder.resume
            * @tc.desc      : AvRecorder.resume
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.resumeTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700
            * @tc.name      : 07.AvRecorder.stop
            * @tc.desc      : AvRecorder.stop
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.stopTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800
            * @tc.name      : 08.AvRecorder.reset
            * @tc.desc      : AvRecorder.reset
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.resetTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900
            * @tc.name      : 09.AvRecorder.release
            * @tc.desc      : AvRecorder.release
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.releaseTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001
            * @tc.name      : 001.test create->getAVRecorderConfig
            * @tc.desc      : Recorder audio create->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest39(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002
            * @tc.name      : 001.test  prepare->getAVRecorderConfig
            * @tc.desc      : Recorder audio  prepare->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest40(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003
            * @tc.name      : 001.test  start->getAVRecorderConfig
            * @tc.desc      : Recorder audio  start->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest41(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004
            * @tc.name      : 001.test pause->getAVRecorderConfig
            * @tc.desc      : Recorder audio pause->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest42(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005
            * @tc.name      : 001.test resume->getAVRecorderConfig
            * @tc.desc      : Recorder audio resume->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest43(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006
            * @tc.name      : 001.test stop->getAVRecorderConfig
            * @tc.desc      : Recorder audio stop->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007
            * @tc.name      : 001.test reset->getAVRecorderConfig
            * @tc.desc      : Recorder audio reset->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest45(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001
            * @tc.name      : 001.test reset->getAVRecorderConfig
            * @tc.desc      : Recorder audio reset->getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;

            let mySteps = new Array(
                // create
                CREATE_EVENT,
                // prepare
                PREPARE_EVENT,
                // start recorder
                STARTRECORDER_EVENT,
                // pause recorder
                PAUSERECORDER_EVENT,
                // resume recorder
                RESUMERECORDER_EVENT,
                // stop recorder
                STOPRECORDER_EVENT,
                // release recorder
                RELEASECORDER_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfig, 3000, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001 end')
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100
            * @tc.name      : 003.test recording mp3 3 seconds to stop
            * @tc.desc      : Local Video recording mp3 3 seconds to stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100 start')
            let timestamp = Date.now();
            let filename = `avRecorder_${timestamp}.mp3`;
            fdObject = await mediaTestBase.getFd(filename);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avConfig.profile.fileFormat = FORMAT_MP3;
            avConfig.profile.audioCodec = ENCORDER_MP3;
            avRecorderTestBase.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100 end')
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100
            * @tc.name      : 003.test recording WAV 3 seconds to stop
            * @tc.desc      : Local Video recording WAV 3 seconds to stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100 start')
            let timestamp = Date.now();
            let filename = `avRecorder_${timestamp}.wav`;
            fdObject = await mediaTestBase.getFd(filename);
            fdPath = "fd://" + fdObject.fdNumber;
            console.info('case fdPath is: ' + fdPath);
            avConfig.url = fdPath;
            console.info('avConfig.url ' + avConfig.url);
            avConfig.profile.fileFormat = FORMAT_WAV;
            avConfig.profile.audioCodec = ENCORDER_WAV;
            avConfig.profile.audioBitrate = 64000;
            avConfig.profile.audioChannels = 1;
            avConfig.profile.audioSampleRate = 8000;
            avRecorderTestBase.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100 end')
        })
    })
}

