/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "emitBackward";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 100,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_003
     *tc.name Backward
     *tc.desic back to the old page
     */
    it('Backward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitForward";
      Utils.registerEvent("Backward", "index", 3, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_004
     *tc.name Forward
     *tc.desic go to the new page
     */
    it('Forward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessBackward";
      Utils.registerEvent("Forward", "baidu", 4, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_005
     *tc.name AccessBackward
     *tc.desic return whether there is a old page
     */
    it('AccessBackward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessForward";
      Utils.registerEvent("AccessBackward", true, 5, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_006
     *tc.name AccessForward
     *tc.desic return whether there is a new page
     */
    it('AccessForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessStep";
      Utils.registerEvent("AccessForward", false, 6, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_010
     *tc.name AccessStep
     *tc.desic return whether steps can be operated
     */
    it('AccessStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearHistory";
      Utils.registerEvent("AccessStep", true, 10, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_011
     *tc.name ClearHistory
     *tc.desic clear the browsing history
     */
    it('ClearHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnce";
      Utils.registerEvent("ClearHistory", false, 11, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_031
     *tc.name Once
     *tc.desic Save current page
     */
    it('Once', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetItemAtIndex";
      Utils.registerContainEvent("Once", "a=b", 31, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_032
     *tc.name GetItemAtIndex
     *tc.desic Save current page
     */
    it('GetItemAtIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitContextMenuMediaType";
      Utils.registerEvent("GetItemAtIndex", "index", 32, done);
      sendEventByKey('webcomponent', 10, '');
    })

  })
}
