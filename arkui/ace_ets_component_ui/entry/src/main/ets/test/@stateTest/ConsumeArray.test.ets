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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function ConsumeArray() {
  describe('ConsumeArray', () => {
    beforeEach(async (done: Function) => {
      console.info("ConsumeArray beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ConsumeArray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ConsumeArray state pages: " + JSON.stringify(pages));
        if (!("ConsumeArray" == pages.name)) {
          console.info("get ConsumeArray state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ConsumeArray success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConsumeArray page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1070
    * @tc.name  : ConsumeArray_0100
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeArray_0100', 0, async (done: Function) => {
      console.info('ConsumeArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[ConsumeArray_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1080
    * @tc.name  : ConsumeArray_0200
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeArray_0200', 0, async (done: Function) => {
      console.info('ConsumeArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [true]');
      console.info('[ConsumeArray_0100] END');
      done();
    });
     /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1090
    * @tc.name  : ConsumeArray_0300
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeArray_0300', 0, async (done: Function) => {
      console.info('ConsumeArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[ConsumeArray_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1100
    * @tc.name  : ConsumeArray_0400
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeArray_0400', 0, async (done: Function) => {
      console.info('ConsumeArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeArrayNew');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is 200');
      console.info('[ConsumeArray_0100] END');
      done();
    });



  })
}

