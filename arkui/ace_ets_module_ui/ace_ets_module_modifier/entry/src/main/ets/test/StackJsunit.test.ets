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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function stackJsunit() {
  describe('stackTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stack state success " + JSON.stringify(pages));
        if (!("stack" == pages.name)) {
          console.info("get stack state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push stack page error: " + err);
      }
      done();
    });

    /**
     * @tc.number stackTest_002
     * @tc.name Test the properties of components
     * @tc.desc Set alignContent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('stackTest_002', 0, async (done: Function) => {
      console.info('stackTest_002 START');
      let strJsonNew = getInspectorByKey('stack');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("stackTest_002 component  is: " + JSON.stringify(objNew.$attrs.alignContent));
      expect(objNew.$attrs.alignContent).assertEqual("Alignment.Center");
      console.info('stackTest_002 END');
      done();
    });

    /**
     * @tc.number stackTest_001
     * @tc.name Test the properties of components
     * @tc.desc Change alignContent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('stackTest_001', 0, async (done: Function) => {
      console.info('stackTest_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('stack');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("stackTest_001 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.alignContent).assertEqual("Alignment.Top");
      console.info('stackTest_001 END');
      done();
    });
  })
}