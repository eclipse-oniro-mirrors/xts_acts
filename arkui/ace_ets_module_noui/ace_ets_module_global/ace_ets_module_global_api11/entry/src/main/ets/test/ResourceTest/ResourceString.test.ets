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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';
export default function ResourceString() {
  describe('ResourceString', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourceString beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourceString',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourceString state pages: " + JSON.stringify(pages));
        if (!("ResourceString" == pages.name)) {
          console.info("get ResourceString state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ResourceString success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceString page error: " + err);
        expect().assertFail();
      }
      done();
    });

        /*
         * @tc.number       ResourceString_0100
         * @tc.name         ResourceString_0100
         * @tc.desic         ResourceString
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : LEVEL0
         */

    it('ResourceString_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ResourceString_0100 START');
      let strJson = getInspectorByKey('string');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceString_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceString_0100] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('1.00fp');
      console.info('[ResourceString_0100] END');
      done();
    });

        /*
         * @tc.number       ResourceString_0200
         * @tc.name         ResourceString_0200
         * @tc.desic         ResourceString
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : LEVEL0
         */
    it('ResourceString_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ResourceString_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('ResourceString'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('string');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceString_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceString_0200] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('2.00fp');
      console.info('[ResourceString_0200] END');
      done();
    });
  })
}