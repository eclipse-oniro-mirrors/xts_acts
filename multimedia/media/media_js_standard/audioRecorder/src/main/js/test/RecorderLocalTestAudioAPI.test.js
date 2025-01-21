/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
export default function RecorderLocalTestAudioAPI() {
    describe('RecorderLocalTestAudioAPI', function () {
        let audioRecorder = null;
        const END_STATE = 0;
        const PRE_STATE = 1;
        const START_STATE = 2;
        const PAUSE_STATE = 3;
        const RESUME_STATE = 4;
        const STOP_STATE = 5;
        const RESET_STATE = 6;
        const RELEASE_STATE = 7;
        const ERROR_STATE = 8;
        const CHANNEL_TWO = 2;
        const RECORDER_TIME = 1000;
        let fdPath;
        let fdObject;
        let audioConfig = {
            audioEncodeBitRate : 48000,
            audioSampleRate : 48000,
            numberOfChannels : CHANNEL_TWO,
            uri : 'fd://',
            location : { latitude : 30, longitude : 30 },
            audioEncoderMime : media.CodecMimeType.AUDIO_AAC,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4A,
        }
        function initAudioRecorder() {
            if (audioRecorder != null) {
                audioRecorder.release();
                audioRecorder = null;
            }
            audioRecorder = media.createAudioRecorder();
        }
    
        function nextStep(mySteps,done) {
            if (mySteps[0] == END_STATE) {
                done();
                console.info('case to done');
                return;
            }
            switch (mySteps[0]) {
                case PRE_STATE:
                    console.info('case to prepare');
                    audioRecorder.prepare(audioConfig);
                    break;
                case START_STATE:
                    console.info('case to start');
                    audioRecorder.start();
                    break;
                case PAUSE_STATE:
                    console.info('case to pause');
                    audioRecorder.pause();
                    break;
                case RESUME_STATE:
                    console.info('case to resume');
                    audioRecorder.resume();
                    break;
                case STOP_STATE:
                    console.info('case to stop');
                    audioRecorder.stop();
                    break;
                case RESET_STATE:
                    console.info('case to reset');
                    audioRecorder.reset();
                    break;
                case RELEASE_STATE:
                    console.info('case to release');
                    audioRecorder.release();
                    audioRecorder = null;
                    break;
                case ERROR_STATE:
                    console.info('case to wait error callback');
                    break;
                default:
                    break;
            }
        }
    
        function setCallback(mySteps, done) {
            audioRecorder.on('prepare', () => {
                console.info('setCallback prepare() case callback is called');
                mySteps.shift();
                nextStep(mySteps,done);
            });
    
            audioRecorder.on('start', () => {
                console.info('setCallback start() case callback is called');
                mediaTestBase.msleep(RECORDER_TIME);
                mySteps.shift();
                nextStep(mySteps,done);
            });
    
            audioRecorder.on('pause', () => {
                console.info('setCallback pause() case callback is called');
                mySteps.shift();
                nextStep(mySteps,done);
            });
    
            audioRecorder.on('resume', () => {
                console.info('setCallback resume() case callback is called');
                mediaTestBase.msleep(RECORDER_TIME);
                mySteps.shift();
                nextStep(mySteps,done);
            });
    
            audioRecorder.on('stop', () => {
                console.info('setCallback stop() case callback is called');
                mySteps.shift();
                nextStep(mySteps,done);
            });
    
            audioRecorder.on('reset', () => {
                console.info('setCallback reset() case callback is called');
                mySteps.shift();
                nextStep(mySteps,done);
            });
    
            audioRecorder.on('release', () => {
                console.info('setCallback release() case callback is called');
                mySteps.shift();
                nextStep(mySteps,done);
            });
            audioRecorder.on('error', (err) => {
                console.info(`case error called,errCode is ${err.code}`);
                mySteps.shift();
                expect(mySteps[0]).assertEqual(ERROR_STATE);
                mySteps.shift();
                nextStep(mySteps,done);
            });  
        }
    
        beforeAll(async function () {
            fdObject = await mediaTestBase.getFd('audio_api.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            console.info('beforeAll case');
        })
    
        beforeEach(function () {
            console.info('beforeEach case');
        })
    
        afterEach(function () {
            console.info('afterEach case');
        })
    
        afterAll(async function () {
            await mediaTestBase.closeFd(fdObject?.fdNumber);
            console.info('afterAll case');
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0200
            * @tc.name      : 02.start->prepare
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(START_STATE, ERROR_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.start();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0300
            * @tc.name      : 03.pause->prepare
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE,
                PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0400
            * @tc.name      : 04.resume->prepare
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE,
                PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0500
            * @tc.name      : 05.stop->prepare
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RESET_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0600
            * @tc.name      : 06.reset->prepare
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0800
            * @tc.name      : 08.all steps->prepare
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0800', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PRE_STATE, ERROR_STATE, STOP_STATE,
                PRE_STATE, RESET_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0900
            * @tc.name      : 09.prepare called three times
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0900', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, PRE_STATE, ERROR_STATE, PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1000
            * @tc.name      : 10.channel:-1
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1000', 0, async function (done) {
            audioConfig.numberOfChannels = -1;
            audioConfig.audioSampleRate = 22050;
            audioConfig.audioEncodeBitRate = 22050;
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1100
            * @tc.name      : 11.channel:-1
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1100', 0, async function (done) {
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.audioSampleRate = -1;
            audioConfig.audioEncodeBitRate = 22050;
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1200
            * @tc.name      : 12.channel:-1
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1200', 0, async function (done) {
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.audioSampleRate = 22050;
            audioConfig.audioEncodeBitRate = -1;
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0100
            * @tc.name      : 01.creatAudioRecorder->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0100', 0, async function (done) {
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.audioSampleRate = 22050;
            audioConfig.audioEncodeBitRate = 22050;
            initAudioRecorder();
            let mySteps = new Array(START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.start();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0200
            * @tc.name      : 02.prepare->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0300
            * @tc.name      : 03.pause->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, START_STATE,
                ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0400
            * @tc.name      : 04.resume->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, START_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0500
            * @tc.name      : 05.stop->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, START_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0600
            * @tc.name      : 06.reset->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, START_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0800
            * @tc.name      : 08.all steps->start
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0800', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, START_STATE, ERROR_STATE,
                PRE_STATE, START_STATE, RESET_STATE, START_STATE, ERROR_STATE, PRE_STATE, START_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0900
            * @tc.name      : 09.start called three times
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0900', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, START_STATE, ERROR_STATE,
                START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0100
            * @tc.name      : 01.creatAudioRecorder->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0100', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.pause();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0200
            * @tc.name      : 02.prepare->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0300
            * @tc.name      : 03.start->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0400
            * @tc.name      : 04.resume->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PAUSE_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0500
            * @tc.name      : 05.stop->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, PAUSE_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0600
            * @tc.name      : 06.reset->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PAUSE_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0800
            * @tc.name      : 08.all step->pause
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0800', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PAUSE_STATE, 
                STOP_STATE, PAUSE_STATE, ERROR_STATE, RESET_STATE, PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0900
            * @tc.name      : 09.pause three times
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0900', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, PAUSE_STATE, ERROR_STATE,
                PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0100
            * @tc.name      : 01.creatAudioRecorder->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0100', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.resume();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0200
            * @tc.name      : 02.prepare->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0300
            * @tc.name      : 03.start->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0400
            * @tc.name      : 04.pause->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0500
            * @tc.name      : 05.stop->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RESUME_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0600
            * @tc.name      : 06.reset->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RESUME_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0800
            * @tc.name      : 08.all->resume
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0800', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESUME_STATE, ERROR_STATE,
                PAUSE_STATE, RESUME_STATE, STOP_STATE, RESUME_STATE, ERROR_STATE,
                RESET_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0900
            * @tc.name      : 09.resume threee times
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0900', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE,
                RESUME_STATE, RESUME_STATE, ERROR_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0100
            * @tc.name      : 01.creatAudioRecorder->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0100', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(STOP_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.stop();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0200
            * @tc.name      : 02.prepare->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */ 
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, STOP_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0300
            * @tc.name      : 03.start->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0400
            * @tc.name      : 04.pause->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0500
            * @tc.name      : 05.resume->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, STOP_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0600
            * @tc.name      : 06.reset->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, STOP_STATE, ERROR_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0800
            * @tc.name      : 08.all steps->stop
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0800', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, STOP_STATE, ERROR_STATE, RESET_STATE, PRE_STATE, START_STATE, STOP_STATE,
                RESET_STATE, PRE_STATE, RESET_STATE, STOP_STATE, ERROR_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0900
            * @tc.name      : 09.stop called three times
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0900', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, STOP_STATE, ERROR_STATE,
                STOP_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0100
            * @tc.name      : 01.creatAudioRecorder->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0100', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.reset();
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0200
            * @tc.name      : 02.prepare->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0300
            * @tc.name      : 03.start->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0400
            * @tc.name      : 04.pause->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0500
            * @tc.name      : 05.resume->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RESET_STATE,
                RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0600
            * @tc.name      : 06.stop->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0800
            * @tc.name      : 08.all steps->reset
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0800', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, RESET_STATE, PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, START_STATE,
                STOP_STATE, RESET_STATE, PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0900
            * @tc.name      : 09.reset callend three times
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0900', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE,
                RESET_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0100
            * @tc.name      : 01.creatAudioRecorder->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0100', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.release();
            audioRecorder = null;
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0200
            * @tc.name      : 02.prepare->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0200', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0300
            * @tc.name      : 03.start->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0300', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0400
            * @tc.name      : 04.pause->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0400', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0500
            * @tc.name      : 05.resume->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0500', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0600
            * @tc.name      : 06.stop->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */ 
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0600', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0700
            * @tc.name      : 07.reset->release
            * @tc.desc      : Reliability Test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0700', 0, async function (done) {
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    })
}
