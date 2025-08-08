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

export default function SelectStatusTest() {
  describe('SelectStatus', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox/SelectStatus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SelectStatus state success ' + JSON.stringify(pages));
        if (!('SelectStatus' == pages.name)) {
          console.info('get SelectStatus state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push SelectStatus page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SelectStatus page error ' + JSON.stringify(err));
      }
      done()
    });


    it('SelectStatusTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'SelectStatusTest_0100';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btnCheckboxGroup1 = await driver.findComponent(ON.id('SelectAll'));
      await btnCheckboxGroup1.click();
      await Utils.sleep(1000);
      let btnCheckboxGroup4 = await driver.findComponent(ON.id('SelectAll'));
      await btnCheckboxGroup4.click();
      await Utils.sleep(1000);
      let btnCheckboxGroup5 = await driver.findComponent(ON.id('SelectAll'));
      await btnCheckboxGroup5.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('text1');
      console.info('[' + tagName + '] strJson1============================' + strJson1);
      console.info('[' + tagName + '] $attrs ============================' + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');

      console.info('[' + tagName + '] END============================');
      done();
    });

    it('SelectStatusTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let tagName = 'SelectStatusTest_0200';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let btnCheckboxGroup2 = await driver.findComponent(ON.id('SelectAll'));
      await btnCheckboxGroup2.click();
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('text1');
      console.info('[' + tagName + '] strJson2============================' + strJson2);
      console.info('[' + tagName + '] $attrs ============================' + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('2');

      console.info('[' + tagName + '] END============================');
      done();
    });

  })
}