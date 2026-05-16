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
import * as mediaTestBase from '../../../../../../MediaTestBase';
import * as AVPlayerTestBase from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function AVPlayerHlsFuncTest() {
    describe('AVPlayerHlsFuncTest', function () {
        const HTTP_PATH = 'http://xxx.xx.xx.xx:xxxx/';
        const PLAY_TIME = 3000;
        let avPlayer = null;
        let expectBitrateArray = [];
        let videoSizeArray = [];
        let videoSizeId = -1;
        let bitrateArray = [];
        let setBitrateState = '';
        let surfaceID = globalThis.value;
        beforeAll(async function() {
            console.info('beforeAll case');
        })

        beforeEach(async function() {
            console.info('beforeEach case');
        })

        afterEach(async function() {
            console.info('afterEach case');
        })

        afterAll(async function() {
            console.info('afterAll case');
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
        })

        function checkArray(realArray, expectArray) {
            expect(realArray.length).assertEqual(expectArray.length);
            for (let i = 0; i < expectArray.length; i++) { 
                console.info('case expect ' + expectArray[i]);
                expect(realArray[i]).assertEqual(expectArray[i]);
            }
        }

        async function initAVPlayer(src, done) {
            let availableBitratesCnt = 0;
            let bitrateDoneCnt = 0;
            await media.createAVPlayer().then((video) => {
                if (typeof (video) != 'undefined') {
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
                if (reason == media.StateChangeReason.BACKGROUND && state != AVPlayerTestBase.AV_PLAYER_STATE.COMPLETED) {
                    console.info(`case media.StateChangeReason.BACKGROUND`);
                    await avPlayer.release().then(() => {
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
                console.info(`case state is ${state}`);
                if (setBitrateState == state) {
                    avPlayer.setBitrate(expectBitrateArray[videoSizeId]);
                }
                switch (state) {
                    case AVPlayerTestBase.AV_PLAYER_STATE.IDLE:
                        break;
                    case AVPlayerTestBase.AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case AVPlayerTestBase.AV_PLAYER_STATE.INITIALIZED`);
                        expect(avPlayer.state).assertEqual(AVPlayerTestBase.AV_PLAYER_STATE.INITIALIZED);
                        avPlayer.surfaceId = surfaceID;
                        avPlayer.prepare().then(() => {
                            console.info('case prepare called');
                            expect(avPlayer.state).assertEqual(AVPlayerTestBase.AV_PLAYER_STATE.PREPARED);
                            expect(avPlayer.currentTime).assertEqual(0);
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    case AVPlayerTestBase.AV_PLAYER_STATE.PREPARED:
                        expect(avPlayer.state).assertEqual(AVPlayerTestBase.AV_PLAYER_STATE.PREPARED);
                        expect(avPlayer.currentTime).assertEqual(0)
                        avPlayer.loop = true;
                        avPlayer.play();
                        break;
                    case AVPlayerTestBase.AV_PLAYER_STATE.PAUSED:
                        avPlayer.play();
                        break;
                    case AVPlayerTestBase.AV_PLAYER_STATE.COMPLETED:
                        avPlayer.play();
                        break;
                    case AVPlayerTestBase.AV_PLAYER_STATE.RELEASED:
                        expect(availableBitratesCnt).assertLarger(0);
                        avPlayer = null;
                        done();
                        break;
                    case AVPlayerTestBase.AV_PLAYER_STATE.ERROR:
                        expect().assertFail();
                        avPlayer.release().then(() => {
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    default:
                        break; 
                }
            });
            avPlayer.on('bitrateDone', (bitrate) => {   
                console.info(`case bitrateDone called, bitrate is ${bitrate}`);
                expect(bitrate).assertEqual(expectBitrateArray[videoSizeId]);
                bitrateDoneCnt++;
            });
            avPlayer.on('videoSizeChange', (w, h) => {
                console.info('case videoSizeChange  width: ' + w + ' height: ' + h + 'videoSizeId: ' + videoSizeId);
                if (w == videoSizeArray[videoSizeId][0] && h == videoSizeArray[videoSizeId][1]) {
                    avPlayer.release().then(() => {
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
            });
            avPlayer.on('availableBitrates', (bitrates) => {
                bitrateArray = bitrates;
                checkArray(bitrateArray, expectBitrateArray);
                availableBitratesCnt++;
            });
            console.info(`case src is ${src}`);
            avPlayer.url = src;
        }
        
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0100
         * @tc.desc   HLS setBitrate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0100', Level.LEVEL0,async function (done) {
            await initAVPlayer(HTTP_PATH + '05.hls/hls_variant/index.m3u8', done);
            expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
            setBitrateState = AVPlayerTestBase.AV_PLAYER_STATE.PREPARED;
            videoSizeId = 1;
            videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0200
         * @tc.desc   HLS setBitrate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0200', Level.LEVEL0,async function (done) {
            await initAVPlayer(HTTP_PATH + '05.hls/hls_variant/index.m3u8', done);
            expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
            setBitrateState = AVPlayerTestBase.AV_PLAYER_STATE.PLAYING;
            videoSizeId = 1;
            videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0300
         * @tc.desc   HLS setBitrate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0300', Level.LEVEL0,async function (done) {
            await initAVPlayer(HTTP_PATH + '05.hls/hls_variant/index.m3u8', done);
            expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
            setBitrateState = AVPlayerTestBase.AV_PLAYER_STATE.PAUSED;
            videoSizeId = 1;
            videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
            await mediaTestBase.msleepAsync(PLAY_TIME);
            avPlayer.pause();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0400
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0400
         * @tc.desc   HLS setBitrate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0400', Level.LEVEL0,async function (done) {
            await initAVPlayer(HTTP_PATH + '05.hls/hls_variant/index.m3u8', done);
            expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
            setBitrateState = AVPlayerTestBase.AV_PLAYER_STATE.COMPLETED;
            videoSizeId = 1;
            videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
            await mediaTestBase.msleepAsync(PLAY_TIME);
            avPlayer.loop = false;
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0500
         * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0500
         * @tc.desc   HLS setBitrate test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HLS_setBitrate_0500', Level.LEVEL0,async function (done) {
            await initAVPlayer(HTTP_PATH + '05.hls/hls_variant/index.m3u8', done);
            expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
            setBitrateState = AVPlayerTestBase.AV_PLAYER_STATE.PREPARED;
            videoSizeId = 3;
            videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
        })
    });
}