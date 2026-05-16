/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import MediaTestBase from './MediaTestBase';
import { setSource } from './AVPlayerTestBase';
import { BusinessError, ErrorCallback } from '@kit.BasicServicesKit';
import { audio } from '@kit.AudioKit';
import wf from '@ohos.wifiManager';

type PlaybackContentChangeFn = (url: string) => void;

let mediaTestBase = new MediaTestBase()
let avPlayer: media.AVPlayer | null = null;
let headers: Record<string, string>;
let contentFn: PlaybackContentChangeFn | null = null;
let errCallback: ErrorCallback | null = null;
let isNetConnected: Boolean = false;
let operationRecord: Record<string, Function> = {};

// network.mp4
const urlTest1 = 'https:\/\/vd3.bdstatic.com\/mda-pdc2kmwtd2vxhiy4\/cae_h264\/1681502407203843413\/mda-pdc2kmwtd2vxhiy4.mp4';
// pre_download_network.mp4
const urlTest2 = 'https:\/\/vd3.bdstatic.com\/mda-nmh2004d24kf4bjh\/hd/h264\/1671326683061787710\/mda-nmh2004d24kf4bjh.mp4';
// pre_download_dash.mpd
const urlTest3 = 'https:\/\/hwposter-inland.hwcloudtest.cn\/AiMaxEngine\/DASH_LOCAL\/DASH_SDR_H264_LC\/DASH_SDR_H264_LC.mpd';
// xgplayer-demo-360p.flv
const url_flv = "https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/flv/xgplayer-demo-360p.flv";

// is wifi connected
async function checkWifiState(): Promise<boolean> {
  return wf.getLinkedInfo()
    .then((wifiLinkedInfo) => {
      return wifiLinkedInfo.connState === wf.ConnState.CONNECTED;
    })
    .catch((error: BusinessError) => {
      console.info('checkWifiState error: ' + JSON.stringify(error));
      return false;
    });
}

// create mediaSource
function createMediaSourceByUrl(url: string, headers?: Record<string, string>): media.MediaSource {
  return media.createMediaSourceWithUrl(url, headers);
}

function createMediaSourceByStreamData(url: string, headers?: Record<string, string>): media.MediaSource {
  let streams : Array<media.MediaStream> = [];
  streams.push({url, width: 854, height: 480, bitrate: 800000});
  return media.createMediaSourceWithStreamData(streams);
}

// set avplayer callback
async function setAVPlayerCallback(): Promise<void> {
  if (avPlayer == null) {
    console.info('avPlayer has not init');
    return;
  }
  // stateChange
  avPlayer.on('stateChange', async (state, reason) => {
    console.info('stateChange is called, current state = ' + state);
    switch (state) {
      case 'idle':
        await operationRecord['idle']?.();
        break;
      case 'initialized':
        await operationRecord['initialized']?.();
        break;
      case 'prepared':
        await avPlayer?.play();
        break;
      case 'playing':
        await operationRecord['playing']?.();
        break;
      case 'completed':
        break;
      default:
        console.info('setAVPlayerCallback AVPlayer state unknown called.');
        break;
    }
  });
  // error
  avPlayer.on('error', (err) => {
    if (errCallback) {
      errCallback(err);
    }
    avPlayer?.reset();
  });
  // playbackContentChange
  avPlayer.onPlaybackContentChanged((url: string) => {
    if (contentFn) {
      contentFn(url);
    }
  })
}

