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

export default function Tabs_barPosition() {
  describe('Tabs_barPosition', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_barPosition beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barPosition",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_barPosition state pages:" + JSON.stringify(pages));
        if (!("Tabs_barPosition" == pages.name)) {
          console.info("get Tabs_barPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_barPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barPosition page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barPosition beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barPosition after each called");
      globalThis.value.message.notify({
        name: 'currentIndex', value: 0
      });
    });
    /**
     * @tc.number SUB_ACE_TABS_BARPOSITION_TEST_0100
     * @tc.name TabsBarPositionStartWithVerticalFalse
     * @tc.desc When vertical is set to the default value of false, barPosition is set to barPosition.Start
     */
    it('TabsBarPositionStartWithVerticalFalse', 0, async (done: Function) => {
      console.info('[TabsBarPositionStartWithVerticalFalse] START');
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');

      console.info("[TabsBarPositionStartWithVerticalFalse] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[TabsBarPositionStartWithVerticalFalse] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[TabsBarPositionStartWithVerticalFalse] index: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .index));
      console.info("[TabsBarPositionStartWithVerticalFalse] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[TabsBarPositionStartWithVerticalFalse] vertical: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .vertical));
      console.info("[TabsBarPositionStartWithVerticalFalse] barMode: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe(Math.round((Tabs_barPosition_011.right - 30)),
        Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)),
        Math.round(Tabs_barPosition_011.left + 30),
        Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.right - 30),
        Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)),
        Math.round(Tabs_barPosition_012.left + 30),
        Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
     
      expect(Math.abs(Tabs_barPosition_011.left-Tabs_barPosition_001.left) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-Tabs_barPosition_002.left) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-Tabs_barPosition_003.left) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_001.top) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_002.top) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_003.top) <=1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_01.top equal subGreen.top
        ${Tabs_barPosition_01.top} === ${subGreen.top}`);
      
      expect(Math.abs(Tabs_barPosition_01.top-subGreen.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_01.top-subBlue.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_01.top-subYellow.top)<=1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_011.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_011.left}`);
     
      expect(Math.abs(Tabs_barPosition_011.left-Tabs_barPosition_011.left)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-Tabs_barPosition_011.left)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-Tabs_barPosition_011.left)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top-subGreen.bottom)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-subBlue.bottom)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-subYellow.bottom)<=1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
   
      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)-Math.round(vp2px(244))) <=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top)-Math.round(vp2px(244))) <=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top)-Math.round(vp2px(244))) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.right - Tabs_barPosition_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - Tabs_barPosition_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - Tabs_barPosition_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
     
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)-Math.round(vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)-Math.round(vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)-Math.round(vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_001.right - Tabs_barPosition_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_002.right - Tabs_barPosition_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_003.right - Tabs_barPosition_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`)
     
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left)-Math.round(vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left)-Math.round(vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left)-Math.round(vp2px(110)))<=1).assertTrue();

      console.info('[TabsBarPositionStartWithVerticalFalse] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARPOSITION_TEST_0200
     * @tc.name TabsBarPositionEndWithVerticalFalse
     * @tc.desc When vertical takes the default value of false, barPosition is set to barPosition.End
     */
    it('TabsBarPositionEndWithVerticalFalse', 0, async (done: Function) => {
      console.info('[TabsBarPositionEndWithVerticalFalse] START');
      globalThis.value.message.notify({
        name: 'changeBarPosition', value: BarPosition.End
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');

      console.info(`[TabsBarPositionEndWithVerticalFalse] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[TabsBarPositionEndWithVerticalFalse] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[TabsBarPositionEndWithVerticalFalse] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[TabsBarPositionEndWithVerticalFalse] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[TabsBarPositionEndWithVerticalFalse] vertical: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .vertical));
      console.info("[TabsBarPositionEndWithVerticalFalse] barMode: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.End");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barPosition_011.right - 30),
        Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)),
        Math.round(Tabs_barPosition_011.left + 30),
        Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.right - 30),
        Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)),
        Math.round(Tabs_barPosition_012.left + 30),
        Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
      
      expect(Math.abs(Tabs_barPosition_011.left-Tabs_barPosition_001.left)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-Tabs_barPosition_002.left)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-Tabs_barPosition_003.left)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_001.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_002.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_003.top)<=1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);
     
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_01.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_01.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_01.top)<=1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_01.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_01.left}`);
     
      expect(Math.abs(Tabs_barPosition_011.left-Tabs_barPosition_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-Tabs_barPosition_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-Tabs_barPosition_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.bottom-subGreen.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.bottom-subBlue.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.bottom-subYellow.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
     
      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)-Math.round(vp2px(244)))<= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top)-Math.round(vp2px(244)))<= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top)-Math.round(vp2px(244)))<= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.right - Tabs_barPosition_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - Tabs_barPosition_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - Tabs_barPosition_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
    
      expect(Math.abs(Tabs_barPosition_001.right - Tabs_barPosition_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_002.right - Tabs_barPosition_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_003.right - Tabs_barPosition_003.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)-Math.round(vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)-Math.round(vp2px(244))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)-Math.round(vp2px(244))) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]subGreen.bottom - subGreen.bottom=
        ${Math.round(subGreen.bottom - subGreen.bottom)}`);
     
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top)-Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left)-Math.round(vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left)-Math.round(vp2px(110))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left)-Math.round(vp2px(110))) <= 1).assertTrue();
      console.info('[TabsBarPositionEndWithVerticalFalse] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARPOSITION_TEST_0300
     * @tc.name TabsBarPositionStartWithVerticalTrue
     * @tc.desc When vertical is set to the default value of true, barPosition is set to barPosition.Start
     */
    it('TabsBarPositionStartWithVerticalTrue', 0, async (done: Function) => {
      console.info('[TabsBarPositionStartWithVerticalTrue] START');
      globalThis.value.message.notify({
        name: 'setBarWidth', value: 56
      });
      globalThis.value.message.notify({
        name: 'setBarHeight', value: 300
      });
      globalThis.value.message.notify({
        name: 'changeVertical', value: true
      });
      globalThis.value.message.notify({
        name: 'changeBarPosition', value: BarPosition.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');

      console.info("[TabsBarPositionStartWithVerticalTrue] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[TabsBarPositionStartWithVerticalTrue] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[TabsBarPositionStartWithVerticalTrue] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[TabsBarPositionStartWithVerticalTrue] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[TabsBarPositionStartWithVerticalTrue] vertical: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .vertical));
      console.info("[TabsBarPositionStartWithVerticalTrue] barMode: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("true");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
        Math.round(Tabs_barPosition_011.bottom - 30),
        Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
        Math.round(Tabs_barPosition_011.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
        Math.round(Tabs_barPosition_012.bottom - 30),
        Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
        Math.round(Tabs_barPosition_012.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
     
      expect(Math.abs(Tabs_barPosition_011.left-Tabs_barPosition_001.left) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-Tabs_barPosition_002.left) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-Tabs_barPosition_003.left) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_001.top) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_002.top) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_003.top) <=1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);
      
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_01.top)<=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_01.top)<=1).assertTrue()
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_01.top)<=1).assertTrue()

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.left equal subGreen.right=
        ${Tabs_barPosition_011.left} === ${subGreen.right}`);
     
      expect(Math.abs(Tabs_barPosition_011.left-subGreen.right) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-subBlue.right) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-subYellow.right) <=1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top-subGreen.top) <=1).assertTrue();
      expect(Math.abs(subBlue.top-subGreen.bottom) <=1).assertTrue();
      expect(Math.abs(subYellow.top-subBlue.bottom) <=1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) - Math.round(vp2px(300)))<=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top) - Math.round(vp2px(300))) <=1 ).assertTrue();;
      
      expect(Math.abs(Math.round(Tabs_barPosition_011.right - Tabs_barPosition_011.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.right - Tabs_barPosition_012.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.right - Tabs_barPosition_013.left) - Math.round(vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)-Math.round(vp2px(300)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)-Math.round(vp2px(300)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)-Math.round(vp2px(300)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_001.right - Tabs_barPosition_001.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.right - Tabs_barPosition_002.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.right - Tabs_barPosition_003.left) - Math.round(vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalTrue]subGreen.right - subGreen.left=
        ${Math.round(subGreen.right - subGreen.left)}`);
    
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top)- Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(vp2px(100))) <= 1).assertTrue();
      console.info('[TabsBarPositionStartWithVerticalTrue] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_TABS_BARPOSITION_TEST_0400
     * @tc.name TabsBarPositionEndWithVerticalTrue
     * @tc.desc When vertical takes the default value of true, barPosition is set to barPosition.End
     */
    it('TabsBarPositionEndWithVerticalTrue', 0, async (done: Function) => {
      console.info('[TabsBarPositionEndWithVerticalTrue] START');
      globalThis.value.message.notify({
        name: 'setBarWidth', value: 56
      });
      globalThis.value.message.notify({
        name: 'setBarHeight', value: 300
      });
      globalThis.value.message.notify({
        name: 'changeVertical', value: true
      });
      globalThis.value.message.notify({
        name: 'changeBarPosition', value: BarPosition.End
      });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');

      console.info("[TabsBarPositionEndWithVerticalTrue] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[TabsBarPositionEndWithVerticalTrue] barPosition: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barPosition));
      console.info("[TabsBarPositionEndWithVerticalTrue] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[TabsBarPositionEndWithVerticalTrue] scrollable: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .scrollable));
      console.info("[TabsBarPositionEndWithVerticalTrue] vertical: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .vertical));
      console.info("[TabsBarPositionEndWithVerticalTrue] barMode: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.End");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("true");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_001');
      let Tabs_barPosition_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
        Math.round(Tabs_barPosition_011.bottom - 30),
        Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
        Math.round(Tabs_barPosition_011.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_002');
      let Tabs_barPosition_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
        Math.round(Tabs_barPosition_012.bottom - 30),
        Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
        Math.round(Tabs_barPosition_012.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_003');
      let Tabs_barPosition_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_013');
      let Tabs_barPosition_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
      
      expect(Math.abs(Tabs_barPosition_011.left-Tabs_barPosition_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.left-Tabs_barPosition_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.left-Tabs_barPosition_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_003.top) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);
     
      expect(Math.abs(Tabs_barPosition_011.top-Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.top-Tabs_barPosition_01.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.top-Tabs_barPosition_01.top) <= 1).assertTrue();
      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.right equal subGreen.left
        ${Tabs_barPosition_011.right} === ${subGreen.left}`);
      expect(Math.abs(Tabs_barPosition_011.right - subGreen.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - subBlue.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - subYellow.left) <= 1).assertTrue();
    
      expect(Math.abs(Tabs_barPosition_01.top-subGreen.top) <= 1).assertTrue();
      expect(Math.abs(subBlue.top-subGreen.bottom) <=1).assertTrue();
      expect(Math.abs(subYellow.top-subBlue.bottom) <=1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
	  
	
      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) - Math.round(vp2px(300))) <=1 ).assertTrue();
	  

      expect(Math.abs(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top) - Math.round(vp2px(300))) <=1 ).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_011.right - Tabs_barPosition_011.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_012.right - Tabs_barPosition_012.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_013.right - Tabs_barPosition_013.left) - Math.round(vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_001.right - Tabs_barPosition_001.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_002.right - Tabs_barPosition_002.left) - Math.round(vp2px(274))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barPosition_003.right - Tabs_barPosition_003.left) - Math.round(vp2px(274))) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalTrue]subGreen.right - subGreen.left=
        ${Math.round(subGreen.right - subGreen.left)}`);
      expect(Math.abs(Math.round(subGreen.right - subGreen.left)- Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right -  subBlue.left)- Math.round(vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left)- Math.round(vp2px(56)))<= 1).assertTrue();
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(vp2px(100)) ) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(vp2px(100))) <= 1).assertTrue();
      console.info('[TabsBarPositionEndWithVerticalTrue] END');
      done();
    });
  })
}
