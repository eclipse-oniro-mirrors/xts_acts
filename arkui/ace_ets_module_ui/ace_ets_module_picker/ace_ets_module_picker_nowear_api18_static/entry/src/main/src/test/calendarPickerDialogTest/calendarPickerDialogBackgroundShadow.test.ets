'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function CalendarPickerDialogShadowTest() {
  describe('CalendarPickerDialogShadowTest', () => {
    beforeAll(() => {
      console.info("CalendarPickerDialogShadowTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('CalendarPickerDialogShadowTest beforeEach start');
      let options: router.RouterOptions = {
        url:'MainAbility/pages/calendarPickerDialog/calendarPickerDialogShadow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('calendarPickerDialogShadow' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CalendarPickerDialogShadowTest page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CalendarPickerDialogShadowTest after each called');
    });

    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_001
     * @tc.name     CalendarPickerDialogShadowTest_static_001
     * @tc.desc     CalendarPickerDialogShadowTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadowOptionID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getElement('shadow').getString('color');
      expect(shadow).assertEqual('#FFFF0000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_002
     * @tc.name     CalendarPickerDialogShadowTest_static_002
     * @tc.desc     CalendarPickerDialogShadowTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_XS_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_003
     * @tc.name     CalendarPickerDialogShadowTest_static_003
     * @tc.desc     CalendarPickerDialogShadowTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_SM_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_004
     * @tc.name     CalendarPickerDialogShadowTest_static_004
     * @tc.desc     CalendarPickerDialogShadowTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_MD_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_005
     * @tc.name     CalendarPickerDialogShadowTest_static_005
     * @tc.desc     CalendarPickerDialogShadowTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_LG_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_006
     * @tc.name     CalendarPickerDialogShadowTest_static_006
     * @tc.desc     CalendarPickerDialogShadowTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_SM_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   CalendarPickerDialogShadowTest_static_007
     * @tc.name     CalendarPickerDialogShadowTest_static_007
     * @tc.desc     CalendarPickerDialogShadowTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('CalendarPickerDialogShadowTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_MD_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let shadow: string = column.getElement('$attrs').getString('shadow');
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
  })
}