export default function AVPlayerPlayListTest() {
  describe('AVPlayerPlayListTest', () => {
    beforeAll(async () => {
      console.info('AVPlayerPlayListTest beforeAll case');
      headers = {
        "User-Agent": "User-Agent-Value"
      };
      isNetConnected = await checkWifiState();
      console.info('checkWifiState isNetConnected: ' + isNetConnected)
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      await media.createAVPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          avPlayer = video;
        } else {
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await setAVPlayerCallback();
    })
    afterEach(async () => {
      console.info('afterEach case');
      errCallback = null;
      contentFn = null;
      operationRecord = {};
      if (avPlayer != null) {
        avPlayer.offPlaybackContentChanged((url: string) => {
          console.info('callback url: ' + url);
        });
        await avPlayer.release().then(() => {
          avPlayer = null;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
    })
    afterAll(async () => {
      console.info('AVPlayerPlayListTest afterAll case');
    });

    /**
      * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0100
      * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0100
      * @tc.desc   Verify that playList can addPlaybackMediaSource normally.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      const idTest1 = await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.failureCallback);
      expect(idTest1 as string).not().assertNull();
      const mediaSource2 = createMediaSourceByStreamData(url_flv, headers);
      const idTest2 = await avPlayer?.addPlaybackMediaSource(mediaSource1, idTest1 as string).catch(mediaTestBase.failureCallback);
      expect(idTest2 as string).not().assertNull();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0200
     * @tc.desc   Verify that playList addPlaybackMediaSource fail when id is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource);
      await avPlayer?.addPlaybackMediaSource(mediaSource, "").catch((error: BusinessError) => {
        expect(error.code).assertEqual(5400108);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0300
     * @tc.desc   Verify that playList addPlaybackMediaSource fail when id is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource);
      await avPlayer?.addPlaybackMediaSource(mediaSource, "id_test").catch((error: BusinessError) => {
        console.error("addPlaybackMediaSource fail, id is invalid1");
        expect(error.code).assertEqual(5400108);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400
     * @tc.desc   Verify that playList addMediaSource operation not allowed when state is not idle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      if (avPlayer) {
        avPlayer.url = urlTest2;
      }
      const mediaSource = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource).catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400102);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0500
     * @tc.desc   Verify that playList addMediaSource with null params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      await avPlayer?.addPlaybackMediaSource(null).catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0500 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0600
     * @tc.desc   Verify that playList addMediaSource with undefined params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      await avPlayer?.addPlaybackMediaSource(undefined).catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0600 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0700
     * @tc.desc   Verify that playList addPlaybackMediaSource fail when id is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource = createMediaSourceByUrl(urlTest1, headers);
      let id = await avPlayer?.addPlaybackMediaSource(mediaSource, null);
      expect(id as string).not().assertNull();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0800
     * @tc.desc   Verify that playList addPlaybackMediaSource fail when id is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource = createMediaSourceByUrl(urlTest1, headers);
      let id = await avPlayer?.addPlaybackMediaSource(mediaSource, undefined);
      expect(id as string).not().assertNull();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0100
     * @tc.desc   Verify that playList removePlaybackMediaSource normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      const idTest1 = await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      await avPlayer?.removePlaybackMediaSource(idTest1).catch(mediaTestBase.failureCallback);
      expect(await avPlayer?.getMediaSources().length).assertEqual(1);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200
     * @tc.desc   Verify that playList removeMediaSource when id is null or invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      await avPlayer?.removePlaybackMediaSource("").catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400108);
      });
      await avPlayer?.removePlaybackMediaSource("test_id").catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400108);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300
     * @tc.desc   Verify that playList removeMediaSource without addMediaSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.removePlaybackMediaSource("test_id").catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400102);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0400
     * @tc.desc   Verify that playList removeMediaSource with null params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.removePlaybackMediaSource(null).catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0400 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0500
     * @tc.desc   Verify that playList removeMediaSource with undefined params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.removePlaybackMediaSource(undefined).catch((error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0500 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0100
     * @tc.desc   Verify that playList clearPlaybackList normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      operationRecord['idle'] = async () => {
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      await avPlayer?.clearPlaybackList().catch((error: BusinessError) => {
        expect().assertFail();
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0100 error called, errMessage is ${error.message}`);
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200
     * @tc.desc   Verify that playList clearPlaybackList abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.clearPlaybackList().catch((error: BusinessError) => {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200 error called, errMessage is ${error.message}`);
        expect(error.code).assertEqual(5400102);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0100
     * @tc.desc   Verify that playList getCurrentMediaSource normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      expect(await avPlayer?.getCurrentMediaSource()).not().assertNull();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0200
     * @tc.desc   Verify that playList getCurrentMediaSource operation not allowed when state is idle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400102);
        done();
      }
      let mediaSource = await avPlayer?.getCurrentMediaSource();
      expect(mediaSource).assertEqual(undefined);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0100
     * @tc.desc   Verify that playList getMediaSources normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = mediaTestBase.catchCallback;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      expect(await avPlayer?.getMediaSources().length).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0200
     * @tc.desc   Verify that playList getMediaSources operation not allowed when state is idle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400102);
        done();
      }
      let arr = await avPlayer?.getMediaSources();
      expect(arr).assertEqual(undefined);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0100
     * @tc.desc   Verify that the playlist can set playlistLoopMode to PLAYLIST_LOOP_MODE_ALL loop normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      if (avPlayer) {
        avPlayer.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_ALL;
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0200
     * @tc.desc   Verify that the playlist can set PLAYLIST_LOOP_MODE_ONE loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      if (avPlayer) {
        avPlayer.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_ONE;
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0300
     * @tc.desc   Verify that the playlist can set PLAYLIST_LOOP_MODE_SHUFFLE loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      if (avPlayer) {
        avPlayer.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_SHUFFLE;
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0400
     * @tc.desc   Verify that the playlist can set PLAYLIST_LOOP_MODE_NONE loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      if (avPlayer) {
        avPlayer.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0500
     * @tc.desc   Verify that the playlist can switch loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        if (avPlayer) {
          avPlayer.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
        }
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      if (avPlayer) {
        avPlayer.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_ALL;
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100
     * @tc.desc   Verify that playList advanceToNextMediaSource normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToNextMediaSource().catch(mediaTestBase.catchCallback);
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200
     * @tc.desc   Verify that playList advanceToNextMediaSource abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200";
      errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToNextMediaSource().catch((error: BusinessError) => {
          console.info(testNum + 'advanceToNextMediaSource error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400102);
          done();
        });
      }
      avPlayer!.url = urlTest1;
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0300
     * @tc.desc   Verify that playList advanceToNextMediaSource abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0300";
      errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToNextMediaSource().catch((error: BusinessError) => {
          console.info(testNum + 'advanceToNextMediaSource error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400108);
          done();
        });
      }
      avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100
     * @tc.desc   Verify that playList advanceToPrevMediaSource normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToPrevMediaSource().catch(mediaTestBase.catchCallback);
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200
     * @tc.desc   Verify that playList advanceToPrevMediaSource abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200";
      errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToPrevMediaSource().catch((error: BusinessError) => {
          console.info(testNum + 'advanceToPrevMediaSource error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400108);
          done();
        });
      }
      avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0300
     * @tc.desc   Verify that playList advanceToPrevMediaSource abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0300";
      errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToPrevMediaSource().catch((error: BusinessError) => {
          console.info(testNum + 'advanceToPrevMediaSource error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400102);
          done();
        });
      }
      avPlayer!.url = urlTest1;
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100
     * @tc.desc   Verify that playList advanceToMediaSource normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100 error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToMediaSource(id).catch(mediaTestBase.catchCallback);
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      const id = await avPlayer?.addPlaybackMediaSource(mediaSource2);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200
     * @tc.desc   Verify that playList advanceToMediaSource when id is null or invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToMediaSource("").catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200 advanceToMediaSource null error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400108);
        });
        await avPlayer?.advanceToMediaSource("test_id").catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200 advanceToMediaSource invalid error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400108);
          done();
        });
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300
     * @tc.desc   Verify that playList advanceToMediaSource without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.advanceToMediaSource("test_id").catch((error: BusinessError) => {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300 error called, errMessage is ${error.message}`);
        expect(error.code).assertEqual(5400102);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0400
     * @tc.desc   Verify that playList advanceToMediaSource without null params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.advanceToMediaSource(null).catch((error: BusinessError) => {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0400 error called, errMessage is ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0500
     * @tc.desc   Verify that playList advanceToMediaSource without undefined params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await avPlayer?.advanceToMediaSource(undefined).catch((error: BusinessError) => {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0500 error called, errMessage is ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100
     * @tc.desc   Verify that playList playbackContentChange normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      }
      contentFn = (idCb: string) => {
        expect(idCb).assertEqual(id);
        done();
      }
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToMediaSource(id).catch(mediaTestBase.catchCallback);
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
      const id = await avPlayer?.addPlaybackMediaSource(mediaSource2);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100
     * @tc.desc   Verify that playList set audioRendererInfo normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      }
      operationRecord['initialized'] = async () => {
        if (avPlayer) {
          avPlayer.audioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
            rendererFlags: 0
          }
        }
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        done();
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200
     * @tc.desc   Verify that playList set audioRendererInfo normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200 errorCallback error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5411001);
        done();
      };
      operationRecord['initialized'] = async () => {
        if (avPlayer) {
          avPlayer.audioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_ALARM,
            rendererFlags: 0
          }
        }
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200 prepareCallback error: ' + JSON.stringify(error))
          expect(error.code).assertEqual(5400102);
          done();
        });
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100
     * @tc.desc   Verify that media sources can be dynamically added to or removed from the playlist during playback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      }
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: BusinessError) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect(error.code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        const mediaSource2 = createMediaSourceByUrl(urlTest2, headers);
        const id2 = await avPlayer?.addPlaybackMediaSource(mediaSource2, id1).catch(mediaTestBase.catchCallback);
        await avPlayer?.removePlaybackMediaSource(id1).catch(mediaTestBase.failureCallback);

        const mediaSource3 = createMediaSourceByUrl(urlTest3, headers);
        const id3 = await avPlayer?.addPlaybackMediaSource(mediaSource3, id2 as string).catch(mediaTestBase.catchCallback);

        const mediaSource4 = createMediaSourceByStreamData(url_flv, headers);
        const id4 = await avPlayer?.addPlaybackMediaSource(mediaSource4, id1).catch((error: BusinessError) => {
          expect(error.code).assertEqual(5400108);
          done();
        });
      }
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers);
      const id1 = await avPlayer?.addPlaybackMediaSource(mediaSource1);
    });
  })
}