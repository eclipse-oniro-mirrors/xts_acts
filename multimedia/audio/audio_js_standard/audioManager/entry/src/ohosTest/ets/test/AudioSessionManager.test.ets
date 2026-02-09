/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import audio from '@ohos.multimedia.audio';

let sessionManager: audio.AudioSessionManager;
let audioManager: audio.AudioManager;

// 创建音频会话管理器
async function getSessionManager() {
  audioManager = audio.getAudioManager();
  expect(audioManager).not().assertUndefined();
  expect(audioManager).not().assertNull();
  console.info('getAudioManager audioManager:' + audioManager);
  sessionManager = audioManager.getSessionManager();
  expect(sessionManager).not().assertUndefined();
  expect(sessionManager).not().assertNull();
  console.info('getSessionManager sessionManager:' + sessionManager);
}

export default function audioSessionManagerTest() {
  describe('audioSessionManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      getSessionManager();
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          if (sessionManager.isAudioSessionActivated()) {
            await sessionManager.deactivateAudioSession();
            console.info(`deactivateAudioSession succeed`);
          }
          sessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
          console.info(`setAudioSessionScene succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(true);
          console.info(`enableMuteSuggestionWhenMixWithOthers succeed`);
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          if (sessionManager.isAudioSessionActivated()) {
            await sessionManager.deactivateAudioSession();
            console.info(`deactivateAudioSession succeed`);
          }
          sessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
          console.info(`setAudioSessionScene succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(false);
          console.info(`enableMuteSuggestionWhenMixWithOthers succeed`);
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0300
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
          }
          await sessionManager.activateAudioSession(strategy);
          await sessionManager.deactivateAudioSession();
          console.info(`deactivateAudioSession succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(true);
          expect(false).assertTrue();
        } catch (err) {
          console.info(`enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0400
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-after active call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
          }
          await sessionManager.activateAudioSession(strategy);
          console.info(`activateAudioSession succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(true);
          expect(false).assertTrue();
        } catch (err) {
          console.info(`enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
        }
        done();
      })
    
    /**
     * @tc.name   AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_001
     * @tc.number AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_001
     * @tc.desc   IsOtherMediaPlaying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let audioManager: audio.AudioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let isExistence: boolean = audioSessionManager.isOtherMediaPlaying();
        console.info(`ISOTHERMEDIAPLAYING_001 isExistence is: ${isExistence}`);
        expect(isExistence).assertFalse();
      } catch (err) {
        console.info(`ISOTHERMEDIAPLAYING_001 err.code: ${err.code}, err.message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })
  })
}