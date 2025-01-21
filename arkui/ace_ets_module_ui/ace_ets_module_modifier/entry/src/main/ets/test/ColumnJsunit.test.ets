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

export default function columnJsunit() {
  describe('columnTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/column',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get column state success " + JSON.stringify(pages));
        if (!("column" == pages.name)) {
          console.info("get column state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push column page error: " + err);
      }
      done();
    });

    /**
     * @tc.number columnTest_0001
     * @tc.name Test the properties of components
     * @tc.desc set justifyContent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('columnTest_0001', 0, async (done: Function) => {

      console.info('columnTest_0001 START');
      let strJsonNew = getInspectorByKey('column');
      let objNew = JSON.parse(strJsonNew);
      console.info("columnTest_0001 component is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.justifyContent).assertEqual('FlexAlign.Center');
      console.info('columnTest_0001 END');
      done();
    });

    /**
     * @tc.number columnTest_0001
     * @tc.name Test the properties of components
     * @tc.desc set alignItems values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('columnTest_0002', 0, async (done: Function) => {

      console.info('columnTest_0002 START');

      let strJsonNew = getInspectorByKey('column');
      let objNew = JSON.parse(strJsonNew);
      console.info("columnTest_0002 component is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.alignItems).assertEqual('HorizontalAlign.Center');
      console.info('columnTest_0002 END');
      done();
    });

    /**
     * @tc.number columnTest_0003
     * @tc.name Test the properties of components
     * @tc.desc Change justifyContent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('columnTest_0003', 0, async (done: Function) => {

      console.info('columnTest_0003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('column');
      let objNew = JSON.parse(strJsonNew);
      console.info("columnTest_0003 component is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.justifyContent).assertEqual('FlexAlign.Start');
      console.info('columnTest_0003 END');
      done();
    });
  })
}