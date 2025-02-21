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
import audio from '@ohos.multimedia.audio';
import { testAVPlayerFun, AV_PLAYER_STATE, setSource } from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

export default function AVPlayerAudioEffectModeTest() {
    describe('AVPlayerAudioEffectModeTest', function () {
        const VIDEO_SOURCE = 'H264_AAC.mp4';
        const AUDIO_SOURCE = '01.mp3';
        const VIDEO_NOAUDIO = 'H264_NONE.mp4'
        const PLAY_TIME = 3000;
        const WAIT_TIME = 500;
        const APIBASELINE = 500;
        const EFFECT_NONE = audio.AudioEffectMode.EFFECT_NONE;
        const EFFECT_DEFAULT = audio.AudioEffectMode.EFFECT_DEFAULT;
        let fileDescriptor = null;
        let fileDescriptor2 = null;
        let fileDescriptor3 = null;
        let avPlayer = null;
        

        beforeAll(async function() {
            console.info('beforeAll case');
            await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE).then((res) => {
                fileDescriptor = res;
            });
            await mediaTestBase.getStageFileDescriptor(AUDIO_SOURCE).then((res) => {
                fileDescriptor2 = res;
            });
            await mediaTestBase.getStageFileDescriptor(VIDEO_NOAUDIO).then((res) => {
                fileDescriptor3 = res;
            });
        })

        beforeEach(async function() {
            console.info('beforeEach case');
        })

        afterEach(async function() {
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            console.info('afterEach case');
        })

        afterAll(async function() {
            console.info('afterAll case');
            await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
            await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
            await mediaTestBase.closeFileDescriptor(VIDEO_NOAUDIO);
        })

        function testReliability(avPlayer, invalidlist) {
            for (let i = 0; i < invalidlist.length; i++) {
                avPlayer.audioEffectMode = invalidlist[i];
            }
        }

         /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100
            * @tc.name      : 001.test audioEffectMode - base function
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_FUNCTION_0100', 0, async function (done) {
            let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
            let i = 1;
            let playCount = 1;
            let resetConfig = 1;

            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.IDLE:
                        console.info(`case avPlayer.audioEffectMode is: ` + avPlayer.audioEffectMode);
                        if (resetConfig == 2) {
                            setSource(avPlayer, fileDescriptor2);
                        } else if (resetConfig == 3){
                            setSource(avPlayer, fileDescriptor3);
                        } else {
                            setSource(avPlayer, fileDescriptor);
                        }
                        break;
                    case AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case avPlayer.audioEffectMode is: ` + avPlayer.audioEffectMode);
                        avPlayer.surfaceId = globalThis.value;
                        if (resetConfig == 3) {
                            let audioRendererInfo = {
                                content: audio.ContentType.CONTENT_TYPE_RINGTONE ,
                                usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
                                rendererFlags: 0,
                            }
                            avPlayer.audioRendererInfo = audioRendererInfo;
                        }
                        avPlayer.prepare();
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        console.info(`case avPlayer.audioEffectMode is: ` + avPlayer.audioEffectMode);
                        if (resetConfig == 2) {
                            expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[i%2]);
                        } else if (resetConfig == 3) {
                            expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[0]);
                            avPlayer.audioEffectMode = audioEffectMode[i%2];
                        } else {
                            expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[0]);
                            avPlayer.audioEffectMode = audioEffectMode[(i++)%2];
                        }
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        console.info(`case avPlayer.audioEffectMode is: ` + avPlayer.audioEffectMode);
                        if (playCount == 1) {
                            avPlayer.audioEffectMode = audioEffectMode[i%2];
                            await mediaTestBase.msleepAsync(PLAY_TIME);
                            avPlayer.pause();
                        } else if (playCount == 2) {
                            expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[(i++)%2]);
                            avPlayer.audioEffectMode = audioEffectMode[i%2];
                            avPlayer.seek(avPlayer.duration);
                            await mediaTestBase.msleepAsync(WAIT_TIME);
                        } else {
                            expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[i%2]);
                            await mediaTestBase.msleepAsync(PLAY_TIME);
                            if (resetConfig == 2) {
                                resetConfig++;
                                avPlayer.reset();
                                
                            } else {
                                avPlayer.release();
                            }
                        }
                        playCount += 1;
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        console.info(`case avPlayer.audioEffectMode is: ` + avPlayer.audioEffectMode);
                        expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[(i++)%2]);
                        avPlayer.audioEffectMode = audioEffectMode[i%2];
                        await mediaTestBase.msleepAsync(WAIT_TIME);
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        console.info(`case avPlayer.audioEffectMode is: ` + avPlayer.audioEffectMode);
                        expect(avPlayer.audioEffectMode).assertEqual(audioEffectMode[(i++)%2]);
                        avPlayer.audioEffectMode = audioEffectMode[i%2];
                        resetConfig++;
                        avPlayer.reset();
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    default:
                        break;
                }
            })
            avPlayer.on('error', (err) => {
                console.error(`error occurred, message is ${err.message}`);
                expect().assertFail();
                avPlayer.release();
            })
            setSource(avPlayer, fileDescriptor);
        })

        

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_RELIABILITY_0100
            * @tc.name      : 002.test audioEffectMode - set nonconforming value
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_RELIABILITY_0100', 0, async function (done) {
            let playCount = 1;
            let expecterror = false;
            let invalidlist = [-1, 1000000, '', 'aaa', undefined];
            let steps = new Array('play', 'pause', 'play', 'release');
            let errCnt = 0;
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            avPlayer.on('stateChange', async (state, reason) => {
                console.info('case current state is: ' + state);
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = globalThis.value;
                        avPlayer.prepare();
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        expecterror = true;
                        testReliability(avPlayer, invalidlist);
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        if (playCount++ == 1) {
                            expecterror = true;
                            testReliability(avPlayer, invalidlist);
                        } else if (playCount == 2) {
                            avPlayer.seek(avPlayer.duration);
                            await mediaTestBase.msleepAsync(WAIT_TIME);
                        }
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        expecterror = true;
                        testReliability(avPlayer, invalidlist);
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        expecterror = true;
                        testReliability(avPlayer, invalidlist);
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    default:
                        break;
                }
            })
            avPlayer.on('error', (err) => {
                errCnt += 1;
                console.error(`error occurred, message is ${err.message}, errCnt is ${errCnt}`);
                expect(expecterror).assertEqual(true);
                if (errCnt == invalidlist.length) {
                    errCnt = 0;
                    expecterror = false;
                    switch(steps[0]) {
                        case 'play':
                            avPlayer.play();
                            break;
                        case 'pause':
                            avPlayer.pause();
                            break;
                        case 'release':
                            avPlayer.release();
                            break;
                        default:
                            break;
                    }
                    steps.shift();
                }
            })
            
            setSource(avPlayer, fileDescriptor);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_RELIABILITY_0200
            * @tc.name      : 003.test audioEffectMode - set value in abnormal state
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_RELIABILITY_0200', 0, async function (done) {
            let expecterror = false;
            let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
            let steps = new Array('prepare', 'reset', 'release');
            let errCnt = 0;
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.IDLE:
                        expecterror = true;
                        avPlayer.audioEffectMode = audioEffectMode[1];
                        break;
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = globalThis.value;
                        expecterror = true;
                        avPlayer.audioEffectMode = audioEffectMode[1];
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        avPlayer.stop();
                        break;
                    case AV_PLAYER_STATE.STOPPED:
                        expecterror = true;
                        avPlayer.audioEffectMode = audioEffectMode[1];
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    default:
                        break;
                }
            })
            avPlayer.on('error', (err) => {
                console.error(`error occurred, message is ${err.message}, errCnt is ${errCnt}`);
                expect(expecterror).assertEqual(true);
                expecterror = false;
                switch(steps[0]) {
                    case 'prepare':
                        avPlayer.prepare();
                        break;
                    case 'reset':
                        avPlayer.reset();
                        break;
                    case 'release':
                        avPlayer.release();
                        break;
                    default:
                        break;
                }
                steps.shift();
            })
            setSource(avPlayer, fileDescriptor);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_STABILITY_0100
            * @tc.name      : 004.test audioEffectMode - multiple calls
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Stability test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_STABILITY_0100', 0, async function (done) {
            let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
            let playCount = 1;
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = globalThis.value;
                        let audioRendererInfo = {
                            content: audio.ContentType.CONTENT_TYPE_RINGTONE ,
                            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
                            rendererFlags: 0,
                        }
                        avPlayer.audioRendererInfo = audioRendererInfo;
                        avPlayer.prepare();
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        for (let i = 0; i < 1000; i++) {
                            avPlayer.audioEffectMode = audioEffectMode[Math.floor((Math.random()*audioEffectMode.length))];
                        }
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        if (playCount++ == 1) {
                            for (let i = 0; i < 1000; i++) {
                                avPlayer.audioEffectMode = audioEffectMode[Math.floor((Math.random()*audioEffectMode.length))];
                            }
                            avPlayer.pause();
                        } else if (playCount == 2) {
                            avPlayer.seek(avPlayer.duration);
                            await mediaTestBase.msleepAsync(WAIT_TIME);
                        }
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        for (let i = 0; i < 1000; i++) {
                            avPlayer.audioEffectMode = audioEffectMode[Math.floor((Math.random()*audioEffectMode.length))];
                        }
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        for (let i = 0; i < 1000; i++) {
                            avPlayer.audioEffectMode = audioEffectMode[Math.floor((Math.random()*audioEffectMode.length))];
                        }
                        avPlayer.release();
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    default:
                        break;
                }
            })
            avPlayer.on('error', (err) => {
                console.error(`error occurred, message is ${err.message}`);
                expect().assertFail();
                avPlayer.release();
            })
            setSource(avPlayer, fileDescriptor);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_APITIME_0100
            * @tc.name      : 005.test audioEffectMode api time
            * @tc.desc      : test audioEffectMode api time
            * @tc.size      : MediumTest
            * @tc.type      : performance test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_AUDIOEFFECTMODE_APITIME_0100', 0, async function (done) {
            let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = globalThis.value;
                        avPlayer.prepare();
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        let startTime = new Date().getTime();
                        console.info('case audioEffectMode startTime is : ' + startTime);
                        for (let i = 0; i < 1000; i++) {
                            avPlayer.audioEffectMode = audioEffectMode[Math.floor((Math.random()*audioEffectMode.length))];
                        }
                        let endTime = new Date().getTime();
                        console.info('case audioEffectMode endTime is : ' + endTime);
                        let audioEffectMode_averageTime = ((endTime - startTime) * 1000) / 1000;
                        console.info('case audioEffectMode_averageTime is : ' + audioEffectMode_averageTime + 'us');
                        expect(audioEffectMode_averageTime < APIBASELINE).assertTrue();
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        await mediaTestBase.msleepAsync(PLAY_TIME);
                        avPlayer.release();
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    default:
                        break;
                }
            })
            avPlayer.on('error', (err) => {
                console.error(`error occurred, message is ${err.message}`);
                expect().assertFail();
                avPlayer.release();
            })
            setSource(avPlayer, fileDescriptor);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_GET_MAX_AMPLITUDE_0100
            * @tc.name      : 001.test get max amplitude
            * @tc.desc      : test get max amplitude
            * @tc.size      : MediumTest
            * @tc.type      : performance test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_GET_MAX_AMPLITUDE_0100', 0, async function (done) {
            let audioEffectMode = [EFFECT_DEFAULT, EFFECT_NONE];
            let amplitude = -1;
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = globalThis.value;
                        avPlayer.prepare();
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        avPlayer.play();
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        await mediaTestBase.msleepAsync(PLAY_TIME);
                        expect(amplitude != -1).assertEqual(true);
                        avPlayer.release();
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    default:
                        break;
                }
            })

            avPlayer.on('amplitudeUpdate', (value) => {
                console.info(`get max amplitude ${value}`);
                amplitude = value[0];
            })

            avPlayer.on('error', (err) => {
                console.error(`error occurred, message is ${err.message}`);
                expect().assertFail();
                avPlayer.release();
            })
            setSource(avPlayer, fileDescriptor);
        })
    })
}
