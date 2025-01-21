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

export default function tabs_IndexTest() {
  describe('Tabs_IndexTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_IndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabs_index/Tabs_index",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_index state pages:" + JSON.stringify(pages));
        if (!("Tabs_index" == pages.name)) {
          console.info("get Tabs_index pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_index page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_index page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_IndexTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_IndexTest after each called")
    });
    /**
     * @tc.number SUB_ACE_TABS_INDEX_TEST_0100
     * @tc.name testTabsIndexLessThanMin
     * @tc.desc set index of tabs to -1
     */
    it('testTabsIndexLessThanMin', 0, async (done: Function) => {
      console.info('[testTabsIndexLessThanMin] START');
      globalThis.value.message.notify({
        name: 'index', value: -1
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_Index_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexLessThanMin] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsIndexLessThanMin] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsIndexLessThanMin] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsIndexLessThanMin] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsIndexLessThanMin] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsIndexLessThanMin] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);

      let Tabs_index_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_01');
      let Tabs_index_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_001');
      let Tabs_index_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_011');
      let driver = Driver.create();
      await driver.swipe(Math.round((Tabs_index_011.right - 30)),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)),
        Math.round(Tabs_index_011.left + 30),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_002');
      let Tabs_index_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_012');
      await driver.swipe(Math.round(Tabs_index_012.right - 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)),
        Math.round(Tabs_index_012.left + 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_003');
      let Tabs_index_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Yellow');

      console.info(`[testTabsIndexLessThanMin] Tabs_index_01.left = ${Tabs_index_01.left}`);
  

      expect(Math.abs(Tabs_index_01.left - Tabs_index_011.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_012.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_013.left) <=1 ).assertTrue();
    
      console.info(`[testTabsIndexLessThanMin] Tabs_index_011.left = ${Tabs_index_011.left}`);

      expect(Math.abs(Tabs_index_011.left - Tabs_index_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_012.left - Tabs_index_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_013.left - Tabs_index_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_011.top - Tabs_index_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_012.top - Tabs_index_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_013.top - Tabs_index_003.top) <=1 ).assertTrue();

      

      console.info(`[testTabsIndexLessThanMin] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);
    

      expect(Math.abs(Math.round(Tabs_index_011.bottom - Tabs_index_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_012.bottom - Tabs_index_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_013.bottom - Tabs_index_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexLessThanMin] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);

      expect(Math.abs(Math.round(Tabs_index_001.bottom - Tabs_index_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_002.bottom - Tabs_index_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_003.bottom - Tabs_index_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue(); 

      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexLessThanMin] subGreen.bottom = ${subGreen.bottom}`);

      
      expect(Math.abs(subGreen.bottom - Tabs_index_001.top) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <=1 ).assertTrue();
     
      console.info(`[testTabsIndexLessThanMin] subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

     

      console.info('[testTabsIndexLessThanMin] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_INDEX_TEST_0200
     * @tc.name testTabsIndexNormal
     * @tc.desc set index of tabs to 1
     */
    it('testTabsIndexNormal', 0, async (done: Function) => {
      console.info('[testTabsIndexNormal] START');
      globalThis.value.message.notify({
        name: 'index', value: 1
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_Index_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("1");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexNormal] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsIndexNormal] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsIndexNormal] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsIndexNormal] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsIndexNormal] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsIndexNormal] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);
      let driver = Driver.create();
      let Tabs_index_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_002');
      let Tabs_index_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_012');
      await driver.swipe(Math.round(Tabs_index_012.right - 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)),
        Math.round(Tabs_index_012.left + 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_003');
      let Tabs_index_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Yellow');
      globalThis.value.message.notify({
        name: 'index', value: 0
      });
      await CommonFunc.sleep(1000);

      let Tabs_index_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_01');
      let Tabs_index_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_001');
      let Tabs_index_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_011');

      console.info(`[testTabsIndexNormal] Tabs_index_01.left = ${Tabs_index_01.left}`);
 

      expect(Math.abs(Tabs_index_01.left - Tabs_index_011.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_012.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_01.left - Tabs_index_013.left) <=1 ).assertTrue();


      console.info(`[testTabsIndexNormal] Tabs_index_011.left = ${Tabs_index_011.left}`);
      expect(Math.abs(Tabs_index_011.left - Tabs_index_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_012.left - Tabs_index_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_013.left - Tabs_index_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_011.top - Tabs_index_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_012.top - Tabs_index_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_013.top - Tabs_index_003.top) <=1 ).assertTrue();



      console.info(`[testTabsIndexNormal] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);

      expect(Math.abs(Math.round(Tabs_index_011.bottom - Tabs_index_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_012.bottom - Tabs_index_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_013.bottom - Tabs_index_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexNormal] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);
      expect(Math.abs(Math.round(Tabs_index_001.bottom - Tabs_index_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_002.bottom - Tabs_index_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_003.bottom - Tabs_index_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
     
      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexNormal] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs(subGreen.bottom - Tabs_index_001.top) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <=1 ).assertTrue();


      console.info(`[testTabsIndexNormal] subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_INDEX_TEST_0300
     * @tc.name testTabsIndexMoreThanMax
     * @tc.desc set index of tabs to 3
     */
    it('testTabsIndexMoreThanMax', 0, async (done: Function) => {
      console.info('[testTabsIndexMoreThanMax] START');
      globalThis.value.message.notify({
        name: 'index', value: 3
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_Index_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexMoreThanMax] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsIndexMoreThanMax] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsIndexMoreThanMax] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsIndexMoreThanMax] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsIndexMoreThanMax] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsIndexMoreThanMax] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);

      let Tabs_index_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_01');
      let Tabs_index_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_001');
      let Tabs_index_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_index_011.right - 30),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)),
        Math.round(Tabs_index_011.left + 30),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_002');
      let Tabs_index_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_012');
      await driver.swipe(Math.round(Tabs_index_012.right - 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)),
        Math.round(Tabs_index_012.left + 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_003');
      let Tabs_index_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_Index_Yellow');

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_01.left = ${Tabs_index_01.left}`);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_011.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_012.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_013.left);

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_011.left = ${Tabs_index_011.left}`);
        
      expect(Math.abs(Tabs_index_011.left - Tabs_index_001.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_012.left - Tabs_index_002.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_013.left - Tabs_index_003.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_011.top - Tabs_index_001.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_012.top - Tabs_index_002.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_index_013.top - Tabs_index_003.top) <=1 ).assertTrue();
 
      console.info(`[testTabsIndexMoreThanMax] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);
     
      expect(Math.abs(Math.round(Tabs_index_011.bottom - Tabs_index_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_012.bottom - Tabs_index_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_013.bottom - Tabs_index_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

    
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);

      expect(Math.abs(Math.round(Tabs_index_001.bottom - Tabs_index_001.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_002.bottom - Tabs_index_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_index_003.bottom - Tabs_index_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexMoreThanMax] subGreen.bottom = ${subGreen.bottom}`);
   
      expect(Math.abs(subGreen.bottom - Tabs_index_001.top) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <=1 ).assertTrue();

      
      console.info(`[testTabsIndexMoreThanMax] subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();


      

      console.info('[testTabsIndexMoreThanMax] END');
      done();
    });
  })
}
