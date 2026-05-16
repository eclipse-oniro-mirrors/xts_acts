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

export default function TextAreaTest() {
  describe('TextAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextAreaTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextArea',
      }
      try {
        router.clear();
        const pages = router.getState();
        console.info('get TextAreaTest state success ' + JSON.stringify(pages));
        if (!pages.name.includes('TextAreaTest')) {

          const result = await router.replaceUrl(options);
          console.info('push TextAreaTest page success ' + JSON.stringify(result));
        }
        await CommonFunc.sleep(2000); 
      } catch (err) {
        console.error('push TextAreaTest page error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextAreaTest afterEach called');

    });

    /**
     * @tc.name   TextAreaTest_0010
     * @tc.number TextAreaTest_0010
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextAreaTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0010] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let TextAreaTestinclude = await driver.findComponent(ON.id('TextAreaTestinclude'));
      await CommonFunc.sleep(500);
      await TextAreaTestinclude.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextAreaTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextAreaTest_0010] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('1');

      console.info('[TextAreaTest_0010] END');
      done();
    });
    
    /**
     * @tc.name   TextAreaTest_0020
     * @tc.number TextAreaTest_0020
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextAreaTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0020] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let TextAreaTestnull = await driver.findComponent(ON.id('TextAreaTestnull'));
      await CommonFunc.sleep(500);
      await TextAreaTestnull.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextAreaTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextAreaTest_0020] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('0');

      console.info('[TextAreaTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaTest_0030
     * @tc.number TextAreaTest_0030
     * @tc.desc   test the RichEditor deleteBackward emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextAreaTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[TextAreaTest_0030] START');
      await CommonFunc.sleep(1500);
      let driver = await Driver.create()
      let TextAreaTestundefined = await driver.findComponent(ON.id('TextAreaTestundefined'));
      await CommonFunc.sleep(500);
      await TextAreaTestundefined.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextAreaTest');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[TextAreaTest_0030] fallbackLineSpacing: ' + obj.$attrs.fallbackLineSpacing);
      expect(obj.$attrs.fallbackLineSpacing).assertEqual('0');

      console.info('[TextAreaTest_0030] END');
      done();
    });
  })
}