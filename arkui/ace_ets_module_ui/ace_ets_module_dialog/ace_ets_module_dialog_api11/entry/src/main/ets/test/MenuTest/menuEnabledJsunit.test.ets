/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function menuEnabledJsunit() {
  describe('menuEnabledJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("menuEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("menuEnabled" == pages.name)) {
          console.info("get menuEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menuEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuEnabledJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('menuEnabledJsunit_0100', Level.LEVEL2, async (done: Function) => {

      console.info('menuEnabledJsunit_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('bindMenuEnd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuEnabledJsunit_0100] enabled: " + JSON.stringify(obj.$attrs.enabled));
      expect(obj.$attrs.enabled).assertEqual(false);
      console.info('[menuEnabledJsunit_0100] END');
      done();
    });

    it('menuEnabledJsunit_0200', Level.LEVEL2, async (done: Function) => {

      console.info('menuEnabledJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('cmEnd'));
      await button.click();
      await CommonFunc.sleep(1000);
      let menuEnabled = await driver.findComponent(BY.key('menuEnabled'));
      await menuEnabled.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      let change = await driver.findComponent(BY.key('change'));
      await change.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuEnabledJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[menuEnabledJsunit_0200] enabled: " + JSON.stringify(obj.$attrs.enabled));
      expect(obj.$attrs.content).assertEqual('enabled');
      console.info('[menuEnabledJsunit_0200] END');
      done();
    });

  })
}

