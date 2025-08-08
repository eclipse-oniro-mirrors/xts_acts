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


export default function SearchFontFeatureTest() {
  describe('SearchFontFeatureTest', () => {
    beforeEach(async (done: Function) => {
      console.info("fontFeatureTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchFontFeature',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fontFeatureTest state pages: " + JSON.stringify(pages));
        if (!("SearchFontFeature" == pages.name)) {
          console.info("get fontFeatureTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push fontFeatureTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push fontFeatureTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0010
     * @tc.name      SearchFontFeatureTest_0010
     * @tc.desc      test Search fontFeature: on
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[SearchFontFeatureTest_0010] START');
      let strJson = getInspectorByKey('Search_fontFeature_on');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchFontFeatureTest_0010] fontFeature: ' + JSON.stringify(obj.$attrs.fontFeature));
      expect(obj.$attrs.fontFeature).assertEqual('"ss01" on');
      console.info('[SearchFontFeatureTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0020
     * @tc.name      SearchFontFeatureTest_0020
     * @tc.desc      set Search fontFeature: fontFeature.Off
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[SearchFontFeatureTest_0020] START');
      let strJson = getInspectorByKey('Search_fontFeature_off');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchFontFeatureTest_0020] fontFeature: ' + JSON.stringify(obj.$attrs.fontFeature));
      expect(obj.$attrs.fontFeature).assertEqual('"ss01" off');
      console.info('[SearchFontFeatureTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0030
     * @tc.name      SearchFontFeatureTest_0030
     * @tc.desc      set Search fontFeature: default
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[SearchFontFeatureTest_0030] START');
      let strJson = getInspectorByKey('Search_fontFeature_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchFontFeatureTest_0030] fontFeature: ' + JSON.stringify(obj.$attrs.fontFeature));
      expect(obj.$attrs.fontFeature).assertEqual('');
      console.info('[SearchFontFeatureTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_SearchFontFeatureTest_0040
     * @tc.name      SearchFontFeatureTest_0040
     * @tc.desc      set Search fontFeature: undefined
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('SearchFontFeatureTest_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[SearchFontFeatureTest_0040] START');
      let strJson = getInspectorByKey('Search_fontFeature_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SearchFontFeatureTest_0040] fontFeature: ' + JSON.stringify(obj.$attrs.fontFeature));
      expect(obj.$attrs.fontFeature).assertEqual('');
      console.info('[SearchFontFeatureTest_0040] END');
      done();
    });
  })
}