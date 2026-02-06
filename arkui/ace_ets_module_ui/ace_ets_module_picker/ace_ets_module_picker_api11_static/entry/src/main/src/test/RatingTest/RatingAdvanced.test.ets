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

export default function RatingAdvancedTest() {
  describe('RatingAdvancedTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    const routerPush = async (target:string) => {
      let options:router.RouterOptions = {
        url: `MainAbility/pages/Rating/ratingAdvanced/${target}`,
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          let result = routerInstance.pushUrl(options);
          await Utils.sleep(1000);
          console.info(`push ${target} page result:` + JSON.stringify(result));
          let pages = routerInstance.getState();
          expect(pages.name).assertContain(target)
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("RatingAdvancedTest after each called");
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0040
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0040', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0040] START');
      await routerPush("ratingFocus01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = inspector.getInspectorByKey('ratingFocusText01');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain("Rating is focusAble");
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0050
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0050', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0050] START');
      await routerPush("ratingFocus02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = inspector.getInspectorByKey('ratingFocusText02');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0050] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain("Rating is not focusAble");
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0060
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0060
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0060
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0060', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0060] START');
      await routerPush("ratingFocus03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = inspector.getInspectorByKey('ratingFocusText03');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0060] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain("Rating is focusAble");
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0070
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0070
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0070
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0070', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0070] START');
      await routerPush("ratingFocus04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = inspector.getInspectorByKey('ratingFocusText04');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0070] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain("Rating is not focusAble");
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0080
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0080
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0080
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0080', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0080] START');
      await routerPush("ratingFocus05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = inspector.getInspectorByKey('ratingFocusText05');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0080] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain("Rating is not focusAble");
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0090
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0090
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0090
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0090', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0090] START');
      await routerPush("ratingFocus06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = inspector.getInspectorByKey('ratingFocusText06');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_static_0090] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain("Rating is not focusAble");
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0010
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0010] START');
      await routerPush("rating01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating01'));
      await (btn1?.click() as Promise<void>)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ratingText01');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0010] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success rating');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0020
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0020
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0020
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0020', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0020] START');
      await routerPush("rating02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating02'));
      await (btn1?.click() as Promise<void>)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ratingText02');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0020] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('failed rating');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170] START');
      await routerPush("rating03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating03'));
      await (btn1?.click() as Promise<void>)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ratingText03');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('success rating');
      let strJson2 = inspector.getInspectorByKey('rating03');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_static_0170] obj2.getElement('$attrs').content is: " + obj2.getElement('$attrs').tryGetString('content'));
      expect(obj2.getElement('$attrs').getString('stepSize')).assertEqual('0.500000');
      done();
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010] START');
      await routerPush("rating04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('rating04');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010] obj1.getElement('$attrs').getString('width') is: " + obj1.getElement('$attrs').getString('width'));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0010] obj1.getElement('$attrs').getString('height') is: " + obj1.getElement('$attrs').getString('height'));
      expect(obj1.getElement('$attrs').getString('width')).assertEqual('300.00vp');
      expect(obj1.getElement('$attrs').getString('height')).assertEqual('300.00vp');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040] START');
      await routerPush("rating05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('rating05');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040] obj1.getElement('$attrs').getString('width') is: " + obj1.getElement('$attrs').getString('width'));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_static_0040] obj1.getElement('$attrs').getString('height') is: " + obj1.getElement('$attrs').getString('height'));
      expect(obj1.getElement('$attrs').getString('width')).assertEqual('180.00vp');
      expect(obj1.getElement('$attrs').getString('height')).assertEqual('60.00vp');
      done();
    });
  })
}


