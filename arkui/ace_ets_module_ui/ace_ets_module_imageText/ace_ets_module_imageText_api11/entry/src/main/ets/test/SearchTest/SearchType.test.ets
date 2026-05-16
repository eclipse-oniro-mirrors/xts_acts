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
     * @tc.name   SearchTypeTest_0010
     * @tc.number SUB_ACE_SearchTypeTest_0010
     * @tc.desc   test Search: SearchType.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeTest_0010] START');
      let strJson = getInspectorByKey('SearchType_NORMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeTest_0010] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeTest_0010] END');
      done();
    });

    /**
     * @tc.name   SearchTypeTest_0020
     * @tc.number SUB_ACE_SearchTypeTest_0020
     * @tc.desc   test Search: SearchType.NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeTest_0020] START');
      let strJson = getInspectorByKey('SearchType_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeTest_0020] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NUMBER');
      console.info('[SearchTypeTest_0020] END');
      done();
    });
  })
}