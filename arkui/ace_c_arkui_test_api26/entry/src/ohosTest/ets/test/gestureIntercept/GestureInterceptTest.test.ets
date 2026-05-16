/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function gestureInterceptTest() {

  describe('gestureInterceptTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPT_0100
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPT_0100
     * @tc.desc      test gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPT_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0100] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GestureInterceptTest';
      await Utils.pushPage(`gestureIntercept/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('CONTINUE'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('button1'));
      await btn2.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0100] gestureIntercept: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('1');

      let strJson2 = getInspectorByKey('text2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0100] gestureIntercept: ' + obj2.$attrs.label);
      expect(obj2.$attrs.label).assertEqual('0');

      let strJson3 = getInspectorByKey('text3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0100] gestureIntercept: ' + obj3.$attrs.label);
      expect(obj3.$attrs.label).assertEqual('1');

      let strJson4 = getInspectorByKey('text4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0100] gestureIntercept: ' + obj4.$attrs.label);
      expect(obj4.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0100] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPT_0200
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPT_0200
     * @tc.desc      test gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPT_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0200] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GestureInterceptTest';
      await Utils.pushPage(`gestureIntercept/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('DISCARD_LOWER'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('button1'));
      await btn2.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0200] gestureIntercept: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('0');

      let strJson2 = getInspectorByKey('text2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0200] gestureIntercept: ' + obj2.$attrs.label);
      expect(obj2.$attrs.label).assertEqual('0');

      let strJson3 = getInspectorByKey('text3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0200] gestureIntercept: ' + obj3.$attrs.label);
      expect(obj3.$attrs.label).assertEqual('1');

      let strJson4 = getInspectorByKey('text4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0200] gestureIntercept: ' + obj4.$attrs.label);
      expect(obj4.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0200] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPT_0300
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPT_0300
     * @tc.desc      test gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPT_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0300] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GestureInterceptTest';
      await Utils.pushPage(`gestureIntercept/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('DISCARD_HIGHER'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('button1'));
      await btn2.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0300] gestureIntercept: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('1');

      let strJson2 = getInspectorByKey('text2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0300] gestureIntercept: ' + obj2.$attrs.label);
      expect(obj2.$attrs.label).assertEqual('1');

      let strJson3 = getInspectorByKey('text3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0300] gestureIntercept: ' + obj3.$attrs.label);
      expect(obj3.$attrs.label).assertEqual('0');

      let strJson4 = getInspectorByKey('text4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0300] gestureIntercept: ' + obj4.$attrs.label);
      expect(obj4.$attrs.label).assertEqual('0');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0300] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPT_0400
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPT_0400
     * @tc.desc      test gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPT_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0400] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GestureInterceptTest';
      await Utils.pushPage(`gestureIntercept/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('DISCARD_SELF'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('button1'));
      await btn2.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0400] gestureIntercept: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('1');

      let strJson2 = getInspectorByKey('text2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0400] gestureIntercept: ' + obj2.$attrs.label);
      expect(obj2.$attrs.label).assertEqual('0');

      let strJson3 = getInspectorByKey('text3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0400] gestureIntercept: ' + obj3.$attrs.label);
      expect(obj3.$attrs.label).assertEqual('0');

      let strJson4 = getInspectorByKey('text4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0400] gestureIntercept: ' + obj4.$attrs.label);
      expect(obj4.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0400] END');
      done();
    })
    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPT_0500
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPT_0500
     * @tc.desc      test gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPT_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0500] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GestureInterceptTest';
      await Utils.pushPage(`gestureIntercept/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await Utils.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id('DISCARD_LOWER_PRIORITY_SIBLINGS'));
      await btn1.click();
      await Utils.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('button1'));
      await btn2.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0500] gestureIntercept: ' + obj1.$attrs.label);
      expect(obj1.$attrs.label).assertEqual('1');

      let strJson2 = getInspectorByKey('text2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0500] gestureIntercept: ' + obj2.$attrs.label);
      expect(obj2.$attrs.label).assertEqual('0');

      let strJson3 = getInspectorByKey('text3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0500] gestureIntercept: ' + obj3.$attrs.label);
      expect(obj3.$attrs.label).assertEqual('1');

      let strJson4 = getInspectorByKey('text4');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0500] gestureIntercept: ' + obj4.$attrs.label);
      expect(obj4.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0500] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPT_0600
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPT_0600
     * @tc.desc      test gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPT_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0600] START');
      await Utils.sleep(100);
      let PAGE_TAG = 'GestureInterceptTest';
      await Utils.pushPage(`gestureIntercept/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('text5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0600] gestureIntercept: ' + obj.$attrs.label);
      expect(obj.$attrs.label).assertEqual('1');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPT_0600] END');
      done();
    })
  })
}