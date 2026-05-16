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


export default function SearchTypeApi11Test() {
  describe('SearchTypeApi11Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchTypeApi11Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi11/SearchTypeApi11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchTypeApi11Test state pages: " + JSON.stringify(pages));
        if (!("SearchTypeApi11" == pages.name)) {
          console.info("get SearchTypeApi11Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchTypeApi11Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTypeApi11Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SearchTypeApi11Test_0010
     * @tc.number SUB_ACE_SearchTypeApi11Test_0010
     * @tc.desc   test Search: SearchType.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi11Test_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi11Test_0010] START');
      let strJson = getInspectorByKey('SearchTypeApi11_NORMAL');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi11Test_0010] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NORMAL');
      console.info('[SearchTypeApi11Test_0010] END');
      done();
    });

    /**
     * @tc.name   SearchTypeApi11Test_0020
     * @tc.number SUB_ACE_SearchTypeApi11Test_0020
     * @tc.desc   test Search: SearchType.NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchTypeApi11Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[SearchTypeApi11Test_0020] START');
      let strJson = getInspectorByKey('SearchTypeApi11_NUMBER');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchTypeApi11Test_0020] SearchType: ' + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual('SearchType.NUMBER');
      console.info('[SearchTypeApi11Test_0020] END');
      done();
    });
  })
}