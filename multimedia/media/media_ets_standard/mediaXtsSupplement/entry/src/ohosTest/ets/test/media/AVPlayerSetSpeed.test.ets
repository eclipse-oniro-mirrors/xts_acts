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

const TAG = 'MediaAVPlayerSetSPeed:';
let avPlayer: media.AVPlayer;

async function getFdRead(pathName: string): Promise<number> {
  let fdReturn: number = 0;
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log("pathName is " + path)
  await fileio.open(path).then((fdNumber) => {
    fdReturn = fdNumber;
    console.info('[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: number) {
  await fileio.close(fdNumber);
}

async function setSpeedTestPrepared(done: Function,testName:string,FileName:string,targetSpeed:media.PlaybackSpeed,
callback: (resSpeed:media.PlaybackSpeed)=>void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'prepared':
          console.info(TAG, testName, 'State is prepared. Setting speed to', targetSpeed);
          avPlayer.setSpeed(targetSpeed);
          console.info(TAG, testName, 'setSpeed success');
          break;
        case 'initialized':
          avPlayer?.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('speedDone', (currentSpeed: number) => {
      console.info(TAG, testName, `speedDone event received. Current speed is`,currentSpeed);
      callback(currentSpeed);
      avPlayer.release();
      closeFdNumber(rawFileContent);
      done();
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function setSpeedTestPlaying(done: Function,testName:string,FileName:string,targetSpeed:media.PlaybackSpeed,
  callback: (resSpeed:media.PlaybackSpeed)=>void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'playing':
          console.info(TAG, testName, 'State is playing. Setting speed to', targetSpeed);
          avPlayer.setSpeed(targetSpeed);
          console.info(TAG, testName, 'setSpeed success');
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('speedDone', (currentSpeed: number) => {
      console.info(TAG, testName, `speedDone event received. Current speed is`,currentSpeed);
      callback(currentSpeed);
      avPlayer.release();
      closeFdNumber(rawFileContent);
      done();
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function setSpeedTestPaused(done: Function,testName:string,FileName:string,targetSpeed:media.PlaybackSpeed,
  callback: (resSpeed:media.PlaybackSpeed)=>void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'paused':
          console.info(TAG, testName, 'State is playing. Setting speed to', targetSpeed);
          avPlayer.setSpeed(targetSpeed);
          console.info(TAG, testName, 'setSpeed success');
          break;
        case 'playing':
          avPlayer.pause();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('speedDone', (currentSpeed: number) => {
      console.info(TAG, testName, `speedDone event received. Current speed is`,currentSpeed);
      callback(currentSpeed);
      avPlayer.release();
      closeFdNumber(rawFileContent);
      done();
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

async function setSpeedTestCompleted(done: Function,testName:string,FileName:string,targetSpeed:media.PlaybackSpeed,
  callback: (resSpeed:media.PlaybackSpeed)=>void) {
  try {
    console.info(TAG, testName, "Creating AVPlayer...");
    avPlayer = await media.createAVPlayer();
    console.info(TAG, testName, "AVPlayer created successfully");
    avPlayer.on('stateChange', (state) => {
      console.info(TAG, testName, `State changed: `, state);
      switch (state) {
        case 'completed':
          console.info(TAG, testName, 'State is playing. Setting speed to', targetSpeed);
          avPlayer.setSpeed(targetSpeed);
          console.info(TAG, testName, 'setSpeed success');
          break;
        case 'paused':
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'playing':
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'prepared':
          avPlayer.play();
          console.info(TAG, testName, 'State is prepared. Ready for next operation.');
          break;
        case 'initialized':
          avPlayer.prepare();
          console.info(TAG, testName, 'State is initialized. Ready for next operation.');
          break;
        case 'idle':
          console.info(TAG, testName, 'State is idle. Ready for next operation.');
          break;
      }
    });
    avPlayer.on('speedDone', (currentSpeed: number) => {
      console.info(TAG, testName, `speedDone event received. Current speed is`,currentSpeed);
      callback(currentSpeed);
      avPlayer.release();
      closeFdNumber(rawFileContent);
      done();
    });
    avPlayer.on('error', (err) => {
      console.error(TAG, testName, "AVPlayer error event:", JSON.stringify(err), err.code);
    });
    let rawFileContent = await getFdRead(FileName);
    avPlayer.fdSrc = { fd: rawFileContent };
    console.info(TAG, testName, "AVPlayer prepared successfully");
  } catch (err) {
    console.error(TAG, testName, "Test failed:", JSON.stringify(err), err.code, err);
    expect().assertFail();
    avPlayer?.release();
    done();
  }
}

export default function AVPlayerSetSpeedTest() {
  describe('AVPlayerSetSpeedTest', () => {
    let avPlayer: media.AVPlayer;
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
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_001
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_001';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
      });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_002
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_002';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_003
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_003';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_004
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_004
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_004';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_005
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_005
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_005';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_006
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_006
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_006';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_007
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_007
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_007';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_008
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_008
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_008';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_009
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_009
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_009';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_010
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_010
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_010';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_011
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_011
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_011';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_012
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_012
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_012';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_013
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_013
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_013';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_014
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_014
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_014';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_015
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_015
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_015';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_016
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_016
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_016';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_017
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_017
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_017';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_018
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_018
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_018';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_019
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_019
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_019';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_020
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_020
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_020';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_021
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_021
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_021';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_022
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_022
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_022';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_023
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_023
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_023';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_024
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_024
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_024';
      const fileName: string = '1vp9_320x240_30.mp4';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_025
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_025
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_025';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_026
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_026
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_026';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_027
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_027
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_027';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_028
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_028
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_028';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_25_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_25_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });


    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_029
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_029
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_029';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_030
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_030
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_030';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_031
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_031
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_031';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_032
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_032
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_032';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_125_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_125_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);

        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_033
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_033
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_033';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_034
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_034
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_034';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_035
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_035
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_035';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_036
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_036
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_036';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_0_50_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_0_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_037
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_037
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_037';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_038
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_038
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_038';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_039
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_039
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_039';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_040
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_040
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_040';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_50_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_50_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_041
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_041
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_041';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_042
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_042
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_042';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_043
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_043
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_043';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_044
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_044
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_044';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_1_75_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_045
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_045
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_045';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestPrepared(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_046
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_046
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_046';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestPlaying(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_047
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_047
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_047';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestPaused(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_048
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_048
     * @tc.desc   Test setting playback speed
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_SET_SPEED_048';
      const fileName: string = '1libvpx_720x480_60.ts';
      let targetSpeed = media.PlaybackSpeed.SPEED_FORWARD_3_00_X
      await setSpeedTestCompleted(
        done, testName, fileName,
        media.PlaybackSpeed.SPEED_FORWARD_3_00_X,
        (res) => {
          expect(res).assertEqual(targetSpeed);
          console.info(TAG, testName, "setSpeed successfully",res,targetSpeed);
        });
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_001
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_001';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('bufferingUpdate', undefined as ESObject);
        console.info(TAG, testName, 'success to off bufferingUpdate');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_002
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_002';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('bufferingUpdate', null as ESObject);
        console.info(TAG, testName, 'success to off bufferingUpdate');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_003
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_BUFFER_ING_UPDATE_003';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('bufferingUpdate', "" as ESObject);
        console.info(TAG, testName, 'success to off bufferingUpdate');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_001
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_001';
      try {
        let avPlayer = await media.createAVRecorder();
        avPlayer.off('stateChange', null as ESObject);
        console.info(TAG, testName, 'success to off stateChange');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_002
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_002';
      try {
        let avPlayer = await media.createAVRecorder();
        avPlayer.off('stateChange', undefined as ESObject);
        console.info(TAG, testName, 'success to off stateChange');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_003
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_STATE_CHANGE_003';
      try {
        let avPlayer = await media.createAVRecorder();
        avPlayer.off('stateChange', "" as ESObject);
        console.info(TAG, testName, 'success to off stateChange');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_001
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_001';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('bitrateDone', null as ESObject);
        console.info(TAG, testName, 'success to off bitrateDone');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_002
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_002';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('bitrateDone', undefined as ESObject);
        console.info(TAG, testName, 'success to off bitrateDone');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_003
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_BITRATE_DONE_003';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('bitrateDone', "" as ESObject);
        console.info(TAG, testName, 'success to off bitrateDone');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_001
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_001';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('audioOutputDeviceChangeWithInfo', null as ESObject);
        console.info(TAG, testName, 'success to off audioOutputDeviceChangeWithInfo');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_002
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_002';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('audioOutputDeviceChangeWithInfo', undefined as ESObject);
        console.info(TAG, testName, 'success to off audioOutputDeviceChangeWithInfo');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_003
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_AUDIO_OUTPUT_DEVICE_CHANGE_WITH_INFO_003';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('audioOutputDeviceChangeWithInfo', "" as ESObject);
        console.info(TAG, testName, 'success to off audioOutputDeviceChangeWithInfo');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_001
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_001';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('amplitudeUpdate', null as ESObject);
        console.info(TAG, testName, 'success to off amplitudeUpdate');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_002
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_002';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('amplitudeUpdate', undefined as ESObject);
        console.info(TAG, testName, 'success to off amplitudeUpdate');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_003
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_AMPLITUDE_UPDATE_003';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('amplitudeUpdate', "" as ESObject);
        console.info(TAG, testName, 'success to off amplitudeUpdate');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_001
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_001
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_001';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('seiMessageReceived',[5], null as ESObject);
        console.info(TAG, testName, 'success to off seiMessageReceived');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_002
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_002
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_002';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('seiMessageReceived',[5], undefined as ESObject);
        console.info(TAG, testName, 'success to off seiMessageReceived');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_003
     * @tc.name   SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_003
     * @tc.desc   Test OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_AV_PLAYER_OFF_SEI_MESSAGE_RECEIVED_003';
      try {
        let avPlayer = await media.createAVPlayer();
        avPlayer.off('seiMessageReceived',[5] ,"" as ESObject);
        console.info(TAG, testName, 'success to off seiMessageReceived');
        expect(avPlayer !== undefined).assertTrue();
        done();
      } catch (err) {
        console.error(TAG,testName,'err:' ,JSON.stringify(err))
        expect().assertFail()
        done();
      }
    });
  })
}