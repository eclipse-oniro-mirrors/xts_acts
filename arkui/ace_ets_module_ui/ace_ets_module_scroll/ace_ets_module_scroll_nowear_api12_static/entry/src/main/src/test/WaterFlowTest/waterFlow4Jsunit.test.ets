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
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function waterFlow4Jsunit() {
  describe('waterFlow4Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlow4Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow4",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlow4Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow4" == pages.name)) {
          console.info("get waterFlow4Jsunit pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlow4Jsunit page error:" + err);
      }
      console.info("waterFlow4Jsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow4Jsunit after each called");
    });

    
    
/**
     * @tc.number   waterFlow4Jsunit_static_001
     * @tc.name     waterFlow4Jsunit_static_001
     * @tc.desc     waterFlow4Jsunit_static_001
     * @tc.level    Level.LEVEL1
     */
it('waterFlow4Jsunit_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlow4Jsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id("flow_delete_4"));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('flow_length_4');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[waterFlow4Jsunit_static_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[waterFlow4Jsunit_static_001] content: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('length: 99');

      let btn2 = await driver.findComponent(ON.id("flow_add_4"));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('flow_length_4');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[waterFlow4Jsunit_static_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[waterFlow4Jsunit_static_001] content: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('length: 100');
      console.info('[waterFlow4Jsunit_static_001] END');
      done();
    });
  })
}
