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
import { Driver } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function TimePickerDialogEnableHapticFeedbackTest() {
  describe('TimePickerDialogEnableHapticFeedback', () => {
    beforeEach(async (done: Function) => {
      console.info('TimePickerDialogEnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/timePickerDialogEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TimePickerDialogEnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('timePickerDialogEnableHpaticFeedback' == pages.name)) {
          console.info('get TimePickerDialogEnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push MTimePickerDialogEnableHapticFeedback page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TimePickerDialogEnableHapticFeedback page error:' + err);
      }
      console.info('TimePickerDialogEnableHapticFeedback beforeEach end');
      done();
    });

    /**
     * @tc.number: timepickerDialog_enableHapticFeedback_001
     * @tc.name  : timepickerDialog_enableHapticFeedback_001
     * @tc.desc  : Test the feedback of the enableHaptic interface of the timepickerDialog component when a custom normal value is passed in
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
    */

     it('TimePickerDialog_EnableHapticFeedback_001', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_001';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TimePickerDialog1', 10, "")
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker1 = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_001] obj1 is: " + timePicker1);
      console.info("[TimePickerDialog_EnableHapticFeedback_001] obj1 is: " + JSON.stringify(JSON.parse(timePicker1).$attrs.enableHapticFeedback));
      sendEventByKey('TimePickerDialog1', 10, "")
      expect(JSON.parse(timePicker1).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.number: timepickerDialog_enableHapticFeedback_002
     * @tc.name  : timepickerDialog_enableHapticFeedback_002
     * @tc.desc  : Test the feedback of the enableHaptic interface of the timepickerDialog component when a custom normal value is passed in
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
    */

    it('TimePickerDialog_EnableHapticFeedback_002', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_002';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TimePickerDialog2', 10, "")
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker2 = JSON.stringify(obj2.$children[1].$children[0].$children[0].$children[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_002] obj2 is: " + timePicker2);
      console.info("[TimePickerDialog_EnableHapticFeedback_002] obj2 is: " + JSON.stringify(JSON.parse(timePicker2).$attrs.enableHapticFeedback));
      sendEventByKey('TimePickerDialog2', 10, "")
      expect(JSON.parse(timePicker2).$attrs.enableHapticFeedback).assertEqual(false);
      console.info('[' + tagName + '] END ==========================='); 
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.number: timepickerDialog_enableHapticFeedback_003
     * @tc.name  : timepickerDialog_enableHapticFeedback_003
     * @tc.desc  : Test the feedback of the enableHaptic interface of the timepickerDialog component when a custom normal value is passed in
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
    */

    it('TimePickerDialog_EnableHapticFeedback_003', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_003';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TimePickerDialog3', 10, "")
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker3 = JSON.stringify(obj3.$children[1].$children[0].$children[0].$children[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_003] obj3 is: " + timePicker3);
      console.info("[TimePickerDialog_EnableHapticFeedback_003] obj3 is: " + JSON.stringify(JSON.parse(timePicker3).$attrs.enableHapticFeedback));
      sendEventByKey('TimePickerDialog3', 10, "")
      expect(JSON.parse(timePicker3).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.number: timepickerDialog_enableHapticFeedback_004
     * @tc.name  : timepickerDialog_enableHapticFeedback_004
     * @tc.desc  : Test the feedback of the enableHaptic interface of the timepickerDialog component when a custom normal value is passed in
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
    */

    it('TimePickerDialog_EnableHapticFeedback_004', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableHapticFeedback_004';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TimePickerDialog4', 10, "")
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker4 = JSON.stringify(obj4.$children[1].$children[0].$children[0].$children[1])
      console.info("[TimePickerDialog_EnableHapticFeedback_004] obj4 is: " + timePicker4);
      console.info("[TimePickerDialog_EnableHapticFeedback_004] obj4 is: " + JSON.stringify(JSON.parse(timePicker4).$attrs.enableHapticFeedback));
      sendEventByKey('TimePickerDialog4', 10, "")
      expect(JSON.parse(timePicker4).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      await CommonFunc.sleep(2000);
      done();
    });
   
    })
}
