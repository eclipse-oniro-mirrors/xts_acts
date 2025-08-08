/*
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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SearchAutoCapitalizationModeTest() {
  describe('SearchAutoCapitalizationModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchAutoCapitalizationModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchAutoCapitalizationMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchAutoCapitalizationModeTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("SearchAutoCapitalizationMode" == pages.name)) {
          console.info("get SearchAutoCapitalizationModeTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push SearchAutoCapitalizationModeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchAutoCapitalizationModeTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SearchAutoCapitalizationModeTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0010
    * @tc.name         SearchAutoCapitalizationModeTest_0010
    * @tc.desc         test Search autoCapitalizationMode: AutoCapitalizationMode.NONE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0010] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_NONE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0010] Search: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_0010] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0020
    * @tc.name         SearchAutoCapitalizationModeTest_0020
    * @tc.desc         test Search autoCapitalizationMode: AutoCapitalizationMode.WORDS
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0020] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_WORDS');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0020] Search: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.WORDS');
      console.info("[SearchAutoCapitalizationModeTest_0020] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0030
    * @tc.name         SearchAutoCapitalizationModeTest_0030
    * @tc.desc         test Search autoCapitalizationMode: AutoCapitalizationMode.SENTENCES
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0030] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_SENTENCES');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0030] Search: ' +
      JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.SENTENCES');
      console.info("[SearchAutoCapitalizationModeTest_0030] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0040
    * @tc.name         SearchAutoCapitalizationModeTest_0040
    * @tc.desc         test Search autoCapitalizationMode: AutoCapitalizationMode.ALL_CHARACTERS
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0040] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_ALL_CHARACTERS');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0040] Search: ' +
      JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.ALL_CHARACTERS');
      console.info("[SearchAutoCapitalizationModeTest_0040] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0050
    * @tc.name         SearchAutoCapitalizationModeTest_0050
    * @tc.desc         test Search autoCapitalizationMode: default
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0050] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0050] Search: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_0050] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0060
    * @tc.name         SearchAutoCapitalizationModeTest_0060
    * @tc.desc         test Search autoCapitalizationMode: undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0060] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0060] Search: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_0060] END");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_SearchAutoCapitalizationModeTest_0070
    * @tc.name         SearchAutoCapitalizationModeTest_0070
    * @tc.desc         test Search autoCapitalizationMode: 0
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        2
    */
    it('SearchAutoCapitalizationModeTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchAutoCapitalizationModeTest_0070] START');
      let strJson = getInspectorByKey('Search_AutoCapitalizationMode_0');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchAutoCapitalizationModeTest_0070] Search: ' +
        JSON.stringify(obj.$attrs.autoCapitalizationMode));
      expect(obj.$attrs.autoCapitalizationMode).assertEqual('AutoCapitalizationMode.NONE');
      console.info("[SearchAutoCapitalizationModeTest_0070] END");
      done();
    });
  })
}