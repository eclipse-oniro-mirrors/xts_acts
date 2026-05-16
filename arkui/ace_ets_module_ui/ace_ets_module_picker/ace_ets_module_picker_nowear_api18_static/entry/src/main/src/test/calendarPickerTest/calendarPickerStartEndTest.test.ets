'use static';
/*
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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function calendarPickerStartEndTest() {
  describe('CalendarPickerStartEndTest', () => {
    beforeAll(() => {
      console.info("CalendarPickerStartEndTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('CalendarPickerStartEndTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/calendarPickerStartEndTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CalendarPickerTestAddApi state pages:' + JSON.stringify(pages));
        if (!('calendarPickerStarCalendarPickerStartEndTesttEndTest' == pages.name)) {
          console.info('get CalendarPickerTestAddApi pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push CalendarPickerTestAddApi page error:' + err);
      }
      console.info('CalendarPickerTestAddApi beforeEach end');
    });
    
    
    
/**
     * @tc.number   CalendarPickerStartEndTest_static_001
     * @tc.name     CalendarPickerStartEndTest_static_001
     * @tc.desc     CalendarPickerStartEndTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerStartEndTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerStartEndTest_static_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('CalendarPicker01');
      let obj = JSON.parseJsonElement(strJson);
      console.info("CalendarPickerStartEndTest_static_001 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerStartEndTest_static_001 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('2024年3月5日星期二')
      expect(obj.getElement('$attrs').getString('end')).assertEqual('2024年4月5日星期五')
      console.info('CalendarPickerStartEndTest_static_001 END');
      done();
    });

    
    
/**
     * @tc.number   CalendarPickerStartEndTest_static_002
     * @tc.name     CalendarPickerStartEndTest_static_002
     * @tc.desc     CalendarPickerStartEndTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerStartEndTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerStartEndTest_static_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('CalendarPicker02');
      let obj = JSON.parseJsonElement(strJson);
      console.info("CalendarPickerStartEndTest_static_002 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerStartEndTest_static_002 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual(undefined)
      expect(obj.getElement('$attrs').getString('end')).assertEqual(undefined)
      console.info('CalendarPickerStartEndTest_static_002 END');
      done();
    });
    
    
/**
     * @tc.number   CalendarPickerStartEndTest_static_004
     * @tc.name     CalendarPickerStartEndTest_static_004
     * @tc.desc     CalendarPickerStartEndTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerStartEndTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerStartEndTest_static_004 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('CalendarPicker04');
      let obj = JSON.parseJsonElement(strJson);
      console.info("CalendarPickerStartEndTest_static_004 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerStartEndTest_static_004 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual(undefined)
      expect(obj.getElement('$attrs').getString('end')).assertEqual(undefined)
      console.info('CalendarPickerStartEndTest_static_004 END');
      done();
    });

    
    
/**
     * @tc.number   CalendarPickerStartEndTest_static_005
     * @tc.name     CalendarPickerStartEndTest_static_005
     * @tc.desc     CalendarPickerStartEndTest_static_005
     * @tc.level    Level.LEVEL1
     */
it('CalendarPickerStartEndTest_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerStartEndTest_static_005 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('CalendarPicker05');
      let obj = JSON.parseJsonElement(strJson);
      console.info("CalendarPickerStartEndTest_static_005 " + obj.getElement('$attrs').getString('start'))
      console.info("CalendarPickerStartEndTest_static_005 " + obj.getElement('$attrs').getString('end'))
      expect(obj.getElement('$attrs').getString('start')).assertEqual('2024年3月5日星期二')
      expect(obj.getElement('$attrs').getString('end')).assertEqual('2024年3月5日星期二')
      console.info('CalendarPickerStartEndTest_static_005 END');
      done();
    });
  })
}
