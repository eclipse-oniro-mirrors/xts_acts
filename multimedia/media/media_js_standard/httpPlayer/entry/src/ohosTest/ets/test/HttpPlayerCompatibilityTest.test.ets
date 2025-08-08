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

import MediaTestBase from './MediaTestBase';
import { playAudioSource } from './AudioPlayerTestBase';
import { playVideoSource } from './VideoPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import { hilog } from '@kit.PerformanceAnalysisKit';

export default function hy_HttpPlayerCompatibilityTesttest() {
  describe('HttpPlayerCompatibilityTest', () => {
    const HTTP_PATH = 'http://192.168.8.161/httpplayer/';
    const PLAY_TIME = 3000;
    beforeAll(() => {
      hilog.info(0xFF00, "HttpPlayerCompatibilityTest: ", 'beforeAll case');
    });
    beforeEach(async () => {
      await MediaTestBase.msleepAsync(1000).then(() => {
      }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      await MediaTestBase.clearRouter();
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'h264-aac.mp4';
      await playVideoSource(path, 1920, 1080, 247300, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0200
        * @tc.name      : 002.H264_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MP4_0200', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'h264-mp3.mp4';
      await playVideoSource(path, 1920, 1080, 247300, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'h264-aac.ts';
      await playVideoSource(path, 1920, 1080, 247300, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0200
        * @tc.name      : 002.H264_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_TS_0200', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'h264-mp3.ts';
      await playVideoSource(path, 1920, 1080, 247300, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0100
        * @tc.name      : 001.H264_AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'h264-aac.mkv';
      await playVideoSource(path, 1920, 1080, 247300, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0200
        * @tc.name      : 002.H264_MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_MKV_0200', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'h264-mp3.mkv';
      await playVideoSource(path, 1920, 1080, 247300, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_WEBM_0100
        * @tc.name      : 001.VP8_VORBIS
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FORMAT_WEBM_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'vp8-vorbis.webm';
      await playVideoSource(path, 1920, 1080, 30000, PLAY_TIME, done);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_MP3_0100
        * @tc.name      : 001.MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_MP3_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'audio1.mp3';
      await playAudioSource(path, 10100, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_AAC_0100
        * @tc.name      : 001.AAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_AAC_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'audio3.aac';
      await playAudioSource(path, 11220, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_WAV_0100
        * @tc.name      : 001.MP3
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_WAV_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'audio2.wav';
      await playAudioSource(path, 30000, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_FLAC_0100
        * @tc.name      : 001.FLAC
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_FLAC_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'audio5.flac';
      await playAudioSource(path, 10000, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_M4A_0100
        * @tc.name      : 001.M4A
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_M4A_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'audio4.m4a';
      await playAudioSource(path, 10030, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_OGG_0100
        * @tc.name      : 001.OGG
        * @tc.desc      : Http playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_PLAYER_HTTP_FORMAT_OGG_0100', Level.LEVEL0,async (done: Function) => {
      let path = HTTP_PATH + 'audio6.ogg';
      await playAudioSource(path, 10000, PLAY_TIME, true, done);
    });
  })
}