/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextInputTest() {
  describe('TextInputTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextInputTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextInput',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get TextInputTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('TextInputTest')) {

          const result = await router.replaceUrl(options);
          console.info('push TextInputTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000); 
      } catch (err) {
        console.error('push TextInputTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextInputTest afterEach called');

    });

    /**
     * @tc.name   TextInputTest_0010
     * @tc.number TextInputTest_0010
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextInputTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0010] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let TextInputTestinclude = await driver.findComponent(ON.id('TextInputTestinclude'));
      await CommonFunc.sleep(500);
      await TextInputTestinclude.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextInputTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0010] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('1');

      console.info('[TextInputTest_0010] END');
      done();
    });
    
    /**
     * @tc.name   TextInputTest_0020
     * @tc.number TextInputTest_0020
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextInputTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0020] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let TextInputTestnull = await driver.findComponent(ON.id('TextInputTestnull'));
      await CommonFunc.sleep(500);
      await TextInputTestnull.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextInputTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0020] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('0');

      console.info('[TextInputTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextInputTest_0030
     * @tc.number TextInputTest_0030
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextInputTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[TextInputTest_0030] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let TextInputTestundefined = await driver.findComponent(ON.id('TextInputTestundefined'));
      await CommonFunc.sleep(500);
      await TextInputTestundefined.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextInputTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextInputTest_0030] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('0');

      console.info('[TextInputTest_0030] END');
      done();
    });
  })
}