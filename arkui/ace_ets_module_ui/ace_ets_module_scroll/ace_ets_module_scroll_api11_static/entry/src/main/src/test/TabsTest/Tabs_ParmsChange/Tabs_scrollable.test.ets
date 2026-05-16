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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Tabs_scrollable() {
  describe('Tabs_scrollable', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Tabs_scrollable beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_scrollable",
      };
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Tabs_scrollable state pages:" + JSON.stringify(pages));
        if (!("Tabs_scrollable" == pages.name)) {
          console.info("get Tabs_scrollable pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Tabs_scrollable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_scrollable page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_scrollable beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_scrollable after each called");
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'currentIndex', value: 0
      });
    });


    
    /**
     * @tc.number   testTabsScrollableToTrue_static_01
     * @tc.name     testTabsScrollableToTrue_static_01
     * @tc.desc     testTabsScrollableToTrue_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTabsScrollableToTrue_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsScrollableToTrue_static_01] START');
      let strJson = inspector.getInspectorByKey('Tabs_scrollable_01');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[testTabsScrollableToTrue_static_01] type: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[testTabsScrollableToTrue_static_01] barPosition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition')));
      console.info("[testTabsScrollableToTrue_static_01] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsScrollableToTrue_static_01] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsScrollableToTrue_static_01] vertical: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')));
      console.info("[testTabsScrollableToTrue_static_01] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(true);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("false");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_scrollable_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_001');
      let Tabs_scrollable_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_011');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_scrollable_011.right -
        ((Tabs_scrollable_011.right - Tabs_scrollable_011.left) / 6))).toInt(),
        (Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2))).toInt(),
        (Math.round(Tabs_scrollable_011.left + ((Tabs_scrollable_011.right - Tabs_scrollable_011.left) / 6))).toInt(),
        (Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_002');
      let Tabs_scrollable_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_012');
      await driver.swipe((Math.round(Tabs_scrollable_012.right -
        ((Tabs_scrollable_012.right - Tabs_scrollable_012.left) / 6))).toInt(),
        (Math.round(Tabs_scrollable_012.top + ((Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) / 2))).toInt(),
        (Math.round(Tabs_scrollable_012.left + ((Tabs_scrollable_012.right - Tabs_scrollable_012.left) / 6))).toInt(),
        (Math.round(Tabs_scrollable_012.top + ((Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_003');
      let Tabs_scrollable_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_013');
      let Tabs_scrollable_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_yellow');

      console.info(`[testTabsScrollableToTrue_static_01]Tabs_scrollable_011.left equal Tabs_scrollable_001.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_001.left}`);


      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - Tabs_scrollable_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - Tabs_scrollable_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - Tabs_scrollable_003.top) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue_static_01]Tabs_scrollable_011.left equal Tabs_scrollable_01.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_01.left}`);

      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue_static_01]Tabs_scrollable_011.bottom - Tabs_scrollable_011.top=
        ${Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)}`);

      let rectParent = CommonFunc.getComponentRect('Tabs_scrollable_01');
      let widthParent = rectParent.right - rectParent.left
      let heightParent = rectParent.bottom - rectParent.top
      console.info("[testTabsScrollableToTrue_static_01] widthParent is: " + widthParent);
      console.info("[testTabsScrollableToTrue_static_01] heightParent is: " + heightParent);

      expect(Math.abs(Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_013.bottom - Tabs_scrollable_013.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();

      expect(Math.abs(Tabs_scrollable_011.right - Tabs_scrollable_011.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.right - Tabs_scrollable_012.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.right - Tabs_scrollable_013.left - widthParent) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue_static_01]Tabs_scrollable_001.bottom - Tabs_scrollable_001.top=
        ${Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)}`);
      expect(Math.abs(Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_002.bottom - Tabs_scrollable_002.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_003.bottom - Tabs_scrollable_003.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();

      expect(Math.abs(Tabs_scrollable_001.right - Tabs_scrollable_001.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_002.right - Tabs_scrollable_002.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_003.right - Tabs_scrollable_003.left - widthParent) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue_static_01]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(widthParent / 3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(widthParent / 3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(widthParent / 3)) <= 1).assertTrue();


      console.info('[testTabsScrollableToTrue_static_01] END');
      done();
    });


    
    /**
     * @tc.number   testTabsScrollableToFalse_static_02
     * @tc.name     testTabsScrollableToFalse_static_02
     * @tc.desc     testTabsScrollableToFalse_static_02
     * @tc.level    Level.LEVEL0
     */
