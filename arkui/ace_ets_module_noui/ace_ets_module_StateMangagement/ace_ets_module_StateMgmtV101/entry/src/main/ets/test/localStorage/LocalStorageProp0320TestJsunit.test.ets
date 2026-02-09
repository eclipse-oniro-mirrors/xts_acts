/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


export default function LocalStorageProp0320TestJsunit() {
  describe('LocalStorageProp0320TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorageProp0320TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/localStorage/LocalStorageProp0320",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorageProp0320TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStorageProp0320" == pages.name)) {
          console.info("get LocalStorageProp0320TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStorageProp0320TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorageProp0320TestJsunit page error:" + err);
      }
      console.info("LocalStorageProp0320TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageProp0320TestJsunit after each called");
    });

    /**
     * @tc.name   LocalStorageProp0320TestJsunit_001
     * @tc.number LocalStorageProp0320TestJsunit_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageProp0320TestJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageProp0320TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLocalStorageProp0320"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv0320ParentSet'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0,1');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tv0320ParentMap'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('newValue');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tv0320ParentDate'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Thu Feb 01 2024 08:09:31 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tv0320ParentUnd'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('Helloundefined');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tv0320ParentNull'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('Hellonull');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tv0320ChildSet'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj1 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tv0320ChildMap'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.$attrs.content).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj7: ESObject = JSON.parse(getInspectorByKey('tv0320ChildDate'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.$attrs.content).assertEqual('Thu Feb 01 2024 08:09:30 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj8: ESObject = JSON.parse(getInspectorByKey('tv0320ChildUnd'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.$attrs.content).assertEqual('Helloundefined');
      await CommonFunc.sleep(1000);
      let obj9: ESObject = JSON.parse(getInspectorByKey('tv0320ChildNull'));
      console.info("[LocalStorageProp0320TestJsunit_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.$attrs.content).assertEqual('Hellonull');
      console.info('[LocalStorageProp0320TestJsunit_001] END');
      done();
    });
    /**
     * @tc.name   LocalStorageLink0320TestJsunit_002
     * @tc.number LocalStorageLink0320TestJsunit_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageLink0320TestJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageLink0320TestJsunit_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLocalStorageProp0320"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv0320ParentArr'));
      console.info("[LocalStorageLink0320TestJsunit_002] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Arr[1,true,{"propB":48}]');
      await CommonFunc.sleep(1000);

      console.info('[LocalStorageLink0310TestJsunit_001] END');
      done();
    });
  })
}
