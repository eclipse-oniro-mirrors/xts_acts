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

export default function columnSplitJsunit() {
  describe('columnSplitTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/columnSplit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnSplit state success " + JSON.stringify(pages));
        if (!("columnSplit" == pages.name)) {
          console.info("get columnSplit state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push columnSplit page error: " + err);
      }
      done();
    });

    /**
     * @tc.number columnSplitTest_0001
     * @tc.name Test the properties of components
     * @tc.desc set divider values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('columnSplitTest_0001', Level.LEVEL0, async (done: Function) => {

      console.info('columnSplitTest_0001 START');
      let strJsonNew = getInspectorByKey('columnSplit');
      console.info("columnSplitTest_0001 component is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.divider?.startMargin).assertEqual('10.00px');
      expect(JSON.parse(strJsonNew).$attrs.divider?.endMargin).assertEqual('10.00px');
      console.info('columnSplitTest_0001 END');
      done();
    });

    /**
     * @tc.number columnSplitTest_0002
     * @tc.name Test the properties of components
     * @tc.desc set resizeable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('columnSplitTest_0002', Level.LEVEL0, async (done: Function) => {

      console.info('columnSplitTest_0002 START');
      let strJsonNew = getInspectorByKey('columnSplit');
      console.info("columnSplitTest_0002 component is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.resizeable).assertEqual("false");
      console.info('columnSplitTest_0002 END');
      done();
    });

    /**
     * @tc.number columnSplitTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Change resizeable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('columnSplitTest_0003', Level.LEVEL0, async (done: Function) => {

      console.info('columnSplitTest_0003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('columnSplit');
      console.info("columnSplitTest_0003 component is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));

      expect(JSON.parse(strJsonNew).$attrs.resizeable).assertEqual("true");
      console.info('columnSplitTest_0003 END');
      done();
    });

  })
}