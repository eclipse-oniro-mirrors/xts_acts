/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import audio from '@ohos.multimedia.audio';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll, Level, TestType, Size } from "../../../hypium/index";
import Utils from './Util.test';

let TagFrmwk:string  = "AudioFrameworkTest";
let audioManager: audio.AudioManager;
function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  }
  else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export default function audioEventManagement() {
  describe('audioEventManagement', () => {
    console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
    let audioManager = null;
    let deviceRoleValue = null;
    let deviceTypeValue = null;

    beforeAll(async () => {
      console.info(`${TagFrmwk}: beforeAll: Prerequisites at the test suite level`);
      getAudioManager();
    })

    beforeEach(() => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(1000);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);

    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0100
     * @tc.desc   DeviceChangeType - CONNECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DeviceChangeType.CONNECT == 0).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0200
     * @tc.desc   DeviceChangeType - DISCONNECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICECHANGETYPE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DeviceChangeType.DISCONNECT == 1).assertTrue();
      await Utils.msSleep(50);
      done();
    })
  })
}