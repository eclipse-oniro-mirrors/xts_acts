/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';

const SLEEP_TIME = 1000;

export default function nestedScroll_CombinedTest() {
  describe('nestedScroll', () => {
    beforeEach(async (done: Function) => {
      console.info('nestedScroll beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/nestedScroll/nestedScroll_Combined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get nestedScroll state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('BorderImage' == pages.name)) {
          console.info('get nestedScroll state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push nestedScroll page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push nestedScroll page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('nestedScroll after each called');
    });

    /**
     * @tc.name   nestedScroll_Combined_0010
     * @tc.number nestedScroll_Combined_0010
     * @tc.desc   The nestedScroll is TabsNestedScrollMode.SELF_ONLY 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nestedScroll_Combined_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[nestedScroll_Combined_0010] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0010 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await driver.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Combinedtext01');
      console.info("[nestedScroll_Combined_0010] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[nestedScroll_Combined_0010] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('nestedScroll:TabsNestedScrollMode.SELF_ONLY');
    
      console.info('[nestedScroll_Combined_0010] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0020
     * @tc.number nestedScroll_Combined_0020
     * @tc.desc   The nestedScroll is TabsNestedScrollMode.SELF_FIRST 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('nestedScroll_Combined_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[nestedScroll_Combined_0020] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex01'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext02');
      console.info("[nestedScroll_Combined_0020] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0020] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:TabsNestedScrollMode.SELF_FIRST');
    
      console.info('[nestedScroll_Combined_0020] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0030
     * @tc.number nestedScroll_Combined_0030
     * @tc.desc   The nestedScroll is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll_Combined_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll_Combined_0030] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex02'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0030 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext01');
      console.info("[nestedScroll_Combined_0030] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0030] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:0');
    
      console.info('[nestedScroll_Combined_0030] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0040
     * @tc.number nestedScroll_Combined_0040
     * @tc.desc   The nestedScroll is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll_Combined_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll_Combined_0040] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex03'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0040 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext02');
      console.info("[nestedScroll_Combined_0040] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0040] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:1');
    
      console.info('[nestedScroll_Combined_0040] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0050
     * @tc.number nestedScroll_Combined_0050
     * @tc.desc   The nestedScroll is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll_Combined_0050', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll_Combined_0050] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex04'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0050 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext01');
      console.info("[nestedScroll_Combined_0050] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0050] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:10');
    
      console.info('[nestedScroll_Combined_0050] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0060
     * @tc.number nestedScroll_Combined_0060
     * @tc.desc   The nestedScroll is -5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll_Combined_0060', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll_Combined_0060] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex05'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0060 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext01');
      console.info("[nestedScroll_Combined_0060] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0060] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:-5');
    
      console.info('[nestedScroll_Combined_0060] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0070
     * @tc.number nestedScroll_Combined_0070
     * @tc.desc   The nestedScroll is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll_Combined_0070', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll_Combined_0070] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex06'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0070 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext01');
      console.info("[nestedScroll_Combined_0070] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0070] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:undefined');
    
      console.info('[nestedScroll_Combined_0070] END');
      done();
    });

    /**
     * @tc.name   nestedScroll_Combined_0080
     * @tc.number nestedScroll_Combined_0080
     * @tc.desc   The nestedScroll is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll_Combined_0080', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll_Combined_0080] START');
      let driver1 = Driver.create();
      let btn: Component = await driver1.findComponent(ON.id('CombinedIndex07'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('Combined');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("nestedScroll_Combined_0080 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver1.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('Combinedtext01');
      console.info("[nestedScroll_Combined_0080] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[nestedScroll_Combined_0080] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('nestedScroll:null');
    
      console.info('[nestedScroll_Combined_0080] END');
      done();
    });
  })
}
