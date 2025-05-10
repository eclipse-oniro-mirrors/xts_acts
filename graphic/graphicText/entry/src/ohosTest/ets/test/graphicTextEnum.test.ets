/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { RenderNode, DrawContext } from "@ohos.arkui.node"
import drawing from "@ohos.graphics.drawing"
import common2D from "@ohos.graphics.common2D"
import image from "@ohos.multimedia.image"
import text from "@ohos.graphics.text"
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

export default function graphicTextEnum() {
  describe('graphic_text_enum_test', ()=> {
    console.log('describe graphic_text_enum_test start!!!')

    let pixel:image.PixelMap;
    beforeAll(async ()=> {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 40000为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100//100为创建的PixelMap的宽高
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testEnumRectWidthStyle
     * @tc.desc      : To test the enum value of RectWidthStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRectWidthStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testRectWidthStyle"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.RectWidthStyle.TIGHT);
        expect(1).assertEqual(text.RectWidthStyle.MAX);
      } catch (err) {
        console.info(msg + 'test enum value of RectWidthStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_002
     * @tc.name      : testEnumRectHeightStyle
     * @tc.desc      : To test the enum value of RectHeightStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRectHeightStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testRectHeightStyle"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.RectHeightStyle.TIGHT);
        expect(1).assertEqual(text.RectHeightStyle.MAX);
        expect(2).assertEqual(text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE);
        expect(3).assertEqual(text.RectHeightStyle.INCLUDE_LINE_SPACE_TOP);
        expect(4).assertEqual(text.RectHeightStyle.INCLUDE_LINE_SPACE_BOTTOM);
        expect(5).assertEqual(text.RectHeightStyle.STRUT);
      } catch (err) {
        console.info(msg + 'test enum value of RectHeightStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_003
     * @tc.name      : testEnumAffinity
     * @tc.desc      : To test the enum value of Affinity.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testAffinity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testAffinity"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.Affinity.UPSTREAM);
        expect(1).assertEqual(text.Affinity.DOWNSTREAM);
      } catch (err) {
        console.info(msg + 'test enum value of Affinity error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_004
     * @tc.name      : testEnumTextAlign
     * @tc.desc      : To test the enum value of TextAlign.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextAlign', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextAlign"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.TextAlign.LEFT);
        expect(1).assertEqual(text.TextAlign.RIGHT);
        expect(2).assertEqual(text.TextAlign.CENTER);
        expect(3).assertEqual(text.TextAlign.JUSTIFY);
        expect(4).assertEqual(text.TextAlign.START);
        expect(5).assertEqual(text.TextAlign.END);
      } catch (err) {
        console.info(msg + 'test enum value of TextAlign error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_005
     * @tc.name      : testEnumTextDirection
     * @tc.desc      : To test the enum value of TextDirection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextDirection"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.TextDirection.RTL);
        expect(1).assertEqual(text.TextDirection.LTR);
      } catch (err) {
        console.info(msg + 'test enum value of TextDirection error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_006
     * @tc.name      : testEnumBreakStrategy
     * @tc.desc      : To test the enum value of BreakStrategy.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testBreakStrategy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testBreakStrategy"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.BreakStrategy.GREEDY);
        expect(1).assertEqual(text.BreakStrategy.HIGH_QUALITY);
        expect(2).assertEqual(text.BreakStrategy.BALANCED);
      } catch (err) {
        console.info(msg + 'test enum value of BreakStrategy error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_007
     * @tc.name      : testEnumWordBreak
     * @tc.desc      : To test the enum value of WordBreak.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWordBreak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testWordBreak"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.WordBreak.NORMAL);
        expect(1).assertEqual(text.WordBreak.BREAK_ALL);
        expect(2).assertEqual(text.WordBreak.BREAK_WORD);
      } catch (err) {
        console.info(msg + 'test enum value of WordBreak error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_008
     * @tc.name      : testEnumTextDecorationType
     * @tc.desc      : To test the enum value of TextDecorationType.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextDecorationType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextDecorationType"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.TextDecorationType.NONE);
        expect(1).assertEqual(text.TextDecorationType.UNDERLINE);
        expect(2).assertEqual(text.TextDecorationType.OVERLINE);
        expect(4).assertEqual(text.TextDecorationType.LINE_THROUGH);
      } catch (err) {
        console.info(msg + 'test enum value of TextDecorationType error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_009
     * @tc.name      : testEnumTextDecorationStyle
     * @tc.desc      : To test the enum value of TextDecorationStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextDecorationStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextDecorationStyle"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.TextDecorationStyle.SOLID);
        expect(1).assertEqual(text.TextDecorationStyle.DOUBLE);
        expect(2).assertEqual(text.TextDecorationStyle.DOTTED);
        expect(3).assertEqual(text.TextDecorationStyle.DASHED);
        expect(4).assertEqual(text.TextDecorationStyle.WAVY);
      } catch (err) {
        console.info(msg + 'test enum value of TextDecorationStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_010
     * @tc.name      : testEnumFontWeight
     * @tc.desc      : To test the enum value of FontWeight.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFontWeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testFontWeight"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.FontWeight.W100);
        expect(1).assertEqual(text.FontWeight.W200);
        expect(2).assertEqual(text.FontWeight.W300);
        expect(3).assertEqual(text.FontWeight.W400);
        expect(4).assertEqual(text.FontWeight.W500);
        expect(5).assertEqual(text.FontWeight.W600);
        expect(6).assertEqual(text.FontWeight.W700);
        expect(7).assertEqual(text.FontWeight.W800);
        expect(8).assertEqual(text.FontWeight.W900);
      } catch (err) {
        console.info(msg + 'test enum value of FontWeight error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_011
     * @tc.name      : testEnumFontStyle
     * @tc.desc      : To test the enum value of FontStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFontStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testFontStyle"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.FontStyle.NORMAL);
        expect(1).assertEqual(text.FontStyle.ITALIC);
        expect(2).assertEqual(text.FontStyle.OBLIQUE);
      } catch (err) {
        console.info(msg + 'test enum value of FontStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_012
     * @tc.name      : testEnumTextBaseline
     * @tc.desc      : To test the enum value of TextBaseline.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextBaseline"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.TextBaseline.ALPHABETIC);
        expect(1).assertEqual(text.TextBaseline.IDEOGRAPHIC);
      } catch (err) {
        console.info(msg + 'test enum value of TextBaseline error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_013
     * @tc.name      : testEnumEllipsisMode
     * @tc.desc      : To test the enum value of EllipsisMode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testEllipsisMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testEllipsisMode"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.EllipsisMode.START);
        expect(1).assertEqual(text.EllipsisMode.MIDDLE);
        expect(2).assertEqual(text.EllipsisMode.END);
      } catch (err) {
        console.info(msg + 'test enum value of EllipsisMode error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_014
     * @tc.name      : testPlaceholderAlignment
     * @tc.desc      : To test the enum value of PlaceholderAlignment.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPlaceholderAlignment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testPlaceholderAlignment"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(text.PlaceholderAlignment.OFFSET_AT_BASELINE);
        expect(1).assertEqual(text.PlaceholderAlignment.ABOVE_BASELINE);
        expect(2).assertEqual(text.PlaceholderAlignment.BELOW_BASELINE);
        expect(3).assertEqual(text.PlaceholderAlignment.TOP_OF_ROW_BOX);
        expect(4).assertEqual(text.PlaceholderAlignment.BOTTOM_OF_ROW_BOX);
        expect(5).assertEqual(text.PlaceholderAlignment.CENTER_OF_ROW_BOX);
      } catch (err) {
        console.info(msg + 'test enum value of PlaceholderAlignment error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
  })
}