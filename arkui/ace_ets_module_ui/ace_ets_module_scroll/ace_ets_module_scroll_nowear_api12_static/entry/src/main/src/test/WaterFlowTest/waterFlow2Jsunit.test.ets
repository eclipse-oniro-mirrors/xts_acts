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
import inspector from '@ohos.arkui.inspector';

export default function waterFlow2Jsunit() {
  describe('waterFlow2Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlow2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow2",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlow2Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow2" == pages.name)) {
          console.info("get waterFlow2Jsunit pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlow2Jsunit page error:" + err);
      }
      console.info("waterFlow2Jsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow2Jsunit after each called");
    });

    
    
/**
     * @tc.number   waterFlow2Jsunit_static_001
     * @tc.name     waterFlow2Jsunit_static_001
     * @tc.desc     waterFlow2Jsunit_static_001
     * @tc.level    Level.LEVEL1
     */
it('waterFlow2Jsunit_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlow2Jsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id("flow_layoutdir_2"));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id("flow_padding"));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('water_padding');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlow2Jsunit_static_001] component obj is: " + JSON.stringify(obj));
      console.info("[waterFlow2Jsunit_static_001] layoutDirection: " + JSON.stringify(obj.getElement('$attrs').getString('layoutDirection')));
      console.info("[waterFlow2Jsunit_static_001] padding: " + JSON.stringify(obj.getElement('$attrs').getString('padding')));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      console.info('[waterFlow2Jsunit_static_001] END');
      done();
    });
  })
}
