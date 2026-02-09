/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../hypium/index";
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import ArrayList from '@ohos.util.ArrayList';
import { TestConst } from './Const.test';
import { BusinessError } from '@ohos.base';

let TagFrmwk: string = "audioManagerEnhanceTest";
let audioVolumeGroupManager: audio.AudioVolumeGroupManager | undefined;

function getAudioManager() {
  let audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
    let audioVolumeManager = audioManager.getVolumeManager();
    console.info(`${TagFrmwk}: getVolumeManager : PASS`);
    let groupid = audio.DEFAULT_VOLUME_GROUP_ID;
    audioVolumeManager.getVolumeGroupManager(groupid, (err: BusinessError<void> | null, value: audio.AudioVolumeGroupManager | undefined) => {
      if (err) {
        console.info("getVolumeGroupManager failed. err:" + JSON.stringify(err));
        console.info("groupid:" + groupid);
        return;
      }
      console.info("getVolumeGroupManager success");
      if (value !== undefined) {
        audioVolumeGroupManager = value;
      }
    });
  }
  else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export default function audioManagerTest() {
  describe('getSystemVolumeInDb', () => {


    beforeAll(async () => {
      console.info('TestLog: Start Testing audioManagerTest Interfaces');
    })
    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getAudioManager();
      await Utils.msSleep(100);
    })
    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(100);
    })
    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_STATIC_0100
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDBSYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager!.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER)
        console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0100
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER);
          console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.log(`${TagFrmwk}: getSystemVolumeInDb : error ${error}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0200
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        for (let index = 0; index < TestConst.AudioVolumeType.length; index++) {
          try {
            let data = await audioVolumeGroupManager!.getSystemVolumeInDb(TestConst.AudioVolumeType[index], 3, audio.DeviceType.SPEAKER);
            console.info(`${TestConst.AudioVolumeType[index]} getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          } catch (error) {
            console.log(`${TagFrmwk}: ${TestConst.AudioVolumeType[index]} getSystemVolumeInDb : error ${error}`);
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0300
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let maxVol = await audioVolumeGroupManager!.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let minVol = await audioVolumeGroupManager!.getMinVolume(audio.AudioVolumeType.MEDIA);
        let volLevel = 0;
        for (volLevel = minVol; volLevel <= maxVol; volLevel++) {
          try {
            let data = await audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, volLevel, audio.DeviceType.SPEAKER);
            console.info(` ${volLevel} getSystemVolumeInDb :SUCCESS ${data}`);
          } catch (error) {
            console.log(`${TagFrmwk}: ${volLevel} getSystemVolumeInDb : error ${error}`);
            expect(false).assertTrue();
            done();
          }
        }
        done();
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0400
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let DeviceTypeKeys: string[] = [
          "INVALID",
          "EARPIECE",
          "SPEAKER",
          "WIRED_HEADSET",
          "WIRED_HEADPHONES",
          "BLUETOOTH_SCO",
          "BLUETOOTH_A2DP",
          "MIC",
          "USB_HEADSET",
          "DISPLAY_PORT",
          "REMOTE_CAST",
          "USB_DEVICE",
          "REMOTE_DAUDIO",
          "DEFAULT",
        ]
        let enumArray: audio.DeviceType[] = [
          audio.DeviceType.INVALID,
          audio.DeviceType.EARPIECE,
          audio.DeviceType.SPEAKER,
          audio.DeviceType.WIRED_HEADSET,
          audio.DeviceType.WIRED_HEADPHONES,
          audio.DeviceType.BLUETOOTH_SCO,
          audio.DeviceType.BLUETOOTH_A2DP,
          audio.DeviceType.MIC,
          audio.DeviceType.USB_HEADSET,
          audio.DeviceType.DISPLAY_PORT,
          audio.DeviceType.REMOTE_CAST,
          audio.DeviceType.USB_DEVICE,
          audio.DeviceType.REMOTE_DAUDIO,
          audio.DeviceType.DEFAULT,
        ];
        for (let i = 0; i < enumArray.length; i++) {
          try {
            let data = await audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 1, enumArray[i]);
            let index = DeviceTypeKeys[i];
            console.info(`${index} getSystemVolumeInDb :SUCCESS ${data}`);
          } catch (error) {
            let index = DeviceTypeKeys[i];
            if (index == 'DEFAULT' || index == 'MAX' || index == 'INVALID' || index == 'NONE' || index == 'WAKEUP' ||
              index == 'DISPLAY_PORT' || index == 'REMOTE_CAST' || index == 'HDMI' || index == 'REMOTE_DAUDIO') {
              console.log(`${index} getSystemVolumeInDb :${error.code} ${error.message}`);
            } else {
              console.log(`${TagFrmwk}:${index} getSystemVolumeInDb : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          }
        }
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0600
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, -1, audio.DeviceType.SPEAKER);
          console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          if (error) {
            error = error as BusinessError;
            console.log(`${TagFrmwk}: getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(Number(error.code)).assertEqual(TestConst.INVALID_INPUT_PARAMETER_6800101);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0700
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let maxVol = await audioVolumeGroupManager!.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let nowVolume = maxVol + 1
        console.log(`nowVolume type: ${typeof (nowVolume)},${nowVolume}`);
        try {
          let data = await audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, nowVolume, audio.DeviceType.SPEAKER);
          console.info(`getSystemVolumeInDb :SUCCESS ${data}, testcase FAIL!`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          if (error) {
            error = error as BusinessError;
            console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(Number(error.code)).assertEqual(TestConst.INVALID_INPUT_PARAMETER_6800101);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_1100
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        try {
          let data = await audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.MIC);
          console.info(`getSystemVolumeInDb :SUCCESS ${data}`);
          done();
        } catch (error) {
          console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_STATIC_1500
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let db1 = new ArrayList <Number>();
        let db2 = new ArrayList <Number>();
        let device: audio.DeviceType[] = [audio.DeviceType.SPEAKER, audio.DeviceType.EARPIECE, audio.DeviceType.WIRED_HEADSET];
        for (let deviceIndex = 0; deviceIndex < device.length; deviceIndex++) {
          for (let typeIndex = 0; typeIndex < TestConst.AudioVolumeType.length; typeIndex++) {
            let maxVol = await audioVolumeGroupManager!.getMaxVolume(TestConst.AudioVolumeType[typeIndex]);
            let minVol = await audioVolumeGroupManager!.getMinVolume(TestConst.AudioVolumeType[typeIndex]);
            for (let volIndex = minVol; volIndex <= maxVol; volIndex++) {
              try {
                let data1 = audioVolumeGroupManager!.getSystemVolumeInDbSync(TestConst.AudioVolumeType[typeIndex], volIndex, device[deviceIndex]);
                db1.add(data1!);
              } catch (err) {
                console.info(`db1 getSystemVolumeInDbSync : error ${err?.message} ${err?.code}`);
                expect(false).assertTrue();
                done();
              }
              try {
                let data2 = audioVolumeGroupManager!.getSystemVolumeInDbSync(TestConst.AudioVolumeType[typeIndex], volIndex, device[deviceIndex]);
                db2.add(data2!);
              } catch (err) {
                console.info(`db2 getSystemVolumeInDbSync : error ${err?.message} ${err?.code}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
        console.log(`${TagFrmwk}:getSystemVolumeInDb : SUCCESS`);
        for (let i = 0; i < db1.length; i++) {
          expect(db1[i]).assertEqual(db2[i]);
        }
        done();
      } catch (error) {
        console.info(`GETSYSTEMVOLUMEINDB error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_STATIC_1600
     * @tc.desc   Gets the volume db value that system calculate by volume type, volume level and device type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      audioVolumeGroupManager!.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 0, audio.DeviceType.SPEAKER, (err: BusinessError<void> | null, data: number | undefined) => {
        if (err) {
          console.log(`${TagFrmwk}:getSystemVolumeInDb : error ${err?.message} ${err?.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.log(`${TagFrmwk}:getSystemVolumeInDb SUCCESS dB:${data}`);
          expect(data).assertEqual(0);
          done();
        }
      })
    })
  })
}
