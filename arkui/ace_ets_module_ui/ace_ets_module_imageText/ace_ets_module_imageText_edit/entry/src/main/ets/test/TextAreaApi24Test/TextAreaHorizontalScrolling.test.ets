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

export default function TextAreaHorizontalScrollingTest() {
  describe('TextAreaHorizontalScrollingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaHorizontalScrollingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi24/TextAreaHorizontalScrolling',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaHorizontalScrollingTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaHorizontalScrolling" == pages.name)) {
          console.info("get TextAreaHorizontalScrollingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaHorizontalScrollingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaHorizontalScrollingTest page error: " + err);
      }
      done();
    })

    // ==================== horizontalScrolling 属性测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0100
     * @tc.number SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0100
     * @tc.desc   Test TextArea horizontalScrolling attribute with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0100 START');

      let strJson: string = getInspectorByKey('textArea_horizontalScrolling_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.horizontalScrolling).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0200
     * @tc.number SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0200
     * @tc.desc   Test TextArea horizontalScrolling attribute with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0200 START');

      let strJson: string = getInspectorByKey('textArea_horizontalScrolling_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.horizontalScrolling).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0300
     * @tc.number SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0300
     * @tc.desc   Test TextArea horizontalScrolling attribute with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0300 START');

      let strJson: string = getInspectorByKey('textArea_horizontalScrolling_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.horizontalScrolling).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0400
     * @tc.number SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0400
     * @tc.desc   Test TextArea horizontalScrolling attribute with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0400 START');

      let strJson: string = getInspectorByKey('textArea_horizontalScrolling_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.horizontalScrolling).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0500
     * @tc.number SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0500
     * @tc.desc   Test TextArea horizontalScrolling attribute with default value (no setting)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0500 START');

      let strJson: string = getInspectorByKey('textArea_horizontalScrolling_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.horizontalScrolling).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTAREA_HORIZONTALSCROLLING_PARAM_0500 END');
    });
  });
}
