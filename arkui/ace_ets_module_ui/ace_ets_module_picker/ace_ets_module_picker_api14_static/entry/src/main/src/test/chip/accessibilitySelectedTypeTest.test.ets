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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function accessibilitySelectedTypeTest() {
  describe('accessibilitySelectedTypeTest', () => {

    beforeAll(() => {
      console.info("TextPickerTextStyle beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('accessibilitySelectedTypeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chip/accessibilitySelectedTypeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get accessibilitySelectedTypeTest state pages:' + JSON.stringify(pages));
        if (!('accessibilitySelectedTypeTest' == pages.name)) {
          console.info('get accessibilitySelectedTypeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push accessibilitySelectedTypeTest page error:' + err);
      }
      console.info('accessibilitySelectedTypeTest beforeEach end');
    });
    afterEach(async () => {
    });

    
    
    
    
    /**
     * @tc.number   accessibilitySelectedTypeTest_static_0100
     * @tc.name     accessibilitySelectedTypeTest_static_0100
     * @tc.desc     accessibilitySelectedTypeTest_static_0100
     * @tc.level    Level.LEVEL3
     */
it('accessibilitySelectedTypeTest_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {

     console.info('[accessibilitySelectedTypeTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let strJson1 = inspector.getInspectorByKey('text');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[accessibilitySelectedTypeTest_static_0100] obj1.$attrs.content is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      let btn1 = await driver.findComponent(ON.id('btn'));
      await btn1!.click()
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('text');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[accessibilitySelectedTypeTest_static_0100] obj2.$attrs.content is: ' + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      await btn1!.click()
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('text');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[accessibilitySelectedTypeTest_static_0100] obj3.$attrs.content is: ' + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('2');
      done();
    });
  })
}