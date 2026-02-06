/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
let TagFrmwk = "audioSessionManagerTest";
let audioManager: audio.AudioManager;
let sessionManager: audio.AudioSessionManager | undefined;

function getSessionManager() {
  audioManager = audio.getAudioManager();
  expect(audioManager).not().assertUndefined();
  expect(audioManager).not().assertNull();
  console.info(`${TagFrmwk}: getAudioManager audioManager: ${audioManager}`);
  sessionManager = audioManager.getSessionManager();
  expect(sessionManager).not().assertUndefined();
  expect(sessionManager).not().assertNull();
  console.info(`${TagFrmwk}: getSessionManager sessionManager: ${sessionManager}`);
}

export default function audioSessionManagerTest() {
  describe('audioSessionManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getSessionManager();
    })

    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(100);
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0100
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (sessionManager!.isAudioSessionActivated()) {
          await sessionManager!.deactivateAudioSession();
          console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        }
        sessionManager!.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        console.info(`${TagFrmwk}: setAudioSessionScene succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers succeed`);
      } catch (err) {
        console.error(`Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0200
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (sessionManager!.isAudioSessionActivated()) {
          await sessionManager!.deactivateAudioSession();
          console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        }
        sessionManager!.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        console.info(`${TagFrmwk}: setAudioSessionScene succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(false);
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers succeed`);
      } catch (err) {
        console.error(`${TagFrmwk}: Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0300
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await sessionManager!.activateAudioSession(strategy);
        await sessionManager!.deactivateAudioSession();
        console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0400
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await sessionManager!.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })

  })
}
