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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function Tabs_itemPadMar() {
  describe('Tabs_itemPadMar', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_itemPadMar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ItemsChange/Tabs_itemPadMar",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_itemPadMar state pages:" + JSON.stringify(pages));
        if (!("Tabs_itemPadMar" == pages.name)) {
          console.info("get Tabs_itemPadMar pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_itemPadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_itemPadMar page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_itemPadMar beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_itemPadMar after each called")
      globalThis.value.message.notify({
        name: 'currentIndex', value: 0
      });
    });
    /**
     * @tc.name   testTabsItemPad
     * @tc.number SUB_ACE_TABS_ITEMPADMAR_TEST_0100
     * @tc.desc   Set 20 padding for TabContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTabsItemPad', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsItemPad] START');
      globalThis.value.message.notify({
        name: 'dadPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemPadMar_01');

      console.info(`[testTabsItemPad] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsItemPad] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsItemPad] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsItemPad] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsItemPad] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_itemPadMar_011.right - ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6)),
        Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)),
        Math.round(Tabs_itemPadMar_011.left + ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6)),
        Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_012');
      await driver.swipe(Math.round(Tabs_itemPadMar_012.right - ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6)),
        Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)),
        Math.round(Tabs_itemPadMar_012.left + ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6)),
        Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemPad] Tabs_itemPadMar_011.left equal Tabs_itemPadMar_01.left=
        ${Tabs_itemPadMar_011.left} === ${Tabs_itemPadMar_01.left}`);
      
    
      expect(Math.abs(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_011.top - subGreen.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.top - subYellow.bottom) <=1 ).assertTrue();


      
      console.info(`[testTabsItemPad] Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left=
        ${Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left) - Math.round(vp2px(20))) <=1 ).assertTrue(); 
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top) - Math.round(vp2px(20))) <=1 ).assertTrue();
      
     

      expect(Math.abs(Tabs_itemPadMar_002.left - Tabs_itemPadMar_012.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.top - Tabs_itemPadMar_012.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.left - Tabs_itemPadMar_013.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.top - Tabs_itemPadMar_013.top) <=1 ).assertTrue();

     
      console.info(`[testTabsItemPad] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

    
      expect(Math.abs(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPad] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top) - Math.round(vp2px(204))) <=1 ).assertTrue(); 
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
   
    
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left) - Math.round(vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsItemPad] subGreen.bottom - subGreen.top=${Math.round(subGreen.bottom - subGreen.top)}`);
      
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

      
      console.info('[testTabsItemPad] END');
      done();
    });
    /**
     * @tc.name   testTabsItemMar
     * @tc.number SUB_ACE_TABS_ITEMPADMAR_TEST_0200
     * @tc.desc   Set 20 margin for TabContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTabsItemMar', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsItemMar] START');
      globalThis.value.message.notify({
        name: 'dadPadding', value: 0
      });
      globalThis.value.message.notify({
        name: 'dadMargin', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemPadMar_01');

      console.info(`[testTabsItemMar] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsItemMar] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsItemMar] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsItemMar] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsItemMar] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_itemPadMar_011.right - ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6)),
        Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)),
        Math.round(Tabs_itemPadMar_011.left + ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6)),
        Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_012');
      await driver.swipe(Math.round(Tabs_itemPadMar_012.right - ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6)),
        Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)),
        Math.round(Tabs_itemPadMar_012.left + ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6)),
        Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemMar] Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left=
        ${Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)}`);

      
      
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left) - Math.round(vp2px(20))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.top - subGreen.bottom) - Math.round(vp2px(20))) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.top - subYellow.bottom) <=1 ).assertTrue();

      

      console.info(`[testTabsItemMar] Tabs_itemPadMar_001.left equal Tabs_itemPadMar_011.left=
        ${Tabs_itemPadMar_001.left} === ${Tabs_itemPadMar_011.left}`);

      expect(Math.abs(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.left - Tabs_itemPadMar_012.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.top - Tabs_itemPadMar_012.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.left - Tabs_itemPadMar_013.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.top - Tabs_itemPadMar_013.top) <=1 ).assertTrue();

     
      console.info(`[testTabsItemMar] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);

     

      expect(Math.abs(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) - Math.round(vp2px(204))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) - Math.round(vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemMar] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top) - Math.round(vp2px(204))) <=1 ).assertTrue();  
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left) - Math.round(vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemMar] subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

      
      console.info('[testTabsItemMar] END');
      done();
    });
    /**
     * @tc.name   testTabsItemPadMar
     * @tc.number SUB_ACE_TABS_ITEMPADMAR_TEST_0300
     * @tc.desc   Set 20 padding and 20 margin for TabContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTabsItemPadMar', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsItemPadMar] START');
      globalThis.value.message.notify({
        name: 'dadPadding', value: 20
      });
      globalThis.value.message.notify({
        name: 'dadMargin', value: 20
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemPadMar_01');

      console.info(`[testTabsItemPadMar] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsItemPadMar] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsItemPadMar] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsItemPadMar] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsItemPadMar] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_itemPadMar_011.right - ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6)),
        Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)),
        Math.round(Tabs_itemPadMar_011.left + ((Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) / 6)),
        Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_012');
      await driver.swipe(Math.round(Tabs_itemPadMar_012.right - ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6)),
        Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)),
        Math.round(Tabs_itemPadMar_012.left + ((Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left) / 6)),
        Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left=
        ${Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left) - Math.round(vp2px(20))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.top - subGreen.bottom) - Math.round(vp2px(20))) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.top - subBlue.bottom) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.left - Tabs_itemPadMar_01.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.top - subYellow.bottom) <=1 ).assertTrue();

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left=
        ${Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)}`);

      expect(Math.abs(Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left) - Math.round(vp2px(20))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top) - Math.round(vp2px(20))) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.left - Tabs_itemPadMar_012.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.top - Tabs_itemPadMar_012.top) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.left - Tabs_itemPadMar_013.left) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.top - Tabs_itemPadMar_013.top) <=1 ).assertTrue();

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.abs(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) - Math.round(vp2px(204))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top) - Math.round(vp2px(244))) <=1 ).assertTrue();

      expect(Math.abs(Math.round(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left) - Math.round(vp2px(290))) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      let padMar: number = Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top
      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top=
        ${(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top)}`);

      expect(Math.abs(Math.floor((Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top) - (vp2px(300 - 56) - 4 * padMar))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top) - Math.round(vp2px(244))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top) - Math.round(vp2px(244))) <=1 ).assertTrue();


      expect(Math.abs(Math.floor((Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left) - (vp2px(330) - 4 * padMar))) <=1 ).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar] subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
  
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(vp2px(56))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(110))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(110))) <=1 ).assertTrue();

      
      console.info('[testTabsItemPadMar] END');
      done();
    });
  })
}