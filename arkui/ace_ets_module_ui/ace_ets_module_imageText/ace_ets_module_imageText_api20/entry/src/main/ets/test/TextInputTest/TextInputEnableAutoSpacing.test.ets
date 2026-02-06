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
import CommonFunc from '../../MainAbility/common/Common';


export default function TextInputEnableAutoSpacingTest() {
  describe('TextInputEnableAutoSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputEnableAutoSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputEnableAutoSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputEnableAutoSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextInputEnableAutoSpacing" == pages.name)) {
          console.info("get TextInputEnableAutoSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputEnableAutoSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputEnableAutoSpacingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0010
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0010
     * @tc.desc   test the attr of TextInput: enableAutoSpacing(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0010] START');
      let strJson = getInspectorByKey('TextInput_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0010] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('1');
      console.info('[TextInputEnableAutoSpacingTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0020
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0020
     * @tc.desc   test the attr of TextInput: enableAutoSpacing(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0020] START');
      let strJson = getInspectorByKey('TextInput_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0020] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextInputEnableAutoSpacingTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0030
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0030
     * @tc.desc   test the attr of TextInput: enableAutoSpacing(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0030] START');
      let strJson = getInspectorByKey('TextInput_enableAutoSpacing_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0030] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextInputEnableAutoSpacingTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0040
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0040
     * @tc.desc   test the attr of TextInput: enableAutoSpacing(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0040] START');
      let strJson = getInspectorByKey('TextInput_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0040] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextInputEnableAutoSpacingTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0050
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0050
     * @tc.desc   test the attr of TextInputModifier: enableAutoSpacing(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0050] START');
      let strJson = getInspectorByKey('TextInputModifier_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0050] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('1');
      console.info('[TextInputEnableAutoSpacingTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0060
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0060
     * @tc.desc   test the attr of TextInputModifier: enableAutoSpacing(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0060] START');
      let strJson = getInspectorByKey('TextInputModifier_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0060] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextInputEnableAutoSpacingTest_0060] END');
      done();
    });

    /**
     * @tc.name   TextInputEnableAutoSpacingTest_0070
     * @tc.number SUB_ACE_TextInputEnableAutoSpacingTest_0070
     * @tc.desc   test the attr of TextInputModifier: enableAutoSpacing(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInputEnableAutoSpacingTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[TextInputEnableAutoSpacingTest_0070] START');
      let strJson = getInspectorByKey('TextInputModifier_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextInputEnableAutoSpacingTest_0070] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextInputEnableAutoSpacingTest_0070] END');
      done();
    });
  })
}