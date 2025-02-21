/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

export default function AVPlayerSelectTrackTest() {
    describe('AVPlayerSelectTrackTest', function () {
        const VIDEO_SOURCE = 'H264_AAC_AAC_multiAudio.mp4';
        const PLAY_TIME = 3000;
        const LOOPCNT = 2;
        const NOAUDIOTRACK = -1;
        let avFd;
        let avPlayer;
        let audioTrackList = new Array();
        let selectedTrackList = new Array();
        let selectedTrack;
        let currentTrack;
        let defaultTrack;
        let surfaceID = globalThis.value;

        beforeAll(async function() {
            console.info('beforeAll case');
            await mediaTestBase.getStageFd(VIDEO_SOURCE).then((res) => {
                avFd = res;
            });
        })

        beforeEach(async function() {
            console.info('beforeEach case');
            audioTrackList = new Array();
            selectedTrack = undefined;
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
            await mediaTestBase.closeStageFd(VIDEO_SOURCE);
        })

        async function getAudioTracks() {
            console.info('case to getTrackDescription');
            await avPlayer.getTrackDescription().then((arrayList) => {
                console.info('case getTrackDescription called!!');
                if (typeof (arrayList) == 'undefined') {
                    console.info('case getTrackDescription is failed');
                    expect().assertFail();
                    return;
                }
                console.info('case arrayList.length is  ' + arrayList.length);
                for (let i = 0; i < arrayList.length; i++) {
                    console.info('case track_name is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_NAME]);
                    console.info('case hdr_type is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_HDR_TYPE]);
                    if (arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] == 0) {
                        audioTrackList.push(arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]);
                    }
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

        async function getCurrentSelectedTrack() {
            await avPlayer.getSelectedTracks().then((trackList) => {
                if (typeof (selectedTrackList) == 'undefined') {
                    console.info('case getTrackDescription is failed');
                    expect().assertFail();
                    return;
                }
                console.info('case trackList.length is  ' + trackList.length);
                for (let i = 0; i < trackList.length; i++) {
                    selectedTrackList.push(trackList[i]);
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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

        async function handleState(state, preparedOp, playedOp, stoppedOp) {
            switch (state) {
                case AV_PLAYER_STATE.INITIALIZED:
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                    avPlayer.surfaceId = surfaceID;
                    console.info(`case avPlayer.surfaceId is ${avPlayer.surfaceId}`);
                    await avPlayer.prepare().then(() => {
                        console.info('case prepare called');
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    break;
                case AV_PLAYER_STATE.PREPARED:
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PREPARED);
                    expect(avPlayer.currentTime).assertEqual(0);
                    await preparedOp();
                    console.info('case to play AVPlayer');
                    await avPlayer.play().then(() => {
                        console.info('case play AVPlayer success');
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    break;
                case AV_PLAYER_STATE.PLAYING:
                    expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.PLAYING);
                    await mediaTestBase.msleepAsync(PLAY_TIME);
                    await playedOp();
                    if (!avPlayer.loop) {
                        await avPlayer.stop().then(() => {
                            console.info('case stop AVPlayer success');
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
        }

        async function testChangeTrack(fd, preparedOp, playedOp, stoppedOp, extraOp) {
            console.info(`case media source: ${fd}`)
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
                await handleState(state, preparedOp, playedOp, stoppedOp);
            });
            avPlayer.on('trackChange', async (index, isSelection) => {
                console.info(`case trackChange called, index is ${index}, isSelection is ${isSelection}`);
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
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0100
            * @tc.name      : 001.test change default audio track
            * @tc.desc      : test change default audio track
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0100', 0, async function (done) {
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentSelectedTrack();
                await getCurrentAudioTrack();
                avPlayer.selectTrack(currentTrack);
                await mediaTestBase.msleepAsync(2000);
                avPlayer.deselectTrack(currentTrack);
                expect(currentTrack!=selectedTrack).assertTrue();
            }

            async function playedOperation() {
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack, media.SwitchMode.SEGMENT);
                await mediaTestBase.msleepAsync(2000);
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
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0200
            * @tc.name      : 001.test change default audio track
            * @tc.desc      : test change default audio track
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SELECTTRACK_FUNC_0200', 0, async function (done) {
            async function preparedOperation() {
                await getAudioTracks();
                await getCurrentSelectedTrack();
                await getCurrentAudioTrack();
                avPlayer.selectTrack(currentTrack, media.SwitchMode.SMOOTH);
                await mediaTestBase.msleepAsync(2000);
                avPlayer.deselectTrack(currentTrack);
                expect(currentTrack!=selectedTrack).assertTrue();
            }

            async function playedOperation() {
                await changeAudioTrack();
                avPlayer.selectTrack(selectedTrack, media.SwitchMode.CLOSEST);
                await mediaTestBase.msleepAsync(2000);
                await getCurrentAudioTrack();
                expect(currentTrack).assertEqual(selectedTrack);
            }

            async function stoppedOperation() {
                await resetAndCallbackOff();
                done();
            }

            await testChangeTrack(avFd, preparedOperation, playedOperation, stoppedOperation, undefined);
        })
    })
}