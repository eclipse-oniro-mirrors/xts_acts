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


export default function PropHight() {
  describe('PropHight', () => {
    beforeEach(async (done: Function) => {
      console.info("PropHight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/PropHight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropHight state pages: " + JSON.stringify(pages));
        if (!("PropHight" == pages.name)) {
          console.info("get PropHight state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropHight success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropHight page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0580
    * @tc.name  : PropHight_0100
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropHight_0100', 0, async (done: Function) => {
      console.info('PropHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PropHeight1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropHeight1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('100.00vp');
      console.info('[PropHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0590
    * @tc.name  : PropHight_0200
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropHight_0200', 0, async (done: Function) => {
      console.info('PropHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PropHeight2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropHeight2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('200.00vp');
      console.info('[PropHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0600
    * @tc.name  : PropHight_0300
    * @tc.desc  : To test that the Prop decorator supports union types.
    * @tc.level : Level 2
    */
    it('PropHight_0300', 0, async (done: Function) => {
      console.info('PropHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PropHeight3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropHeight3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('200.00vp');
      console.info('[PropHight_0100] END');
      done();
    });


  })
}

