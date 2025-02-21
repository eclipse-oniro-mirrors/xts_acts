/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

let TagFrmwk: string = "getAudioSceneApi12";
let AUDIO_SCENE_RINGING: number = 1; //响铃模式。
let AUDIO_SCENE_PHONE_CALL: number = 2; //电话模式。
let audioManager: audio.AudioManager;

async function getAudioManager() {
  audioManager = await audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function getAudioSceneApi12() {
  describe('getAudioSceneApi12', () => {


    beforeAll(async () => {
      console.info(`${TagFrmwk}: beforeAll: Prerequisites at the test suite level`);
      await sleep(100);
      await getAudioManager();
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await sleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0100
     * @tc.name      : mute - AudioScene - AsyncCallback - AUDIO_SCENE_RINGING - 1 响铃模式, AUDIO_SCENE_PHONE_CALL - 2 电话模式。
     * @tc.desc      : mute - AudioScene - AsyncCallback - AudioScene
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0100', 1, (done: Function) => {
      try {
        audioManager.getAudioScene(async (err, getValue) => {
          if (err) {
            console.error(`Failed to obtain the audio scene mode. ${err}`);
            return;
          }
          if (getValue === AUDIO_SCENE_RINGING) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
          } else if (getValue === AUDIO_SCENE_RINGING) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
          }
          done();
        });
      } catch (e) {
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200
     * @tc.name      : mute - AudioScene - Promise - AUDIO_SCENE_RINGING - 1 响铃模式, AUDIO_SCENE_PHONE_CALL - 2 电话模式。
     * @tc.desc      : mute - AudioScene - Promise - AudioScene
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200', 2, async (done: Function) => {
      try {
        let value = await audioManager.getAudioScene();
        if (value === AUDIO_SCENE_RINGING) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        } else if (value === AUDIO_SCENE_RINGING) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        }
        done();
      } catch (e) {
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0300
     * @tc.name      : mute - AudioScene - AUDIO_SCENE_RINGING - 1 响铃模式, AUDIO_SCENE_PHONE_CALL - 2 电话模式。
     * @tc.desc      : mute - AudioScene - getAudioSceneSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0300', 3, (done: Function) => {
      try {
        let value = audioManager.getAudioSceneSync();
        if (value === AUDIO_SCENE_RINGING) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        } else if (value === AUDIO_SCENE_RINGING) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
        }
        done();
      } catch (e) {
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_0200 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}