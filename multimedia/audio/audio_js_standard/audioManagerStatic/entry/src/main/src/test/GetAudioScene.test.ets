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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';

let TagFrmwk: string = "getAudioSceneApi12";
let AudioSceneRinging: audio.AudioScene = audio.AudioScene.AUDIO_SCENE_RINGING;
let AudioScenePhoneCall: audio.AudioScene = audio.AudioScene.AUDIO_SCENE_PHONE_CALL;
let audioManager: audio.AudioManager;

async function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

export default function getAudioSceneApi12() {
  describe('getAudioSceneApi12', () => {

    beforeAll(async () => {
      console.info(`${TagFrmwk}: beforeAll: Prerequisites at the test suite level`);
      await Utils.msSleep(100);
      await getAudioManager();
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100
     * @tc.desc   mute - AudioScene - AsyncCallback - AudioScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done: () => void): void => {
      try {
        audioManager.getAudioScene( (err: BusinessError<void> | null, getValue: audio.AudioScene | undefined) => {
          if (err) {
            console.error(`Failed to obtain the audio scene mode. ${err}`);
            return;
          }
          if (getValue === AudioSceneRinging) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            expect(getValue).assertEqual(1);
          } else if (getValue === AudioScenePhoneCall) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            expect(getValue).assertEqual(2);
          } else if (getValue == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            expect(getValue).assertEqual(0);
          } else if (getValue == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
            console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            expect(getValue).assertEqual(3);
          }
          done();
        });
      } catch (e: BusinessError) {
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0100 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200
     * @tc.desc   mute - AudioScene - Promise - AudioScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let value = await audioManager.getAudioScene();
        if (value === AudioSceneRinging) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(1);
        } else if (value === AudioScenePhoneCall) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(2);
        } else if (value == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(0);
        } else if (value == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(3);
        }
        done();
      } catch (e: BusinessError) {
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0200 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300
     * @tc.desc   mute - AudioScene - getAudioSceneSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  (done: () => void): void => {
      try {
        let value = audioManager.getAudioSceneSync();
        if (value === AudioSceneRinging) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(1);
        } else if (value === AudioScenePhoneCall) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(2);
        } else if (value == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(0);
        } else if (value == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
          console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          expect(value).assertEqual(3);
        }
        done();
      } catch (e: BusinessError) {
        console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOSCENCE_STATIC_0300 ERROR: ${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ON_AUDIOSCENECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ON_AUDIOSCENECHANGE_STATIC_0100
     * @tc.desc   on_audioscenechange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ON_AUDIOSCENECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      let audioManager = audio.getAudioManager();
      try {
        let audioSceneChangeCallback = (audioScene: audio.AudioScene) =>{
          if (audioScene == audio.AudioScene.AUDIO_SCENE_DEFAULT) {              
            console.info(`AudioSceneChange event: ${audioScene}`);
            expect(audioScene).assertEqual(0);
          } else if (audioScene == audio.AudioScene.AUDIO_SCENE_RINGING) {              
            console.info(`AudioSceneChange event: ${audioScene}`);
            expect(audioScene).assertEqual(1);
          } else if (audioScene == audio.AudioScene.AUDIO_SCENE_PHONE_CALL) {              
            console.info(`AudioSceneChange event: ${audioScene}`);
            expect(audioScene).assertEqual(2);
          } else if(audioScene == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
            console.info(`AudioSceneChange event: ${audioScene}`);
            expect(audioScene).assertEqual(3);
          }
        };
        audioManager.onAudioSceneChange(audioSceneChangeCallback);
        audioManager.offAudioSceneChange(audioSceneChangeCallback);
        done();
      } catch (err: BusinessError) {
        console.log('audioSceneChange failed, err :' + err.message)
        expect(false).assertTrue();
        done();
      }
    })
  })
}