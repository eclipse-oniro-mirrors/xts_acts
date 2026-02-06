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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function localStorageRefJsunit() {
  describe('localStorageRefJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("localStorageRefJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Storage/localStorageRef',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get localStorageRefJsunit state pages: " + JSON.stringify(pages));
        if (!("localStorageRef" == pages.name)) {
          console.info("get localStorageRefJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push localStorageRefJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push localStorageRefJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: localStorageRefJsunit_0100
     * @tc.name: localStorageRefJsunit_0100
     * @tc.desc: aceEtsTest_ref
     * @tc.level: Level 2
     * @tc.type:
     * @tc.size:
     */
    it('localStorageRefJsunit_0100', Level.LEVEL0, async () => {
      console.info('localStorageRefJsunit001 START');
      let strJson = getInspectorByKey('local_ref_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[localStorageRefJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[localStorageRefJsunit_0100] ref: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("ref:47");

      let strJson2 = getInspectorByKey('local_ref_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[localStorageRefJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[localStorageRefJsunit_0100] setAndRef: " + JSON.stringify(obj2.$attrs.label));
      expect(obj2.$attrs.label).assertEqual("setAndRef:30");
      console.info('localStorageRefJsunit_0100 END');
    });
  })
}