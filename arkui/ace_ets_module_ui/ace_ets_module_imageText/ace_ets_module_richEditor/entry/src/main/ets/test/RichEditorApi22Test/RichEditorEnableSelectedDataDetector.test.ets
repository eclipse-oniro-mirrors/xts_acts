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


export default function RichEditorEnableSelectedDataDetectorTest() {
  describe('RichEditorEnableSelectedDataDetectorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorEnableSelectedDataDetectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi22/RichEditorEnableSelectedDataDetector',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorEnableSelectedDataDetectorTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorEnableSelectedDataDetector" == pages.name)) {
          console.info("get RichEditorEnableSelectedDataDetectorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorEnableSelectedDataDetectorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorEnableSelectedDataDetectorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorEnableSelectedDataDetectorTest_0010
     * @tc.number SUB_ACE_RichEditorEnableSelectedDataDetectorTest_0010
     * @tc.desc   test the enableSelectedDataDetector of RichEditor: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableSelectedDataDetectorTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableSelectedDataDetectorTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_enableSelectedDataDetector_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableSelectedDataDetectorTest_0010] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[RichEditorEnableSelectedDataDetectorTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorEnableSelectedDataDetectorTest_0020
     * @tc.number SUB_ACE_RichEditorEnableSelectedDataDetectorTest_0020
     * @tc.desc   test the enableSelectedDataDetector of RichEditor: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableSelectedDataDetectorTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableSelectedDataDetectorTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_enableSelectedDataDetector_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableSelectedDataDetectorTest_0020] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('false');
      console.info('[RichEditorEnableSelectedDataDetectorTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorEnableSelectedDataDetectorTest_0030
     * @tc.number SUB_ACE_RichEditorEnableSelectedDataDetectorTest_0030
     * @tc.desc   test the enableSelectedDataDetector of RichEditor: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableSelectedDataDetectorTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableSelectedDataDetectorTest_0030] START');
      let strJson = getInspectorByKey('RichEditor_enableSelectedDataDetector_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableSelectedDataDetectorTest_0030] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[RichEditorEnableSelectedDataDetectorTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorEnableSelectedDataDetectorTest_0040
     * @tc.number SUB_ACE_RichEditorEnableSelectedDataDetectorTest_0040
     * @tc.desc   test the enableSelectedDataDetector of RichEditor: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorEnableSelectedDataDetectorTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorEnableSelectedDataDetectorTest_0040] START');
      let strJson = getInspectorByKey('RichEditor_enableSelectedDataDetector_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorEnableSelectedDataDetectorTest_0040] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[RichEditorEnableSelectedDataDetectorTest_0040] END');
      done();
    });
  })
}