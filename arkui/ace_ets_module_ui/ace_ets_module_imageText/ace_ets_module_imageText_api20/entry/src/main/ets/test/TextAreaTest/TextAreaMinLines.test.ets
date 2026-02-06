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


export default function TextAreaMinLinesTest() {
  describe('TextAreaMinLinesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaMinLinesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaMinLines',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaMinLinesTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaMinLines" == pages.name)) {
          console.info("get TextAreaMinLinesTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaMinLinesTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaMinLinesTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0010
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0010
     * @tc.desc   test the attr of TextArea: minLines(2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0010] START');
      let strJson = getInspectorByKey('TextArea_minLines_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0010] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('2');
      console.info('[TextAreaMinLinesTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0020
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0020
     * @tc.desc   test the attr of TextArea: minLines(-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0020] START');
      let strJson = getInspectorByKey('TextArea_minLines_f1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0020] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[TextAreaMinLinesTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0030
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0030
     * @tc.desc   test the attr of TextArea: minLines(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0030] START');
      let strJson = getInspectorByKey('TextArea_minLines_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0030] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[TextAreaMinLinesTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0040
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0040
     * @tc.desc   test the attr of TextArea: minLines(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0040] START');
      let strJson = getInspectorByKey('TextArea_minLines_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0040] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[TextAreaMinLinesTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0050
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0050
     * @tc.desc   test the attr of TextAreaModifier: minLines(2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0050] START');
      let strJson = getInspectorByKey('TextAreaModifier_minLines_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0050] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('2');
      console.info('[TextAreaMinLinesTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0060
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0060
     * @tc.desc   test the attr of TextAreaModifier: minLines(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0060] START');
      let strJson = getInspectorByKey('TextAreaModifier_minLines_0');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0060] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[TextAreaMinLinesTest_0060] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0070
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0070
     * @tc.desc   test the attr of TextAreaModifier: minLines(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0070] START');
      let strJson = getInspectorByKey('TextAreaModifier_minLines_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0070] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[TextAreaMinLinesTest_0070] END');
      done();
    });

    /**
     * @tc.name   TextAreaMinLinesTest_0080
     * @tc.number SUB_ACE_TextAreaMinLinesTest_0080
     * @tc.desc   test the attr of TextAreaModifier: minLines(-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextAreaMinLinesTest_0080', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaMinLinesTest_0080] START');
      let strJson = getInspectorByKey('TextAreaModifier_minLines_f1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaMinLinesTest_0080] value: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[TextAreaMinLinesTest_0080] END');
      done();
    });
  })
}