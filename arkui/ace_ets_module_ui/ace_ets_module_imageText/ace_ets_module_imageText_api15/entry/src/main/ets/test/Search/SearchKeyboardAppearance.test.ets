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


export default function SearchKeyboardAppearanceTest() {
  describe('SearchKeyboardAppearanceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchKeyboardAppearanceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchKeyboardAppearance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchKeyboardAppearanceTest state pages: " + JSON.stringify(pages));
        if (!("SearchKeyboardAppearance" == pages.name)) {
          console.info("get SearchKeyboardAppearanceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchKeyboardAppearanceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchKeyboardAppearanceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_Search_KeyboardAppearanceTest_0010
     * @tc.name      SearchKeyboardAppearanceTest_0010
     * @tc.desc      set Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchKeyboardAppearanceTest_0010] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Search_KeyboardAppearance_NONE_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchKeyboardAppearanceTest_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[SearchKeyboardAppearanceTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Search_KeyboardAppearanceTest_0020
     * @tc.name      SearchKeyboardAppearanceTest_0020
     * @tc.desc      set Search KeyboardAppearance: IMMERSIVE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchKeyboardAppearanceTest_0020] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Search_KeyboardAppearance_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchKeyboardAppearanceTest_0020] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(1);
      console.info('[SearchKeyboardAppearanceTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Search_KeyboardAppearanceTest_0030
     * @tc.name      SearchKeyboardAppearanceTest_0030
     * @tc.desc      set Search KeyboardAppearance: LIGHT_IMMERSIVE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchKeyboardAppearanceTest_0030] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Search_KeyboardAppearance_LIGHT_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchKeyboardAppearanceTest_0030] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(2);
      console.info('[SearchKeyboardAppearanceTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Search_KeyboardAppearanceTest_0040
     * @tc.name      SearchKeyboardAppearanceTest_0040
     * @tc.desc      set Search KeyboardAppearance: DARK_IMMERSIVE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchKeyboardAppearanceTest_0040] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Search_KeyboardAppearance_DARK_IMMERSIVE');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchKeyboardAppearanceTest_0040] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(3);
      console.info('[SearchKeyboardAppearanceTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Search_KeyboardAppearanceTest_0050
     * @tc.name      SearchKeyboardAppearanceTest_0050
     * @tc.desc      test default value about Search KeyboardAppearance: NONE_IMMERSIVE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchKeyboardAppearanceTest_0050] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Search_KeyboardAppearance_DEFAULT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchKeyboardAppearanceTest_0050] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[SearchKeyboardAppearanceTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Search_KeyboardAppearanceTest_0060
     * @tc.name      SearchKeyboardAppearanceTest_0060
     * @tc.desc      test Illegal value about Search KeyboardAppearance: UNDEFINED
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('SearchKeyboardAppearanceTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[SearchKeyboardAppearanceTest_0060] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Search_KeyboardAppearance_UNDEFINED');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchKeyboardAppearanceTest_0060] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.keyboardAppearance).assertEqual(0);
      console.info('[SearchKeyboardAppearanceTest_0060] END');
      done();
    });
  })
}

