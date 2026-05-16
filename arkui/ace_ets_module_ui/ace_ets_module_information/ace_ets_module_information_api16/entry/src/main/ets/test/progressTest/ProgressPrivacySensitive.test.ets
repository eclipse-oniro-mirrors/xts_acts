/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function ProgressPrivacySensitiveTest() {
  describe('ProgressPrivacySensitiveTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ProgressPrivacySensitiveTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress/ProgressPrivacySensitive',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ProgressPrivacySensitiveTest state pages:' + JSON.stringify(pages));
        if (!('GaugePrivacySensitive' == pages.name)) {
          console.info('get ProgressPrivacySensitiveTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ProgressPrivacySensitiveTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ProgressPrivacySensitiveTest page error:' + err);
      }
      console.info('ProgressPrivacySensitiveTest beforeEach end');
      done();
    });
    /**
     * @tc.name   ProgressPrivacySensitiveTest_001
     * @tc.number ProgressPrivacySensitiveTest_001
     * @tc.desc   To test the privacySensitive true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProgressPrivacySensitiveTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('ProgressPrivacySensitiveTest_001 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('progress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ProgressPrivacySensitiveTest_001 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_001] END');
      done();
    });
    /**
     * @tc.name   ProgressPrivacySensitiveTest_002
     * @tc.number ProgressPrivacySensitiveTest_002
     * @tc.desc   To test the privacySensitive false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProgressPrivacySensitiveTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('ProgressPrivacySensitiveTest_002 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('progress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ProgressPrivacySensitiveTest_002 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_002] END');
      done();
    });
    /**
     * @tc.name   ProgressPrivacySensitiveTest_003
     * @tc.number ProgressPrivacySensitiveTest_003
     * @tc.desc   To test the privacySensitive undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProgressPrivacySensitiveTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('ProgressPrivacySensitiveTest_003 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('progress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ProgressPrivacySensitiveTest_003 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_003] END');
      done();
    });
    /**
     * @tc.name   ProgressPrivacySensitiveTest_004
     * @tc.number ProgressPrivacySensitiveTest_004
     * @tc.desc   To test the privacySensitive null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ProgressPrivacySensitiveTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('ProgressPrivacySensitiveTest_004 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('nullFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('progress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ProgressPrivacySensitiveTest_004 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_004] END');
      done();
    });
  })
}
