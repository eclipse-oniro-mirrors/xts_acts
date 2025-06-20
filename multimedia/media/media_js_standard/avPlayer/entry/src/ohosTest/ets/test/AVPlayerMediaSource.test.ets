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

import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'


export default function AVPlayerMediaSource() {
  let player: media.AVPlayer;
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
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100
      * @tc.name      : 001.testMediaSource
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100', Level.LEVEL0,async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl("http://xxx", header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200
      * @tc.name      : 002.testMediaSource
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200', Level.LEVEL0,async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl("http://xxx", header);
      let mimeType = media.AVMimeTypes.APPLICATION_M3U8;
      mediaSource.setMimeType(mimeType);
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0300
      * @tc.name      : 003.testMediaSource
      * @tc.desc      : flv live stream with createMediaSourceWithStreamData success
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0300', Level.LEVEL0,async (done: Function) => {
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
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0400
      * @tc.name      : 004.testMediaSource
      * @tc.desc      : flv live stream with createMediaSourceWithStreamData return empty for exceed maxStreamNum
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0400', Level.LEVEL0,async (done: Function) => {
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
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0500
    * @tc.name      : 005.testMediaSource
    * @tc.desc      : flv live stream with createMediaSourceWithStreamData return empty for empty MediaStream
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0500', Level.LEVEL0,async (done: Function) => {
      let streams : Array<media.MediaStream> = [];
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertFalse();
      done();
    });

  /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600
    * @tc.name      : 006.testMediaSource
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
  */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600', Level.LEVEL0, async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl("http://xxx", header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false
      };
      try {
        player.on('error', (err: BusinessError) => {
        console.info('error happened,and error message is :' + err.message)
        console.info('error happened,and error code is :' + err.code)
        expect(err.code).assertEqual(401)
        });
        await player.reset();
        player.setMediaSource(undefined, playStrategy);
        player.off('error');
      } catch (error) {
        console.info('case SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600 error message is :' + error.message)
        console.info('case SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600 error code is :' + error.code)
      }
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0700
      * @tc.name      : 007.testMediaSource
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600', Level.LEVEL0, async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl("http://xxx", header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false
      };
      await player.reset();
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
      
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0800
      * @tc.name      : 008.testMediaSource
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
    */
      it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0800', Level.LEVEL0, async (done: Function) => {
        let header: Record<string, string> = {
          "User-Agent": "User-Agent-Value"
        };
        try{
          let mediaSource = media.createMediaSourceWithUrl(undefined, header);
          console.info('success createMediaSourceWithUrl')
          let mimeType = media.AVMimeTypes.APPLICATION_M3U8;
          mediaSource.setMimeType(mimeType);
        }catch(err){
          console.info('case media.createMediaSourceWithUr error code is' + err.code)
        }
        done();
      });
  })
}
