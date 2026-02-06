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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonV2Test() {
  describe('SegmentButtonV2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonV2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButtonV2/SegmentButtonV2Test',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SegmentButtonV2Test state pages: " + JSON.stringify(pages));
        if (!('SegmentButtonV2Test' == pages.name)) {
          console.info("get SegmentButtonV2Test pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonV2Test page result successful");
        }
      } catch (err) {
        console.error("push SegmentButtonV2Test page error: " + err);
        expect().assertFail();
      }
      await CommonFunc.sleep(1000);
      console.info('SegmentButtonV2Test beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SegmentButtonV2Test after each called');
    });

    /**
     * @tc.name   SegmentButtonV2Test_0100
     * @tc.number SegmentButtonV2Test_0100
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0100", "START");
        let tabSegmentButton: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0100", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_0100 itemSelectedFontSize ", tabSegmentButton.$attrs.fontSize)
        console.log("SegmentButtonV2Test_0100 itemSelectedFontWeight ", tabSegmentButton.$attrs.fontWeight)
        expect(tabSegmentButton.$attrs.fontSize).assertEqual('18.00fp');
        expect(tabSegmentButton.$attrs.fontWeight).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0100", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0200
     * @tc.number SegmentButtonV2Test_0200
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0200", "START");
        let symbol: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[1]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0200 itemSymbolFontSize ", symbol.$attrs.fontSize)
        expect(symbol.$attrs.fontSize).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0200", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0300
     * @tc.number SegmentButtonV2Test_0300
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0300", "START");
        let imageSegment: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[2]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0300 itemIconSize ", imageSegment.$attrs.size.width)
        console.log("SegmentButtonV2Test_0300 itemSelectedIconFillColor ", imageSegment.$attrs.fillColor)
        expect(imageSegment.$attrs.size.width).assertEqual('30.00vp');
        expect(imageSegment.$attrs.fillColor).assertEqual('#FF000000');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0300", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0400
     * @tc.number SegmentButtonV2Test_0400
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0400", "START");
        let imageUnselected: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[2]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[1]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0400 itemIconFillColor ", imageUnselected.$attrs.fillColor)
        expect(imageUnselected.$attrs.fillColor).assertEqual('#99000000');
        console.log("SegmentButtonV2Test_0400", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0500
     * @tc.number SegmentButtonV2Test_0500
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0500", "START");
        let symbol: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[1]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0500 itemSymbolFontSize ", symbol.$attrs.fontSize)
        expect(symbol.$attrs.fontSize).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0500", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0600
     * @tc.number SegmentButtonV2Test_0600
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0600", "START");
        let itemMinHeight: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[2]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
        console.log("SegmentButtonV2Test_0600 itemMinHeight ", itemMinHeight.$attrs.height)
        let height :number = Number(itemMinHeight.$attrs.height.split('.')[0])
        expect(Math.floor(Math.abs(height-80))<=1).assertEqual(true)
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0600", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0700
     * @tc.number SegmentButtonV2Test_0700
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0700", "START");
        let tabSegmentButton: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0700", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_0700 itemSelectedFontSize ", tabSegmentButton.$attrs.padding)
        console.log("SegmentButtonV2Test_0700 itemSelectedFontWeight ", tabSegmentButton.$attrs.shadow.color)
        expect(tabSegmentButton.$attrs.padding).assertEqual('30.00vp');
        expect(tabSegmentButton.$attrs.shadow.color).assertEqual('#FF000000');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0100", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0800
     * @tc.number SegmentButtonV2Test_0800
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0800", "START");
        let tabSegmentButton: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0800", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_0800 buttonBackgroundColor ", tabSegmentButton.$attrs.backgroundColor)
        expect(tabSegmentButton.$attrs.backgroundColor).assertEqual('#FF00FF00');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0800", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0900
     * @tc.number SegmentButtonV2Test_0900
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0700", "START");
        let tabSegmentButton: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
        console.log("SegmentButtonV2Test_0900", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_0900 buttonBackgroundBlurStyle ",
          tabSegmentButton.$attrs.backgroundBlurStyle.value)
        console.log("SegmentButtonV2Test_0900 buttonBackgroundBlurStyleOptions ",
          tabSegmentButton.$attrs.backgroundBlurStyle.options.colorMode)
        expect(tabSegmentButton.$attrs.backgroundBlurStyle.value).assertEqual('BlurStyle.Thin');
        expect(tabSegmentButton.$attrs.backgroundBlurStyle.options.colorMode).assertEqual('ThemeColorMode.System');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0900", "END");
        done();
      });

    /**
     * @tc.name   SegmentButtonV2Test_0110
     * @tc.number SegmentButtonV2Test_0110
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentButtonV2Test_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("SegmentButtonV2Test_0110", "START");
        let tabSegmentButton: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[5]
        console.log("SegmentButtonV2Test_0110", JSON.stringify(tabSegmentButton))
        console.log("SegmentButtonV2Test_0110 buttonPadding ", tabSegmentButton.$attrs.padding)
        expect(tabSegmentButton.$attrs.padding).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("SegmentButtonV2Test_0110", "END");
        done();
      });

  })
}