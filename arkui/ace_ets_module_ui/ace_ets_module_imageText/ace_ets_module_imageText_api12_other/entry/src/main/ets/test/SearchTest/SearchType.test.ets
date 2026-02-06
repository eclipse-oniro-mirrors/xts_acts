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


export default function SearchTypeTest() {
  describe('SearchTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchTypeTest state pages: " + JSON.stringify(pages));
        if (!("SearchType" == pages.name)) {
          console.info("get SearchTypeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchTypeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTypeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchTypeTest_0010
     * @tc.name      SearchTypeTest_0010
     * @tc.desc      test the type of Search: SearchType.NUMBER_DECIMAL
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeTest_0010] START');
      let strJson = getInspectorByKey('SearchType_NUMBER_DECIMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeTest_0010] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NUMBER_DECIMAL');
      console.info('[SearchTypeTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchTypeTest_0020
     * @tc.name      SearchTypeTest_0020
     * @tc.desc      test the type of Search: SearchType.URL
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeTest_0020] START');
      let strJson = getInspectorByKey('SearchType_URL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeTest_0020] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.URL');
      console.info('[SearchTypeTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchTypeTest_0030
     * @tc.name      SearchTypeTest_0030
     * @tc.desc      test the type of Search: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeTest_0030] START');
      let strJson = getInspectorByKey('SearchType_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeTest_0030] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchTypeTest_0040
     * @tc.name      SearchTypeTest_0040
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SearchTypeTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeTest_0040] START');
      let strJson = getInspectorByKey('SearchType_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeTest_0040] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0040] END');
      done();
    });
  })
}