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
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function calendarPickerDialogStartEndTest() {
  describe('CalendarPickerDialogStartEnd', () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerDialogStartEnd beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogStartEndTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerDialogStartEnd state pages:' + JSON.stringify(pages));
        if (!('CalendarPickerDialogStartEnd' == pages.name)) {
          console.info('get CalendarPickerDialogStartEnd pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push CalendarPickerDialogStartEnd page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerDialogStartEnd page error:' + err);
      }
      console.info('CalendarPickerDialogStartEnd beforeEach end');
      done();
    });

    /**
     * @tc.number: CalendarPickerDialog_StartEnd_001
     * @tc.name  : CalendarPickerDialog_StartEnd_001
     * @tc.desc  : Test the feedback of the enableHaptic interface of the CalendarPickerDialog component when a custom normal value is passed in
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
    */

    it('CalendarPickerDialog_StartEnd_001', Level.LEVEL1, async (done: Function) => {
      let tagName = 'CalendarPickerDialog_StartEnd_001';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog01'));
      await CommonFunc.sleep(300);
      await button?.click();
      await CommonFunc.sleep(300);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let obj: ESObject = obj1.$children[1].$children[0].$children[0]
      console.info("CalendarPickerStartEndTest_001 " + obj.$attrs.start)
      console.info("CalendarPickerStartEndTest_001 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual('2024年3月5日星期二')
      expect(obj.$attrs.end).assertEqual('2024年4月5日星期五')
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      console.info('CalendarPickerStartEndTest_001 END');
      done();
    });

    /**
     * @tc.number: CalendarPickerDialog_StartEnd_002
     * @tc.name  : CalendarPickerDialog_StartEnd_002
     * @tc.desc  : To test the start > end
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
    */
    it('CalendarPickerDialog_StartEnd_002', Level.LEVEL1, async (done: Function) => {
      let tagName = 'CalendarPickerDialog_StartEnd_002';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog02'));
      await CommonFunc.sleep(300);
      await button?.click();
      await CommonFunc.sleep(300);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let obj: ESObject = obj1.$children[1].$children[0].$children[0]
      console.info("CalendarPickerDialog_StartEnd_002 " + obj.$attrs.start)
      console.info("CalendarPickerDialog_StartEnd_002 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual(undefined)
      expect(obj.$attrs.end).assertEqual(undefined)
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      console.info('CalendarPickerDialog_StartEnd_002 END');
      done();
    });

    /**
     * @tc.number: CalendarPickerDialog_StartEnd_003
     * @tc.name  : CalendarPickerDialog_StartEnd_003
     * @tc.desc  : To test the start and end is null
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
    */
    it('CalendarPickerDialog_StartEnd_003', Level.LEVEL1, async (done: Function) => {
      let tagName = 'CalendarPickerDialog_StartEnd_003';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog03'));
      await CommonFunc.sleep(300);
      await button?.click();
      await CommonFunc.sleep(300);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let obj: ESObject = obj1.$children[1].$children[0].$children[0]
      console.info("CalendarPickerDialog_StartEnd_003 " + obj.$attrs.start)
      console.info("CalendarPickerDialog_StartEnd_003 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual(undefined)
      expect(obj.$attrs.end).assertEqual(undefined)
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      await CommonFunc.sleep(300);
      console.info('CalendarPickerDialog_StartEnd_003 END');
      done();
    });

    /**
     * @tc.number: CalendarPickerDialog_StartEnd_004
     * @tc.name  : CalendarPickerDialog_StartEnd_004
     * @tc.desc  : To test the start and end is undefined
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
    */
    it('CalendarPickerDialog_StartEnd_004', Level.LEVEL1, async (done: Function) => {
      let tagName = 'CalendarPickerDialog_StartEnd_004';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog04'));
      await CommonFunc.sleep(300);
      await button?.click();
      await CommonFunc.sleep(300);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let obj: ESObject = obj1.$children[1].$children[0].$children[0]
      console.info("CalendarPickerDialog_StartEnd_004 " + obj.$attrs.start)
      console.info("CalendarPickerDialog_StartEnd_004 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual(undefined)
      expect(obj.$attrs.end).assertEqual(undefined)
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      await CommonFunc.sleep(300);
      console.info('CalendarPickerDialog_StartEnd_004 END');
      done();
    });

    /**
     * @tc.number: CalendarPickerDialog_StartEnd_005
     * @tc.name  : CalendarPickerDialog_StartEnd_005
     * @tc.desc  : To test the start = end
     * @tc.level : Level 0
     * @tc.type
     * @tc.size
    */
    it('CalendarPickerDialog_StartEnd_005', Level.LEVEL1, async (done: Function) => {
      let tagName = 'CalendarPickerDialog_StartEnd_005';
      console.info('[' + tagName + '] START============================');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('CalendarPickerDialog05'));
      await CommonFunc.sleep(300);
      await button?.click();
      await CommonFunc.sleep(300);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let obj: ESObject = obj1.$children[1].$children[0].$children[0]
      console.info("CalendarPickerDialog_StartEnd_005 " + obj.$attrs.start)
      console.info("CalendarPickerDialog_StartEnd_005 " + obj.$attrs.end)
      expect(obj.$attrs.start).assertEqual('2024年3月5日星期二')
      expect(obj.$attrs.end).assertEqual('2024年3月5日星期二')
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await cancelButton.click();
      await CommonFunc.sleep(300);
      console.info('CalendarPickerDialog_StartEnd_005 END');
      done();
    });
  })
}
