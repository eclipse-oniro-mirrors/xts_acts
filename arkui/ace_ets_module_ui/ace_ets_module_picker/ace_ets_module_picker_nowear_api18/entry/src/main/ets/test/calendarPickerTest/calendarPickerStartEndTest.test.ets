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
import { BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function calendarPickerStartEndTest() {
  describe('CalendarPickerStartEndTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerStartEndTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/calendarPickerStartEndTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerTestAddApi state pages:' + JSON.stringify(pages));
        if (!('calendarPickerStarCalendarPickerStartEndTesttEndTest' == pages.name)) {
          console.info('get CalendarPickerTestAddApi pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push CalendarPickerTestAddApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerTestAddApi page error:' + err);
      }
      console.info('CalendarPickerTestAddApi beforeEach end');
      done();
    });
    
    /* *
    * @tc.number: CalendarPickerStartEndTest_001
    * @tc.name  : CalendarPickerStartEndTest_001
    * @tc.desc  : To test the start < end 
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('CalendarPickerStartEndTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerStartEndTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CalendarPicker01');
      let obj: ESObject = JSON.parse(strJson);
      console.info("CalendarPickerStartEndTest_001 " + obj.$attrs.start)
      console.info("CalendarPickerStartEndTest_001 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual('2024年3月5日星期二')
      expect(obj.$attrs.end).assertEqual('2024年4月5日星期五')
      console.info('CalendarPickerStartEndTest_001 END');
      done();
    });

    /* *
    * @tc.number: CalendarPickerStartEndTest_002
    * @tc.name  : CalendarPickerStartEndTest_002
    * @tc.desc  : To test the start > end
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('CalendarPickerStartEndTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerStartEndTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CalendarPicker02');
      let obj: ESObject = JSON.parse(strJson);
      console.info("CalendarPickerStartEndTest_002 " + obj.$attrs.start)
      console.info("CalendarPickerStartEndTest_002 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual(undefined)
      expect(obj.$attrs.end).assertEqual(undefined)
      console.info('CalendarPickerStartEndTest_002 END');
      done();
    });

    /* *
    * @tc.number: CalendarPickerStartEndTest_003
    * @tc.name  : CalendarPickerStartEndTest_003
    * @tc.desc  : To test the start and end is null
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('CalendarPickerStartEndTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerStartEndTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CalendarPicker03');
      let obj: ESObject = JSON.parse(strJson);
      console.info("CalendarPickerStartEndTest_003 " + obj.$attrs.start)
      console.info("CalendarPickerStartEndTest_003 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual(undefined)
      expect(obj.$attrs.end).assertEqual(undefined)
      console.info('CalendarPickerStartEndTest_003 END');
      done();
    });

    /* *
    * @tc.number: CalendarPickerStartEndTest_004
    * @tc.name  : CalendarPickerStartEndTest_004
    * @tc.desc  : To test the start and end is undefined
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('CalendarPickerStartEndTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerStartEndTest_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CalendarPicker04');
      let obj: ESObject = JSON.parse(strJson);
      console.info("CalendarPickerStartEndTest_004 " + obj.$attrs.start)
      console.info("CalendarPickerStartEndTest_004 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual(undefined)
      expect(obj.$attrs.end).assertEqual(undefined)
      console.info('CalendarPickerStartEndTest_004 END');
      done();
    });

    /* *
    * @tc.number: CalendarPickerStartEndTest_005
    * @tc.name  : CalendarPickerStartEndTest_005
    * @tc.desc  : To test the start = end
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('CalendarPickerStartEndTest_005', Level.LEVEL1, async (done: Function) => {
      console.info('CalendarPickerStartEndTest_005 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('CalendarPicker05');
      let obj: ESObject = JSON.parse(strJson);
      console.info("CalendarPickerStartEndTest_005 " + obj.$attrs.start)
      console.info("CalendarPickerStartEndTest_005 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual('2024年3月5日星期二')
      expect(obj.$attrs.end).assertEqual('2024年3月5日星期二')
      console.info('CalendarPickerStartEndTest_005 END');
      done();
    });
  })
}
