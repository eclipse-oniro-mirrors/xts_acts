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


export default function ModifierTextVerticalAlignTest() {
  describe('ModifierTextVerticalAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ModifierTextVerticalAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextVerticalAlignModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ModifierTextVerticalAlignTest state pages: " + JSON.stringify(pages));
        if (!("TextVerticalAlignModifier" == pages.name)) {
          console.info("get ModifierTextVerticalAlignTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ModifierTextVerticalAlignTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ModifierTextVerticalAlignTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_ModifierTextVerticalAlignTest_0010
     * @tc.name      ModifierTextVerticalAlignTest_0010
     * @tc.desc      test the textVerticalAlign of TextModifier: TextVerticalAlign.BASELINE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ModifierTextVerticalAlignTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[ModifierTextVerticalAlignTest_0010] START');
      let strJson = getInspectorByKey('Modifier_TextVerticalAlign_BASELINE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ModifierTextVerticalAlignTest_0010] value: ' + JSON.stringify(obj.$attrs.textVerticalAlign));
      expect(obj.$attrs.textVerticalAlign).assertEqual('TextVerticalAlign.BASELINE');
      console.info('[ModifierTextVerticalAlignTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ModifierTextVerticalAlignTest_0020
     * @tc.name      ModifierTextVerticalAlignTest_0020
     * @tc.desc      test the textVerticalAlign of TextModifier: TextVerticalAlign.BOTTOM
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ModifierTextVerticalAlignTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[ModifierTextVerticalAlignTest_0020] START');
      let strJson = getInspectorByKey('Modifier_TextVerticalAlign_BOTTOM');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ModifierTextVerticalAlignTest_0020] value: ' + JSON.stringify(obj.$attrs.textVerticalAlign));
      expect(obj.$attrs.textVerticalAlign).assertEqual('TextVerticalAlign.BOTTOM');
      console.info('[ModifierTextVerticalAlignTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ModifierTextVerticalAlignTest_0030
     * @tc.name      ModifierTextVerticalAlignTest_0030
     * @tc.desc      test the textVerticalAlign of TextModifier: TextVerticalAlign.CENTER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ModifierTextVerticalAlignTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[ModifierTextVerticalAlignTest_0030] START');
      let strJson = getInspectorByKey('Modifier_TextVerticalAlign_CENTER');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ModifierTextVerticalAlignTest_0030] value: ' + JSON.stringify(obj.$attrs.textVerticalAlign));
      expect(obj.$attrs.textVerticalAlign).assertEqual('TextVerticalAlign.CENTER');
      console.info('[ModifierTextVerticalAlignTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ModifierTextVerticalAlignTest_0040
     * @tc.name      ModifierTextVerticalAlignTest_0040
     * @tc.desc      test the textVerticalAlign of TextModifier: TextVerticalAlign.TOP
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ModifierTextVerticalAlignTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[ModifierTextVerticalAlignTest_0040] START');
      let strJson = getInspectorByKey('Modifier_TextVerticalAlign_TOP');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ModifierTextVerticalAlignTest_0040] value: ' + JSON.stringify(obj.$attrs.textVerticalAlign));
      expect(obj.$attrs.textVerticalAlign).assertEqual('TextVerticalAlign.TOP');
      console.info('[ModifierTextVerticalAlignTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ModifierTextVerticalAlignTest_0050
     * @tc.name      ModifierTextVerticalAlignTest_0050
     * @tc.desc      test the textVerticalAlign of TextModifier: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ModifierTextVerticalAlignTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[ModifierTextVerticalAlignTest_0050] START');
      let strJson = getInspectorByKey('Modifier_TextVerticalAlign_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ModifierTextVerticalAlignTest_0050] value: ' + JSON.stringify(obj.$attrs.textVerticalAlign));
      expect(obj.$attrs.textVerticalAlign).assertEqual('TextVerticalAlign.BASELINE');
      console.info('[ModifierTextVerticalAlignTest_0050] END');
      done();
    });
  })
}