it('testTabsScrollableToFalse_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testTabsScrollableToFalse_static_02] START');
      let strJson = inspector.getInspectorByKey('Tabs_scrollable_02');
      let uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[testTabsScrollableToFalse_static_02] type: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("[testTabsScrollableToFalse_static_02] barPosition: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('barPosition')));
      console.info("[testTabsScrollableToFalse_static_02] index: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')));
      console.info("[testTabsScrollableToFalse_static_02] scrollable: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')));
      console.info("[testTabsScrollableToFalse_static_02] vertical: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')));
      console.info("[testTabsScrollableToFalse_static_02] barMode: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Tabs');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barPosition'))
        .assertEqual("BarPosition.Start");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('index')).assertEqual("0");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('scrollable')).assertEqual(false);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('vertical')).assertEqual("false");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      let Tabs_scrollable_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_004');
      let Tabs_scrollable_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_041');
      let driver = Driver.create();
      await driver.swipe((Math.round(Tabs_scrollable_011.right -
        ((Tabs_scrollable_011.right - Tabs_scrollable_011.left) / 6))).toInt(),
        (Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2))).toInt(),
        (Math.round(Tabs_scrollable_011.left + ((Tabs_scrollable_011.right - Tabs_scrollable_011.left) / 6))).toInt(),
        (Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) / 2))).toInt());
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_0012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_004');
      let Tabs_scrollable_0112: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_041');
      let btn1 = await driver.findComponent(ON.text('blueTwo'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_005');
      let Tabs_scrollable_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_042');
      let btn2 = await driver.findComponent(ON.text('yellowTwo'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_006');
      let Tabs_scrollable_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_043');
      let Tabs_scrollable_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_02');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_greenTwo');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_blueTwo');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_scrollable_yellowTwo');

      console.info(`[testTabsScrollableToFalse_static_02]Tabs_scrollable_011.left equal Tabs_scrollable_001.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_001.left}`);

      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - Tabs_scrollable_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - Tabs_scrollable_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - Tabs_scrollable_003.top) <= 1).assertTrue();

      let rectParent = CommonFunc.getComponentRect('Tabs_scrollable_02');
      let widthParent = rectParent.right - rectParent.left
      let heightParent = rectParent.bottom - rectParent.top
      console.info("[testTabsScrollableToFalse_static_02] widthParent is: " + widthParent);
      console.info("[testTabsScrollableToFalse_static_02] heightParent is: " + heightParent);

      console.info(`[testTabsScrollableToFalse_static_02]Tabs_scrollable_011.left equal Tabs_scrollable_01.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_01.left}`);

      expect(Math.abs(Tabs_scrollable_011.left - Tabs_scrollable_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.left - Tabs_scrollable_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.left - Tabs_scrollable_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.top - subYellow.bottom) <= 1).assertTrue();


      console.info(`[testTabsScrollableToFalse_static_02]Tabs_scrollable_011.bottom - Tabs_scrollable_011.top=
        ${Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)}`);

      expect(Math.abs(Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_012.bottom - Tabs_scrollable_012.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_013.bottom - Tabs_scrollable_013.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();

      expect(Math.abs(Tabs_scrollable_011.right - Tabs_scrollable_011.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.right - Tabs_scrollable_012.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.right - Tabs_scrollable_013.left - widthParent) <= 1).assertTrue();

      console.info(`[ ]Tabs_scrollable_001.bottom - Tabs_scrollable_001.top=
        ${Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)}`);

      expect(Math.abs(Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_002.bottom - Tabs_scrollable_002.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Tabs_scrollable_003.bottom - Tabs_scrollable_003.top) -
      Math.round(heightParent - uiContext.vp2px(56))) <= 1).assertTrue();

      expect(Math.abs(Tabs_scrollable_001.right - Tabs_scrollable_001.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_002.right - Tabs_scrollable_002.left - widthParent) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_003.right - Tabs_scrollable_003.left - widthParent) <= 1).assertTrue();

      console.info(`[testTabsScrollableToFalse_static_02]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);

      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top) - Math.round(uiContext.vp2px(56))) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top) - Math.round(uiContext.vp2px(56))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left) - Math.round(widthParent / 3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left) - Math.round(widthParent / 3)) <= 1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left) - Math.round(widthParent / 3)) <= 1).assertTrue();


      console.info('[testTabsScrollableToFalse_static_02] END');
      done();
    });
  })
}
