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
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function dialogDialogDisableDateRangeAndMarkTodayTest() {
  describe('DialogDisableDateRangeAndMarkToday', () => {
    beforeAll(async () => {
      console.info('DialogDisableDateRangeAndMarkToday beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/dialogDisableDateRangeAndMarkToday',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('dialogDisableDateRangeAndMarkToday' == pages.name)) {
          let result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push DialogDisableDateRangeAndMarkToday page error: ' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(2000);
      console.info('DialogDisableDateRangeAndMarkToday after each called');
    });

    /**
     * @tc.name   DialogDisableDateRangeAndMarkToday_001
     * @tc.number DialogDisableDateRangeAndMarkToday_001
     * @tc.desc   Test the width of the disabledDateRange 2025-01-09-2025-01-10 and markToday true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[DialogDialogDisableDateRangeAndMarkToday_001] START');
        await Utils.sleep(2000);
        let driver = Driver.create();
        let rangebtn = await driver.findComponent(ON.id('normal-2025-01-09-2025-01-10'));
        console.info('[DialogDialogDisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(rangebtn));
        await rangebtn.click();
        await Utils.sleep(2000);
        let markTodybtn = await driver.findComponent(ON.id('Today-true'));
        console.info('[DialogDialogDisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(markTodybtn));
        await markTodybtn.click();
        await Utils.sleep(2000);

        let dialog = await driver.findComponent(ON.id('calendarPickerDialog'));
        await dialog.click();

        await Utils.sleep(1000);
        let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        await Utils.sleep(2000);
        let calendarPickerDialog = JSON.stringify(obj.$children[1].$children[0].$children[0])
        console.info('[DialogDialogDisableDateRangeAndMarkToday_001] disabledDateRange:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange));
        console.info('[DialogDialogDisableDateRangeAndMarkToday_001] selectedDate:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.markToday));
        expect(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange)
          .assertEqual('2025年1月9日星期四,2025年1月10日星期五');
        await Utils.sleep(2000);
        expect(JSON.parse(calendarPickerDialog).$attrs.markToday).assertEqual('true');

        let btn2 = await driver.findComponent(ON.text('确定'));
        await btn2?.click();

        await Utils.sleep(2000);
        console.info('[DialogDisableDateRangeAndMarkToday_001] END');
        done();
      });

    /**
     * @tc.name   DialogDisableDateRangeAndMarkToday_002
     * @tc.number DialogDisableDateRangeAndMarkToday_002
     * @tc.desc   Test the width of the disabledDateRange 2025-01-09 and markToday false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[DialogDisableDateRangeAndMarkToday_002] START');
        await Utils.sleep(2000);
        let driver = Driver.create();
        let rangebtn = await driver.findComponent(ON.id('outlier-start'));
        console.info('[DialogDisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(rangebtn));
        await rangebtn.click();
        await Utils.sleep(2000);
        let markTodybtn = await driver.findComponent(ON.id('Today-false'));
        console.info('[DialogDisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(markTodybtn));
        await markTodybtn.click();
        await Utils.sleep(2000);

        let dialog = await driver.findComponent(ON.id('calendarPickerDialog'));
        await dialog.click();

        await Utils.sleep(1000);
        let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let calendarPickerDialog = JSON.stringify(obj.$children[1].$children[0].$children[0])
        console.info('[DialogDisableDateRangeAndMarkToday_002] disabledDateRange:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange));
        console.info('[DialogDisableDateRangeAndMarkToday_002] selectedDate:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.markToday));
        expect(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange).assertNull;
        await Utils.sleep(2000);
        expect(JSON.parse(calendarPickerDialog).$attrs.markToday).assertEqual('false');

        let btn2 = await driver.findComponent(ON.text('确定'));
        await btn2?.click();

        await Utils.sleep(2000);
        console.info('[DialogDisableDateRangeAndMarkToday_002] END');
        done();
      });

    /**
     * @tc.name   DialogDisableDateRangeAndMarkToday_003
     * @tc.number DialogDisableDateRangeAndMarkToday_003
     * @tc.desc   Test the width of the disabledDateRange undefined and markToday null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[DialogDisableDateRangeAndMarkToday_003] START');
        await Utils.sleep(2000);
        let driver = Driver.create();
        let rangebtn = await driver.findComponent(ON.id('outlier-undefined'));
        console.info('[DialogDisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(rangebtn));
        await rangebtn.click();
        await Utils.sleep(2000);
        let markTodybtn = await driver.findComponent(ON.id('Today-null'));
        console.info('[DialogDisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(markTodybtn));
        await markTodybtn.click();
        await Utils.sleep(2000);

        let dialog = await driver.findComponent(ON.id('calendarPickerDialog'));
        await dialog.click();

        await Utils.sleep(1000);
        let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let calendarPickerDialog = JSON.stringify(obj.$children[1].$children[0].$children[0])
        console.info('[DialogDisableDateRangeAndMarkToday_003] disabledDateRange:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange));
        console.info('[DialogDisableDateRangeAndMarkToday_003] selectedDate:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.markToday));
        expect(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange).assertNull;
        await Utils.sleep(2000);
        expect(JSON.parse(calendarPickerDialog).$attrs.markToday).assertEqual('false');

        let btn2 = await driver.findComponent(ON.text('确定'));
        await btn2?.click();

        await Utils.sleep(2000);
        console.info('[DialogDisableDateRangeAndMarkToday_003] END');
        done();
      });

    /**
     * @tc.name   DialogDisableDateRangeAndMarkToday_004
     * @tc.number DialogDisableDateRangeAndMarkToday_004
     * @tc.desc   Test the width of the disabledDateRange null and markToday undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DialogDisableDateRangeAndMarkToday_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('[DialogDisableDateRangeAndMarkToday_004] START');
        await Utils.sleep(2000);
        let driver = Driver.create();
        let rangebtn = await driver.findComponent(ON.id('outlier-null'));
        console.info('[DialogDisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(rangebtn));
        await rangebtn.click();
        await Utils.sleep(2000);
        let markTodybtn = await driver.findComponent(ON.id('Today-undefined'));
        console.info('[DialogDisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(markTodybtn));
        await markTodybtn.click();
        await Utils.sleep(2000);

        let dialog = await driver.findComponent(ON.id('calendarPickerDialog'));
        await dialog.click();

        await Utils.sleep(1000);
        let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let calendarPickerDialog = JSON.stringify(obj.$children[1].$children[0].$children[0])
        console.info('[DialogDisableDateRangeAndMarkToday_004] disabledDateRange:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange));
        console.info('[DialogDisableDateRangeAndMarkToday_004] selectedDate:' +
        JSON.stringify(JSON.parse(calendarPickerDialog).$attrs.markToday));
        expect(JSON.parse(calendarPickerDialog).$attrs.disabledDateRange).assertNull;
        await Utils.sleep(2000);
        expect(JSON.parse(calendarPickerDialog).$attrs.markToday).assertEqual('false');

        let btn2 = await driver.findComponent(ON.text('确定'));
        await btn2?.click();

        await Utils.sleep(2000);
        console.info('[DialogDisableDateRangeAndMarkToday_004] END');
        done();
      });
  })
}
