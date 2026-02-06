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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import audio from '@ohos.multimedia.audio';

export default function audioSessionManagerErrorTest() {
  describe('AudioSessionManagerErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let TAG = 'AudioSessionManagerErrorTest';
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0100
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0100
     * @tc.desc   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0100 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioSessionManager: audio.AudioSessionManager = audio.getAudioManager().getSessionManager();

      try {
        let para1: ESObject = 'xxx';
        let para2: Callback<audio.AudioSessionDeactivatedEvent> = () => {};

        audioSessionManager.on(para1, para2);
        expect(false).assertTrue();
        done();
      } catch (error) {
        expect(Number(error.code)).assertEqual(6800101);
        console.info(`${TAG}: error.code: ${error.code}, error.message: ${error.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0200
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0200
     * @tc.desc   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0200 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioSessionManager: audio.AudioSessionManager = audio.getAudioManager().getSessionManager();

      try {
        let para1: ESObject = 1;
        let para2: Callback<audio.AudioSessionDeactivatedEvent> = () => {};

        audioSessionManager.on(para1, para2);
        expect(false).assertTrue();
        done();
      } catch (error) {
        expect(Number(error.code)).assertEqual(401);
        console.info(`${TAG}: error.code: ${error.code}, error.message: ${error.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0300
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0300
     * @tc.desc   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0300 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioSessionManager: audio.AudioSessionManager = audio.getAudioManager().getSessionManager();
      audioSessionManager.on('audioSessionDeactivated', () => {});

      try {
        let para1: ESObject = 'xxx';
        let para2: Callback<audio.AudioSessionDeactivatedEvent> = () => {};

        audioSessionManager.off(para1, para2);
        expect(false).assertTrue();
        done();
      } catch (error) {
        expect(Number(error.code)).assertEqual(6800101);
        console.info(`${TAG}: error.code: ${error.code}, error.message: ${error.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0400
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0400
     * @tc.desc   SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0400 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_ERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let audioSessionManager: audio.AudioSessionManager = audio.getAudioManager().getSessionManager();
      audioSessionManager.on('audioSessionDeactivated', () => {});

      try {
        let para1: ESObject = 1;
        let para2: Callback<audio.AudioSessionDeactivatedEvent> = () => {};

        audioSessionManager.off(para1, para2);
        expect(false).assertTrue();
        done();
      } catch (error) {
        expect(Number(error.code)).assertEqual(401);
        console.info(`${TAG}: error.code: ${error.code}, error.message: ${error.message}`);
        done();
      }
    })
  })
}