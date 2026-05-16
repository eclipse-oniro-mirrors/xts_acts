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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RatingAdvancedTest() {
  describe('RatingAdvancedTest', () => {

    beforeAll(() => {
      console.info("RatingAdvancedTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("RatingAdvancedTest beforeAll end");
    });

    const routerPush = async (target:string) => {
      let options:router.RouterOptions = {
        url: `MainAbility/pages/Rating/ratingAdvanced/${target}`,
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(`MainAbility/pages/Rating/ratingAdvanced/${target}` == pages.name)) {
          routerInstance.pushUrl(options);
          // let result =  await routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info(`push ${target} page result:` + JSON.stringify(result));
          let pages = routerInstance.getState();
          expect(pages.name).assertContain(target)
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RatingAdvancedTest after each called");
    });

     
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010] START');
      await routerPush("rating01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating01')) as Component;
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      let strJson1 = inspector.getInspectorByKey('ratingText01');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('2');
      await driver.click(rect.left + Math.round((rect.right-rect.left)/8*3)+1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+ Math.round((rect.right-rect.left)/8*3)+1 ,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('ratingText01');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0010] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertContain('4');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] START');
      await routerPush("rating02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating02')) as Component;
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))

      let strJson1 = inspector.getInspectorByKey('ratingText02');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('0');
      let strJson2 = inspector.getInspectorByKey('rating02');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('stars'));
      expect(obj2.getElement('$attrs').getString('stars')).assertEqual("5");
      await driver.click(rect.left+1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('ratingText02');
      let obj3 = JSON.parseJsonElement(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj3.getElement('$attrs').getString('content') is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertContain('1.5');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0030
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0030
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0030
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0030', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0030] START');
      await routerPush("rating03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating03')) as Component;
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))

      let strJson1 = inspector.getInspectorByKey('ratingText03');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0030] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('-1');
      let strJson2 = inspector.getInspectorByKey('rating03');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj2.getElement('$attrs').getString('stars') is: " + obj2.getElement('$attrs').getString('stars'));
      expect(obj2.getElement('$attrs').getString('stars')).assertEqual("5");

      await driver.click(rect.left+1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))

      await Utils.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('ratingText03');
      let obj3 = JSON.parseJsonElement(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj3.getElement('$attrs').getString('content') is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertContain('0.5');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040] START');
      await routerPush("rating04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating04')) as Component;
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ratingText04');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('6');
      await driver.click(rect.right-1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      await Utils.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('ratingText04');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0040] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertContain('10');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0050
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0050', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0050] START');
      await routerPush("rating05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('ratingText05');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0050] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('8');
      let strJson2 = inspector.getInspectorByKey('rating05');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj2.getElement('$attrs').getString('stars') is: " + obj2.getElement('$attrs').getString('stars'));
      expect(obj2.getElement('$attrs').getString('stars')).assertEqual("7");
      let btn1 = await driver.findComponent(ON.id('rating05')) as Component;
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+1 as int, Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('ratingText05');
      let obj3 = JSON.parseJsonElement(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0020] obj3.getElement('$attrs').getString('content') is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertContain('0.5');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060] START');
      await routerPush("rating06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating06')) as Component;
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ratingText06');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('0.3');
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0060] END');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070] START');
      await routerPush("rating07")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ratingButton07')) as Component;
      await btn1!.click()
      let btn2 = await driver.findComponent(ON.id('rating07')) as Component;
      await btn2!.click()
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ratingText07');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070] obj1 is: " + JSON.stringifyJsonElement(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('1');
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070] END');
      await btn1.click()
      let rect = await btn2.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/2)-1 as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/2)-1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('ratingText07');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070] obj2 is: " + JSON.stringifyJsonElement(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0070] obj2.getElement('$attrs').getString('content') is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertContain('2.5');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080] START');
      await routerPush("rating08")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ratingButton08_1')) as Component;
      await btn1!.click()

      let btn2 = await driver.findComponent(ON.id('ratingButton08_2')) as Component;
      await btn2!.click()
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('rating08');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080] obj1.getElement('$attrs').getString('stars') is: " + obj1.getElement('$attrs').getString('stars'));
      expect(obj1.getElement('$attrs').getString('stars')).assertContain('4');

      let btn3 = await driver.findComponent(ON.id('ratingButton08_3')) as Component;
      await btn3!.click()
      await Utils.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('rating08');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0080] obj2.getElement('$attrs').getString('stars') is: " + obj2.getElement('$attrs').getString('stars'));
      expect(obj2.getElement('$attrs').getString('stars')).assertContain('5');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200] START');
      await routerPush("rating10")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('circle10')) as Component;
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200] btn1 is: " + JSON.stringify(btn1));
      await btn1!.click()
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210] click btn1 done");
      let strJson1 = inspector.getInspectorByKey('ratingText10');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0200] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("can't click rating");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210', Level.LEVEL3, async (done: () => void): Promise<void> =>    {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210] START');
      await routerPush("rating11")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('circle11')) as Component;
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210] btn1 is: " + JSON.stringify(btn1));
      await btn1!.click()
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210] click btn1 done");

      let strJson1 = inspector.getInspectorByKey('ratingText11');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_static_0210] obj1.getElement('$attrs').getString('content') is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("can't click rating");
      done();
    });
  })
}


