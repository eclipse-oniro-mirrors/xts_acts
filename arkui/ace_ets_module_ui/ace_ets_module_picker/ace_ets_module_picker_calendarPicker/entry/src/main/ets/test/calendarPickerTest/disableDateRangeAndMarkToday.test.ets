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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function disableDateRangeAndMarkTodayTest() {
  describe('DisableDateRangeAndMarkToday', () => {
    beforeEach(async (done: Function) => {
      console.info('DisableDateRangeAndMarkToday beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/disableDateRangeAndMarkToday',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DisableDateRangeAndMarkToday state pages:' + JSON.stringify(pages));
        if (!('disableDateRangeAndMarkToday' == pages.name)) {
          console.info('get DisableDateRangeAndMarkToday pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push DisableDateRangeAndMarkToday page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DisableDateRangeAndMarkToday page error:' + err);
      }
      console.info('DisableDateRangeAndMarkToday beforeEach end');
      done();
    });


    /**
     * @tc.name   DisableDateRangeAndMarkToday_001
     * @tc.number DisableDateRangeAndMarkToday_001
     * @tc.desc   Test the width of the disabledDateRange 2025-01-09-2025-01-10 and markToday true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DisableDateRangeAndMarkToday_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[DisableDateRangeAndMarkToday_001] START');
      await Utils.sleep(2000);
      let driver: Driver = Driver.create();
      let rangebtn: Component = await driver.findComponent(ON.id('normal-2025-01-09-2025-01-10'));
      console.info('[DisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(rangebtn));
      await rangebtn.click();
      await Utils.sleep(2000);
      let markTodybtn: Component = await driver.findComponent(ON.id('Today-true'));
      console.info('[DisableDateRangeAndMarkToday_001] attrs1:' + JSON.stringify(markTodybtn));
      await markTodybtn.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('calendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[DisableDateRangeAndMarkToday_001] attrs:' + JSON.stringify(obj.$attrs.disabledDateRange));
      expect(obj.$attrs.disabledDateRange).assertEqual('2025年1月9日星期四,2025年1月10日星期五');
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_001] markTodayAttrs2:' + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.markToday).assertEqual('true');
      console.info('[DisableDateRangeAndMarkToday_001] END');
      done();
    });

    /**
     * @tc.name   DisableDateRangeAndMarkToday_002
     * @tc.number DisableDateRangeAndMarkToday_002
     * @tc.desc   Test the width of the disabledDateRange 2025-01-09 and markToday false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DisableDateRangeAndMarkToday_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[DisableDateRangeAndMarkToday_002] START');
      await Utils.sleep(2000);
      let driver: Driver = Driver.create();
      let rangebtn: Component = await driver.findComponent(ON.id('outlier-start'));
      console.info('[DisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(rangebtn));
      await rangebtn.click();
      await Utils.sleep(2000);
      let markTodybtn: Component = await driver.findComponent(ON.id('Today-false'));
      console.info('[DisableDateRangeAndMarkToday_002] attrs1:' + JSON.stringify(markTodybtn));
      await markTodybtn.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('calendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[DisableDateRangeAndMarkToday_002] attrs:' + JSON.stringify(obj.$attrs.disabledDateRange));
      expect(obj.$attrs.disabledDateRange).assertNull;
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_002] markTodayAttrs2:' + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.markToday).assertEqual('false');
      console.info('[DisableDateRangeAndMarkToday_002] END');
      done();
    });

    /**
     * @tc.name   DisableDateRangeAndMarkToday_003
     * @tc.number DisableDateRangeAndMarkToday_003
     * @tc.desc   Test the width of the disabledDateRange undefined and markToday null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DisableDateRangeAndMarkToday_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[DisableDateRangeAndMarkToday_003] START');
      await Utils.sleep(2000);
      let driver: Driver = Driver.create();
      let rangebtn: Component = await driver.findComponent(ON.id('outlier-undefined'));
      console.info('[DisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(rangebtn));
      await rangebtn.click();
      await Utils.sleep(2000);
      let markTodybtn: Component = await driver.findComponent(ON.id('Today-null'));
      console.info('[DisableDateRangeAndMarkToday_003] attrs1:' + JSON.stringify(markTodybtn));
      await markTodybtn.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('calendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[DisableDateRangeAndMarkToday_003] attrs:' + JSON.stringify(obj.$attrs.disabledDateRange));
      expect(obj.$attrs.disabledDateRange).assertNull;
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_003] markTodayAttrs2:' + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.markToday).assertEqual('false');
      console.info('[DisableDateRangeAndMarkToday_003] END');
      done();
    });

    /**
     * @tc.name   DisableDateRangeAndMarkToday_004
     * @tc.number DisableDateRangeAndMarkToday_004
     * @tc.desc   Test the width of the disabledDateRange null and markToday undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('DisableDateRangeAndMarkToday_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[DisableDateRangeAndMarkToday_004] START');
      await Utils.sleep(2000);
      let driver: Driver = Driver.create();
      let rangebtn: Component = await driver.findComponent(ON.id('outlier-null'));
      console.info('[DisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(rangebtn));
      await rangebtn.click();
      await Utils.sleep(2000);
      let markTodybtn: Component = await driver.findComponent(ON.id('Today-undefined'));
      console.info('[DisableDateRangeAndMarkToday_004] attrs1:' + JSON.stringify(markTodybtn));
      await markTodybtn.click();
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('calendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[DisableDateRangeAndMarkToday_004] attrs:' + JSON.stringify(obj.$attrs.disabledDateRange));
      expect(obj.$attrs.disabledDateRange).assertNull;
      await Utils.sleep(2000);
      console.info('[DisableDateRangeAndMarkToday_004] markTodayAttrs2:' + JSON.stringify(obj.$attrs.markToday));
      expect(obj.$attrs.markToday).assertEqual('false');
      console.info('[DisableDateRangeAndMarkToday_004] END');
      done();
    });
  })
}
