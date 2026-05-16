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


export default function RichEditorEnableAutoSpacingTest() {
  describe('RichEditorEnableAutoSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorEnableAutoSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi20/RichEditorEnableAutoSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorEnableAutoSpacingTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorEnableAutoSpacing" == pages.name)) {
          console.info("get RichEditorEnableAutoSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorEnableAutoSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorEnableAutoSpacingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorEnableAutoSpacingTest_0010
     * @tc.number SUB_ACE_RichEditorEnableAutoSpacingTest_0010
     * @tc.desc   test the attr of RichEditor: enableAutoSpacing(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableAutoSpacingTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableAutoSpacingTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableAutoSpacingTest_0010] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('true');
      console.info('[RichEditorEnableAutoSpacingTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorEnableAutoSpacingTest_0020
     * @tc.number SUB_ACE_RichEditorEnableAutoSpacingTest_0020
     * @tc.desc   test the attr of RichEditor: enableAutoSpacing(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableAutoSpacingTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableAutoSpacingTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableAutoSpacingTest_0020] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('false');
      console.info('[RichEditorEnableAutoSpacingTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorEnableAutoSpacingTest_0030
     * @tc.number SUB_ACE_RichEditorEnableAutoSpacingTest_0030
     * @tc.desc   test the attr of RichEditor: enableAutoSpacing(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableAutoSpacingTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableAutoSpacingTest_0030] START');
      let strJson = getInspectorByKey('RichEditor_enableAutoSpacing_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableAutoSpacingTest_0030] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('false');
      console.info('[RichEditorEnableAutoSpacingTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorEnableAutoSpacingTest_0040
     * @tc.number SUB_ACE_RichEditorEnableAutoSpacingTest_0040
     * @tc.desc   test the attr of RichEditor: enableAutoSpacing(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableAutoSpacingTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableAutoSpacingTest_0040] START');
      let strJson = getInspectorByKey('RichEditor_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableAutoSpacingTest_0040] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('false');
      console.info('[RichEditorEnableAutoSpacingTest_0040] END');
      done();
    });
  })
}