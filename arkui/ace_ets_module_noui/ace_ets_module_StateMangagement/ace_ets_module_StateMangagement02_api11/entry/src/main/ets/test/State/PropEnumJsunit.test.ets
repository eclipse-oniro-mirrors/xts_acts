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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'


export default function PropEnumJsunit() {
  describe('PropEnumJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropEnumJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropEnum',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropEnumJsunit state pages: " + JSON.stringify(pages));
        if (!("PropEnum" == pages.name)) {
          console.info("get PropEnumJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropEnumJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropEnumJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('PropEnum_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    it('PropEnumJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('PropEnumJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('PropEnum'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropEnum');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropEnumJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropEnumJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Father State: 2");
      console.info('[PropEnumJsunit_0200] END');

      let strJson1 = getInspectorByKey('ChildPropEnum');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropEnumJsunit_0200] component obj is: " + JSON.stringify(obj1));
      console.info("[PropEnumJsunit_0200] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Child Prop: 2");
      console.info('[PropEnumJsunit_0200] END');
      done();
    });

    it('PropEnumJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('PropEnumJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('ChildPropEnum'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildPropEnum');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropEnumJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropEnumJsunit_0400] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Child Prop: 3");

      let strJson1 = getInspectorByKey('PropEnum');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropEnumJsunit_0200] component obj is: " + JSON.stringify(obj1));
      console.info("[PropEnumJsunit_0200] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Father State: 1");
      console.info('[PropEnumJsunit_0400] END');
      done();
    });
  })
}

