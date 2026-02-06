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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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


export default function ProvideHight() {
  describe('ProvideHight', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideHight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ProvideHight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideHight state pages: " + JSON.stringify(pages));
        if (!("ProvideHight" == pages.name)) {
          console.info("get ProvideHight state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideHight success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideHight page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : ProvideHight_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideHight_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ProvideHeight1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideHeight1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('7.00vp');
      console.info('[ProvideHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0360
    * @tc.name  : ProvideHight_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideHight_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ProvideHeight2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideHeight2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('8.00vp');
      console.info('[ProvideHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0370
    * @tc.name  : ProvideHight_0300
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideHight_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ProvideHeight3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideHeight3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('9.00vp');
      console.info('[ProvideHight_0100] END');
      done();
    });


  })
}

