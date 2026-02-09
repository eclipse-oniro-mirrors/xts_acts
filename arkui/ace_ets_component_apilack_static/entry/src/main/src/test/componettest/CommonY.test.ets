'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';


let domain: number = 0x0000;
let tag: string = 'testTag';

export default function commonBackgroundBlurStyleJsunits() {
  describe('commonBackgroundBlurStyleTest1', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'pages/common',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get common state success " + JSON.stringify(pages));
        if (!("common" == pages.name)) {
          console.info("get common state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err: Error) {
        console.error("push common page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("commonBackgroundBlurStyle after each called");
    });


    
    /**
     * @tc.number   testcommonBackgroundBlurStyle_static_001
     * @tc.name     testcommonBackgroundBlurStyle_static_001
     * @tc.desc     testcommonBackgroundBlurStyle_static_001
     * @tc.level    Level.LEVEL0
     */
it('testcommonBackgroundBlurStyle_static_001', Level.LEVEL0, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('borderImageText');
      console.info("[testcommonBackgroundBlurStyle001] component borderImage strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      // let targetValue = {
      //   source: {
      //     angle: 90,
      //     direction: GradientDirection.Left,
      //     colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
      //   },
      //   slice: {
      //     top: 10, bottom: 10, left: 10, right: 10
      //   },
      //   width: {
      //     top: "10px", bottom: "10px", left: "10px", right: "10px"
      //   },
      //   repeat: RepeatMode.Stretch,
      //   fill: false
      // };
      expect(obj.getElement('$attrs').tryGetElement('borderImage')).assertEqual(undefined);
      console.info("[testcommonBackgroundBlurStyle001] borderImage value :" +
      JSON.stringify(obj.getElement('$attrs').tryGetElement('borderImage')
      ))
    });


    
    /**
     * @tc.number   testcommonBackgroundBlurStyle_static_002
     * @tc.name     testcommonBackgroundBlurStyle_static_002
     * @tc.desc     testcommonBackgroundBlurStyle_static_002
     * @tc.level    Level.LEVEL0
     */
it('testcommonBackgroundBlurStyle_static_002', Level.LEVEL0, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabIndexText');
      console.info("[testcommonBackgroundBlurStyle002] component tabIndex strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').tryGetDouble('tabIndex')).assertEqual(undefined);
      console.info("[testcommonBackgroundBlurStyle002] tabIndex value :" +
      obj.getElement('$attrs').getString('textAlign'));
    });


    
    /**
     * @tc.number   testcommonBackgroundBlurStyle_static_003
     * @tc.name     testcommonBackgroundBlurStyle_static_003
     * @tc.desc     testcommonBackgroundBlurStyle_static_003
     * @tc.level    Level.LEVEL0
     */
it('testcommonBackgroundBlurStyle_static_003', Level.LEVEL0, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('sepiaText');
      console.info("[testcommonBackgroundBlurStyle003] component sepia strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getDouble('sepia')).assertEqual(1);
      console.info("[testcommonBackgroundBlurStyle003] sepia value :" + obj.getElement('$attrs').getDouble('sepia'));
    });


    
    /**
     * @tc.number   testcommonBackgroundBlurStyle_static_004
     * @tc.name     testcommonBackgroundBlurStyle_static_004
     * @tc.desc     testcommonBackgroundBlurStyle_static_004
     * @tc.level    Level.LEVEL0
     */
it('testcommonBackgroundBlurStyle_static_004', Level.LEVEL0, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('alignRulesText');
      console.info("[testcommonBackgroundBlurStyle004] component alignRules strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      // let targetValue = {
      //   top: {
      //     anchor: 'target', align: VerticalAlign.Bottom
      //   },
      //   right: {
      //     anchor: "target", align: HorizontalAlign.Center
      //   }
      // };
      expect(obj.getElement('$attrs').tryGetElement('alignRules')).assertEqual(undefined);
      console.info("[testcommonBackgroundBlurStyle004] alignRules value :" +
      JSON.stringify(obj.getElement('$attrs').tryGetElement('alignRules')))
    });


    
    /**
     * @tc.number   testcommonBackgroundBlurStyle_static_005
     * @tc.name     testcommonBackgroundBlurStyle_static_005
     * @tc.desc     testcommonBackgroundBlurStyle_static_005
     * @tc.level    Level.LEVEL0
     */
it('testcommonBackgroundBlurStyle_static_005', Level.LEVEL0, async () => {
      console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('backgroundBlurStyleText');
      console.info("[testcommonBackgroundBlurStyle005] component backgroundBlurStyle strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').tryGetElement('backgroundBlurStyle')).assertEqual(undefined);
      console.info("[testcommonBackgroundBlurStyle005] backgroundBlurStyle value :" +
      obj.getElement('$attrs').getString('backgroundBlurStyle'));
    });


    
    /**
     * @tc.number   testcommonBackgroundBlurStyle_static_006
     * @tc.name     testcommonBackgroundBlurStyle_static_006
     * @tc.desc     testcommonBackgroundBlurStyle_static_006
     * @tc.level    Level.LEVEL0
     */
it('testcommonBackgroundBlurStyle_static_006', Level.LEVEL0, async () => {
      try {
        console.info('commonBackgroundBlurStyle testcommonBackgroundBlurStyle006 START');
        console.info("common onKeyEvent click result is: " +
        JSON.stringify(inspector.sendEventByKey('onKeyEventButton', 10, "")));
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testcommonHoverEffectHighlight_static_0001
     * @tc.name     testcommonHoverEffectHighlight_static_0001
     * @tc.desc     testcommonHoverEffectHighlight_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcommonHoverEffectHighlight_static_0001', Level.LEVEL0, async () => {
      console.info('commonHoverEffectHighlight testcommonHoverEffectHighlight0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('hoverEffectText');
      console.info("[testcommonHoverEffectHighlight0001] component hoverEffect strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').tryGetString('hoverEffect')).assertEqual(undefined);
      console.info("[testcommonHoverEffectHighlight0001] hoverEffect value :" +
      obj.getElement('$attrs').tryGetString('hoverEffect'));
    });


    
    /**
     * @tc.number   testcommonHoverEffectScale_static_0001
     * @tc.name     testcommonHoverEffectScale_static_0001
     * @tc.desc     testcommonHoverEffectScale_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcommonHoverEffectScale_static_0001', Level.LEVEL0, async () => {
      console.info('commonHoverEffectScale testcommonHoverEffectScale0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('hoverEffectScaleText');
      console.info("[testcommonHoverEffectScale0001] component hoverEffect strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').tryGetString('hoverEffect')).assertEqual(undefined);
      console.info("[testcommonHoverEffectScale0001] hoverEffect value :" +
      obj.getElement('$attrs').tryGetString('hoverEffect'));
    });


    
    /**
     * @tc.number   testcommonhitTestBehavior_static_0001
     * @tc.name     testcommonhitTestBehavior_static_0001
     * @tc.desc     testcommonhitTestBehavior_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcommonhitTestBehavior_static_0001', Level.LEVEL0, async () => {
      console.info('commonhitTestBehavior testcommonhitTestBehavior0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('hoverEffectScaleText');
      console.info("[testcommonhitTestBehavior0001] component hoverEffect strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').tryGetString('hoverEffect')).assertEqual(undefined);
      console.info("[testcommonhitTestBehavior0001] hoverEffect value :" +
      obj.getElement('$attrs').tryGetString('hoverEffect'));
    });

  })
}
