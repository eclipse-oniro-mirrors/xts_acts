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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
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

const sleep200: number = 200;
const sleep500: number = 500;
const sleep1000: number = 1000;
const sleep1500: number = 1500;
const sleep2000: number = 2000;
const sleep5000: number = 5000;

const avPlayerFiles: string[] = [
  'testAV.mp4',
  'testAV1.mp4',
  'testAV2.mp4',
  'testAV3.mp4',
  'testAV4.mp4',
  'testAV5.mp4',
  'testAV6.mp4',
  'testAV7.mp4',
  'testAV8.mp4',
];

function copyAllFile(): boolean {
  for (let i: number = 0; i < avPlayerFiles.length; i++) {
    let fileName: string = avPlayerFiles[i];
    try {
      let context = getContext();
      let dir = context.filesDir + '/';
      let ml_face_model_file = dir + fileName;
      context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
        if (error) {
          console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy failed:${error.code}, message: ${error.message}.`);
        } else {
          let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy success`);
        }
      });
      console.info('[rawfile_copy_to_sandbox] sandbox path:' + dir);
    } catch (error) {
      console.info('[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
    }
  }
  return true;
}

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

function copyFileToSandox(fileName: string) {
  let context = getContext();
  let dir = context.filesDir + "/";
  try {
    let ml_face_model_file = dir + fileName;
    console.log(`ml_face_model_file`, ml_face_model_file);
    context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
      if (error) {
        console.log(
          `[rawfile_copy_to_sandbox] ${fileName} is
              copy failed:${error.code}, message: ${error.message}.`);
      } else {
        let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(file.fd, model_buffer.buffer);
        fs.closeSync(file);
        console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy success`);
      }
    });
  } catch (error) {
    console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
  }
}

export default function OhAVPlayerNDKOtherTest() {

  describe('OhAVPlayerNDKPlayerListTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await copyAllFile();
      await Utils.sleep(sleep5000);
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case ');
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERLIST_0100
     * @tc.name       : testOhAvPlayerList001
     * @tc.desc       : Test Playlist
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testOhAvPlayerList001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerList001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      for (let index: number = 0; index < avPlayerFiles.length; index++) {
        let state: number = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_IDLE);

        result = avplayer.OhAvPlayerSetFdPathIndex(index);
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_INITIALIZED);

        result = await avplayer.OhAvPlayerPrepare();
        if (result !== 0) {
          result = await avplayer.OhAvPlayerReset();
          expect(result).assertEqual(AV_ERR_OK);
          await Utils.sleep(sleep1000);
          continue;
        }
        expect(result).assertEqual(AV_ERR_OK);

        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_PREPARED);

        result = avplayer.OhAvPlayerPlay();
        expect(result).assertEqual(AV_ERR_OK);

        state = await avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_PLAYING);

        result = await avplayer.OhAvPlayerStop();
        expect(result).assertEqual(AV_ERR_OK);
        state = await avplayer.OhAvPlayerGetState();
        expect(state === AV_STOPPED || state === AV_COMPLETED).assertTrue();

        result = await avplayer.OhCloseFile();
        expect(result).assertEqual(AV_ERR_OK);

        result = await avplayer.OhAvPlayerReset();
        expect(result).assertEqual(AV_ERR_OK);
        await Utils.sleep(sleep1000);
        console.info(`current index: `, index);
      }
      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerList001 test end `);
      done();
    });
  });

  describe('OhAVPlayerNDKStateTest', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      await avplayer.OhAvPlayerRelease();
      console.info('afterEach case');
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
      // L0 L1;
    });

    /**
     * create-setFD-prepare-play-pause-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0100
     * @tc.name       : testGetAVPlayerNormalProcess001
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess001', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess001 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PAUSED);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess001 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-pause-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0200
     * @tc.name       : testGetAVPlayerNormalProcess002
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess002', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess002 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PAUSED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess002 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0300
     * @tc.name       : testGetAVPlayerNormalProcess003
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess003', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess003 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess003 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0400
     * @tc.name       : testGetAVPlayerNormalProcess004
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess004', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess004 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess004 test end `);
      done();
    });

    /**
     * create-setFD-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0500
     * @tc.name       : testGetAVPlayerNormalProcess005
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess005', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess005 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess005 test end `);
      done();
    });

    /**
     * create-setFD-prepare-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0600
     * @tc.name       : testGetAVPlayerNormalProcess006
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess006', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess006 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess006 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-stop-reset-setFD-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERNORMALPROCESS_0700
     * @tc.name       : testGetAVPlayerNormalProcess007
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAVPlayerNormalProcess007', 0, async (done: Function) => {
      console.info(`testGetAVPlayerNormalProcess007 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerNormalProcess007 test end `);
      done();
    });

    /**
     * create-setFD-play-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0100
     * @tc.name       : testGetAVPlayerAbnormal001
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal001', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal001 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_INITIALIZED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal001 test end `);
      done();
    });

    /**
     * create-setFD-prepare-pause-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0200
     * @tc.name       : testGetAVPlayerAbnormal002
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal002', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal002 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_PREPARED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal002 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-stop-pause-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0300
     * @tc.name       : testGetAVPlayerAbnormal003
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal003', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal003 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);
      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal003 test end `);
      done();
    });

    /**
     * create-setFD-prepare-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0400
     * @tc.name       : testGetAVPlayerAbnormal004
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal004', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal004 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal004 test end `);
      done();
    });

    /**
     * create-setFD-pause-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0500
     * @tc.name       : testGetAVPlayerAbnormal005
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal005', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal005 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_INITIALIZED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal005 test end `);
      done();
    });

    /**
     * create-setFD-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0600
     * @tc.name       : testGetAVPlayerAbnormal006
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal006', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal006 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_INITIALIZED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal006 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-stop-setFD-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0700
     * @tc.name       : testGetAVPlayerAbnormal007
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal007', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal007 test start `);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal007 test end `);
      done();
    });

    /**
     * create-prepare-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0800
     * @tc.name       : testGetAVPlayerAbnormal008
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal008', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal008 test start `);

      let result: number = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      console.info(`testGetAVPlayerAbnormal008 test end `);
      done();
    });

    /**
     * create-play-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_0900
     * @tc.name       : testGetAVPlayerAbnormal009
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal009', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal009 test start `);

      let result: number = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      console.info(`testGetAVPlayerAbnormal009 test end `);
      done();
    });

    /**
     * create-pause-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_1000
     * @tc.name       : testGetAVPlayerAbnormal010
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal010', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal010 test start `);

      let result: number = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      console.info(`testGetAVPlayerAbnormal010 test end `);
      done();
    });

    /**
     * create-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_1100
     * @tc.name       : testGetAVPlayerAbnormal011
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal011', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal011 test start `);

      let result: number = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(3);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      console.info(`testGetAVPlayerAbnormal011 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-pause-stop-play-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_1200
     * @tc.name       : testGetAVPlayerAbnormal011
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal012', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal012 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerPause();
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PAUSED);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal012 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-stop-play-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_1300
     * @tc.name       : testGetAVPlayerAbnormal013
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal013', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal013 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal013 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-pause-prepare-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_1400
     * @tc.name       : testGetAVPlayerAbnormal014
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal014', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal014 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPause();
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PAUSED);
      
      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal014 test end `);
      done();
    });
    /**
     * create-setFD-prepare-play-prepare-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERABNORMAL_1500
     * @tc.name       : testGetAVPlayerAbnormal015
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAVPlayerAbnormal015', 0, async (done: Function) => {
      console.info(`testGetAVPlayerAbnormal015 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_INVALID_VAL);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerAbnormal015 test end `);
      done();
    });

  });

  describe('OhAVPlayerNDKAttributeTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      copyFileToSandox("testAV.mp4");
      copyFileToSandox("test2.mp4");
      await Utils.sleep(sleep5000);
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await Utils.sleep(sleep1500);
    });
    afterAll(() => {

      console.info('afterAll case ');
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0100
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed001
     * @tc.desc       : Set the player playback rate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetPlaybackSpeed001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetPlaybackSpeed001 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_0_75_X);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSetPlaybackSpeed001 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0200
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed002
     * @tc.desc       : Set the player playback rate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetPlaybackSpeed002', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetPlaybackSpeed002 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_1_00_X);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSetPlaybackSpeed002 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0300
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed003
     * @tc.desc       : Set the player playback rate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetPlaybackSpeed003', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetPlaybackSpeed003 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_1_25_X);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSetPlaybackSpeed003 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0400
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed004
     * @tc.desc       : Set the player playback rate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetPlaybackSpeed004', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetPlaybackSpeed004 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_1_75_X);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSetPlaybackSpeed004 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYBACKSPEED_0500
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed005
     * @tc.desc       : Set the player playback rate.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetPlaybackSpeed005', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetPlaybackSpeed005 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetPlaybackSpeed(AV_SPEED_FORWARD_2_00_X);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      result = avplayer.OhAvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSetPlaybackSpeed005 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0100
     * @tc.name       : testOhAvPlayerSelectBitRate001
     * @tc.desc       : Set the bitrate used by the HLS player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSelectBitRate001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSelectBitRate001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerSelectBitRate(2500);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);


      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSelectBitRate001 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0200
     * @tc.name       : testOhAvPlayerSelectBitRate002
     * @tc.desc       : Set the bitrate used by the HLS player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSelectBitRate002', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSelectBitRate002 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerSelectBitRate(5000);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);


      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);
      console.info(`testOhAvPlayerSelectBitRate002 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0300
     * @tc.name       : testOhAvPlayerSelectBitRate003
     * @tc.desc       : Set the bitrate used by the HLS player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSelectBitRate003', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSelectBitRate003 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerSelectBitRate(8000);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);


      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSelectBitRate003 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSELECTBITRATE_0400
     * @tc.name       : testOhAvPlayerSelectBitRate004
     * @tc.desc       : Set the bitrate used by the HLS player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSelectBitRate004', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSelectBitRate004 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerSelectBitRate(25000);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);


      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSelectBitRate004 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETPLAYERCALLBACK_0100
     * @tc.name       : testOhAvPlayerSetPlayerCallback001
     * @tc.desc       : Set the player callback method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetPlayerCallback001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetPlayerCallback001 test start `);

      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();

      result = avplayer.OhAvPlayerSetPlayerCallback();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);


      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);

      console.info(`testOhAvPlayerSetPlayerCallback001 test end `);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETLOOPING_0100
     * @tc.name       : testOhAvPlayerSetLooping001
     * @tc.desc       : Set loop playback.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetLooping001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetLooping001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();


      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerSetLooping(numberTrue);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      state = avplayer.OhAvPlayerIsPlaying();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);
      console.info(`testOhAvPlayerSetLooping001 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETLOOPING_0200
     * @tc.name       : testOhAvPlayerSetLooping002
     * @tc.desc       : Set loop playback.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetLooping002', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetLooping002 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();


      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerSetLooping(numberFalse);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PLAYING);

      state = avplayer.OhAvPlayerIsPlaying();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state === AV_STOPPED || state === AV_COMPLETED).assertTrue();

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);
      console.info(`testOhAvPlayerSetLooping002 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0100
     * @tc.name       : testOhAvPlayerSetVolume001
     * @tc.desc       : Set the volume of the player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetVolume001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetVolume(AV_IDLE, AV_IDLE);
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);
      console.info(`testOhAvPlayerSetVolume001 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0200
     * @tc.name       : testOhAvPlayerSetVolume002
     * @tc.desc       : Set the volume of the player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetVolume002', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume002 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);

      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetVolume(0.1, 0.1);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);
      console.info(`testOhAvPlayerSetVolume002 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0300
     * @tc.name       : testOhAvPlayerSetVolume003
     * @tc.desc       : Set the volume of the player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetVolume003', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume003 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);


      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);


      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetVolume(0.2, 0.2);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      // state = avplayer.OhAvPlayerGetState();
      // expect(state).assertEqual(AV_RELEASED);
      console.info(`testOhAvPlayerSetVolume003 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0400
     * @tc.name       : testOhAvPlayerSetVolume004
     * @tc.desc       : Set the volume of the player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetVolume004', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume004 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);


      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);


      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetVolume(0.4, 0.4);
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerSetVolume004 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0500
     * @tc.name       : testOhAvPlayerSetVolume005
     * @tc.desc       : Set the volume of the player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetVolume005', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume005 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);


      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);


      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetVolume(0.9, 0.9);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerSetVolume005 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERSETVOLUME_0600
     * @tc.name       : testOhAvPlayerSetVolume006
     * @tc.desc       : Set the volume of the player.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvPlayerSetVolume006', 0, async (done: Function) => {
      console.info(`testOhAvPlayerSetVolume006 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);


      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_PREPARED);


      result = avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetVolume(1, 1);
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_STOPPED);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerSetVolume006 test end `);
      done();
    });
  });

  describe('OhAVPlayerNDKOtherAPITest', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
        context.resourceManager.getRawFileContent("testAV.mp4", (error, model_buffer) => {
          if (error) {
            console.log(
              `[rawfile_copy_to_sandbox] testAV.mp4 is;
              copy failed:${error.code}, message: ${error.message}.`);
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] testAV.mp4 is copy success");
            done();
          }
        });
      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      await Utils.sleep(2000);
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETCURRENTTRACK_0100
     * @tc.name       : testOhAvPlayerGetCurrentTrack001
     * @tc.desc       : Get the currently valid track index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testOhAvPlayerGetCurrentTrack001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerGetCurrentTrack001 test start `);
      let result: number = await avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetCurrentTrack();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testOhAvPlayerGetCurrentTrack001 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETCURRENTTRACK_0200
     * @tc.name       : testOhAvPlayerGetCurrentTrack002
     * @tc.desc       : Get the currently valid track index.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testOhAvPlayerGetCurrentTrack002', 0, async (done: Function) => {
      console.info(`testOhAvPlayerGetCurrentTrack002 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);
      result = avplayer.OhAvPlayerGetCurrentTrack();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerDeselectTrack();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerGetCurrentTrack002 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETDURATION_0100
     * @tc.name       : testOhAvPlayerGetDuration001
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testOhAvPlayerGetDuration001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerGetDuration001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetDuration();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerGetDuration001 test end `);
      done();
    });


    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETVIDEOWIDTH_0100
     * @tc.name       : testOhAvPlayerGetVideoWidth001
     * @tc.desc       : Get video width.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testOhAvPlayerGetVideoWidth001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerGetVideoWidth001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerGetVideoWidth();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerGetVideoWidth001 test end `);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVPLAYERGETVIDEOHEIGHT_0100
     * @tc.name       : testOhAvPlayerGetVideoHeight001
     * @tc.desc       : Obtain video height.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testOhAvPlayerGetVideoHeighth001', 0, async (done: Function) => {
      console.info(`testOhAvPlayerGetVideoHeight001 test start `);
      let result: number = avplayer.OhAvPlayerCreate();
      expect(result).assertEqual(AV_ERR_OK);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state === AV_IDLE).assertTrue();

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      let player: number = await avplayer.OhAvPlayerPrepare();
      expect(player).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);


      result = avplayer.OhAvPlayerGetVideoHeight();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerRelease();
      expect(result).assertEqual(AV_ERR_OK);
      console.info(`testOhAvPlayerGetVideoHeight001 test end `);
      done();
    });
  });

  describe('OhAVPlayerCirclrTest1', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });
    // L0 L1;
    /**
     * create-setFD-prepare-(play-pause)x3-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0100
     * @tc.name       : testGetAVPlayerCirculate001
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate001', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate001 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      for (let i: number = 0; i < 3; i++) {
        result = await avplayer.OhAvPlayerPlay();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerPause();
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
      }
      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);
      console.info(`testGetAVPlayerCirculate001 test end `);
      done();
    });

    /**
     * create-setFD-(prepare-stop)x3-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0200
     * @tc.name       : testGetAVPlayerCirculate002
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate002', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate002 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);
      for (let i: number = 0; i < 3; i++) {
        result = avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerStop();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
      }
      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);
      console.info(`testGetAVPlayerCirculate002 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest2', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      done();
    });
    afterAll(() => {
    });

    /**
     * create-setFD-(prepare-play-stop)x3-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0300
     * @tc.name       : testGetAVPlayerCirculate003
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate003', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate003 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      for (let i: number = 0; i < 3; i++) {
        result = avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = await avplayer.OhAvPlayerPlay();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerStop();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);
      }
      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerCirculate003 test end `);
      done();
    });

    /**
     * (SetFd - Prepare - Reset)x3
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0400
     * @tc.name       : testGetAVPlayerCirculate004
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate004', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate004 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);
      for (let i: number = 0; i < 3; i++) {
        let result: number = avplayer.OhAvPlayerSetFdPathSource();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_INITIALIZED);
        result = avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerReset();
        expect(result).assertEqual(AV_ERR_OK);

        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_IDLE);
        result = avplayer.OhCloseFile();
        expect(result).assertEqual(AV_ERR_OK);
        await Utils.sleep(sleep500);
      }
      console.info(`testGetAVPlayerCirculate004 test end `);
      done();
    });
  });

  describe('OhAVPlayerCirclrTest3', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });

    /**
     * (setFD-prepare-play-stop-reset)x3
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0500
     * @tc.name       : testGetAVPlayerCirculate005
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate005', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate005 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);
      for (let i: number = 0; i < 3; i++) {
        let result: number = avplayer.OhAvPlayerSetFdPathSource();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_INITIALIZED);

        result = avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = await avplayer.OhAvPlayerPlay();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerStop();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerReset();
        expect(result).assertEqual(AV_ERR_OK);

        result = avplayer.OhCloseFile();
        expect(result).assertEqual(AV_ERR_OK);
        await Utils.sleep(sleep500);
      }
      console.info(`testGetAVPlayerCirculate005 test end `);
      done();
    });

    /**
     * (setFD-prepare-stop-reset)x3
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0600
     * @tc.name       : testGetAVPlayerCirculate006
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate006', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate006 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);
      for (let i: number = 0; i < 3; i++) {
        let result: number = avplayer.OhAvPlayerSetFdPathSource();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_INITIALIZED);

        result = avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerStop();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerReset();
        expect(result).assertEqual(AV_ERR_OK);

        result = avplayer.OhCloseFile();
        expect(result).assertEqual(AV_ERR_OK);
        await Utils.sleep(sleep500);
      }
      console.info(`testGetAVPlayerCirculate006 test end `);
      done();
    });

    /**
     * (setFD-prepare-play - pause -reset)x3
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0700
     * @tc.name       : testGetAVPlayerCirculate007
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate007', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate007 test start `);

      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      for (let i: number = 0; i < 3; i++) {
        let result: number = avplayer.OhAvPlayerSetFdPathSource();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        expect(state).assertEqual(AV_INITIALIZED);
        result = avplayer.OhAvPlayerPrepare();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = await avplayer.OhAvPlayerPlay();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerPause();
        expect(result).assertEqual(AV_ERR_OK);
        state = avplayer.OhAvPlayerGetState();
        console.info(`testOhAvPlayerNDK test state :${state}`);

        result = avplayer.OhAvPlayerReset();
        expect(result).assertEqual(AV_ERR_OK);

        result = avplayer.OhCloseFile();
        expect(result).assertEqual(AV_ERR_OK);
        await Utils.sleep(sleep500);
      }

      console.info(`testGetAVPlayerCirculate007 test end `);
      done();
    });
  });

  describe('OhAVPlayerCirclrTest4', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });

    /**
     * create-setFD-prepare-stop-prepare-play-stop-prepare-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0800
     * @tc.name       : testGetAVPlayerCirculate008
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate008', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate008 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate008 test end `);
      done();
    });

    /**
     * create-setFD-prepare-play-stop-prepare-play-stop-prepare-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_0900
     * @tc.name       : testGetAVPlayerCirculate009
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate009', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate009 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate009 test end `);
      done();
    });
  });

  describe('OhAVPlayerCirclrTest5', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });

    /**
     * create-setFD-prepare-play-stop-prepare-stop-prepare-play-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1000
     * @tc.name       : testGetAVPlayerCirculate010
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate010', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate010 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);
      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate010 test end `);
      done();
    });

    /**
     * create-setFD-prepare-stop-prepare-stop-prepare-play-stop-release
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1100
     * @tc.name       : testGetAVPlayerCirculate011
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate011', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate011 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate011 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest6', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      done();
    });
    afterAll(() => {
    });

    /**
     * SetFd - Prepare - Reset-setFD-prepare-play-stop-reset-SetFd - Prepare - Reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1200
     * @tc.name       : testGetAVPlayerCirculate012
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate012', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate012 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate012 test end `);
      done();
    });

    /**
     * SetFd-Prepare-Reset-SetFd-Prepare-Reset-setFD-prepare-play-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1300
     * @tc.name       : testGetAVPlayerCirculate013
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate013', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate013 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate013 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest7', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      done();
    });
    afterAll(() => {
    });

    /**
     * setFD-prepare-play-stop-reset-setFD-prepare-play-stop-reset-SetFd-Prepare-Reset-
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1400
     * @tc.name       : testGetAVPlayerCirculate014
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate014', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate014 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep1000);

      console.info(`testGetAVPlayerCirculate014 test end `);
      done();
    });

    /**
     * setFD-prepare-stop-reset-setFD-prepare-play - pause -reset-setFD-prepare-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1500
     * @tc.name       : testGetAVPlayerCirculate015
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate015', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate015 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);
      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerCirculate015 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest8', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });

    /**
     * setFD-prepare-play - pause -reset-setFD-prepare-stop-reset-setFD-prepare-play - pause -reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1600
     * @tc.name       : testGetAVPlayerCirculate016
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate016', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate016 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);
      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);
      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerPause();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate016 test end `);
      done();
    });

    /**
     * SetFd - Prepare - Reset-setFD-prepare-play-stop-reset-setFD-prepare-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1700
     * @tc.name       : testGetAVPlayerCirculate017
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate017', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate017 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate017 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest9', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });

    /**
     * SetFd - Prepare - Reset-setFD-prepare-stop-reset-setFD-prepare-play-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1800
     * @tc.name       : testGetAVPlayerCirculate018
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate018', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate018 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep1000);

      console.info(`testGetAVPlayerCirculate018 test end `);
      done();
    });

    /**
     * SetFd - Prepare - Reset-SetFd - Prepare - Reset-setFD-prepare-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_1900
     * @tc.name       : testGetAVPlayerCirculate019
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate019', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate019 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerCirculate019 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest10', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      done();
    });
    afterAll(() => {
    });

    /**
     * SetFd - Prepare - Reset-setFD-prepare-stop-reset-SetFd - Prepare - Reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2000
     * @tc.name       : testGetAVPlayerCirculate020
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate020', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate020 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate020 test end `);
      done();
    });

    /**
     * setFD-prepare-play-stop-reset-SetFd - Prepare - Reset-SetFd - Prepare - Reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2100
     * @tc.name       : testGetAVPlayerCirculate021
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate021', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate021 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate021 test end `);
      done();
    });

  });

  describe('OhAVPlayerCirclrTest11', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      done();
    });
    afterAll(() => {
    });

    /**
     * setFD-prepare-play-stop-reset-SetFd - Prepare - Reset-setFD-prepare-play-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2200
     * @tc.name       : testGetAVPlayerCirculate022
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate022', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate022 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep1000);

      console.info(`testGetAVPlayerCirculate022 test end `);
      done();
    });

    /**
     * setFD-prepare-play-stop-reset-setFD-prepare-play-stop-reset-SetFd - Prepare - Reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2300
     * @tc.name       : testGetAVPlayerCirculate023
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate023', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate023 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);

      console.info(`testGetAVPlayerCirculate023 test end `);
      done();
    });

  });
  describe('OhAVPlayerCirclrTest12', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      done();
    });
    afterAll(() => {
    });

    /**
     * setFD-prepare-play-stop-reset-SetFd - Prepare - Reset-setFD-prepare-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2400
     * @tc.name       : testGetAVPlayerCirculate024
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate024', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate024 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate024 test end `);
      done();
    });

    /**
     * setFD-prepare-play-stop-reset-setFD-prepare-stop-reset-SetFd - Prepare - Reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2500
     * @tc.name       : testGetAVPlayerCirculate025
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate025', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate025 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate025 test end `);
      done();
    });

  });
  describe('OhAVPlayerCirclrTest13', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "testAV.mp4";
        console.log(`ml_face_model_file`, ml_face_model_file);
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
      await Utils.sleep(sleep500);
      done();
    });
    beforeEach(async (done: Function) => {
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
      await avplayer.OhAvPlayerCreate();
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await avplayer.OhAvPlayerRelease();
      await Utils.sleep(sleep500);
      done();
    });
    afterAll(() => {
    });

    /**
     * setFD-prepare-play-stop-reset-setFD-prepare-stop-reset-setFD-prepare-play-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2600
     * @tc.name       : testGetAVPlayerCirculate026
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate026', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate026 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate026 test end `);
      done();
    });

    /**
     * setFD-prepare-play-stop-reset-setFD-prepare-stop-reset-setFD-prepare-stop-reset
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_GETAVPLAYERCIRCULATE_2700
     * @tc.name       : testGetAVPlayerCirculate027
     * @tc.desc       : State machine testing.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testGetAVPlayerCirculate027', 0, async (done: Function) => {
      console.info(`testGetAVPlayerCirculate027 test start `);
      let state: number = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_IDLE);

      let result: number = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = await avplayer.OhAvPlayerPlay();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerSetFdPathSource();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      expect(state).assertEqual(AV_INITIALIZED);

      result = avplayer.OhAvPlayerPrepare();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerStop();
      expect(result).assertEqual(AV_ERR_OK);
      state = avplayer.OhAvPlayerGetState();
      console.info(`testOhAvPlayerNDK test state :${state}`);

      result = avplayer.OhAvPlayerReset();
      expect(result).assertEqual(AV_ERR_OK);

      result = avplayer.OhCloseFile();
      expect(result).assertEqual(AV_ERR_OK);
      await Utils.sleep(sleep500);

      console.info(`testGetAVPlayerCirculate027 test end `);
      done();
    });
  });

}