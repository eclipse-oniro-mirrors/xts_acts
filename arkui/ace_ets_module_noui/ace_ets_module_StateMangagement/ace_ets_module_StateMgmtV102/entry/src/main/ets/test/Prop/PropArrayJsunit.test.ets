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


export default function PropArrayJsunit() {
  describe('PropArrayJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropArrayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Prop/PropArray001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropArrayJsunit state pages: " + JSON.stringify(pages));
        if (!("PropArray001" == pages.name)) {
          console.info("get PropArrayJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropArrayJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropArrayJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   PropArrayJsunit_0100
     * @tc.number PropArrayJsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('PropArrayJsunit_0100 START');
      let strJson = getInspectorByKey('initial_Array');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArrayJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArrayJsunit_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('title：[{"value":1},{"value":2},{"value":3}]');
      console.info('[PropArrayJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   PropArrayJsunit_0200
     * @tc.number PropArrayJsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayJsunit_0200', Level.LEVEL1, async (done: Function) => {

      console.info('PropArrayJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('parent_Array'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('initial_Array');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArrayJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropArrayJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('title：[{"value":8},{"value":2},{"value":3}]');
      console.info('[PropArrayJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   PropArrayJsunit_0300
     * @tc.number PropArrayJsunit_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayJsunit_0300', Level.LEVEL1, async (done: Function) => {

      console.info('PropArrayJsunit_0300 START');
      let strJson = getInspectorByKey('sub_prop');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArrayJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropArrayJsunit_0300] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('子组件Prop:[{"value":8},{"value":2},{"value":3}]');
      done();
    });

    /**
     * @tc.name   PropArrayJsunit_0400
     * @tc.number PropArrayJsunit_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArrayJsunit_0400', Level.LEVEL1, async (done: Function) => {

      console.info('PropArrayJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sub_prop'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sub_prop');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArrayJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropArrayJsunit_0400] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('子组件Prop:[{"value":7},{"value":2},{"value":3}]');
      console.info('[PropArrayJsunit_0400] END');
      done();
    });
  })
}

