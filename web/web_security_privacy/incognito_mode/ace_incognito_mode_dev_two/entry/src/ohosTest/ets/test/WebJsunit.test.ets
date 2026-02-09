/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { beforeAll,afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitClearHistory";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {
      await waitForComponent("webcomponent");
      done()
    });
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
     * @tc.name   clearHistory
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_054
     * @tc.desc   clearHistory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('clearHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearHistory", 160500);
      Utils.registerEvent("clearHistory", false, 160510, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   allowGeolocation
     * @tc.number SUB_ACE_BASIC_ETS_API_067
     * @tc.desc   allowGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('allowGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAllowGeolocation", 160500);
      Utils.registerEvent("allowGeolocation", "resource://rawfile/, result: true", 160520, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   deleteGeolocation
     * @tc.number SUB_ACE_BASIC_ETS_API_068
     * @tc.desc   deleteGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDeleteGeolocation", 160500);
      Utils.registerEvent("deleteGeolocation", "", 160530, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /**
     * @tc.name   deleteAllGeolocation
     * @tc.number SUB_ACE_BASIC_ETS_API_069
     * @tc.desc   deleteAllGeolocation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteAllGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDeleteAllGeolocation", 160500);
      Utils.registerEvent("deleteAllGeolocation", "", 160540, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}