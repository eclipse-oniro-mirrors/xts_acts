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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BY, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function TimePickerStartAndEnd() {
  describe('TimePickerStartAndEnd', () => {
    beforeEach(async (done: Function) => {
      console.info('TimePickerAddApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timePickerStartAndEnd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TimePickerAddApi state pages:' + JSON.stringify(pages));
        if (!('timePickerStartAndEnd' == pages.name)) {
          console.info('get TimePickerAddApi pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TimePickerAddApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TimePickerAddApi page error:' + err);
      }
      console.info('TimePickerAddApi beforeEach end');
      done();
    });

    /**
     * @tc.name   TimePickerStartAndEnd_001
     * @tc.number TimePickerStartAndEnd_001
     * @tc.desc   To test the timepicker interface start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerStartAndEnd_001', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('TimePicker');
      console.log('TimePickerStartAndEnd_001')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('TimePickerStartAndEnd_001 ' + obj.$attrs.start)
      expect(obj.$attrs.start).assertEqual('8:0');
      done();
    });

    /**
     * @tc.name   TimePickerStartAndEnd_002
     * @tc.number TimePickerStartAndEnd_002
     * @tc.desc   To test the timepicker interface start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerStartAndEnd_002', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('TimePicker');
      console.log('TimePickerStartAndEnd_002')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('TimePickerStartAndEnd_002 ' + obj.$attrs.end)
      expect(obj.$attrs.end).assertEqual('10:0');
      done();
    });

    /**
     * @tc.name   TimePickerStartAndEnd_003
     * @tc.number TimePickerStartAndEnd_003
     * @tc.desc   To test the timepicker interface start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerStartAndEnd_003', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('TimePicker2');
      console.log('TimePickerStartAndEnd_003')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('TimePickerStartAndEnd_003 ' + obj.$attrs.start)
      expect(obj.$attrs.start).assertEqual('0:0');
      done();
    });

    /**
     * @tc.name   TimePickerStartAndEnd_004
     * @tc.number TimePickerStartAndEnd_004
     * @tc.desc   To test the timepicker interface start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerStartAndEnd_004', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('TimePicker2');
      console.log('TimePickerStartAndEnd_004')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('TimePickerStartAndEnd_004 ' + obj.$attrs.end)
      expect(obj.$attrs.end).assertEqual('23:59');
      done();
    });

    /**
     * @tc.name   TimePickerStartAndEnd_005
     * @tc.number TimePickerStartAndEnd_005
     * @tc.desc   To test the timepicker interface start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerStartAndEnd_005', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('TimePicker3');
      console.log('TimePickerStartAndEnd_005')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('TimePickerStartAndEnd_005 ' + obj.$attrs.start)
      expect(obj.$attrs.start).assertEqual('0:0');
      done();
    });

    /**
     * @tc.name   TimePickerStartAndEnd_006
     * @tc.number TimePickerStartAndEnd_006
     * @tc.desc   To test the timepicker interface start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerStartAndEnd_006', Level.LEVEL1, async (done: Function) => {
      let strJson = getInspectorByKey('TimePicker3');
      console.log('TimePickerStartAndEnd_006')
      await Utils.sleep(1000)
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('TimePickerStartAndEnd_006 ' + obj.$attrs.end)
      expect(obj.$attrs.end).assertEqual('23:59');
      done();
    });
  })
}
