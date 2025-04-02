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
import CommonFunc from '../../MainAbility/utils/Common';


export default function StorageProp26Jsunit() {
  describe('StorageProp26Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageProp26Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageProp26',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageProp26Jsunit state pages: " + JSON.stringify(pages));
        if (!("StorageProp26" == pages.name)) {
          console.info("get StorageProp26Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageProp26Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp26Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('StorageProp26Jsunit_0100', 0, async (done: Function) => {
      console.info('[StorageProp26Jsunit_0100] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('son1PropA'));
      await button_son1.click();
      await CommonFunc.sleep(1000);
      await button_son1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('childPropA');
      let obj1 = JSON.parse(strJson1);
      console.info("[StorageProp26Jsunit_0200] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('childPropA: 3');

      let strJson2 = getInspectorByKey('fatherPropA');
      let obj2 = JSON.parse(strJson2);
      console.info("[StorageProp26Jsunit_0200] obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('fatherPropA: 1');
      console.info('[StorageProp26Jsunit_0200] END');
      done();
    });

    it('StorageProp26Jsunit_0300', 0, async (done: Function) => {
      console.info('[StorageProp26Jsunit_0300] START');
      let driver = await UiDriver.create()
      let button_son1 = await driver.findComponent(BY.key('button221'));
      await button_son1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('childPropA');
      let obj1 = JSON.parse(strJson1);
      console.info("[StorageProp26Jsunit_0300] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('childPropA: 3');

      let strJson2 = getInspectorByKey('fatherPropA');
      let obj2 = JSON.parse(strJson2);
      console.info("[StorageProp26Jsunit_0300] obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('fatherPropA: 34');
      console.info('[StorageProp26Jsunit_0300] END');
      done();
    });
  })
}
