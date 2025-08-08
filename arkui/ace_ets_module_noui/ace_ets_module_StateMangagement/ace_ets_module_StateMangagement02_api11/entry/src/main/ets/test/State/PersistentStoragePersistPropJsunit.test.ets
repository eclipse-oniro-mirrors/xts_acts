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
  UiDriver,
  Component,
  Driver,
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
import events_emitter from '@ohos.events.emitter'


export default function PersistentStoragePersistPropJsunit() {
  describe('PersistentStoragePersistPropJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PersistentStoragePersistPropJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/State/PersistentStoragePersistProp",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PersistentStoragePersistPropJsunit state pages: " + JSON.stringify(pages));
        if (!("PersistentStoragePersistProp" == pages.name)) {
          console.info("get PersistentStoragePersistPropJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistentStoragePersistPropJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentStoragePersistPropJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    it('PersistentStoragePersistPropJsunit_0100', 0, async (done: Function) => {
      console.info('[PersistentStoragePersistPropJsunit_0100] START');
      let driver = await UiDriver.create()
      let button_PersistProp = await driver.findComponent(BY.key('button_PersistProp'));
      await button_PersistProp.click();
      await CommonFunc.sleep(1000);

      let button_Keys = await driver.findComponent(BY.key('button_Keys'));
      await button_Keys.click();
      await CommonFunc.sleep(1000);

      let text_button_Keys = await driver.findComponent(BY.key('text_button_Keys'));
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('text_button_Keys');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[PersistentStoragePersistPropJsunit_0100] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.$attrs.content).assertEqual('Keys:["aPropA","aPropB"]');
      let button_DeleteProp = await driver.findComponent(BY.key('button_DeleteProp'));
      await button_DeleteProp.click();
      await CommonFunc.sleep(1000);
      let button_Keys2 = await driver.findComponent(BY.key('button_Keys'));
      await button_Keys2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text_button_Keys');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[PersistentStoragePersistPropJsunit_0102] obj2 is: " + JSON.stringify(obj2));
      console.info(obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('Keys:["aPropA"]');
      console.info('[PersistentStoragePersistPropJsunit_0100] END');
      done();
    });

    it('PersistentStoragePersistPropJsunit_0200', 0, async (done: Function) => {

      console.info('[PersistentStoragePersistPropJsunit_0200] START');
      let driver = await UiDriver.create()

      let button_Keys = await driver.findComponent(BY.key('button_Keys'));
      await button_Keys.click();
      await CommonFunc.sleep(1000);

      let text_button_Keys = await driver.findComponent(BY.key('text_button_Keys'));
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('text_button_Keys');
      let obj3: ESObject = JSON.parse(strJson1);
      console.info("[PersistentStoragePersistPropJsunit_0200] obj3 is: " + JSON.stringify(obj3));

      expect(obj3.$attrs.content).assertEqual('Keys:["aPropA"]');
      console.info('[PersistentStoragePersistPropJsunit_0200] END');
      done();
    });

    it('PersistentStoragePersistPropJsunit_0300', 0, async (done: Function) => {
      console.info('[PersistentStoragePersistPropJsunit_0300] START');
      let driver = await UiDriver.create()
      let button_PersistProp_default = await driver.findComponent(BY.key('button_PersistProp_default'));
      await button_PersistProp_default.click();
      await CommonFunc.sleep(1000);
      let button_PersistProp_default_keys = await driver.findComponent(BY.key('button_PersistProp_default_keys'));
      let content = await button_PersistProp_default_keys.getText()
      expect(content).assertEqual('keys:aPropA:42,highScore:0,wightScore:1');
      console.info('[PersistentStoragePersistPropJsunit_0300] END');
      done();
    });
  })
}
