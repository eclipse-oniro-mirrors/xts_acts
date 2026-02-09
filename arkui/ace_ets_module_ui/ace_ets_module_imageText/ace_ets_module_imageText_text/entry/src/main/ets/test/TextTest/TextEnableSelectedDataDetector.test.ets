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


export default function TextEnableSelectedDataDetectorTest() {
  describe('TextEnableSelectedDataDetectorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextEnableSelectedDataDetectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextEnableSelectedDataDetector',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextEnableSelectedDataDetectorTest state pages: " + JSON.stringify(pages));
        if (!("TextEnableSelectedDataDetector" == pages.name)) {
          console.info("get TextEnableSelectedDataDetectorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextEnableSelectedDataDetectorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextEnableSelectedDataDetectorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextEnableSelectedDataDetectorTest_0010
     * @tc.number SUB_ACE_TextEnableSelectedDataDetectorTest_0010
     * @tc.desc   test the enableSelectedDataDetector of Text LocalDevice: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableSelectedDataDetectorTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableSelectedDataDetectorTest_0010] START');
      let strJson = getInspectorByKey('text_enableSelectedDataDetector_true_LocalDevice');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableSelectedDataDetectorTest_0010] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[TextEnableSelectedDataDetectorTest_0010] END');
      done();
    });

    /**
     * @tc.name   TextEnableSelectedDataDetectorTest_0020
     * @tc.number SUB_ACE_TextEnableSelectedDataDetectorTest_0020
     * @tc.desc   test the enableSelectedDataDetector of Text CROSS_DEVICE: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableSelectedDataDetectorTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableSelectedDataDetectorTest_0020] START');
      let strJson = getInspectorByKey('text_enableSelectedDataDetector_true_CROSS_DEVICE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableSelectedDataDetectorTest_0020] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[TextEnableSelectedDataDetectorTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextEnableSelectedDataDetectorTest_0030
     * @tc.number SUB_ACE_TextEnableSelectedDataDetectorTest_0030
     * @tc.desc   test the enableSelectedDataDetector of Text: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableSelectedDataDetectorTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableSelectedDataDetectorTest_0030] START');
      let strJson = getInspectorByKey('text_enableSelectedDataDetector_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableSelectedDataDetectorTest_0030] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('false');
      console.info('[TextEnableSelectedDataDetectorTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextEnableSelectedDataDetectorTest_0040
     * @tc.number SUB_ACE_TextEnableSelectedDataDetectorTest_0040
     * @tc.desc   test the enableSelectedDataDetector of Text: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableSelectedDataDetectorTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableSelectedDataDetectorTest_0040] START');
      let strJson = getInspectorByKey('text_enableSelectedDataDetector_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableSelectedDataDetectorTest_0040] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[TextEnableSelectedDataDetectorTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextEnableSelectedDataDetectorTest_0050
     * @tc.number SUB_ACE_TextEnableSelectedDataDetectorTest_0050
     * @tc.desc   test the TextEnableSelectedDataDetector of Text: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextEnableSelectedDataDetectorTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextEnableSelectedDataDetectorTest_0050] START');
      let strJson = getInspectorByKey('text_enableSelectedDataDetector_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextEnableSelectedDataDetectorTest_0050] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[TextEnableSelectedDataDetectorTest_0050] END');
      done();
    });
  })
}