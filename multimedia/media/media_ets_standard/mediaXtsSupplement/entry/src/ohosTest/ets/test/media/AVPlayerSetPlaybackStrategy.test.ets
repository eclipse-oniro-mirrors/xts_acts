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
import fileio from '@ohos.fileio'

const TAG = 'xts.AVPlayerSetPlayBackStrategyTest';
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
async function setPlayBackStrategy(done: Function, testName: string,fileName:string,
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

export default function AVPlayerSetPlayBackStrategySuppTest() {
  describe('AVPlayerSetPlayBackStrategySuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty', '');
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
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_001
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_001';
      setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
      try {
        let playStrategy : media.PlaybackStrategy = {
          preferredWidth: 1,
          preferredHeight: 2,
          preferredBufferDuration: 3,
          preferredHdr: false,
          mutedMediaType: media.MediaType.MEDIA_TYPE_AUD,
          preferredBufferDurationForPlaying: 1,
          thresholdForAutoQuickPlay: 5
        };
        await avPlayer.setPlaybackStrategy(playStrategy);
        console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
        avPlayer?.release();
        done();
      } catch (err) {
        console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
        expect().assertFail();
        avPlayer?.release();
        done();
      }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_002
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_002';
      setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
      try {
        await avPlayer.setPlaybackStrategy(null);
        console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
        avPlayer?.release();
        done();
      } catch (err) {
        console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
        expect(err.code).assertEqual(401);
        avPlayer?.release();
        done();
      }
    })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_003
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_003';
      setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
        try {
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_004
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_004', Level.LEVEL0, async (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_004';
    setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
      try {
        let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
        await avPlayer.setPlaybackStrategy(playStrategy);
        console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
        avPlayer?.release();
        done();
      } catch (err) {
        console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
        expect(err.code).assertEqual(401);
        avPlayer?.release();
        done();
      }
    })
  })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_005
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_005';
      setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_006
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_006';
      setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_007
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_007';
      setPlayBackStrategy (done, testName,'1vp9_320x240_30.mp4', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_008
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_008';
      setPlayBackStrategy (done, testName,'1h264_320x240_60.3gp', async () => {
        try {
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_009
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_009';
      setPlayBackStrategy (done, testName,'1h264_320x240_60.3gp', async () => {
        try {
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_010
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_010';
      setPlayBackStrategy (done, testName,'1h264_320x240_60.3gp', async () => {
        try {
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_011
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_011';
      setPlayBackStrategy (done, testName,'1h264_320x240_60.3gp', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_012
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_012';
      setPlayBackStrategy (done, testName,'1h264_320x240_60.3gp', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_013
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_013';
      setPlayBackStrategy (done, testName,'1h264_320x240_60.3gp', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_014
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_014';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mkv', async () => {
        try {
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_015
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_015';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mkv', async () => {
        try {
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_016
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_016';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mkv', async () => {
        try {
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_017
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_017
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_017';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mkv', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_018
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_018
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_018';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mkv', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_019
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_019
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_019';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mkv', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_020
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_020
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_020';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mov', async () => {
        try {
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_021
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_021
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_021';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mov', async () => {
        try {
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_022
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_022
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_022';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mov', async () => {
        try {
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_023
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_023
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_023';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mov', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_024
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_024
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_024';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mov', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_025
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_025
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_025';
      setPlayBackStrategy (done, testName,'h261_352x288_30.mov', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_026
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_026
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_026';
      setPlayBackStrategy (done, testName,'h264_320x240_60.m4v', async () => {
        try {
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_027
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_027
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_027';
      setPlayBackStrategy (done, testName,'h264_320x240_60.m4v', async () => {
        try {
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_028
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_028
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_028';
      setPlayBackStrategy (done, testName,'h264_320x240_60.m4v', async () => {
        try {
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_029
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_029
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_029';
      setPlayBackStrategy (done, testName,'h264_320x240_60.m4v', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(null);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_030
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_030
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_030';
      setPlayBackStrategy (done, testName,'h264_320x240_60.m4v', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          await avPlayer.setPlaybackStrategy(undefined);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_031
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_031
     * @tc.desc   AVPlayer_setPlaybackStrategy
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_PLAY_BACK_STRATEGY_031';
      setPlayBackStrategy (done, testName,'h264_320x240_60.m4v', async () => {
        try {
          await avPlayer.prepare();
          await avPlayer.play();
          await avPlayer.stop();
          let playStrategy : media.PlaybackStrategy = AppStorage.get('empty')as ESObject
          await avPlayer.setPlaybackStrategy(playStrategy);
          console.info(TAG, testName, "AVPlayer setPlaybackStrategy successfully");
          avPlayer?.release();
          done();
        } catch (err) {
          console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
          expect(err.code).assertEqual(401);
          avPlayer?.release();
          done();
        }
      })
    })
  })
}