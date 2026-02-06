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
import router, { RouterOptions } from '@system.router'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

async function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`await sleep ${time} over...`)
  })
}

export default function hy_HttpPlayerFuncPromiseTesttest() {
  describe('HttpPlayerFuncPromiseTest', () => {
    const HTTP_SOURCE = 'http://192.168.8.161/httpplayer/h264-aac.mp4';
    const PLAY_TIME = 3000;
    const SEEK_TIME = 2100;
    const WIDTH_VALUE = 1920;
    const HEIGHT_VALUE = 1080;
    const DURATION_TIME = 247367;
    const DELTA_TIME = 1000;
    const NEXT_FRAME_TIME = 2100;
    const PREV_FRAME_TIME = 2100;
    let surfaceID = '';
    let videoPlayer: media.VideoPlayer;
    let arrayDescription: media.MediaDescription[];
    beforeAll(() => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await toNewPage();
      await msleep(1000).then(() => {
      }, failureCallback).catch(catchCallback);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      await router.clear();
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
    });

    let msleep = (ms?: number | undefined): Promise<void> => {
      return new Promise((resolve) => setTimeout(resolve, ms));
    }

    let failureCallback = (error: BusinessError) => {
      expect().assertFail();
      console.info(`case error called,errMessage is ${error.message}`);
    }

    let catchCallback = (error: BusinessError) => {
      expect().assertFail();
      console.info(`case error called,errMessage is ${error.message}`);
    }

    let toNewPage = async () => {
      let path = 'pages/surfaceTest/surfaceTest';
      let options: RouterOptions = {
        uri: path,
      };
      try {
        let result = await router.push(options);
      } catch {
        console.info('case route failed');
      }
    }

    let printfDescription = (obj: media.MediaDescription) => {
      let description = "";
      Object.keys(obj).forEach(i => {
        let property = obj[i];
        console.info('case key is  ' + i);
        console.info('case value is  ' + property);
        description += i + " = " + property + "\n";
      });
    }

    let checkSpeedTime = (videoPlayer: media.VideoPlayer, speedValue: number, startTime: number) => {
      let newTime = videoPlayer.currentTime;
      if (videoPlayer.state == 'playing') {
        switch (speedValue) {
          case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
            expect(newTime - startTime).assertClose(0.75 * 1000, DELTA_TIME);
            break;
          case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
            expect(newTime - startTime).assertClose(1000, DELTA_TIME);
            break;
          case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
            expect(newTime - startTime).assertClose(1.25 * 1000, DELTA_TIME);
            break;
          case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
            expect(newTime - startTime).assertClose(1.75 * 1000, DELTA_TIME);
            break;
          case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
            expect(newTime - startTime).assertClose(2 * 1000, DELTA_TIME);
            break;
        }
      } else {
        console.info('case speed not in play');
      }
    }

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0100
        * @tc.name      : 001.play (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0100', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        console.info('case setDisplaySurface success');
        expect(videoPlayer.state).assertEqual('idle');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        console.info('case prepare called!!');
        expect(videoPlayer.state).assertEqual('prepared');
        console.info('case prepare success ' + videoPlayer.duration);
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0200
        * @tc.name      : 002.pause (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0200', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        console.info('case setDisplaySurface success');
        expect(videoPlayer.state).assertEqual('idle');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        console.info('case prepare called!!');
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.pause().then(() => {
        expect(videoPlayer.state).assertEqual('paused');
        console.info('case pause called!!');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0300
        * @tc.name      : 003.pause->play (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0300', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.pause().then(() => {
        expect(videoPlayer.state).assertEqual('paused');
        console.info('case pause called!!');
      }, failureCallback).catch(catchCallback);
      startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        expect(videoPlayer.state).assertEqual('playing');
        console.info('case play called!!');
        await sleep(PLAY_TIME);
      }, failureCallback).catch(catchCallback);
      endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0400
        * @tc.name      : 004.stop (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0400', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.stop().then(() => {
        expect(videoPlayer.state).assertEqual('stopped');
        console.info('case stop called!!');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0500
        * @tc.name      : 005.reset (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0500', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.reset().then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case reset called!!');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0600
        * @tc.name      : 006.seek (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0600', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.seek(SEEK_TIME).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        console.info('case seek called!! ' + seekDoneTime);
        expect(seekDoneTime).assertEqual(PREV_FRAME_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0700
        * @tc.name      : 007.seek CLOSEST(promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0700', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        expect(seekDoneTime).assertEqual(NEXT_FRAME_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        expect(seekDoneTime).assertEqual(PREV_FRAME_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);

      await videoPlayer.seek(PREV_FRAME_TIME - 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        console.info('case seek called!! ' + seekDoneTime);
        expect(seekDoneTime).assertEqual(2000);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.seek(PREV_FRAME_TIME + 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        expect(seekDoneTime).assertEqual(2200);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.seek(NEXT_FRAME_TIME - 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        expect(seekDoneTime).assertEqual(2000);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.seek(NEXT_FRAME_TIME + 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        console.info('case seek called!! ' + seekDoneTime);
        expect(seekDoneTime).assertEqual(2200);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0800
        * @tc.name      : 008.setVolume (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0800', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.setVolume(1).then(() => {
        expect(videoPlayer.state).assertEqual('playing');
        console.info('case setVolume called');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0900
        * @tc.name      : 009.setSpeed (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_0900', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      startTime = videoPlayer.currentTime;
      await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then(async (speedMode) => {
        expect(videoPlayer.state).assertEqual('playing');
        await sleep(1000);
        expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
        console.info('case setSpeed called and speedMode is ' + speedMode);
      }, failureCallback).catch(catchCallback);
      endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(2 * 1000, DELTA_TIME);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_1000
        * @tc.name      : 010.getTrackDescription (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_1000', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        expect(videoPlayer.state).assertEqual('prepared');
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called!!');
        if (typeof (arrayList) != 'undefined') {
          arrayDescription = arrayList;
        } else {
          console.info('case getTrackDescription is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      for (let i = 0; i < arrayDescription.length; i++) {
        printfDescription(arrayDescription[i]);
      }
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_1100
        * @tc.name      : 011.Loop true (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_HTTP_FUNCTION_PROMISE_1100', Level.LEVEL0,async (done: Function) => {
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, failureCallback).catch(catchCallback);
      videoPlayer.url = HTTP_SOURCE;
      await videoPlayer.setDisplaySurface(surfaceID).then(() => {
        expect(videoPlayer.state).assertEqual('idle');
        console.info('case setDisplaySurface success');
      }, failureCallback).catch(catchCallback);
      await videoPlayer.prepare().then(() => {
        videoPlayer.loop = true;
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        console.info('case prepare called!!');
      }, failureCallback).catch(catchCallback);
      let startTime = videoPlayer.currentTime;
      await videoPlayer.play().then(async () => {
        expect(videoPlayer.loop).assertEqual(true);
        console.info('case play called!!');
        await sleep(PLAY_TIME);
        expect(videoPlayer.state).assertEqual('playing');
      }, failureCallback).catch(catchCallback);
      let endTime = videoPlayer.currentTime;
      expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
      await videoPlayer.seek(DURATION_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        expect(videoPlayer.state).assertEqual('playing');
        expect(seekDoneTime).assertEqual(DURATION_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, failureCallback).catch(catchCallback);
      await videoPlayer.release().then(() => {
        console.info('case release called!!');
      }, failureCallback).catch(catchCallback);
      done();
    });
  })
}