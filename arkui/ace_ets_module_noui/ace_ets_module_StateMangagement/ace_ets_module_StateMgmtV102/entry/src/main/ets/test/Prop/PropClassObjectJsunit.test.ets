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


export default function PropClassObjectJsunit() {
  describe('PropClassObjectJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropClassObjectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Prop/PropClassObject',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropClassObjectJsunit state pages: " + JSON.stringify(pages));
        if (!("PropClassObject" == pages.name)) {
          console.info("get PropClassObjectJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropClassObjectJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropClassObjectJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   PropClassObjectJsunit_0100
     * @tc.number PropClassObjectJsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropClassObjectJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('PropClassObjectJsunit_0100 START');
      let strJson = getInspectorByKey('sub_prop_AA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropClassObjectJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("子组件Prop:Hello");
      console.info('[PropClassObjectJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   PropClassObjectJsunit_0200
     * @tc.number PropClassObjectJsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropClassObjectJsunit_0200', Level.LEVEL1, async (done: Function) => {

      console.info('PropClassObjectJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sub_prop_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sub_prop_AA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropClassObjectJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("子组件Prop:World");
      console.info('[PropClassObjectJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   PropClassObjectJsunit_0300
     * @tc.number PropClassObjectJsunit_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropClassObjectJsunit_0300', Level.LEVEL1, async (done: Function) => {

      console.info('PropClassObjectJsunit_0300 START');
      let strJson = getInspectorByKey('prop_Object_AA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropClassObjectJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_0300] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Click to change Class or Object: Hello");
      console.info('[PropClassObjectJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   PropClassObjectJsunit_0400
     * @tc.number PropClassObjectJsunit_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropClassObjectJsunit_0400', Level.LEVEL1, async (done: Function) => {

      console.info('PropClassObjectJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('prop_Object_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('prop_Object_AA');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropClassObjectJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_0400] name: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("Click to change Class or Object: Hi");
      console.info('[PropClassObjectJsunit_0400] END');
      done();
    });
  })
}

