'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function waterFlow1Jsunit() {
  describe('waterFlow1Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlow1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow1",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlow1Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow1" == pages.name)) {
          console.info("get waterFlow1Jsunit pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlow1Jsunit page error:" + err);
      }
      console.info("waterFlow1Jsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow1Jsunit after each called");
    });

    
    
/**
     * @tc.number   waterFlow1Jsunit_static_001
     * @tc.name     waterFlow1Jsunit_static_001
     * @tc.desc     waterFlow1Jsunit_static_001
     * @tc.level    Level.LEVEL1
     */
it('waterFlow1Jsunit_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlow1Jsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id("flow_delete_1"));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('flow_length_1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[waterFlow1Jsunit_static_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[waterFlow1Jsunit_static_001] content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('length: 99');

      let btn2 = await driver.findComponent(ON.id("flow_add_1"));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('flow_length_1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[waterFlow1Jsunit_static_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[waterFlow1Jsunit_static_001] content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('length: 100');
      console.info('[waterFlow1Jsunit_static_001] END');
      done();
    });
  })
}
