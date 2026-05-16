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


export default function SearchModifierTest() {
  describe('SearchModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchModifierTest state pages: " + JSON.stringify(pages));
        if (!("SearchModifier" == pages.name)) {
          console.info("get SearchModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchModifierTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SearchModifierTest_0010
     * @tc.number SUB_ACE_SearchModifierTest_0010
     * @tc.desc   test SearchModifier: fontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SearchModifierTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('SearchModifierTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchModifier_get_value');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchModifierTest_0010] textFont: " + JSON.stringify(obj.$attrs.textFont));
      expect(obj.$attrs.textFont).assertContain('fontSize');
      expect(obj.$attrs.textFont).assertContain('15.00fp');
      console.info('[SearchModifierTest_0010] END');
      done();
    });

    /**
     * @tc.name   SearchModifierTest_0020
     * @tc.number SUB_ACE_SearchModifierTest_0020
     * @tc.desc   test type of SearchInstance: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SearchModifierTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('SearchModifierTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SearchModifier_get_type');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchModifierTest_0020] SearchInstance type is: " + JSON.stringify(obj.$attrs.text));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[SearchModifierTest_0020] END');
      done();
    });
  })
}
