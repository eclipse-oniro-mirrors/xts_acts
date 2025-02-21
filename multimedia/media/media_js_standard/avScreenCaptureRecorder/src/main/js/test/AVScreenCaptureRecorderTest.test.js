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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avScreenCaptureTest() {
    describe('avScreenCaptureTest', function () {
        let avScreenCaptureRecorder = null;
        let fdObject;

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        const SETONCALLBACK_EVENT = 'setAvScreenCaptureCallback';
        const SET_MIC_ENABLE_EVENT = 'setMicEnable';
        const CREATE_EVENT = 'create';
        const INIT_EVENT = 'init';
        const STARTRECORDER_EVENT = 'start';
        const SKIPPRIVACYMODE_EVENT = 'skipPrivacyMode';
        const STOPRECORDER_EVENT = 'stop';
        const RELEASECORDER_EVENT = 'release';
        const END_EVENT = 'end';
        const FAIL_EVENT = 'fail';

        let TAG = "[AvScreenCaptureLocalTest] ";

        beforeAll(async function () {
            console.info('beforeAll case');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await sleep(3000);
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avScreenCaptureRecorder != null) {
                avScreenCaptureRecorder.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            await sleep(1000);
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        function toNextStep(avScreenCapture, avConfig, recorderTime, steps, done) {
            if (steps[0] == END_EVENT) {
                console.info('case success!!');
                done();
            } else if (steps[0] == FAIL_EVENT) {
                console.error('case failed!!');
                expect().assertFail()
                done();
            } else {
                sleep(1000)
                console.info('next step: ' + steps[0])
                eventEmitter.emit(steps[0], avScreenCapture, avConfig, recorderTime, steps, done);
            }
        }

        function setAVScreenCaptueCallback(avScreenCaptureRecorder, done) {
            // 状态机变化回调函数
            avScreenCaptureRecorder.on('stateChange', (state) => {
                console.info('avScreenCapture stateChange to ' + state);
                switch (state) {
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STARTED:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_CANCELED:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_USER_SWITCHES:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_INTERRUPTED_BY_OTHER:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_STOPPED_BY_CALL:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNAVAILABLE:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_MUTED_BY_USER:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_MIC_UNMUTED_BY_USER:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_ENTER_PRIVATE_SCENE:
                        break;
                    case media.AVScreenCaptureStateCode.SCREENCAPTURE_STATE_EXIT_PRIVATE_SCENE:
                        break;
                    default:
                        console.error('invalid AVScreenCaptureStateCode: ' + state);
                        break;
                }
            })

            avScreenCaptureRecorder.on('error', (err) => {
                console.error('avScreenCaptureRecorder error:' + err.message);
            })
           
        }

        eventEmitter.on(SETONCALLBACK_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                setAVScreenCaptueCallback(avScreenCaptureRecorder, done)
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
            }catch(error){
                console.info('setAVScreenCaptueCallback failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(CREATE_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            media.createAVScreenCaptureRecorder().then((captureRecorder) => {
                if (captureRecorder != null) {
                    avScreenCaptureRecorder = captureRecorder;
                    console.info('createAVScreenCaptureRecorder success');
                    toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.error('createAVScreenCaptureRecorder fail');
                    expect().assertFail()
                }
            }).catch((error) => {
                console.error(`createAVScreenCaptureRecorder catchCallback, error message:${error.message}`);
                expect().assertFail()
            });
            
        });

        eventEmitter.on(INIT_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avScreenCaptureRecorder.init(avScreenCaptureRecorder).then(() => {
                console.info('avScreenCaptureRecorder init success');
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('avScreenCaptureRecorder init failed, error: ' + err.message);
                if (avConfig.fd == -1) {
                    let mySteps = new Array(END_EVENT);
                    toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, mySteps, done);
                } else {
                    expect().assertFail()
                }
                
            })
        });

        eventEmitter.on(STARTRECORDER_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();

            avScreenCaptureRecorder.startRecording().then(() => {
                console.info('avScreenCaptureRecorder start success');
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('avScreenCaptureRecorder start failed, error: ' + err.message);
                let failedSteps = new Array(
                    // release avScreenCaptureRecorder
                    RELEASECORDER_EVENT,
                    // failed
                    FAIL_EVENT
                )
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, failedSteps, done);
            })
        });

        eventEmitter.on(SKIPPRIVACYMODE_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let windowAllIds = [];
            avScreenCaptureRecorder.skipPrivacyMode(windowAllIds).then(() => {
                console.info('avScreenCaptureRecorder skipPrivacyMode success');
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('avScreenCaptureRecorder skipPrivacyMode failed, error: ' + err.message);
                let failedSteps = new Array(
                    // release avScreenCaptureRecorder
                    RELEASECORDER_EVENT,
                    // failed
                    FAIL_EVENT
                )
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, failedSteps, done);
            })
        });

        eventEmitter.on(STOPRECORDER_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avScreenCaptureRecorder.stopRecording().then(() => {
                console.info('avScreenCaptureRecorder stop success');
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('avScreenCaptureRecorder stop failed, error: ' + err.message);
                let failedSteps = new Array(
                    // release avScreenCaptureRecorder
                    RELEASECORDER_EVENT,
                    // failed
                    FAIL_EVENT
                )
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, failedSteps, done);
            })
        });

        eventEmitter.on(RELEASECORDER_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avScreenCaptureRecorder.release().then(() => {
                console.info('avScreenCaptureRecorder release success');
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('avScreenCaptureRecorder release failed, error: ' + err.message);
                expect().assertFail();
            })
        });

        eventEmitter.on(SET_MIC_ENABLE_EVENT, (avScreenCaptureRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avScreenCaptureRecorder.setMicEnabled(true).then(() => {
                console.info('avScreenCaptureRecorder setMicEnabled success');
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, failedSteps, done);
            }).catch((err) => {
                console.info('avScreenCaptureRecorder setMicEnabled failed, error: ' + err.message);
                let failedSteps = new Array(
                    // release avScreenCaptureRecorder
                    RELEASECORDER_EVENT,
                    // failed
                    FAIL_EVENT
                )
                toNextStep(avScreenCaptureRecorder, avConfig, recorderTime, failedSteps, done);
            })
        });

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100
            * @tc.name      : 01.AvScreenCaptureRecorder
            * @tc.desc      : AvScreenCaptureRecorder
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 start')

            let mySteps = new Array();

            mySteps.push(
                // create
                CREATE_EVENT,
                // init
                INIT_EVENT,
                SETONCALLBACK_EVENT,
                //setMicEnable
                SET_MIC_ENABLE_EVENT,
                // start recorder
                STARTRECORDER_EVENT,
                // skip PrivacyMode
                SKIPPRIVACYMODE_EVENT,
                // stop recorder
                STOPRECORDER_EVENT,
                END_EVENT
            )

            let avConfig = {
                fd : -1,
                frameWidth: 640,
                frameHeight: 480,
                videoBitrate : 10000000,
                audioSampleRate : 48000,
                audioChannelCount : 1,
                audioBitrate : 96000,
                preset : media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4,
            }

            eventEmitter.emit(mySteps[0], avScreenCaptureRecorder, avConfig, 3000, mySteps, done);

            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0100
            * @tc.name      : 02.AvScreenCaptureRecorder
            * @tc.desc      : AvScreenCaptureRecorder
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 start')

            let mySteps = new Array();

            mySteps.push(
                // create
                CREATE_EVENT,
                // init
                INIT_EVENT,
                SETONCALLBACK_EVENT,
                //setMicEnable
                SET_MIC_ENABLE_EVENT,
                // start recorder
                STARTRECORDER_EVENT,
                // stop recorder
                STOPRECORDER_EVENT,
                END_EVENT
            )

            let avConfig = {
                fd : -1,
                frameWidth: 640,
                frameHeight: 480,
                videoBitrate : 10000000,
                audioSampleRate : 48000,
                audioChannelCount : 1,
                audioBitrate : 96000,
                preset : media.AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H265_AAC_MP4,
            }

            eventEmitter.emit(mySteps[0], avScreenCaptureRecorder, avConfig, 3000, mySteps, done);

            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300
            * @tc.name      : 03.AvScreenCaptureRecorder
            * @tc.desc      : AvScreenCaptureRecorder
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0300 start')
            try {
                media.reportAVScreenCaptureUserChoice(-1, "-1")
            } catch (error) {
                console.info(TAG + 'reportAVScreenCaptureUserChoice error:')
                expect().assertFail()
            }
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVSCREENCAPTURERECORDER_0200 end')
            done();
        })
    })
}

