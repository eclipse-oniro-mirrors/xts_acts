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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function buttonFontColorNullTest() {
  describe('buttonFontColorNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonFontColorNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonNull/ButtonFontColorNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonFontColorNullTest state pages:" + JSON.stringify(pages));
        if (!("ButtonFontColorNullTest" == pages.name)) {
          console.info("get buttonFontColorNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push buttonFontColorNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonFontColorNullTest page error:" + err);
        expect().assertFail();
      }
      console.info("buttonFontColorNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   buttonFontColor_Null_001
     * @tc.number SUB_ARKUI_BUTTON_FONTCOLOR_PARAM_001
     * @tc.desc   Test Button fontColor with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontColor_Null_001', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontColor_Null_001 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontColor).assertEqual('#FFFFFFFF');

      console.info('buttonFontColor_Null_001 END');
      done();
    });

    /**
     * @tc.name   buttonFontColor_Undefined_002
     * @tc.number SUB_ARKUI_BUTTON_FONTCOLOR_PARAM_002
     * @tc.desc   Test Button fontColor with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontColor_Undefined_002', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontColor_Undefined_002 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontColor).assertEqual('#FFFFFFFF');

      console.info('buttonFontColor_Undefined_002 END');
      done();
    });

  })
}