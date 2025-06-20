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
export default function ResourceInteger() {
  describe('ResourceInteger', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourceInteger beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourceInteger',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourceInteger state pages: " + JSON.stringify(pages));
        if (!("ResourceInteger" == pages.name)) {
          console.info("get ResourceInteger state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ResourceInteger success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceInteger page error: " + err);
        expect().assertFail();
      }
      done();
    });
      /*
         * @tc.number       ResourceInteger_0100
         * @tc.name         ResourceInteger_0100
         * @tc.desic         ResourceInteger
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : LEVEL0
         */

    it('ResourceInteger_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ResourceInteger_0100 START');
      let strJson = getInspectorByKey('integer');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceInteger_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceInteger_0100] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('10.00fp');
      console.info('[ResourceInteger_0100] END');
      done();
    });

      /*
         * @tc.number       ResourceInteger_0200
         * @tc.name         ResourceInteger_0200
         * @tc.desic         ResourceInteger
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : LEVEL0
         */
    it('ResourceInteger_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ResourceInteger_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('ResourceInteger'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('integer');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceInteger_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceInteger_0200] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      console.info('[ResourceInteger_0200] END');
      done();
    });
  })
}