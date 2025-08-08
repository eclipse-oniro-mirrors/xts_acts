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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
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
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function tabs_WidHeiTest() {
  describe('tabs_WidHeiTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_WidHei beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_WidHei",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_WidHei state pages:" + JSON.stringify(pages));
        if (!("Tabs_WidHei" == pages.name)) {
          console.info("get Tabs_WidHei pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_WidHei page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_WidHei page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_WidHei beforeEach end");
      done();
    });
    afterEach(async () => {
      globalThis.value.message.notify({
        name: 'index', value: 0
      });
      await CommonFunc.sleep(2000);
      console.info("tabs_WidHeiTest after each called")
    });
    /**
     * @tc.number SUB_ACE_TABS_WIDHEI_TEST_0100
     * @tc.name testTabsWidHei01
     * @tc.desc set width of tabs to 330,height of tabs to 350
     */
    it('testTabsWidHei01', 0, async (done: Function) => {
      console.info('[testTabsWidHei01] START');
      globalThis.value.message.notify({
        name: 'width', value: 330
      });
      globalThis.value.message.notify({
        name: 'height', value: 350
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_WidHei_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_WidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_01');
      let Tabs_WidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_001');
      let Tabs_WidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_011');
      console.info(`[testTabsWidHei01] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsWidHei01] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsWidHei01] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsWidHei01] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsWidHei01] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsWidHei01] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_WidHei_011.right - ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6)),
        Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2)),
        Math.round(Tabs_WidHei_011.left + ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6)),
        Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_002');
      let Tabs_WidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_012');
      await driver.swipe(Math.round(Tabs_WidHei_012.right - ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6)),
        Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2)),
        Math.round(Tabs_WidHei_012.left + ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6)),
        Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_003');
      let Tabs_WidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Yellow');

      console.info(`[testTabsWidHei01] Tabs_WidHei_01.right -
       Tabs_WidHei_01.left = ${Tabs_WidHei_01.right - Tabs_WidHei_01.left}`);
      // expect(Math.abs() <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_01.right - Tabs_WidHei_01.left) - Math.round(vp2px(330))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_01.bottom - Tabs_WidHei_01.top) - Math.round(vp2px(350))) <=1 ).assertTrue();
     // expect(Math.round(Tabs_WidHei_01.right - Tabs_WidHei_01.left)).assertEqual(Math.round(vp2px(330)));
     // expect(Math.round(Tabs_WidHei_01.bottom - Tabs_WidHei_01.top)).assertEqual(Math.round(vp2px(350)));

      console.info(`[testTabsWidHei01] Tabs_WidHei_01.left = ${Tabs_WidHei_01.left}`);
      expect(Tabs_WidHei_01.left).assertEqual(Tabs_WidHei_011.left);
      expect(Tabs_WidHei_01.left).assertEqual(Tabs_WidHei_012.left);
      expect(Tabs_WidHei_01.left).assertEqual(Tabs_WidHei_013.left);

      console.info(`[testTabsWidHei01] Tabs_index_011.left = ${Tabs_WidHei_011.left}`);
      expect(Math.abs(Tabs_WidHei_011.left - Tabs_WidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_011.left - Tabs_WidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.left - Tabs_WidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_011.top - Tabs_WidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.top - Tabs_WidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.top - Tabs_WidHei_003.top) <=1 ).assertTrue();

      

      console.info(`[testTabsWidHei01] Tabs_WidHei_011.bottom -
      Tabs_WidHei_011.top = ${Tabs_WidHei_011.bottom - Tabs_WidHei_011.top}`);
      expect(Math.abs(Math.round(Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) - Math.round(vp2px(294))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) - Math.round(vp2px(294))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_013.bottom - Tabs_WidHei_013.top) - Math.round(vp2px(294))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_WidHei_011.right - Tabs_WidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.right - Tabs_WidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.right - Tabs_WidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsWidHei01] Tabs_WidHei_001.bottom -
      Tabs_WidHei_001.top = ${Tabs_WidHei_001.bottom - Tabs_WidHei_001.top}`);
      expect(Math.abs(Math.round(Tabs_WidHei_001.bottom - Tabs_WidHei_001.top) - Math.round(vp2px(294))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_002.bottom - Tabs_WidHei_002.top) - Math.round(vp2px(294))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_003.bottom - Tabs_WidHei_003.top) - Math.round(vp2px(294))) <=1 ).assertTrue();
     

      expect(Math.abs(Tabs_WidHei_001.right - Tabs_WidHei_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_002.right - Tabs_WidHei_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_WidHei_003.right - Tabs_WidHei_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsWidHei01] subGreen.bottom = ${subGreen.bottom}`);
      
      expect(Math.abs(subGreen.bottom - Tabs_WidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <=1 ).assertTrue();
     

      console.info(`[testTabsWidHei01]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
     
      console.info('[testTabsWidHei01] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_WIDHEI_TEST_0200
     * @tc.name testTabsWidHei02
     * @tc.desc set width of tabs to 300,height of tabs to 400
     */
    it('testTabsWidHei02', 0, async (done: Function) => {
      console.info('[testTabsWidHei02] START');
      globalThis.value.message.notify({
        name: 'width', value: 300
      });
      globalThis.value.message.notify({
        name: 'height', value: 400
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_WidHei_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_WidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_01');
      let Tabs_WidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_001');
      let Tabs_WidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_011');
      console.info(`[testTabsWidHei02] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsWidHei02] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsWidHei02] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsWidHei02] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsWidHei02] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsWidHei02] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_WidHei_011.right - ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6)),
        Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2)),
        Math.round(Tabs_WidHei_011.left + ((Tabs_WidHei_011.right - Tabs_WidHei_011.left) / 6)),
        Math.round(Tabs_WidHei_011.top + ((Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_002');
      let Tabs_WidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_012');
      await driver.swipe(Math.round(Tabs_WidHei_012.right - ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6)),
        Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2)),
        Math.round(Tabs_WidHei_012.left + ((Tabs_WidHei_012.right - Tabs_WidHei_012.left) / 6)),
        Math.round(Tabs_WidHei_012.top + ((Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_WidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_003');
      let Tabs_WidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_WidHei_Yellow');

      console.info(`[testTabsWidHei02] Tabs_WidHei_01.right -
      Tabs_WidHei_01.left = ${Tabs_WidHei_01.right - Tabs_WidHei_01.left}`);

      
      expect(Math.abs(Math.round(Tabs_WidHei_01.right - Tabs_WidHei_01.left) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_01.bottom - Tabs_WidHei_01.top) - Math.round(vp2px(400))) <=1 ).assertTrue();
     

      console.info(`[testTabsWidHei02] Tabs_WidHei_01.left = ${Tabs_WidHei_01.left}`);
      expect(Math.abs(Tabs_WidHei_01.left - Tabs_WidHei_011.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_01.left - Tabs_WidHei_012.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_01.left - Tabs_WidHei_013.left) <=1 ).assertTrue();

      

      console.info(`[testTabsWidHei02] Tabs_index_011.left = ${Tabs_WidHei_011.left}`);
      expect(Math.abs(Tabs_WidHei_011.left - Tabs_WidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.left -Tabs_WidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.left - Tabs_WidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_011.top - Tabs_WidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_012.top - Tabs_WidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_WidHei_013.top - Tabs_WidHei_003.top) <=1 ).assertTrue();

    
      console.info(`[testTabsWidHei02] Tabs_WidHei_011.bottom -
      Tabs_WidHei_011.top = ${Tabs_WidHei_011.bottom - Tabs_WidHei_011.top}`);
      expect(Math.abs(Math.round(Tabs_WidHei_011.bottom - Tabs_WidHei_011.top) - Math.round(vp2px(344))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_012.bottom - Tabs_WidHei_012.top) - Math.round(vp2px(344))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_013.bottom - Tabs_WidHei_013.top) - Math.round(vp2px(344))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_011.right - Tabs_WidHei_011.left) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_012.right - Tabs_WidHei_012.left) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_013.right - Tabs_WidHei_013.left) - Math.round(vp2px(300))) <=1 ).assertTrue();

      

      console.info(`[testTabsWidHei02] Tabs_WidHei_001.bottom -
      Tabs_WidHei_001.top = ${Tabs_WidHei_001.bottom - Tabs_WidHei_001.top}`);

      expect(Math.abs(Math.round(Tabs_WidHei_001.bottom - Tabs_WidHei_001.top) - Math.round(vp2px(344))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_002.bottom - Tabs_WidHei_002.top) - Math.round(vp2px(344))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_003.bottom - Tabs_WidHei_003.top) - Math.round(vp2px(344))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_001.right - Tabs_WidHei_001.left) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_002.right - Tabs_WidHei_002.left) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_WidHei_003.right - Tabs_WidHei_003.left) - Math.round(vp2px(300))) <=1 ).assertTrue();

     
      console.info(`[testTabsWidHei02] subGreen.bottom = ${subGreen.bottom}`);
      
      expect(Math.abs(subGreen.bottom - Tabs_WidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <=1 ).assertTrue();
    
      console.info(`[testTabsWidHei02]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(100))) <=1 ).assertTrue();

   
      console.info('[testTabsWidHei02] END');
      done();
    });
  })
}
