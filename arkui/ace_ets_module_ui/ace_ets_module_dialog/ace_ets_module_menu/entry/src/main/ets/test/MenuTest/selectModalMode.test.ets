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
export default function selectModalModeTest() {
  describe('selectModalModeTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/selectModalMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectModalMode state success ' + JSON.stringify(pages));
        if (!('selectModalMode' == pages.name)) {
          console.info('get selectModalMode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push selectModalMode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push selectModalMode page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   selectModalModeTest_0010
     * @tc.number selectModalModeTest_0010
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectModalModeTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('selectModalModeTest_0010 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('selectmode'));
      await button.click();
      await Utils.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu'));
      await menu.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('text1');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      
      console.info('selectModalModeTest_0010 END');
      done();
    });

    /**
     * @tc.name   selectModalModeTest_0020
     * @tc.number selectModalModeTest_0020
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectModalModeTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('selectModalModeTest_0020 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('selectmode1'));
      await button.click();
      await Utils.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu1'));
      await menu.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('text2');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('1');
      await Utils.sleep(2000);
      console.info('selectModalModeTest_0020 END');
      done();
    });

    /**
     * @tc.name   selectModalModeTest_0030
     * @tc.number selectModalModeTest_0030
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectModalModeTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('selectModalModeTest_0030 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('selectmode2'));
      await button.click();
      await Utils.sleep(1000);

      let menu = await driver.findComponent(ON.id('menu2'));
      await menu.click();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('text3');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('2');
      await Utils.sleep(2000);
      console.info('selectModalModeTest_0030 END');
      done();
    });

  })
}