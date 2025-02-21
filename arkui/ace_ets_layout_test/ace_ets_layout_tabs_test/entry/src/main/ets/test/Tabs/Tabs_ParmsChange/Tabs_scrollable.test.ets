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

export default function Tabs_scrollable() {
  describe('Tabs_scrollable', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_scrollable beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_scrollable",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_scrollable state pages:" + JSON.stringify(pages));
        if (!("Tabs_scrollable" == pages.name)) {
          console.info("get Tabs_scrollable pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_scrollable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_scrollable page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_scrollable beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_scrollable after each called");
      globalThis.value.message.notify({
        name: 'currentIndex', value: 0
      });
    });
    /**
     * @tc.number SUB_ACE_TABS_SCROLLABLE_TEST_0100
     * @tc.name testTabsScrollableToTrue
     * @tc.desc The parent component sets scrollable to true
     */
    it('testTabsScrollableToTrue', 0, async (done: Function) => {
      console.info('[testTabsScrollableToTrue] START');
      let strJson = getInspectorByKey('Tabs_scrollable_01');

      console.info("[testTabsScrollableToTrue] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[testTabsScrollableToTrue] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsScrollableToTrue] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsScrollableToTrue] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsScrollableToTrue] vertical: " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
      console.info("[testTabsScrollableToTrue] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_scrollable_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_001');
      let Tabs_scrollable_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_scrollable_011.right - 30),
        Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2)),
        Math.round(Tabs_scrollable_011.left + 30),
        Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_002');
      let Tabs_scrollable_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_012');
      await driver.swipe(Math.round(Tabs_scrollable_012.right - 30),
        Math.round(Tabs_scrollable_012.top + ((Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) / 2)),
        Math.round(Tabs_scrollable_012.left + 30),
        Math.round(Tabs_scrollable_012.top + ((Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_003');
      let Tabs_scrollable_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_013');
      let Tabs_scrollable_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_yellow');

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_011.left equal Tabs_scrollable_001.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_001.left}`);
       

      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top -  Tabs_scrollable_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - Tabs_scrollable_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - Tabs_scrollable_003.top) <=1 ).assertTrue();

     // expect(Tabs_scrollable_011.left).assertEqual(Tabs_scrollable_001.left);
      //expect(Tabs_scrollable_012.left).assertEqual(Tabs_scrollable_002.left);
      //expect(Tabs_scrollable_013.left).assertEqual(Tabs_scrollable_003.left);
      //expect(Tabs_scrollable_011.top).assertEqual(Tabs_scrollable_001.top);
      //expect(Tabs_scrollable_012.top).assertEqual(Tabs_scrollable_002.top);
      ///expect(Tabs_scrollable_013.top).assertEqual(Tabs_scrollable_003.top);

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_011.left equal Tabs_scrollable_01.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_01.left}`);

      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - subYellow.bottom) <=1 ).assertTrue();

      
      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_011.bottom - Tabs_scrollable_011.top=
        ${Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)}`);
      

      expect(Math.abs(Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue(); 
      expect(Math.abs(Math.round(Tabs_scrollable_013.bottom - Tabs_scrollable_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_scrollable_011.right - Tabs_scrollable_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.right - Tabs_scrollable_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.right - Tabs_scrollable_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_001.bottom - Tabs_scrollable_001.top=
        ${Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)}`);
      expect(Math.abs(Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_002.bottom - Tabs_scrollable_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_003.bottom - Tabs_scrollable_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_scrollable_001.right - Tabs_scrollable_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_002.right - Tabs_scrollable_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_003.right - Tabs_scrollable_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

     
      console.info('[testTabsScrollableToTrue] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_SCROLLABLE_TEST_0200
     * @tc.name testTabsScrollableToFalse
     * @tc.desc The parent component sets scrollable to false
     */
    it('testTabsScrollableToFalse', 0, async (done: Function) => {
      console.info('[testTabsScrollableToFalse] START');
      let strJson = getInspectorByKey('Tabs_scrollable_02');

      console.info("[testTabsScrollableToFalse] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[testTabsScrollableToFalse] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[testTabsScrollableToFalse] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsScrollableToFalse] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsScrollableToFalse] vertical: " + JSON.stringify(JSON.parse(strJson).$attrs.vertical));
      console.info("[testTabsScrollableToFalse] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(false);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_scrollable_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_004');
      let Tabs_scrollable_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_041');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_scrollable_011.right - 30),
        Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2)),
        Math.round(Tabs_scrollable_011.left + 30),
        Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_0012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_004');
      let Tabs_scrollable_0112: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_041');
      let btn1 = await driver.findComponent(ON.text('blueTwo'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_005');
      let Tabs_scrollable_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_042');
      let btn2 = await driver.findComponent(ON.text('yellowTwo'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_006');
      let Tabs_scrollable_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_043');
      let Tabs_scrollable_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_02');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_greenTwo');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_blueTwo');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_yellowTwo');

      console.info(`[testTabsScrollableToFalse]Tabs_scrollable_011.left equal Tabs_scrollable_001.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_001.left}`);

    
      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - Tabs_scrollable_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - Tabs_scrollable_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - Tabs_scrollable_003.top) <=1 ).assertTrue();

     

      console.info(`[testTabsScrollableToFalse]Tabs_scrollable_011.left equal Tabs_scrollable_01.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_01.left}`);

      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top-subYellow.bottom) <=1 ).assertTrue();
      
      console.info(`[testTabsScrollableToFalse]Tabs_scrollable_011.bottom - Tabs_scrollable_011.top=
        ${Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)}`);

      expect(Math.abs(Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_013.bottom - Tabs_scrollable_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      
      
      expect(Math.abs(Tabs_scrollable_011.right - Tabs_scrollable_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.right - Tabs_scrollable_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.right - Tabs_scrollable_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[ ]Tabs_scrollable_001.bottom - Tabs_scrollable_001.top=
        ${Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)}`);

      expect(Math.abs(Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();  
      
      expect(Math.abs(Math.round(Tabs_scrollable_002.bottom - Tabs_scrollable_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_003.bottom - Tabs_scrollable_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_scrollable_001.right - Tabs_scrollable_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_002.right - Tabs_scrollable_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_003.right - Tabs_scrollable_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsScrollableToFalse]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

      
      console.info('[testTabsScrollableToFalse] END');
      done();
    });
  })
}
