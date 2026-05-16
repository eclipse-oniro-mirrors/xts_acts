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


export default function RichEditorModifierTest() {
  describe('RichEditorModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Modifier/RichEditorModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorModifierTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorModifier" == pages.name)) {
          console.info("get RichEditorModifierTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorModifierTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorModifierTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorModifierTest_0010
     * @tc.number SUB_ACE_RichEditorModifierTest_0010
     * @tc.desc   test RichEditorModifier: width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RichEditorModifierTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorModifierTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditorModifier_get_width');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorModifierTest_0010] RichEditorModifier width:" + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertEqual('200.00vp');
      console.info('[RichEditorModifierTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorModifierTest_0020
     * @tc.number SUB_ACE_RichEditorModifierTest_0020
     * @tc.desc   test type of RichEditorInstance: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RichEditorModifierTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorModifierTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditorModifier_get_type');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorModifierTest_0020] RichEditorInstance type is: " + JSON.stringify(obj.$attrs.text));
      expect(obj.$attrs.text).assertEqual('undefined');
      console.info('[RichEditorModifierTest_0020] END');
      done();
    });
  })
}

