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

import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import MediaTestBase from './MediaTestBase.test';
import { setSource } from './AVPlayerTestBase.test';
import { BusinessError, ErrorCallback } from '@ohos.base';
import { globalThis } from './Util.test';
import { audio } from '@kit.AudioKit';
import wf from '@ohos.wifiManager';
import Utils from './Util.test';

type PlaybackContentChangeFn = (url: string) => void;

let mediaTestBase = new MediaTestBase()
let avPlayer: media.AVPlayer | undefined;
let headers: Record<string, string> = {};
let isNetConnected: Boolean = false;
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';

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
    .catch((error) => {
      console.info('checkWifiState error: ' + JSON.stringify(error));
      return false;
    });
}

// create mediaSource
function createMediaSourceByUrl(url: string, headers?: Record<string, string>): media.MediaSource | undefined {
  return media.createMediaSourceWithUrl(url, headers);
}

function createMediaSourceByStreamData(url: string, headers?: Record<string, string>): media.MediaSource | undefined  {
  let streams : Array<media.MediaStream> = [];
  streams.push({url, width: 854, height: 480, bitrate: 800000});
  return media.createMediaSourceWithStreamData(streams);
}

async function handleState(state: string, operationRecord: Record<string, () => Promise<void>>) {
  switch (state) {
    case IDLE:
      if (operationRecord[IDLE]) {
        await operationRecord[IDLE]!();
      }
      break;
    case INITIALIZED:
      let surfaceID: string = globalThis.value;
      avPlayer!!.surfaceId = surfaceID;
      console.info(`case avPlayer.surfaceId is ${avPlayer!!.surfaceId}`);
      if (operationRecord[INITIALIZED]) {
        await operationRecord[INITIALIZED]!();
      }
      break;
    case PREPARED:
      if (operationRecord[PREPARED]) {
        await operationRecord[PREPARED]!();
      }
      console.info('case to play AVPlayer');
      avPlayer!!.play().then(() => {
        console.info(`case play AVPlayer success`);
      }).catch(mediaTestBase.catchCallback);
      break;
    case PLAYING:
      if (operationRecord[PLAYING]) {
        await operationRecord[PLAYING]!();
      }
      break;
    case PAUSED:
      if (operationRecord[PAUSED]) {
        await operationRecord[PAUSED]!();
      }
      break;
    case COMPLETED:
      if (operationRecord[COMPLETED]) {
        await operationRecord[COMPLETED]!();
      }
      break;
    case STOPPED:
      if (operationRecord[STOPPED]) {
        await operationRecord[STOPPED]!();
      }
      break;
    case RELEASED:
      if (operationRecord[RELEASED]) {
        await operationRecord[RELEASED]!();
      }
      break;
    case ERROR:
      if (operationRecord[ERROR]) {
        await operationRecord[ERROR]!();
      }
      break;
    default:
      break;
  }
}

async function testPlayList(operationRecord: Record<string, () => Promise<void>>, done: () => void,
  errorCallback?: ErrorCallback, contentChangeCallback?: PlaybackContentChangeFn) {
  avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
    waitForCompletion(async () => {
      console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
      await handleState(state.toString(), operationRecord);
    })
  });
  if (contentChangeCallback != undefined) {
    avPlayer!!.onPlaybackContentChanged(contentChangeCallback);
  }
  if (errorCallback != undefined) {
    avPlayer!!.onError(errorCallback);
  }
}

