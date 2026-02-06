/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function TextPickerDialogEnableHapticFeedbackTest() {
  describe('TextPickerDialogEnableHapticFeedback', () => {
    beforeEach(async (done: Function) => {
      console.info('TextPickerDialogEnableHapticFeedback beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialogEnableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerDialogEnableHapticFeedback state pages:' + JSON.stringify(pages));
        if (!('textPickerDialogEnableHpaticFeedback' == pages.name)) {
          console.info('get TextPickerDialogEnableHapticFeedback pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push MTextPickerDialogEnableHapticFeedback page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerDialogEnableHapticFeedback page error:' + err);
      }
      console.info('TextPickerDialogEnableHapticFeedback beforeEach end');
      done();
    });

    /**
     * @tc.name   TextPickerDialog_EnableHapticFeedback_001
     * @tc.number TextPickerDialog_EnableHapticFeedback_001
     * @tc.desc   To test the enableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDialog_EnableHapticFeedback_001', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TextPickerDialog_EnableHapticFeedback_001';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TextPickerDialog1', 10, '')
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let textPicker1 = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialog_EnableHapticFeedback_001] obj1 is: ' + textPicker1);
      console.info('[TextPickerDialog_EnableHapticFeedback_001] obj1 is: ' + JSON.stringify(JSON.parse(textPicker1)
        .$attrs
        .enableHapticFeedback));
      expect(JSON.parse(textPicker1).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      sendEventByKey('TextPickerDialog1', 10, '')
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.name   TextPickerDialog_EnableHapticFeedback_002
     * @tc.number TextPickerDialog_EnableHapticFeedback_002
     * @tc.desc   To test the enableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDialog_EnableHapticFeedback_002', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TextPickerDialog_EnableHapticFeedback_002';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TextPickerDialog2', 10, '')
      await CommonFunc.sleep(1000);
      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let textPicker2 = JSON.stringify(obj2.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialog_EnableHapticFeedback_002] obj2 is: ' + textPicker2);
      console.info('[TextPickerDialog_EnableHapticFeedback_002] obj2 is: ' + JSON.stringify(JSON.parse(textPicker2)
        .$attrs
        .enableHapticFeedback));
      expect(JSON.parse(textPicker2).$attrs.enableHapticFeedback).assertEqual(false);
      console.info('[' + tagName + '] END ===========================');
      sendEventByKey('TextPickerDialog2', 10, '')
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.name   TextPickerDialog_EnableHapticFeedback_003
     * @tc.number TextPickerDialog_EnableHapticFeedback_003
     * @tc.desc   To test the enableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDialog_EnableHapticFeedback_003', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TextPickerDialog_EnableHapticFeedback_003';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TextPickerDialog3', 10, '')
      await CommonFunc.sleep(1000);
      let obj3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let textPicker3 = JSON.stringify(obj3.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialog_EnableHapticFeedback_003] obj3 is: ' + textPicker3);
      console.info('[TextPickerDialog_EnableHapticFeedback_003] obj3 is: ' + JSON.stringify(JSON.parse(textPicker3)
        .$attrs
        .enableHapticFeedback));
      expect(JSON.parse(textPicker3).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      sendEventByKey('TextPickerDialog3', 10, '')
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.name   TextPickerDialog_EnableHapticFeedback_004
     * @tc.number TextPickerDialog_EnableHapticFeedback_004
     * @tc.desc   To test the enableHapticFeedback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerDialog_EnableHapticFeedback_004', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TextPickerDialog_EnableHapticFeedback_004';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      sendEventByKey('TextPickerDialog4', 10, '')
      await CommonFunc.sleep(1000);
      let obj4: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let textPicker4 = JSON.stringify(obj4.$children[1].$children[0].$children[0].$children[0])
      console.info('[TextPickerDialog_EnableHapticFeedback_004] obj4 is: ' + textPicker4);
      console.info('[TextPickerDialog_EnableHapticFeedback_004] obj4 is: ' + JSON.stringify(JSON.parse(textPicker4)
        .$attrs
        .enableHapticFeedback));
      expect(JSON.parse(textPicker4).$attrs.enableHapticFeedback).assertEqual(true);
      console.info('[' + tagName + '] END ===========================');
      sendEventByKey('TextPickerDialog4', 10, '')
      await CommonFunc.sleep(2000);
      done();
    });
  })
}