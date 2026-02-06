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


export default function PropStringJsunit() {
  describe('PropStringJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropStringJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Prop/PropString',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropStringJsunit state pages: " + JSON.stringify(pages));
        if (!("PropString" == pages.name)) {
          console.info("get PropStringJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropStringJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropStringJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   PropStringJsunit_0200
     * @tc.number PropStringJsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropStringJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('PropStringJsunit_0200 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('PropString_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropString_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropStringJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropStringJsunit_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Father State: Hi');
      console.info('[PropStringJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   PropStringJsunit_0400
     * @tc.number PropStringJsunit_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropStringJsunit_0400', Level.LEVEL1, async (done: Function) => {

      console.info('PropStringJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('ChildPropString_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildPropString_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropStringJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropStringJsunit_0400] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Child Prop: World');

      let strJson1 = getInspectorByKey('PropString_A');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PropStringJsunit_0200] component obj is: " + JSON.stringify(obj1));
      console.info("[PropStringJsunit_0200] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('Father State: Hi');
      console.info('[PropStringJsunit_0400] END');
      done();
    });
  })
}

