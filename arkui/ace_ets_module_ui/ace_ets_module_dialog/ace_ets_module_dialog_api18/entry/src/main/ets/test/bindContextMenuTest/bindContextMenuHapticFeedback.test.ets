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
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from "../../MainAbility/common/Common"

let emitKey = 'emitUserAgent';

export default function bindContextMenuHapticFeedbackMode() {
  describe('bindContextMenuHapticFeedbackMode', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindContextMenu/bindContextMenuHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get bindContextMenuHapticFeedback state success ' + JSON.stringify(pages));
        if (!('bindContextMenuHapticFeedback' == pages.name)) {
          console.info('get bindContextMenuHapticFeedback state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push bindContextMenuHapticFeedback page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push bindContextMenuHapticFeedback page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
    * @tc.number    bindContextMenuHapticFeedbackModeTest_0100
    * @tc.name      bindContextMenuHapticFeedbackModeTest_0100
    * @tc.desc      set bindContextMenu HapticFeedbackMode:HapticFeedbackMode.DISABLED
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('bindContextMenuHapticFeedbackModeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_0100';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn01 = await driver.findComponent(ON.id('button01'));
      await btn01.longClick();
      await Utils.sleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
    * @tc.number    bindContextMenuHapticFeedbackModeTest_0200
    * @tc.name      bindContextMenuHapticFeedbackModeTest_0200
    * @tc.desc      set bindContextMenu HapticFeedbackMode:HapticFeedbackMode.ENABLED
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('bindContextMenuHapticFeedbackModeTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_0200';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn02 = await driver.findComponent(ON.id('button02'));
      await btn02.longClick();
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
    * @tc.number    bindContextMenuHapticFeedbackModeTest_0300
    * @tc.name      bindContextMenuHapticFeedbackModeTest_0300
    * @tc.desc      set bindContextMenu HapticFeedbackMode:HapticFeedbackMode.AUTO
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('bindContextMenuHapticFeedbackModeTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_0300';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn03 = await driver.findComponent(ON.id('button03'));
      await btn03.longClick();
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
    * @tc.number    bindContextMenuHapticFeedbackModeTest_0400
    * @tc.name      bindContextMenuHapticFeedbackModeTest_0400
    * @tc.desc      set bindContextMenu HapticFeedbackMode:undefined
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('bindContextMenuHapticFeedbackModeTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_0400';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn04 = await driver.findComponent(ON.id('button04'));
      await btn04.longClick();
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
    * @tc.number    bindContextMenuHapticFeedbackModeTest_0500
    * @tc.name      bindContextMenuHapticFeedbackModeTest_0500
    * @tc.desc      set bindContextMenu HapticFeedbackMode:null
    * @tc.level:    Level 1
    * @tc.type :
    * @tc.size :
    */
    it('bindContextMenuHapticFeedbackModeTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_0500';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btn05 = await driver.findComponent(ON.id('button05'));
      await btn05.longClick();
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
