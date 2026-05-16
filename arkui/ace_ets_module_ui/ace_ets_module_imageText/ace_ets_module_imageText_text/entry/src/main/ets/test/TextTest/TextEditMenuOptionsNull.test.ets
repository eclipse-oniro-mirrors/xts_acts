/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextEditMenuOptionsNullTest() {
  describe('TextEditMenuOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextEditMenuOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextEditMenuOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextEditMenuOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextEditMenuOptionsNull" == pages.name)) {
          console.info("get TextEditMenuOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextEditMenuOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextEditMenuOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== EditMenuOptions onCreateMenu 测试 ====================

    /**
     * @tc.name   textEditMenuOptionsOnCreateMenuNull_0100
     * @tc.number SUB_ARKUI_TEXT_EDITMENUOPTIONS_ONCREATEMENU_NULL_PARAM_001
     * @tc.desc   Test EditMenuOptions onCreateMenu with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textEditMenuOptionsOnCreateMenuNull_0100', Level.LEVEL1, async () => {
      console.info('TextEditMenuOptionsNullTest', 'textEditMenuOptionsOnCreateMenuNull_0100 START');

      let strJson: string = getInspectorByKey('text_editMenuOptions_onCreateMenu_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info('TextEditMenuOptionsNullTest', 'textEditMenuOptionsOnCreateMenuNull_0100 END');
    });

    /**
     * @tc.name   textEditMenuOptionsOnCreateMenuUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_EDITMENUOPTIONS_ONCREATEMENU_UNDEFINED_PARAM_001
     * @tc.desc   Test EditMenuOptions onCreateMenu with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textEditMenuOptionsOnCreateMenuUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextEditMenuOptionsNullTest', 'textEditMenuOptionsOnCreateMenuUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_editMenuOptions_onCreateMenu_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info('TextEditMenuOptionsNullTest', 'textEditMenuOptionsOnCreateMenuUndefined_0100 END');
    });

    // ==================== IMEClient setExtraConfig 测试 ====================

    /**
     * @tc.name   textImeClientSetExtraConfigNull_0100
     * @tc.number SUB_ARKUI_TEXT_IMECLIENT_SETEXTRACONFIG_NULL_PARAM_001
     * @tc.desc   TestInput IMEClient setExtraConfig with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textImeClientSetExtraConfigNull_0100', Level.LEVEL1, async () => {
      console.info('TextEditMenuOptionsNullTest', 'textImeClientSetExtraConfigNull_0100 START');

      let strJson: string = getInspectorByKey('TextInput_imeClient_setExtraConfig_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextEditMenuOptionsNullTest', 'textImeClientSetExtraConfigNull_0100 END');
    });

    /**
     * @tc.name   textImeClientSetExtraConfigUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_IMECLIENT_SETEXTRACONFIG_UNDEFINED_PARAM_001
     * @tc.desc   Test IMEClient setExtraConfig with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textImeClientSetExtraConfigUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextEditMenuOptionsNullTest', 'textImeClientSetExtraConfigUndefined_0100 START');

      let strJson: string = getInspectorByKey('TextInput_imeClient_setExtraConfig_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextEditMenuOptionsNullTest', 'textImeClientSetExtraConfigUndefined_0100 END');
    });
  })
}
