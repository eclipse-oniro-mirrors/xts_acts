/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function PropColor() {
  describe('PropColor', () => {
    beforeEach(async (done: Function) => {
      console.info("PropColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/PropColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropColor state pages: " + JSON.stringify(pages));
        if (!("PropColor" == pages.name)) {
          console.info("get PropColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropColor page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0520
    * @tc.name  : PropColor_0100
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropColor_0100', 0, async (done: Function) => {
      console.info('PropColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFA500');
      console.info('[PropColor_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0530
    * @tc.name  : PropColor_0200
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropColor_0200', 0, async (done: Function) => {
      console.info('PropColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      console.info('[PropColor_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0540
    * @tc.name  : PropColor_0300
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropColor_0300', 0, async (done: Function) => {
      console.info('PropColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropColor_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Undefined]" number is undefined');
      console.info('[PropColor_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0550
    * @tc.name  : PropColor_0400
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropColor_0400', 0, async (done: Function) => {
      console.info('PropColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFA52A2A');
      console.info('[PropColor_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0560
    * @tc.name  : PropColor_0500
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropColor_0500', 0, async (done: Function) => {
      console.info('PropColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropColor_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Null]" number is null');
      console.info('[PropColor_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0570
    * @tc.name  : PropColor_0600
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropColor_0600', 0, async (done: Function) => {
      console.info('PropColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF008000');
      console.info('[PropColor_0100] END');
      done();
    });

  })
}

