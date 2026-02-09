/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import audio from '@ohos.multimedia.audio';
import ArrayList from '@ohos.util.ArrayList';
import { TestConst } from './Const.test';

let TagFrmwk: string = "audioManagerEnhanceTest";
let audioVolumeGroupManager: audio.AudioVolumeGroupManager;

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
  describe('getMax_Minvolume', () => {


    beforeAll(async () => {
      console.info('TestLog: Start Testing audioManagerTest Interfaces\n');
      await Utils.msSleep(3000);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0100
     * @tc.desc   Judge volume is Unadjustable or adjustable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let actual_maxvol = new ArrayList<int>();
        for (let index = 0; index < TestConst.AudioVolumeType.length; index++) {
          let maxvol = await audioVolumeGroupManager.getMaxVolume(TestConst.AudioVolumeType[index]);
          console.info(`${TestConst.AudioVolumeType[index]} max volume : ${maxvol}`);
          actual_maxvol.add(maxvol);
        }
        for (let i = 0; i < actual_maxvol.length; i++) {
          console.info(`check maxvolume: actual_maxvol : ${actual_maxvol[i]}, expect_maxvol > 1`);
          expect(actual_maxvol[i] > 1).assertTrue();
          // maxVolume value depends on device configuration, simplify judgment here
        }
        done();
      } catch (error: BusinessError) {
        console.log(`getVolume error: ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0100
     * @tc.desc   Judge volume is Unadjustable or adjustable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let actual_minvol = new ArrayList<int>();
        for (let index = 0; index < TestConst.AudioVolumeType.length; index++) {
          let minvol = await audioVolumeGroupManager.getMinVolume(TestConst.AudioVolumeType[index]);
          console.info(`${TestConst.AudioVolumeType[index]} min volume : ${minvol}`);
          actual_minvol.add(minvol);
        }
        for (let i = 0; i < actual_minvol.length; i++) {
          console.info(`check minvolume : actual_minvol : ${actual_minvol[i]}, expect_minvol == 0 or 1`);
          expect(actual_minvol[i] == 1 || actual_minvol[i] == 0).assertTrue();
          // Different types of audio streams have different minimum volumes depending on the  device configuration, simplify judgment here

        }
        done();
      } catch (error: BusinessError) {
        console.log(`getVolume error ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
