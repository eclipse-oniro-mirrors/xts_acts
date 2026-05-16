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
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../../Util.test'

export default function activeApiTest() {
  describe('activeApiTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.open.harmony.nowearevent.static", "EntryAbility")

    });
    
   
/**
     * @tc.number   activeApiTest_static_0010
     * @tc.name     activeApiTest_static_0010
     * @tc.desc     activeApiTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('activeApiTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
     const routerInstance = AppStorage.get<Router>("router") as Router;
    let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest",
      }
     routerInstance.pushUrl(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0010 START');
      let driver = Driver.create()
      await driver.triggerKey(2014);
      await driver.triggerKey(2014);
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
     if (Button2 != null) {
       let btn3_6_isFocusedValue2 = await Button2.isFocused()
       expect(btn3_6_isFocusedValue2).assertEqual(true);
     }
      done();
    });
    
    
/**
     * @tc.number   activeApiTest_static_0020
     * @tc.name     activeApiTest_static_0020
     * @tc.desc     activeApiTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('activeApiTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router;
     let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_true_true",
      }
     routerInstance.pushUrl(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0020 START');
      let driver = Driver.create()
      await driver.triggerKey(2014);
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
      if (Button2 != null) {
        let btn3_6_isFocusedValue2 = await Button2.isFocused()
        expect(btn3_6_isFocusedValue2).assertEqual(true);
      }
      done();
    });
    

/**
     * @tc.number   activeApiTest_static_0030
     * @tc.name     activeApiTest_static_0030
     * @tc.desc     activeApiTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('activeApiTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router;
     let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_false",
      }
     routerInstance.pushUrl(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0030 START');
      let driver = Driver.create()
      await driver.triggerKey(2014);
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
      if (Button2 != null) {
        let btn3_6_isFocusedValue2 = await Button2.isFocused()
        expect(btn3_6_isFocusedValue2).assertEqual(false);
      }
      done();
    });

     
    
/**
     * @tc.number   activeApiTest_static_0040
     * @tc.name     activeApiTest_static_0040
     * @tc.desc     activeApiTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('activeApiTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router;
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_false_true",
      }
     routerInstance.pushUrl(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0040 START');
      let driver = Driver.create();
      await driver.triggerKey(2014);
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
      if (Button2 != null) {
        let btn3_6_isFocusedValue2 = await Button2.isFocused()
        expect(btn3_6_isFocusedValue2).assertEqual(false);
      }
      done();
    });

    

/**
     * @tc.number   activeApiTest_static_0050
     * @tc.name     activeApiTest_static_0050
     * @tc.desc     activeApiTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('activeApiTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router;
     let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_false_false",
      }
     routerInstance.pushUrl(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0050 START');
      let driver = Driver.create()
      await driver.triggerKey(2014);
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
      if (Button2 != null) {
        let btn3_6_isFocusedValue2 = await Button2.isFocused()
        expect(btn3_6_isFocusedValue2).assertEqual(false);
      }
      done();
    });
  })
}

