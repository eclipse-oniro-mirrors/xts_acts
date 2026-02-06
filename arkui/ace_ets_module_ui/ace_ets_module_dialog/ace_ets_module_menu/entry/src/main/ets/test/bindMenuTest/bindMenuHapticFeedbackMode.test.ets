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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, Component } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from "../../MainAbility/common/Common"

let emitKey = 'emitUserAgent';

export default function bindMenuHapticFeedbackMode() {
  describe('bindMenuHapticFeedbackMode', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindMenu/bindMenuHapticFeedbackMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get bindMenuHapticTest state success ' + JSON.stringify(pages));
        if (!('bindMenuHapticFeedbackMode' == pages.name)) {
          console.info('get bindMenuHapticFeedbackMode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push bindMenuHapticFeedbackMode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindMenuHapticFeedbackMode page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   bindMenuHapticFeedbackModeTest_0100
     * @tc.number bindMenuHapticFeedbackModeTest_0100
     * @tc.desc   set bindMenu HapticFeedbackMode:HapticFeedbackMode.DISABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuHapticFeedbackModeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindMenuHapticFeedbackModeTest_0100';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      await Utils.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      console.info('[' + tagName + '] btn1 click ============================');
      await Utils.sleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      console.info('[' + menu + '] btn1 click ============================');
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   bindMenuHapticFeedbackModeTest_0200
     * @tc.number bindMenuHapticFeedbackModeTest_0200
     * @tc.desc   set bindMenu HapticFeedbackMode:HapticFeedbackMode.ENABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuHapticFeedbackModeTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindMenuHapticFeedbackModeTest_0200';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn2 = await driver.findComponent(ON.id('button2'));
      await btn2.click();
      await Utils.sleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('text2');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   bindMenuHapticFeedbackModeTest_0300
     * @tc.number bindMenuHapticFeedbackModeTest_0300
     * @tc.desc   set bindMenu HapticFeedbackMode:HapticFeedbackMode.AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuHapticFeedbackModeTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindMenuHapticFeedbackModeTest_0300';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn3 = await driver.findComponent(ON.id('button3'));
      await btn3.click();
      await Utils.sleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await Utils.sleep(1000);
      let strJson3 = getInspectorByKey('text3');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('2');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   bindMenuHapticFeedbackModeTest_0400
     * @tc.number bindMenuHapticFeedbackModeTest_0400
     * @tc.desc   set bindMenu HapticFeedbackMode:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuHapticFeedbackModeTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindMenuHapticFeedbackModeTest_0400';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn4 = await driver.findComponent(ON.id('button4'));
      await btn4.click();
      await Utils.sleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await Utils.sleep(1000);
      let strJson4 = getInspectorByKey('text4');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   bindMenuHapticFeedbackModeTest_0500
     * @tc.number bindMenuHapticFeedbackModeTest_0500
     * @tc.desc   set bindMenu HapticFeedbackMode:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindMenuHapticFeedbackModeTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindMenuHapticFeedbackModeTest_0500';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn5 = await driver.findComponent(ON.id('button5'));
      await btn5.click();
      await Utils.sleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await Utils.sleep(1000);
      let strJson5 = getInspectorByKey('text5');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('null');
      console.info('[' + tagName + '] END============================');
      done();
    });
   
  })
}
