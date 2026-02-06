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

export default function TextClockDateTimeOptionsTest() {
  describe('TextClockDateTimeOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextClockDateTimeOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textClock/TextClockDateTimeOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextClockDateTimeOptionsTest state pages:' + JSON.stringify(pages));
        if (!('TextClockDateTimeOptions' == pages.name)) {
          console.info('get TextClockDateTimeOptionsTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextClockDateTimeOptionsTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextClockDateTimeOptionsTest page error:' + err);
      }
      console.info('TextClockDateTimeOptionsTest beforeEach end');
      done();
    });
    /**
     * @tc.name   TextClockDateTimeOptionsTest_001
     * @tc.number TextClockDateTimeOptionsTest_001
     * @tc.desc   To test the dateTimeOptions numeric
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextClockDateTimeOptionsTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('TextClockDateTimeOptionsTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('numeric');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextClockDateTimeOptionsTest_001 component obj is: ' + obj.$attrs.dateTimeOptions);
      expect(obj.$attrs.dateTimeOptions).assertEqual('{"hour":"numeric"}');
      console.info('[TextClockDateTimeOptionsTest_001] END');
      done();
    });
    /**
     * @tc.name   TextClockDateTimeOptionsTest_002
     * @tc.number TextClockDateTimeOptionsTest_002
     * @tc.desc   To test the dateTimeOptions 2-digit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextClockDateTimeOptionsTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('TextClockDateTimeOptionsTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('digit');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextClockDateTimeOptionsTest_002 component obj is: ' + obj.$attrs.dateTimeOptions);
      expect(obj.$attrs.dateTimeOptions).assertEqual('{"hour":"2-digit"}');
      console.info('[TextClockDateTimeOptionsTest_002] END');
      done();
    });
  })
}
