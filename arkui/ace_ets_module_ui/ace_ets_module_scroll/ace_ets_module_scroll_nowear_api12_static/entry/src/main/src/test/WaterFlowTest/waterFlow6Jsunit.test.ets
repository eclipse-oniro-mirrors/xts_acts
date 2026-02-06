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

export default function waterFlow6Jsunit() {
  describe('waterFlow6Jsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlow6Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow6",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        // routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlow6Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow6" == pages.name)) {
          console.info("get waterFlow6Jsunit pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlow6Jsunit page error:" + err);
      }
      console.info("waterFlow6Jsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow6Jsunit after each called");
    });

    
    
/**
     * @tc.number   waterFlow6Jsunit_static_001
     * @tc.name     waterFlow6Jsunit_static_001
     * @tc.desc     waterFlow6Jsunit_static_001
     * @tc.level    Level.LEVEL1
     */
it('waterFlow6Jsunit_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlow6Jsunit_static_001] START');
      let strJson = inspector.getInspectorByKey('waterFlow_onReachText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlow6Jsunit_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onReachText: onReachStart:succ');
      await CommonFunc.sleep(1000);

      let swiperFlow = CommonFunc.getComponentRectOnScreen('water_event');
      let top = swiperFlow.top;
      let right = swiperFlow.right;
      let left = swiperFlow.left;
      let bottom = swiperFlow.bottom;
      console.info("waterFlow6Jsunit_static_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2) as int,Math.round(top + height*0.9) as int,Math.round(left + width/2) as int,Math.round(top + height*0.1) as int);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('waterFlow_onScrollText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[waterFlow6Jsunit_static_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[waterFlow6Jsunit_static_001] content1: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onScrollText: onScrollStop:succ');

      let strJson2 = inspector.getInspectorByKey('waterFlow_onText');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[waterFlow6Jsunit_static_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[waterFlow6Jsunit_static_001] content2: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onText: onDidScroll');

      let strJson3 = inspector.getInspectorByKey('waterFlow_onFrameBegin');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[waterFlow6Jsunit_static_001] component obj3 is: " + JSON.stringify(obj3));
      console.info("[waterFlow6Jsunit_static_001] content3: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onScrollFrameBegin: success');
      // console.info("[waterFlow6Jsunit_static_001] component obj3 end ");
      let btn = await driver.findComponent(ON.id('waterFlow_sctm'));
      // console.info("[waterFlow6Jsunit_static_001] get btn ");
      await (btn?.click() as Promise<void>);
      // console.info("[waterFlow6Jsunit_static_001] btn.click ");
      await CommonFunc.sleep(1000);
      // console.info("[waterFlow6Jsunit_static_001] sleep ");
      let strJson4 = inspector.getInspectorByKey('waterFlow_onReachText');
      // console.info("[waterFlow6Jsunit_static_001] strJson4 : " + strJson4);
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[waterFlow6Jsunit_static_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('onReachText: onReachEnd:succ');
      await CommonFunc.sleep(1000);

      let strJson5 = inspector.getInspectorByKey('waterFlow_onScrollIndex');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[waterFlow6Jsunit_static_001] component obj5 is: " + JSON.stringify(obj5));
      console.info("[waterFlow6Jsunit_static_001] content5: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('onScrollIndex: last:99');
      console.info('[waterFlow6Jsunit_static_001] END');
      done();
    });
  })
}
