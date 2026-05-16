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

export default function calendarPickerDialogStartEndTest() {
  describe('CalendarPickerDialogStartEnd', () => {
    beforeAll(() => {
      console.info("CalendarPickerDialogStartEnd beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('CalendarPickerDialogStartEnd beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogStartEndTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CalendarPickerDialogStartEnd state pages:' + JSON.stringify(pages));
        if (!('CalendarPickerDialogStartEnd' == pages.name)) {
          console.info('get CalendarPickerDialogStartEnd pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push CalendarPickerDialogStartEnd page error:' + err);
      }
      console.info('CalendarPickerDialogStartEnd beforeEach end');
    });

    

    
/**
     * @tc.number   CalendarPickerDialog_StartEnd_static_001
     * @tc.name     CalendarPickerDialog_StartEnd_static_001
     * @tc.desc     CalendarPickerDialog_StartEnd_static_001
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerDialog_StartEnd_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'CalendarPickerDialog_StartEnd_static_001';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog01')) as Component;
      await CommonFunc.sleep(300);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let obj = obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
      console.info("CalendarPickerStartEndTest_static_001 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerStartEndTest_static_001 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('2024年3月5日星期二')
      expect(obj.getElement('$attrs').getString('end')).assertEqual('2024年4月5日星期五')
      let cancelButton: Component = await driver.findComponent(ON.text('取消')) as Component;
      await CommonFunc.sleep(300);
      await (cancelButton?.click() as Promise<void>);
      console.info('CalendarPickerStartEndTest_static_001 END');
      done();
    });

    
    
/**
     * @tc.number   CalendarPickerDialog_StartEnd_static_002
     * @tc.name     CalendarPickerDialog_StartEnd_static_002
     * @tc.desc     CalendarPickerDialog_StartEnd_static_002
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerDialog_StartEnd_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'CalendarPickerDialog_StartEnd_static_002';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog02')) as Component;
      await CommonFunc.sleep(300);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let obj = obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
      console.info("CalendarPickerDialog_StartEnd_static_002 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerDialog_StartEnd_static_002 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual(undefined)
      expect(obj.getElement('$attrs').getString('end')).assertEqual(undefined)
      let cancelButton: Component = await driver.findComponent(ON.text('取消')) as Component;
      await CommonFunc.sleep(300);
      await (cancelButton?.click() as Promise<void>);
      console.info('CalendarPickerDialog_StartEnd_static_002 END');
      done();
    });

    
    
/**
     * @tc.number   CalendarPickerDialog_StartEnd_static_003
     * @tc.name     CalendarPickerDialog_StartEnd_static_003
     * @tc.desc     CalendarPickerDialog_StartEnd_static_003
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerDialog_StartEnd_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'CalendarPickerDialog_StartEnd_static_003';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog03')) as Component;
      await CommonFunc.sleep(300);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let obj = obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
      console.info("CalendarPickerDialog_StartEnd_static_003 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerDialog_StartEnd_static_003 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual(undefined)
      expect(obj.getElement('$attrs').getString('end')).assertEqual(undefined)
      let cancelButton: Component = await driver.findComponent(ON.text('取消')) as Component;
      await CommonFunc.sleep(300);
      await (cancelButton?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      console.info('CalendarPickerDialog_StartEnd_static_003 END');
      done();
    });

    
    
/**
     * @tc.number   CalendarPickerDialog_StartEnd_static_004
     * @tc.name     CalendarPickerDialog_StartEnd_static_004
     * @tc.desc     CalendarPickerDialog_StartEnd_static_004
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerDialog_StartEnd_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'CalendarPickerDialog_StartEnd_static_004';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog04')) as Component;
      await CommonFunc.sleep(300);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let obj = obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
      console.info("CalendarPickerDialog_StartEnd_static_004 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerDialog_StartEnd_static_004 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual(undefined)
      expect(obj.getElement('$attrs').getString('end')).assertEqual(undefined)
      let cancelButton: Component = await driver.findComponent(ON.text('取消')) as Component;
      await CommonFunc.sleep(300);
      await (cancelButton?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      console.info('CalendarPickerDialog_StartEnd_static_004 END');
      done();
    });

    
    
/**
     * @tc.number   CalendarPickerDialog_StartEnd_static_005
     * @tc.name     CalendarPickerDialog_StartEnd_static_005
     * @tc.desc     CalendarPickerDialog_StartEnd_static_005
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerDialog_StartEnd_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'CalendarPickerDialog_StartEnd_static_005';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog05')) as Component;
      await CommonFunc.sleep(300);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let obj = obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0]
      console.info("CalendarPickerDialog_StartEnd_static_005 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerDialog_StartEnd_static_005 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('2024年3月5日星期二')
      expect(obj.getElement('$attrs').getString('end')).assertEqual('2024年3月5日星期二')
      let cancelButton: Component = await driver.findComponent(ON.text('取消')) as Component;
      await (cancelButton?.click() as Promise<void>);
      await CommonFunc.sleep(300);
      console.info('CalendarPickerDialog_StartEnd_static_005 END');
      done();
    });
  })
}
