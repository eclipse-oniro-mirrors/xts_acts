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
import router from '@system.router';
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


export default function ResourceFloat() {
  describe('ResourceFloat', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourceFloat beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Resource/ResourceFloat',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourceFloat state pages: " + JSON.stringify(pages));
        if (!("ResourceFloat" == pages.name)) {
          console.info("get ResourceFloat state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ResourceFloat success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceFloat page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ResourceFloat_0100', 0, async (done: Function) => {
      console.info('ResourceFloat_0100 START');
      let strJson = getInspectorByKey('float');
      let obj = JSON.parse(strJson);
      console.info("[ResourceFloat_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceFloat_0100] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('20.00vp');
      console.info('[ResourceFloat_0100] END');
      done();
    });

    it('ResourceFloat_0200', 0, async (done: Function) => {
      console.info('ResourceFloat_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('ResourceFloat'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('float');
      let obj = JSON.parse(strJson);
      console.info("[ResourceFloat_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceFloat_0200] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('40.00vp');
      console.info('[ResourceFloat_0200] END');
      done();
    });


  })
}

