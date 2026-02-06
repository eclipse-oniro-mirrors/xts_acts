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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function rowSplitJsunit() {
  describe('rowSplitTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rowSplit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rowSplit state success " + JSON.stringify(pages));
        if (!("rowSplit" == pages.name)) {
          console.info("get rowSplit state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push rowSplit page error: " + err);
      }
      done();
    });

    /**
     * @tc.number rowSplitTest_0001
     * @tc.name Test the properties of components
     * @tc.desc set resizeable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('rowSplitTest_0001', Level.LEVEL0, async (done: Function) => {
      let strJsonNew = getInspectorByKey('rowSplit');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("rowSplitTest_0001 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.resizeable).assertEqual("false");
      console.info('rowSplitTest_0001 END');
      done();
    });

    /**
     * @tc.number rowSplitTest_0002
     * @tc.name Test the properties of components
     * @tc.desc Change resizeable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('rowSplitTest_0002', Level.LEVEL0, async (done: Function) => {
      console.info('rowSplitTest_0002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('rowSplit');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("rowSplitTest_0002 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.resizeable).assertEqual("true");
      console.info('rowSplitTest_0002 END');
      done();
    });
  })
}