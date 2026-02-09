'use static';
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

import accessibility from '@ohos.accessibility';
import componentUtils from '@ohos.arkui.componentUtils';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { BusinessError } from '@ohos.base';

let componentUtils = new ComponentUtils()
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function comSizeAbilityTest_11() {
  describe('comSizeAbilityTest_11', () => {
    beforeAll(async (): Promise<void> => {
      console.info("comSizeAbilityTest_11 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
    });
    beforeEach(() => {
      console.info("comSizeAbilityTest_11 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_11'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_11 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_11 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)
          // await CommonFunc.sleep(1000);
          // console.info("push comSizeAbilityTest_11 success: " + JSON.stringify(result))
        }
      } catch (err) {
        console.error("push comSizeAbilityTest_11 page error: " + err)
        expect().assertFail()
      }
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_29
     * @tc.name     comSizeAbilityTestJsunit_static_29
     * @tc.desc     comSizeAbilityTestJsunit_static_29
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_29', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_29 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      await CommonFunc.sleep(1000);
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("QRCode_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("QRCode_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('QRCode_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_29] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_29] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_29] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_29] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_29] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_29] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_29] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_29] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_29] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(210))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(132))) <= 1).assertTrue();
      // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Translate.x)).assertEqual('1');
      expect(JSON.stringify(Translate.y)).assertEqual('1');
      expect(JSON.stringify(Translate.z)).assertEqual('1');
      // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Scale.x)).assertEqual('1');
      expect(JSON.stringify(Scale.y)).assertEqual('1');
      expect(JSON.stringify(Scale.z)).assertEqual('1');
      expect(JSON.stringify(Scale.centerX)).assertEqual('1');
      expect(JSON.stringify(Scale.centerY)).assertEqual('1');
      // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate.x)).assertEqual('1');
      expect(JSON.stringify(Rotate.y)).assertEqual('1');
      expect(JSON.stringify(Rotate.z)).assertEqual('1');
      expect(JSON.stringify(Rotate.angle)).assertEqual('0');
      expect(JSON.stringify(Rotate.centerX)).assertEqual('1');
      expect(JSON.stringify(Rotate.centerY)).assertEqual('1');
      // expect(JSON.stringify(Transform)).assertEqual('[[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]]');
      console.info('[comSizeAbilityTestJsunit_static_29] END')
      await CommonFunc.sleep(1000);
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_30
     * @tc.name     comSizeAbilityTestJsunit_static_30
     * @tc.desc     comSizeAbilityTestJsunit_static_30
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_30', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_30 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      await CommonFunc.sleep(1000);
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Radio_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Radio_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Radio_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_30] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_30] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_30] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_30] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_30] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_30] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_30] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_30] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_30] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(185))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(140))) <= 1).assertTrue();
      // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Translate.x)).assertEqual('1');
      expect(JSON.stringify(Translate.y)).assertEqual('1');
      expect(JSON.stringify(Translate.z)).assertEqual('1');
      // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Scale.x)).assertEqual('1');
      expect(JSON.stringify(Scale.y)).assertEqual('1');
      expect(JSON.stringify(Scale.z)).assertEqual('1');
      expect(JSON.stringify(Scale.centerX)).assertEqual('1');
      expect(JSON.stringify(Scale.centerY)).assertEqual('1');
      // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate.x)).assertEqual('1');
      expect(JSON.stringify(Rotate.y)).assertEqual('1');
      expect(JSON.stringify(Rotate.z)).assertEqual('1');
      expect(JSON.stringify(Rotate.angle)).assertEqual('0');
      expect(JSON.stringify(Rotate.centerX)).assertEqual('1');
      expect(JSON.stringify(Rotate.centerY)).assertEqual('1');
      // expect(JSON.stringify(Transform)).assertEqual('[[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]]');
      console.info('[comSizeAbilityTestJsunit_static_30] END')
      await CommonFunc.sleep(1000);
      done()
    })
  })
}