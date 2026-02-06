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


export default function PropNumberJsunit() {
  describe('PropNumberJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropNumberJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropNumber',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropNumberJsunit state pages: " + JSON.stringify(pages));
        if (!("PropNumber" == pages.name)) {
          console.info("get PropNumberJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropNumberJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropNumberJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    // afterEach(async () => {
    //   await CommonFunc.sleep(1000);
    //   let driver = await UiDriver.create()
    //   await driver.pressBack();
    // });

    /**
     * @tc.name   PropNumberJsunit_0200
     * @tc.number PropNumberJsunit_0200
     * @tc.desc   PropNumberJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumberJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('PropNumberJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('PropNumber_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropNumber_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumberJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumberJsunit_0200] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Father State:11");

      let strJson1 = getInspectorByKey('ChildPropNumber_A');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropNumberJsunit_0200] component obj is: " + JSON.stringify(obj1));
      console.info("[PropNumberJsunit_0200] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Child Prop:11");
      console.info('[PropNumberJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   PropNumberJsunit_0300
     * @tc.number PropNumberJsunit_0300
     * @tc.desc   PropNumberJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropNumberJsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PropNumberJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('ChildPropNumber_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildPropNumber_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropNumberJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropNumberJsunit_0300] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Child Prop:12");

      let strJson1 = getInspectorByKey('PropNumber_A');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropNumberJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[PropNumberJsunit_0300] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("Father State:11");
      console.info('[PropNumberJsunit_0300] END');
      done();
    });
  })
}

