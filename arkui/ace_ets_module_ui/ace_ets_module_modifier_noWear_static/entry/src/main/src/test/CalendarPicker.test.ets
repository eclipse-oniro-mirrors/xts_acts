'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import Utils from "../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function calendarPickerJsunit() {
  describe('calendarPickerTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.modifiernowear.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("calendarpicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarpicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get calendarpicker state pages:" + JSON.stringify(pages));
        if (!("calendarpicker" == pages.name)) {
          console.info("get calendarpicker pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push calendarpicker page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_static_0100
     * @tc.name     ArkUI_Stage_CalendarPicker_static_0100
     * @tc.desc     ArkUI_Stage_CalendarPicker_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_CalendarPicker_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_Stage_CalendarPicker_0100] START');
      let strJson = inspector.getInspectorByKey('CalendarPickerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getElement('edgeAlign').getString('alignType')).assertEqual("CalendarAlign.END");
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString('dx'))
        .assertEqual("10.00vp");
      expect(obj.getElement('$attrs').getElement('edgeAlign').getElement('offset').getString('dy'))
        .assertEqual("15.00vp");
      console.info('[ArkUI_Stage_CalendarPicker_0100] END');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_attributeModifier_static_0101
     * @tc.name     ArkUI_Stage_CalendarPicker_attributeModifier_static_0101
     * @tc.desc     ArkUI_Stage_CalendarPicker_attributeModifier_static_0101
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_CalendarPicker_attributeModifier_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_0101] START');
        let strJson = inspector.getInspectorByKey('CalendarPickerKey1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[ArkUI_Stage_CalendarPicker_attributeModifier_0101] obj is: " +
        JSON.stringify(obj.getElement('$attrs')));

        expect(obj.getElement('$attrs').getElement('textStyle').getString('color')).assertEqual("#FF182431");
        expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('size'))
          .assertEqual("8.00fp");
        expect(obj.getElement('$attrs').getElement('textStyle').getElement('font').getString('weight'))
          .assertEqual("FontWeight.Lighter");
        console.info('[ArkUI_Stage_CalendarPicker_attributeModifier_0101] END');
        done();
      });


    
    /**
     * @tc.number   ArkUI_Stage_CalendarPicker_attributeModifier_static_0102
     * @tc.name     ArkUI_Stage_CalendarPicker_attributeModifier_static_0102
     * @tc.desc     ArkUI_Stage_CalendarPicker_attributeModifier_static_0102
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_CalendarPicker_attributeModifier_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('ArkUI_Stage_CalendarPicker_attributeModifier_0102 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('changeButton'));
        await (button?.click() as Promise<void>);
        await Utils.sleep(2000)

        let strJsonNew = inspector.getInspectorByKey('CalendarPickerKey1'); //测试组件的key名称
        let objNew = JSON.parseJsonElement(strJsonNew);
        console.info("ArkUI_Stage_CalendarPicker_attributeModifier_0102 component  is: " +
        JSON.stringify(objNew.getElement('$attrs')));

        let edgeAlign = objNew.getElement('$attrs').getElement('edgeAlign');
        expect(edgeAlign.getString('alignType')).assertEqual("CalendarAlign.START");

        console.info('ArkUI_Stage_CalendarPicker_attributeModifier_0102 END');
        done();
      });
  })
}
