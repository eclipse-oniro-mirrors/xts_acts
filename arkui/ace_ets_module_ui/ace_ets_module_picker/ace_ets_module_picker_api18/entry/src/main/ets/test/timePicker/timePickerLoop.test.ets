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

export default function timePickerLoopTest() {
  describe('timePickerLoopTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerLoop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerLoopTest state pages:' + JSON.stringify(pages));
        if (!('timePickerLoop' == pages.name)) {
          console.info('get timePickerLoopTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push timePickerLoopTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerLoopTest page error:' + err);
      }
      console.info('timePickerLoopTest beforeEach end');
      done();
    });
    /* *
    * @tc.number: timePickerLoopTest_001
    * @tc.name  : timePickerLoopTest_001
    * @tc.desc  : To test the loop true
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('timePickerLoopTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerLoopTest_001 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info('timePickerLoopTest_001 component obj is: ' + obj.$attrs.loop);
      expect(obj.$attrs.loop).assertEqual('true');
      console.info('[timePickerLoopTest_001] END');
      done();
    });
    /* *
    * @tc.number: timePickerLoopTest_002
    * @tc.name  : timePickerLoopTest_002
    * @tc.desc  : To test the loop false
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('timePickerLoopTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerLoopTest_002 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info('timePickerLoopTest_002 component obj is: ' + obj.$attrs.loop);
      expect(obj.$attrs.loop).assertEqual('false');
      console.info('[timePickerLoopTest_002] END');
      done();
    });
    /* *
    * @tc.number: timePickerLoopTest_003
    * @tc.name  : timePickerLoopTest_003
    * @tc.desc  : To test the loop undefined
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('timePickerLoopTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerLoopTest_003 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await Utils.sleep(1000);
      await button.click()
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info('timePickerLoopTest_003 component obj is: ' + obj.$attrs.loop);
      expect(obj.$attrs.loop).assertEqual('true');
      console.info('[timePickerLoopTest_003] END');
      done();
    });
  })
}
