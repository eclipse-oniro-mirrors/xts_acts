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

import {testAVPlayerFun} from '../../../../../../AVPlayerTestBase.js';
import * as mediaTestBase from '../../../../../../MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function AVPlayerHttpCompatibilityTest() {
    describe('AVPlayerHttpCompatibilityTest', function () {
        const HTTP_PATH = 'http://xxx.xx.xx.xx:xxxx/';
        const VIDEO_PATH = HTTP_PATH + '01.video/';
        const AUDIO_PATH = HTTP_PATH + '02.audio/';
        const VIDEOPLAYER_PATH = HTTP_PATH + '03.videoplayer/';
        const AUDIOPLAYER_PATH = HTTP_PATH + '04.audioplayer/';
        const PLAY_TIME = 3000;
        let avPlayer = null;
        let avPlayTest = {
            width: 0,
            height: 0,
            duration: -1,
        }
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

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_MP4_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_MP4_0100', 0, async function (done) {
            let path = VIDEOPLAYER_PATH + 'mp4/h264_aac_640x320_30r.mp4';
            avPlayTest = { width: 640, height: 320, duration: 10100 };
            testAVPlayerFun(path, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_MP4_0200
            * @tc.name      : 002.H264_MP3
            * @tc.desc      : Http playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_MP4_0200', 0, async function (done) {
            let path = VIDEOPLAYER_PATH + 'mp4/h264_mp3_640x480_25r.mp4';
            avPlayTest = { width: 640, height: 480, duration: 10080 };
            testAVPlayerFun(path, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_TS_0100
            * @tc.name      : 001.H264_AAC
            * @tc.desc      : Http playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_TS_0100', 0, async function (done) {
            let path = VIDEOPLAYER_PATH + 'mpeg_ts/h264_aac_640x480_30r.ts';
            avPlayTest = { width: 640, height: 480, duration: 10161 };
            testAVPlayerFun(path, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_TS_0200
            * @tc.name      : 002.H264_MP3
            * @tc.desc      : Http playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_TS_0200', 0, async function (done) {
            let path = VIDEOPLAYER_PATH + 'mpeg_ts/h264_mp3_640x480_25r.ts';
            avPlayTest = { width: 640, height: 480, duration: 10169 };
            testAVPlayerFun(path, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_MKV_0100
            * @tc.name      : 001.H264_AAC
            * @tc.desc      : Http playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_HTTP_FORMAT_MKV_0100', 0, async function (done) {
            let path = VIDEO_PATH + 'H264_AAC.mkv';
            avPlayTest = { width: 720, height: 480, duration: 10057 };
            testAVPlayerFun(path, avPlayer, avPlayTest, PLAY_TIME, done);
        })
    });
}