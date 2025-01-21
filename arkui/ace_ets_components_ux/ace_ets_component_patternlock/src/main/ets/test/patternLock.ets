/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, it, expect } from '@ohos/hypium'

let emitKey = "emitUserAgent";

export default function patternLockTest() {

  describe('ActsPatternLockInterfaceTest', () => {

    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      setTimeout(() => {
      }, 1000)
    })

    /*
      *tc.number ArkUX_Stage_PatternLock_setChallengeResult_0100
      *tc.name   Support setting the dot color
      *tc.desc   Sets the setChallengeResult property parameter to undefined
      */
    it('ArkUX_Stage_PatternLock_setChallengeResult_0100', 0, async (done: Function) =>{
      console.info('ArkUX_Stage_PatternLock_setChallengeResult_0100 START');
      try {
        let strJson = getInspectorByKey('lock');
        console.info('ArkUX_Stage_PatternLock_setChallengeResult_0100 START  :' + JSON.stringify(strJson));
        console.info("ArkUX_Stage_PatternLock_setChallengeResult_0100 component obj.$attrs.setChallengeResult is: " +
        JSON.stringify(JSON.parse(strJson).$attrs.setChallengeResult));
        console.info('ArkUX_Stage_PatternLock_setChallengeResult_0100 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_PatternLock_setChallengeResult_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
     *tc.number ArkUX_Stage_PatternLock_onDotConnect_0100
     *tc.name   Support getting the dot index
     *tc.desc   Sets the onDotConnect property parameter to undefined
     */
    it('ArkUX_Stage_PatternLock_onDotConnect_0100', 0, async (done: Function) =>{
      console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 START');
      try {
        let strJson = getInspectorByKey('lock');
        console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 START  :' + JSON.stringify(strJson));
        console.info("ArkUX_Stage_PatternLock_onDotConnect_0100 component obj.$attrs.onDotConnect is: " +
        JSON.stringify(JSON.parse(strJson).$attrs.onDotConnect));
        console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}
