'use static';
/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}


export default function sliderJsunit() {

  describe('SliderTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/Slider',
      }
      try {
        const slider = AppStorage.get<Router>("router") as Router
        slider.clear();
        let pages:router.RouterState = slider.getState();
        console.info("get Slider state success " + JSON.stringify(pages));
        if (!("Slider" == pages.name)) {
          console.info("get Slider state success " + JSON.stringify(pages.name));
          slider.pushUrl(options);
        }
      } catch (err) {
        console.error("push Slider page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Slider after each called");
    });


    
    
    /**
     * @tc.number   testGetSliderAttr010_static
     * @tc.name     testGetSliderAttr010_static
     * @tc.desc     testGetSliderAttr010_static
     * @tc.level    Level.LEVEL1
     */
it('testGetSliderAttr010_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSliderAttr1 START');
      let strJson = inspector.getInspectorByKey('slider1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      console.info("component obj is  Slider: " + JSON.stringify(obj.getElement('$attrs').getElement('constructor')));
      expect(obj.getElement('$attrs').getString('showTips')).assertEqual("false");
      expect(obj.getElement('$attrs').getString('showSteps')).assertEqual("false");
      expect(obj.getElement('$attrs').getElement('constructor').getString('value')).assertEqual(40.000000.toFixed(6));
      expect(obj.getElement('$attrs').getElement('constructor').getString('min')).assertEqual(0.000000.toFixed(6));
      expect(obj.getElement('$attrs').getElement('constructor').getString('max')).assertEqual(100.000000.toFixed(6));
      expect(obj.getElement('$attrs').getElement('constructor').getString('step')).assertEqual(1.000000.toFixed(6));
      expect(obj.getElement('$attrs').getString('style')).assertEqual("SliderStyle.OutSet");
      console.info('testGetSliderAttr1 END');
      done();
    });



    
    
    /**
     * @tc.number   testGetSliderAttr020_static
     * @tc.name     testGetSliderAttr020_static
     * @tc.desc     testGetSliderAttr020_static
     * @tc.level    Level.LEVEL1
     */
it('testGetSliderAttr020_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetSliderAttr2 START');
      let strJson = inspector.getInspectorByKey('slider2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
      expect(obj.getElement('$attrs').getString('showSteps')).assertEqual("true")
      expect(obj.getElement('$attrs').getString('style')).assertEqual("SliderStyle.InSet")
      console.info('testGetSliderAttr2 END');
      done();
    });
  })
}
