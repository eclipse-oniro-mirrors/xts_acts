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

export default function datePickerDialogModeTest() {
  describe('DatePickerDialogMode', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DatePickerDialogMode beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/DatePickerDialogMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DatePickerDialog state success ' + JSON.stringify(pages));
        if (!('DatePickerDialogMode' == pages.name)) {
          console.info('get DatePickerDialog state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error('push DatePickerDialog page error ' + JSON.stringify(err));
      }
    });   
     
    /**
     * @tc.number   DatePickerDialog_static_0010
     * @tc.name     DatePickerDialog_static_0010
     * @tc.desc     DatePickerDialog_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0010 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
        
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000); 

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0010] tree modeValue is: " + modeValue);        
      expect(modeValue).assertEqual('DatePickerMode.DATE');
        
      console.info('DatePickerDialog_static_0010 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });
      
    /**
     * @tc.number   DatePickerDialog_static_0020
     * @tc.name     DatePickerDialog_static_0020
     * @tc.desc     DatePickerDialog_static_0020
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0020 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0020] tree modeValue is: " + modeValue);
      expect(modeValue).assertEqual('DatePickerMode.YEAR_AND_MONTH');
      console.info('DatePickerDialog_static_0020 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });
     
    /**
     * @tc.number   DatePickerDialog_static_0030
     * @tc.name     DatePickerDialog_static_0030
     * @tc.desc     DatePickerDialog_static_0030
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0030 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0030] tree modeValue is: " + modeValue);
      expect(modeValue).assertEqual('DatePickerMode.MONTH_AND_DAY');
      console.info('DatePickerDialog_static_0030 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });
      
    /**
     * @tc.number   DatePickerDialog_static_0040
     * @tc.name     DatePickerDialog_static_0040
     * @tc.desc     DatePickerDialog_static_0040
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0040 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0040] tree modeValue is: " + modeValue);
      expect(modeValue).assertEqual('DatePickerMode.DATE');
      console.info('DatePickerDialog_static_0040 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });
       
    /**
     * @tc.number   DatePickerDialog_static_0050
     * @tc.name     DatePickerDialog_static_0050
     * @tc.desc     DatePickerDialog_static_0050
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0050 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_005'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0050] tree modeValue is: " + modeValue);
      expect(modeValue).assertEqual('DatePickerMode.DATE');
      console.info('DatePickerDialog_static_0050 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });     
      
    /**
     * @tc.number   DatePickerDialog_static_0060
     * @tc.name     DatePickerDialog_static_0060
     * @tc.desc     DatePickerDialog_static_0060
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0060 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_006'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0060] tree modeValue is: " + modeValue);
      expect(modeValue).assertEqual('DatePickerMode.DATE');
      console.info('DatePickerDialog_static_0060 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });
       
    /**
     * @tc.number   DatePickerDialog_static_0070
     * @tc.name     DatePickerDialog_static_0070
     * @tc.desc     DatePickerDialog_static_0070
     * @tc.level    Level.LEVEL1
     */
    it('DatePickerDialog_static_0070', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DatePickerDialog_static_0070 start ===========================');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DatePickerDialog_static_007'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);

      let datePicker = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0];
      let modeValue = datePicker.getElement('$attrs').getElement('constructor').getString('mode');

      console.info("[DatePickerDialog_static_0070] tree modeValue is: " + modeValue);
      expect(modeValue).assertEqual('DatePickerMode.DATE');
      console.info('DatePickerDialog_static_0070 END ===========================');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000); 
      done();
    });
  })
}
