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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
export default function menuSubMenuExpandSymbolTest() {
  describe('menuSubMenuExpandSymbolTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/subMenuExpandSymbol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subMenuExpandSymbol state success ' + JSON.stringify(pages));
        if (!('subMenuExpandSymbol' == pages.name)) {
          console.info('get subMenuExpandSymbol state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push subMenuExpandSymbol page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push subMenuExpandSymbol page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   menuSubMenuExpandSymbolTest_0010
     * @tc.number menuSubMenuExpandSymbolTest_0010
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuSubMenuExpandSymbolTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'menuSubMenuExpandSymbolTest_0010';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn1"));
      await btn.click();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("MenuItem1"));
      btn1.click();
      await Utils.sleep(2000);
      let obj: ESObject = getInspectorByKey('text1');
      await Utils.sleep(2000);
      expect(JSON.parse(obj).$attrs.content).assertEqual('sys.symbol.chevron_forward');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   menuSubMenuExpandSymbolTest_0020
     * @tc.number menuSubMenuExpandSymbolTest_0020
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuSubMenuExpandSymbolTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'menuSubMenuExpandSymbolTest_0020';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn2"));
      await btn.click();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("MenuItem2"));
      btn1.click();
      await Utils.sleep(2000);
      let obj: ESObject = getInspectorByKey('text2');
      await Utils.sleep(2000);
      expect(JSON.parse(obj).$attrs.content).assertEqual('sys.symbol.chevron_forward');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   menuSubMenuExpandSymbolTest_0030
     * @tc.number menuSubMenuExpandSymbolTest_0030
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuSubMenuExpandSymbolTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'menuSubMenuExpandSymbolTest_0030';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn3"));
      await btn.click();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("MenuItem3"));
      btn1.click();
      await Utils.sleep(2000);
      let obj: ESObject = getInspectorByKey('text3');
      await Utils.sleep(2000);
      expect(JSON.parse(obj).$attrs.content).assertEqual('sys.symbol.chevron_forward');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   menuSubMenuExpandSymbolTest_0040
     * @tc.number menuSubMenuExpandSymbolTest_0040
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuSubMenuExpandSymbolTest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'menuSubMenuExpandSymbolTest_0040';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn4"));
      await btn.click();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("MenuItem4"));
      btn1.click();
      await Utils.sleep(2000);
      let obj: ESObject = getInspectorByKey('text4');
      await Utils.sleep(2000);
      expect(JSON.parse(obj).$attrs.content).assertEqual('sys.symbol.chevron_down');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   menuSubMenuExpandSymbolTest_0050
     * @tc.number menuSubMenuExpandSymbolTest_0050
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuSubMenuExpandSymbolTest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'menuSubMenuExpandSymbolTest_0050';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn5"));
      await btn.click();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("MenuItem5"));
      btn1.click();
      await Utils.sleep(2000);
      let obj: ESObject = getInspectorByKey('text5');
      await Utils.sleep(2000);
      expect(JSON.parse(obj).$attrs.content).assertEqual('sys.symbol.chevron_down');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });

    /**
     * @tc.name   menuSubMenuExpandSymbolTest_0060
     * @tc.number menuSubMenuExpandSymbolTest_0060
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('menuSubMenuExpandSymbolTest_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'menuSubMenuExpandSymbolTest_0060';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn6"));
      await btn.click();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("MenuItem6"));
      btn1.click();
      await Utils.sleep(2000);
      let obj: ESObject = getInspectorByKey('text6');
      await Utils.sleep(2000);
      expect(JSON.parse(obj).$attrs.content).assertEqual('sys.symbol.chevron_down');
      btn.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END============================');
      done();
    });
  })
}