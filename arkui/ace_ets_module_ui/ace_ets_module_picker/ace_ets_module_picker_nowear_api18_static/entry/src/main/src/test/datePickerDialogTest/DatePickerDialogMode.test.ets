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
    beforeAll(() => {
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
        let tagName = 'DatePickerDialog_static_0010';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_001',10,"")
        await Utils.sleep(1000);
        let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker1 =JSON.stringify(obj1.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0010] obj1 is: " + datePicker1);
        console.info("[DatePickerDialog_static_0010] obj1 is: " + JSON.stringify(JSON.parseJsonElement(datePicker1).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker1).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        inspector.sendEventByKey('DatePickerDialog_static_001',10,"")
        await Utils.sleep(2000);
        done();
      });
  
       
      
/**
     * @tc.number   DatePickerDialog_static_0020
     * @tc.name     DatePickerDialog_static_0020
     * @tc.desc     DatePickerDialog_static_0020
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'DatePickerDialog_static_0020';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_002',10,"")
        await Utils.sleep(1000);
        let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker2 =JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0020] obj2 is: " + datePicker2);
        console.info("[DatePickerDialog_static_0020] obj2 is: " + JSON.stringify(JSON.parseJsonElement(datePicker2).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker2).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.YEAR_AND_MONTH');
        console.info('[' + tagName + '] END ===========================');
        inspector.sendEventByKey('DatePickerDialog_static_002',10,"")
        await Utils.sleep(2000);
        done();
      });
  
       
      
/**
     * @tc.number   DatePickerDialog_static_0030
     * @tc.name     DatePickerDialog_static_0030
     * @tc.desc     DatePickerDialog_static_0030
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_static_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'DatePickerDialog_static_0030';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_003',10,"")
        await Utils.sleep(1000);
        let obj3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker3 =JSON.stringify(obj3.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0030] obj3 is: " + datePicker3);
        console.info("[DatePickerDialog_static_0030] obj3 is: " + JSON.stringify(JSON.parseJsonElement(datePicker3).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker3).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.MONTH_AND_DAY');
        console.info('[' + tagName + '] END ===========================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_003',10,"")
        await Utils.sleep(2000);
        done();
      });
  
       
      
/**
     * @tc.number   DatePickerDialog_static_0040
     * @tc.name     DatePickerDialog_static_0040
     * @tc.desc     DatePickerDialog_static_0040
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_static_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'DatePickerDialog_static_0040';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_004',10,"")
        await Utils.sleep(1000);
        let obj4 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker4 =JSON.stringify(obj4.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0040] obj4 is: " + datePicker4);
        console.info("[DatePickerDialog_static_0040] obj4 is: " + JSON.stringify(JSON.parseJsonElement(datePicker4).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker4).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        inspector.sendEventByKey('DatePickerDialog_static_004',10,"")
        await Utils.sleep(2000);
        done();
      });
  
       
      
/**
     * @tc.number   DatePickerDialog_static_0050
     * @tc.name     DatePickerDialog_static_0050
     * @tc.desc     DatePickerDialog_static_0050
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_static_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'DatePickerDialog_static_0050';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_005',10,"")
        await Utils.sleep(1000);
        let obj5 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker5 =JSON.stringify(obj5.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0050] obj5 is: " + datePicker5);
        console.info("[DatePickerDialog_static_0050] obj5 is: " + JSON.stringify(JSON.parseJsonElement(datePicker5).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker5).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        inspector.sendEventByKey('DatePickerDialog_static_005',10,"")
        await Utils.sleep(2000);
        done();
      });
  
       
      
/**
     * @tc.number   DatePickerDialog_static_0060
     * @tc.name     DatePickerDialog_static_0060
     * @tc.desc     DatePickerDialog_static_0060
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_static_0060', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'DatePickerDialog_static_0060';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_006',10,"")
        await Utils.sleep(1000);
        let obj6 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker6 =JSON.stringify(obj6.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0060] obj6 is: " + datePicker6);
        console.info("[DatePickerDialog_static_0060] obj6 is: " + JSON.stringify(JSON.parseJsonElement(datePicker6).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker6).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_006',10,"")
        await Utils.sleep(2000);
        done();
      });
  
       
      
/**
     * @tc.number   DatePickerDialog_static_0070
     * @tc.name     DatePickerDialog_static_0070
     * @tc.desc     DatePickerDialog_static_0070
     * @tc.level    Level.LEVEL1
     */
it('DatePickerDialog_static_0070', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'DatePickerDialog_static_0070';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        inspector.sendEventByKey('DatePickerDialog_static_007',10,"")
        await Utils.sleep(1000);
        let obj7 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let datePicker7 =JSON.stringify(obj7.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[1].getArray('$children')[0])
        console.info("[DatePickerDialog_static_0070] obj7 is: " + datePicker7);
        console.info("[DatePickerDialog_static_0070] obj7 is: " + JSON.stringify(JSON.parseJsonElement(datePicker7).getElement('$attrs').getElement('constructor').getString('mode')));
        expect(JSON.parseJsonElement(datePicker7).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
        console.info('[' + tagName + '] END ===========================');
        inspector.sendEventByKey('DatePickerDialog_static_007',10,"")
        await Utils.sleep(2000);
        done();
      });
    })
}
