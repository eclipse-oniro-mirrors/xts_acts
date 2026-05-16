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

export default function TextMethodsNull2Test() {
  describe('TextMethodsNull2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMethodsNull2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMethodsNull2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMethodsNull2Test state pages: " + JSON.stringify(pages));
        if (!("TextMethodsNull2" == pages.name)) {
          console.info("get TextMethodsNull2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMethodsNull2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMethodsNull2Test page error: " + err);
      }
      done();
    })

    // ==================== getGlyphPositionAtCoordinate 方法测试 ====================

    /**
     * @tc.name   textGetGlyphPositionAtCoordinateNullX_0100
     * @tc.number SUB_ARKUI_TEXT_GETGLYPHPOSITIONATCOORDINATE_NULL_X_PARAM_001
     * @tc.desc   Test Text getGlyphPositionAtCoordinate method with null x parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textGetGlyphPositionAtCoordinateNullX_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateNullX_0100 START');
      let strJson: string = getInspectorByKey('text_getGlyphPositionAtCoordinate_null_x');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('getGlyphPositionAtCoordinate: success');
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateNullX_0100 END');
    });

    /**
     * @tc.name   textGetGlyphPositionAtCoordinateUndefinedX_0100
     * @tc.number SUB_ARKUI_TEXT_GETGLYPHPOSITIONATCOORDINATE_UNDEFINED_X_PARAM_001
     * @tc.desc   Test Text getGlyphPositionAtCoordinate method with undefined x parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textGetGlyphPositionAtCoordinateUndefinedX_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateUndefinedX_0100 START');

      let strJson: string = getInspectorByKey('text_getGlyphPositionAtCoordinate_undefined_x');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('getGlyphPositionAtCoordinate: success');
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateUndefinedX_0100 END');
    });

    /**
     * @tc.name   textGetGlyphPositionAtCoordinateNullY_0100
     * @tc.number SUB_ARKUI_TEXT_GETGLYPHPOSITIONATCOORDINATE_NULL_Y_PARAM_001
     * @tc.desc   Test Text getGlyphPositionAtCoordinate method with null y parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textGetGlyphPositionAtCoordinateNullY_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateNullY_0100 START');

      let strJson: string = getInspectorByKey('text_getGlyphPositionAtCoordinate_null_y');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('getGlyphPositionAtCoordinate: success');
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateNullY_0100 END');
    });

    /**
     * @tc.name   textGetGlyphPositionAtCoordinateUndefinedY_0100
     * @tc.number SUB_ARKUI_TEXT_GETGLYPHPOSITIONATCOORDINATE_UNDEFINED_Y_PARAM_001
     * @tc.desc   Test Text getGlyphPositionAtCoordinate method with undefined y parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textGetGlyphPositionAtCoordinateUndefinedY_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateUndefinedY_0100 START');

      let strJson: string = getInspectorByKey('text_getGlyphPositionAtCoordinate_undefined_y');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('getGlyphPositionAtCoordinate: success');
      console.info('TextMethodsNull2Test', 'textGetGlyphPositionAtCoordinateUndefinedY_0100 END');
    });

    // ==================== getRectsForRange 方法测试 ====================

    /**
     * @tc.name   textGetRectsForRangeNullRange_0100
     * @tc.number SUB_ARKUI_TEXT_GETRECTSFORRANGE_NULL_RANGE_PARAM_001
     * @tc.desc   Test Text getRectsForRange method with null range parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textGetRectsForRangeNullRange_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textGetRectsForRangeNullRange_0100 START');

      let strJson: string = getInspectorByKey('text_getRectsForRange_null_range');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('getRectsForRange: success');
      console.info('TextMethodsNull2Test', 'textGetRectsForRangeNullRange_0100 END');
    });

    /**
     * @tc.name   textGetRectsForRangeUndefinedRange_0100
     * @tc.number SUB_ARKUI_TEXT_GETRECTSFORRANGE_UNDEFINED_RANGE_PARAM_001
     * @tc.desc   Test Text getRectsForRange method with undefined range parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textGetRectsForRangeUndefinedRange_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textGetRectsForRangeUndefinedRange_0100 START');

      let strJson: string = getInspectorByKey('text_getRectsForRange_undefined_range');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('getRectsForRange: success');
      console.info('TextMethodsNull2Test', 'textGetRectsForRangeUndefinedRange_0100 END');
    });

    // ==================== TextMenuItemId.of 方法测试 ====================

    /**
     * @tc.name   textTextMenuItemIdOfNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTMENUITEMID_OF_NULL_PARAM_001
     * @tc.desc   Test TextMenuItemId.of method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextMenuItemIdOfNull_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdOfNull_0100 START');

      let strJson: string = getInspectorByKey('text_TextMenuItemId_of_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('TextMenuItemId.of: success');
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdOfNull_0100 END');
    });

    /**
     * @tc.name   textTextMenuItemIdOfUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTMENUITEMID_OF_UNDEFINED_PARAM_001
     * @tc.desc   Test TextMenuItemId.of method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextMenuItemIdOfUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdOfUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_TextMenuItemId_of_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('TextMenuItemId.of: success');
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdOfUndefined_0100 END');
    });

    /**
     * @tc.name   textTextMenuItemIdOfEmpty_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTMENUITEMID_OF_EMPTY_PARAM_001
     * @tc.desc   Test TextMenuItemId.of method with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextMenuItemIdOfEmpty_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdOfEmpty_0100 START');

      let strJson: string = getInspectorByKey('text_TextMenuItemId_of_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('TextMenuItemId.of: success');
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdOfEmpty_0100 END');
    });

    // ==================== TextMenuItemId.equals 方法测试 ====================

    /**
     * @tc.name   textTextMenuItemIdEqualsNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTMENUITEMID_EQUALS_NULL_PARAM_001
     * @tc.desc   Test TextMenuItemId.equals method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextMenuItemIdEqualsNull_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdEqualsNull_0100 START');

      let strJson: string = getInspectorByKey('text_TextMenuItemId_equals_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertContain('TextMenuItemId.equals: error: Cannot read property id_ of null');
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdEqualsNull_0100 END');
    });

    /**
     * @tc.name   textTextMenuItemIdEqualsUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTMENUITEMID_EQUALS_UNDEFINED_PARAM_001
     * @tc.desc   Test TextMenuItemId.equals method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTextMenuItemIdEqualsUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdEqualsUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_TextMenuItemId_equals_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('TextMenuItemId.equals: error: Cannot read property id_ of undefined');
      console.info('TextMethodsNull2Test', 'textTextMenuItemIdEqualsUndefined_0100 END');
    });

    // ==================== onCreateMenu 方法测试 ====================

    /**
     * @tc.name   textOnCreateMenuNull_0100
     * @tc.number SUB_ARKUI_TEXT_ONCREATEMENU_NULL_PARAM_001
     * @tc.desc   Test Text onCreateMenu method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textOnCreateMenuNull_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textOnCreateMenuNull_0100 START');

      let strJson: string = getInspectorByKey('text_onCreateMenu_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('onCreateMenu null test');
      console.info('TextMethodsNull2Test', 'textOnCreateMenuNull_0100 END');
    });

    /**
     * @tc.name   textOnCreateMenuUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ONCREATEMENU_UNDEFINED_PARAM_001
     * @tc.desc   Test Text onCreateMenu method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textOnCreateMenuUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextMethodsNull2Test', 'textOnCreateMenuUndefined_0100 START');
      let strJson: string = getInspectorByKey('text_onCreateMenu_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('onCreateMenu undefined test');
      console.info('TextMethodsNull2Test', 'textOnCreateMenuUndefined_0100 END');
    });
  });
}
