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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function datePickerMode() {
  describe('DatePickerMode', () => {
    beforeAll(() => {
      console.info("DatePicker beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api18.static", "EntryAbility")

    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/DatePickerMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DatePicker state success ' + JSON.stringify(pages));
        if (!('DatePickerMode' == pages.name)) {
          console.info('get DatePicker state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await UtilsTest.msSleep(2000)
          // let result = await routerInstance.pushUrl(options)
          // console.info('push DatePickerMode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePicker page error ' + JSON.stringify(err));
      }
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0100
     * @tc.name     DatePicker_static_0100
     * @tc.desc     DatePicker_static_0100
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0100';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_001');
      console.info('[' + tagName + '] Search end is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
      
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0200
     * @tc.name     DatePicker_static_0200
     * @tc.desc     DatePicker_static_0200
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0200';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_002');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.YEAR_AND_MONTH');
      
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0300
     * @tc.name     DatePicker_static_0300
     * @tc.desc     DatePicker_static_0300
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0300';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_003');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.MONTH_AND_DAY');
      
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0400
     * @tc.name     DatePicker_static_0400
     * @tc.desc     DatePicker_static_0400
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0400';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_004');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
      
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0500
     * @tc.name     DatePicker_static_0500
     * @tc.desc     DatePicker_static_0500
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0500';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_005');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
      
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0600
     * @tc.name     DatePicker_static_0600
     * @tc.desc     DatePicker_static_0600
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0600';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_006');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
      
      done();
    });

    
    
    
    
    
/**
     * @tc.number   DatePicker_static_0700
     * @tc.name     DatePicker_static_0700
     * @tc.desc     DatePicker_static_0700
     * @tc.level    Level.LEVEL1
     */
it('DatePicker_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.sleep(2000);
      let tagName = 'DatePicker_static_0700';
      
      let strJsonNew = inspector.getInspectorByKey('key_DatePicker_007');
      console.info('[' + tagName + '] Search mode is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs').getElement('constructor').getString('mode')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('constructor').getString('mode')).assertEqual('DatePickerMode.DATE');
      
      done();
    });
  })
}
