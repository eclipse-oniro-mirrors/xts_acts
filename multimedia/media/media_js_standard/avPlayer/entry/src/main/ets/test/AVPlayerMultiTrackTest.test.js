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
import { AV_PLAYER_STATE, setSource } from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

export default function AVPlayerMultiTrackTest() {
    describe('AVPlayerMultiTrackTest', function () {
        const VIDEO_SOURCE = 'mpeg4_1920_1080_aac_flac.mkv';
        const VIDEO_NOAUDIO = 'H264_NONE.mp4';
        const PLAY_TIME = 3000;
        const LOOPCNT = 5;
        const NOAUDIOTRACK = -1;
        let avFd;
        let audioFd;
        let videoFd;
        let avPlayer;
        let audioTrackList = new Array();
        let selectedTrack;
        let currentTrack;
        let defaultTrack;
        let surfaceID = globalThis.value;
        let changeRepeatly = false;

        beforeAll(async function() {
            console.info('beforeAll case');
            await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE).then((res) => {
                avFd = res;
            });
            await mediaTestBase.getStageFileDescriptor(VIDEO_NOAUDIO).then((res) => {
                videoFd = res;
            });
        })

        beforeEach(async function() {
            console.info('beforeEach case');
            audioTrackList = new Array();
            selectedTrack = undefined;
            changeRepeatly = false;
        })

        afterEach(async function() {
            if (avPlayer != null) {
                await avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            console.info('afterEach case');
        })

        afterAll(async function() {
            console.info('afterAll case');
            await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
            await mediaTestBase.closeFileDescriptor(VIDEO_NOAUDIO);
        })

        function printFailureCallback(error) {
            console.info(`case failureCallback promise called,errMessage is ${error.message}`);
        }

        function printCatchCallback(error) {
            console.info(`case error catch called,errMessage is ${error.message}`);
        }

        async function getAudioTracks() {
            console.info('case to getTrackDescription');
            await avPlayer.getTrackDescription().then((arrayList) => {
                console.info('case getTrackDescription called!!');
                if (typeof (arrayList) != 'undefined') {
                    console.info('case arrayList.length is  ' + arrayList.length);
                    for (let i = 0; i < arrayList.length; i++) {
                        console.info('case language_code is  ' + arrayList[i]['language_code']);
                        if (arrayList[i]['track_type'] == 0) {
                            audioTrackList.push(arrayList[i]['track_index']);
                        }
                    }
                } else {
                    console.info('case getTrackDescription is failed');
                    expect().assertFail();
                }
            })
            console.info('case audioTrackList is: ' + audioTrackList);
            await avPlayer.getCurrentTrack(0).then((index) => {
                console.info(`case default audio track index is ${index}`);
                defaultTrack = index;
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }

        async function getCurrentAudioTrack() {
            await avPlayer.getCurrentTrack(0).then((index) => {
                console.info(`case current audio track index is ${index}`);
                currentTrack = index;
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }

        async function getCurrentAudioTrackCall() {
            await avPlayer.getCurrentTrack(0, (err, index) => {
                if (err == null) {
                    console.info(`case current audio track index is ${index}`);
                    currentTrack = index;
                } else {
                    console.error('getCurrentTrack failed and error is ' + err.message);
                }
            });
        }

        async function changeAudioTrack() {
            for(let i = 0; i < audioTrackList.length; i++) {
                if (audioTrackList[i] != currentTrack) {
                    selectedTrack = audioTrackList[i];
                    console.info('case new audio track is:' + selectedTrack);
                    break;
                } else {
                    continue;
                }
            }
        }

        async function resetAndCallbackOff() {
            console.info('case now stopped, to reset');
            await avPlayer.reset().then(() => {
                console.info('case reset AVPlayer success');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            avPlayer.off('stateChange');
            avPlayer.off('trackChange');
            avPlayer.off('error');
            avPlayer.off('endOfStream');
            console.info('case now stopped, to release');
            await avPlayer.release().then(() => {
                console.info('case release AVPlayer success');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }

        async function testChangeTrack(fd, preparedOp, playedOp, stoppedOp, extraOp) {
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                } else {
                    console.error('case createAVPlayer failed');
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

            avPlayer.on('stateChange', async (state, reason) => {
                console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                        if (fd != audioFd) {
                            console.info('case is videosrc');
                            avPlayer.surfaceId = surfaceID;
                            console.info(`case avPlayer.surfaceId is ${avPlayer.surfaceId}`);
                        } else {
                            console.info('case is audiosrc');
                        }
                        await avPlayer.prepare().then(() => {
                            console.info('case prepare called');
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                        expect(avPlayer.currentTime).assertEqual(0);
                        await preparedOp();
                        if (!changeRepeatly) {
                            console.info('case to play AVPlayer');
                            await avPlayer.play().then(() => {
                                console.info('case play AVPlayer success');
                            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        }
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                        await playedOp();
                        await mediaTestBase.msleepAsync(PLAY_TIME);
                        if (!avPlayer.loop) {
                            await avPlayer.stop().then(() => {
                            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        }
                        break;
                    case AV_PLAYER_STATE.STOPPED:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.STOPPED);
                        await stoppedOp();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.ERROR);
                        expect().assertFail();
                        avPlayer.release().then(() => {
                            console.info('case release AVPlayer success');
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    default:
                        break;
                    }
            });
            avPlayer.on('trackChange', async (index, isSelection) => {
                console.info(`case trackChange called, index is ${index}, isSelection is ${isSelection}`);
                if (changeRepeatly) {
                    extraOp();
                }
            });
            avPlayer.on('error', async (err) => {
                console.error(`case error called, errMessage is ${err.message}`);
            });
            avPlayer.on('endOfStream', async () => {
                extraOp();
            });

            setSource(avPlayer, fd);
        }
        
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0100
            * @tc.name      : 001.test change default audio track
            * @tc.desc      : test change default audio track
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0100', 0, async function (done) {
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentAudioTrackCall();
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack);
                expect(currentTrack!=selectedTrack).assertTrue();
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(selectedTrack);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0200
            * @tc.name      : 002.test deselect default audio track
            * @tc.desc      : test deselect default audio track
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0200', 0, async function (done) {
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentAudioTrack();
                avPlayer.deselectTrack(currentTrack);
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(defaultTrack);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0300
            * @tc.name      : 003.test select and deselect audio track
            * @tc.desc      : test select and deselect audio track
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0300', 0, async function (done) {
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentAudioTrack();
                avPlayer.selectTrack(currentTrack);
                avPlayer.deselectTrack(currentTrack);
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack);
                avPlayer.deselectTrack(selectedTrack);
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(defaultTrack);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0500
            * @tc.name      : 005.test change audio track repeatly
            * @tc.desc      : test change audio track repeatly
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0500', 0, async function (done) {
            changeRepeatly = true;
            let changeCnt = 0;
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentAudioTrack();
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack);
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(selectedTrack);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            async function extraOperation() {
                if (changeCnt < LOOPCNT) {
                    changeCnt += 1;
                    await getCurrentAudioTrack();
                    expect(currentTrack).assertEqual(selectedTrack);
                    await changeAudioTrack();
                    avPlayer.selectTrack(selectedTrack); 
                } else {
                    console.info('case to play AVPlayer');
                    await avPlayer.play().then(() => {
                        console.info('case play AVPlayer success');
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, extraOperation);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0600
            * @tc.name      : 006.test change audio track after re-prepared
            * @tc.desc      : test change audio track after re-prepared
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_FUNC_0600', 0, async function (done) {
            let prepareCnt = 0;
            async function preparedOperation() {
                prepareCnt += 1;
                console.info(`case prepareCnt is ${prepareCnt}`);
                if (prepareCnt == 1) {
                    await getAudioTracks();
                    await getCurrentAudioTrack();
                } if (prepareCnt == 2) {
                    await getCurrentAudioTrack();
                } else {
                    await getCurrentAudioTrack();
                    await changeAudioTrack();
                    avPlayer.selectTrack(selectedTrack);
                    console.info('case selectedTrack is: ' + selectedTrack);
                }
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(selectedTrack);
            }

            async function stoppedOperation() {
                if (prepareCnt <= 2) {
                    console.info('case now stopped, to prepare');
                    await avPlayer.prepare().then(() => {
                        console.info('case prepare avPlayer success');
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                } else {
                    await resetAndCallbackOff();
                    done();
                }
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined);
        })


        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_0700
            * @tc.name      : 007.test selectTrack、seek and setSpeed
            * @tc.desc      : Local multi-audioTrack video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_0700', 0, async function (done) {
            let eosCnt = 0;
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentAudioTrack();
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack);
                console.info('case selectedTrack is: ' + selectedTrack);
                avPlayer.seek(avPlayer.duration / 3);
                avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
                avPlayer.deselectTrack(selectedTrack);
                await getCurrentAudioTrack();
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack);
                console.info('case selectedTrack is: ' + selectedTrack);
                avPlayer.loop = true;
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(selectedTrack);
                await mediaTestBase.msleepAsync(2000);
                avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
                avPlayer.seek(0);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            async function extraOperation() {
                eosCnt += 1;
                console.info(`case endOfStream called, eosCnt is ${eosCnt}`);
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(selectedTrack);
                avPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
                avPlayer.seek(avPlayer.duration * 2 / 3);
                if (eosCnt == LOOPCNT) {
                    avPlayer.loop = false;
                    await avPlayer.stop().then(() => {
                        console.info('case stop avplayer success');
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }  
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, extraOperation);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_ABNORMAL_INPUT_0100
            * @tc.name      : 008.test selectTrack/deselectTrack/getCurrentTrack invalid input
            * @tc.desc      : test change audio track after re-prepared
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_MULTI_AUDIOTRACK_ABNORMAL_INPUT_0100', 0, async function (done) {
            const NOAUDIOTRACK = -1;
            let un = undefined;
            let typeInvalid = [-1, 2, 1000000, '', 'aaa', un];
            async function preparedOperation() {
                await getAudioTracks();
                await avPlayer.getCurrentTrack(0).then((index) => {
                    console.info(`case current audio track index is ${index}`);
                }, printFailureCallback).catch(printCatchCallback);

                for (let type in typeInvalid) {
                    console.info(`case current invalid track type in is ${typeInvalid[type]}`);
                    await avPlayer.getCurrentTrack(typeInvalid[type]).then((index) => {
                        console.info(`case current audio track index is ${index}`);
                    }, printFailureCallback).catch(printCatchCallback);
                }
                let trackInvalid = [-1, 0, 1000000, '', 'aaa', un];
                for (let track in trackInvalid) {
                    console.info(`case current invalid track in is ${trackInvalid[track]}`);
                    avPlayer.selectTrack(trackInvalid[track]);
                    await mediaTestBase.msleepAsync(1000);
                    await getCurrentAudioTrack();
                    expect(currentTrack).assertEqual(NOAUDIOTRACK);
                }

                for (let track in trackInvalid) {
                    console.info(`case current invalid track in 2 is ${trackInvalid[track]}`);
                    avPlayer.deselectTrack(trackInvalid[track]);
                    await mediaTestBase.msleepAsync(1000);
                    await getCurrentAudioTrack();
                    expect(currentTrack).assertEqual(NOAUDIOTRACK);
                }
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack);
                avPlayer.deselectTrack(NOAUDIOTRACK);
            }

            async function playedOperation() {
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(NOAUDIOTRACK);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            await testChangeTrack(videoFd, preparedOperation, playedOperation, stoppedOperation, undefined);
        })

    })
}
