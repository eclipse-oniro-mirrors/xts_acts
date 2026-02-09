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

let audioVolumeGroupManager: audio.AudioVolumeGroupManager | undefined;
let TagFrmwk = "audioManagerEnhanceTest";

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
  describe('isVolumeUnadjustable', () => {


    beforeAll(async () => {
      console.info('TestLog: Start Testing audioManagerTest Interfaces\n');
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_STATIC_0100
     * @tc.desc   Judge volume is Unadjustable or adjustable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let bol = audioVolumeGroupManager!.isVolumeUnadjustable();
        console.info(`isVolumeUnadjustable SUCCESS, is ${bol}`);
        expect(bol).assertEqual(false);
        done();
      } catch (error) {
        console.log(`isVolumeUnadjustable error: ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
