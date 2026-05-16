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

export default function TextLayoutManagerMethodsTest() {
  describe('TextLayoutManagerMethodsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextLayoutManagerMethodsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextLayoutManagerMethods',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextLayoutManagerMethodsTest state pages: " + JSON.stringify(pages));
        if (!("TextLayoutManagerMethods" == pages.name)) {
          console.info("get TextLayoutManagerMethodsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextLayoutManagerMethodsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextLayoutManagerMethodsTest page error: " + err);
      }
      done();
    })

    // ==================== getCharacterPositionAtCoordinate 方法测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0100
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0100
     * @tc.desc   Test LayoutManager getCharacterPositionAtCoordinate method with null x parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0100 START');

      let strJson: string = getInspectorByKey('text_getCharacterPositionAtCoordinate_null_x');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterPositionAtCoordinate null X: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0200
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0200
     * @tc.desc   Test LayoutManager getCharacterPositionAtCoordinate method with undefined x parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0200 START');

      let strJson: string = getInspectorByKey('text_getCharacterPositionAtCoordinate_undefined_x');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterPositionAtCoordinate undefined X: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0300
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0300
     * @tc.desc   Test LayoutManager getCharacterPositionAtCoordinate method with null y parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0300 START');

      let strJson: string = getInspectorByKey('text_getCharacterPositionAtCoordinate_null_y');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterPositionAtCoordinate null Y: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0400
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0400
     * @tc.desc   Test LayoutManager getCharacterPositionAtCoordinate method with undefined y parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0400 START');

      let strJson: string = getInspectorByKey('text_getCharacterPositionAtCoordinate_undefined_y');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterPositionAtCoordinate undefined Y: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0500
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0500
     * @tc.desc   Test LayoutManager getCharacterPositionAtCoordinate method returns undefined when unbound
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0500 START');

      let strJson: string = getInspectorByKey('text_getCharacterPositionAtCoordinate_unbound');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterPositionAtCoordinate unbound: {"position":0,"affinity":0}');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0600
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0600
     * @tc.desc   Test LayoutManager getCharacterPositionAtCoordinate method with normal return (all properties)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0600 START');

      let strJson: string = getInspectorByKey('text_getCharacterPositionAtCoordinate_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterPositionAtCoordinate normal: position:0,affinity:0');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERPOSITIONATCOORDINATE_PARAM_0600 END');
    });

    // ==================== getGlyphRangeForCharacterRange 方法测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0100
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0100
     * @tc.desc   Test LayoutManager getGlyphRangeForCharacterRange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0100 START');

      let strJson: string = getInspectorByKey('text_getGlyphRangeForCharacterRange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getGlyphRangeForCharacterRange null: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0200
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0200
     * @tc.desc   Test LayoutManager getGlyphRangeForCharacterRange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0200 START');

      let strJson: string = getInspectorByKey('text_getGlyphRangeForCharacterRange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getGlyphRangeForCharacterRange undefined: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0300
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0300
     * @tc.desc   Test LayoutManager getGlyphRangeForCharacterRange method with empty range (start:0, end:0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0300 START');

      let strJson: string = getInspectorByKey('text_getGlyphRangeForCharacterRange_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getGlyphRangeForCharacterRange empty: length:2');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0400
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0400
     * @tc.desc   Test LayoutManager getGlyphRangeForCharacterRange method with non-empty range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0400 START');

      let strJson: string = getInspectorByKey('text_getGlyphRangeForCharacterRange_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getGlyphRangeForCharacterRange normal: length:2');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0500
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0500
     * @tc.desc   Test LayoutManager getGlyphRangeForCharacterRange method returns undefined when unbound
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0500 START');

      let strJson: string = getInspectorByKey('text_getGlyphRangeForCharacterRange_unbound');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getGlyphRangeForCharacterRange unbound: success');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETGLYPHRANGEFORCHARACTERRANGE_PARAM_0500 END');
    });

    // ==================== getCharacterRangeForGlyphRange 方法测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0100
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0100
     * @tc.desc   Test LayoutManager getCharacterRangeForGlyphRange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0100 START');

      let strJson: string = getInspectorByKey('text_getCharacterRangeForGlyphRange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterRangeForGlyphRange null: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0200
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0200
     * @tc.desc   Test LayoutManager getCharacterRangeForGlyphRange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0200 START');

      let strJson: string = getInspectorByKey('text_getCharacterRangeForGlyphRange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterRangeForGlyphRange undefined: undefined');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0300
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0300
     * @tc.desc   Test LayoutManager getCharacterRangeForGlyphRange method with empty range (start:0, end:0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0300 START');

      let strJson: string = getInspectorByKey('text_getCharacterRangeForGlyphRange_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterRangeForGlyphRange empty: length:2');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0400
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0400
     * @tc.desc   Test LayoutManager getCharacterRangeForGlyphRange method with non-empty range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0400 START');

      let strJson: string = getInspectorByKey('text_getCharacterRangeForGlyphRange_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterRangeForGlyphRange normal: length:2');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0500
     * @tc.number SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0500
     * @tc.desc   Test LayoutManager getCharacterRangeForGlyphRange method returns undefined when unbound
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0500 START');

      let strJson: string = getInspectorByKey('text_getCharacterRangeForGlyphRange_unbound');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.content).assertEqual('getCharacterRangeForGlyphRange unbound: success');
      console.info('SUB_ARKUI_TEXT_LAYOUTMANAGER_GETCHARACTERRANGEFORGLYPHRANGE_PARAM_0500 END');
    });
  });
}