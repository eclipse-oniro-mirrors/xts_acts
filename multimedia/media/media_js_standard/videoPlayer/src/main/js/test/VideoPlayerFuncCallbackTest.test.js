/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function VideoPlayerFuncCallbackTest() {
describe('VideoPlayerFuncCallbackTest', function () {
    const VIDEO_SOURCE = 'H264_AAC.mp4';
    const PLAY_TIME = 3000;
    const SEEK_TIME = 5000;
    const WIDTH_VALUE = 720;
    const HEIGHT_VALUE = 480;
    const DURATION_TIME = 10034;
    const CREATE_EVENT = 'create';
    const SETSURFACE_EVENT = 'setDisplaySurface';
    const GETDESCRIPTION = 'getTrackDescription';
    const SETSOURCE_EVENT = 'setSource';
    const SETFDSOURCE_EVENT = 'setFdSource';
    const PREPARE_EVENT = 'prepare';
    const SRC_PREPARE_EVENT = 'src2prepare';
    const PLAY_EVENT = 'play';
    const PAUSE_EVENT = 'pause';
    const STOP_EVENT = 'stop';
    const RESET_EVENT = 'reset';
    const RELEASE_EVENT = 'release';
    const SEEK_EVENT = 'seek';
    const SEEK_MODE_EVENT = 'seekMode';
    const SETVOLUME_EVENT = 'volume';
    const SETSPEED_EVENT = 'speed';
    const SETLOOP_EVENT = 'loop';
    const WAIT_EVENT = 'wait';
    const ERROR_EVENT = 'error';
    const END_EVENT = 'end';
    const DELTA_TIME = 1000;
    const NEXT_FRAME_TIME = 8333;
    const PREV_FRAME_TIME = 4166;
    const DELTA_SEEK_TIME = 300;
    let surfaceID = '';
    let fdHead = 'fd://';
    let fileDescriptor = null;
    const pagePath1 = 'pages/surfaceTest/surfaceTest';
    const pagePath2 = 'pages/surfaceTest2/surfaceTest2';
    let pageId = 0;
    let fdPath = '';
    let fdNumber = 0;
    let events = require('events');
    let eventEmitter = new events.EventEmitter();

    beforeAll(async function() {
        console.info('beforeAll case');
        await mediaTestBase.getFileDescriptor(VIDEO_SOURCE).then((res) => {
            fileDescriptor = res;
        });
        await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
            fdNumber = testNumber;
            fdPath = fdHead + '' + fdNumber;
        })
    })

    beforeEach(async function() {
        await mediaTestBase.toNewPage(pagePath1, pagePath2, pageId);
        pageId = (pageId + 1) % 2;
        await mediaTestBase.msleepAsync(1000).then(
            () => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        surfaceID = globalThis.value;
        console.info('case new surfaceID is ' + surfaceID);
        console.info('beforeEach case');
    })

    afterEach(async function() {
        await mediaTestBase.clearRouter();
        console.info('afterEach case');
    })

    afterAll(async function() {
        await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
        await mediaTestBase.closeFdNumber(fdNumber);
        console.info('afterAll case');
    })

    function openFileFailed() {
        console.info('case file fail');
    }

    function toNextStep(videoPlayer, steps, done) {
        if (steps[0] == END_EVENT) {
            console.info('case success!!');
            done();
        } else {
            eventEmitter.emit(steps[0], videoPlayer, steps, done);
        }
    }
    function setOnCallback(videoPlayer, steps, done) {
        videoPlayer.on('playbackCompleted', () => {
            console.info('case playbackCompleted success');
        });

        videoPlayer.on('bufferingUpdate', (infoType, value) => {
            console.info('case bufferingUpdate success infoType is ' + infoType);
            console.info('case bufferingUpdate success value is ' + value);
        });

        videoPlayer.on('startRenderFrame', () => {
            console.info('case startRenderFrame success');
        });

        videoPlayer.on('videoSizeChanged', (width, height) => {
            console.info('case videoSizeChanged success');
        });

        videoPlayer.on('error', (error) => {
            console.info(`case error called,errMessage is ${error.message}`);
            if (steps[0] == ERROR_EVENT) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            }
        });
    }

    eventEmitter.on(CREATE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        media.createVideoPlayer((err, video) => {
            if (video != null) {
                videoPlayer = video;
                setOnCallback(videoPlayer, steps, done);
                expect(videoPlayer.state).assertEqual('idle');
                console.info('case createVideoPlayer success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(SETFDSOURCE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.fdSrc = steps[0];
        steps.shift();
        toNextStep(videoPlayer, steps, done);
    });

    eventEmitter.on(SETSOURCE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.url = steps[0];
        steps.shift();
        toNextStep(videoPlayer, steps, done);
    });

    eventEmitter.on(SETLOOP_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.loop = steps[0];
        steps.shift();
        toNextStep(videoPlayer, steps, done);
    });

    eventEmitter.on(WAIT_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        mediaTestBase.msleep(PLAY_TIME);
        toNextStep(videoPlayer, steps, done);
    });

    eventEmitter.on(SETSURFACE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.setDisplaySurface(surfaceID, (err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('idle');
                console.info('case setDisplaySurface success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        })
    });

    eventEmitter.on(PREPARE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.prepare((err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('prepared');
                expect(videoPlayer.duration).assertEqual(DURATION_TIME);
                expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
                expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
                console.info('case prepare success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(SRC_PREPARE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.prepare((err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('prepared');
                expect(videoPlayer.duration).assertEqual(DURATION_TIME);
                expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
                expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
                console.info('case prepare success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(GETDESCRIPTION, (videoPlayer, steps, done) => {
        steps.shift();
        let videoTrackKey = new Array('bitrate', 'codec_mime', 'frame_rate', 'height',
        'track_index', 'track_type', 'width');
        let audioTrackKey = new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate',
                'track_index', 'track_type');
        let videoTrackValue = new Array(1366541, 'video/x-h264', 6000, 480, 0, 1, 720);
        let audioTrackValue = new Array(129207, 2, 'audio/mpeg', 44100, 1, 0);
        let descriptionKey = new Array(videoTrackKey, audioTrackKey);
        let descriptionValue = new Array(videoTrackValue, audioTrackValue);
        videoPlayer.getTrackDescription((err, arrlist) => {
            if (err == null) {
                for (let i = 0; i < arrlist.length; i++) {
                    mediaTestBase.checkOldDescription(arrlist[i], descriptionKey[i], descriptionValue[i]);
                }
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(PLAY_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        let startTime = videoPlayer.currentTime;
        videoPlayer.play((err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('playing');
                console.info('case play success!!');
                mediaTestBase.msleep(PLAY_TIME);
                let endTime = videoPlayer.currentTime;
                expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(PAUSE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.pause((err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('paused');
                console.info('case pause success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(STOP_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.stop((err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('stopped');
                console.info('case stop success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(RESET_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.reset((err) => {
            if (err == null) {
                expect(videoPlayer.state).assertEqual('idle');
                console.info('case reset success!!');
                toNextStep(videoPlayer, steps, done);
            }  else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(RELEASE_EVENT, (videoPlayer, steps, done) => {
        steps.shift();
        videoPlayer.release((err) => {
            if (err == null) {
                console.info('case release success!!');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    function checkSeekTime(videoPlayer, seekMode, seekTime, seekDoneTime) {
        switch (seekMode) {
            case media.SeekMode.SEEK_NEXT_SYNC:
                if (seekTime == 0) {
                    expect(seekDoneTime).assertLess(DELTA_SEEK_TIME);
                } else if (seekTime == DURATION_TIME) {
                    expect(Math.abs(videoPlayer.currentTime - DURATION_TIME)).assertLess(DELTA_SEEK_TIME);
                } else {
                    expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
                }
                break;
            case media.SeekMode.SEEK_PREV_SYNC:
                if (seekTime == 0) {
                    expect(seekDoneTime).assertLess(DELTA_SEEK_TIME);
                } else if (seekTime == DURATION_TIME) {
                    expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
                } else {
                    expect(Math.abs(videoPlayer.currentTime - PREV_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
                }
                break;
            default:
                break;
        }
    }

    eventEmitter.on(SEEK_EVENT, (videoPlayer, steps, done) => {
        let seekTime = steps[1];
        steps.shift();
        steps.shift();
        videoPlayer.seek(seekTime, (err, seekDoneTime) => {
            if (err == null) {
                if (seekTime > DURATION_TIME) {
                    seekTime = DURATION_TIME;
                }
                checkSeekTime(videoPlayer, media.SeekMode.SEEK_PREV_SYNC, seekTime, seekDoneTime);
                console.info('case seek success and seekDoneTime is '+ seekDoneTime);
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(SEEK_MODE_EVENT, (videoPlayer, steps, done) => {
        let seekTime = steps[1];
        let seekMode = steps[2];
        steps.shift();
        steps.shift();
        steps.shift();
        videoPlayer.seek(seekTime, seekMode, (err, seekDoneTime) => {
            if (err == null) {
                if (seekTime > DURATION_TIME) {
                    seekTime = DURATION_TIME;
                }
                checkSeekTime(videoPlayer, seekMode, seekTime, seekDoneTime);
                console.info('case seek success and seekDoneTime is '+ seekDoneTime);
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    eventEmitter.on(SETVOLUME_EVENT, (videoPlayer, steps, done) => {
        let volumeValue = steps[1];
        steps.shift();
        steps.shift();
        videoPlayer.setVolume(volumeValue, (err) => {
            if (err == null) {
                console.info('case setVolume success');
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    function checkSpeedTime(videoPlayer, speedValue, startTime) {
        let endTime = videoPlayer.currentTime;
        if (videoPlayer.state == 'playing') {
            switch (speedValue) {
                case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
                    expect(Math.abs(endTime - startTime - (0.75 * 1000))).assertLess(DELTA_TIME * 0.75);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
                    expect(Math.abs(endTime - startTime - (1000))).assertLess(DELTA_TIME);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
                    expect(Math.abs(endTime - startTime - (1.25 * 1000))).assertLess(DELTA_TIME * 1.25);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
                    expect(Math.abs(endTime - startTime - (1.75 * 1000))).assertLess(DELTA_TIME * 1.75);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
                    expect(Math.abs(endTime - startTime - (2 * 1000))).assertLess(DELTA_TIME * 2);
                    break;
            }
        } else {
            console.info('case speed not in play');
        }
    }

    eventEmitter.on(SETSPEED_EVENT, (videoPlayer, steps, done) => {
        let speedValue = steps[1];
        steps.shift();
        steps.shift();
        let startTime = videoPlayer.currentTime;
        videoPlayer.setSpeed(speedValue, (err, speedMode) => {
            if (err == null) {
                mediaTestBase.msleep(1000);
                expect(speedValue).assertEqual(speedMode);
                console.info('case setSpeed success and speedMode is '+ speedMode);
                checkSpeedTime(videoPlayer, speedValue, startTime);
                toNextStep(videoPlayer, steps, done);
            } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
                steps.shift();
                toNextStep(videoPlayer, steps, done);
            } else {
                mediaTestBase.printError(err, done);
            }
        });
    });

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSOURCE_0100
        * @tc.name      : 001.test setSorce '' (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSOURCE_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let mySteps = new Array(CREATE_EVENT, SETSOURCE_EVENT, '', ERROR_EVENT, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done);            
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETVOLUME_0100
        * @tc.name      : 001.test SetVolume 0/0.5/1 (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETVOLUME_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let mySteps = new Array(CREATE_EVENT, SETSOURCE_EVENT, fdPath, SETSURFACE_EVENT,
            PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT, 0, SETVOLUME_EVENT, 0.5, SETVOLUME_EVENT, 1,
            RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done);         
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSPEED_0100
        * @tc.name      : 001.test SetSpeed 0.75/1/1.25/1.75/2 (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSPEED_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let mySteps = new Array(CREATE_EVENT, SETFDSOURCE_EVENT, fileDescriptor, SETSURFACE_EVENT,
            PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_0_75_X,
            SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_1_00_X, 
            SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_1_25_X,
            SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
            SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_2_00_X, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SEEKMODE_0100
        * @tc.name      : 001.test seek mode SEEK_PREV_SYNC/SEEK_NEXT_SYNC (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SEEKMODE_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let mySteps = new Array(CREATE_EVENT, SETFDSOURCE_EVENT, fileDescriptor, SETSURFACE_EVENT,
            PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT, SEEK_TIME, media.SeekMode.SEEK_NEXT_SYNC,
            SEEK_MODE_EVENT, SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC,RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_CALLBACK_0100
        * @tc.name      : 001.test callback bufferingUpdate/videoSizeChanged/startRenderFrame/playbackCompleted
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_CALLBACK_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let frameCount = false;
        let completedCount = 0;
        let widthValue = -1;
        let heightValue = -1;

        eventEmitter.on('test_create', () => {
            media.createVideoPlayer((err, video) => {
                if (video != null) {
                    videoPlayer = video;
                    expect(videoPlayer.state).assertEqual('idle');
                    console.info('case createVideoPlayer success!!');
                    eventEmitter.emit('test_callback');
                }else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        eventEmitter.on('test_callback', () => {
            videoPlayer.on('playbackCompleted', async () => {
                console.info('case playbackCompleted success');
                completedCount++;
                expect(widthValue).assertEqual(WIDTH_VALUE);
                expect(heightValue).assertEqual(HEIGHT_VALUE);
                expect(completedCount).assertEqual(1);
                expect(frameCount).assertEqual(true);
                videoPlayer.release((err) => {
                    if (err == null) {
                        console.info('case release success!!');
                        done();
                    } else {
                        mediaTestBase.printError(err, done);
                    }
                });
            });
    
            videoPlayer.on('bufferingUpdate', (infoType, value) => {
                console.info('case bufferingUpdate success infoType is ' + infoType);
                console.info('case bufferingUpdate success value is ' + value);
            });
    
            videoPlayer.on('startRenderFrame', () => {
                console.info('case startRenderFrame success');
                frameCount = true;
            });
    
            videoPlayer.on('videoSizeChanged', (width, height) => {
                console.info('case videoSizeChanged success');
                widthValue = width;
                heightValue = height;
            });
            eventEmitter.emit('test_setSurface');
        });

        eventEmitter.on('test_setSurface', () => {
            videoPlayer.url = fdHead + fileDescriptor.fd;
            videoPlayer.setDisplaySurface(surfaceID, (err) => {
                if (err == null) {
                    expect(videoPlayer.state).assertEqual('idle');
                    console.info('case setDisplaySurface success!!');
                    eventEmitter.emit('test_prepare');
                }else {
                    mediaTestBase.printError(err, done);
                }
            })
        });

        eventEmitter.on('test_prepare', () => {
            videoPlayer.prepare((err) => {
                if (err == null) {
                    expect(videoPlayer.state).assertEqual('prepared');
                    expect(videoPlayer.duration).assertEqual(DURATION_TIME);
                    expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
                    expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
                    console.info('case prepare success!!');
                    eventEmitter.emit('test_play');
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        eventEmitter.on('test_play', () => {
            videoPlayer.play((err) => {
                if (err == null) {
                    expect(videoPlayer.state).assertEqual('playing');
                    console.info('case play success!!');
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });
        eventEmitter.emit('test_create');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_GETTRECKDESCRIPTION_0100
        * @tc.name      : 001.test getTrackDescription (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_GETTRECKDESCRIPTION_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let mySteps = new Array(CREATE_EVENT, SETFDSOURCE_EVENT, fileDescriptor, SETSURFACE_EVENT,
            PREPARE_EVENT, GETDESCRIPTION, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_LOOP_0100
        * @tc.name      : 001.test LOOP (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_LOOP_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let mySteps = new Array(CREATE_EVENT, SETFDSOURCE_EVENT, fileDescriptor, SETSURFACE_EVENT,
            PREPARE_EVENT, SETLOOP_EVENT, true, PLAY_EVENT, SEEK_EVENT, DURATION_TIME, WAIT_EVENT,
            SEEK_EVENT, DURATION_TIME, WAIT_EVENT, SEEK_EVENT, DURATION_TIME, WAIT_EVENT,
            SEEK_EVENT, DURATION_TIME, WAIT_EVENT, SETLOOP_EVENT, false, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done); 
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_BASE_0100
        * @tc.name      : 001.test video playe (callback)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_BASE_0100', 0, async function (done) {
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let fdPath = fdHead + fileDescriptor.fd;
        let mySteps = new Array(CREATE_EVENT, SETFDSOURCE_EVENT, fileDescriptor, SETSURFACE_EVENT,
            PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, PLAY_EVENT, STOP_EVENT, RESET_EVENT, SETSOURCE_EVENT, fdPath,
            PREPARE_EVENT, SETLOOP_EVENT, true, PLAY_EVENT, SEEK_EVENT, DURATION_TIME / 2, SEEK_EVENT, 0,
            SEEK_EVENT, DURATION_TIME, WAIT_EVENT, SETLOOP_EVENT, false, RELEASE_EVENT, END_EVENT);
        eventEmitter.emit(mySteps[0], videoPlayer, mySteps, done); 
    })
})
}
