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

export default function GaugePrivacySensitiveTest() {
  describe('GaugePrivacySensitiveTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GaugePrivacySensitiveTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/GaugePrivacySensitive',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GaugePrivacySensitiveTest state pages:' + JSON.stringify(pages));
        if (!('GaugePrivacySensitive' == pages.name)) {
          console.info('get GaugePrivacySensitiveTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push GaugePrivacySensitiveTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GaugePrivacySensitiveTest page error:' + err);
      }
      console.info('GaugePrivacySensitiveTest beforeEach end');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_001
    * @tc.name  : GaugePrivacySensitiveTest_001
    * @tc.desc  : To test the privacySensitive true
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('GaugePrivacySensitiveTest_001 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('gauge');
      let obj: ESObject = JSON.parse(strJson);
      console.info('GaugePrivacySensitiveTest_001 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_001] END');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_002
    * @tc.name  : GaugePrivacySensitiveTest_002
    * @tc.desc  : To test the privacySensitive false
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('GaugePrivacySensitiveTest_002 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('gauge');
      let obj: ESObject = JSON.parse(strJson);
      console.info('GaugePrivacySensitiveTest_002 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_002] END');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_003
    * @tc.name  : GaugePrivacySensitiveTest_003
    * @tc.desc  : To test the privacySensitive undefined
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('GaugePrivacySensitiveTest_003 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('gauge');
      let obj: ESObject = JSON.parse(strJson);
      console.info('GaugePrivacySensitiveTest_003 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_003] END');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_004
    * @tc.name  : GaugePrivacySensitiveTest_004
    * @tc.desc  : To test the privacySensitive null
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('GaugePrivacySensitiveTest_004 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('nullFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('gauge');
      let obj: ESObject = JSON.parse(strJson);
      console.info('GaugePrivacySensitiveTest_004 component obj is: ' + obj.$attrs.privacySensitive);
      expect(obj.$attrs.privacySensitive).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_004] END');
      done();
    });
  })
}
