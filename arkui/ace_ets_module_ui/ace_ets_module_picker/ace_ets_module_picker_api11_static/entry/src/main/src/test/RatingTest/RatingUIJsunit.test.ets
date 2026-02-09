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
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Rect } from '@ohos.UiTest';
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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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


export default function RatingUIJsunit() {
  describe('RatingUIJsunit', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RatingUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/RatingPage',
      }

      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = router.getState();
        console.info("[RatingUIJsunit] current page is: " + JSON.stringify(pages.name));
        if (!('RatingPage' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.info("push RatingUIJsunit page page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      console.info('[datepicker] after each called');
      const router = AppStorage.get<Router>("router") as Router
      router.clear();
      await sleep(1)
    });

    
    
    /**
     * @tc.number   RatingUIJsunit_static_0100
     * @tc.name     RatingUIJsunit_static_0100
     * @tc.desc     RatingUIJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the information of the Rating component
      console.info('[RatingUIJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[RatingUIJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('rating')).assertEqual('3.500000');
      expect(obj.getElement('$attrs').getString('indicator')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('stars')).assertEqual('5');
      expect(obj.getElement('$attrs').getString('stepSize')).assertEqual('0.500000');
      expect(obj.getElement('$attrs').getString('starStyle')).assertEqual('{"backgroundUri":"resources/base/media/star_1.png","foregroundUri":"resources/base/media/star_2.png","secondaryUri":"resources/base/media/star_3.png"}');
      console.info('[RatingUIJsunit_static_0100] END');
      done();
    });


    
    
    /**
     * @tc.number   RatingUIJsunit_static_0200
     * @tc.name     RatingUIJsunit_static_0200
     * @tc.desc     RatingUIJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the rating value of the Rating component
      console.info('[RatingUIJsunit_static_0200] START');
  AppStorage.setOrCreate<number>('rating',1)
      await CommonFunc.sleep(2000);
      // Get the rating value of the Rating component
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[RatingUIJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('rating')).assertEqual('1.000000');
      await CommonFunc.sleep(1000);
      console.info('[RatingUIJsunit_static_0200] END');
      done();
    });

    
    
    /**
     * @tc.number   RatingUIJsunit_static_0300
     * @tc.name     RatingUIJsunit_static_0300
     * @tc.desc     RatingUIJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the indicator value of the Rating component
      console.info('[RatingUIJsunit_static_0300] START');
  AppStorage.setOrCreate<boolean>('indicator1',false)
      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      // Get the indicator value of the Rating component
      let strJson = inspector.getInspectorByKey('ratingBtn');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[RatingUIJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('indicator')).assertEqual('false');

      // Verify that click cannot be modified the rating value of the Rating component
      let rating = await driver.findComponent(ON.id('ratingBtn'));

      console.info(`rating ` + JSON.stringify(rating))
      let rect = await (rating?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left.toInt()+Math.round((rect.right-rect.left)/2).toInt()-1,Math.round((rect.top+rect.bottom)/2).toInt())
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/2)-1,Math.round((rect.top+rect.bottom)/2))
      await CommonFunc.sleep(1000);
      // Verify the rating value of the Rating component
      let strJson1 = inspector.getInspectorByKey('ratingBtn');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[RatingUIJsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('rating')).assertEqual('2.500000');
      console.info('[RatingUIJsunit_static_0300] END');
      done();
    });


    
    
    /**
     * @tc.number   RatingUIJsunit_static_0400
     * @tc.name     RatingUIJsunit_static_0400
     * @tc.desc     RatingUIJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the stars value of the Rating component
      console.info('[RatingUIJsunit_static_0400] START');
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<int>('stars',7)
      await CommonFunc.sleep(2000);
      // Get the stars value of the Rating component
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[RatingUIJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('stars')).assertEqual('7');
      console.info('[RatingUIJsunit_static_0400] END');
      done();
    });


    
    
    /**
     * @tc.number   RatingUIJsunit_static_0500
     * @tc.name     RatingUIJsunit_static_0500
     * @tc.desc     RatingUIJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the stepSize value of the Rating component
      console.info('[RatingUIJsunit_static_0500] START');
  AppStorage.setOrCreate<number>('stepSize',1)
      await CommonFunc.sleep(2000);
      // Get the stepSize value of the Rating component
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[RatingUIJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('stepSize')).assertEqual('1.000000');
      await CommonFunc.sleep(1000);
      console.info('[RatingUIJsunit_static_0500] END');
      done();
    });
    
    
    /**
     * @tc.number   RatingUIJsunit_static_0600
     * @tc.name     RatingUIJsunit_static_0600
     * @tc.desc     RatingUIJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify onChange event of the Rating component
      console.info('[RatingUIJsunit_static_0600] START');
      await CommonFunc.sleep(1000);
      // Modify the indicator value of the Rating component
      AppStorage.setOrCreate<number>('rating',1)
      await CommonFunc.sleep(1000);
      AppStorage.setOrCreate<boolean>('indicator',false)
      await CommonFunc.sleep(2000);

      let driver = Driver.create()
      let textComponent1 = await driver.findComponent(ON.id('text'));
      let text1 = await (textComponent1?.getText() as Promise<string>);
      console.info("[RatingUIJsunit_static_0600] text1: " + JSON.stringify(text1));
      // Get the rating value of the Rating component
      let strJson1 = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[RatingUIJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      let rating1 = obj.getElement('$attrs').getString('rating')
      console.info("[RatingUIJsunit_static_0600] rating1: " + rating1);

      // Get the component Rating and click
      let textComponent = await driver.findComponent(ON.id('rating1'));
      await (textComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('rating1');
      let obj2 = JSON.parseJsonElement(strJson2);
      let rating2 = obj2.getElement('$attrs').getString('rating')
      console.info("[RatingUIJsunit_static_0600] rating2: " + rating2);
      expect(rating1 == rating2).assertFalse();

      let textComponent2 = await driver.findComponent(ON.id('text'));
      let text2 = await (textComponent2?.getText() as Promise<string>);
      console.info("[RatingUIJsunit_static_0600] text2: " + JSON.stringify(text2));
      expect(text2).assertEqual('change succ');
      console.info('[RatingUIJsunit_static_0600] END');
      done();
    });


    
    
    /**
     * @tc.number   RatingUIJsunit_static_0700
     * @tc.name     RatingUIJsunit_static_0700
     * @tc.desc     RatingUIJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('RatingUIJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the default value of the Rating component
      console.info('[RatingUIJsunit_static_0700] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('rating');
      let obj = JSON.parseJsonElement(strJson)
      console.info("[RatingUIJsunit_static_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('rating')).assertEqual('0.000000');
      expect(obj.getElement('$attrs').getString('indicator')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('stars')).assertEqual('5');
      expect(obj.getElement('$attrs').getString('stepSize')).assertEqual('0.500000');
      console.info('[RatingUIJsunit_static_0700] END');
      done();
    });
  })
}
