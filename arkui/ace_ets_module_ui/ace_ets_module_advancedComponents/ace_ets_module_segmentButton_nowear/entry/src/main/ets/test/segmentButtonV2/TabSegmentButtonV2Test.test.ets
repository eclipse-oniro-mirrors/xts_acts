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

export default function TabSegmentButtonV2Test() {
  describe('TabSegmentButtonV2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("TabSegmentButtonV2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButtonV2/TabSegmentButtonV2Example',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabSegmentButtonV2Test state pages: " + JSON.stringify(pages));
        if (!('TabSegmentButtonV2Example' == pages.name)) {
          console.info("get TabSegmentButtonV2Test pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabSegmentButtonV2Test page result successful");
        }
      } catch (err) {
        console.error("push TabSegmentButtonV2Test page error: " + err);
        expect().assertFail();
      }
      await CommonFunc.sleep(1000);
      console.info('TabSegmentButtonV2Test beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TabSegmentButtonV2Test after each called');
    });

    /**
     * @tc.name   TabSegmentButtonV2Test_0100
     * @tc.number TabSegmentButtonV2Test_0100
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TabSegmentButtonV2Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0100", "START");
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
        console.log("TabSegmentButtonV2Test_0100", JSON.stringify(tabSegmentButton))
        console.log("TabSegmentButtonV2Test_0100 itemMinFontScale ", tabSegmentButton.$attrs.minFontScale)
        console.log("TabSegmentButtonV2Test_0100 itemMaxFontScale ", tabSegmentButton.$attrs.maxFontScale)
        console.log("TabSegmentButtonV2Test_0100 itemSelectedFontSize ", tabSegmentButton.$attrs.fontSize)
        console.log("TabSegmentButtonV2Test_0100 itemSelectedFontColor ", tabSegmentButton.$attrs.fontColor)
        console.log("TabSegmentButtonV2Test_0100 itemSelectedFontWeight ", tabSegmentButton.$attrs.fontWeight)
        expect(tabSegmentButton.$attrs.minFontScale).assertEqual('0.500000');
        expect(tabSegmentButton.$attrs.maxFontScale).assertEqual('1.200000');
        expect(tabSegmentButton.$attrs.fontSize).assertEqual('18.00fp');
        expect(tabSegmentButton.$attrs.fontColor).assertEqual('#FF0000FF');
        expect(tabSegmentButton.$attrs.fontWeight).assertEqual('FontWeight.Medium');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0100", "END");
        done();
      });


     /**
      * @tc.name   TabSegmentButtonV2Test_0110
      * @tc.number TabSegmentButtonV2Test_0110
      * @tc.desc   Test SegmentButton page
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('TabSegmentButtonV2Test_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0110", "START");
        let borderRadius: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
        console.log("TabSegmentButtonV2Test_0110 itemBorderRadius ", borderRadius.$attrs.borderRadius.bottomLeft)
        expect(borderRadius.$attrs.borderRadius.bottomLeft).assertEqual('10.00px');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0110", "END");
        done();
      });

      /**
       * @tc.name   TabSegmentButtonV2Test_0120
       * @tc.number TabSegmentButtonV2Test_0120
       * @tc.desc   Test SegmentButton page
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('TabSegmentButtonV2Test_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0120", "START");
        let itemSpace: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
          .$children[0]
          await CommonFunc.sleep(500);
          let itemUnselected: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
            .$children[0]
            .$children[0]
            .$children[0]
            .$children[0]
            .$children[0]
            .$children[5]
            .$children[1]
            .$children[0]
            .$children[0]
          console.log("TabSegmentButtonV2Test_0120 itemSpace ", itemSpace.$attrs.space)
          console.log("TabSegmentButtonV2Test_0120 itemFontSize ", itemUnselected.$attrs.fontSize)
          console.log("TabSegmentButtonV2Test_0120 itemFontColor ", itemUnselected.$attrs.fontColor)
          console.log("TabSegmentButtonV2Test_0120 itemFontWeight ", itemUnselected.$attrs.fontWeight)
          expect(itemSpace.$attrs.space).assertEqual('2.00vp');
          expect(itemUnselected.$attrs.fontSize).assertEqual('15.00fp');
          expect(itemUnselected.$attrs.fontColor).assertEqual('#FFFFC0CB');
          expect(itemUnselected.$attrs.fontWeight).assertEqual('FontWeight.Medium');
          await CommonFunc.sleep(500);
          console.log("TabSegmentButtonV2Test_0120", "END");
          done();
      });

      /**
       * @tc.name   TabSegmentButtonV2Test_0130
       * @tc.number TabSegmentButtonV2Test_0130
       * @tc.desc   Test SegmentButton page
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('TabSegmentButtonV2Test_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0130", "START");
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
        console.log("TabSegmentButtonV2Test_0130 itemSymbolFontSize ", symbol.$attrs.fontSize)
        expect(symbol.$attrs.fontSize).assertEqual('20.00fp');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0130", "END");
        done();
      });


      /**
       * @tc.name   TabSegmentButtonV2Test_0140
       * @tc.number TabSegmentButtonV2Test_0140
       * @tc.desc   Test SegmentButton page
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('TabSegmentButtonV2Test_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0140", "START");
        let itemMinHeight: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0]
          .$children[0]
          .$children[2]
          .$children[0]
          .$children[0]
          .$children[5]
          .$children[0]
        console.log("TabSegmentButtonV2Test_0140 itemMinHeight ", itemMinHeight.$attrs.height)
        let height :number = Number(itemMinHeight.$attrs.height.split('.')[0])
        expect(Math.floor(Math.abs(height-80))<=1).assertEqual(true)
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0140", "END");
        done();
      });

      /**
       * @tc.name   TabSegmentButtonV2Test_0150
       * @tc.number TabSegmentButtonV2Test_0150
       * @tc.desc   Test SegmentButton page
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('TabSegmentButtonV2Test_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0150", "START");
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
        console.log("TabSegmentButtonV2Test_0150 itemIconSize ", imageSegment.$attrs.size.width)
        console.log("TabSegmentButtonV2Test_0150 itemSelectedIconFillColor ", imageSegment.$attrs.fillColor)
        expect(imageSegment.$attrs.size.width).assertEqual('30.00vp');
        expect(imageSegment.$attrs.fillColor).assertEqual('#FF000000');
        await CommonFunc.sleep(500);
        console.log("TabSegmentButtonV2Test_0150", "END");
        done();
      });

      /**
       * @tc.name   TabSegmentButtonV2Test_0160
       * @tc.number TabSegmentButtonV2Test_0160
       * @tc.desc   Test SegmentButton page
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('TabSegmentButtonV2Test_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.log("TabSegmentButtonV2Test_0160", "START");
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
        console.log("TabSegmentButtonV2Test_0160 itemIconFillColor ", imageUnselected.$attrs.fillColor)
        expect(imageUnselected.$attrs.fillColor).assertEqual('#99000000');
        console.log("TabSegmentButtonV2Test_0160", "END");
        done();
      });
  })
}