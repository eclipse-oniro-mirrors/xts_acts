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


export default function PropBooleanJsunit() {
  describe('PropBooleanJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PropBooleanJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropBoolean',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropBooleanJsunit state pages: " + JSON.stringify(pages));
        if (!("PropBoolean" == pages.name)) {
          console.info("get PropBooleanJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropBooleanJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropBooleanJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    it('PropBooleanJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('PropBooleanJsunit_0100 START');
      let strJson = getInspectorByKey('Boolean_Prop');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropBooleanJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropBooleanJsunit_0100] label: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("父组件State:true");
      console.info('[PropBooleanJsunit_0100] END');
      done();
    });
    it('PropBooleanJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('PropBooleanJsunit_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('PropBoolean'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PropBooleanJsunit_0200 START');
      let strJson = getInspectorByKey('Boolean_Prop');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropBooleanJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropBooleanJsunit_0200] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual(undefined);
      console.info('[PropBooleanJsunit_0200] END');
      done();
    });
    it('PropBooleanJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('PropBooleanJsunit_0300 START');
      let strJson = getInspectorByKey('ChildPropBoolean');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropBooleanJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropBooleanJsunit_0300] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("子组件Prop: false");
      console.info('[PropBooleanJsunit_0300] END');
      done();
    });
    it('PropBooleanJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('PropBooleanJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('ChildPropBoolean'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ChildPropBoolean');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropBooleanJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropBooleanJsunit_0400] label: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("子组件Prop: true");
      console.info('[PropBooleanJsunit_0400] END');
      done();
    });
  })
}

