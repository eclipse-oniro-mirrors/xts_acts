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

export default function ConsumeHight() {
  describe('ConsumeHight', () => {
    beforeEach(async (done: Function) => {
      console.info("ConsumeHight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ConsumeHight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ConsumeHight state pages: " + JSON.stringify(pages));
        if (!("ConsumeHight" == pages.name)) {
          console.info("get ConsumeHight state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ConsumeHight success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConsumeHight page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1040
    * @tc.name  : ConsumeHight_0100
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeHight_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ConsumeHeight1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeHeight1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('7.00vp');
      console.info('[ConsumeHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1050
    * @tc.name  : ConsumeHight_0200
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeHight_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ConsumeHeight2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeHeight2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('8.00vp');
      console.info('[ConsumeHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1060
    * @tc.name  : ConsumeHight_0300
    * @tc.desc  : To test that the Consume decorator supports union types.
    * @tc.level : Level 2
    */
    it('ConsumeHight_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ConsumeHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ConsumeHeight3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ConsumeHeight3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ConsumeHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('9.00vp');
      console.info('[ConsumeHight_0100] END');
      done();
    });
  })
}

