/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import { Hypium } from "../../../hypium/index";

export default function AVPlayerMediaSource() {
  let player: media.AVPlayer | undefined;
  let header: Record<string, string>;
  describe('AVPlayerMediaSource', () => {
    beforeAll(async () => {
      player = await media.createAVPlayer();
      header = {
        "User-Agent": "User-Agent-Value"
      };
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl("http://xxx", header);
      if (!mediaSource) {
        console.error("Failed to create media source");
        expect().assertFail();
        done();
      }
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false as boolean,
        preferredBufferDurationForPlaying: 1 as double,
        showFirstFrameOnPrepare: false as boolean
      };
      if (!player) {
        console.error("Failed to create AVPlayer");
        expect().assertFail();
        done();
      }
      player!!.setMediaSource(mediaSource!, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl("http://xxx", header);
      let mimeType = media.AVMimeTypes.APPLICATION_M3U8;
      mediaSource!!.setMimeType(mimeType);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0300
     * @tc.desc   flv live stream with createMediaSourceWithStreamData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
      let streams : Array<media.MediaStream> = [];
      for (let i = 0; i < 5; i++) {
        streams.push({url:
        "http://live-xxx.flv",
          width: 100 * (i + 1),
          height: 120 * (i + 1),
          bitrate: 1000000 * (i + 1)});
      }
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertTrue();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0400
     * @tc.desc   flv live stream with createMediaSourceWithStreamData return empty for exceed maxStreamNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
      let streams : Array<media.MediaStream> = [];
      const maxStreamNum = 10;
      for (let i = 0; i < maxStreamNum + 1; i++) {
        streams.push({url:
        "http://live-xxx.flv",
          width: 100 * (i + 1),
          height: 120 * (i + 1),
          bitrate: 1000000 * (i + 1)});
      }
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertFalse();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0500
     * @tc.desc   flv live stream with createMediaSourceWithStreamData return empty for empty MediaStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void) => {
      let streams : Array<media.MediaStream> = [];
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertFalse();
      done();
    });
  })
}
