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

export default function rowJsunit() {
  describe('rowTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/row',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get row state success " + JSON.stringify(pages));
        if (!("row" == pages.name)) {
          console.info("get row state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push row page error: " + err);
      }
      done();
    });

    /**
     * @tc.number rowTest_0001
     * @tc.name Test the properties of components
     * @tc.desc set alignItems values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('rowTest_0001', 0, async (done: Function) => {
      console.info('rowTest_0001 START');
      let strJsonNew = getInspectorByKey('row');
      let objNew = JSON.parse(strJsonNew);
      console.info("rowTest_0001 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.alignItems).assertEqual('VerticalAlign.Center');
      console.info('rowTest_0001 END');
      done();
    });

    /**
     * @tc.number rowTest_0002
     * @tc.name Test the properties of components
     * @tc.desc set justifyContent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('rowTest_0002', 0, async (done: Function) => {
      console.info('rowTest_0002 START');
      let strJsonNew = getInspectorByKey('row');
      let objNew = JSON.parse(strJsonNew);
      console.info("rowTest_0002 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('rowTest_0002 END');
      done();
    });

    /**
     * @tc.number rowTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Change alignItems values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('rowTest_0003', 0, async (done: Function) => {
      console.info('rowTest_0003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('row');
      let objNew = JSON.parse(strJsonNew);
      console.info("rowTest_0003 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.alignItems).assertEqual('VerticalAlign.Top');
      console.info('rowTest_0003 END');
      done();
    });
  })
}