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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function appStorageV2() {
  describe('appStorageV2', () => {
    beforeEach(async (done: Function) => {
      console.info("appStorageV2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/appStorageV2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get appStorageV2 state pages:" + JSON.stringify(pages));
        if (!("appStorageV2" == pages.name)) {
          console.info("get appStorageV2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push appStorageV2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push appStorageV2 page error:" + err);
      }
      console.info("appStorageV2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("appStorageV2 after each called");
    });

    /**
     * @tc.number    appStorageV2_001
     * @tc.name      appStorageV2_001
     * @tc.desc      all keys in AppStorage.
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('appStorageV2_001', 0, async (done: Function) => {
      console.info('[appStorageV2_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('appStorageV2_keys');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[appStorageV2_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('keys in AppStorage: SampleApp');
      console.info('[appStorageV2_001] END');
      done();
    });

    /**
     * @tc.number    appStorageV2_002
     * @tc.name      appStorageV2_002
     * @tc.desc      Global UI state storage for applications
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('appStorageV2_002', 0, async (done: Function) => {
      console.info('[appStorageV2_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("appStorageV2_num"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('appStorageV2_num');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[appStorageV2_002] component obj1 is: " + JSON.stringify(obj1));
      console.info("[appStorageV2_002] content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('prop.p1: 2');

      let btn2: Component = await driver.findComponent(ON.id("appStorageV2_remove"));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id("appStorageV2_connect"));
      await btn3.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('appStorageV2_num');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[appStorageV2_002] component obj2 is: " + JSON.stringify(obj2));
      console.info("[appStorageV2_002] content2: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('prop.p1: 0');
      console.info('[appStorageV2_002] END');
      done();
    });
  })
}
