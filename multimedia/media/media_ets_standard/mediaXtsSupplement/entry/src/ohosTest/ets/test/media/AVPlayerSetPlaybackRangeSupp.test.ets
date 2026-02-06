/*
 * Copyright (C) 2025-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep } from '../common';

const TAG = 'xts.AVPlayerSetPlaybackRangeSuppTest';
let avPlayer: media.AVPlayer;


async function getFdRead(pathName: string): Promise<number> {
  let fdReturn: number = 0;
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log(TAG,"pathName is " + path)
  await fileio.open(path).then((fdNumber) => {
    fdReturn = fdNumber;
    console.info(TAG,'[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: number) {
  await fileio.close(fdNumber);
}
async function setPlayBackRangeSupp(done: Function, testName: string,fileName:string,
  callback: () => void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'initialized':
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          callback();
          break;
        case 'prepared':
          console.info(TAG, testName, 'state prepared called');
          break;
        case 'playing':
          console.info(TAG, testName, 'state playing called');
          break;
        case 'paused':
          console.info(TAG, testName, 'state paused called');
          break;
        case 'completed':
          console.info(TAG, testName, 'state completed called');
          break;
        case 'stopped':
          console.info(TAG, testName, 'state stopped called');
          break;
      }
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(fileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer rawFileContent successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}
export default function AVPlayerSetPlaybackRangeSuppTest() {
  describe('AVPlayerSetPlaybackRangeSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      AppStorage.delete('empty');
      avPlayer?.release();
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_001
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_001', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_001';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CLOSEST)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_002
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_002', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_002';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_003
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_003', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_003';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_004
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_004', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_004';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_005
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_005', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_005';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_006
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_006', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_006';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_007
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_007', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_007';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_008
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_008', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_008';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_009
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_009', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_009';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_010
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_010', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_010';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_011
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_011', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_011';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_012
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_012', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_012';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_013
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_013', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_013';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_014
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_014', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_014';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_015
     * @tc.desc   AVPlayer_setMediaSource .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_015', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_015';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_016
     * @tc.desc   AVPlayer_setMediaSource .mp4 .mp4
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_016', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_016';
      let fileName: string = '1vp9_320x240_30.mp4';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0001
     * @tc.desc   AVPlayer_setMediaSource.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0001', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0001';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CLOSEST)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0002
     * @tc.desc   AVPlayer_setMediaSource 1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0002', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0002';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0003
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0003', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0003';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0004
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0004', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0004';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0005
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0005', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0005';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0006
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0006', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0006';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0007
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0007', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0007';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0008
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0008', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0008';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0009
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0009', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0009';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0010
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0010', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0010';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0011
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0011', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0011';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0012
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0012', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0012';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0013
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0013', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0013';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0014
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0014', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0014';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0015
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0015', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0015';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0016
     * @tc.desc   AVPlayer_setMediaSource .1h264_320x240_60.3gp
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0016', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_0016';
      let fileName: string = '1h264_320x240_60.3gp';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_01
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_01
     * @tc.desc   AVPlayer_setMediaSource.mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_01', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_01';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CLOSEST)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_02
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_02
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_02', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_02';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_03
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_03
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_03', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_03';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_04
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_04
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_04', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_04';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_05
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_05
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_05', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_05';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_06
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_06
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_06', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_06';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_07
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_07
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_07', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_07';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_08
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_08
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_08', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_08';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_09
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_09
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_09', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_09';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_10
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_10
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_10', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_10';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_11
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_11
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_11', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_11';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_12
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_12
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_12', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_12';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_13
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_13
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_13', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_13';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_14
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_14
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_14', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_14';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_15
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_15
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_15', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_15';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_16
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_16
     * @tc.desc   AVPlayer_setMediaSource mkv
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_16', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_16';
      let fileName: string = 'h261_352x288_30.mkv';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_17
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_17
     * @tc.desc   AVPlayer_setMediaSource.mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_17', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_17';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CLOSEST)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_18
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_18
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_18', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_18';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_19
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_19
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_19', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_19';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_20
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_20
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_20', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_20';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_21
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_21
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_21', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_21';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_22
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_22
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_22', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_22';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_23
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_23
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_23', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_23';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_24
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_24
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_24', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_24';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_25
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_25
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_25', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_25';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_26
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_26
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_26', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_26';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_27
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_27
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_27', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_27';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_28
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_28
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_28', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_28';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_30
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_30
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_30', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_30';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_31
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_31
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_31', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_31';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_32
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_32
     * @tc.desc   AVPlayer_setMediaSource mov
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_32', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_32';
      let fileName: string = 'h261_352x288_30.mov';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_33
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_33
     * @tc.desc   AVPlayer_setMediaSource.m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_33', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_33';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CLOSEST)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_34
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_34
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_34', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_34';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_35
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_35
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_35', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_35';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_36
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_36
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_36', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_36';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_37
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_37
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_37', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_37';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect().assertFail();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_38
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_38
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_38', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_38';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_39
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_39
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_39', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_39';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_40
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_40
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_40', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_40';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_41
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_41
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_41', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_41';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_42
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_42
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_42', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_42';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(5400102);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_43
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_43
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_43', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_43';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_44
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_44
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_44', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_44';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_45
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_45
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_45', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_45';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await sleep(200);
          await avPlayer.pause();
          await avPlayer.setPlaybackRange(0, 2000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_46
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_46
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_46', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_46';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_CONTINUOUS)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_47
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_47
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_47', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_47';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_NEXT_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_48
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_48
     * @tc.desc   AVPlayer_setMediaSource m4v
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_48', Level.LEVEL0,  (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_RANGE_48';
      let fileName: string = 'h264_320x240_60.m4v';
      setPlayBackRangeSupp(done, testName,fileName, async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackRange(0, 9000, media.SeekMode.SEEK_PREV_SYNC)
          console.info(TAG, testName,'Succeeded setPlaybackRange');
          done();
        } catch (error) {
          console.error(TAG, testName, "setPlaybackRange failed catch err:", JSON.stringify(error), error.code, error);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })
  })
}