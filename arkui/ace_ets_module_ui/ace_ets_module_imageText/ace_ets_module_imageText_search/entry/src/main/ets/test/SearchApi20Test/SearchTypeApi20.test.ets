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


export default function SearchTypeApi20Test() {
  describe('SearchTypeApi20Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchTypeApi20Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi20/SearchTypeApi20',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchTypeApi20Test state pages: " + JSON.stringify(pages));
        if (!("SearchTypeApi20" == pages.name)) {
          console.info("get SearchTypeApi20Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchTypeApi20Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTypeApi20Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SearchTypeApi20Test_0010
     * @tc.number SUB_ACE_SearchTypeApi20Test_0010
     * @tc.desc   test the type of Search: SearchType.ONE_TIME_CODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi20Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi20Test_0010] START');
      let strJson = getInspectorByKey('SearchTypeApi20_ONE_TIME_CODE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi20Test_0010] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.ONE_TIME_CODE');
      console.info('[SearchTypeApi20Test_0010] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi20Test_0020
     * @tc.number SUB_ACE_SearchTypeApi20Test_0020
     * @tc.desc   test the type of Search: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi20Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi20Test_0020] START');
      let strJson = getInspectorByKey('SearchTypeApi20_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi20Test_0020] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeApi20Test_0020] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi20Test_0030
     * @tc.number SUB_ACE_SearchTypeApi20Test_0030
     * @tc.desc   test the type of Search: default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi20Test_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi20Test_0030] START');
      let strJson = getInspectorByKey('SearchTypeApi20_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi20Test_0030] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeApi20Test_0030] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi20Test_0040
     * @tc.number SUB_ACE_SearchTypeApi20Test_0040
     * @tc.desc   test the type of SearchModifier: SearchType.ONE_TIME_CODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi20Test_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi20Test_0040] START');
      let strJson = getInspectorByKey('SearchTypeApi20_Modifier');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi20Test_0040] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.ONE_TIME_CODE');
      console.info('[SearchTypeApi20Test_0040] END');
      done();
    });
  })
}