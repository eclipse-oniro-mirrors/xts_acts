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
import {playVideoSource} from '../../../../../VideoPlayerTestBase.js';
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoPlayerHLSTest', function () {
    const HTTP_PATH = 'http://123.57.24.33:8000/';
    const PLAY_TIME = 3000;
    const pagePath1 = 'pages/surfaceTest/surfaceTest';
    const pagePath2 = 'pages/surfaceTest2/surfaceTest2';
    let pageId = 0;

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

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_0100
        * @tc.name      : 001.test hls
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_0100', 0, async function (done) {
        await playVideoSource(HTTP_PATH + '05.hls/1/index.m3u8', 640, 320, 10033, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_Separate_0100
        * @tc.name      : 001.test hls audio video separate
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_Separate_0100', 0, async function (done) {
        await playVideoSource(HTTP_PATH + '05.hls/2/index.m3u8', 640, 320, 10033, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_AudioOnly_0100
        * @tc.name      : 001.test hls audio only
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_AudioOnly_0100', 0, async function (done) {
        await playVideoSource(HTTP_PATH + '05.hls/audio_only/index.m3u8', 0, 0, 219600, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_Variant_0100
        * @tc.name      : 001.test hls variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_Variant_0100', 0, async function (done) {
        await playVideoSource(HTTP_PATH + '05.hls/hls_variant/index.m3u8', null, null, 10033, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_AudioOff_0100
        * @tc.name      : 001.test hls variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_AudioOff_0100', 0, async function (done) {
        await playVideoSource(HTTP_PATH + '05.hls/hls_variant2/index.m3u8', null, null, 10080, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_CodecChange_0100
        * @tc.name      : 001.test hls variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_CodecChange_0100', 0, async function (done) {
        await playVideoSource(HTTP_PATH + '05.hls/hls_variant3/index.m3u8', null, null, 10080, PLAY_TIME, done);
        done();
    })

})
