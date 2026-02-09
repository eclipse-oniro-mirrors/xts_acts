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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
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
import Utils from "../../../ets/MainAbility/common/Utils";
import { Axis, SliderStyle } from '@ohos.arkui.component';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

const waitUiReadyMs = 1000

export default function sliderJsunitSliderTest() {
  describe("sliderJsunitSliderTestSliderTest", () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("sliderJsunitSliderTest beforeEach start")
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SliderC/slider",
      }

      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages: router.RouterState = router.getState();
        console.info("[sliderJsunitSliderTest] current page is: " + JSON.stringify(pages.name));
        if (!('slider' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err: Error) {
        console.info("push sliderJsunitSliderTest page page error " + JSON.stringify(err));
      }
      await sleep(2);
    })
    
    /**
     * @tc.number   sliderJsunitSliderTest_static_0100
     * @tc.name     sliderJsunitSliderTest_static_0100
     * @tc.desc     sliderJsunitSliderTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0100 START")
      await CommonFunc.sleep(1000)
      // get the slider component with no parameter and test attribute
      let strJson = inspector.getInspectorByKey("sliderConstructor2")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0100 component obj is: " +
        obj.getElement('$attrs').getString('style')
      )
      expect(obj.getElement('$attrs').getString('style')).assertEqual("SliderStyle.OutSet")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0200
     * @tc.name     sliderJsunitSliderTest_static_0200
     * @tc.desc     sliderJsunitSliderTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0200 START")
      // get the slider component with parameter and test attribute
      let strJson = inspector.getInspectorByKey("sliderConstructor")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0200 component obj is: " +
        obj.getElement('$attrs').getString('style') +
          "---" +
        obj.getElement('$attrs').getElement('constructor').getString('direction') +
          "--" +
        obj.getElement('$attrs').getElement('constructor').getString('value') +
          "---" +
        obj.getElement('$attrs').getElement('constructor').getString('reverse') +
          "----" +
        obj.getElement('$attrs').getElement('constructor').getString('min') +
          "----" +
        obj.getElement('$attrs').getElement('constructor').getString('max') +
          "---" +
        obj.getElement('$attrs').getElement('constructor').getString('step') +
          "---" +
        JSON.stringify(obj.getElement('$attrs').getElement('constructor'))
      )
      expect(obj.getElement('$attrs').getString('style')).assertEqual("SliderStyle.InSet")
      expect(obj.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual(
        "Axis.Vertical"
      )
      expect(obj.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("40.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('reverse')).assertEqual("true")
      expect(obj.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("2.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("1000.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("0.700000")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0300
     * @tc.name     sliderJsunitSliderTest_static_0300
     * @tc.desc     sliderJsunitSliderTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0300 START")
      await CommonFunc.sleep(1000)
      // get the slider component attribute
      let strJson = inspector.getInspectorByKey("sliderA")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0300 component obj is: " +
        obj.getElement('$attrs').getString('blockColor') +
          "---" +
        obj.getElement('$attrs').getString('trackColor') +
          "--" +
        obj.getElement('$attrs').getString('selectedColor') +
          "---" +
        obj.getElement('$attrs').getString('showSteps') +
          "----" +
        obj.getElement('$attrs').getString('showTips') +
          "----" +
        obj.getElement('$attrs').getString('trackThickness') +
          "--" +
        obj.getElement('$attrs').getString('selectedColor')
      )
      expect(obj.getElement('$attrs').getString('blockColor')).assertEqual("#FF191970")
      expect(obj.getElement('$attrs').getString('trackColor')).assertEqual("#FFADD8E6")
      expect(obj.getElement('$attrs').getString('showSteps')).assertEqual("true")
      expect(obj.getElement('$attrs').getString('showTips')).assertEqual("true")
      expect(obj.getElement('$attrs').getString('trackThickness')).assertEqual("10.00px")
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FF191970")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0400
     * @tc.name     sliderJsunitSliderTest_static_0400
     * @tc.desc     sliderJsunitSliderTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0400 START")
      // modify the Color attribute normal value of slider dynamically
      AppStorage.setOrCreate<string>("blockColor","#FFFFFF")

      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("trackColor","#EEFFFF")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("selectedColor","#AEFFFF")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("trackThickness","12.00px")
      await CommonFunc.sleep(200)
      // get the slider component attribute
      let strJson = inspector.getInspectorByKey("sliderA")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0400 component obj is: " +
        obj.getElement('$attrs').getString('blockColor') +
          "---" +
        obj.getElement('$attrs').getString('trackColor') +
          "--" +
        obj.getElement('$attrs').getString('selectedColor') +
          "---" +
        obj.getElement('$attrs').getString('trackThickness')
      )
      expect(obj.getElement('$attrs').getString('blockColor')).assertEqual("#FFFFFFFF")
      expect(obj.getElement('$attrs').getString('trackColor')).assertEqual("#FFEEFFFF")
      expect(obj.getElement('$attrs').getString('trackThickness')).assertEqual("12.00px")
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFAEFFFF")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0500
     * @tc.name     sliderJsunitSliderTest_static_0500
     * @tc.desc     sliderJsunitSliderTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0500 START")
      // modify the Color attribute normal value of slider dynamically

      AppStorage.setOrCreate<string>("blockColor","rgb(238, 130, 238)")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("trackColor","rgb(238, 130, 238)")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("selectedColor","rgb(238, 130, 238)")
      await CommonFunc.sleep(200)
      // get the slider component attribute
      let strJson = inspector.getInspectorByKey("sliderA")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0500 component obj is: " +
        obj.getElement('$attrs').getString('blockColor') +
          "---" +
        obj.getElement('$attrs').getString('trackColor') +
          "--" +
        obj.getElement('$attrs').getString('selectedColor') +
          "--"
      )
      expect(obj.getElement('$attrs').getString('blockColor')).assertEqual("#FFEE82EE")
      expect(obj.getElement('$attrs').getString('trackColor')).assertEqual("#FFEE82EE")
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFEE82EE")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0600
     * @tc.name     sliderJsunitSliderTest_static_0600
     * @tc.desc     sliderJsunitSliderTest_static_0600
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0600 START")
      // modify the Color attribute illegal value of slider dynamically

      AppStorage.setOrCreate<string>("blockColor","#ACE")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("trackColor","#ACE")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("selectedColor","#ACE")
      await CommonFunc.sleep(200)

      AppStorage.setOrCreate<string>("trackThickness","-px")
      await CommonFunc.sleep(200)
      // get the slider component attribute
      let strJson = inspector.getInspectorByKey("sliderA")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0600 component obj is: " +
        obj.getElement('$attrs').getString('blockColor') +
          "---" +
        obj.getElement('$attrs').getString('trackColor') +
          "--" +
        obj.getElement('$attrs').getString('selectedColor') +
          "---" +
        obj.getElement('$attrs').getString('trackThickness')
      )
      expect(obj.getElement('$attrs').getString('blockColor')).assertEqual("#FFAACCEE")
      expect(obj.getElement('$attrs').getString('trackColor')).assertEqual("#FFAACCEE")
      expect(obj.getElement('$attrs').getString('trackThickness')).assertEqual("4.00vp")
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFAACCEE")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0700
     * @tc.name     sliderJsunitSliderTest_static_0700
     * @tc.desc     sliderJsunitSliderTest_static_0700
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("sliderJsunitSliderTest_static_0700 START")
      // modify the constructor attribute of slider dynamically
      AppStorage.setOrCreate<number>("vInSetValueOne",30)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<SliderStyle>("style",SliderStyle.OutSet)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<Axis>("directionT",Axis.Horizontal)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<boolean>("reverse",false)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("min",20)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("max",80)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("step",0.9)
      await CommonFunc.sleep(2000)
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey("sliderConstructor")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "sliderJsunitSliderTest_static_0700 component obj is: " +
        obj.getElement('$attrs').getString('style') +
          "---" +
        obj.getElement('$attrs').getElement('constructor').getString('direction') +
          "--" +
        obj.getElement('$attrs').getElement('constructor').getString('value') +
          "---" +
        obj.getElement('$attrs').getElement('constructor').getString('reverse') +
          "----" +
        obj.getElement('$attrs').getElement('constructor').getString('min') +
          "----" +
        obj.getElement('$attrs').getElement('constructor').getString('max') +
          "---" +
        obj.getElement('$attrs').getElement('constructor').getString('step')
      )
      expect(obj.getElement('$attrs').getString('style')).assertEqual("SliderStyle.OutSet")
      expect(obj.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual(
        "Axis.Horizontal"
      )
      expect(obj.getElement('$attrs').getElement('constructor').getString('reverse')).assertEqual("false")
      expect(obj.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("20.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("80.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("0.900000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("30.000000")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0800
     * @tc.name     sliderJsunitSliderTest_static_0800
     * @tc.desc     sliderJsunitSliderTest_static_0800
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Verify the swipe function of slider component
      console.info("sliderJsunitSliderTest_static_0800 START")

      AppStorage.setOrCreate<number>("vInSetValueOne",30)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<SliderStyle>("style",SliderStyle.OutSet)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<Axis>("directionT",Axis.Horizontal)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<boolean>("reverse",false)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("min",20)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("max",80)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("step",0.9)
      await CommonFunc.sleep(2000)

      let driver = Driver.create()
      let slider = await driver.findComponent(ON.id('sliderConstructor'));
      let rect = await (slider?.getBounds() as Promise<Rect>);

      let top = rect.top
      let bottom = rect.bottom
      let left = rect.left
      let right = rect.right
      let x = Math.round(left + (right - left) / 2).toInt()
      let y = Math.round(top + (bottom - top) / 2).toInt()

      await driver.delayMs(waitUiReadyMs)
      await driver.swipe(left, y, x, y)

      await driver.delayMs(waitUiReadyMs)
      let strJson = inspector.getInspectorByKey("tex")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "[sliderJsunitSliderTest_static_0800] obj: " + JSON.stringify(obj)
      )
      console.info("[sliderJsunitSliderTest_static_0800] obj.getElement('$attrs').getString('content'): " +
      JSON.stringify(obj.getElement('$attrs').getString('content')))
      expect(Math.round(Number(obj.getElement('$attrs').getString('content')))).assertEqual(50)
      let strJson1 = inspector.getInspectorByKey("modeT")
      let obj1 = JSON.parseJsonElement(strJson1)
      console.info(
        "[sliderJsunitSliderTest_static_0800] obj1: " +
        JSON.stringify(obj1)
      )
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("mode")
      done()
    })
    /**
     * @tc.number   sliderJsunitSliderTest_static_0900
     * @tc.name     sliderJsunitSliderTest_static_0900
     * @tc.desc     sliderJsunitSliderTest_static_0900
     * @tc.level    Level.LEVEL1
     */
    it("sliderJsunitSliderTest_static_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[sliderJsunitSliderTest_static_0800] START")

      AppStorage.setOrCreate<number>("vInSetValueOne",-30)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<boolean>("reverse",false)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<SliderStyle>("style",SliderStyle.OutSet)
      await CommonFunc.sleep(1000)

      AppStorage.setOrCreate<Axis>("directionT",Axis.Horizontal)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("min",-20)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("max",1000)
      await CommonFunc.sleep(1000)
      AppStorage.setOrCreate<number>("step",10007)
      await CommonFunc.sleep(2000)
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey("sliderConstructor")
      let obj = JSON.parseJsonElement(strJson)
      console.info(
        "[sliderJsunitSliderTest_static_0900] component obj is: " +
        obj.getElement('$attrs').getString('style') +
        obj.getElement('$attrs').getElement('constructor').getString('direction') +
        obj.getElement('$attrs').getElement('constructor').getString('value') +
        obj.getElement('$attrs').getElement('constructor').getString('reverse') +
        obj.getElement('$attrs').getElement('constructor').getString('min') +
        obj.getElement('$attrs').getElement('constructor').getString('max') +
        obj.getElement('$attrs').getElement('constructor').getString('step')
      )
      expect(obj.getElement('$attrs').getString('style')).assertEqual("SliderStyle.OutSet")
      expect(obj.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual(
        "Axis.Horizontal"
      )
      expect(obj.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("20.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('reverse')).assertEqual("false")
      expect(obj.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("-20.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("1000.000000")
      expect(obj.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("1.000000")
      console.info("[sliderJsunitSliderTest_static_0900] END")
      done()
    })
  })
}