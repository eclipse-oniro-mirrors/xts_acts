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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoPlayerHLSBitrateTest.test', function () {
    const HTTP_PATH = 'http://123.57.24.33:8000/';
    const PLAY_TIME = 3000;
    const pagePath1 = 'pages/surfaceTest/surfaceTest';
    const pagePath2 = 'pages/surfaceTest2/surfaceTest2';
    let pageId = 0;
    let width = 0;
    let height = 0;
    let expectBitrateArray = [];
    let videoSizeArray = [];
    let videoSizeId = -1;
    let bitrateArray = [];
    let videoPlayer = null;
    beforeAll(async function() {
        console.info('beforeAll case');
    })

    beforeEach(async function() {
        await mediaTestBase.toNewPage(pagePath1, pagePath2, pageId);
        pageId = (pageId + 1) % 2;
        await mediaTestBase.msleepAsync(1000).then(
            () => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        console.info('beforeEach case');
    })

    afterEach(async function() {
        await mediaTestBase.clearRouter();
        console.info('afterEach case');
    })

    afterAll(async function() {
        console.info('afterAll case');
    })
    async function initVideoPlayer(done) {
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                console.info('case createVideoPlayer success');
                videoPlayer = video;
            } else {
                console.error('case createVideoPlayer failed');
                expect().assertFail();
                done();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    
        videoPlayer.on('videoSizeChanged', (w, h) => {
            console.info('case videoSizeChanged  width: ' + w + ' height: ' + h + 'videoSizeId: ' + videoSizeId);
            width = w;
            height = h;
            if (videoSizeId >= 0 && videoSizeId < videoSizeArray.length && 
                  w == videoSizeArray[videoSizeId][0] && h == videoSizeArray[videoSizeId][1]) {
                releaseVideoPlayer(done);
            }
        });
        videoPlayer.on('availableBitratesCollect', (bitrates) => {
            bitrateArray = bitrates;
            for (let i = 0; i < bitrateArray.length; i++) { 
                console.info('case availableBitratesCollect bitrates: '  + bitrateArray[i]);
            }
        });
        videoPlayer.on('error', (err) => {
            console.error(`case error called, errMessage is ${err.message}`);
            expect().assertFail();
            videoPlayer.release();
            done();
        });
    }
    async function setVideoUrl(url) {
        console.info(`case media source url: ${url}`)
        let surfaceID = globalThis.value;
        videoPlayer.url = url;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            console.info('case setDisplaySurface success, surfaceID: ' + surfaceID);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            console.info('case prepare called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    async function playAndSetLoop(playTime) {
        videoPlayer.loop = true;
        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(async () => {
            console.info('case play called');
            expect(videoPlayer.state).assertEqual('playing');
            await mediaTestBase.msleepAsync(playTime);
            console.info('case play done');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(playTime, 1000);
    }
    async function releaseVideoPlayer(done) {
        await videoPlayer.reset().then(() => {
            console.info('case reset called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called');
            done();
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    function checkArray(realArray, expectArray) {
        expect(realArray.length).assertEqual(expectArray.length);
        for (let i = 0; i < expectArray.length; i++) { 
            console.info('case expect ' + expectArray[i]);
            expect(realArray[i]).assertEqual(expectArray[i]);
        }
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_HLS_SET_BITRATE_0100
        * @tc.name      : 001.test hls set bitrate
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SelectBitrate_0100', 0, async function (done) {
        await initVideoPlayer(done);
        await setVideoUrl(HTTP_PATH + '05.hls/hls_variant/index.m3u8');
        await playAndSetLoop(PLAY_TIME * 2);
        expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
        videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
        checkArray(bitrateArray, expectBitrateArray);
        videoSizeId = 1;
        videoPlayer.selectBitrate(expectBitrateArray[videoSizeId]).then((bitrate) => {
            console.info('case selectBitrate called');
            expect(bitrate).assertEqual(expectBitrateArray[videoSizeId]);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_HLS_SET_BITRATE_0200
        * @tc.name      : 001.test hls set bitrate
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SelectBitrate_0200', 0, async function (done) {
        await initVideoPlayer(done);
        await setVideoUrl(HTTP_PATH + '05.hls/hls_variant/index.m3u8');
        await playAndSetLoop(PLAY_TIME);
        expectBitrateArray = [165340, 344388, 387360, 765178, 1676816];
        videoSizeArray = [ [256, 144], [426, 240], [640, 360], [854, 480], [1280, 720] ];
        checkArray(bitrateArray, expectBitrateArray);
        videoSizeId = videoSizeArray.length - 2;
        videoPlayer.selectBitrate(expectBitrateArray[videoSizeId], (err, bitrate) => {
            console.info('case selectBitrate called');
            if (typeof (err) == 'undefined') {
                expect(bitrate).assertEqual(expectBitrateArray[videoSizeId]);
            } else {
                mediaTestBase.printError(err, done);
            }
        })
    })
})
