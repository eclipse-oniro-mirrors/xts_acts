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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { RenderNode, DrawContext } from "@ohos.arkui.node"
import drawing from "@ohos.graphics.drawing"
import common2D from "@ohos.graphics.common2D"
import image from "@ohos.multimedia.image"
import text from "@ohos.graphics.text"
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

export default function graphicTextInterface(context, windowStage, abilityStorage) {
  describe('graphic_text_interface_test', function () {
    console.log('describe graphic_text_interface_test start!!!')

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    let pixel;
    beforeAll(async function () {
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
     * @tc.name      : testDecoration
     * @tc.desc      : To test interface Decoration.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDecoration', 1, async function () {
      let msg = "testDecoration"
      console.info(msg + 'begin');
      try {
        let decoration : text.Decoration = {
          textDecoration: text.TextDecorationType.UNDERLINE,
          color: {
            alpha: 255, red: 255, green: 0, blue: 0
          },
          decorationStyle : text.TextDecorationStyle.SOLID,
          decorationThicknessScale : 20
        };
      } catch (err) {
        console.info(msg + 'test Decoration error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_002
     * @tc.name      : testTextStyle
     * @tc.desc      : To test interface TextStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextStyle', 2, async function () {
      let msg = "testTextStyle"
      console.info(msg + 'begin');
      let decoration : text.Decoration = {
        textDecoration: text.TextDecorationType.UNDERLINE,
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        decorationStyle : text.TextDecorationStyle.SOLID,
        decorationThicknessScale : 20
      };
      try {
        let textStyle : text.TextStyle = {
          decoration: decoration,
          color: {
            alpha: 255, red: 255, green: 0, blue: 0
          },
          fontWeight : text.FontWeight.W100,
          baseline : text.TextBaseline.ALPHABETIC,
          fontFamilies : Array<string>("123"),
          fontSize : 30,
          letterSpacing : 20,
          wordSpacing : 20,
          heightScale : 20,
          halfLeading : true,
          heightOnly : true,
          ellipsis : "456",
          ellipsisMode : text.EllipsisMode.START,
          locale : "789"
        };
      } catch (err) {
        console.info(msg + 'test TextStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_003
     * @tc.name      : testParagraphStyle
     * @tc.desc      : To test interface ParagraphStyle.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testParagraphStyle', 3, async function () {
      let msg = "testParagraphStyle"
      console.info(msg + 'begin');
      let decoration : text.Decoration = {
        textDecoration: text.TextDecorationType.UNDERLINE,
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        decorationStyle : text.TextDecorationStyle.SOLID,
        decorationThicknessScale : 20
      };
      let textStyle : text.TextStyle = {
        decoration: decoration,
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        fontWeight : text.FontWeight.W100,
        baseline : text.TextBaseline.ALPHABETIC,
        fontFamilies : Array<string>("123"),
        fontSize : 30,
        letterSpacing : 20,
        wordSpacing : 20,
        heightScale : 20,
        halfLeading : true,
        heightOnly : true,
        ellipsis : '456',
        ellipsisMode : text.EllipsisMode.START,
        locale : '789'
      };
      try {
        let paragraphStyle: text.ParagraphStyle = {
          textStyle: textStyle,
          textDirection: text.TextDirection.RTL,
          align: text.TextAlign.LEFT,
          wordBreak: text.WordBreak.NORMAL,
          maxLines: 20,
          breakStrategy: text.BreakStrategy.GREEDY
        };
      } catch (err) {
        console.info(msg + 'test ParagraphStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_004
     * @tc.name      : testPlaceholderSpan
     * @tc.desc      : To test interface PlaceholderSpan.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPlaceholderSpan', 4, async function () {
      let msg = "testPlaceholderSpan"
      console.info(msg + 'begin');
      try {
        let placeholderSpan: text.PlaceholderSpan = {
          width: 12,
          height: 21,
          align: text.PlaceholderAlignment.ABOVE_BASELINE,
          baseline: text.TextBaseline.ALPHABETIC,
          baselineOffset: 66
        };
        placeholderSpan.width = 0;
        expect(0).assertEqual(placeholderSpan.width);
      } catch (err) {
        console.info(msg + 'test PlaceholderSpan error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_005
     * @tc.name      : testRange
     * @tc.desc      : To test interface Range.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testRange', 5, async function () {
      let msg = "testRange"
      console.info(msg + 'begin');
      try {
        let range: text.Range = {
          start: 50,
          end: 100
        };
        range.start = 0;
        expect(0).assertEqual(range.start);
      } catch (err) {
        console.info(msg + 'test Range error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_006
     * @tc.name      : testTextBox
     * @tc.desc      : To test interface TextBox.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextBox', 6, async function () {
      let msg = "testTextBox"
      console.info(msg + 'begin');
      try {
        let textBox: text.TextBox = {
          rect : {
            left : 200, right : 500, top : 300, bottom : 900
          },
          direction: text.TextDirection.RTL
        };
        textBox.direction = text.TextDirection.LTR;
        expect(1).assertEqual(textBox.direction);
      } catch (err) {
        console.info(msg + 'test TextBox error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_007
     * @tc.name      : testPositionWithAffinity
     * @tc.desc      : To test interface PositionWithAffinity.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPositionWithAffinity', 7, async function () {
      let msg = "testPositionWithAffinity"
      console.info(msg + 'begin');
      try {
        let positionWithAffinity: text.PositionWithAffinity = {
          position: 20,
          affinity: text.Affinity.UPSTREAM
        };
      } catch (err) {
        console.info(msg + 'test PositionWithAffinity error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
  })
}