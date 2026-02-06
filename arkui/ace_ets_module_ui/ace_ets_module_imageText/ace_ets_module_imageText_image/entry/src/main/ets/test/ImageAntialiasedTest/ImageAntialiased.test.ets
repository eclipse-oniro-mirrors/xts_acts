/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, Size, beforeEach, afterEach, TestType, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@kit.TestKit';

const SLEEP_TIME = 1000;

export default function ImageAntialiasedTest() {
  describe('ImageAntialiasedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAntialiasedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAntialiased/ImageAntialiased',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAntialiasedTest state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('ImageAntialiased' == pages.name)) {
          console.info('get ImageAntialiasedTest state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push ImageAntialiasedTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAntialiasedTest page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAntialiasedTest after each called');
    });

    /**
     * @tc.name   ImageAntialiasedTest001
     * @tc.number ImageAntialiasedTest001
     * @tc.desc   Do not set the antialiased attribute,the default value false is used.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAntialiasedTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageAntialiasedTest001 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('noAntialiasedImageKey');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAntialiasedTest001]:' + JSON.stringify(obj.$attrs));
      console.info('[ImageAntialiasedTest001]:' + JSON.stringify(obj.$attrs.antialiased));
      expect(obj.$attrs.antialiased).assertEqual('false');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('ImageAntialiasedTest001 END');
      done();
    });

    /**
     * @tc.name   ImageAntialiasedTest002
     * @tc.number ImageAntialiasedTest002
     * @tc.desc   Test the antialiased interface to set true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAntialiasedTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ImageAntialiasedTest002 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('true'));
      await button.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('antialiasedImageKey');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAntialiasedTest002]:' + JSON.stringify(obj.$attrs));
      console.info('[ImageAntialiasedTest002]:' + JSON.stringify(obj.$attrs.antialiased));
      expect(obj.$attrs.antialiased).assertEqual('true');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('ImageAntialiasedTest002 END');
      done();
    });

    /**
     * @tc.name   ImageAntialiasedTest003
     * @tc.number ImageAntialiasedTest003
     * @tc.desc   Test the antialiased interface to set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAntialiasedTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ImageAntialiasedTest003 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('false'));
      await button.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('antialiasedImageKey');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAntialiasedTest003]:' + JSON.stringify(obj.$attrs));
      console.info('[ImageAntialiasedTest003]:' + JSON.stringify(obj.$attrs.antialiased));
      expect(obj.$attrs.antialiased).assertEqual('false');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('ImageAntialiasedTest003 END');
      done();
    });

    /**
     * @tc.name   ImageAntialiasedTest004
     * @tc.number ImageAntialiasedTest004
     * @tc.desc   Test the antialiased interface to set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageAntialiasedTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ImageAntialiasedTest004 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('antialiasedImageKey');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAntialiasedTest004]:' + JSON.stringify(obj.$attrs));
      console.info('[ImageAntialiasedTest004]:' + JSON.stringify(obj.$attrs.antialiased));
      expect(obj.$attrs.antialiased).assertEqual('false');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('ImageAntialiasedTest004 END');
      done();
    });
  })
}