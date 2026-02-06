/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function EnableHapticFeedback() {
  describe('EnableHapticFeedback', () => {
    beforeEach(async (done: Function) => {
      console.info('EnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/datePickerDialogEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('datePickerDialogEnableHapticFeedback' == pages.name)) {
          console.info('get EnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push EnableHapticFeedback page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableHapticFeedback page error:' + err);
      }
      console.info('EnableHapticFeedback beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableHapticFeedback after each called');
    });
    /**
     * @tc.number    DatePickerDialog_EnableHapticFeedback_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('DatePickerDialog_EnableHapticFeedback_001', Level.LEVEL1, async (done: Function) => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_001';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('DatePickerDialog1', 10, '')
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1].$children[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_001] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_001] obj1 is: ' + JSON.stringify(JSON.parse(datePicker1).$attrs.enableHapticFeedback));
      sendEventByKey('DatePickerDialog1', 10, '')
      expect(JSON.parse(datePicker1).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.number    DatePickerDialog_EnableHapticFeedback_002
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('DatePickerDialog_EnableHapticFeedback_002', Level.LEVEL1, async (done: Function) => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_002';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('DatePickerDialog2', 10, '')
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1].$children[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_002] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_002] obj1 is: ' + JSON.stringify(JSON.parse(datePicker1).$attrs.enableHapticFeedback));
      sendEventByKey('DatePickerDialog2', 10, '')
      expect(JSON.parse(datePicker1).$attrs.enableHapticFeedback).assertEqual(false);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.number    DatePickerDialog_EnableHapticFeedback_003
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('DatePickerDialog_EnableHapticFeedback_003', Level.LEVEL1, async (done: Function) => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_003';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('DatePickerDialog3', 10, '')
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1].$children[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_003] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_003] obj1 is: ' + JSON.stringify(JSON.parse(datePicker1).$attrs.enableHapticFeedback));
      sendEventByKey('DatePickerDialog3', 10, '')
      expect(JSON.parse(datePicker1).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ==========================='); 
      await CommonFunc.sleep(2000);
      done();
    });
    
    /**
     * @tc.number    DatePickerDialog_EnableHapticFeedback_004
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('DatePickerDialog_EnableHapticFeedback_004', Level.LEVEL1, async (done: Function) => {
      let tagName = 'DatePickerDialog_EnableHapticFeedback_004';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('DatePickerDialog4', 10, '')
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let datePicker1 = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1].$children[0])
      console.info('[DatePickerDialog_EnableHapticFeedback_004] obj1 is: ' + datePicker1);
      console.info('[DatePickerDialog_EnableHapticFeedback_004] obj1 is: ' + JSON.stringify(JSON.parse(datePicker1).$attrs.enableHapticFeedback));
      sendEventByKey('DatePickerDialog4', 10, '')
      expect(JSON.parse(datePicker1).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });
  })
}