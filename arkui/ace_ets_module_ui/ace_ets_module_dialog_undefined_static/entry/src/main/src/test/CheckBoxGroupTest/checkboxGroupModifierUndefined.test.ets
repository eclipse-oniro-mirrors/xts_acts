'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
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
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

export default function checkboxGroupModifierUndefined() {
  describe('checkboxGroupModifierUndefined', () => {
    beforeAll(async ():Promise<void> => {
      console.info("checkboxGroupModifierUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkboxGroupModifierUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CheckBoxGroup/checkboxGroupModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get checkboxGroupModifierUndefined state pages:" + JSON.stringify(pages));
        if (!("checkboxGroupModifierUndefined" == pages.name)) {
          console.info("get checkboxGroupModifierUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkboxGroupModifierUndefined page error:" + err);
      }
      console.info("checkboxGroupModifierUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   checkboxGroupModifierUndefined_static_0001
     * @tc.name     checkboxGroupModifierUndefined_static_0001
     * @tc.desc     test checkboxGroupModifierUndefined selectAll undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupModifierUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupModifierUndefined_static_0001] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll');
      console.info("[checkboxGroupModifierUndefined_static_0001] selectAll : " + res);
      expect(res).assertEqual('false');

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupSelectAllM_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupModifierUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll');
      console.info("[checkboxGroupModifierUndefined_static_0001] selectAll : " + res);
      expect(res).assertEqual('true');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0001] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectAll');
      console.info("[checkboxGroupModifierUndefined_static_0001] selectAll : " + res);
      expect(res).assertEqual('false');
      console.info('[checkboxGroupModifierUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupModifierUndefined_static_0002
     * @tc.name     checkboxGroupModifierUndefined_static_0002
     * @tc.desc     test checkboxGroupModifierUndefined selectedColor undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupModifierUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupModifierUndefined_static_0002] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let selectedColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor');
      console.info("[checkboxGroupModifierUndefined_static_0002] selectedColor : " + selectedColor);

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupSelectedColorM_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupModifierUndefined_static_0002] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor');
      console.info("[checkboxGroupModifierUndefined_static_0002] selectedColor : " + res);
      expect(res).assertEqual('#FFFFA500');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0002] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor');
      console.info("[checkboxGroupModifierUndefined_static_0002] selectedColor : " + res);
      expect(res).assertEqual(selectedColor);
      console.info('[checkboxGroupModifierUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupModifierUndefined_static_0003
     * @tc.name     checkboxGroupModifierUndefined_static_0003
     * @tc.desc     test checkboxGroupModifierUndefined unselectedColor undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupModifierUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupModifierUndefined_static_0003] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let unselectedColor = JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor');
      console.info("[checkboxGroupModifierUndefined_static_0003] unselectedColor : " + unselectedColor);

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupUnSelectedColorM_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupModifierUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor');
      console.info("[checkboxGroupModifierUndefined_static_0003] unselectedColor : " + res);
      expect(res).assertEqual('#FFFFC0CB');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0003] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('unselectedColor');
      console.info("[checkboxGroupModifierUndefined_static_0003] unselectedColor : " + res);
      expect(res).assertEqual(unselectedColor);
      console.info('[checkboxGroupModifierUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupModifierUndefined_static_0004
     * @tc.name     checkboxGroupModifierUndefined_static_0004
     * @tc.desc     test checkboxGroupModifierUndefined checkboxShape undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupModifierUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupModifierUndefined_static_0004] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('checkboxShape');
      console.info("[checkboxGroupModifierUndefined_static_0004] checkboxShape : " + res);
      expect(res).assertEqual('0');

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupCheckboxShapeM_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupModifierUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('checkboxShape');
      console.info("[checkboxGroupModifierUndefined_static_0004] checkboxShape : " + res);
      expect(res).assertEqual('1');

      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0004] click changeBtn");
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.parseJsonElement(strJson).getElement('$attrs').getString('checkboxShape');
      console.info("[checkboxGroupModifierUndefined_static_0004] checkboxShape : " + res);
      expect(res).assertEqual('0');
      console.info('[checkboxGroupModifierUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   checkboxGroupModifierUndefined_static_0005
     * @tc.name     checkboxGroupModifierUndefined_static_0005
     * @tc.desc     test checkboxGroupModifierUndefined mark undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupModifierUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupModifierUndefined_static_0005] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      let res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mark'));
      console.info("[checkboxGroupModifierUndefined_static_0005] mark : " + res);
      expect(res).assertEqual(JSON.stringify('{"strokeColor":"#FFFFFFFF","size":"0.00vp","strokeWidth":"2.00vp"}'));

      let changeBtn = await driver.findComponent(ON.id('checkboxGroupMarkM_Btn'));
      await (changeBtn?.click() as Promise<void>);

      console.info("[checkboxGroupModifierUndefined_static_0005] click changeBtn");
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('checkboxGroup_M_id1');
      res = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('mark'));
      console.info("[checkboxGroupModifierUndefined_static_0005] mark : " + res);
      expect(res).assertEqual(JSON.stringify('{"strokeColor":"#FFFF0000","size":"80.00vp","strokeWidth":"15.00vp"}'));
      done();
    });

    /**
     * @tc.number   checkboxGroupModifierUndefined_static_0006
     * @tc.name     checkboxGroupModifierUndefined_static_0006
     * @tc.desc     test checkboxGroupModifierUndefined onChange undefined
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupModifierUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[checkboxGroupModifierUndefined_static_0006] START');
      let driver: Driver = Driver.create()
      let changeBtn = await driver.findComponent(ON.id('checkboxGroupOnChangeM_Btn'));
      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('checkboxGroup_onChange_M_Text'));
      let checkBox1 = await driver.findComponent(ON.id('checkboxGroup_M_checkbox1'));
      await (checkBox1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('checkboxGroupMChangeText is onChange');
      await (changeBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0006] click changeBtn");
      await CommonFunc.sleep(1000);
      let resetBtn = await driver.findComponent(ON.id('checkboxGroupOnChange_M_resetBtn'));
      await (resetBtn?.click() as Promise<void>);
      console.info("[checkboxGroupModifierUndefined_static_0006] click resetBtn");
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('checkboxGroupMChangeText is -1');
      console.info('[checkboxGroupModifierUndefined_static_0006] END');
      done();
    });
  })
}