/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';


export default function activeApiTest() {
  describe('activeApiTest', () => {
    /**
     * @tc.number    activeApiTest_0010
     * @tc.name      activeApiTest_0010
     * @tc.desc      FocusController.active(active：true,autoInactive:false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
   it('activeApiTest_0010', 0, async (done: Function) => {
    let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest",
      }
     let result = await router.push(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0010 START');
      let driver = await Driver.create()
      await driver.triggerKey(2014);
      await driver.triggerKey(2014);
      await driver.triggerKey(2049); 
      let Button2 = await driver.findComponent(ON.id('Button2'));
      let btn3_6_isFocusedValue2 = await Button2.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(true);
      done();
    });
    /**
     * @tc.number    activeApiTest_0020
     * @tc.name      activeApiTest_0020
     * @tc.desc      FocusController.active(active：true,autoInactive:true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('activeApiTest_0020', 0, async (done: Function) => {
     let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_true_true",
      }
     let result = await router.push(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0020 START');
      let driver = await Driver.create()
      await driver.triggerKey(2014); 
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
      let btn3_6_isFocusedValue2 = await Button2.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(true);
      done();
    });
    /**
     * @tc.number    activeApiTest_0030
     * @tc.name      activeApiTest_0030
     * @tc.desc      FocusController.active(active：false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('activeApiTest_0030', 0, async (done: Function) => {
     let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_false",
      }
     let result = await router.push(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0030 START');
      let driver = await Driver.create()
      await driver.triggerKey(2014); 
      await driver.triggerKey(2049);
      let Button2 = await driver.findComponent(ON.id('Button2'));
      let btn3_6_isFocusedValue2 = await Button2.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(false);
      done();
    });

     /**
     * @tc.number    activeApiTest_0040
     * @tc.name      activeApiTest_0040
     * @tc.desc      FocusController.active(active:false,autoInactive:true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('activeApiTest_0040', 0, async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_false_true",
      }
     let result = await router.push(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0040 START');
      let driver = await Driver.create(); 
      await driver.triggerKey(2014); 
      await driver.triggerKey(2049); 
      let Button2 = await driver.findComponent(ON.id('Button2'));
      let btn3_6_isFocusedValue2 = await Button2.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(false);
      done();
    });

    /**
     * @tc.number    activeApiTest_0050
     * @tc.name      activeApiTest_0050
     * @tc.desc      FocusController.active(active:false,autoInactive:false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('activeApiTest_0050', 0, async (done: Function) => {
     let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest_false_false",
      }
     let result = await router.push(options);
      await CommonFunc.sleep(2000);
      console.info('activeApiTest_0050 START');
      let driver = await Driver.create()
      await driver.triggerKey(2014); 
      await driver.triggerKey(2049); 
      let Button2 = await driver.findComponent(ON.id('Button2'));
      let btn3_6_isFocusedValue2 = await Button2.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(false);
      done();
    });
  })
}