export default function AVPlayerPlayListTest() {
  describe('AVPlayerPlayListTest', () => {
    beforeAll(async () => {
      console.info('AVPlayerPlayListTest beforeAll case');
      headers = {
        "User-Agent": "User-Agent-Value"
      };
      isNetConnected = await checkWifiState();
      console.info('checkWifiState isNetConnected: ' + isNetConnected);
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
        if (typeof (video) != 'undefined') {
          console.info('case createAVPlayer success');
          avPlayer = video;
        } else {
          console.error('case createAVPlayer failed');
          expect().assertFail();
        }
      }).catch(mediaTestBase.catchCallback);
    });
    afterEach(async () => {
      await Utils.msSleep(1000);
      if (avPlayer != undefined) {
        avPlayer?.offPlaybackContentChanged((url: string) => {
          console.info('callback url: ' + url);
        });
        await avPlayer!!.release().then(() => {
          console.info('case release AVPlayer success');
        }).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      const idTest1 = await avPlayer?.addPlaybackMediaSource(mediaSource1).catch((error) => {
        expect().assertFail();
      });
      expect(idTest1).not().assertNull();
      const mediaSource2 = createMediaSourceByStreamData(url_flv, headers)!;
      const idTest2 = await avPlayer?.addPlaybackMediaSource(mediaSource1, idTest1).catch((error) => {
        expect().assertFail();
      });
      expect(idTest2).not().assertNull();
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource);
      await avPlayer?.addPlaybackMediaSource(mediaSource, "").catch((error: Error) => {
        expect((error as BusinessError).code).assertEqual(5400108);
        done();
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0300
     * @tc.desc   Verify that playList addPlaybackMediaSource fail when id is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource);
      await avPlayer?.addPlaybackMediaSource(mediaSource, "id_test").catch((error: Error) => {
        console.error("addPlaybackMediaSource fail, id is invalid1");
        expect((error as BusinessError).code).assertEqual(5400108);
        done();
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400
     * @tc.desc   Verify that playList addPlaybackMediaSource operation not allowed when state is not idle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      if (avPlayer) {
        avPlayer!.url = urlTest2;
      }
      const mediaSource = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource).catch((error: Error) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADDPLAYBACKMEDIASOURCE_0400 error: ' + JSON.stringify(error))
        expect((error as BusinessError).code).assertEqual(5400102);
        done();
      });
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      const idTest1 = await avPlayer?.addPlaybackMediaSource(mediaSource1)!;
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      await avPlayer?.removePlaybackMediaSource(idTest1);
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      const idTest1 = await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      await avPlayer?.removePlaybackMediaSource("").catch((error: Error) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect((error as BusinessError).code).assertEqual(5400108);
      });
      await avPlayer?.removePlaybackMediaSource("test_id").catch((error: Error) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect((error as BusinessError).code).assertEqual(5400108);
        done();
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300
     * @tc.desc   Verify that playList removeMediaSource without addMediaSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      await avPlayer?.removePlaybackMediaSource("test_id").catch((error: Error) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_REMOVEPLAYBACKMEDIASOURCE_0300 error: ' + JSON.stringify(error))
        expect((error as BusinessError).code).assertEqual(5400102);
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[IDLE as string] = async () => {
        done();
      }
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      await avPlayer?.clearPlaybackList().catch((error: Error) => {
        expect().assertFail();
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0100 error called, errMessage is ${error.message}`);
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200
     * @tc.desc   Verify that playList clearPlaybackList abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      await avPlayer?.clearPlaybackList().catch((error: Error) => {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_CLEARPLAYBACKLIST_0200 error called, errMessage is ${error.message}`);
        expect((error as BusinessError).code).assertEqual(5400102);
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers)!;
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETCURRENTMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400102);
        done();
      }
      await testPlayList(operationRecord, done, errCallback);
      let mediaSource = await avPlayer?.getCurrentMediaSource();
      expect(mediaSource).assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0100
     * @tc.desc   Verify that playList getMediaSources normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback: ErrorCallback  = mediaTestBase.failureCallback;
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest2, headers)!;
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_GETMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5400102);
        done();
      }
      await testPlayList(operationRecord, done, errCallback);
      let arr = await avPlayer?.getMediaSources();
      expect(arr?.length).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0100
     * @tc.desc   Verify that the playlist can set playlistLoopMode to PLAYLIST_LOOP_MODE_ALL loop normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      };
      operationRecord[PLAYING as string] = async () => {
        done();
      }
      let errCallback: ErrorCallback  = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.catchCallback);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2).catch(mediaTestBase.catchCallback);
      if (avPlayer) {
        avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_ALL;
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0200
     * @tc.desc   Verify that the playlist can set PLAYLIST_LOOP_MODE_ONE loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      };
      operationRecord[PLAYING as string] = async () => {
        done();
      }
      let errCallback: ErrorCallback  = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.catchCallback);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2).catch(mediaTestBase.catchCallback);
      if (avPlayer) {
        avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_ONE;
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0300
     * @tc.desc   Verify that the playlist can set PLAYLIST_LOOP_MODE_SHUFFLE loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      };
      operationRecord[PLAYING as string] = async () => {
        done();
      }
      let errCallback: ErrorCallback  = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.catchCallback);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2).catch(mediaTestBase.catchCallback);
      if (avPlayer) {
        avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_SHUFFLE;
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0400
     * @tc.desc   Verify that the playlist can set PLAYLIST_LOOP_MODE_NONE loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      };
      operationRecord[PLAYING as string] = async () => {
        done();
      }
      let errCallback: ErrorCallback  = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.catchCallback);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2).catch(mediaTestBase.catchCallback);
      if (avPlayer) {
        avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0500
     * @tc.desc   Verify that the playlist can switch loop mode functions correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYLISTLOOPMODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      };
      operationRecord[PLAYING as string] = async () => {
        if (avPlayer) {
          avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
        }
        done();
      }
      let errCallback: ErrorCallback  = (error: BusinessError) => {
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.catchCallback);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2).catch(mediaTestBase.catchCallback);
      if (avPlayer) {
        avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_ALL;
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100
     * @tc.desc   Verify that playList advanceToNextMediaSource normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord[PLAYING as string] = async () => {
        await avPlayer?.advanceToNextMediaSource().catch(mediaTestBase.catchCallback);
        done();
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200
     * @tc.desc   Verify that playList advanceToNextMediaSource abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0200";
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect((error as BusinessError).code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToNextMediaSource().catch((error: Error) => {
          console.info(testNum + 'advanceToNextMediaSource error: ' + JSON.stringify(error))
          expect((error as BusinessError).code).assertEqual(5400102);
          done();
        });
      }
      await testPlayList(operationRecord, done, errCallback);
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETONEXTMEDIASOURCE_0300";
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect((error as BusinessError).code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToNextMediaSource().catch((error: Error) => {
          console.info(testNum + 'advanceToNextMediaSource error: ' + JSON.stringify(error))
          expect((error as BusinessError).code).assertEqual(5400108);
          done();
        });
      }
      await testPlayList(operationRecord, done, errCallback);
      avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord[PLAYING as string] = async () => {
        await avPlayer?.advanceToPrevMediaSource().catch(mediaTestBase.catchCallback);
        done();
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREITEM_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1).catch(mediaTestBase.catchCallback);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2).catch(mediaTestBase.catchCallback);
      done();
    });

