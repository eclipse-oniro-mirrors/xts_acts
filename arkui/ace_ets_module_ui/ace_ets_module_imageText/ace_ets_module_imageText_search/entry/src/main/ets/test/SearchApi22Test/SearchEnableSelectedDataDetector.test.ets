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


export default function SearchEnableSelectedDataDetectorTest() {
  describe('SearchEnableSelectedDataDetectorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchEnableSelectedDataDetectorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi22/SearchEnableSelectedDataDetector',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchEnableSelectedDataDetectorTest state pages: " + JSON.stringify(pages));
        if (!("SearchEnableSelectedDataDetector" == pages.name)) {
          console.info("get SearchEnableSelectedDataDetectorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchEnableSelectedDataDetectorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchEnableSelectedDataDetectorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SearchEnableSelectedDataDetectorTest_0010
     * @tc.number SUB_ACE_SearchEnableSelectedDataDetectorTest_0010
     * @tc.desc   test the enableSelectedDataDetector of Search LocalDevice: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SearchEnableSelectedDataDetectorTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableSelectedDataDetectorTest_0010] START');
      let strJson = getInspectorByKey('Search_enableSelectedDataDetector_true_LocalDevice');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableSelectedDataDetectorTest_0010] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[SearchEnableSelectedDataDetectorTest_0010] END');
      done();
    });

    /**
     * @tc.name   SearchEnableSelectedDataDetectorTest_0020
     * @tc.number SUB_ACE_SearchEnableSelectedDataDetectorTest_0020
     * @tc.desc   test the enableSelectedDataDetector of Search CROSS_DEVICE: true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SearchEnableSelectedDataDetectorTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableSelectedDataDetectorTest_0020] START');
      let strJson = getInspectorByKey('Search_enableSelectedDataDetector_true_CROSS_DEVICE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableSelectedDataDetectorTest_0020] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[SearchEnableSelectedDataDetectorTest_0020] END');
      done();
    });

    /**
     * @tc.name   SearchEnableSelectedDataDetectorTest_0030
     * @tc.number SUB_ACE_SearchEnableSelectedDataDetectorTest_0030
     * @tc.desc   test the enableSelectedDataDetector of Search: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SearchEnableSelectedDataDetectorTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableSelectedDataDetectorTest_0030] START');
      let strJson = getInspectorByKey('Search_enableSelectedDataDetector_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableSelectedDataDetectorTest_0030] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('false');
      console.info('[SearchEnableSelectedDataDetectorTest_0030] END');
      done();
    });

    /**
     * @tc.name   SearchEnableSelectedDataDetectorTest_0040
     * @tc.number SUB_ACE_SearchEnableSelectedDataDetectorTest_0040
     * @tc.desc   test the enableSelectedDataDetector of Search: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SearchEnableSelectedDataDetectorTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableSelectedDataDetectorTest_0040] START');
      let strJson = getInspectorByKey('Search_enableSelectedDataDetector_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableSelectedDataDetectorTest_0040] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[SearchEnableSelectedDataDetectorTest_0040] END');
      done();
    });

    /**
     * @tc.name   SearchEnableSelectedDataDetectorTest_0050
     * @tc.number SUB_ACE_SearchEnableSelectedDataDetectorTest_0050
     * @tc.desc   test the enableSelectedDataDetector of Search: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SearchEnableSelectedDataDetectorTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableSelectedDataDetectorTest_0050] START');
      let strJson = getInspectorByKey('Search_enableSelectedDataDetector_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableSelectedDataDetectorTest_0050] value: ' + JSON.stringify(obj.$attrs.enableSelectedDataDetector));
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual('true');
      console.info('[SearchEnableSelectedDataDetectorTest_0050] END');
      done();
    });
  })
}