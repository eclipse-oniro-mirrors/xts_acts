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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';
export default function sliderTest() {
    describe('sliderJsunit', () => {
      beforeEach(async (done: Function) => {
        console.info("sliderJsunit beforeEach start");
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/slider',
        }
        let result: ESObject;
        try {
          router.clear();
          let pages = router.getState();
          console.info("get slider state pages: " + JSON.stringify(pages));
          if (!("slider" == pages.name)) {
            console.info("get slider state pages.name: " + JSON.stringify(pages.name));
            result = await router.push(options);
            await Utils.sleep(2000);
            console.info("push slider page result: " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push slider page error: " + err);
        }
        done()
      })

    /**
     * @tc.number ArkUX_Stage_Slider_blockBorderColor_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_blockBorderColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0100 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_blockBorderWidth_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0100 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_stepColor_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_stepColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0100 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_trackBorderRadius_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0100 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_blockSize_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_blockSize_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockSize_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSize_0100  is " + JSON.stringify(obj.$attrs.blockSize));
          let width: string = obj.$attrs.blockSize.width ;
          let height: string = obj.$attrs.blockSize.height ;
          expect(parseFloat(width)).assertEqual(12);
          expect(parseFloat(height)).assertEqual(12);
          expect(width.substr(width.length-2, 2)).assertEqual("vp");
          expect(height.substr(height.length-2, 2)).assertEqual("vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_stepSize_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_stepSize_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_stepSize_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0100 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("0.00vp");
          done();
        } catch (err) {
          console.info('ArkUX_Stage_Slider_stepSize_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_blockStyle_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_blockStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockStyle_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0100 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_blockColor_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_blockColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_blockColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockColor_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockColor_0100 is" + JSON.stringify(obj.$attrs.blockColor));
          expect(obj.$attrs.blockColor).assertEqual("#FF0000FF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockColor_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_trackColor_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_trackColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackColor_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackColor_0100 is" + JSON.stringify(obj.$attrs.trackColor));
          expect(obj.$attrs.trackColor).assertEqual("#FF808080");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackColor_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_selectedColor_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_selectedColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_selectedColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_selectedColor_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_selectedColor_0100 is" + JSON.stringify(obj.$attrs.selectedColor));
          expect(obj.$attrs.selectedColor).assertEqual("#FF0000FF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_selectedColor_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_showSteps_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_showSteps_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_showSteps_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_showSteps_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_showSteps_0100 is" + JSON.stringify(obj.$attrs.showSteps));
          expect(obj.$attrs.showSteps).assertEqual("true");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_showSteps_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_showTips_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_showTips_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_showTips_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_showTips_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_showTips_0100 is" + JSON.stringify(obj.$attrs.showTips));
          expect(obj.$attrs.showTips).assertEqual("true");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_showTips_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /**
     * @tc.number ArkUX_Stage_Slider_trackThickness_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Slider_trackThickness_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUX_Stage_Slider_trackThickness_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackThickness_0100');
          let obj: ESObject = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackThickness_0100 is" + JSON.stringify(obj.$attrs.trackThickness));
          expect(obj.$attrs.trackThickness).assertEqual("1.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackThickness_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })
  })
}
