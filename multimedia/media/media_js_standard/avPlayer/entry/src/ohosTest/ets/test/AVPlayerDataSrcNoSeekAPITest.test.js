/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import * as mediaTestBase from '../../../../../../MediaTestBase.js';
import media from '@ohos.multimedia.media'
import fileio from '@ohos.fileio'
import { testAVPlayerFun, AV_PLAYER_STATE, setSource } from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function AVPlayerDataSrcNoSeekAPITest() {
    describe('AVPlayerDataSrcNoSeekAPITest', function () {
        const PLAY_TIME = 1000;
        const TAG = 'AVPlayerLocalAPITest:';
        const CREATE_EVENT = 'create';
        const SETURL_EVENT = 'setUrl';
        const SETFDSRC_EVENT = 'setfdSrc';
        const SETSOURCE_EVENT = 'setSource';
        const SETDATASRC_NOSEEK_EVENT = 'setDataSourceNoseek';
        const SETSURFACE_EVENT = 'setDisplaySurface';
        const GETDESCRIPTION_PROMISE = 'getTrackDescriptionPromise';
        const GETDESCRIPTION_CALLBACK = 'getTrackDescriptionCallback';
        const PREPARE_EVENT = 'prepare';
        const PLAY_EVENT = 'play';
        const PAUSE_EVENT = 'pause';
        const STOP_EVENT = 'stop';
        const RESET_EVENT = 'reset';
        const RELEASE_EVENT = 'release';
        const SEEK_EVENT = 'seek';
        const SEEK_FUNCTION_EVENT = 'seek_function';
        const SPEED_FUNCTION_EVENT = 'speed_function';
        const PLAY_FUNCTION_EVENT = 'play_function';
        const SETVOLUME_EVENT = 'volume';
        const SETSPEED_EVENT = 'speed';
        const FINISH_EVENT = 'finish';
        const ERROR_EVENT = 'error';
        const LOOP_EVENT = 'loop';
        const END_EVENT = 'end';
        const DELTA_TIME = 1000;
        let pathDir = globalThis.abilityContext.filesDir;
        let stepCount = 0;
        let testTag = 'test';
        let events = require('events');
        let eventEmitter = new events.EventEmitter();
        let path_mp3 = pathDir + "/01_15s.mp3";
        let path_h264_mp3_ts = pathDir + "/h264_mp3_640x480_25r.ts";
        let path_mpeg4_mkv = pathDir + "/mpeg4_none_audio.mkv";
        let readAtList = new Array();
        let fdList = new Array();
        let srcList = new Array();
        let pathList = new Array();
        let avPlayer = null;

        let surfaceID = globalThis.value;
        let testCount = 0;
        let myStepsList = new Array();
        let myStepsNameList = new Array();
        let testFdSource;
        let testDataSource;
        let srcCount = 0;
        let duration = 0;
        let durationTag = -100;
        let halfDurationTag = -50;
        let speedValue = -1;
        let videoInfor = new Array({
            type: 'video_audio',
            width: 720,
            height: 640,
            duration: 10034,
            state: '',
            PREV_FRAME: 4166,
            NEXT_FRAME: 8333,
        }, {
            type: 'audio',
            width: 0,
            height: 0,
            duration: 219600,
            state: '',
            PREV_FRAME: 0,
            NEXT_FRAME: 0,
        }, {
            type: 'video',
            width: 720,
            height: 640,
            duration: 10034,
            state: '',
            PREV_FRAME: 5000,
            NEXT_FRAME: 10001,
        });

        let descriptionKey01 = new Array(['bitrate', 'codec_mime', 'frame_rate', 'height',
            'track_index', 'track_type', 'width'], ['bitrate', 'channel_count', 'codec_mime', 'sample_rate',
            'track_index', 'track_type']);
        let descriptionValue01 = new Array([1366541, 'video/avc', 6000, 480, 0, 1, 720], [129207, 2, 'audio/mp4a-latm', 44100, 1, 0]);
        let descriptionKey02 = new Array(['channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type']);
        let descriptionValue02 = new Array([1, 'audio/mpeg', 48000, 0, 0]);
        let descriptionKey03 = new Array(['bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width']);
        let descriptionValue03 = new Array([1506121, 'video/avc', 6000, 480, 0, 1, 720]);
        let descriptionKey = new Array(descriptionKey01, descriptionKey02, descriptionKey03);
        let descriptionValue = new Array(descriptionValue01, descriptionValue02, descriptionValue03);

        beforeAll(async function () {
            console.info('beforeAll case');

            pathList = new Array(path_mp3, path_h264_mp3_ts, path_mpeg4_mkv);
            for (let i = 0; i < pathList.length; i++) {
                fdList.push(fileio.openSync(pathList[i], 0o0));
                readAtList.push(setReadAt(fdList[i], pathList[i]));
                srcList.push({ fileSize: -1, callback: readAtList[i] });
                console.info('fdList:' + fdList[i]);
            }
        })
        beforeEach(async function () {
            testDataSource = srcList[0];
            srcCount = 0;
            testCount = 0;
            stepCount = 0;
            console.info('beforeEach case');
        })

        afterEach(async function () {
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            avPlayer = null;
            console.info('afterEach case');
        })

        function setReadAt(fd, filePath) {
            let readAt = (buf, length, pos) => {
                console.info(' readAt:' + length);
                let num = 0;
                if (buf == undefined || length == undefined) {
                    expect().assertFail();
                    return -1;
                }
                if (pos == undefined) {
                    num = fileio.readSync(fd, buf, { offset: 0, length: length });
                    if (num == 0) {
                        fileio.closeSync(fd);
                        fd = fileio.openSync(filePath, 0o0);
                    }
                } else {
                    num = stream.readSync(buf, { offset: 0, length: length, position: pos });
                }
                console.info(' readAt num:' + num);
                if (num > 0) {
                    return num;
                }
                return -1;
            }
            return readAt;
        }
        function setReadAtErr(fd, filePath) {
            let readAt = (buf, length, pos) => {
                console.info(' readAt:' + length);
                let num = 0;
                if (buf == undefined || length == undefined) {
                    expect().assertFail();
                    return -1;
                }
                num = fileio.readSync(fd, buf, { offset: 1000, length: 2000 });
                if (num == 0) {
                    fileio.closeSync(fd);
                    fd = fileio.openSync(filePath, 0o0);
                }
                console.info(' readAt num:' + num);
                if (num > 0) {
                    return num;
                }
                return -1;
            }
            return readAt;
        }
        function openFileFailed() {
            console.info('case file fail');
        }

        afterAll(async function () {
            console.info('afterAll case');
            for (let i = 0; i < srcList.length; i++) {
                fileio.closeSync(fdList[i]);
            }
        })

        async function setOtherCallback(avPlayer, steps, done) {
            avPlayer.on('error', (error) => {
                console.error(TAG + 'error happened,message is :' + error.message)
                if (steps[stepCount] == ERROR_EVENT) {
                    stepCount++;
                    toNextStep(avPlayer, steps, done);
                } else {
                    expect().assertFail();
                    steps[stepCount] = END_EVENT;
                    avPlayer.release((err) => {
                        if (err == undefined) {
                            console.info(TAG + ' release success');
                        } else {
                            console.info(TAG + 'error happened, release failed,message is :' + err.message);
                        }
                    })
                }
            })
            // 时间戳变化上报函数
            avPlayer.on('timeUpdate', (time) => {
                console.info(TAG + 'timeUpdate called: time is :' + time)
            })
            // 音量变化上报函数
            avPlayer.on('volumeChange', (vol) => {
                console.info(TAG + 'volumeChange success,and new volume is :' + vol)
                toNextStep(avPlayer, steps, done);
            })
            // 视频播放结束触发回调
            avPlayer.on('endOfStream', () => {
                console.info(TAG + 'endOfStream success')
            })
            // seek操作回调函数
            avPlayer.on('seekDone', (seekDoneTime) => {
                console.info(TAG + 'seekDone success,and seek time is:' + seekDoneTime)
                expect(seekDoneTime).assertEqual(steps[stepCount - 2] == durationTag ? duration : steps[stepCount - 2]);
                toNextStep(avPlayer, steps, done);
            })
            // 设置倍速播放回调函数
            avPlayer.on('speedDone', (speed) => {
                console.info(TAG + 'speedDone success,and speed value is:' + speed)
                expect(speed).assertEqual(steps[stepCount]);
                stepCount++;
                toNextStep(avPlayer, steps, done);
            })
            // bitrate设置成功回调函数
            avPlayer.on('bitrateDone', (bitrate) => {
                console.info(TAG + 'bitrateDone success,and bitrate value is:' + bitrate)
            })
            // 缓冲上报回调函数
            avPlayer.on('bufferingUpdate', (infoType, value) => {
                console.info(TAG + 'bufferingUpdate success,and infoType value is:' + infoType + ', value is :' + value)
            })
            // duration 变化函数上报
            avPlayer.on('durationUpdate', (duration) => {
                console.info(TAG + 'durationUpdate called,duration:' + duration)
            })
            // 首帧上报回调函数
            avPlayer.on('startRenderFrame', () => {
                console.info(TAG + 'startRenderFrame success')
            })
            // 视频宽高上报回调函数
            avPlayer.on('videoSizeChange', (width, height) => {
                console.info(TAG + 'videoSizeChange success,and width is:' + width + ', height is :' + height)
            })
            // 焦点上报回调函数
            avPlayer.on('audioInterrupt', (info) => {
                console.info(TAG + 'audioInterrupt success,and InterruptEvent info is:' + info)
            })
            // HLS上报所有支持的比特率
            avPlayer.on('availableBitrates', (bitrates) => {
                console.info(TAG + 'availableBitrates success,and availableBitrates length is:' + bitrates.length)
            })
        }

        // 状态机变化回调函数
        async function setStateChangeCallback(avPlayer, steps, done) {
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.IDLE:
                        console.info(TAG + 'state idle called')
                        break;
                    case AV_PLAYER_STATE.INITIALIZED:
                        toNextStep(avPlayer, steps, done);
                        console.info(TAG + 'state initialized called ')
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        console.info(TAG + 'state prepared called')
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        console.info(TAG + 'state playing called')
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        console.info(TAG + 'state paused called')
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        console.info(TAG + 'state completed called')
                        toNextStep(avPlayer, steps, done);
                        break;
                    case AV_PLAYER_STATE.STOPPED:
                        console.info(TAG + 'state stopped called')
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        console.info(TAG + 'state released called')
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        console.info(TAG + 'state error called')
                        break;
                    default:
                        console.info(TAG + 'unkown state :' + state)
                        break;
                }
            })
        }

        // 释放数组内存
        function deleteArrayList() {
            for (let i = 0; i < myStepsList.length; i++) {
                console.info(TAG + 'case delete myStepsList!!');
                myStepsList[i].length = 0;
            }
            myStepsList.length = 0;
            myStepsNameList.length = 0;
            console.info(TAG + 'case delete myStepsNameList!!');
        }

        // 执行下一步操作函数
        async function toNextStep(avPlayer, steps, done) {
            console.info(TAG + 'next step is :' + steps[stepCount]);
            if (steps[stepCount] == END_EVENT) {
                avPlayer = null;
                if ((testCount == myStepsList.length)) {
                    if (srcCount == (srcList.length - 1)) {
                        console.info(TAG + 'case success!!');
                        deleteArrayList();
                        done();
                    } else {
                        stepCount = 0;
                        srcCount++;
                        testDataSource = srcList[srcCount];
                        testCount = 0;
                        eventEmitter.emit(testTag);
                    }
                } else {
                    stepCount = 0;
                    console.info(TAG + 'start next step,and length is:' + testCount)
                    eventEmitter.emit(testTag);
                }
            } else {
                eventEmitter.emit(steps[stepCount], avPlayer, steps, done);
            }
        }

        // 触发create事件,创建avplayer实例对象
        eventEmitter.on(CREATE_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            media.createAVPlayer((err, video) => {
                if (video != null) {
                    avPlayer = video;
                    // 设置状态机回调函数
                    setStateChangeCallback(avPlayer, steps, done);
                    setOtherCallback(avPlayer, steps, done);
                    expect(avPlayer.state).assertEqual('idle');
                    console.info(TAG + 'createVideoPlayer success!!');
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // 设置播放源，即avplayer.url的值
        eventEmitter.on(SETSOURCE_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.url = steps[stepCount];
            stepCount++;
        });

        // 设置播放源，即avplayer.fdSrc的值
        eventEmitter.on(SETFDSRC_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.fdSrc = testFdSource;
        });

        // 设置播放源，即avplayer.fdSrc的值
        eventEmitter.on(SETDATASRC_NOSEEK_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.dataSrc = testDataSource;
        });

        // 设置surfaceID
        eventEmitter.on(SETSURFACE_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.surfaceId = steps[stepCount];
            stepCount++;
            toNextStep(avPlayer, steps, done);
        });

        // prepare 操作
        eventEmitter.on(PREPARE_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.prepare((err) => {
                if (err == null) {
                    console.info(TAG + 'prepare success!!');
                    duration = avPlayer.duration;
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    console.info(TAG + 'prepare error happened,and message is :' + err.message);
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // play 操作
        eventEmitter.on(PLAY_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.play(async (err) => {
                if (err == null) {
                    console.info(TAG + 'play success!!');
                    await mediaTestBase.msleepAsync(PLAY_TIME);
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    console.info(TAG + 'play error happened,and message is :' + err.message);
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // pause 操作
        eventEmitter.on(PAUSE_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.pause(async (err) => {
                if (err == null) {
                    console.info(TAG + 'pause success!!');
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    console.info(TAG + 'pause error happened,and message is :' + err.message);
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // stop 操作
        eventEmitter.on(STOP_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.stop(async (err) => {
                if (err == null) {
                    console.info(TAG + 'stop success!!');

                    fileio.closeSync(fdList[srcCount]);
                    fdList[srcCount] = fileio.openSync(pathList[srcCount], 0o0);

                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    console.info(TAG + 'stop error happened,and message is :' + err.message);
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // reset 操作
        eventEmitter.on(RESET_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.reset(async (err) => {
                if (err == null) {
                    console.info(TAG + 'reset success!!');
                    fileio.closeSync(fdList[srcCount]);
                    fdList[srcCount] = fileio.openSync(pathList[srcCount], 0o0);
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    console.info(TAG + 'reset error happened,and message is :' + err.message);
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // seek 操作
        eventEmitter.on(SEEK_EVENT, (avPlayer, steps, done) => {
            let seekTime = steps[stepCount + 1];
            if (seekTime == durationTag) {
                seekTime = videoInfor[srcCount].duration;
            }
            let seekMode = steps[stepCount + 2];
            stepCount = stepCount + 3
            avPlayer.seek(seekTime, seekMode);
        });

        // 设置音量操作
        eventEmitter.on(SETVOLUME_EVENT, (avPlayer, steps, done) => {
            let volumeValue = steps[stepCount + 1];
            stepCount = stepCount + 2;
            avPlayer.setVolume(volumeValue)
        });

        // 设置倍数操作
        eventEmitter.on(SETSPEED_EVENT, (avPlayer, steps, done) => {
            let speedValue = steps[stepCount + 1];
            stepCount++;
            avPlayer.setSpeed(speedValue);
        });

        // 设置loop值
        eventEmitter.on(LOOP_EVENT, (avPlayer, steps, done) => {
            let loopValue = steps[stepCount + 1];
            stepCount = stepCount + 2
            avPlayer.loop = loopValue;
            if ((steps[stepCount] != ERROR_EVENT)) {
                toNextStep(avPlayer, steps, done);
            }
        });

        // 等待complete上报
        eventEmitter.on(FINISH_EVENT, (avPlayer, steps, done) => {
            stepCount++
            console.info(TAG + 'wait for completed called');
        });


        // 释放avplayer实例对象
        eventEmitter.on(RELEASE_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.release((err) => {
                if (err == null) {
                    console.info(TAG + 'release success!!');
                    fileio.closeSync(fdList[srcCount]);
                    fdList[srcCount] = fileio.openSync(pathList[srcCount], 0o0);
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    toNextStep(avPlayer, steps, done);
                    console.info(TAG + 'release failed, and message is:' + err.message);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // function seek 调用接口： SUB_MULTIMEDIA_MEDIA_AVPLAYER_FUNCTION_SEEK
        async function checkSeekTime(avPlayer, seekTime, seekMode) {
            console.info(TAG + 'test currentTime is:' + avPlayer.currentTime);
            switch (seekTime) {
                case 0:
                    if (seekMode == media.SeekMode.SEEK_PREV_SYNC) {
                        expect(avPlayer.currentTime - 0).assertLess(DELTA_TIME);
                    } else {
                        expect(avPlayer.currentTime - videoInfor[srcCount].PREV_FRAME).assertLess(DELTA_TIME);
                    }
                    break;
                case videoInfor[srcCount].duration / 2:
                    if (seekMode == media.SeekMode.SEEK_PREV_SYNC) {
                        expect(avPlayer.currentTime - videoInfor[srcCount].PREV_FRAME).assertLess(DELTA_TIME);
                    } else {
                        expect(avPlayer.currentTime - videoInfor[srcCount].NEXT_FRAME).assertLess(DELTA_TIME);
                    }
                    break;
                case videoInfor[srcCount].duration:
                    if (seekMode == media.SeekMode.SEEK_PREV_SYNC) {
                        expect(avPlayer.currentTime - videoInfor[srcCount].NEXT_FRAME).assertLess(DELTA_TIME);
                    } else {
                        expect(avPlayer.currentTime - seekTime).assertLess(DELTA_TIME);
                    }
                    break;
            }
        }

        eventEmitter.on(SEEK_FUNCTION_EVENT, (avPlayer, steps, done) => {
            let seekTime;
            if (steps[stepCount + 1] == halfDurationTag) {
                seekTime = videoInfor[srcCount].duration / 2;
            } else if (steps[stepCount + 1] == durationTag) {
                seekTime = videoInfor[srcCount].duration;
            } else {
                seekTime = steps[stepCount + 1];
            }
            let seekMode = steps[stepCount + 2];
            // seek操作回调函数
            avPlayer.on('seekDone', (seekDoneTime) => {
                console.info(TAG + 'seekDone success, seekTime is ' + seekTime + ' seekDoneTime time is:' + seekDoneTime);
                expect(seekDoneTime).assertEqual(seekTime);
                if (videoInfor[srcCount].type == 'audio') {
                    expect(avPlayer.currentTime - seekDoneTime).assertLess(DELTA_TIME);
                } else {
                    checkSeekTime(avPlayer, seekTime, seekMode);
                }
                toNextStep(avPlayer, steps, done);
            })
            stepCount = stepCount + 3
            avPlayer.seek(seekTime, seekMode);
        });

        // function speed 调用接口： SUB_MULTIMEDIA_MEDIA_AVPLAYER_FUNCTION_SPEED
        function checkSpeedTime(avPlayer, speedValue, startTime) {
            let newTime = avPlayer.currentTime;
            console.info(TAG + 'start checkSpeedTime 22,new time is :' + newTime);
            if (avPlayer.state == 'playing') {
                switch (speedValue) {
                    case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (0.75 * PLAY_TIME))).assertLess(DELTA_TIME * 0.75);
                        break;
                    case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (PLAY_TIME))).assertLess(DELTA_TIME);
                        break;
                    case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (1.25 * PLAY_TIME))).assertLess(DELTA_TIME * 1.25);
                        break;
                    case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (1.75 * PLAY_TIME))).assertLess(DELTA_TIME * 1.75);
                        break;
                    case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (2 * PLAY_TIME))).assertLess(DELTA_TIME * 2);
                    case media.PlaybackSpeed.SPEED_FORWARD_0_50_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (2 * PLAY_TIME))).assertLess(DELTA_TIME * 2);
                    case media.PlaybackSpeed.SPEED_FORWARD_1_50_X:
                        console.error('checkSpeedTime time is :' + (newTime - startTime));
                        expect(Math.abs(newTime - startTime - (2 * PLAY_TIME))).assertLess(DELTA_TIME * 2);
                        break;
                }
            } else {
                console.info('case speed not in play');
            }
        }

        eventEmitter.on(SPEED_FUNCTION_EVENT, (avPlayer, steps, done) => {
            let testSpeedValue = steps[stepCount + 1];
            stepCount = stepCount + 2;
            avPlayer.on('speedDone', (speed) => {
                console.info(TAG + 'speedDone success, set speed value is ' + testSpeedValue + ' speed value is:' + speed)
                expect(speed).assertEqual(testSpeedValue);
                speedValue = speed;
                toNextStep(avPlayer, steps, done);
            })
            avPlayer.setSpeed(testSpeedValue);
        });

        eventEmitter.on(PLAY_FUNCTION_EVENT, (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.play(async (err) => {
                if (err == null) {
                    let startTime = avPlayer.currentTime;
                    console.info(TAG + 'start checkSpeedTime 11,start time is :' + startTime);
                    await mediaTestBase.msleepAsync(PLAY_TIME);
                    //checkSpeedTime(avPlayer, speedValue, startTime);
                    toNextStep(avPlayer, steps, done);
                } else if ((err != null) && (steps[stepCount] == ERROR_EVENT)) {
                    stepCount++;
                    console.info(TAG + 'play error happened,and message is :' + err.message);
                    toNextStep(avPlayer, steps, done);
                } else {
                    mediaTestBase.printError(err, done);
                }
            });
        });

        // gettreckdescription promise
        eventEmitter.on(GETDESCRIPTION_PROMISE, async (avPlayer, steps, done) => {
            let arrayDescription;
            stepCount++;
            await avPlayer.getTrackDescription().then((arrayList) => {
                console.info('case getTrackDescription called!!');
                if (typeof (arrayList) != 'undefined') {
                    arrayDescription = arrayList;
                    expect(descriptionKey[srcCount].length).assertEqual(arrayDescription.length);
                    for (let i = 0; i < arrayDescription.length; i++) {
                        mediaTestBase.checkDescription(arrayDescription[i], descriptionKey[srcCount][i], descriptionValue[srcCount][i]);
                    }
                    toNextStep(avPlayer, steps, done);
                } else {
                    console.info('case getTrackDescription is null');
                    expect().assertFail();
                    done();
                }
            }, (error) => {
                console.info(TAG + 'getTrackDescription error happened,and message is :' + error.message);
                if (steps[stepCount] == ERROR_EVENT) {
                    stepCount++;
                    toNextStep(avPlayer, steps, done);
                }
            }).catch(mediaTestBase.catchCallback);
        });

        // gettreckdescription callback
        eventEmitter.on(GETDESCRIPTION_CALLBACK, async (avPlayer, steps, done) => {
            stepCount++;
            avPlayer.getTrackDescription((error, arrayList) => {
                if (error == null) {
                    expect(descriptionKey[srcCount].length).assertEqual(arrayList.length);
                    for (let i = 0; i < arrayList.length; i++) {
                        mediaTestBase.checkDescription(arrayList[i], descriptionKey[srcCount][i], descriptionValue[srcCount][i]);
                    }
                    toNextStep(avPlayer, steps, done);
                } else {
                    if (steps[stepCount] == ERROR_EVENT) {
                        stepCount++;
                        console.info(TAG + 'getTrackDescription error happened,and message is :' + error.message);
                        toNextStep(avPlayer, steps, done);
                    }
                }
            })
        });

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_STATE_PREPARED
            * @tc.name      : 001.test prepared stateChange
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_STATE_PREPARED', Level.LEVEL0,async function (done) {
            testTag = 'test_prepared';
            myStepsNameList.push("prepared -> release (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> setDataSource (initialized)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, SETDATASRC_NOSEEK_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> released (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> prepare  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> play  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, PLAY_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> pause  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> stop  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, STOP_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> seek  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> setsurfaceID  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, SETSURFACE_EVENT, surfaceID, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> reset -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, RESET_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> seek(error) -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> seek(error) -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> seek(error) -> seek  (prepared)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, SEEK_EVENT, 8000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> seek(error) -> play  (playing)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> seek(error) -> stop (stopped)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> seek -> prepared (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> seek  (prepared)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> stop  (stopped)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> pause  (paused)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play(loop = 0) -> eos (completed)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, LOOP_EVENT, false, ERROR_EVENT, PLAY_EVENT, FINISH_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> setSource  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, SETDATASRC_NOSEEK_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> prepare  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> surfaceid  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, SETSURFACE_EVENT, surfaceID, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> play -> play  (playing)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PLAY_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> prepare  (prepared)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> setSource  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, SETDATASRC_NOSEEK_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> play  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, PLAY_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> pause  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> seek  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, SEEK_EVENT, 5000, media.SeekMode.SEEK_NEXT_SYNC, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> surfaceid  (error)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, SETSURFACE_EVENT, surfaceID, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> stop -> stop  (stopped)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, STOP_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> url -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SETDATASRC_NOSEEK_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> url -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SETDATASRC_NOSEEK_EVENT, ERROR_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> pause -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> pause -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PAUSE_EVENT, ERROR_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> surfaceid -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SETSURFACE_EVENT, surfaceID, ERROR_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> surfaceid -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, SETSURFACE_EVENT, surfaceID, ERROR_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> prepared -> release  (released)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT));
            myStepsNameList.push("prepared -> prepared -> reset  (idle)");
            myStepsList.push(new Array(CREATE_EVENT, SETDATASRC_NOSEEK_EVENT, SETSURFACE_EVENT, surfaceID, PREPARE_EVENT, PREPARE_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT));

            eventEmitter.on('test_prepared', () => {
                console.info(TAG + '**************************test video or audio name is :' + pathList[srcCount] + '*****************');
                console.info(TAG + '**************************this is state playing test: ' + (testCount + 1) + ' testcase start****************');
                console.info(TAG + '**************************this is state playing test: ' + myStepsNameList[testCount] + ' ****************');
                let avPlayer = null;
                eventEmitter.emit(myStepsList[testCount][stepCount], avPlayer, myStepsList[testCount], done);
                testCount++;
            });
            eventEmitter.emit(testTag);
        })
    })
}
