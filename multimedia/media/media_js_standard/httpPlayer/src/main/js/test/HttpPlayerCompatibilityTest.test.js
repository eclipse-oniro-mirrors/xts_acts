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
import {playAudioSource} from '../../../../../AudioPlayerTestBase.js';
import {playVideoSource} from '../../../../../VideoPlayerTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('HttpPlayerCompatibilityTest', function () {
    const HTTP_PATH = 'http://123.57.24.33:8000/';
    const VIDEO_PATH = HTTP_PATH + '01.video/';
    const AUDIO_PATH = HTTP_PATH + '02.audio/';
    const VIDEOPLAYER_PATH = HTTP_PATH + '03.videoplayer/';
    const AUDIOPLAYER_PATH = HTTP_PATH + '04.audioplayer/';
    const PLAY_TIME = 3000;
    const pagePath1 = 'pages/surfaceTest/surfaceTest';
    const pagePath2 = 'pages/surfaceTest2/surfaceTest2';
    let pageId = 0;

    beforeAll(function() {
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

    afterAll(function() {
        console.info('afterAll case');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0100', 0, async function (done) {
        let path = VIDEOPLAYER_PATH + 'mp4/h264_aac_640x320_30r.mp4';
        await playVideoSource(path, 640, 320, 10100, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0200
        * @tc.name      : 002.H264_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0200', 0, async function (done) {
        let path = VIDEOPLAYER_PATH + 'mp4/h264_mp3_640x480_25r.mp4';
        await playVideoSource(path, 640, 480, 10080, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0100', 0, async function (done) {
        let path = VIDEOPLAYER_PATH + 'mpeg_ts/h264_aac_640x480_30r.ts';
        await playVideoSource(path, 640, 480, 10161, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0200
        * @tc.name      : 002.H264_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0200', 0, async function (done) {
        let path = VIDEOPLAYER_PATH + 'mpeg_ts/h264_mp3_640x480_25r.ts';
        await playVideoSource(path, 640, 480, 10169, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0100', 0, async function (done) {
        let path = VIDEO_PATH + 'H264_AAC.mkv';
        await playVideoSource(path, 720, 480, 10057, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0200
        * @tc.name      : 002.H264_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0200', 0, async function (done) {
        let path = VIDEO_PATH + 'H264_MP3.mkv';
        await playVideoSource(path, 720, 480, 10059, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0500
        * @tc.name      : 005.MPEG2_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0300', 0, async function (done) {
        let path = VIDEO_PATH + 'MPEG2_AAC.mkv';
        await playVideoSource(path, 720, 480, 10057, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0600
        * @tc.name      : 006.MPEG2_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0400', 0, async function (done) {
        let path = VIDEO_PATH + 'MPEG2_MP3.mkv';
        await playVideoSource(path, 720, 480, 10059, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0800
        * @tc.name      : 008.MPEG4_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0500', 0, async function (done) {
        let path = VIDEO_PATH + 'MPEG4_MP3.mkv';
        await playVideoSource(path, 720, 480, 10059, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_WEBM_0100
        * @tc.name      : 001.VP8_VORBIS
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_WEBM_0100', 0, async function (done) {
        let path = VIDEO_PATH + 'VP8_VORBIS.webm';
        await playVideoSource(path, 720, 480, 10083, PLAY_TIME, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_MP3_0100
        * @tc.name      : 001.MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_MP3_0100', 0, async function (done) {
        let path = AUDIO_PATH + '01.mp3';
        await playAudioSource(path, 219600, PLAY_TIME, true, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_AAC_0100
        * @tc.name      : 001.AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_AAC_0100', 0, async function (done) {
        let path = AUDIOPLAYER_PATH + 'aac/aac_96ksr_64kbr_2ch.aac';
        await playAudioSource(path, 12198, PLAY_TIME, true, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_WAV_0100
        * @tc.name      : 001.MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_WAV_0100', 0, async function (done) {
        let path = AUDIOPLAYER_PATH + 'wav/pcm_48ksr_16kbr_1ch.wav';
        await playAudioSource(path, 5461, PLAY_TIME, true, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_FLAC_0100
        * @tc.name      : 001.FLAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_FLAC_0100', 0, async function (done) {
        let path = AUDIOPLAYER_PATH + 'flac/flac_96ksr_64kbr_2ch.flac';
        await playAudioSource(path, 10000, PLAY_TIME, true, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_M4A_0100
        * @tc.name      : 001.M4A
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_M4A_0100', 0, async function (done) {
        let path = AUDIO_PATH + '55.m4a';
        await playAudioSource(path, 219575, PLAY_TIME, true, done);
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_OGG_0100
        * @tc.name      : 001.OGG
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_OGG_0100', 0, async function (done) {
        let path = AUDIOPLAYER_PATH + 'ogg/vorbis_48ksr_32kbr_1ch.ogg';
        await playAudioSource(path, 10009, PLAY_TIME, true, done);
    })
})
