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
import * as mediaTestBase from './MediaTestBase.js';

export const AV_PLAYER_STATE = {
    IDLE : 'idle',
    INITIALIZED : 'initialized',
    PREPARED : 'prepared',
    PLAYING : 'playing',
    PAUSED : 'paused',
    COMPLETED : 'completed',
    STOPPED : 'stopped',
    RELEASED : 'released',
    ERROR : 'error',
}

let playTest = {
    width: 0,
    height: 0,
    duration: -1
}
export {playTest};

export function setSource(avPlayer, src) {
    if (typeof(avPlayer) == 'undefined') {
        console.error('case avPlayer is undefined');
        return;
    }
    if (typeof(src) == 'string') {
        console.info('case src test');
        avPlayer.url = src;
    } else {
        console.info('case fdsrc test');
        avPlayer.fdSrc = src;
    }
}

function checkPlayTest(avPlayer, playTest) {
    if (avPlayer == null) {
        return;
    }
    expect(Math.abs(avPlayer.duration - playTest.duration)).assertLess(500);
    if (playTest.width > 0) {
        expect(avPlayer.width).assertEqual(playTest.width);
        expect(avPlayer.height).assertEqual(playTest.height);
    }
}

function toPreparePromise(avPlayer, playTest) {
    if (typeof(avPlayer) == 'undefined') {
        return;
    }
    avPlayer.prepare().then(() => {
        console.info('case prepare called');
        console.info('case avPlayer.duration: ' + avPlayer.duration);
        checkPlayTest(avPlayer, playTest);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function preparePromise(avPlayer) {
    if (typeof(avPlayer) == 'undefined') {
        return;
    }
    await avPlayer.prepare().then(() => {
        console.info('case prepare called');
        console.info('case avPlayer.duration: ' + avPlayer.duration);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

function addCnt(countArr) {
    if (countArr != null) {
        countArr[0]++;
    }
}

export function setCallback(avPlayer, type, countArr) {
    if (avPlayer == null) {
        return;
    }
    switch (type) {
        case 'volumeChange':
            avPlayer.on('volumeChange', (volume) => {
                console.info(`case volumeChange called, volume is ${volume}`);
                addCnt(countArr);
            });
            break;
        case 'endOfStream':
            avPlayer.on('endOfStream', () => {
                console.info(`case endOfStream called`);
                addCnt(countArr);
            });
            break;
        case 'speedDone':
            avPlayer.on('speedDone', (speedMode) => {
                console.info(`case speedDone called, speedMode is ${speedMode}`);
                addCnt(countArr);
            });
            break;
        case 'bitrateDone':
            avPlayer.on('bitrateDone', (bitrate) => {   
                console.info(`case bitrateDone called, bitrate is ${bitrate}`);
            });
            break;
        case 'timeUpdate':
            avPlayer.on('timeUpdate', (time) => {
                console.info('case timeUpdate callback, time:' + time);
            });
            break;
        case 'bufferingUpdate':
            avPlayer.on('bufferingUpdate', (infoType, value) => {
            });
            break;
        case  'durationUpdate':
            avPlayer.on('durationUpdate', (duration) => {
                console.info('case durationUpdate called,duration:' + duration);
                addCnt(countArr);
            });
            break;
        case 'startRenderFrame':
            avPlayer.on('startRenderFrame', () => {
                console.info('case startRenderFrame called');
                addCnt(countArr);
            });
            break;
        case 'videoSizeChange':
            avPlayer.on('videoSizeChange', (w, h) => {
                console.info(`case videoSizeChange called, weight is ${w}, height is ${h}`);
                addCnt(countArr);
            });
            break;
        case  'audioInterrupt':
            avPlayer.on('audioInterrupt', (info) => {
                console.info(`case audioInterrupt called, info is ${info}`);
            });
            break;
        case  'availableBitrates':
            avPlayer.on('availableBitrates', (bitrates) => {
                for (let i = 0; i < bitrates.length; i++) { 
                    console.info('case availableBitrates : '  + bitrates[i]);
                }
                addCnt(countArr);
            });
            break;
        default:
            break;
    }
}

export function offCallback(avPlayer, typeArr)
{
    if (avPlayer == null) {
        return;
    }
    for (let i = 0; i < typeArr.length; i++) { 
        switch (typeArr[i]) {
            case 'stateChange':
                avPlayer.off('stateChange');
                break;
            case 'volumeChange':
                avPlayer.off('volumeChange');
                break;
            case 'endOfStream':
                avPlayer.off('endOfStream');
                break;
            case 'seekDone':
                avPlayer.off('seekDone');
                break;
            case 'speedDone':
                avPlayer.off('speedDone');
                break;
            case 'speedDone':
                avPlayer.off('speedDone');
                break;
            case 'timeUpdate':
                avPlayer.off('timeUpdate');
                break;
            case 'durationUpdate':
                avPlayer.off('durationUpdate');
                break;
            case 'bufferingUpdate':
                avPlayer.off('bufferingUpdate');
                break;
            case 'startRenderFrame':
                avPlayer.off('startRenderFrame');
                break;
            case 'videoSizeChange':
                avPlayer.off('videoSizeChange');
                break;
            case 'audioInterrupt':
                avPlayer.off('audioInterrupt');
                break;
            case 'availableBitrates':
                avPlayer.off('availableBitrates');
                break;
            case 'error':
                avPlayer.off('error');
                break;
            default:
                break;
        }
    }
}

export function setAVPlayerFunCb(src, avPlayer, playTest, playTime, done) {
    let volumeCnt = [0];
    let endOfStreamCnt = [0];
    let speedDoneCnt = [0];
    let videoSizeCnt = [0];
    let startRenderFrameCnt = [0];
    let durationUpdateCnt = [0];
    let seekDoneCnt = [0];
    let prepareCnt = 0;
    let playCnt = 0;
    let completedCnt = 0;
    let surfaceID = globalThis.value;
    console.info(`case setAVPlayerFunCb in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        if (reason == media.StateChangeReason.BACKGROUND) {
            console.info(`case media.StateChangeReason.BACKGROUND`);
            await avPlayer.release().then(() => {
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                avPlayer.surfaceId = surfaceID;
                try{
                    avPlayer.audioRendererInfo = {
                        content:audio.AudioRendererInfo.CONTENT_TYPE_MUSIC,
                        usage:audio.AudioRendererInfo.STREAM_USAGE_MEDIA,
                    }
                }catch(e){
                    console.error(`case stateChange error, e is ${e} ,message:${e.message}`);
                }
                // step 1, 13: initialized -> prepared
                toPreparePromise(avPlayer, playTest);
                break;
            case AV_PLAYER_STATE.PREPARED:
                prepareCnt++;
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                checkPlayTest(avPlayer, playTest);
                expect(avPlayer.currentTime).assertEqual(0);
                if (prepareCnt == 1) {
                    // step 2: prepared -> playing
                    avPlayer.play().then(() => {
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                } else {
                    // step 14: prepared -> seek
                    avPlayer.seek(avPlayer.duration);
                }
                break;
            case AV_PLAYER_STATE.PLAYING:
                playCnt++;
                if (playCnt == 1) {
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                    // step 3: playing -> seek duration/3
                    await mediaTestBase.msleepAsync(playTime);
                    avPlayer.seek(avPlayer.duration / 3);
                } else if (playCnt == 2) {
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                    //  step 7: playing -> seek duration when loop true
                    avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
                } else if (playCnt == 3) {
                    // step 10: playing -> stop
                    avPlayer.stop().then(() => {
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                // step 5: pause -> seek 0
                avPlayer.loop = true;
                avPlayer.seek(0, media.SeekMode.SEEK_NEXT_SYNC);
                break;
            case AV_PLAYER_STATE.COMPLETED:
                completedCnt++;
                expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.COMPLETED);
                if (completedCnt == 1 && seekDoneCnt[0] < 5) {
                    // step 9: completed -> play
                    avPlayer.play();
                } else {
                    // step 16: completed -> reset
                    avPlayer.reset().then(() => {
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                        // step 17: reset -> release
                        avPlayer.release().then(() => {
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
                break;
            case AV_PLAYER_STATE.STOPPED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.STOPPED);
                // step 11: stop -> reset
                avPlayer.reset().then(() => {
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                    // step 12: reset -> initialized
                    setSource(avPlayer, src);
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            case AV_PLAYER_STATE.RELEASED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                // step 18: release -> done
                avPlayer = null;
                expect(volumeCnt[0]).assertLarger(0);
                expect(endOfStreamCnt[0]).assertLarger(0);
                expect(seekDoneCnt[0]).assertLarger(0);
                expect(speedDoneCnt[0]).assertLarger(0);
                expect(completedCnt).assertLarger(0);
                if (playTest.width != 0) {
                    expect(startRenderFrameCnt[0]).assertLarger(0);
                    expect(videoSizeCnt[0]).assertLarger(0);
                } else {
                    expect(startRenderFrameCnt[0]).assertEqual(0);
                    expect(videoSizeCnt[0]).assertEqual(0);
                }
                expect(durationUpdateCnt[0]).assertLarger(0)
                done();
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break; 
        }
    });
    avPlayer.on('seekDone', async (seekDoneTime) => {
        seekDoneCnt[0]++;
        console.info(`case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
        switch (seekDoneCnt[0]) {
            case 2:
                // step 6: seek(paused) -> play
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                avPlayer.play();
                avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
                avPlayer.setVolume(0.5);
                break;
            case 1:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                // step 4: seek(playing) -> pause
                avPlayer.pause().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            case 3:
            case 4:
            case 5:
                let nowTime = avPlayer.currentTime;
                if (avPlayer.state == AV_PLAYER_STATE.PREPARED) {
                    // step 15: prepared -> play
                    avPlayer.play();
                }
                if (nowTime > avPlayer.duration / 2) {
                    avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
                    await mediaTestBase.msleepAsync(avPlayer.duration - nowTime + playTime);
                }
                if (avPlayer.loop == true) {
                    // step 8: playing -> seek duration when loop false
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                    avPlayer.loop = false;
                    avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
                }
                break;
        }
    });
    setCallback(avPlayer, 'volumeChange', volumeCnt);
    setCallback(avPlayer, 'endOfStream', endOfStreamCnt);
    setCallback(avPlayer, 'speedDone', speedDoneCnt);
    setCallback(avPlayer, 'bitrateDone', null);
    setCallback(avPlayer, 'timeUpdate', null);
    setCallback(avPlayer, 'bufferingUpdate', null);
    setCallback(avPlayer, 'durationUpdate', durationUpdateCnt);
    setCallback(avPlayer, 'startRenderFrame', startRenderFrameCnt);
    setCallback(avPlayer, 'videoSizeChange', videoSizeCnt);
    setCallback(avPlayer, 'audioInterrupt', null);
    setCallback(avPlayer, 'availableBitrates', null);
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function setAVPlayerPlayAndPauseWithCallBack(src, avPlayer, playTime, done) {
    let playPauseCount = 0;
    let surfaceID = globalThis.value;
    console.info(`case setAVPlayerPlayAndPauseWithCallBack in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('playPauseLoopWithCallBack play state is INITIALIZED')
                preparePromise(avPlayer);
                break;
            case AV_PLAYER_STATE.PREPARED:
            // step 1: initialized -> prepared -> play
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('playPauseLoopWithCallBack play state is PREPARED')
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                avPlayer.loop = true;
                console.info('playPauseLoopWithCallBack play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                playPauseCount++;
                mediaTestBase.msleepAsync(playTime);
                if(playPauseCount == 1001){
                    // step 4: playing -> stop -> release
                    avPlayer.stop().then(() => {
                        console.info('playPauseLoopWithCallBack avPlayer from play to stop')
                        avPlayer.release().then(() => {
                            console.info('playPauseLoopWithCallBack avPlayer from stop to release')
                            done();
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    // step 2: playing -> pause loop
                    avPlayer.pause().then(() => {
                        console.info('playPauseLoopWithCallBack avPlayer from play to pause,time is :' + playPauseCount)
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                console.info('playPauseLoopWithCallBack play state is PAUSED')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
            // step 3: pause -> playing loop
                avPlayer.play().then(() => {
                    console.info('playPauseLoopWithCallBack avPlayer from pause to play,time is :' + playPauseCount)
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

async function idle(src, avPlayer) {
    console.info(`case media source: ${src}`)
    await media.createAVPlayer().then((video) => {
        if (typeof(video) != 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
        } else {
            console.error('case createAVPlayer failed');
            expect().assertFail();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    return avPlayer;
}

export async function avPlayerWithCallBack(src, avPlayer, playTime, done) {
    avPlayer = await idle(src, avPlayer)
    await setAVPlayerPlayAndPauseWithCallBack(src, avPlayer, playTime, done);
    await setSource(avPlayer, src);
}

let createToReleaseLoopCount = 0;
async function createToReleaseLoop(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    console.info(`case createToReleaseLoop in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.IDLE:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                setSource(avPlayer, src);
                break;
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('createToReleaseLoop play state is INITIALIZED')
            // step 1: initialized -> prepared -> play
                avPlayer.release()
                break;
            case AV_PLAYER_STATE.RELEASED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                createToReleaseLoopCount++
                if(createToReleaseLoopCount==1001){
                    done();
                }else{
                    avPlayer = await idle(src, avPlayer)
                    await createToReleaseLoop(src, avPlayer, done)
                    await setSource(avPlayer, src);
                }
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function createToRelease(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    avPlayer = await idle(src, avPlayer)
    await createToReleaseLoop(src, avPlayer, done)
    await setSource(avPlayer, src);
    console.info('CreateToRelease setSource');
}

export async function playToCompleted(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await playToCompletedLoop(src, avPlayer, done);
    await setSource(avPlayer, src);
}

async function playToCompletedLoop(src, avPlayer, done) {
    let playToCompletedCount = 0;
    let surfaceID = globalThis.value;
    console.info(`case playToCompletedLoop in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('playToCompletedLoop play state is INITIALIZED')
            // step 1: initialized -> prepared -> play
                await preparePromise(avPlayer);
                await sleep(2000);
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                avPlayer.loop = false;
                console.info('playToCompletedLoop play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                playToCompletedCount++;
                if(playToCompletedCount == 1001){
                    // step 4: playing -> stop -> release
                    avPlayer.stop().then(() => {
                        console.info('playToCompletedLoop avPlayer from play to stop')
                        avPlayer.release().then(() => {
                            console.info('playToCompletedLoop avPlayer from stop to release')
                            done();
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    // step 2: playing -> seek loop
                    avPlayer.seek(10034, media.SeekMode.SEEK_NEXT_SYNC)
                    console.info('playToCompletedLoop avPlayer from play to seek,time is :' + playToCompletedCount)
                }
                break;
            case AV_PLAYER_STATE.COMPLETED:
                expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.COMPLETED);
                console.info('playToCompletedLoop avPlayer from COMPLETED to play')
            // step 3: COMPLETED -> play loop
                avPlayer.play();
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function seekLoop(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    avPlayer = await idle(src, avPlayer)
    await setSource(avPlayer, src);
    console.info('seekLoop setSource');
    await sleep(20);
    if(avPlayer.state == AV_PLAYER_STATE.INITIALIZED) {
        avPlayer.surfaceId = surfaceID;
        console.info('seekLoop case prepare success');
        await preparePromise(avPlayer);
        await sleep(2000);
    }
    await avPlayer.play().then(() => {
        console.info('seekLoop play success');
        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
    }, (err) => {
        console.error('seekLoop play filed,error message is :' + err.message)
    })
    await seekLoopWithCallback(avPlayer)
    console.info('seekLoop avPlayer from play to seek')
    // play seek loop 1000 times
    await avPlayer.stop().then(() => {
        console.info('seekLoopWithCallback avPlayer from play to stop')
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await avPlayer.release().then(() => {
        console.info('seekLoopWithCallback avPlayer from stop to release')
        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        done();
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function seekLoopWithCallback(avPlayer) {
    for (let loopTime = 0; loopTime < 5000; loopTime += 5) {
        await new Promise(resolve => {
            avPlayer.on('seekDone', seekDoneTime => {
                console.info(`case seekDone called seekDoneTime is ${seekDoneTime}`);
                resolve();
            });
            avPlayer.seek(loopTime);
            console.info(`case seekLoopWithCallback loopTime is ${loopTime}`);
        });
    }
}

async function seekLoopWithoutCallbackLoop(src, avPlayer, done) {
    let seekLoopWithoutCallbackLoop = 0;
    let surfaceID = globalThis.value;
    console.info(`case seekLoopWithoutCallbackLoop in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('seekLoopWithoutCallbackLoop play state is INITIALIZED')
            // step 1: prepare
                preparePromise(avPlayer);
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            // step 2: sop
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('seekLoopWithoutCallbackLoop play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
            // step 5: PLAYING-IDLE
                for(var loopTime = 0;loopTime < 1000; loopTime++){
                    avPlayer.seek(loopTime)
                    console.info(`case seekLoopWithoutCallbackLoop loopTime is ${loopTime}`);
                    if(loopTime==999){
                        avPlayer.stop().then(() => {
                            console.info('seekLoopWithoutCallbackLoop avPlayer from play to stop')
                            avPlayer.release().then(() => {
                                console.info('seekLoopWithoutCallbackLoop avPlayer from stop to release')
                                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                                done();
                            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    }
                }
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function seekLoopWithoutCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await seekLoopWithoutCallbackLoop(src, avPlayer, done)
    await setSource(avPlayer, src);
    console.info('seekLoopWithoutCallback setSource');
}

async function prepareToStopLoop(src, avPlayer, done) {
    let prepareToStopLoopCount = 0;
    let surfaceID = globalThis.value;
    console.info(`case prepareToStopLoop in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('prepareToStopLoop play state is INITIALIZED')
            // step 1: prepare
                preparePromise(avPlayer);
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            // step 2: sop
                avPlayer.stop()
                break;
            case AV_PLAYER_STATE.STOPPED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.STOPPED);
                prepareToStopLoopCount++
                if(prepareToStopLoopCount==1001){
            // end: release
                    avPlayer.release().then(() => {
                        console.info('prepareToStopLoop avPlayer from stop to release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else {
                    preparePromise(avPlayer);
                }
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function prepareToStop(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await prepareToStopLoop(src, avPlayer, done)
    setSource(avPlayer, src);
    console.info('prepareToStopLoop setSource');
}

async function prepareToResetLoop(src, avPlayer, done) {
    let prepareToResetLoopCount = 0;
    let surfaceID = globalThis.value;
    console.info(`case prepareToResetLoop in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            // step 1: create-Idle
            case AV_PLAYER_STATE.IDLE:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                prepareToResetLoopCount++;
                if(prepareToResetLoopCount == 1001){
                    // end: release
                    avPlayer.release().then(() => {
                        console.info('prepareToResetLoop avPlayer from stop to release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
            // step 2: idle-INITIALIZED
                    setSource(avPlayer, src);
                    console.info('prepareToResetLoop avPlayer from play to seek,time is :' + prepareToResetLoopCount)
                }
                break;
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('prepareToResetLoop play state is INITIALIZED')
            // step 3: INITIALIZED-PREPARED
                preparePromise(avPlayer);
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            // step 4: PREPARED-PLAYING
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('prepareToResetLoop play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
            // step 5: PLAYING-IDLE
                avPlayer.reset()
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function prepareToReset(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    // url -> prepare -> play -> reset loop 1000 times
    await prepareToResetLoop(src, avPlayer, done)
    await setSource(avPlayer, src);
}

let createToReleaseLoopCount2 = 0;
async function createToReleaseLoop2(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    console.info(`case createToReleaseLoop2 in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.IDLE:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                setSource(avPlayer, src);
                break;
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('createToReleaseLoop2 play state is INITIALIZED')
                preparePromise(avPlayer);
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            // step 4: PREPARED-PLAYING
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('createToReleaseLoop2 play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                avPlayer.release()
                break;
            case AV_PLAYER_STATE.RELEASED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                createToReleaseLoopCount2++
                if(createToReleaseLoopCount2==1001){
                    done();
                }else{
                    avPlayer = await idle(src, avPlayer)
                    await createToReleaseLoop2(src, avPlayer, done)
                    await setSource(avPlayer, src);
                }
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function createToRelease2(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await createToReleaseLoop2(src, avPlayer, done)
    await setSource(avPlayer, src);
    console.info('createToRelease2 setSource');
}

let createLoopTime = 0;
let createTotalTime = 0;
let createStart;
export async function createTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    createStart = Date.now();
    console.info(`createTimeWithCallback createStart time is : ${createStart}`)
    createTimeCallback(src, avPlayer, done)
}

function createTimeCallback(src, avPlayer, done){
    let end;
    let execution;
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`createTimeCallback stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`createTimeCallback state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.IDLE:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                end = Date.now();
                console.info(`createTimeCallback end time is : ${end}`)
                execution = parseInt(end - createStart)
                createTotalTime = createTotalTime + execution;
                console.info("createTimeCallback execution time  is :" + execution)
                createLoopTime++;
                avPlayer.release()
            case AV_PLAYER_STATE.RELEASED:
                console.info('createTimeCallback play state is release')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                if(createLoopTime == 10){
                    let avg = createTotalTime/10;
                    console.info("createTimeCallback avg time  is :" + avg)
                    createLoopTime = 0;
                    createTotalTime = 0;
                    done();
                }else{
                    avPlayer = null;
                    createTimeWithCallback(src, avPlayer, done)
                }
                break;
            default:
                break;
        }
    });
}

export async function createTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    for(var i = 0;i < 10;i++){
        let start = Date.now();
        console.info(`createTimeWithoutCallback start time is : ${start}`)
        avPlayer = await idle(src, avPlayer)
        let end = Date.now()
        let execution = parseInt(end - start)
        console.info("createTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('createTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("createTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function prepareTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('prepareTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        let start = Date.now();
        console.info(`prepareTimeWithoutCallback start time is : ${start}`)
        let end;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('prepareTimeWithoutCallback avPlayer state is prepared')
            end = Date.now()
            console.info(`prepareTimeWithoutCallback end time is : ${end}`)
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let execution = parseInt(end - start)
        console.info("prepareTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('prepareTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("prepareTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function prepareTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await prepareTimeCallback(src, avPlayer, done)
    await setSource(avPlayer, src);
}

async function prepareTimeCallback(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.IDLE:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('prepareTimeWithCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("prepareTimeWithCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    setSource(avPlayer, src)
                }
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('prepareTimeWithCallback play state is INITIALIZED')
            // step 1: initialized -> prepared
                start = Date.now();
                console.info(`prepareTimeWithCallback start time is : ${start}`)
                avPlayer.prepare()
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('prepareTimeWithCallback avPlayer state is prepared')
                end = Date.now();
                console.info(`prepareTimeWithCallback end time is : ${end}`)
                execution = parseInt(end - start)
                console.info("prepareTimeWithCallback execution time  is :" + execution)
                totalTime = totalTime + execution;
                loopTime++;
                avPlayer.reset()
                break;
            default:
                break;
        }
    });
}

export async function playTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('playTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('playTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let start = Date.now();
        let end;
        console.info(`playTimeWithoutCallback start time is : ${start}`)
        await avPlayer.play().then(() => {
            end = Date.now();
            console.info(`playTimeWithoutCallback end time is : ${end}`)
            console.info('playTimeWithoutCallback play success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
        }, (err) => {
            console.error('playTimeWithoutCallback play filed,error message is :' + err.message)
        })
        let execution = parseInt(end - start)
        console.info("playTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('playTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
            avPlayer = null;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("playTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function playTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await playTimeCallback(avPlayer, done)
    await setSource(avPlayer, src);
}

export function playTimeCallback(avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('playTimeCallback play state is INITIALIZED')
            // step 1: initialized -> prepared
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('playTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('playTimeCallback avPlayer state is prepared')
                start = Date.now();
                console.info(`playTimeCallback start time is : ${start}`)
            // step 2: prapared -> play
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('playTimeCallback play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                end = Date.now();
                console.info(`playTimeCallback end time is : ${end}`)
                execution = parseInt(end - start)
                console.info("playTimeCallback execution time  is :" + execution)
                totalTime = totalTime + execution;
                loopTime++;
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('playTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("playTimeWithCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
            // step 3: playing -> pause loop
                    setTimeout( () => {
                        avPlayer.pause()
                    }, 200);
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                console.info('playTimeWithCallback play state is PAUSED')
                expect(avPlayer.state).assertEqual('paused');
                start = Date.now();
                console.info(`playTimeCallback start time is : ${start}`)
                avPlayer.play()
                break;
            default:
                break;
        }
    });
}

export async function pauseTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        let execution;
        let end;
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('pauseTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('pauseTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await avPlayer.play().then(() => {
            console.info('pauseTimeWithoutCallback play success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
        }, (err) => {
            console.error('pauseTimeWithoutCallback play filed,error message is :' + err.message)
        })
        let start = Date.now();

        console.info(`pauseTimeWithoutCallback start time is : ${start}`)
        await avPlayer.pause().then(() => {
            console.info('pauseTimeWithoutCallback pause success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
            end = Date.now();
            console.info(`pauseTimeWithoutCallback end time is : ${end}`)
            execution = parseInt(end - start)
            console.info("pauseTimeWithoutCallback execution time  is :" + execution)
        }, (err) => {
            console.error('pauseTimeWithoutCallback pause filed,error message is :' + err.message)
        })
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('pauseTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("pauseTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function pauseTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await pauseTimeCallback(avPlayer, done)
    await setSource(avPlayer, src);
}

function pauseTimeCallback(avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('pauseTimeCallback play state is INITIALIZED')
            // step 1: initialized -> prepared
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('pauseTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('pauseTimeCallback avPlayer state is prepared')
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('pauseTimeCallback play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                setTimeout( () => {
                    start = Date.now();
                    console.info(`pauseTimeCallback start time is : ${start}`)
                    avPlayer.pause()
                }, 200);
                break;
            case AV_PLAYER_STATE.PAUSED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                end = Date.now();
                console.info(`pauseTimeCallback end time is : ${end}`)
                execution = parseInt(end - start)
                console.info("pauseTimeCallback execution time  is :" + execution)
                totalTime = totalTime + execution;
                loopTime++;
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('pauseTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("pauseTimeCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    avPlayer.play()
                }
                break;
            default:
                break;
        }
    });
}

export async function stopTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('stopTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('stopTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await avPlayer.play().then(() => {
            console.info('stopTimeWithoutCallback play success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
        }, (err) => {
            console.error('stopTimeWithoutCallback play filed,error message is :' + err.message)
        })
        let start = Date.now();
        console.info(`stopTimeWithoutCallback start time is : ${start}`)
        let end;
        await avPlayer.stop().then(() => {
            end = Date.now();
            console.info(`stopTimeWithoutCallback end time is : ${end}`)
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.STOPPED);
            console.info('stopTimeWithoutCallback avPlayer state is stop')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let execution = parseInt(end - start)
        console.info("stopTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('stopTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("stopTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function stopTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await stopTimeCallback(src, avPlayer, done)
    await setSource(avPlayer, src);
}

function stopTimeCallback(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.IDLE:
                setSource(avPlayer, src);
                break;
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('stopTimeCallback play state is INITIALIZED')
            // step 1: initialized -> prepared
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('stopTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('stopTimeCallback avPlayer state is prepared')
                start = Date.now();
                console.info(`stopTimeCallback start time is : ${start}`)
                loopTime++;
                avPlayer.stop()
                break;
            case AV_PLAYER_STATE.STOPPED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.STOPPED);
                end = Date.now();
                console.info(`stopTimeCallback end time is : ${end}`)
                execution = parseInt(end - start)
                console.info("stopTimeCallback execution time  is :" + execution)
                totalTime = totalTime + execution;
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('stopTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("stopTimeCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    avPlayer.reset()
                }
                break;
            default:
                break;
        }
    });
}

export async function resetTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('resetTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('resetTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let end;
        await avPlayer.play().then(() => {
            console.info('resetTimeWithoutCallback play success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
        }, (err) => {
            console.error('resetTimeWithoutCallback play filed,error message is :' + err.message)
        })
        let start = Date.now();
        console.info(`resetTimeWithoutCallback start time is : ${start}`)
        await avPlayer.reset().then(() => {
            end = Date.now();
            console.info(`resetTimeWithoutCallback end time is : ${end}`)
            console.info('reset success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
        }, (err) => {
            console.error('reset filed,error message is :' + err.message)
        })
        let execution = parseInt(end - start)
        console.info("resetTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('resetTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("resetTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function resetTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await resetTimeCallback(src, avPlayer, done)
    await setSource(avPlayer, src);
}

function resetTimeCallback(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.IDLE:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                end = Date.now();
                console.info(`resetTimeCallback end time is : ${end}`)
                execution = parseInt(end - start)
                console.info("resetTimeCallback execution time  is :" + execution)
                totalTime = totalTime + execution;
                loopTime++;
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('resetTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("resetTimeCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    setSource(avPlayer, src)
                }
                break;
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('resetTimeCallback play state is INITIALIZED')
                start = Date.now();
                console.info(`resetTimeCallback start time is : ${start}`)
                avPlayer.reset().then(() => {
                    console.info('reset success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
}

export async function releaseTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('releaseTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        let start = Date.now();
        console.info(`releaseTimeWithoutCallback start time is : ${start}`)
        let end;
        await avPlayer.release().then(() => {
            console.info('releaseTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        end = Date.now();
        console.info(`releaseTimeWithoutCallback end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("releaseTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
    }
    let avg = totalTime/10;
    console.info("releaseTimeWithoutCallback avg time  is :" + avg)
    done();
}

let releaseTotalTime = 0;
let releaseLoop = 0;
export async function releaseTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await releaseTimeCallback(src, avPlayer, done)
    await setSource(avPlayer, src);
}

function releaseTimeCallback(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('releaseTimeCallback play state is INITIALIZED')
                start = Date.now();
                console.info(`releaseTimeCallback start time is : ${start}`)
                avPlayer.release()
                break;
            case AV_PLAYER_STATE.RELEASED:
                console.info('releaseTimeCallback play state is release')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                end = Date.now();
                console.info(`releaseTimeCallback end time is : ${end}`)
                execution = parseInt(end - start)
                console.info("releaseTimeCallback execution time  is :" + execution)
                releaseTotalTime = releaseTotalTime + execution;
                releaseLoop++;
                if(releaseLoop == 10){
                    let avg = releaseTotalTime/10;
                    console.info("releaseTimeCallback avg time  is :" + avg)
                    releaseTotalTime = 0;
                    releaseLoop = 0;
                    done();
                }else{
                    avPlayer = null;
                    releaseTimeWithCallback(src, avPlayer, done)
                }
                break;
            default:
                break;
        }
    });
}

export function getTotalTime(releaseTotalTime){
    return releaseTotalTime;
}

export async function seekTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('seekTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('seekTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let end;
        await avPlayer.play().then(() => {
            console.info('seekTimeWithoutCallback play success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
        }, (err) => {
            console.error('seekTimeWithoutCallback play filed,error message is :' + err.message)
        })
        let start = Date.now();
        console.info(`seekTimeWithoutCallback start time is : ${start}`)
        await avPlayer.seek(100)
        end = Date.now();
        console.info(`seekTimeWithoutCallback end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("seekTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('seekTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("seekTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function seekTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await seekTimeCallback(avPlayer, done)
    await setSource(avPlayer, src);
}

function seekTimeCallback(avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('seekTimeCallback play state is INITIALIZED')
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('seekTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('seekTimeCallback avPlayer state is prepared')
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('seekTimeCallback play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                start = Date.now();
                console.info(`seekTimeCallback start time is : ${start}`)
                loopTime+=20;
                if(loopTime == 220){
                    avPlayer.release().then(() => {
                        console.info('seekTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("seekTimeCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    avPlayer.seek(loopTime)
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                console.info('seekTimeCallback play state is PAUSED')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                avPlayer.play().then(() => {
                    console.info('seekTimeCallback avPlayer from pause to play')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('seekDone', async (seekDoneTime) => {
        end = Date.now();
        console.info(`seekTimeCallback end time is : ${end}`)
        execution = parseInt(end - start)
        console.info("seekTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        console.info(`case seekDone called seekDoneTime is ${seekDoneTime}`);
        avPlayer.pause()
    });
}

export async function getTrackDescriptionTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('getTrackDescriptionTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('getTrackDescriptionTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await avPlayer.play().then(() => {
            console.info('getTrackDescriptionTimeWithoutCallback play success');
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
        }, (err) => {
            console.error('getTrackDescriptionTimeWithoutCallback play filed,error message is :' + err.message)
        })
        let arrayDescription;
        let start = Date.now();
        console.info(`getTrackDescriptionTimeWithoutCallback start time is : ${start}`)
        let end;
        await avPlayer.getTrackDescription().then((arrList) => {
            if (arrList != null) {
                arrayDescription = arrList;
            } else {
                console.log('video getTrackDescription fail');
            }
        }).catch((error) => {
            console.info(`video catchCallback, error:${error}`);
        });
        end = Date.now();
        console.info(`getTrackDescriptionTimeWithoutCallback end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("getTrackDescriptionTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('getTrackDescriptionTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("getTrackDescriptionTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function getTrackDescriptionTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await getTrackDescriptionTimeCallback(avPlayer, done)
    await setSource(avPlayer, src);
}

function getTrackDescriptionTimeCallback(avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    let arrayDescription;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('getTrackDescriptionTimeCallback play state is INITIALIZED')
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('getTrackDescriptionTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('getTrackDescriptionTimeCallback avPlayer state is prepared')
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('getTrackDescriptionTimeCallback play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                start = Date.now();
                console.info(`getTrackDescriptionTimeCallback start time is : ${start}`)
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('getTrackDescriptionTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        avPlayer = null;
                        let avg = totalTime/10;
                        console.info("getTrackDescriptionTimeCallback avg time is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    loopTime++;
                    avPlayer.getTrackDescription().then((arrList) => {
                        if (arrList != null) {
                            arrayDescription = arrList;
                            end = Date.now();
                            console.info(`getTrackDescriptionTimeCallback end time is : ${end}`)
                            execution = parseInt(end - start)
                            console.info("getTrackDescriptionTimeCallback execution time  is :" + execution)
                            totalTime = totalTime + execution;

                        } else {
                            console.log('video getTrackDescription fail');
                        }
                    }).catch((error) => {
                        console.info(`video catchCallback, error:${error}`);
                    });
                    setTimeout( () => {
                        avPlayer.pause()
                    }, 200);
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                console.info('getTrackDescriptionTimeCallback play state is PAUSED')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                avPlayer.play().then(() => {
                    console.info('getTrackDescriptionTimeCallback avPlayer from pause to play')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
}

export async function setSpeedTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('setSpeedTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('setSpeedTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let start = Date.now();
        console.info(`setSpeedTimeWithoutCallback start time is : ${start}`)
        await avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
        let end = Date.now();
        console.info(`setSpeedTimeWithoutCallback end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("setSpeedTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('setSpeedTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("setSpeedTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function setSpeedTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await setSpeedTimeCallback(avPlayer, done)
    await setSource(avPlayer, src);
}

function setSpeedTimeCallback(avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('setSpeedTimeCallback play state is INITIALIZED')
            // step 1: initialized -> prepared
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('setSpeedTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('setSpeedTimeCallback avPlayer state is prepared')
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('setSpeedTimeCallback play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('setSpeedTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        let avg = totalTime/10;
                        console.info("setSpeedTimeCallback avg time  is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    start = Date.now();
                    console.info(`setSpeedTimeCallback start time is : ${start}`)
                    loopTime++
                    avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                console.info('setSpeedTimeCallback play state is PAUSED')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                avPlayer.play().then(() => {
                    console.info('setSpeedTimeCallback avPlayer from pause to play')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('speedDone', async (speed) => {
        end = Date.now();
        console.info(`setSpeedTimeCallback end time is : ${end}`)
        execution = parseInt(end - start)
        console.info("setSpeedTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        console.info('speedDone success,and speed value is:' + speed)
        avPlayer.pause()
    });
}

export async function setBitrateTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('setBitrateTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('setBitrateTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let start = Date.now();
        console.info(`setBitrateTimeWithoutCallback start time is : ${start}`)
        let bitrate = 96000
        await avPlayer.setBitrate(bitrate)
        let end = Date.now();
        console.info(`setBitrateTimeWithoutCallback end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("setBitrateTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('setBitrateTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("setBitrateTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function setVolumeTimeWithoutCallback(src, avPlayer, done) {
    let totalTime = 0;
    let surfaceID = globalThis.value;
    for(var i = 0;i < 10;i++){
        avPlayer = await idle(src, avPlayer)
        await setSource(avPlayer, src);
        console.info('setVolumeTimeWithoutCallback setSource');
        await sleep(20)
        avPlayer.surfaceId = surfaceID;
        await avPlayer.prepare().then(() => {
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
            console.info('setVolumeTimeWithoutCallback avPlayer state is prepared')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let start = Date.now();
        console.info(`setVolumeTimeWithoutCallback start time is : ${start}`)
        let volume = 1.0
        avPlayer.setVolume(volume)
        let end = Date.now();
        console.info(`setVolumeTimeWithoutCallback end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("setVolumeTimeWithoutCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        await avPlayer.release().then(() => {
            console.info('setVolumeTimeWithoutCallback avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    let avg = totalTime/10;
    console.info("setVolumeTimeWithoutCallback avg time  is :" + avg)
    done();
}

export async function setVolumeTimeWithCallback(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await setVolumeTimeCallback(avPlayer, done)
    await setSource(avPlayer, src);
}

function setVolumeTimeCallback(avPlayer, done) {
    let surfaceID = globalThis.value;
    let start;
    let end;
    let execution;
    let loopTime = 0;
    let totalTime = 0;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('setVolumeTimeCallback play state is INITIALIZED')
            // step 1: initialized -> prepared
                avPlayer.prepare((err) => {
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info('setVolumeTimeCallback play state is prepared')
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                console.info('setVolumeTimeCallback avPlayer state is prepared')
                avPlayer.play()
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('setVolumeTimeCallback play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                if(loopTime == 10){
                    avPlayer.release().then(() => {
                        console.info('setVolumeTimeCallback avPlayer is release')
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                        let avg = totalTime/10;
                        console.info("setVolumeTimeCallback avg time  is :" + avg)
                        done();
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }else{
                    start = Date.now();
                    console.info(`setVolumeTimeCallback start time is : ${start}`)
                    loopTime++
                    let volume = 1.0
                    avPlayer.setVolume(volume)
                }
                break;
            case AV_PLAYER_STATE.PAUSED:
                console.info('setVolumeTimeCallback play state is PAUSED')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
                avPlayer.play().then(() => {
                    console.info('setVolumeTimeCallback avPlayer from pause to play')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('volumeChange', (vol) => {
        end = Date.now();
        console.info(`setVolumeTimeCallback end time is : ${end}`)
        execution = parseInt(end - start)
        console.info("setVolumeTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        console.info('volumeChange success,and new volume is :' + vol)
        avPlayer.pause()
    });
}

export async function firstFrameTime(src, avPlayer,  done) {
    let surfaceID = globalThis.value;
    let start;
    avPlayer = await idle(src, avPlayer)
    await setSource(avPlayer, src);
    console.info('firstFrameTime setSource');
    await sleep(20)
    avPlayer.surfaceId = surfaceID;
    await avPlayer.prepare().then(() => {
        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
        console.info('firstFrameTime avPlayer state is prepared')
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await avPlayer.on('startRenderFrame', () => {
        console.info('startRenderFrame success')
        let end = Date.now();
        console.info(`firstFrameTime end time is : ${end}`)
        let execution = parseInt(end - start)
        console.info("firstFrameTime execution time  is :" + execution)
        sleep(100)
        avPlayer.release().then(() => {
            console.info('firstFrameTime avPlayer is release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
            avPlayer = null;
            done();
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    })
    start = Date.now();
    console.info(`firstFrameTime start time is : ${start}`)
    await avPlayer.play().then(() => {
        console.info('firstFrameTime play success');
    }, (err) => {
        console.error('firstFrameTime play filed,error message is :' + err.message)
    })
}

async function playToPauseLoop(avPlayer){
    await avPlayer.play().then(() => {
        console.info('playToPauseLoop play success');
        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
    }, (err) => {
        console.error('playToPauseLoop play filed,error message is :' + err.message)
    })
    if(avPlayer.state == AV_PLAYER_STATE.PLAYING){
        avPlayer.loop = true;
        await mediaTestBase.msleepAsync(2);
        console.info('playToPauseLoop avPlayer from play to pause')
    }
    await avPlayer.pause().then(() => {
        console.info('playToPauseLoop pause success');
        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PAUSED);
    }, (err) => {
        console.error('playToPauseLoop pause filed,error message is :' + err.message)
    })
}

export async function avPlayerWithoutCallBack(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    console.info(`case avPlayerWithoutCallBack Initialized in, surfaceID is ${surfaceID}`);
    avPlayer = await idle(src, avPlayer)
    setSource(avPlayer, src);
    console.info('avPlayerWithoutCallBack setSource');
    await sleep(20);
    if(avPlayer.state == AV_PLAYER_STATE.INITIALIZED) {
        avPlayer.surfaceId = surfaceID;
        await preparePromise(avPlayer);
        await sleep(2000);
    }
    if(avPlayer.state == AV_PLAYER_STATE.PREPARED){
        console.info('avPlayerWithoutCallBack avPlayer from PREPARED to play')
        // play to pause loop 1000 times
        for(var i = 0;i < 1000; i++){
            await playToPauseLoop(avPlayer)
            console.info(`case avPlayerWithoutCallBack playToPauseLoop is ${i}`);
        }
    }
    await avPlayer.stop().then(() => {
        console.info('avPlayerWithoutCallBack avPlayer from play to stop')
        avPlayer.release().then(() => {
            console.info('avPlayerWithoutCallBack avPlayer from stop to release')
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
            done();
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

function setAVPlayerPlay(src, avPlayer, done) {
    let surfaceID = globalThis.value;
    console.info(`case setAVPlayerPlay in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        console.info(`case state is ${state}`);
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                avPlayer.surfaceId = surfaceID;
                console.info('setAVPlayerPlay play state is INITIALIZED')
            // step 1: initialized -> prepared -> play
                avPlayer.prepare().then(() => {
                    avPlayer.play()
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            case AV_PLAYER_STATE.PLAYING:
                console.info('setAVPlayerPlay play state is PLAYING')
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                if(avPlayer.duration > 3000){
                    mediaTestBase.msleepAsync(3000);
                    avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC)
                }else{
                    mediaTestBase.msleepAsync(500);
                    avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC)
                }
                break;
            case AV_PLAYER_STATE.COMPLETED:
                expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
                expect(avPlayer.state).assertEqual('completed');
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            case AV_PLAYER_STATE.RELEASED:
                expect(avPlayer.state).assertEqual('released');
                avPlayer = null;
                done();
                break;
            case AV_PLAYER_STATE.ERROR:
                console.info(`case error called, AV_PLAYER_STATE.ERROR, ignore`);
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break;
        }
    });
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        if (error.code == media.AVErrorCode9.AVERR_UNSUPPORT_FORMAT){
            console.info(`case error called, AVERR_UNSUPPORT_FORMAT, ignore`);
        } else {
            expect().assertFail();
        }
        await avPlayer.release().then(() => {
            avPlayer = null;
            done();
        });
    });
}

export async function avPlayerPlay(src, avPlayer, done) {
    avPlayer = await idle(src, avPlayer)
    await setAVPlayerPlay(src, avPlayer, done);
    await setSource(avPlayer, src);
}

export async function testAVPlayerFun(src, avPlayer, playTest, playTime, done) {
    console.info(`case media source: ${src}`)    
    await media.createAVPlayer().then((video) => {
        if (typeof(video) != 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
            expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
        } else {
            console.error('case createAVPlayer failed');
            expect().assertFail();
            done();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    setAVPlayerFunCb(src, avPlayer, playTest, playTime, done);
    setSource(avPlayer, src);
}

export function setAVPlayerSeekCb(src, avPlayer, playTest, playTime, done) {
    let volumeCnt = [0];
    let endOfStreamCnt = 0;
    let seekDoneCnt = 0;
    let speedDoneCnt = [0];
    let playCnt = 0;
    let surfaceID = globalThis.value;
    console.info(`case setCallback in, surfaceID is ${surfaceID}`);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        if (reason == media.StateChangeReason.BACKGROUND) {
            avPlayer.release().then(() => {
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        switch (state) {
            case AV_PLAYER_STATE.INITIALIZED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                avPlayer.surfaceId = surfaceID;
                console.info('case initialized -> prepared');
                // step 1,10: initialized -> prepared
                avPlayer.prepare((err) => {
                    avPlayer.loop = true;
                    if (err != null) {
                        console.error(`case prepare error, errMessage is ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        checkPlayTest(avPlayer, playTest);
                    }
                });
                break;
            case AV_PLAYER_STATE.PREPARED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                checkPlayTest(avPlayer, playTest);
                expect(avPlayer.currentTime).assertEqual(0);
                offCallback(avPlayer, ['volumeChange']);
                // step 2,11: prepared -> seek 0
                avPlayer.seek(0, 2);  // 2: CLOSEST SYNC
                break;
            case AV_PLAYER_STATE.PLAYING:
                playCnt++;
                if (playCnt == 1) {
                    // step 4: seek + pause
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                    avPlayer.seek(avPlayer.duration / 2, media.SeekMode.SEEK_PREV_SYNC);
                    avPlayer.pause((err) => {
                        if (err != null) {
                            mediaTestBase.assertErr('pause', err, done);
                        }
                    });
                } else if (playCnt == 3) {
                    // step 12: seek duration
                    avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_PREV_SYNC);
                    avPlayer.stop((err) => {
                        if (err == null) {
                            avPlayer.release((err) => {
                                if (err != null) {
                                    mediaTestBase.assertErr('release', err, done);
                                }
                            })
                        }  else {
                            mediaTestBase.assertErr('stop', err, done);
                        }
                    });
                }
                break;
            case AV_PLAYER_STATE.RELEASED:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.RELEASED);
                // step 18: release -> done
                avPlayer = null;
                expect(volumeCnt[0]).assertEqual(0);
                expect(endOfStreamCnt).assertLarger(0);
                done();
                break;
            case AV_PLAYER_STATE.ERROR:
                expect().assertFail();
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                break;
            default:
                break; 
        }
    });

    avPlayer.on('endOfStream', () => {
        console.info(`case endOfStream called`);
        endOfStreamCnt++;
        // step 9: seek + reset
        avPlayer.seek(avPlayer.duration / 2, 3); // 3: CLOSEST
        avPlayer.reset((err) => {
            if (err == null) {
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.IDLE);
                console.info('case reset success!!');
                setSource(avPlayer, src);
            }  else {
                mediaTestBase.assertErr('reset', err, done);
            }
        });
    });
    avPlayer.on('seekDone', async (seekDoneTime) => {
        seekDoneCnt++;
        console.info(`case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
        switch (seekDoneCnt) {
            case 1:
                expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                // step 3: seek(prepared) -> play
                avPlayer.play((err) => {
                    if (err != null) {
                        mediaTestBase.assertErr('play', err, done);
                    }
                });
                break;
            case 2:
                // step 5: seek + play
                avPlayer.seek(avPlayer.duration / 2, media.SeekMode.SEEK_NEXT_SYNC);
                avPlayer.play();
                break;
            case 3:
                // step 6: seek  + setVolume
                avPlayer.setVolume(0.5);
                avPlayer.seek(avPlayer.duration / 2, media.SeekMode.SEEK_CLOSEST_SYNC);
                avPlayer.play();
                break;
            case 4:
                // step 7: seek + seek
                avPlayer.seek(avPlayer.duration / 2);
                avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
                avPlayer.play();
                break;
            case 5:
                // step 8: seek duration
                avPlayer.seek(avPlayer.duration, media.SeekMode.SEEK_PREV_SYNC);
                break;
            default:
                avPlayer.play();
                break;
        }
    });
    setCallback(avPlayer, 'volumeChange', volumeCnt);
    setCallback(avPlayer, 'speedDone', speedDoneCnt);
    setCallback(avPlayer, 'bitrateDone', null);
    setCallback(avPlayer, 'timeUpdate', null);
    setCallback(avPlayer, 'bufferingUpdate', null);
    setCallback(avPlayer, 'durationUpdate', null);
    setCallback(avPlayer, 'startRenderFrame', null);
    setCallback(avPlayer, 'videoSizeChange', null);
    setCallback(avPlayer, 'audioInterrupt', null);
    setCallback(avPlayer, 'availableBitrates', null);
    avPlayer.on('error', async (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
    });
}

export async function testAVPlayerSeek(src, avPlayer, playTest, playTime, done) {
    console.info(`case media source: ${src}`)
    media.createAVPlayer((err, video) => {
        console.info(`case media err: ${err}`)
        if (typeof(video) != 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
            setAVPlayerSeekCb(src, avPlayer, playTest, playTime, done);
            setSource(avPlayer, src);
        }
        if (err != null) {
            console.error(`case createAVPlayer error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
        }
    });
}
