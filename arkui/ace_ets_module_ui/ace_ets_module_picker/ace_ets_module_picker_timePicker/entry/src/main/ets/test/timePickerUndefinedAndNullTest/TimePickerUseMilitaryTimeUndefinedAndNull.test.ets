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

export default function timePickerUseMilitaryTimeUndefinedAndNullTest() {
  describe('timePickerUseMilitaryTimeUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('timePickerUseMilitaryTimeUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerUndefinedAndNull/TimePickerUseMilitaryTimeUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get timePickerUseMilitaryTimeUndefinedAndNullTest state pages:' + JSON.stringify(pages));
        if (!('TimePickerUseMilitaryTimeUndefinedAndNull' == pages.name)) {
          console.info('get timePickerUseMilitaryTimeUndefinedAndNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push timePickerUseMilitaryTimeUndefinedAndNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push timePickerUseMilitaryTimeUndefinedAndNullTest page error:' + err);
      }
      console.info('timePickerUseMilitaryTimeUndefinedAndNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   timePickerUseMilitaryTimeUndefinedAndNullTest_001
     * @tc.number timePickerUseMilitaryTimeUndefinedAndNullTest_001
     * @tc.desc   To test the useMilitaryTime undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerUseMilitaryTimeUndefinedAndNullTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerUseMilitaryTimeUndefinedAndNullTest_001 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('useMilitaryTimeUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('timePickerUseMilitaryTimeUndefinedAndNullTest_001 component obj is: ' + obj.$attrs.useMilitaryTime);
      expect(obj.$attrs.useMilitaryTime).assertEqual('false');
      console.info('[timePickerUseMilitaryTimeUndefinedAndNullTest_001] END');
      done();
    });

    /**
     * @tc.name   timePickerUseMilitaryTimeUndefinedAndNullTest_002
     * @tc.number timePickerUseMilitaryTimeUndefinedAndNullTest_002
     * @tc.desc   To test the useMilitaryTime null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('timePickerUseMilitaryTimeUndefinedAndNullTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('timePickerUseMilitaryTimeUndefinedAndNullTest_002 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('useMilitaryTimeNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('timePickerUseMilitaryTimeUndefinedAndNullTest_002 component obj is: ' + obj.$attrs.useMilitaryTime);
      expect(obj.$attrs.useMilitaryTime).assertEqual('false');
      console.info('[timePickerUseMilitaryTimeUndefinedAndNullTest_002] END');
      done();
    });
  })
}
