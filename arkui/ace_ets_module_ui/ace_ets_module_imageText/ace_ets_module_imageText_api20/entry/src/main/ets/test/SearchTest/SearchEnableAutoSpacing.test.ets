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


export default function SearchEnableAutoSpacingTest() {
  describe('SearchEnableAutoSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchEnableAutoSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchEnableAutoSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchEnableAutoSpacingTest state pages: " + JSON.stringify(pages));
        if (!("SearchEnableAutoSpacing" == pages.name)) {
          console.info("get SearchEnableAutoSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchEnableAutoSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchEnableAutoSpacingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0010
     * @tc.name      SearchEnableAutoSpacingTest_0010
     * @tc.desc      test the attr of Search: enableAutoSpacing(true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0010] START');
      let strJson = getInspectorByKey('Search_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0010] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('1');
      console.info('[SearchEnableAutoSpacingTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0020
     * @tc.name      SearchEnableAutoSpacingTest_0020
     * @tc.desc      test the attr of Search: enableAutoSpacing(false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0020] START');
      let strJson = getInspectorByKey('Search_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0020] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[SearchEnableAutoSpacingTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0030
     * @tc.name      SearchEnableAutoSpacingTest_0030
     * @tc.desc      test the attr of Search: enableAutoSpacing(default)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0030] START');
      let strJson = getInspectorByKey('Search_enableAutoSpacing_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0030] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[SearchEnableAutoSpacingTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0040
     * @tc.name      SearchEnableAutoSpacingTest_0040
     * @tc.desc      test the attr of Search: enableAutoSpacing(undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0040] START');
      let strJson = getInspectorByKey('Search_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0040] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[SearchEnableAutoSpacingTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0050
     * @tc.name      SearchEnableAutoSpacingTest_0050
     * @tc.desc      test the attr of SearchModifier: enableAutoSpacing(true)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0050] START');
      let strJson = getInspectorByKey('SearchModifier_enableAutoSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0050] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('1');
      console.info('[SearchEnableAutoSpacingTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0060
     * @tc.name      SearchEnableAutoSpacingTest_0060
     * @tc.desc      test the attr of SearchModifier: enableAutoSpacing(false)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0060] START');
      let strJson = getInspectorByKey('SearchModifier_enableAutoSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0060] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[SearchEnableAutoSpacingTest_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchEnableAutoSpacingTest_0070
     * @tc.name      SearchEnableAutoSpacingTest_0070
     * @tc.desc      test the attr of SearchModifier: enableAutoSpacing(undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchEnableAutoSpacingTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchEnableAutoSpacingTest_0070] START');
      let strJson = getInspectorByKey('SearchModifier_enableAutoSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchEnableAutoSpacingTest_0070] value: ' + JSON.stringify(obj.$attrs.enableAutoSpacing));
      expect(obj.$attrs.enableAutoSpacing).assertEqual('0');
      console.info('[SearchEnableAutoSpacingTest_0070] END');
      done();
    });
  })
}