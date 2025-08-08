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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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

export default function LocalStorageLink0310TestJsunit() {
  describe('LocalStorageLink0310TestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorageLink0310TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/local_storage/LocalStorageLink0310",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorageLink0310TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStorageLink0310" == pages.name)) {
          console.info("get LocalStorageLink0310TestJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStorageLink0310TestJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorageLink0310TestJsunit page error:" + err);
      }
      console.info("LocalStorageLink0310TestJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageLink0310TestJsunit after each called");
    });

    /**
     * @tc.number LocalStorageLink0310TestJsunit_001
     * @tc.name LocalStorageLink0310TestJsunit_001
     * @tc.desc Frequently updating and modifying the values of parent components
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('LocalStorageLink0310TestJsunit_001', 0, async (done: Function) => {
      console.info('[LocalStorageLink0310TestJsunit_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLocalStorageLink0310"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv0310ParentSet'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0,1');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tv0310ParentMap'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('newValue');
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(getInspectorByKey('tv0310ParentDate'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Thu Feb 01 2024 08:09:31 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(getInspectorByKey('tv0310ParentUnd'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('Helloundefined');
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(getInspectorByKey('tv0310ParentNull'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('Hellonull');
      await CommonFunc.sleep(1000);
      let obj5: ESObject = JSON.parse(getInspectorByKey('tv0310ChildSet'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj1 is: " + JSON.stringify(obj5));
      expect(obj5.$attrs.content).assertEqual('0,1');
      await CommonFunc.sleep(1000);
      let obj6: ESObject = JSON.parse(getInspectorByKey('tv0310ChildMap'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.$attrs.content).assertEqual('newValue');
      await CommonFunc.sleep(1000);
      let obj7: ESObject = JSON.parse(getInspectorByKey('tv0310ChildDate'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.$attrs.content).assertEqual('Thu Feb 01 2024 08:09:31 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj8: ESObject = JSON.parse(getInspectorByKey('tv0310ChildUnd'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.$attrs.content).assertEqual('Helloundefined');
      await CommonFunc.sleep(1000);
      let obj9: ESObject = JSON.parse(getInspectorByKey('tv0310ChildNull'));
      console.info("[LocalStorageLink0310TestJsunit_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.$attrs.content).assertEqual('Hellonull');
      console.info('[LocalStorageLink0310TestJsunit_001] END');
      done();
    });
    /**
     * @tc.number LocalStorageLink0310TestJsunit_002
     * @tc.name LocalStorageLink0310TestJsunit_002
     * @tc.desc Frequently updating and modifying the values of parent components
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('LocalStorageLink0310TestJsunit_002', 0, async (done: Function) => {
      console.info('[LocalStorageLink0310TestJsunit_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("btnLocalStorageLink0310"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tv0310ParentArr'));
      console.info("[LocalStorageLink0310TestJsunit_002] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Arr[1,true,{"propB":48}]');
      await CommonFunc.sleep(1000);

      let obj5: ESObject = JSON.parse(getInspectorByKey('tv0310ChildArr'));
      console.info("[LocalStorageLink0310TestJsunit_002] component obj1 is: " + obj5.$attrs.content);
      expect(obj5.$attrs.content).assertEqual('Arr[1,true,{"propB":48}]');
      await CommonFunc.sleep(1000);

      console.info('[LocalStorageLink0310TestJsunit_001] END');
      done();
    });
  })
}
