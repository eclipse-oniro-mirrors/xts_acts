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

export default function LinkHight() {
  describe('LinkHight', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkHight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/LinkHight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkHight state pages: " + JSON.stringify(pages));
        if (!("LinkHight" == pages.name)) {
          console.info("get LinkHight state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkHight success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkHight page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0810
    * @tc.name  : LinkHight_0100
    * @tc.desc  : To test that the Link decorator supports union types.
    * @tc.level : Level 2
    */
    it('LinkHight_0100', 0, async (done: Function) => {
      console.info('LinkHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkHeight1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkHeight1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('100.00vp');
      console.info('[LinkHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0820
    * @tc.name  : LinkHight_0200
    * @tc.desc  : To test that the Link decorator supports union types.
    * @tc.level : Level 2
    */
    it('LinkHight_0200', 0, async (done: Function) => {
      console.info('LinkHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkHeight2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkHeight2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('200.00vp');
      console.info('[LinkHight_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0830
    * @tc.name  : LinkHight_0300
    * @tc.desc  : To test that the Link decorator supports union types.
    * @tc.level : Level 2
    */
    it('LinkHight_0300', 0, async (done: Function) => {
      console.info('LinkHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkHeight3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkHeight3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('200.00vp');
      console.info('[LinkHight_0100] END');
      done();
    });

  })
}