/**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200
     * @tc.desc   Verify that playList advanceToPrevMediaSource abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0200";
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect((error as BusinessError).code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToPrevMediaSource().catch((error: Error) => {
          console.info(testNum + 'advanceToPrevMediaSource error: ' + JSON.stringify(error))
          expect((error as BusinessError).code).assertEqual(5400108);
          done();
        });
      }
      await testPlayList(operationRecord, done, errCallback);
      avPlayer!.playlistLoopMode = media.PlaylistLoopMode.PLAYLIST_LOOP_MODE_NONE;
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testNum = "SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOPREVMEDIASOURCE_0300";
      let operationRecord: Record<string, () => Promise<void>> = {};
      let errCallback = (error: BusinessError) => {
        console.info(testNum + 'errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect((error as BusinessError).code).assertEqual(5411001);
          done();
        }
      };
      operationRecord['initialized'] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info(testNum + 'prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord['playing'] = async () => {
        await avPlayer?.advanceToPrevMediaSource().catch((error: Error) => {
          console.info(testNum + 'advanceToPrevMediaSource error: ' + JSON.stringify(error))
          expect((error as BusinessError).code).assertEqual(5400102);
          done();
        });
      }
      await testPlayList(operationRecord, done, errCallback);
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let id = "";
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord[PLAYING as string] = async () => {
        await avPlayer?.advanceToMediaSource(id).catch(mediaTestBase.catchCallback);
        done();
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0100 error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      id = await avPlayer?.addPlaybackMediaSource(mediaSource2)!;
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200
     * @tc.desc   Verify that playList advanceToMediaSource when id is null or invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord[PLAYING as string] = async () => {
        await avPlayer?.advanceToMediaSource("").catch((error: Error) => {
          expect((error as BusinessError).code).assertEqual(5400108);
        });
        await avPlayer?.advanceToMediaSource("test_id").catch((error: Error) => {
          expect((error as BusinessError).code).assertEqual(5400108);
          done();
        });
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0200 error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource2);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300
     * @tc.desc   Verify that playList advanceToMediaSource without add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      await avPlayer?.advanceToMediaSource("test_id").catch((error: Error) => {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_ADVANCETOMEDIASOURCE_0300 error called, errMessage is ${error.message}`);
        expect((error as BusinessError).code).assertEqual(5400102);
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
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let id = "";
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord[PLAYING as string] = async () => {
        await avPlayer?.advanceToMediaSource(id).catch(mediaTestBase.catchCallback);
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_PLAYBACKCONTENTCHANGE_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      let mediaSourceChangeCallback = (idCb: string) => {
        expect(idCb).assertEqual(id);
        done();
      }
      await testPlayList(operationRecord, done, errCallback, mediaSourceChangeCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource1);
      const mediaSource2 = createMediaSourceByUrl(urlTest1, headers)!;
      id = await avPlayer?.addPlaybackMediaSource(mediaSource2)!;
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100
     * @tc.desc   Verify that playList set audioRendererInfo normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        if (avPlayer) {
          avPlayer!.audioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
            rendererFlags: 0
          }
        }
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100 prepareCallback error: ' + JSON.stringify(error))
          if (!isNetConnected) {
            expect((error as BusinessError).code).assertEqual(5400102);
            done();
          }
        });
      }
      operationRecord[PLAYING as string] = async () => {
        done();
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0100 errorCallback error: ' + JSON.stringify(error))
        if (!isNetConnected) {
          expect(error.code).assertEqual(5411001);
          done();
        }
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200
     * @tc.desc   Verify that playList set audioRendererInfo normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        if (avPlayer) {
          avPlayer!.audioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_ALARM,
            rendererFlags: 0
          }
        }
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200 prepareCallback error: ' + JSON.stringify(error))
          expect((error as BusinessError).code).assertEqual(5400102);
          done();
        });
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_AUDIORENDERERINFO_0200 errorCallback error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5411001);
        done();
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource = createMediaSourceByUrl(urlTest1, headers)!;
      await avPlayer?.addPlaybackMediaSource(mediaSource);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100
     * @tc.desc   Verify that media sources can be dynamically added to or removed from the playlist during playback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let id1 = "";
      let operationRecord: Record<string, () => Promise<void>> = {};
      operationRecord[INITIALIZED as string] = async () => {
        await avPlayer?.prepare().catch((error: Error) => {
          console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100 prepareCallback error: ' + JSON.stringify(error))
          expect((error as BusinessError).code).assertEqual(5400102);
          done();
        });
      }
      operationRecord[PLAYING as string] = async () => {
        const mediaSource2 = createMediaSourceByUrl(urlTest2, headers)!;
        const id2 = await avPlayer?.addPlaybackMediaSource(mediaSource2, id1);
        await avPlayer?.removePlaybackMediaSource(id1);

        const mediaSource3 = createMediaSourceByUrl(urlTest3, headers)!;
        const id3 = await avPlayer?.addPlaybackMediaSource(mediaSource3, id2 as string);

        const mediaSource4 = createMediaSourceByStreamData(url_flv, headers)!;
        const id4 = await avPlayer?.addPlaybackMediaSource(mediaSource4, id1).catch((error: Error) => {
          expect((error as BusinessError).code).assertEqual(5400108);
          done();
        });
      }
      let errCallback = (error: BusinessError) => {
        console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PLAYLIST_DynamicAddOrRemove_0100 errorCallback error: ' + JSON.stringify(error))
        expect(error.code).assertEqual(5411001);
        done();
      };
      await testPlayList(operationRecord, done, errCallback);
      const mediaSource1 = createMediaSourceByUrl(urlTest1, headers)!;
      id1 = await avPlayer?.addPlaybackMediaSource(mediaSource1)!;
      done();
    });
  })
}