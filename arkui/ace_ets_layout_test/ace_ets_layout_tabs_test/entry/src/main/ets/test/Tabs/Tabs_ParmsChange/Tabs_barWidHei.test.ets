/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

export default function Tabs_barWidHei() {
  describe('Tabs_barWidHei', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_barWidHei beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barWidHei",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_barWidHei state pages:" + JSON.stringify(pages));
        if (!("Tabs_barWidHei" == pages.name)) {
          console.info("get Tabs_barWidHei pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_barWidHei page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barWidHei page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barWidHei beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barWidHei after each called")
      globalThis.value.message.notify({
        name: 'currentIndex', value: 0
      });
    });
    /**
     * @tc.number SUB_ACE_TABS_BARWIDHEI_TEST_0100
     * @tc.name testTabsBarWidToNegative
     * @tc.desc The parent component sets the value of barWidth to a negative number .barwidth(-10)
     */
    it('testTabsBarWidToNegative', 0, async (done: Function) => {
      console.info('[testTabsBarWidToNegative] START');
      let strJson = getInspectorByKey('Tabs_barWidHei_01');

      console.info(`[testTabsBarWidToNegative] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarWidToNegative] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsBarWidToNegative] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarWidToNegative] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsBarWidToNegative] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe(Math.round((Tabs_barWidHei_011.right - 30)),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)),
        Math.round(Tabs_barWidHei_011.left + 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)),
        Math.round(Tabs_barWidHei_012.left + 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left -Tabs_barWidHei_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <=1 ).assertTrue();
   
      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);


      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative]subGreen.bottom - subGreen.top
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      

      console.info('[testTabsBarWidToNegative] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARWIDHEI_TEST_0200
     * @tc.name testTabsBarWidExceedTabsWid
     * @tc.desc The parent component sets the value of barWidth to a positive number (exceeding the width of Tabs)
     * .barwidth(400)
     */
    it('testTabsBarWidExceedTabsWid', 0, async (done: Function) => {
      console.info('[testTabsBarWidExceedTabsWid] START');
      globalThis.value.message.notify({
        name: 'setBarWidth', value: 400
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');

      console.info(`[testTabsBarWidExceedTabsWid] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarWidExceedTabsWid] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[testTabsBarWidExceedTabsWid] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarWidExceedTabsWid] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[testTabsBarWidExceedTabsWid] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)),
        Math.round(Tabs_barWidHei_011.left + 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)),
        Math.round(Tabs_barWidHei_012.left + 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
  
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <=1 ).assertTrue();
     

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);

      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <=1 ).assertTrue();
      

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);

      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
    
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
    
      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarWidExceedTabsWid]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) -Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

   
      console.info('[testTabsBarWidExceedTabsWid] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARWIDHEI_TEST_0300
     * @tc.name testTabsBarWidWithinTabsWid
     * @tc.desc The parent component sets the value of barWidth to a positive number
     * (a value within the Tabs width).barwidth(300)
     */
    it('testTabsBarWidWithinTabsWid', 0, async (done: Function) => {
      console.info('[testTabsBarWidWithinTabsWid] START');
      globalThis.value.message.notify({
        name: 'setBarWidth', value: 300
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');

      console.info(`[testTabsBarWidWithinTabsWid] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarWidWithinTabsWid] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[testTabsBarWidWithinTabsWid] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarWidWithinTabsWid] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[testTabsBarWidWithinTabsWid] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)),
        Math.round(Tabs_barWidHei_011.left + 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)),
        Math.round(Tabs_barWidHei_012.left + 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <=1 ).assertTrue();
    
      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
     
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <=1 ).assertTrue();
     

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
      ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`)
    
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
     
      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarWidWithinTabsWid]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(100))) <=1 ).assertTrue();

     
      console.info('[testTabsBarWidWithinTabsWid] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARWIDHEI_TEST_0400
     * @tc.name testTabsBarHeiExceedTabsHei
     * @tc.desc The parent component sets the value of barHeigh to a positive number (exceeding the height of Tabs)
     */
    it('testTabsBarHeiExceedTabsHei', 0, async (done: Function) => {
      console.info('[testTabsBarHeiExceedTabsHei] START');
      globalThis.value.message.notify({
        name: 'setBarWidth', value: 330
      });
      globalThis.value.message.notify({
        name: 'setBarHeight', value: 320
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');

      console.info(`[testTabsBarHeiExceedTabsHei] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarHeiExceedTabsHei] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[testTabsBarHeiExceedTabsHei] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarHeiExceedTabsHei] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[testTabsBarHeiExceedTabsHei] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)),
        Math.round(Tabs_barWidHei_011.left + 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)),
        Math.round(Tabs_barWidHei_012.left + 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
 
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <=1 ).assertTrue();
     

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <=1 ).assertTrue();

  

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarHeiExceedTabsHei]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

    
      console.info('[testTabsBarHeiExceedTabsHei] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARWIDHEI_TEST_0500
     * @tc.name testTabsBarHeiWithinTabsHei
     * @tc.desc The parent component sets the value of barHeigh to a positive number
     * (a value within the height range of Tabs).barHeight(100)
     */
    it('testTabsBarHeiWithinTabsHei', 0, async (done: Function) => {
      console.info('[testTabsBarHeiWithinTabsHei] START');
      globalThis.value.message.notify({
        name: 'setBarHeight', value: 100
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');

      console.info(`[testTabsBarHeiWithinTabsHei] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarHeiWithinTabsHei] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[testTabsBarHeiWithinTabsHei] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarHeiWithinTabsHei] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[testTabsBarHeiWithinTabsHei] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)),
        Math.round(Tabs_barWidHei_011.left + 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)),
        Math.round(Tabs_barWidHei_012.left + 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
 
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <=1 ).assertTrue();
    

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <=1 ).assertTrue();
   

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) - Math.round(vp2px(200))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) - Math.round(vp2px(200))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) - Math.round(vp2px(200))) <=1 ).assertTrue();
   
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) - Math.round(vp2px(200))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) - Math.round(vp2px(200))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) - Math.round(vp2px(200))) <=1 ).assertTrue();
      
      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarHeiWithinTabsHei]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(100))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
    
      console.info('[testTabsBarHeiWithinTabsHei] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARWIDHEI_TEST_0600
     * @tc.name testTabsBarHeiToNegative
     * @tc.desc The parent component sets the value of barHeight to a negative number
     */
    it('testTabsBarHeiToNegative', 0, async (done: Function) => {
      console.info('[testTabsBarHeiToNegative] START');
      globalThis.value.message.notify({
        name: 'setBarHeight', value: -10
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');

      console.info(`[testTabsBarHeiToNegative] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarHeiToNegative] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsBarHeiToNegative] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarHeiToNegative] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsBarHeiToNegative] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_001');
      let Tabs_barWidHei_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)),
        Math.round(Tabs_barWidHei_011.left + 30),
        Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_002');
      let Tabs_barWidHei_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)),
        Math.round(Tabs_barWidHei_012.left + 30),
        Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_003');
      let Tabs_barWidHei_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_013');
      let Tabs_barWidHei_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
     
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - Tabs_barWidHei_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - Tabs_barWidHei_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - Tabs_barWidHei_003.top) <=1 ).assertTrue();
     

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Math.abs(Tabs_barWidHei_011.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.left - Tabs_barWidHei_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.top - subYellow.bottom) <=1 ).assertTrue();

     

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      
      expect(Math.abs(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarHeiToNegative]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
     
      console.info('[testTabsBarHeiToNegative] END');
      done();
    });
  })
}
