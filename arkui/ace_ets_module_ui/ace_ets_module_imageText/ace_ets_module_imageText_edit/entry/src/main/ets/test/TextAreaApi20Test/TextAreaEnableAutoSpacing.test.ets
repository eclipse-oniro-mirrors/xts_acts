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


export default function TextAreaEnableAutoSpacingTest() {
  describe('TextAreaEnableAutoSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaEnableAutoSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi20/TextAreaEnableAutoSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaEnableAutoSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaEnableAutoSpacing" == pages.name)) {
          console.info("get TextAreaEnableAutoSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaEnableAutoSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaEnableAutoSpacingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0010
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0010
     * @tc.desc   test the attr of TextArea: enableAutoSpacing(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0010] START');
      let strJson = getInspectorByKey('TextArea_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0010] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('1');
      console.info('[TextAreaEnableAutoSpacingTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0020
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0020
     * @tc.desc   test the attr of TextArea: enableAutoSpacing(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0020] START');
      let strJson = getInspectorByKey('TextArea_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0020] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextAreaEnableAutoSpacingTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0030
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0030
     * @tc.desc   test the attr of TextArea: enableAutoSpacing(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0030] START');
      let strJson = getInspectorByKey('TextArea_enableAutoSpacing_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0030] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextAreaEnableAutoSpacingTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0040
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0040
     * @tc.desc   test the attr of TextArea: enableAutoSpacing(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0040] START');
      let strJson = getInspectorByKey('TextArea_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0040] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextAreaEnableAutoSpacingTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0050
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0050
     * @tc.desc   test the attr of TextAreaModifier: enableAutoSpacing(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0050] START');
      let strJson = getInspectorByKey('TextAreaModifier_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0050] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('1');
      console.info('[TextAreaEnableAutoSpacingTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0060
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0060
     * @tc.desc   test the attr of TextAreaModifier: enableAutoSpacing(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0060] START');
      let strJson = getInspectorByKey('TextAreaModifier_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0060] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextAreaEnableAutoSpacingTest_0060] END');
      done();
    });

    /**
     * @tc.name   TextAreaEnableAutoSpacingTest_0070
     * @tc.number SUB_ACE_TextAreaEnableAutoSpacingTest_0070
     * @tc.desc   test the attr of TextAreaModifier: enableAutoSpacing(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaEnableAutoSpacingTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaEnableAutoSpacingTest_0070] START');
      let strJson = getInspectorByKey('TextAreaModifier_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaEnableAutoSpacingTest_0070] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[TextAreaEnableAutoSpacingTest_0070] END');
      done();
    });
  })
}