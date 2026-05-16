/**
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function slidenullundeifned(){
  describe('slidenullundeifned',  () =>{
    beforeEach(async (done: Function) => {
      console.info("slidenullundeifned beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sliderNull/sliderNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get slider state success " + JSON.stringify(pages));
        if (!("sliderNull" == pages.name)) {
          console.info("get slider state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push slidenullundeifned page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push slidenullundeifned page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("slidenullundeifned after each called");
    });

    /**
     * @tc.name   slidenull_001
     * @tc.number SUB_ARKUI_API_SLIDE_NULL_001
     * @tc.desc   Test Stack alignContent with null parameter in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('slidenull_001', Level.LEVEL0, async (done:Function) =>{
        let tagName = 'slidenullundeifned';
        let driver = await Driver.create()
        await Utils.sleep(1000);
        let resource = getInspectorByKey('slidernull');
        expect(JSON.parse(resource).$attrs.showTips).assertEqual('false')
        expect(JSON.parse(resource).$attrs.showSteps).assertEqual('false')
        expect(JSON.parse(resource).$attrs.blockStyle).assertEqual(undefined)
        expect(JSON.parse(resource).$attrs.trackThickness).assertEqual('4.00vp')
        expect(JSON.parse(resource).$attrs.selectedBorderRadius).assertEqual(undefined)
        expect(JSON.parse(resource).$attrs.minResponsiveDistance).assertEqual('0.000000')
        expect(JSON.parse(resource).$attrs.slideRange).assertEqual(undefined)
        expect(JSON.parse(resource).$attrs.prefix).assertEqual(undefined)
        expect(JSON.parse(resource).$attrs.suffix).assertEqual(undefined)
        expect(JSON.parse(resource).$attrs.minResponsiveDistance).assertEqual('0.000000')
        expect(JSON.parse(resource).$attrs.minLabel).assertEqual(undefined)
        expect(JSON.parse(resource).$attrs.maxLabel).assertEqual(undefined)
        // expect(JSON.parse(resource).$attrs.blockSize).assertEqual('4.00vp')
        await Utils.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
    })

    /**
     * @tc.name   slideundefined_001
     * @tc.number SUB_ARKUI_API_SLIDE_UNDEFINED_001
     * @tc.desc   Test Stack alignContent with null parameter in constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('slideundefined_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'slidenullundeifned';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      // let resource = getInspectorByKey('slidernull');
      let resource = getInspectorByKey('sliderundefined');
      // let data1 = JSON.parse(resource).$attrs.showTips;
      expect(JSON.parse(resource).$attrs.showTips).assertEqual('false')
      expect(JSON.parse(resource).$attrs.showSteps).assertEqual('false')
      expect(JSON.parse(resource).$attrs.blockStyle).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.trackThickness).assertEqual('4.00vp')
      expect(JSON.parse(resource).$attrs.selectedBorderRadius).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.minResponsiveDistance).assertEqual('0.000000')
      expect(JSON.parse(resource).$attrs.slideRange).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.prefix).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.suffix).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.minResponsiveDistance).assertEqual('0.000000')
      expect(JSON.parse(resource).$attrs.minLabel).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.maxLabel).assertEqual(undefined)
      await Utils.sleep(2000);
      console.info('[' + tagName + '] END ===========================');
      done();
    })
  })
}