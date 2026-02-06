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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

export default function sliderTest() {
  describe('sliderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("sliderJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get slider state pages: " + JSON.stringify(pages));
        if (!("slider" == pages.name)) {
          console.info("get slider state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push slider page error: " + err);
      }
      done()
    });

    /**
     * @tc.number ArkUX_Stage_Slider_010
     * @tc.name Test the properties of components
     * @tc.desc set stepSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_010', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_010 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_010 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.stepSize).assertEqual("1.00px");
      console.info('ArkUX_Stage_Slider_010 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_011
     * @tc.name Test the properties of components
     * @tc.desc set stepColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_011', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_011 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_011 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.stepColor).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_011 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_012
     * @tc.name Test the properties of components
     * @tc.desc set blockBorderWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_012', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_012 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_012 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.blockBorderWidth).assertEqual("50.00vp");
      console.info('ArkUX_Stage_Slider_012 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_013
     * @tc.name Test the properties of components
     * @tc.desc set trackBorderRadius values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_013', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_013 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_013 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.trackBorderRadius).assertEqual("30.00vp");
      console.info('ArkUX_Stage_Slider_013 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_014
     * @tc.name Test the properties of components
     * @tc.desc set showTips values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_014', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_014 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_014 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.showTips).assertEqual("true");
      console.info('ArkUX_Stage_Slider_014 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_015
     * @tc.name Test the properties of components
     * @tc.desc set blockBorderColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_015', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_015 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_015 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.blockBorderColor).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_015 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_017
     * @tc.name Test the properties of components
     * @tc.desc set blockSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_017', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_017 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_017 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.blockSize?.width).assertEqual('10.00px');
      expect(objNew.$attrs.blockSize?.height).assertEqual('10.00px');
      console.info('ArkUX_Stage_Slider_017 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_018
     * @tc.name Test the properties of components
     * @tc.desc set blockColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_018', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_018 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_018 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.blockColor).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_018 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_019
     * @tc.name Test the properties of components
     * @tc.desc set trackColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_019', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_019 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_019 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.trackColor).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_019 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_020
     * @tc.name Test the properties of components
     * @tc.desc set selectedColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_020', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_020 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_020 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.selectedColor).assertEqual("#FFFF0000");
      console.info('ArkUX_Stage_Slider_020 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_021
     * @tc.name Test the properties of components
     * @tc.desc set showSteps values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_021', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_021 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_021 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.showSteps).assertEqual("false");
      console.info('ArkUX_Stage_Slider_021 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_022
     * @tc.name Test the properties of components
     * @tc.desc set trackThickness values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_022', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_022 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_022 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.trackThickness).assertEqual('2.00px');
      console.info('ArkUX_Stage_Slider_022 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_023
     * @tc.name Test the properties of components
     * @tc.desc set blockType values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_023', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_023 START');
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_023 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
      console.info('ArkUX_Stage_Slider_023 END');
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Slider_0110
     * @tc.name Test the properties of components
     * @tc.desc Change stepSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_Slider_0110', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Slider_0110 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('slider');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUX_Stage_Slider_0110 component is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.stepSize).assertEqual("2.00px");
      console.info('ArkUX_Stage_Slider_0110 END');
      done();
    });

  })
}
