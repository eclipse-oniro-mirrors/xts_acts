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
import HashMap from '@ohos.util.HashMap';
import MediaTestBase from './MediaTestBase';
import { sleep } from './AVPlayerTestBase';


export default function AVPlayerMediaSource() {
  let mediaTestBase = new MediaTestBase()
  let player: media.AVPlayer;
  let header: Record<string, string>;
  //const url_1a1v_mp4 = "http://8.138.194.43:1000/0221/H264/1a1v.mp4"
  //const url_flv = "http://8.138.194.43:1003/live/720p-2m.flv"
  const url_1a1v_mp4 = "http://xxx"
  const url_flv = "http://live-xxx.flv"
  describe('AVPlayerMediaSource', () => {
    beforeAll(async () => {
      header = {
        "User-Agent": "User-Agent-Value"
      };
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      player = await media.createAVPlayer();
    });
    afterEach(async () => {
      console.info('afterEach case');
      player.release();
    });
    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0101
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0101
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0101', Level.LEVEL0, async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      try{
        let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4);
        player.setMediaSource(mediaSource);
      } catch (error) {
        console.info('error happened,and error code is :' + error.message);
        expect(true).assertFalse();
      }
      await sleep(1000);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0102
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0102
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0102', Level.LEVEL0, async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      player.setMediaSource(mediaSource);
      await sleep(1000);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
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
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0200', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let mimeType = media.AVMimeTypes.APPLICATION_M3U8;
      mediaSource.setMimeType(mimeType);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0300
     * @tc.desc   flv live stream with createMediaSourceWithStreamData success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0300', Level.LEVEL0, async (done: Function) => {
      let streams : Array<media.MediaStream> = [];
      for (let i = 0; i < 5; i++) {
        streams.push({url:
        url_flv,
          width: 100 * (i + 1),
          height: 120 * (i + 1),
          bitrate: 1000000 * (i + 1)});
      }
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertTrue();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0400
     * @tc.desc   flv live stream with createMediaSourceWithStreamData return empty for exceed maxStreamNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0400', Level.LEVEL0, async (done: Function) => {
      let streams : Array<media.MediaStream> = [];
      const maxStreamNum = 10;
      for (let i = 0; i < maxStreamNum + 1; i++) {
        streams.push({url:
        url_flv,
          width: 100 * (i + 1),
          height: 120 * (i + 1),
          bitrate: 1000000 * (i + 1)});
      }
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertFalse();
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0500
     * @tc.desc   flv live stream with createMediaSourceWithStreamData return empty for empty MediaStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0500', Level.LEVEL0, async (done: Function) => {
      let streams : Array<media.MediaStream> = [];
      let mediaSource = media.createMediaSourceWithStreamData(streams);
      expect(mediaSource != undefined).assertFalse();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0600', Level.LEVEL0, async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
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
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0700
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0700
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0700', Level.LEVEL0, async (done: Function) => {
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      expect(mediaSource).not().assertUndefined()
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

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0800
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0800
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0800', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      try{
        let mediaSource = media.createMediaSourceWithUrl(undefined, header);
        expect(mediaSource).assertUndefined()
        console.info(' createMediaSourceWithUrl is Undefined')
        let mimeType = media.AVMimeTypes.APPLICATION_M3U8;
        mediaSource.setMimeType(mimeType);
      }catch(err){
        console.info('case media.createMediaSourceWithUr error code is' + err.code)
        expect(err.code).assertUndefined();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0900
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0900
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0900', Level.LEVEL0, async (done: Function) => {
      let avPlayer = await media.createAVPlayer()
      console.info(`createAVPlayer success`)
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      console.info(`createMediaSourceWithUrl success`)
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false
      };
      const initialized = new Promise<void>(resolve => {
        avPlayer.on("stateChange",(state: media.AVPlayerState) => {
          if(state == "initialized"){
            console.info(`avPlayer enter initialized state`)
            resolve()
          }
        })
        console.info(`set state listener`)
      })
      avPlayer?.on('error',(error: BusinessError) => {
        console.info(`setMediaSource failed - is expected, error: ${JSON.stringify(error)}`)
        expect(error.code).assertEqual(5400102)
        done();
      })
      avPlayer.url = url_1a1v_mp4
      console.info(`set url: ${url_1a1v_mp4}`)
      await initialized
      console.info(`start setMediaSource`)
      try {
        await avPlayer.setMediaSource(mediaSource, playStrategy).then(() => {
          console.error(`setMediaSource succeed - is not expected`)
          expect().assertFail()
        }).catch((error: BusinessError) => {
          console.info(`setMediaSource failed - is expected, error: ${JSON.stringify(error)}`)
          expect(error.code).assertEqual(5400102)
          done();
        });
      } catch (error) {}
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_1000
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_1000
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_1000', Level.LEVEL0, async (done: Function) => {
      let avPlayer = await media.createAVPlayer()
      let headers: Record<string, string> = {"User-Agent" : "User-Agent-Value"};
      let mediaSource : media.MediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4,  headers);
      let uuid: number = 1;
      let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false
      };
      let SourceCallbackCount: number = 0

      let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
        SourceCallbackCount++
        console.log(`Opening resource: ${request.url}`);
        uuid += 1;
        requests.set(uuid, request);
        return uuid;
      };

      let sourceReadCallback: media.SourceReadCallback = (uuid: number, requestedOffset: number, requestedLength: number) => {
        SourceCallbackCount++
        console.log(`Reading resource with handle ${uuid}, offset: ${requestedOffset}, length: ${requestedLength}`);
        avPlayer.release()
      };

      let sourceCloseCallback: media.SourceCloseCallback = (uuid: number) => {
        SourceCallbackCount++
        console.log(`Closing resource with handle ${uuid}`);
        requests.remove(uuid);
      };

      let resourceLoader: media.MediaSourceLoader = {
        open: sourceOpenCallback,
        read: sourceReadCallback,
        close: sourceCloseCallback
      };

      mediaSource.setMediaResourceLoaderDelegate(resourceLoader);
      console.log(`setMediaResourceLoaderDelegate success`)
      avPlayer.on("stateChange",async (state: media.AVPlayerState) => {
        console.info(`state change, current state is: ${state}`)
        if(state == "initialized"){
          console.info(`avPlayer enter initialized state`)
          avPlayer.prepare().then(() => {
            console.log(`avPlayer.prepare().then`)
          })
        }
        if(state == "prepared"){
          console.info(`avPlayer enter prepared state`)
        }
        if(state == "released"){
          console.info(`avPlayer enter released state`)
          await mediaTestBase.msleepAsync(1000)
          expect(SourceCallbackCount).assertEqual(3)
          done()
        }
      })
      avPlayer.setMediaSource(mediaSource, playStrategy)
      console.log(`setMediaSource success`)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0801
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0801
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0801', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      try{
        let mediaSource = media.createMediaSourceWithUrl(undefined, header);
        expect(mediaSource).assertUndefined()
        console.info(' createMediaSourceWithUrl is Undefined')
        let enable = true;
        mediaSource.enableOfflineCache(enable);
      }catch(err){
        console.info('case media.createMediaSourceWithUr error code is' + err.code)
        expect(err.code).assertUndefined();
      }
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0802
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0802
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0802', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      try{
        let mediaSource = media.createMediaSourceWithUrl(undefined, header);
        expect(mediaSource).assertUndefined()
        console.info(' createMediaSourceWithUrl is Undefined')
        let enable = false;
        mediaSource.enableOfflineCache(enable);
      }catch(err){
        console.info('case media.createMediaSourceWithUr error code is' + err.code)
        expect(err.code).assertUndefined();
      }
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0100
     * @tc.desc   Local Video create Media Source With Url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0100', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl("", header);
      expect(mediaSource != null).assertTrue();
      expect(mediaSource != undefined).assertTrue()
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0200
     * @tc.desc   Local Video create Media Source With Url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0200', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl(null, header);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithUrl url is null character')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0300
     * @tc.desc   Local Video create Media Source With Url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0300', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl(undefined, header);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithUrl url is undefined character')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0400
     * @tc.desc   Local Video create Media Source With Url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0400', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, null);
      expect(mediaSource != null).assertTrue();
      expect(mediaSource != undefined).assertTrue()
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0500
     * @tc.desc   Local Video create Media Source With Url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_URL_0500', Level.LEVEL0, async (done: Function) => {
      let header: Record<string, string> = {
        "User-Agent": "User-Agent-Value"
      };
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, undefined);
      expect(mediaSource != null).assertTrue();
      expect(mediaSource != undefined).assertTrue()
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_STREAM_DATA_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_STREAM_DATA_0100
     * @tc.desc   flv live stream with create Media Source With Stream Data success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_STREAM_DATA_0100', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithStreamData(null);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithStreamData is null')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_STREAM_DATA_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_STREAM_DATA_0200
     * @tc.desc   flv live stream with create Media Source With Stream Data Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_STREAM_DATA_0200', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithStreamData(undefined);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithStreamData is undefined')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0901
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0901
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0901', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: true,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0902
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0902
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0902', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_UNSUPPORTED
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0903
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0903
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0903', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_AUD
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0904
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0904
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0904', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_VID
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0905
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0905
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0905', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_SUBTITLE
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0906
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0906
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0906', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_ATTACHMENT
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0907
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0907
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0907', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_DATA
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0908
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0908
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0908', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_TIMED_METADATA
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0909
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0909
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0909', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        mutedMediaType: media.MediaType.MEDIA_TYPE_AUXILIARY
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0910
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0910
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0910', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        preferredAudioLanguage: ""
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0911
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0911
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0911', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        preferredSubtitleLanguage: ""
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0912
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0912
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0912', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: true
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0913
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0913
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0913', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        enableSuperResolution: true
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0914
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0914
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0914', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        enableSuperResolution: false
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0915
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0915
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0915', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        keepDecodingOnMute: true
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0916
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0916
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_FUNCTION_0916', Level.LEVEL0, async (done: Function) => {
      player.on('error', (error: BusinessError) => {
        console.info('error happened,and error message is :' + error.message);
        console.info('error happened,and error code is :' + error.code);
        expect(true).assertFalse();
      });
      console.info('AVPlayerMediaSource success');
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      let playStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        preferredBufferDurationForPlaying: 1,
        showFirstFrameOnPrepare: false,
        keepDecodingOnMute: false
      };
      player.setMediaSource(mediaSource, playStrategy);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0100
     * @tc.desc   Local Video create Media Source With Fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0100', Level.LEVEL0, async (done: Function) => {
      let fdObject: media.AVFileDescriptor = {
        fd: 0,
        offset: 0,
        length: 0
      };
      let mediaSource = media.createMediaSourceWithFd(fdObject);
      expect(mediaSource != null).assertTrue();
      expect(mediaSource != undefined).assertTrue()
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0200
     * @tc.desc   Local Video create Media Source With Fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0200', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithFd(null);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithFd is null')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0300
     * @tc.desc   Local Video create Media Source With Fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_FD_0300', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithFd(undefined);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithFd is undefined')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0100
     * @tc.desc   Local Video create Media Source With DataSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0100', Level.LEVEL0, async (done: Function) => {
      let dataSource: media.AVDataSrcDescriptor = {
        fileSize: 0,
        callback: (buffer: ArrayBuffer, length: number, pos?: number) => 0
      };
      let mediaSource = media.createMediaSourceWithDataSource(dataSource);
      expect(mediaSource != null).assertTrue();
      expect(mediaSource != undefined).assertTrue()
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0200
     * @tc.desc   Local Video create Media Source With DataSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0200', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithDataSource(null);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithDataSource is null')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0300
     * @tc.desc   Local Video create Media Source With DataSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_CREATE_MEDIA_SOURCE_WITH_DATA_SOURCE_0300', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithDataSource(undefined);
      expect(mediaSource).assertUndefined()
      console.info(' createMediaSourceWithDataSource is undefined')
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_GET_ID_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_GET_ID_0100
     * @tc.desc   Local Video get MediaSource ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_MEDIASOURCE_GET_ID_0100', Level.LEVEL0, async (done: Function) => {
      let mediaSource = media.createMediaSourceWithUrl(url_1a1v_mp4, header);
      expect(mediaSource).not().assertUndefined()
      let id = mediaSource.getID();
      expect(id).not().assertUndefined()
      expect(id.length).assertLarger(0)
      done();
    });
  })
}
