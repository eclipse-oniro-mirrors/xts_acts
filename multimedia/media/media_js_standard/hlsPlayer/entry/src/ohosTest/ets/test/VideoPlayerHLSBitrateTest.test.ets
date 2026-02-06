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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import MediaTestBase from './MediaTestBase';
import { BusinessError } from '@kit.BasicServicesKit';


async function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function videoPlayerHLSBitrateTest() {
  describe('VideoPlayerHLSBitrateTest.test', () => {
    const PLAY_TIME = 3000;
    let pageId = 0;
    let width = 0;
    let height = 0;
    let expectBitrateArray: number[] = [];
    let videoSizeArray: number[][] = [];
    let videoSizeId = -1;
    let bitrateArray: Array<number> = [];
    let avPlayer: media.AVPlayer
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
    let initAvPlayer = async (done: Function) => {
      await media.createAVPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          console.info('case createVideoPlayer success');
          avPlayer = video;
        } else {
          console.error('case createVideoPlayer failed');
          expect().assertFail();
          done();
        }
      }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

      avPlayer!.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
        switch (state) {
          case 'initialized':
            console.info('initialized prepared called');
            avPlayer.surfaceId = globalThis.value;
            break;
          case 'initialized':
            console.info('initialized prepared called');
            avPlayer.surfaceId = globalThis.value;
            break;
          default:
            console.info('unknown state :' + state);
            break;
        }
      })

      avPlayer?.on('videoSizeChange', (w, h) => {
        console.info('case videoSizeChanged  width: ' + w + ' height: ' + h + 'videoSizeId: ' + videoSizeId);
        width = w;
        height = h;
        if (videoSizeId >= 0 && videoSizeId < videoSizeArray.length &&
          w == videoSizeArray[videoSizeId][0] && h == videoSizeArray[videoSizeId][1]) {
          releaseVideoPlayer(done);
        }
      });
      avPlayer.on('availableBitrates', (bitrates: Array<number>) => {
        bitrateArray = bitrates;
        for (let i = 0; i < bitrateArray.length; i++) {
          console.info('case availableBitratesCollect bitrates: ' + bitrateArray[i]);
        }
      })
      avPlayer?.on('error', (err) => {
        console.error(`case error called, errMessage is ${err.message}`);
        expect().assertFail();
        avPlayer?.release();
        done();
      });
    }
    let setVideoUrl = async (url: string) => {
      console.info(`case media source url: ${url}`)
      avPlayer.url = url;
      // await sleep(200)
      // avPlayer.surfaceId = surfaceID;

      await sleep(200)
      await avPlayer?.prepare().then(() => {
        console.info('case prepare called');
      }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
      await sleep(200)
    }

    let playAndSetLoop = async (playTime: number) => {
      avPlayer.loop = true;
      let startTime = avPlayer?.currentTime;
      await avPlayer?.play().then(async () => {
        console.info('case play called');
        expect(avPlayer?.state).assertEqual('playing');
        await MediaTestBase.msleepAsync(playTime);
        console.info('case play done');
      }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
      let endTime = avPlayer?.currentTime;
      expect(endTime - startTime).assertClose(playTime, 1000);
    }
    let releaseVideoPlayer = async (done: Function) => {
      await avPlayer?.reset().then(() => {
        console.info('case reset called');
      }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);

      await avPlayer?.release().then(() => {
        console.info('case release called');
        done();
      }, MediaTestBase.failureCallback).catch(MediaTestBase.catchCallback);
    }

    let checkArray = (realArray: ESObject, expectArray: ESObject) => {
      expect(realArray.length).assertEqual(expectArray.length);
      for (let i = 0; i < expectArray.length; i++) {
        console.info('case expect ' + expectArray[i]);
        expect(realArray[i]).assertEqual(expectArray[i]);
      }
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_HLS_SET_BITRATE_0100
        * @tc.name      : 001.test hls set bitrate
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SelectBitrate_0100', Level.LEVEL0,async (done: Function) => {
      await initAvPlayer(done);
      await setVideoUrl('http://192.168.8.161/videotest/mix-index.m3u8');
      await playAndSetLoop(PLAY_TIME * 2);
      expectBitrateArray = [1000000, 5000000, 10000000];
      videoSizeArray = [[1280, 720], [1920, 1080], [3840, 2160]];
      checkArray(bitrateArray, expectBitrateArray);
      videoSizeId = 1;
      done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_HLS_SET_BITRATE_0200
        * @tc.name      : 001.test hls set bitrate
        * @tc.desc      : HLS Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HLS_SelectBitrate_0200', Level.LEVEL0,async (done: Function) => {
      await initAvPlayer(done);
      await setVideoUrl('http://192.168.8.161/videotest/mix-index.m3u8');
      await playAndSetLoop(PLAY_TIME);
      expectBitrateArray = [1000000, 5000000, 10000000];
      videoSizeArray = [[1280, 720], [1920, 1080], [3840, 2160]];
      checkArray(bitrateArray, expectBitrateArray);
      videoSizeId = videoSizeArray.length - 2;
      done();
    })
  })

}