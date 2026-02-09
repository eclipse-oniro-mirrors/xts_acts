/**
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

export default function ComputedTraceTest() {
  describe('ComputedTraceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ComputedTraceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Computed/computedTrace',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComputedTraceTest state pages: " + JSON.stringify(pages));
        if (!("computedTrace" == pages.name)) {
          console.info("get ComputedTraceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ComputedTraceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComputedTraceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ComputedTraceTest_0100
     * @tc.number SUB_ACE_STATUSMANAGER_COMPUTE_0260
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ComputedTraceTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ComputedTraceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('computedTraceButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('computedTraceText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComputedTraceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Li Huaa');

      strJson = getInspectorByKey('computedTraceText2');
      obj = JSON.parse(strJson);
      console.info("[ComputedTraceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Li Huaa');

      strJson = getInspectorByKey('computedTraceText3');
      obj = JSON.parse(strJson);
      console.info("[ComputedTraceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Computed call count 2');

      console.info('[ComputedTraceTest_0100] END');
      done();
    });
  })
}

