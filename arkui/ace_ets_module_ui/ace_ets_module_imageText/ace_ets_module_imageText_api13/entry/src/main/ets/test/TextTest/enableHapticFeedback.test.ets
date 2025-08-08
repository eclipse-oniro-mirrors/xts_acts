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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function EnableHapticFeedbackTest() {
  describe('EnableHapticFeedbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EnableHapticFeedbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/enableHapticFeedback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EnableHapticFeedbackTest state pages: " + JSON.stringify(pages));
        if (!("enableHapticFeedback" == pages.name)) {
          console.info("get EnableHapticFeedbackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push EnableHapticFeedbackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnableHapticFeedbackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0010
     * @tc.name      EnableHapticFeedbackTest_0010
     * @tc.desc      get Text enableHapticFeedback: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0010] START');
      let strJson = getInspectorByKey('Text_enableHapticFeedback_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0010] Text: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0020
     * @tc.name      EnableHapticFeedbackTest_0020
     * @tc.desc      set Text enableHapticFeedback: true
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0020] START');
      let strJson = getInspectorByKey('Text_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0020] Text: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0030
     * @tc.name      EnableHapticFeedbackTest_0030
     * @tc.desc      set Text enableHapticFeedback: false
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0030] click succ');
      let strJson = getInspectorByKey('Text_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0030] Text: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0040
     * @tc.name      EnableHapticFeedbackTest_0040
     * @tc.desc      set Text enableHapticFeedback: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0040] click succ');
      let strJson = getInspectorByKey('Text_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0040] Text: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0050
     * @tc.name      EnableHapticFeedbackTest_0050
     * @tc.desc      get TextInput enableHapticFeedback: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0050] START');
      let strJson = getInspectorByKey('TextInput_enableHapticFeedback_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0050] TextInput: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0060
     * @tc.name      EnableHapticFeedbackTest_0060
     * @tc.desc      set TextInput enableHapticFeedback: true
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0060] START');
      let strJson = getInspectorByKey('TextInput_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0060] TextInput : ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0070
     * @tc.name      EnableHapticFeedbackTest_0030
     * @tc.desc      set TextInput enableHapticFeedback: false
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0070', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0070] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0070] click succ');
      let strJson = getInspectorByKey('TextInput_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0070] TextInput: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_0070] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0080
     * @tc.name      EnableHapticFeedbackTest_0080
     * @tc.desc      set TextInput enableHapticFeedback: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0080', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0080] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0080] click succ');
      let strJson = getInspectorByKey('TextInput_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0080] TextInput: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0080] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0090
     * @tc.name      EnableHapticFeedbackTest_0090
     * @tc.desc      get TextArea enableHapticFeedback: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0090', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0090] START');
      let strJson = getInspectorByKey('TextArea_enableHapticFeedback_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0090] TextArea : ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0090] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0100
     * @tc.name      EnableHapticFeedbackTest_0100
     * @tc.desc      set TextArea enableHapticFeedback: true
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0100] START');
      let strJson = getInspectorByKey('TextArea_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0100] TextArea: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0110
     * @tc.name      EnableHapticFeedbackTest_0110
     * @tc.desc      set TextArea enableHapticFeedback: false
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0110', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0110] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0110] click succ');
      let strJson = getInspectorByKey('TextArea_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0110] TextArea: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_0110] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0120
     * @tc.name      EnableHapticFeedbackTest_0120
     * @tc.desc      set TextArea enableHapticFeedback: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0120', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0120] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0120] click succ');
      let strJson = getInspectorByKey('TextArea_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0120] TextArea: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0120] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0130
     * @tc.name      EnableHapticFeedbackTest_0130
     * @tc.desc      get Search enableHapticFeedback: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0130', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0130] START');
      let strJson = getInspectorByKey('Search_enableHapticFeedback_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0130] Search: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0130] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0140
     * @tc.name      EnableHapticFeedbackTest_0140
     * @tc.desc      set Search enableHapticFeedback: true
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0140', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0140] START');
      let strJson = getInspectorByKey('Search_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0140] Search: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0140] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0150
     * @tc.name      EnableHapticFeedbackTest_0150
     * @tc.desc      set Search enableHapticFeedback: false
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0150', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0150] click succ');
      let strJson = getInspectorByKey('Search_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0150] Search: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_0150] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0160
     * @tc.name      EnableHapticFeedbackTest_0160
     * @tc.desc      set Search enableHapticFeedback: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0160', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0160] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0160] click succ');
      let strJson = getInspectorByKey('Search_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0160] Search: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0160] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0170
     * @tc.name      EnableHapticFeedbackTest_0170
     * @tc.desc      get RichEditor enableHapticFeedback: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0170', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0170] START');
      let strJson = getInspectorByKey('RichEditor_enableHapticFeedback_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0170] RichEditor: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0170] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0180
     * @tc.name      EnableHapticFeedbackTest_0180
     * @tc.desc      set RichEditor enableHapticFeedback: true
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0180', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0180] START');
      let strJson = getInspectorByKey('RichEditor_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0180] RichEditor: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0180] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0190
     * @tc.name      EnableHapticFeedbackTest_0190
     * @tc.desc      set RichEditor enableHapticFeedback: false
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0190', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0190] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_false'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0190] click succ');
      let strJson = getInspectorByKey('RichEditor_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0190] RichEditor: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[EnableHapticFeedbackTest_0190] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_EnableHapticFeedbackTest_0200
     * @tc.name      EnableHapticFeedbackTest_0200
     * @tc.desc      set RichEditor enableHapticFeedback: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('EnableHapticFeedbackTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[EnableHapticFeedbackTest_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('enableHapticFeedback_undefined'));
      await Button.click()
      await CommonFunc.sleep(1000);
      console.info('[EnableHapticFeedbackTest_0200] click succ');
      let strJson = getInspectorByKey('RichEditor_enableHapticFeedback');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EnableHapticFeedbackTest_0200] RichEditor: ' + JSON.stringify(obj.$attrs.enableHapticFeedback));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[EnableHapticFeedbackTest_0200] END');
      done();
    });
  })
}