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

export default function Tabs_barMode() {
  describe('Tabs_barMode', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_barMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barMode",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_barMode state pages:" + JSON.stringify(pages));
        if (!("Tabs_barMode" == pages.name)) {
          console.info("get Tabs_barMode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_barMode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barMode page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barMode beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barMode after each called");
      globalThis.value.message.notify({
        name: 'currentIndex', value: 0
      });
    });
    /**
     * @tc.number SUB_ACE_TABS_BARMODE_TEST_0100
     * @tc.name testTabsBarModeFixed
     * @tc.desc The parent component sets barMode to BarMode.Fixed
     */
    it('testTabsBarModeFixed', Level.LEVEL1, async (done: Function) => {
      console.info('[testTabsBarModeFixed] START');
      let strJson = getInspectorByKey('Tabs_barMode_01');

      console.info(`[testTabsBarModeFixed] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsBarModeFixed] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsBarModeFixed] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsBarModeFixed] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsBarModeFixed] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barMode_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_001');
      let Tabs_barMode_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_011');
      let driver = Driver.create();
      await driver.swipe(Math.round((Tabs_barMode_011.right - ((Tabs_barMode_011.right - Tabs_barMode_011.left) / 6))),
        Math.round(Tabs_barMode_011.top + ((Tabs_barMode_011.bottom - Tabs_barMode_011.top) / 2)),
        Math.round(Tabs_barMode_011.left + ((Tabs_barMode_011.right - Tabs_barMode_011.left) / 6)),
        Math.round(Tabs_barMode_011.top + ((Tabs_barMode_011.bottom - Tabs_barMode_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barMode_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_002');
      let Tabs_barMode_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_012');
      await driver.swipe(Math.round(Tabs_barMode_012.right - ((Tabs_barMode_012.right - Tabs_barMode_012.left) / 6)),
        Math.round(Tabs_barMode_012.top + ((Tabs_barMode_012.bottom - Tabs_barMode_012.top) / 2)),
        Math.round(Tabs_barMode_012.left + ((Tabs_barMode_012.right - Tabs_barMode_012.left) / 6)),
        Math.round(Tabs_barMode_012.top + ((Tabs_barMode_012.bottom - Tabs_barMode_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barMode_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_003');
      let Tabs_barMode_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_013');
      let Tabs_barMode_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_yellow');

      console.info(`[testTabsBarModeFixed]Tabs_barMode_011.left equal Tabs_barMode_001.left
        ${Tabs_barMode_011.left} === ${Tabs_barMode_001.left}`);
      expect(Math.abs(Tabs_barMode_011.left - Tabs_barMode_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_012.left - Tabs_barMode_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_013.left - Tabs_barMode_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_011.top - Tabs_barMode_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_012.top - Tabs_barMode_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_013.top - Tabs_barMode_003.top) <= 1).assertTrue();

      console.info(`[testTabsBarModeFixed]Tabs_barMode_011.left equal Tabs_barMode_01.left
      ${Tabs_barMode_011.left} === ${Tabs_barMode_01.left}`);
      expect(Math.abs(Tabs_barMode_011.left - Tabs_barMode_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_012.left - Tabs_barMode_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_013.left - Tabs_barMode_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_barMode_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsBarModeFixed]Tabs_barMode_011.bottom - Tabs_barMode_011.top=
        ${Math.round(Tabs_barMode_011.bottom - Tabs_barMode_011.top)}`);
      expect(Math.abs(Math.round(Tabs_barMode_011.bottom - Tabs_barMode_011.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_012.bottom - Tabs_barMode_012.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_013.bottom - Tabs_barMode_013.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_011.right - Tabs_barMode_011.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_012.right - Tabs_barMode_012.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_013.right - Tabs_barMode_013.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarModeFixed]Tabs_barMode_001.bottom - Tabs_barMode_001.top=
        ${Math.round(Tabs_barMode_001.bottom - Tabs_barMode_001.top)}`);
      expect(Math.abs(Math.round(Tabs_barMode_001.bottom - Tabs_barMode_001.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_002.bottom - Tabs_barMode_002.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_003.bottom - Tabs_barMode_003.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_001.right - Tabs_barMode_001.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_002.right - Tabs_barMode_002.left) - Math.round(vp2px(330))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_barMode_003.right - Tabs_barMode_003.left) - Math.round(vp2px(330))) <= 1).assertTrue();

      console.info(`[testTabsBarModeFixed]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left)-Math.round(vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left)-Math.round(vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left)-Math.round(vp2px(110)))<=1).assertTrue();

      console.info('[testTabsBarModeFixed] END');
      done();
    });
    //    /**
    //     * @tc.number    SUB_ACE_TABS_BARMODE_TEST_0200
    //     * @tc.name      testTabsBarModeScrollable
    //     * @tc.desc      The parent component sets barMode to BarMode.Scrollable
    //     */
    //    it('testTabsBarModeScrollable', Level.LEVEL1, async  (done:Function)=> {
    //      console.info('[testTabsBarModeScrollable] START');
    //      globalThis.value.message.notify({name:'changeBarMode', value:BarMode.Scrollable});
    //      await CommonFunc.sleep(3000);
    //      let strJson = getInspectorByKey('Tabs_barMode_01');
    //
    //      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
    //      console.info(`[testTabsBarModeScrollable] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
    //      console.info("[testTabsBarModeScrollable] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
    //      console.info("[testTabsBarModeScrollable] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
    //      console.info("[testTabsBarModeScrollable] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
    //      console.info("[testTabsBarModeScrollable] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
    //      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
    //      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
    //      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
    //      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
    //      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Scrollable');
    //      let Tabs_barMode_001:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_001');
    //      let Tabs_barMode_011:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_011');
    //      let subGreen:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_green');
    //      let driver = Driver.create();
    //      await driver.swipe(600,80,120,80);
    //      await CommonFunc.sleep(1000);
    //      let btn1 = await driver.findComponent(ON.text('blue'));
    //      await btn1.click()
    //      await CommonFunc.sleep(1000);
    //      let Tabs_barMode_002:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_002');
    //      let Tabs_barMode_012:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_012');
    //      let subBlue:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_blue');
    //      await driver.swipe(600,80,120,80);
    //      await CommonFunc.sleep(1000);
    //      let btn2 = await driver.findComponent(ON.text('yellow'));
    //      await btn2.click()
    //      await CommonFunc.sleep(1000);
    //      let Tabs_barMode_003:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_003');
    //      let Tabs_barMode_013:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_013');
    //      let Tabs_barMode_01:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_01');
    //      let subYellow:RectValue = CommonFunc.getComponentRectOnScreen('Tabs_barMode_yellow');
    //
    //      console.info(`[testTabsBarModeScrollable]Tabs_barMode_011.left equal Tabs_barMode_001.left
    //        ${Tabs_barMode_011.left} === ${Tabs_barMode_001.left}`);
    //      expect(Tabs_barMode_011.left).assertEqual(Tabs_barMode_001.left);
    //      expect(Tabs_barMode_012.left).assertEqual(Tabs_barMode_002.left);
    //      expect(Tabs_barMode_013.left).assertEqual(Tabs_barMode_003.left);
    //      expect(Tabs_barMode_011.top).assertEqual(Tabs_barMode_001.top);
    //      expect(Tabs_barMode_012.top).assertEqual(Tabs_barMode_002.top);
    //      expect(Tabs_barMode_013.top).assertEqual(Tabs_barMode_003.top);
    //
    //      console.info(`[testTabsBarModeScrollable]Tabs_barMode_011.left equal Tabs_barMode_01.left
    //        ${Tabs_barMode_011.left} === ${Tabs_barMode_01.left}`);
    //      expect(Tabs_barMode_011.left).assertEqual(Tabs_barMode_01.left);
    //      expect(Tabs_barMode_012.left).assertEqual(Tabs_barMode_01.left);
    //      expect(Tabs_barMode_013.left).assertEqual(Tabs_barMode_01.left);
    //      expect(Tabs_barMode_011.top).assertEqual(subGreen.bottom);
    //      expect(Tabs_barMode_012.top).assertEqual(subBlue.bottom);
    //      expect(Tabs_barMode_013.top).assertEqual(subYellow.bottom);
    //
    //      console.info(`[testTabsBarModeScrollable]Tabs_barMode_011.bottom - Tabs_barMode_011.top=
    //        ${Math.round(Tabs_barMode_011.bottom - Tabs_barMode_011.top)}`);
    //      expect(Math.round(Tabs_barMode_011.bottom - Tabs_barMode_011.top)).assertEqual(vp2px(244));
    //      expect(Math.round(Tabs_barMode_012.bottom - Tabs_barMode_012.top)).assertEqual(vp2px(244));
    //      expect(Math.round(Tabs_barMode_013.bottom - Tabs_barMode_013.top)).assertEqual(vp2px(244));
    //      expect(Math.round(Tabs_barMode_011.right - Tabs_barMode_011.left)).assertEqual(vp2px(330));
    //      expect(Math.round(Tabs_barMode_012.right - Tabs_barMode_012.left)).assertEqual(vp2px(330));
    //      expect(Math.round(Tabs_barMode_013.right - Tabs_barMode_013.left)).assertEqual(vp2px(330));
    //
    //      console.info(`[testTabsBarModeScrollable]Tabs_barMode_001.bottom - Tabs_barMode_001.top=
    //        ${Math.round(Tabs_barMode_001.bottom - Tabs_barMode_001.top)}`);
    //      expect(Math.round(Tabs_barMode_001.bottom - Tabs_barMode_001.top)).assertEqual(vp2px(244));
    //      expect(Math.round(Tabs_barMode_002.bottom - Tabs_barMode_002.top)).assertEqual(vp2px(244));
    //      expect(Math.round(Tabs_barMode_003.bottom - Tabs_barMode_003.top)).assertEqual(vp2px(244));
    //      expect(Math.round(Tabs_barMode_001.right - Tabs_barMode_001.left)).assertEqual(vp2px(330));
    //      expect(Math.round(Tabs_barMode_002.right - Tabs_barMode_002.left)).assertEqual(vp2px(330));
    //      expect(Math.round(Tabs_barMode_003.right - Tabs_barMode_003.left)).assertEqual(vp2px(330));
    //
    //      console.info(`[testTabsBarModeScrollable]subGreen.bottom - subGreen.top=
    //        ${Math.round(subGreen.bottom - subGreen.top)}`);
    //      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(vp2px(56));
    //      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(vp2px(56));
    //      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(vp2px(56));
    //      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(vp2px(330));
    //      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(vp2px(330));
    //      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(vp2px(330));
    //      console.info('[testTabsBarModeScrollable] END');
    //      done();
    //    });
  })
}