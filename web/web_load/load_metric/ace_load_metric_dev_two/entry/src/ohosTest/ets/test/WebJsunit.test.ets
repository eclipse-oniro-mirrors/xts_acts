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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitIsCookieAllowed";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    /**
     * @tc.name   isCookieAllowed
     * @tc.number SUB_ACE_BASIC_ETS_API_070
     * @tc.desc   isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isCookieAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsCookieAllowed";
      Utils.emitEvent(emitKey, 14045)
      Utils.registerEvent("isCookieAllowed", false, 14046, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   saveCookieAsync
     * @tc.number SUB_ACE_BASIC_ETS_API_071
     * @tc.desc   saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('saveCookieAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSaveCookieAsync";
      Utils.emitEvent(emitKey, 14045)
      Utils.registerEvent("saveCookieAsync", "result", 14048, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   isThirdPartyCookieAllowed
     * @tc.number SUB_ACE_BASIC_ETS_API_072
     * @tc.desc   isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isThirdPartyCookieAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsThirdPartyCookieAllowed";
      Utils.emitEvent(emitKey, 14045)
      Utils.registerEvent("isThirdPartyCookieAllowed", false, 14049, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}