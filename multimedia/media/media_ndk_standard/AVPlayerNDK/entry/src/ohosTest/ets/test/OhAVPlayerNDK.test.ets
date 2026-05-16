/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import avplayer from 'libavplayerndk.so'
import fs from '@ohos.file.fs'
import Utils from './Utils';
import { BusinessError } from '@ohos.base';

const numberTrue = 1;
const numberFalse = 0;
// state;
const AV_IDLE = 0 //空闲;
const AV_INITIALIZED = 1 //初始化;
const AV_PREPARED = 2 //准备;
const AV_PLAYING = 3 //播放;
const AV_PAUSED = 4 //暂停;
const AV_STOPPED = 5 //停止;
const AV_COMPLETED = 6 //结束;
const AV_RELEASED = 7 //释放;
const AV_ERROR = 8 //错误;

// ErrCode;
const AV_ERR_OK = 0 //操作成功;
const AV_ERR_NO_MEMORY = 1 //无内存;
const AV_ERR_OPERATE_NOT_PERMIT = 2 //操作不允许;
const AV_ERR_INVALID_VAL = 3 //无效值;
const AV_ERR_IO = 4 //IO错误;
const AV_ERR_TIMEOUT = 5 //超时错误;
const AV_ERR_UNKNOWN = 6 //未知错误;
const AV_ERR_SERVICE_DIED = 7 //服务死亡;
const AV_ERR_INVALID_STATE = 8 //当前状态不支持此操作;
const AV_ERR_UNSUPPORT = 9 //未支持的接口;
const AV_ERR_EXTEND_START = 100 //扩展错误码初始值;

// Speed;
const AV_SPEED_FORWARD_0_75_X = 1 //0.75倍速播放;
const AV_SPEED_FORWARD_1_00_X = 2 //正常播放;
const AV_SPEED_FORWARD_1_25_X = 3 //1.25倍速播放;
const AV_SPEED_FORWARD_1_75_X = 4 //1.75倍速播放;
const AV_SPEED_FORWARD_2_00_X = 5 //2.0倍速播放;
const AV_SPEED_FORWARD_0_50_X = 6 //0.5倍速播放;
const AV_SPEED_FORWARD_1_50_X = 7 //1.5倍速播放;

const sleep500: number = 500;
const sleep1000: number = 1000;
const sleep1500: number = 1500;
const sleep2000: number = 2000;
const sleep5000: number = 5000;


