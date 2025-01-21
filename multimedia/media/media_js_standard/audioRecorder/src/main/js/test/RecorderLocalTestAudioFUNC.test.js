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
import * as videoRecorderBase from '../../../../../VideoRecorderTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

export default function RecorderLocalTestAudioFUNC() {
    describe('RecorderLocalTestAudioFUNC', function () {
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
        const CHECK_STATE = 9;
        const RECORDER_TIME = 3000;
        const CHANNEL_ONE = 1;
        const CHANNEL_TWO = 2;
        const FORMAT_MP4 = media.AudioOutputFormat.MPEG_4;
        const FORMAT_M4A = media.AudioOutputFormat.AAC_ADTS;
        const ENCORDER_AACLC = media.AudioEncoder.AAC_LC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let recorderTime;
        let fdPath;
        let fdObject;
        let audioConfig = {
            audioEncoder : ENCORDER_AACLC,
            audioEncodeBitRate : 48000,
            audioSampleRate : 48000,
            numberOfChannels : CHANNEL_TWO,
            format : FORMAT_M4A,
            uri : 'fd://',
            location : { latitude : 30, longitude : 30 },
        }
    
        function initAudioRecorder() {
            if (audioRecorder != null) {
                audioRecorder.release();
                audioRecorder = null;
            }
            audioRecorder = media.createAudioRecorder();
        }
    
        beforeAll(async function () {
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(2000);
            await mediaTestBase.driveFn(3);
            console.info('beforeAll case');
        })
    
        beforeEach(function () {
            console.info('beforeEach case');
            fdObject = null;
        })
    
        afterEach(async function () {
            await mediaTestBase.closeFd(fdObject?.fdNumber);
            console.info('afterEach case');
        })
    
        afterAll(function () {
            console.info('afterAll case');
        })
    
        async function nextStep(mySteps,done) {
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
                case CHECK_STATE:
                    mySteps.shift();
                    trackArray = mySteps[0];
                    recorderTime = mySteps[1];
                    mySteps.shift();
                    mySteps.shift();
                    await videoRecorderBase.checkVideos(fdPath, recorderTime, trackArray, null);
                    nextStep(mySteps, done);
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
                nextStep(mySteps, done);
            });
    
            audioRecorder.on('start', () => {
                console.info('setCallback start() case callback is called');
                mediaTestBase.msleep(RECORDER_TIME);
                mySteps.shift();
                nextStep(mySteps, done);
            });
    
            audioRecorder.on('pause', () => {
                console.info('setCallback pause() case callback is called');
                mySteps.shift();
                nextStep(mySteps, done);
            });
    
            audioRecorder.on('resume', () => {
                console.info('setCallback resume() case callback is called');
                mediaTestBase.msleep(RECORDER_TIME);
                mySteps.shift();
                nextStep(mySteps, done);
            });
    
            audioRecorder.on('stop', () => {
                console.info('setCallback stop() case callback is called');
                mySteps.shift();
                nextStep(mySteps, done);
            });
    
            audioRecorder.on('reset', () => {
                console.info('setCallback reset() case callback is called');
                mySteps.shift();
                nextStep(mySteps, done);
            });
    
            audioRecorder.on('release', () => {
                console.info('setCallback release() case callback is called');
                mySteps.shift();
                nextStep(mySteps, done);
            });
            audioRecorder.on('error', (err) => {
                console.info(`case error called,errCode is ${err.code}`);
                mySteps.shift();
                expect(mySteps[0]).assertEqual(ERROR_STATE);
                mySteps.shift();
                nextStep(mySteps, done);
            });
        }
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0100
            * @tc.name      : 01.AAC
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0100', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_01.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0200
            * @tc.name      : 02.AAC_Different Channels 1
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0200', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_02.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.numberOfChannels = CHANNEL_ONE;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0300
            * @tc.name      : 02.AAC_Different Channels 2
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0300', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_03.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.numberOfChannels = CHANNEL_TWO;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0400
            * @tc.name      : 03.AAC_DifferentSampleRate 8000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0400', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_04.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 8000; // samplerate 8000
            audioConfig.numberOfChannels = CHANNEL_TWO;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0500
            * @tc.name      : 03.AAC_DifferentSampleRate 32000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0500', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_05.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 32000; // samplerate 32000
            audioConfig.numberOfChannels = CHANNEL_ONE;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0600
            * @tc.name      : 03.AAC_DifferentSampleRate 44100
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0600', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_06.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 44100; // samplerate 44100
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0700
            * @tc.name      : 03.AAC_DifferentSampleRate 64000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0700', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_07.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 64000; // samplerate 64000
            audioConfig.numberOfChannels = CHANNEL_ONE;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0800
            * @tc.name      : 03.AAC_DifferentSampleRate 96000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0800', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_08.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 96000; // samplerate 96000
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0900
            * @tc.name      : 04.AAC_DifferentBitrate 8000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0900', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_09.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 22050; // samplerate 22050
            audioConfig.audioEncodeBitRate = 8000; // encodeBitrate 8000
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1000
            * @tc.name      : 04.AAC_DifferentBitrate 16000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1000', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_10.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 44100; // samplerate 44100
            audioConfig.audioEncodeBitRate = 16000; // encodeBitrate 16000
            audioConfig.numberOfChannels = CHANNEL_ONE;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1100
            * @tc.name      : 04.AAC_DifferentBitrate 32000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1100', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_11.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 44100; // samplerate 44100
            audioConfig.audioEncodeBitRate = 32000; // encodeBitrate 32000
            audioConfig.numberOfChannels = CHANNEL_ONE;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1200
            * @tc.name      : 04.AAC_DifferentBitrate 64000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1200', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_12.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 44100; // samplerate 44100
            audioConfig.audioEncodeBitRate = 64000; // encodeBitrate 64000
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1300
            * @tc.name      : 04.AAC_DifferentBitrate 112000
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1300', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_13.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioSampleRate = 44100; // samplerate 44100
            audioConfig.audioEncodeBitRate = 112000; // encodeBitrate 112000
            audioConfig.numberOfChannels = CHANNEL_TWO;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_MP4_0100
            * @tc.name      : 02.AAC,mp4
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */ 
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_MP4_0100', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_14.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioEncodeBitRate = 22050; // samplerate 22050
            audioConfig.audioSampleRate = 22050; // encodeBitrate 22050
            audioConfig.format = FORMAT_MP4;
            audioConfig.numberOfChannels = CHANNEL_TWO;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_M4A_0100
            * @tc.name      : 02.AAC,mp4
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_M4A_0100', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_15.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.audioEncodeBitRate = 22050; // samplerate 22050
            audioConfig.audioSampleRate = 22050; // encodeBitrate 22050
            audioConfig.format = FORMAT_M4A;
            audioConfig.numberOfChannels = CHANNEL_TWO;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0100
            * @tc.name      : 001.start
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0100', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_16.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0200
            * @tc.name      : 002.pause
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0200', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_17.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, STOP_STATE,
                                    RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0300
            * @tc.name      : 003.pause->resume
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0300', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_18.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE,
                STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0400
            * @tc.name      : 005.reset
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0400', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_19.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0500
            * @tc.name      : 006.pause->resume->pause
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0500', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_20.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PAUSE_STATE,
                STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0600
            * @tc.name      : 007.pause->stop->reset
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0600', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_21.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, STOP_STATE,
                RESET_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0700
            * @tc.name      : 008.pause->resume->stop->reset
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0700', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_22.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, STOP_STATE,
                RESET_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0800
            * @tc.name      : 009.stop->reset->pause->resume->stop->reset
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0800', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_23.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, START_STATE,
                PAUSE_STATE, RESUME_STATE, STOP_STATE, RESET_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0900
            * @tc.name      : 010.stop->reset->pause->stop->reset
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0900', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_24.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_M4A;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, START_STATE,
                PAUSE_STATE, STOP_STATE, RESET_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1000
            * @tc.name      : 011.start->reset->start->stop
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1000', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_25.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE,
                START_STATE, STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1100
            * @tc.name      : 012.start->pause->start(error)
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1100', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_26.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, START_STATE, ERROR_STATE,
                STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1200
            * @tc.name      : 013.start->stop->pause(error)
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1200', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_27.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            audioConfig.uri = fdPath;
            audioConfig.format = FORMAT_MP4;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, PAUSE_STATE, ERROR_STATE,
                RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(audioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1300
            * @tc.name      : 014. API8 audioEncoderMime: audio/mp4a-latm,
            *                           fileFormat:mp4
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1300', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_28.mp4');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            let newAudioConfig = {
                audioEncodeBitRate : 22050,
                audioSampleRate : 22050,
                numberOfChannels : CHANNEL_TWO,
                uri : 'fd://',
                location : { latitude : 1, longitude : 1 },
                audioEncoderMime : media.CodecMimeType.AUDIO_AAC,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            }
            newAudioConfig.uri = fdPath;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, newAudioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(newAudioConfig);
        })
    
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1400
            * @tc.name      : 014. API8 audioEncoderMime: audio/mp4a-latm,
            *                           fileFormat:m4a
            * @tc.desc      : Audio recordr control test
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1400', 0, async function (done) {
            fdObject = await mediaTestBase.getFd('audio_29.m4a');
            fdPath = "fd://" + fdObject.fdNumber.toString();
            let newAudioConfig = {
                audioEncodeBitRate : 22050,
                audioSampleRate : 22050,
                numberOfChannels : CHANNEL_TWO,
                uri : 'fd://',
                location : { latitude : 1, longitude : 1 },
                audioEncoderMime : media.CodecMimeType.AUDIO_AAC,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4A,
            }
            newAudioConfig.uri = fdPath;
            let trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, newAudioConfig);
            initAudioRecorder();
            let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
                CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
            setCallback(mySteps, done);
            audioRecorder.prepare(newAudioConfig);
        })
    })
    
}

