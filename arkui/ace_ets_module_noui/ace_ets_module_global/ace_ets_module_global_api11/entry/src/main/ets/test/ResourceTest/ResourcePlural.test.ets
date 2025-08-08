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
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';


export default function ResourcePlural() {
  describe('ResourcePlural', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourcePlural beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourcePlural',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourcePlural state pages: " + JSON.stringify(pages));
        if (!("ResourcePlural" == pages.name)) {
          console.info("get ResourcePlural state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ResourcePlural success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourcePlural page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ResourcePlural_0100', 0, async (done: Function) => {
      console.info('ResourcePlural_0100 START');
      let strJson = getInspectorByKey('plural');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourcePlural_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourcePlural_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100 apples1');
      console.info('[ResourcePlural_0100] END');
      done();
    });

    it('ResourcePlural_0200', 0, async (done: Function) => {
      console.info('ResourcePlural_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let button = await driver.findComponent(ON.id('ResourcePlural'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('plural');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourcePlural_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourcePlural_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('100 apples2');
      console.info('[ResourcePlural_0200] END');
      done();
    });


  })
}

