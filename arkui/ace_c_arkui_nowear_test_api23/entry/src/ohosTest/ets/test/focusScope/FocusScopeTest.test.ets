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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function focusScopeTest() {

  describe('focusScopeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    focusScopeTest_001
     * @tc.name      focusScopeTest_001
     * @tc.desc      test focusScopeId(isGroup: true, isArrow: false)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_001] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('1'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('focusScopeTest'));
      await btn2.click();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2013);
      await Utils.sleep(200);
      await driver.triggerKey(2013);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_001] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('f2');
      console.info('[focusScopeTest_001] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_002
     * @tc.name      focusScopeTest_002
     * @tc.desc      test focusScopeId(isGroup: true, isArrow: true)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_002] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('2'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('focusScopeTest'));
      await btn2.click();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2013);
      await Utils.sleep(200);
      await driver.triggerKey(2013);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_002] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('f3');
      console.info('[focusScopeTest_002] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_003
     * @tc.name      focusScopeTest_003
     * @tc.desc      test focusScopeId(isGroup: false, isArrow: true)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_003] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('3'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('focusScopeTest'));
      await btn2.click();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_003] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('f3');
      console.info('[focusScopeTest_003] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_004
     * @tc.name      focusScopeTest_004
     * @tc.desc      test focusScopeId(isGroup: 2, isArrow: 2)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_004] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('4'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_004] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('401');
      console.info('[focusScopeTest_004] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_005
     * @tc.name      focusScopeTest_005
     * @tc.desc      test focusScopePriority(ARKUI_FOCUS_PRIORITY_PRIOR)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_005', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_005] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('5'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('focusScopeTest'));
      await btn2.click();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_005] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('f2');
      console.info('[focusScopeTest_005] END');
      done();
    })
    
    /**
     * @tc.number    focusScopeTest_006
     * @tc.name      focusScopeTest_006
     * @tc.desc      test focusScopePriority(ARKUI_FOCUS_PRIORITY_PRIOR)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_006', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_006] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('6'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('focusScopeTest'));
      await btn2.click();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_006] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('f3');
      console.info('[focusScopeTest_006] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_007
     * @tc.name      focusScopeTest_007
     * @tc.desc      test focusScopePriority(ARKUI_FOCUS_PRIORITY_AUTO)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_007', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_007] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('7'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('focusScopeTest'));
      await btn2.click();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(200);
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_007] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('f4');
      console.info('[focusScopeTest_007] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_008
     * @tc.name      focusScopeTest_008
     * @tc.desc      test focusScopePriority(ARKUI_FOCUS_PRIORITY_PREVIOUS)
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_008', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_008] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('8'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_008] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('401');
      console.info('[focusScopeTest_008] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_009
     * @tc.name      focusScopeTest_009
     * @tc.desc      test focusScopeId nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_009', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_009] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('9'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_009] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('401');
      console.info('[focusScopeTest_009] END');
      done();
    })

    /**
     * @tc.number    focusScopeTest_010
     * @tc.name      focusScopeTest_010
     * @tc.desc      test focusScopePriority nullptr
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('focusScopeTest_010', Level.LEVEL1, async (done: Function) => {
      console.info('[focusScopeTest_010] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'FocusScopeTest';
      await Utils.pushPage(`focusScope/${PAGE_TAG}`);
      await Utils.sleep(1500);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('10'));
      await btn1.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('focusScopeTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[focusScopeTest_010] focusScopeTest: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('401');
      console.info('[focusScopeTest_010] END');
      done();
    })
  })
}