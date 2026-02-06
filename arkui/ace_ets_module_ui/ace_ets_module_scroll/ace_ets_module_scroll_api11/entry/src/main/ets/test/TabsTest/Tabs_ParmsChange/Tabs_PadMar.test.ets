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

function tabsDefaultBarSize(sysWidth: Resource) {
  let resourceBarSize = getContext().resourceManager.getNumber(sysWidth.id)
  let newBarSize: number = Math.round(resourceBarSize)
  return newBarSize;
}

export default function tabs_PadMarTest() {
  describe('Tabs_PadMarTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_PadMar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_PadMar",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_PadMar state pages:" + JSON.stringify(pages));
        if (!("Tabs_PadMar" == pages.name)) {
          console.info("get Tabs_PadMar pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_PadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_PadMar page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_PadMar beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({
        name: 'index', value: 0
      });
      globalThis.value.message.notify({
        name: 'padding', value: 0
      });
      globalThis.value.message.notify({
        name: 'margin', value: 0
      });
      console.info("Tabs_PadMarTest after each called")
    });
    /**
     * @tc.number SUB_ACE_TABS_PADMAR_TEST_0100
     * @tc.name testTabsPad
     * @tc.desc set padding of tabs to 20
     */
    it('testTabsPad', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsPad] START');
      globalThis.value.message.notify({
        name: 'padding', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_PadMar_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_PadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_01');
      let Tabs_PadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_001');
      let Tabs_PadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_011');
      console.info(`[testTabsPad] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsPad] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsPad] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsPad] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsPad] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsPad] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_PadMar_011.right - ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6)),
        Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2)),
        Math.round(Tabs_PadMar_011.left + ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6)),
        Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2)));
      await CommonFunc.sleep(2000);
      let Tabs_PadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_002');
      let Tabs_PadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_012');
      await driver.swipe(Math.round(Tabs_PadMar_012.right - ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6)),
        Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2)),
        Math.round(Tabs_PadMar_012.left + ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6)),
        Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2)));
      await CommonFunc.sleep(2000);
      let Tabs_PadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_003');
      let Tabs_PadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Yellow');

      let barDefPad: number = tabsDefaultBarSize($r('sys.float.tab_bar_board_focus_padding'))
      console.info(`[testTabsPad]barDefPad = ${barDefPad}`);
      let barDefHei: number = tabsDefaultBarSize($r('sys.float.tab_bar_default_height'))
      console.info(`[testTabsPad]barDefHei = ${barDefHei}`);
      let subGreen_wid = subGreen.right - subGreen.left;
      let subGreen_hei = subGreen.bottom - subGreen.top + 2*barDefPad;
      console.info(`[testTabsPad]subGreen_wid = ${subGreen_wid}`);
      console.info(`[testTabsPad]subGreen_hei = ${subGreen_hei}`);
     
      console.info(`[testTabsPad] Tabs_PadMar_011.left -
      Tabs_PadMar_01.left = ${Tabs_PadMar_011.left - Tabs_PadMar_01.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subGreen.top - Tabs_PadMar_01.top) - vp2px(20) - barDefPad)) <= 1).assertTrue();

      console.info(`[testTabsPad] Tabs_index_011.left = ${Tabs_PadMar_011.left}`);
      expect(Math.abs(Tabs_PadMar_011.left - Tabs_PadMar_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.left - Tabs_PadMar_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.left - Tabs_PadMar_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_011.top - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.top - Tabs_PadMar_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.top - Tabs_PadMar_003.top) <= 1).assertTrue();

      let Tabs_PadMar_01_width = Tabs_PadMar_01.right - Tabs_PadMar_01.left;
      let Tabs_PadMar_01_height = Tabs_PadMar_01.bottom - Tabs_PadMar_01.top;
      console.info('[testTabsPad] Tabs_PadMar_01_width: ' + Tabs_PadMar_01_width);
      console.info('[testTabsPad] Tabs_PadMar_01_height: ' + Tabs_PadMar_01_height);
      
      let Tabs_PadMar_001_width = Tabs_PadMar_001.right - Tabs_PadMar_001.left;
      let Tabs_PadMar_001_height = Tabs_PadMar_001.bottom - Tabs_PadMar_001.top;
      console.info('[testTabsPad] Tabs_PadMar_001_width: ' + Tabs_PadMar_001_width);
      console.info('[testTabsPad] Tabs_PadMar_001_height: ' + Tabs_PadMar_001_height);

      console.info(`[testTabsPad] Tabs_PadMar_011.bottom - Tabs_PadMar_011.top
        = ${Tabs_PadMar_011.bottom - Tabs_PadMar_011.top}`);
      console.info(`[testTabsPad] Tabs_PadMar_01_height - barDefHei - vp2px(40)
        = ${Tabs_PadMar_01_height - barDefHei - vp2px(40)}`);
      console.info(`[testTabsPad] Tabs_PadMar_011.right - Tabs_PadMar_011.left
        = ${Tabs_PadMar_011.right - Tabs_PadMar_011.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.bottom - Tabs_PadMar_013.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_011.right - Tabs_PadMar_011.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.right - Tabs_PadMar_012.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.right - Tabs_PadMar_013.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPad] Tabs_PadMar_001.bottom -
        Tabs_PadMar_001.top = ${Tabs_PadMar_001.bottom - Tabs_PadMar_001.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_001.bottom - Tabs_PadMar_001.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.bottom - Tabs_PadMar_002.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.bottom - Tabs_PadMar_003.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_001.right - Tabs_PadMar_001.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.right - Tabs_PadMar_002.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.right - Tabs_PadMar_003.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPad] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs((subGreen.bottom + barDefPad) - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsPad]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      console.info(`[testTabsPad](barDefHei - 2*barDefPad) = ${barDefHei - 2*barDefPad}`);
      console.info(`[testTabsPad]subGreen.right - subGreen.left = ${subGreen.right - subGreen.left}`);
      expect(Math.floor(Math.abs((subGreen.bottom - subGreen.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subBlue.bottom - subBlue.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subYellow.bottom - subYellow.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.floor(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.floor(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.floor(Tabs_PadMar_001_width/3)) <= 1).assertTrue();

      console.info('[testTabsPad] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_PADMAR_TEST_0200
     * @tc.name testTabsMar
     * @tc.desc set margin of tabs to 20
     */
    it('testTabsMar', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsMar] START');
      globalThis.value.message.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_PadMar_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_PadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_01');
      let Tabs_PadMar_Column_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Column_01');
      let Tabs_PadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_001');
      let Tabs_PadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_011');
      console.info(`[testTabsMar] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsMar] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsMar] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsMar] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsMar] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsMar] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_PadMar_011.right - ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6)),
        Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2)),
        Math.round(Tabs_PadMar_011.left + ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6)),
        Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2)));
      await CommonFunc.sleep(2000);
      let Tabs_PadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_002');
      let Tabs_PadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_012');
      await driver.swipe(Math.round(Tabs_PadMar_012.right - ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6)),
        Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2)),
        Math.round(Tabs_PadMar_012.left + ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6)),
        Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2)));
      await CommonFunc.sleep(2000);
      let Tabs_PadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_003');
      let Tabs_PadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Yellow');

      let barDefPad: number = tabsDefaultBarSize($r('sys.float.tab_bar_board_focus_padding'))
      console.info(`[testTabsMar]barDefPad = ${barDefPad}`);
      let barDefHei: number = tabsDefaultBarSize($r('sys.float.tab_bar_default_height'))
      console.info(`[testTabsMar]barDefHei = ${barDefHei}`);
      let subGreen_wid = subGreen.right - subGreen.left;
      let subGreen_hei = subGreen.bottom - subGreen.top + 2*barDefPad;
      console.info(`[testTabsMar]subGreen_wid = ${subGreen_wid}`);
      console.info(`[testTabsMar]subGreen_hei = ${subGreen_hei}`);
     
      console.info(`[testTabsMar] Tabs_PadMar_01.left -
        Tabs_PadMar_Column_01.left = ${Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left}`);

      expect(Math.abs(Math.round(Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_01.top - Tabs_PadMar_Column_01.top) - Math.round(vp2px(20))) <= 1)
        .assertTrue();

      console.info(`[testTabsMar] Tabs_index_011.left = ${Tabs_PadMar_011.left}`);
      expect(Math.abs(Tabs_PadMar_011.left - Tabs_PadMar_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.left - Tabs_PadMar_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.left - Tabs_PadMar_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_011.top - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.top - Tabs_PadMar_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.top - Tabs_PadMar_003.top) <= 1).assertTrue();

      let Tabs_PadMar_01_width = Tabs_PadMar_01.right - Tabs_PadMar_01.left;
      let Tabs_PadMar_01_height = Tabs_PadMar_01.bottom - Tabs_PadMar_01.top;
      console.info('[testTabsMar] Tabs_PadMar_01_width: ' + Tabs_PadMar_01_width);
      console.info('[testTabsMar] Tabs_PadMar_01_height: ' + Tabs_PadMar_01_height);
      
      let Tabs_PadMar_001_width = Tabs_PadMar_001.right - Tabs_PadMar_001.left;
      let Tabs_PadMar_001_height = Tabs_PadMar_001.bottom - Tabs_PadMar_001.top;
      console.info('[testTabsMar] Tabs_PadMar_001_width: ' + Tabs_PadMar_001_width);
      console.info('[testTabsMar] Tabs_PadMar_001_height: ' + Tabs_PadMar_001_height);

      console.info(`[testTabsMar] Tabs_PadMar_011.bottom - Tabs_PadMar_011.top
        = ${Tabs_PadMar_011.bottom - Tabs_PadMar_011.top}`);
      console.info(`[testTabsMar] Tabs_PadMar_01_height-barDefHei
        = ${Tabs_PadMar_01_height-barDefHei}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) - Math.round(Tabs_PadMar_01_height-barDefHei)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) - Math.round(Tabs_PadMar_01_height-barDefHei)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.bottom - Tabs_PadMar_013.top) - Math.round(Tabs_PadMar_01_height-barDefHei)) <= 1)
        .assertTrue();
      expect(Math.abs(Tabs_PadMar_011.right - Tabs_PadMar_011.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.right - Tabs_PadMar_012.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.right - Tabs_PadMar_013.left - Tabs_PadMar_01_width) <= 1).assertTrue();

      console.info(`[testTabsMar] Tabs_PadMar_001.bottom -
        Tabs_PadMar_001.top = ${Tabs_PadMar_001.bottom - Tabs_PadMar_001.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_001.bottom - Tabs_PadMar_001.top) - Math.round(Tabs_PadMar_01_height-barDefHei)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.bottom - Tabs_PadMar_002.top) - Math.round(Tabs_PadMar_01_height-barDefHei)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.bottom - Tabs_PadMar_003.top) - Math.round(Tabs_PadMar_01_height-barDefHei)) <= 1)
        .assertTrue();
      expect(Math.abs(Tabs_PadMar_001.right - Tabs_PadMar_001.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_002.right - Tabs_PadMar_002.left - Tabs_PadMar_01_width) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_003.right - Tabs_PadMar_003.left - Tabs_PadMar_01_width) <= 1).assertTrue();

      console.info(`[testTabsMar] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs((subGreen.bottom + barDefPad) - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsMar]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      console.info(`[testTabsMar](barDefHei - 2*barDefPad) = ${barDefHei - 2*barDefPad}`);
      console.info(`[testTabsMar]subGreen.right - subGreen.left = ${subGreen.right - subGreen.left}`);
      expect(Math.floor(Math.abs((subGreen.bottom - subGreen.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subBlue.bottom - subBlue.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subYellow.bottom - subYellow.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      console.info('[testTabsMar] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_PADMAR_TEST_0300
     * @tc.name testTabsPadMar
     * @tc.desc set padding of tabs to 20,margin of tabs to 20
     */
    it('testTabsPadMar', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsPadMar] START');
      globalThis.value.message.notify({
        name: 'padding', value: 20
      });
      globalThis.value.message.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_PadMar_01');

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_PadMar_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_01');
      let Tabs_PadMar_Column_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Column_01');
      let Tabs_PadMar_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_001');
      let Tabs_PadMar_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_011');
      console.info(`[testTabsPadMar] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info(`[testTabsPadMar] barPosition: ${JSON.stringify(JSON.parse(strJson).$attrs.barPosition)}`);
      console.info(`[testTabsPadMar] index: ${JSON.stringify(JSON.parse(strJson).$attrs.index)}`);
      console.info(`[testTabsPadMar] scrollable: ${JSON.stringify(JSON.parse(strJson).$attrs.scrollable)}`);
      console.info(`[testTabsPadMar] vertical: ${JSON.stringify(JSON.parse(strJson).$attrs.vertical)}`);
      console.info(`[testTabsPadMar] barMode: ${JSON.stringify(JSON.parse(strJson).$attrs.barMode)}`);
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_PadMar_011.right - ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6)),
        Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2)),
        Math.round(Tabs_PadMar_011.left + ((Tabs_PadMar_011.right - Tabs_PadMar_011.left) / 6)),
        Math.round(Tabs_PadMar_011.top + ((Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) / 2)));
      await CommonFunc.sleep(2000);
      let Tabs_PadMar_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_002');
      let Tabs_PadMar_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_012');
      await driver.swipe(Math.round(Tabs_PadMar_012.right - ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6)),
        Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2)),
        Math.round(Tabs_PadMar_012.left + ((Tabs_PadMar_012.right - Tabs_PadMar_012.left) / 6)),
        Math.round(Tabs_PadMar_012.top + ((Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) / 2)));
      await CommonFunc.sleep(2000);
      let Tabs_PadMar_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_003');
      let Tabs_PadMar_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_013');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_PadMar_Yellow');

      let barDefPad: number = tabsDefaultBarSize($r('sys.float.tab_bar_board_focus_padding'))
      console.info(`[testTabsPadMar]barDefPad = ${barDefPad}`);
      let barDefHei: number = tabsDefaultBarSize($r('sys.float.tab_bar_default_height'))
      console.info(`[testTabsPadMar]barDefHei = ${barDefHei}`);
      let subGreen_wid = subGreen.right - subGreen.left;
      let subGreen_hei = subGreen.bottom - subGreen.top + 2*barDefPad;
      console.info(`[testTabsPadMar]subGreen_wid = ${subGreen_wid}`);
      console.info(`[testTabsPadMar]subGreen_hei = ${subGreen_hei}`);
      
      console.info(`[testTabsPadMar] Tabs_PadMar_01.left -
        Tabs_PadMar_Column_01.left = ${Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_01.left - Tabs_PadMar_Column_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_01.top - Tabs_PadMar_Column_01.top) - Math.round(vp2px(20))) <= 1)
        .assertTrue();

      console.info(`[testTabsPadMar] Tabs_PadMar_011.left -
        Tabs_PadMar_01.left = ${Tabs_PadMar_011.left - Tabs_PadMar_01.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.left - Tabs_PadMar_01.left) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subGreen.top - Tabs_PadMar_01.top) - vp2px(20) - barDefPad)) <= 1).assertTrue();

      console.info(`[testTabsPadMar] Tabs_index_011.left = ${Tabs_PadMar_011.left}`);
      expect(Math.abs(Tabs_PadMar_011.left - Tabs_PadMar_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.left - Tabs_PadMar_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.left - Tabs_PadMar_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_011.top - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_012.top - Tabs_PadMar_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_PadMar_013.top - Tabs_PadMar_003.top) <= 1).assertTrue();

      let Tabs_PadMar_01_width = Tabs_PadMar_01.right - Tabs_PadMar_01.left;
      let Tabs_PadMar_01_height = Tabs_PadMar_01.bottom - Tabs_PadMar_01.top;
      console.info('[testTabsPadMar] Tabs_PadMar_01_width: ' + Tabs_PadMar_01_width);
      console.info('[testTabsPadMar] Tabs_PadMar_01_height: ' + Tabs_PadMar_01_height);

      let Tabs_PadMar_001_width = Tabs_PadMar_001.right - Tabs_PadMar_001.left;
      let Tabs_PadMar_001_height = Tabs_PadMar_001.bottom - Tabs_PadMar_001.top;
      console.info('[testTabsPadMar] Tabs_PadMar_001_width: ' + Tabs_PadMar_001_width);
      console.info('[testTabsPadMar] Tabs_PadMar_001_height: ' + Tabs_PadMar_001_height);

      console.info(`[testTabsPadMar] Tabs_PadMar_011.bottom - Tabs_PadMar_011.top
        = ${Tabs_PadMar_011.bottom - Tabs_PadMar_011.top}`);
      console.info(`[testTabsPadMar] Tabs_PadMar_01_height - barDefHei - vp2px(40)
        = ${Tabs_PadMar_01_height - barDefHei - vp2px(40)}`);
      console.info(`[testTabsPadMar] Tabs_PadMar_011.right - Tabs_PadMar_011.left
        = ${Tabs_PadMar_011.right - Tabs_PadMar_011.left}`);
      expect(Math.abs(Math.round(Tabs_PadMar_011.bottom - Tabs_PadMar_011.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.bottom - Tabs_PadMar_012.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.bottom - Tabs_PadMar_013.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_011.right - Tabs_PadMar_011.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_012.right - Tabs_PadMar_012.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_013.right - Tabs_PadMar_013.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPadMar] Tabs_PadMar_001.bottom - Tabs_PadMar_001.top
        = ${Tabs_PadMar_001.bottom - Tabs_PadMar_001.top}`);
      expect(Math.abs(Math.round(Tabs_PadMar_001.bottom - Tabs_PadMar_001.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.bottom - Tabs_PadMar_002.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.bottom - Tabs_PadMar_003.top) - Math.round(Tabs_PadMar_01_height - barDefHei - vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_001.right - Tabs_PadMar_001.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_002.right - Tabs_PadMar_002.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Tabs_PadMar_003.right - Tabs_PadMar_003.left) - Math.round(Tabs_PadMar_01_width-vp2px(40))) <= 1)
        .assertTrue();

      console.info(`[testTabsPadMar] subGreen.bottom = ${subGreen.bottom}`);
      expect(Math.abs((subGreen.bottom + barDefPad) - Tabs_PadMar_001.top) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(subGreen.bottom - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsPadMar]subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      console.info(`[testTabsPadMar](barDefHei - 2*barDefPad) = ${barDefHei - 2*barDefPad}`);
      console.info(`[testTabsPadMar]subGreen.right - subGreen.left = ${subGreen.right - subGreen.left}`);
      expect(Math.floor(Math.abs((subGreen.bottom - subGreen.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subBlue.bottom - subBlue.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((subYellow.bottom - subYellow.top) - (barDefHei - 2*barDefPad))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.floor(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.floor(Tabs_PadMar_001_width/3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.floor(Tabs_PadMar_001_width/3)) <= 1).assertTrue();

      console.info('[testTabsPadMar] END');
      done();
    });
  })
}
