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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function PlayerLocalTestAudioAPI() {
describe('PlayerLocalTestAudioAPI', function () {
    let audioPlayer = media.createAudioPlayer();
    let loopValue = false;
    let isTimeOut = false;
    const AUDIO_SOURCE = '01.mp3';
    const PLAY_TIME = 3000;
    const END_STATE = 0;
    const SRC_STATE = 1;
    const PLAY_STATE = 2;
    const PAUSE_STATE = 3;
    const STOP_STATE = 4;
    const RESET_STATE = 5;
    const SEEK_STATE = 6;
    const VOLUME_STATE = 7;
    const RELEASE_STATE = 8;
    const ERROR_STATE = 9;
    const FINISH_STATE = 10;
    const LOOP_STATE = 11;
    const DURATION_TIME = 219600;
    const SEEK_TIME = 5000;
    const DELTA_TIME  = 1000;
    const SECOND_INDEX = 1;
    const VOLUME_VALUE = 0.5;
    let fdHead = 'fd://';
    let fileDescriptor = undefined;
    let fdPath = '';
    let fdNumber = 0;
    beforeAll(async function() {
        console.info('beforeAll case');
    })

    beforeEach(async function() {
        isTimeOut = false;
        await mediaTestBase.getFileDescriptor(AUDIO_SOURCE).then((res) => {
            fileDescriptor = res;
        });
        await mediaTestBase.getFdRead(AUDIO_SOURCE, openFileFailed).then((testNumber) => {
            fdNumber = testNumber;
            fdPath = fdHead + '' + fdNumber;
        })
        console.info('beforeEach case');
    })

    afterEach(async function() {
        await mediaTestBase.closeFdNumber(fdNumber);
        await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
        console.info('afterEach case');
    })

    afterAll(async function() {
        console.info('afterAll case');
    })

    function openFileFailed() {
        console.info('case file fail');
    }

    function initAudioPlayer() {
        if (audioPlayer != null) {
            audioPlayer.release();
            audioPlayer = null;
        }
        audioPlayer = media.createAudioPlayer();
        if (audioPlayer == null) {
            console.info('case create player is faild');
            expect().assertFail();
        }
    }

    function nextStep(mySteps, done) {
        if (mySteps[0] == END_STATE) {
            done();
            console.info('case to done');
            return;
        }
        switch (mySteps[0]) {
            case SRC_STATE:
                console.info(`case to prepare`);
                audioPlayer.src = fdPath;
                break;
            case PLAY_STATE:
                console.info(`case to play`);
                audioPlayer.play();
                break;
            case PAUSE_STATE:
                console.info(`case to pause`);
                audioPlayer.pause();
                break;
            case STOP_STATE:
                console.info(`case to stop`);
                audioPlayer.stop();
                break;
            case RESET_STATE:
                console.info(`case to reset`);
                audioPlayer.reset();
                break;
            case SEEK_STATE:
                console.info(`case seek to time is ${mySteps[SECOND_INDEX]}`);
                audioPlayer.seek(mySteps[SECOND_INDEX]);
                mySteps.shift();
                mySteps.shift();
                nextStep(mySteps, done);
                break;
            case VOLUME_STATE:
                console.info(`case to setVolume`);
                audioPlayer.setVolume(mySteps[SECOND_INDEX]);
                break;
            case RELEASE_STATE:
                console.info(`case to release`);
                mySteps.shift();
                audioPlayer.release();
                audioPlayer = null;
                nextStep(mySteps,done);
                break;
            case LOOP_STATE:
                loopValue = mySteps[SECOND_INDEX];
                mySteps.shift();
                mySteps.shift();
                audioPlayer.loop = loopValue;
                nextStep(mySteps,done);
                break;
            default:
                break;
        }
    }

    function setCallback(mySteps, done) {
        console.info(`case setCallback`);
        audioPlayer.on('dataLoad', () => {
            mySteps.shift();
            console.info(`case dataLoad called`);
            expect(audioPlayer.currentTime).assertEqual(0);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('idle');
            nextStep(mySteps,done);
        });
        audioPlayer.on('play', () => {
            mySteps.shift();
            console.info(`case play called`);
            mediaTestBase.msleep(PLAY_TIME);
            console.info(`case play currentTime is ${audioPlayer.currentTime}`);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            if (mySteps[0] == FINISH_STATE) {
                console.info(`case wait for finish`);
                return;
            }
            expect(audioPlayer.state).assertEqual('playing');
            nextStep(mySteps,done);
        });
        audioPlayer.on('pause', () => {
            mySteps.shift();
            console.info(`case pause called`);
            console.info(`case pause currentTime is ${audioPlayer.currentTime}`);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('paused');
            nextStep(mySteps,done);
        });
        audioPlayer.on('reset', () => {
            mySteps.shift();
            console.info(`case reset called`);
            expect(audioPlayer.state).assertEqual('idle');
            nextStep(mySteps,done);
        });
        audioPlayer.on('stop', () => {
            if (mySteps[0] == RESET_STATE) {
                console.info(`case reset stop called`);
                return;
            }
            mySteps.shift();
            console.info(`case stop called`);
            expect(audioPlayer.currentTime).assertEqual(0);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('stopped');
            nextStep(mySteps,done);
        });
        audioPlayer.on('timeUpdate', (seekDoneTime) => {
            if (seekDoneTime == null) {
                console.info(`case seek filed,errcode is ${seekDoneTime}`);
                return;
            }
            console.info(`case timeUpdate, seekDoneTime is ${seekDoneTime}`);
        });
        audioPlayer.on('volumeChange', () => {
            if (mySteps[0] != VOLUME_STATE) {
                console.info(`case setvolume called by system`);
            } else {
                console.info(`case setvolume called`);
                mySteps.shift();
                mySteps.shift();
                if (audioPlayer.state == 'playing') {
                    mediaTestBase.msleep(PLAY_TIME);
                }
                nextStep(mySteps,done);
            }
        });
        audioPlayer.on('finish', () => {
            mySteps.shift();
            expect(audioPlayer.state).assertEqual('stopped');
            expect(Math.abs(audioPlayer.currentTime - audioPlayer.duration)).assertLess(DELTA_TIME);
            console.info(`case finish called`);
            nextStep(mySteps,done);
        });
        audioPlayer.on('error', (err) => {
            console.info(`case error called,errCode is ${err.code}`);
            if ((mySteps[0] == SEEK_STATE) || (mySteps[0] == VOLUME_STATE)) {
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
                nextStep(mySteps,done);
            } else if (mySteps[0] == ERROR_STATE) {
                mySteps.shift();
                nextStep(mySteps,done);
            } else if (mySteps[0] == END_STATE) {
                console.info('case release player error');
            } else {
                mySteps.shift();
                mySteps.shift();
                nextStep(mySteps,done);
            }
        });
    }

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0100
        * @tc.name      : fd is wrong
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
     it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        fileDescriptor.fd = -1;
        let mySteps = new Array(ERROR_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.fdSrc = fileDescriptor;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0200
        * @tc.name      : offset is -1
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        fileDescriptor.offset = 1;
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, PLAY_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.fdSrc = fileDescriptor;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0300
        * @tc.name      : length is -1
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        fileDescriptor.length = -1;
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, PLAY_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.fdSrc = fileDescriptor;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0400
        * @tc.name      : fdSrc is undefined
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SRC_API_0400', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(ERROR_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.fdSrc = undefined;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0100
        * @tc.name      : 01.pause->play
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        console.info(`case update`);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, PLAY_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0200
        * @tc.name      : 02.stop->play
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, STOP_STATE, PLAY_STATE, ERROR_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0300
        * @tc.name      : 03.seek->play
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, SEEK_STATE, SEEK_TIME, PLAY_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0400
        * @tc.name      : 04.reset->play
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PLAY_API_0400', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, RESET_STATE, PLAY_STATE, ERROR_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0100
        * @tc.name      : 01.createAudioPlayer->play
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(PAUSE_STATE, ERROR_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.pause();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0200
        * @tc.name      : 02.play->pause
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0300
        * @tc.name      : 03.stop->pause
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, STOP_STATE, PAUSE_STATE, ERROR_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0400
        * @tc.name      : 04.seek->pause
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_PAUSE_API_0400', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, SEEK_STATE, SEEK_TIME, PAUSE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_STOP_API_0100
        * @tc.name      : 01.play->stop
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_STOP_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, STOP_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_STOP_API_0200
        * @tc.name      : 02.pause->stop
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_STOP_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, STOP_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_STOP_API_0300
        * @tc.name      : 03.seek->stop
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_STOP_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, SEEK_STATE, SEEK_TIME, STOP_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SEEK_API_0100
        * @tc.name      : 01.play->seek
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SEEK_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, SEEK_STATE, SEEK_TIME, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SEEK_API_0200
        * @tc.name      : 02.pause->seek
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SEEK_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, SEEK_STATE, SEEK_TIME, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SEEK_API_0300
        * @tc.name      : 03.seek(0)
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SEEK_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, SEEK_STATE, 0, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RESET_API_0100
        * @tc.name      : 01.play->reset
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RESET_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, RESET_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RESET_API_0200
        * @tc.name      : 02.pause->reset
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RESET_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, RESET_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SETVOLUME_API_0100
        * @tc.name      : 01.createAudioPlayer->setVolume
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SETVOLUME_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        var mySteps = new Array(VOLUME_STATE, VOLUME_VALUE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.setVolume(VOLUME_VALUE);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SETVOLUME_API_0200
        * @tc.name      : 02.play->setVolume
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SETVOLUME_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        var mySteps = new Array(SRC_STATE, PLAY_STATE, VOLUME_STATE, VOLUME_VALUE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SETVOLUME_API_0300
        * @tc.name      : 03.pause->setVolume
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_SETVOLUME_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        var mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, VOLUME_STATE, VOLUME_VALUE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0100
        * @tc.name      : 01.play->release
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, RELEASE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0200
        * @tc.name      : 02.pause->release
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, PAUSE_STATE, RELEASE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0300
        * @tc.name      : 03.stop->release
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0300', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0400
        * @tc.name      : 04.seek->release
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0400', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, SEEK_STATE, SEEK_TIME, RELEASE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0500
        * @tc.name      : 05.reset->release
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_RELEASE_API_0500', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let mySteps = new Array(SRC_STATE, PLAY_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = fdPath;
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_TIME_API_0100
        * @tc.name      : 01.get parameters after createAudioPlayer
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_TIME_API_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        initAudioPlayer();
        expect(audioPlayer.src).assertEqual('');
        expect(audioPlayer.duration).assertEqual(-1);
        expect(audioPlayer.currentTime).assertEqual(-1);
        expect(audioPlayer.state).assertEqual('idle');
        expect(audioPlayer.loop).assertEqual(false);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_TIME_API_0200
        * @tc.name      : 02.get parameters after src
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_TIME_API_0200', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        initAudioPlayer();
        audioPlayer.src = fdHead + fileDescriptor.fd;
        mediaTestBase.msleep(PLAY_TIME);
        expect(audioPlayer.src).assertEqual(fdHead + fileDescriptor.fd);
        expect(audioPlayer.currentTime).assertEqual(0);
        expect(audioPlayer.duration).assertEqual(DURATION_TIME);
        expect(audioPlayer.state).assertEqual('idle');
        expect(audioPlayer.loop).assertEqual(false);
        done();
    })
})
}
