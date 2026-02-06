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

import { testVideoSeek } from './VideoPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import MediaTestBase from './MediaTestBase';

export default function videoPlayerHLSSeekTest() {
  describe('VideoPlayerHLSSeekTest', () => {
    const HTTP_PATH = 'http://192.168.8.161/';
    const PLAY_TIME = 3000;

    beforeAll(async () => {
      console.info('beforeAll case');
    })

    beforeEach(async () => {
      await MediaTestBase.msleepAsync(1000).then(
        () => {
        }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      await MediaTestBase.clearRouter();
      console.info('afterEach case');
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_0100
        * @tc.name      : 001.test hls
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_0100', Level.LEVEL0,async (done: Function) => {
      await testVideoSeek(HTTP_PATH + 'videotest/720p_1m_index.m3u8', 247300, PLAY_TIME, done);
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_Separate_0100
        * @tc.name      : 001.test hls audio video separate
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_Separate_0100', Level.LEVEL0,async (done: Function) => {
      await testVideoSeek(HTTP_PATH + 'videotest/HLS/separates/sep.m3u8', 245500, PLAY_TIME, done);
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_AudioOnly_0100
        * @tc.name      : 001.test hls audio only
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_AudioOnly_0100', Level.LEVEL0,async (done: Function) => {
      await testVideoSeek(HTTP_PATH + 'videotest/audioOnly/output.m3u8', 40030, PLAY_TIME, done);
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_Variant_0100
        * @tc.name      : 001.test hls variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_Variant_0100', Level.LEVEL0,async (done: Function) => {
      await testVideoSeek(HTTP_PATH + 'videotest/a-variant/output.m3u8', 40030, PLAY_TIME, done);
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_AudioOff_0100
        * @tc.name      : 001.test hls variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_AudioOff_0100', Level.LEVEL0,async (done: Function) => {
      await testVideoSeek(HTTP_PATH + 'videotest/a-variant/output.m3u8', 40030, PLAY_TIME, done);
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_CodecChange_0100
        * @tc.name      : 001.test hls variant
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SEEK_CodecChange_0100', Level.LEVEL0,async (done: Function) => {
      await testVideoSeek(HTTP_PATH + 'videotest/a-variant/output.m3u8', 40030, PLAY_TIME, done);
      done();
    })
  })
}
    