function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}
export default function OhAVPlayerNDKTest() { // L2
  describe('OhAVPlayerNDKTest', () => {

    beforeAll(async () => {
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        context.resourceManager.getRawFileContent("testAV.mp4", (error, model_buffer) => {
          if (error) {
            console.log(
              `[rawfile_copy_to_sandbox] testAV.mp4 is
              copy failed:${error.code}, message: ${error.message}.`);
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] testAV.mp4 is copy success");
          }
        });
      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      await Utils.sleep(sleep2000);
    });
    beforeEach(async () => {
      let dir = getContext().filesDir + "/";

      let ml_face_model = dir + "testAV.mp4";
      await fs.stat(ml_face_model).then(async (res) => {
        if (res) {
          console.info("testAV.mp4 file exists");
          console.info(`testAV.mp4 size:${res.size}`);
        }
      }).catch((err: BusinessError) => {
        console.info("MindSporeDemo testAV.mp4 file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
      avplayer.OhAvPlayerCreate();
      avplayer.OhAvPlayerSetFdPathSource();
    });
    afterEach( async () => {
      avplayer.OhCloseFile();
      avplayer.OhAvPlayerRelease();
      await Utils.sleep(500);
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testOhAvPlayerPrepare001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERPREPARE_0100
     * @tc.desc   Prepare the playback environment and asynchronously cache media data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepare001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerPrepare001 test start `);
      try {
        let player: number = await avplayer.OhAvPlayerPrepare();
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerPrepare001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerPrepare001:${error}`);
      }
      console.info(`testOhAvPlayerPrepare001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetDuration001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETDURATION_0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetDuration001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetDuration001 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerGetDuration();
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetDuration001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetDuration001:${error}`);
      }
      console.info(`testOhAvPlayerGetDuration001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlay001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERPLAY_0100
     * @tc.desc   Start playing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlay001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetDuration001 test start `);
      try {
        let re: number = await avplayer.OhAvPlayerPrepare();
        expect(re).assertEqual(0);
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player :number = await avplayer.OhAvPlayerPlay();
        expect(player).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_PLAYING);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerPlay001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerPlay001:${error}`);
      }
      console.info(`testOhAvPlayerGetDuration001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIsPlaying001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERISPLAYING_0100
     * @tc.desc   Check if the player is playing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIsPlaying001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetDuration001 test start `);
      try {
        let re: number = await avplayer.OhAvPlayerPrepare();
        expect(re).assertEqual(0);
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        let player :number = await avplayer.OhAvPlayerPlay();
        expect(player).assertEqual(AV_ERR_OK);
        Utils.sleep(sleep500);
        player = await avplayer.OhAvPlayerIsPlaying();
        expect(player).assertEqual(numberTrue);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_PLAYING);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerIsPlaying001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerIsPlaying001:${error}`);
      }
      console.info(`testOhAvPlayerGetDuration001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPause001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERPAUSE_0100
     * @tc.desc   Pause playback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPause001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerPause001 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        await avplayer.OhAvPlayerPlay();
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerPause();
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerPause001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerPause001:${error}`);
      }
      console.info(`testOhAvPlayerPause001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetState001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETSTATE_0100
     * @tc.desc   Get the current playback status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetState001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetState001 test start `);
      try {
        let state : number = await avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_INITIALIZED);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetState001:${state}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetState001:${error}`);
      }
      console.info(`testOhAvPlayerGetState001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetPlaybackSpeed001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETPLAYBACKSPEED_0100
     * @tc.desc   Get the current player playback rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetPlaybackSpeed001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetPlaybackSpeed001 test start `);
      try {
        let re : number = await avplayer.OhAvPlayerGetPlaybackSpeed();
        expect(re).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `OhAvPlayerGetPlaybackSpeed:${re}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `OhAvPlayerGetPlaybackSpeed:${error}`);
      }
      console.info(`testOhAvPlayerGetPlaybackSpeed001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIsLooping001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERISLOOPING_0100
     * @tc.desc   Determine whether to play in a loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIsLooping001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerIsLooping001 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerIsLooping();
        expect(player).assertEqual(numberTrue);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerIsLooping001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerIsLooping001:${error}`);
      }
      console.info(`testOhAvPlayerIsLooping001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetCurrentTrack001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETCURRENTTRACK_0100
     * @tc.desc   Get the currently valid track index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetCurrentTrack001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetCurrentTrack001 test start `);
      try {
        let re : number = await avplayer.OhAvPlayerGetCurrentTrack();
        expect(re).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetCurrentTrack001:${re}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetCurrentTrack001:${error}`);
      }
      console.info(`testOhAvPlayerGetCurrentTrack001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetVideoHeight001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETVIDEOHEIGHT_0100
     * @tc.desc   Obtain video height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetVideoHeight001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetVideoHeight001 test start `);
      try {
        let re : number = await avplayer.OhAvPlayerGetVideoHeight();
        expect(re).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetVideoHeight001:${re}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetVideoHeight001:${error}`);
      }
      console.info(`testOhAvPlayerGetVideoHeight001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetVideoWidth001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETVIDEOWIDTH_0100
     * @tc.desc   Get video width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetVideoWidth001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetVideoWidth001 test start `);
      try {
        let re : number = await avplayer.OhAvPlayerGetVideoWidth();
        expect(re).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetVideoWidth001:${re}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerGetVideoWidth001:${error}`);
      }
      console.info(`testOhAvPlayerGetVideoWidth001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerDeselectTrack001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERDESELECTTRACK_0100
     * @tc.desc   Deselect the current audio or subtitle track.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerDeselectTrack001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerDeselectTrack001 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let re : number = await avplayer.OhAvPlayerDeselectTrack();
        expect(re).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerDeselectTrack001:${re}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerDeselectTrack001:${error}`);
      }
      console.info(`testOhAvPlayerDeselectTrack001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerDeselectTrack002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERDESELECTTRACK_0200
     * @tc.desc   Deselect the current audio or subtitle track.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerDeselectTrack002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerDeselectTrack002 test start `);
      try {
        let re : number = await avplayer.OhAvPlayerDeselectTrack();
        expect(re).assertEqual(3);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerDeselectTrack002:${re}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerDeselectTrack001:${error}`);
      }
      console.info(`testOhAvPlayerDeselectTrack002 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerReset001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERRESET_0100
     * @tc.desc   Restore the player to its initial state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerReset001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerReset001 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerReset();
        expect(player).assertEqual(AV_ERR_OK);
        let state: number = avplayer.OhAvPlayerGetState();
        // expect(state).assertEqual(AV_IDLE);
        expect(state).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerReset001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerReset001:${error}`);
      }
      console.info(`testOHAVPlayerReset001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSeek001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSEEK_0100
     * @tc.desc   SChange playback position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSeek001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSeek001 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSeek(300, 1);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSeek001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSeek001:${error}`);
      }
      console.info(`testOHAVPlayerSeek001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSeek002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSEEK_0200
     * @tc.desc   Change playback position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSeek002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSeek002 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSeek(600, 1);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSeek002:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSeek002:${error}`);
      }
      console.info(`testOHAVPlayerSeek002 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetCurrentTime001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETCURRENTTIME_0100
     * @tc.desc   Set the bitrate used by the HLS player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetCurrentTime001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerGetCurrentTime001 test start `);
      try {
        let result : number = await avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        result = await avplayer.OhAvPlayerPlay();
        expect(result).assertEqual(AV_ERR_OK);
        result = avplayer.OhAvPlayerGetCurrentTime();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSeek002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSeek002:${error}`);
      }
      console.info(`testOhAvPlayerGetCurrentTime001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectBitRate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0100
     * @tc.desc   Set the bitrate used by the HLS player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectBitRate001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectBitRate001 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSelectBitRate(0);
        expect(player).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate001:${error}`);
      }
      console.info(`testOHAVPlayerSelectBitRate001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectBitRate002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0200
     * @tc.desc   Set the bitrate used by the HLS player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectBitRate002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectBitRate002 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        let player : number = await avplayer.OhAvPlayerSelectBitRate(25000);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate002:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate002:${error}`);
      }
      console.info(`testOHAVPlayerSelectBitRate002 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectBitRate003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0300
     * @tc.desc   Set the bitrate used by the HLS player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectBitRate003', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectBitRate003 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSelectBitRate(100);
        expect(player).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate003:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate003:${error}`);
      }
      console.info(`testOHAVPlayerSelectBitRate003 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectBitRate004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0400
     * @tc.desc   Set the bitrate used by the HLS player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectBitRate004', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectBitRate004 test start `);
      try {
        let player: number = await avplayer.OhAvPlayerPrepare();
        expect(player).assertEqual(AV_ERR_OK);
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        player  = await avplayer.OhAvPlayerSelectBitRate(1000);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate004:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate004:${error}`);
      }
      console.info(`testOHAVPlayerSelectBitRate004 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectBitRate005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0500
     * @tc.desc   Set the bitrate used by the HLS player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectBitRate005', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectBitRate005 test start `);
      try {
        let player: number = await avplayer.OhAvPlayerPrepare();
        expect(player).assertEqual(AV_ERR_OK);
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        player = await avplayer.OhAvPlayerSelectBitRate(10000);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate005:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectBitRate005:${error}`);
      }
      console.info(`testOHAVPlayerSelectBitRate005 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectTrack001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTTRACK_0100
     * @tc.desc   Select audio or subtitle tracks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectTrack001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectTrack001 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSelectTrack(-1);
        expect(player).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack001:${error}`);
      }
      console.info(`testOHAVPlayerSelectTrack001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectTrack002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTTRACK_0200
     * @tc.desc   Select audio or subtitle tracks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectTrack002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectTrack002 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSelectTrack(0);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack002:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack002:${error}`);
      }
      console.info(`testOHAVPlayerSelectTrack002 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectTrack003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTTRACK_0300
     * @tc.desc   Select audio or subtitle tracks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectTrack003', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectTrack003 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSelectTrack(1);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack003:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack003:${error}`);
      }
      console.info(`testOHAVPlayerSelectTrack003 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectTrack004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTTRACK_0400
     * @tc.desc   Select audio or subtitle tracks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectTrack004', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectTrack004 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSelectTrack(2);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack004:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack004:${error}`);
      }
      console.info(`testOHAVPlayerSelectTrack004 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSelectTrack005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTTRACK_0500
     * @tc.desc   Select audio or subtitle tracks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSelectTrack005', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSelectTrack005 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSelectTrack(3);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack005:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSelectTrack005:${error}`);
      }
      console.info(`testOHAVPlayerSelectTrack005 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetLooping001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETLOOPING_0100
     * @tc.desc   Set loop playback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetLooping001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSetLooping001 test start `);
      try {
        let player: number = await avplayer.OhAvPlayerSetLooping(1);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetLooping001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetLooping001:${error}`);
      }
      console.info(`testOHAVPlayerSetLooping001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetLooping002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETLOOPING_0200
     * @tc.desc   Set loop playback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetLooping002', Level.LEVEL0,async (done: Function) => {
       console.info(`testOHAVPlayerSetLooping002 test start `);
      try {
        let player: number = await avplayer.OhAvPlayerSetLooping(0);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetLooping002:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetLooping002:${error}`);
      }
      console.info(`testOHAVPlayerSetLooping002 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlayerCallback001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYERCALLBACK_0100
     * @tc.desc   Set the player callback method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlayerCallback001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerSetPlayerCallback001 test start `);
      try {
        let player: number = await avplayer.OhAvPlayerSetPlayerCallback();
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetPlayerCallback001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetPlayerCallback001:${error}`);
      }
      console.info(`testOhAvPlayerSetPlayerCallback001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetPlaybackSpeed001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0100
     * @tc.desc   Set the player playback rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetPlaybackSpeed001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSetPlaybackSpeed001 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_0_75_X);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed001:${error}`);
      }
      console.info(`testOHAVPlayerSetPlaybackSpeed001 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetPlaybackSpeed002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0200
     * @tc.desc   Set the player playback rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetPlaybackSpeed002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSetPlaybackSpeed002 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_1_00_X);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed002:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed002:${error}`);
      }
      console.info(`testOHAVPlayerSetPlaybackSpeed002 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetPlaybackSpeed003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0300
     * @tc.desc   Set the player playback rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetPlaybackSpeed003', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSetPlaybackSpeed003 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_1_25_X);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed003:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed003:${error}`);
      }
      console.info(`testOHAVPlayerSetPlaybackSpeed003 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetPlaybackSpeed004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0400
     * @tc.desc   Set the player playback rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetPlaybackSpeed004', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSetPlaybackSpeed004 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_1_75_X);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed004:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed004:${error}`);
      }
      console.info(`testOHAVPlayerSetPlaybackSpeed004 test end `);
      done();
    });

    /**
     * @tc.name   testOHAVPlayerSetPlaybackSpeed005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0500
     * @tc.desc   Set the player playback rate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVPlayerSetPlaybackSpeed005', Level.LEVEL0,async (done: Function) => {
      console.info(`testOHAVPlayerSetPlaybackSpeed005 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        let player : number = await avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_2_00_X);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed005:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOHAVPlayerSetPlaybackSpeed005:${error}`);
      }
      console.info(`testOHAVPlayerSetPlaybackSpeed005 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVideoSurface001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVIDEOSURFACE_0100
     * @tc.desc   Set the playback screen window.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVideoSurface001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerSetVideoSurface001 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSetVideoSurface();
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVideoSurface001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVideoSurface001:${error}`);
      }
      console.info(`testOhAvPlayerSetVideoSurface001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolume001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0100
     * @tc.desc   Set the volume of the player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolume001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume001 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSetVolume(10, 0);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume001:${error}`);
      }
      console.info(`testOhAvPlayerSetVolume001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolume002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0200
     * @tc.desc   Set the volume of the player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolume002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume002 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSetVolume(30, 40);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume002:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume002:${error}`);
      }
      console.info(`testOhAvPlayerSetVolume002 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolume003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0300
     * @tc.desc   Set the volume of the player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolume003', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume003 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSetVolume(50, 60);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume003:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume003:${error}`);
      }
      console.info(`testOhAvPlayerSetVolume003 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolume004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0400
     * @tc.desc   Set the volume of the player.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolume004', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume004 test start `);
      try {
        let player : number = await avplayer.OhAvPlayerSetVolume(80, 90);
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume004:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerSetVolume004:${error}`);
      }
      console.info(`testOhAvPlayerSetVolume004 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerStop001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSTOP_0100
     * @tc.desc   Stop playing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerStop001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvPlayerStop001 test start `);
      try {
        await avplayer.OhAvPlayerPrepare();
        let state: number = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
        
        let player : number = await avplayer.OhAvPlayerStop();
        expect(player).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerStop001:${player}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvPlayerStop001:${error}`);
      }
      console.info(`testOhAvPlayerStop001 test end `);
      done();
    });

  });
}