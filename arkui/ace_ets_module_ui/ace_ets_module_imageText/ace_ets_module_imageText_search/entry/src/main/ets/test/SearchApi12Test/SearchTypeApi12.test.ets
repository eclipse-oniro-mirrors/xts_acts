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


export default function SearchTypeApi12Test() {
  describe('SearchTypeApi12Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchTypeApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi12/SearchTypeApi12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchTypeApi12Test state pages: " + JSON.stringify(pages));
        if (!("SearchTypeApi12" == pages.name)) {
          console.info("get SearchTypeApi12Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchTypeApi12Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTypeApi12Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SearchTypeApi12Test_0010
     * @tc.number SUB_ACE_SearchTypeApi12Test_0010
     * @tc.desc   test the type of Search: SearchType.NUMBER_DECIMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi12Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi12Test_0010] START');
      let strJson = getInspectorByKey('SearchTypeApi12_NUMBER_DECIMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi12Test_0010] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NUMBER_DECIMAL');
      console.info('[SearchTypeApi12Test_0010] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi12Test_0020
     * @tc.number SUB_ACE_SearchTypeApi12Test_0020
     * @tc.desc   test the type of Search: SearchType.URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi12Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi12Test_0020] START');
      let strJson = getInspectorByKey('SearchTypeApi12_URL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi12Test_0020] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.URL');
      console.info('[SearchTypeApi12Test_0020] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi12Test_0030
     * @tc.number SUB_ACE_SearchTypeApi12Test_0030
     * @tc.desc   test the type of Search: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi12Test_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi12Test_0030] START');
      let strJson = getInspectorByKey('SearchTypeApi12_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi12Test_0030] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeApi12Test_0030] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi12Test_0040
     * @tc.number SUB_ACE_SearchTypeApi12Test_0040
     * @tc.desc   test the type of Search: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi12Test_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi12Test_0040] START');
      let strJson = getInspectorByKey('SearchTypeApi12_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi12Test_0040] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeApi12Test_0040] END');
      done();
    });
  })
}