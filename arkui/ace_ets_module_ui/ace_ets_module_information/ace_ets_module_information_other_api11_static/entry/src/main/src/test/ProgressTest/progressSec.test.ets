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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router, Context } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
import events_emitter from '@ohos.events.emitter';
import { resourceManager } from '@kit.LocalizationKit';
import { Resource, $r, Color, FontWeight, FontStyle, ProgressStatus, LinearGradient } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitUserAgent";

export default function progressSecTest() {
  describe('ActsProgressSecTest', () => {
    beforeAll(() => {
      console.info("ActsProgressSecTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.other.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("ActsProgressSecTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressSec',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActsProgressSecTest state success " + JSON.stringify(pages));
        if (!("ProgressSec" == pages.name)) {
          console.info("get ActsProgressSecTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push ActsProgressSecTest page error: " + err);
      }
      await CommonFunc.sleep(2000);
      console.info("ActsProgressSecTest beforeEach start");
    });

    afterEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      let pages:router.RouterState = routerInstance.getState();
      console.info("get Search state pages afterEach:" + JSON.stringify(pages));
      if(pages.name == "ProgressSec"){
        routerInstance.back();
        await CommonFunc.sleep(1000);
      }
    })

    // /**
    //  * @tc.number   ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100
    //  * @tc.name     ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100
    //  * @tc.desc     ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100
    //  * @tc.level    Level.LEVEL0
    //  */
    // it('ArkUI_Stage_Progress_Capsule_BackgroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100] start");
    //   let newJson = inspector.getInspectorByKey('progress_capsule_default');
    //   let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: newJson " + JSON.stringify(newJson));
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: newJsonDefault " + JSON.stringify(newJsonDefault));
    //
    //   let obj = JSON.parseJsonElement(newJson);
    //   let objDefault = JSON.parseJsonElement(newJsonDefault);
    //
    //   let strColor = objDefault.getElement('$attrs').getString('backgroundColor');
    //   let strOpicity = objDefault.getElement('$attrs').getString('padding');
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]:strColor " + strColor);
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: strOpicity" + strOpicity);
    //
    //   let strColor_2 = "0x" + strColor.substr(2, 2);
    //   let strOpicity_2 = strOpicity.substr(1, 4);
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]:strColor_2 " + strColor_2);
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]:strOpicity_2 " + strOpicity_2);
    //
    //   let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + JSON.stringify(calculatedOpicaty));
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + calculatedOpicaty.toString(16));
    //
    //   let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " + finalResult);
    //
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100]: " +
    //   JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
    //   expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(finalResult);
    //   console.info("[ArkUI_Stage_Progress_Capsule_BackgroundColor_0100] end");
    //   done();
    // });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Color_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Color_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Color_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Color_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getString('color'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getString('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100]: " + JSON.stringify(obj.getElement('$attrs').getString('color')));
      expect(obj.getElement('$attrs').getString('color')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_Color_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 3;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_borderWidth_number',progress_capsule_borderWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '3vp';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderWidth_string',progress_capsule_borderWidth_string)

      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("3.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(newJson));
      let progress_capsule_borderWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      AppStorage.setOrCreate<Resource>('progress_capsule_borderWidth_resource',progress_capsule_borderWidth_resource)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9px';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderWidth_string',progress_capsule_borderWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("9.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0600
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9vp';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderWidth_string',progress_capsule_borderWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("9.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0700
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9fp';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderWidth_string',progress_capsule_borderWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("9.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0800
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_string = '9lpx';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderWidth_string',progress_capsule_borderWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("9.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_0900
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0900
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 0;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_borderWidth_number',progress_capsule_borderWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_0900] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_1000
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1000
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = -10;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_borderWidth_number',progress_capsule_borderWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1000] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_1100
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = 10000;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_borderWidth_number',progress_capsule_borderWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = undefined;
      try {
        AppStorage.setOrCreate<number|undefined >('progress_capsule_borderWidth_number',progress_capsule_borderWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderWidth_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(newJson));

      let progress_capsule_borderWidth_number = undefined;
      try {
        AppStorage.setOrCreate<number|undefined >('progress_capsule_borderWidth_number',progress_capsule_borderWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderWidth'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderWidth_1300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJson));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(newJsonDefault));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getString('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_number = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_capsule_borderColor_number',progress_capsule_borderColor_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = '#FFFF9535';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderColor_string',progress_capsule_borderColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_color = Color.Red;
      try {
        AppStorage.setOrCreate<Color>('progress_capsule_borderColor_color',progress_capsule_borderColor_color)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_resource = $r('sys.color.ohos_id_color_connected');
      AppStorage.setOrCreate<Resource>('progress_capsule_borderColor_resource',progress_capsule_borderColor_resource)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getString('borderColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0600
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = 'abcdefghijk';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_borderColor_string',progress_capsule_borderColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getString('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0700
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = undefined;
      try {
        AppStorage.setOrCreate<string|undefined>('progress_capsule_borderColor_string',progress_capsule_borderColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getString('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_BorderColor_static_0800
     * @tc.name     ArkUI_Stage_Progress_Capsule_BorderColor_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Capsule_BorderColor_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_BorderColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_borderColor_string = undefined;
      try {
        AppStorage.setOrCreate<string|undefined>('progress_capsule_borderColor_string',progress_capsule_borderColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJson))
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(strJsonDefault));

      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('borderColor'));
      let strOpicity = JSON.stringify(objDefault.getElement('$attrs').getString('margin'));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity);

      let strColor_2 = "0x" + strColor.substr(2, 2);
      let strOpicity_2 = strOpicity.substr(1, 4);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strColor_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + strOpicity_2);

      let calculatedOpicaty = Number.parseInt(strColor_2) * Number(strOpicity_2);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(calculatedOpicaty));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + calculatedOpicaty.toString(16));

      let finalResult = "#" + calculatedOpicaty.toString(16) + strColor.substr(4, 6);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + finalResult);

      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('borderColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Capsule_BorderColor_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 16;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_fontSize_number',progress_capsule_fontSize_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("16.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '16vp';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontSize_string',progress_capsule_fontSize_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("16.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_resource = $r('sys.float.ohos_id_text_margin_vertical');
      AppStorage.setOrCreate<Resource>('progress_capsule_fontSize_resource',progress_capsule_fontSize_resource)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18px';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontSize_string',progress_capsule_fontSize_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("18.00px");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0600
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18vp';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontSize_string',progress_capsule_fontSize_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("18.00vp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0700
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18fp';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontSize_string',progress_capsule_fontSize_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("18.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0800
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_string = '18lpx';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontSize_string',progress_capsule_fontSize_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("18.00lpx");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_0900
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_0900
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 0;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_fontSize_number',progress_capsule_fontSize_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("0.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_0900] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_1000
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_1000
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = -10;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_fontSize_number',progress_capsule_fontSize_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1000] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_1100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_1100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = 10000;
      try {
        AppStorage.setOrCreate<number>('progress_capsule_fontSize_number',progress_capsule_fontSize_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual("10000.00fp");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_1200
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_1200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = undefined;
      try {
        AppStorage.setOrCreate<number|undefined>('progress_capsule_fontSize_number',progress_capsule_fontSize_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Size_static_1300
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Size_static_1300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Size_static_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Size_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontSize_number = undefined;
      try {
        AppStorage.setOrCreate<number|undefined>('progress_capsule_fontSize_number',progress_capsule_fontSize_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('size'));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Size_1300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 700;
      try {
        AppStorage.setOrCreate<int>('progress_capsule_fontWeight_number',progress_capsule_fontWeight_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_string = '700';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontWeight_string',progress_capsule_fontWeight_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("700");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Lighter;
      try {
        AppStorage.setOrCreate<FontWeight>('progress_capsule_fontWeight_fontWeight',progress_capsule_fontWeight_fontWeight)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Lighter");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Normal;
      try {
        AppStorage.setOrCreate<FontWeight>('progress_capsule_fontWeight_fontWeight',progress_capsule_fontWeight_fontWeight)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Regular;
      try {
        AppStorage.setOrCreate<FontWeight>('progress_capsule_fontWeight_fontWeight',progress_capsule_fontWeight_fontWeight)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Regular");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Medium;
      try {
        AppStorage.setOrCreate<FontWeight>('progress_capsule_fontWeight_fontWeight',progress_capsule_fontWeight_fontWeight)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Medium");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bold;
      try {
        AppStorage.setOrCreate<FontWeight>('progress_capsule_fontWeight_fontWeight',progress_capsule_fontWeight_fontWeight)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Bold");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_fontWeight = FontWeight.Bolder;
      try {
        AppStorage.setOrCreate<FontWeight>('progress_capsule_fontWeight_fontWeight',progress_capsule_fontWeight_fontWeight)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Bolder");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_0900] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 0;
      try {
        AppStorage.setOrCreate<int>('progress_capsule_fontWeight_number',progress_capsule_fontWeight_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1000] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = -10;
      try {
        AppStorage.setOrCreate<int>('progress_capsule_fontWeight_number',progress_capsule_fontWeight_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = 10000;
      try {
        AppStorage.setOrCreate<int>('progress_capsule_fontWeight_number',progress_capsule_fontWeight_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = undefined;
      try {
        AppStorage.setOrCreate<undefined>('progress_capsule_fontWeight_number',progress_capsule_fontWeight_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual(progressFontWeight($r('sys.float.font_weight')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Weight_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(newJson));

      let progress_capsule_fontWeight_number = undefined;
      try {
        AppStorage.setOrCreate<int|undefined>('progress_capsule_fontWeight_number',progress_capsule_fontWeight_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('weight')).assertEqual("FontWeight.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Weight_1400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Style_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Style_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Style_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Style_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Style_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Style_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Italic;
      try {
        AppStorage.setOrCreate<FontStyle>('progress_capsule_fontStyle_fontStyle',progress_capsule_fontStyle_fontStyle)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')).assertEqual("FontStyle.Italic");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Style_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Style_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Style_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = FontStyle.Normal;
      try {
        AppStorage.setOrCreate<FontStyle>('progress_capsule_fontStyle_fontStyle',progress_capsule_fontStyle_fontStyle)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Style_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Style_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Style_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = undefined;
      try {
        AppStorage.setOrCreate<FontStyle|undefined>('progress_capsule_fontStyle_fontStyle',progress_capsule_fontStyle_fontStyle)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Font_Style_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_Font_Style_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Font_Style_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Font_Style_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(newJson));

      let progress_capsule_fontStyle_fontStyle = undefined;
      try {
        AppStorage.setOrCreate<FontStyle|undefined>('progress_capsule_fontStyle_fontStyle',progress_capsule_fontStyle_fontStyle)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font')));
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('font').getString('style')).assertEqual("FontStyle.Normal");
      console.info("[ArkUI_Stage_Progress_Capsule_Font_Style_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_number = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_capsule_fontColor_number',progress_capsule_fontColor_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = '#FFFF9535';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontColor_string',progress_capsule_fontColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual("#FFFF9535");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_color = Color.Red;
      try {
        AppStorage.setOrCreate<Color>('progress_capsule_fontColor_color',progress_capsule_fontColor_color)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_enum');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_resource');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(newJson));


      let progress_capsule_fontColor_resource = $r('sys.color.ohos_id_color_connected');
      AppStorage.setOrCreate<Resource>('progress_capsule_fontColor_resource',progress_capsule_fontColor_resource)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_capsule_resource_judge');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual(objJudge.getElement('$attrs').getElement('capsuleStyle').getString('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0600
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = 'abcdefghijk';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_fontColor_string',progress_capsule_fontColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0700
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = undefined;
      try {
        AppStorage.setOrCreate<string|undefined>('progress_capsule_fontColor_string',progress_capsule_fontColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_FontColor_static_0800
     * @tc.name     ArkUI_Stage_Progress_Capsule_FontColor_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Capsule_FontColor_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_FontColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(newJson));

      let progress_capsule_fontColor_string = undefined;
      try {
        AppStorage.setOrCreate<string|undefined>('progress_capsule_fontColor_string',progress_capsule_fontColor_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_FontColor_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      let strJsonDefault = inspector.getInspectorByKey('progress_capsule_default_default');
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objDefault = JSON.parseJsonElement(strJsonDefault);
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('fontColor')).assertEqual(objDefault.getElement('$attrs').getElement('capsuleStyle').getString('fontColor'));
      console.info("[ArkUI_Stage_Progress_Capsule_FontColor_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_showDefaultPercentage_default');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '下载';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_content_string',progress_capsule_content_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("下载");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '继续';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_content_string',progress_capsule_content_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("继续");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '安装中';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_content_string',progress_capsule_content_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("安装中");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '打开';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_content_string',progress_capsule_content_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("打开");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0600
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = '';
      try {
        AppStorage.setOrCreate<string>('progress_capsule_content_string',progress_capsule_content_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0700
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = undefined;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        AppStorage.setOrCreate<string|undefined>('progress_capsule_content_string',progress_capsule_content_string)
        AppStorage.setOrCreate<boolean>('progress_capsule_showDefaultPercentage_boolean',progress_capsule_showDefaultPercentage_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_Content_static_0800
     * @tc.name     ArkUI_Stage_Progress_Capsule_Content_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Capsule_Content_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_Content_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(newJson));

      let progress_capsule_content_string = undefined;
      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        AppStorage.setOrCreate<string|undefined>('progress_capsule_content_string',progress_capsule_content_string)
        AppStorage.setOrCreate<boolean>('progress_capsule_showDefaultPercentage_boolean',progress_capsule_showDefaultPercentage_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_Content_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_string');
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('content')).assertEqual("60%");
      console.info("[ArkUI_Stage_Progress_Capsule_Content_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_capsule_enableScanEffect_boolean',progress_capsule_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_capsule_enableScanEffect_boolean',progress_capsule_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_capsule_enableScanEffect_boolean',progress_capsule_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableScanEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableScanEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_capsule_enableScanEffect_boolean',progress_capsule_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableScanEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_capsule_showDefaultPercentage_boolean',progress_capsule_showDefaultPercentage_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_capsule_showDefaultPercentage_boolean',progress_capsule_showDefaultPercentage_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400
     * @tc.name     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_capsule_showDefaultPercentage_boolean',progress_capsule_showDefaultPercentage_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(newJson));

      let progress_capsule_showDefaultPercentage_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_capsule_showDefaultPercentage_boolean',progress_capsule_showDefaultPercentage_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle')));
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')));
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getString('showDefaultPercentage')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_ShowDefaultPercentage_0500] end");
      done();
    });



    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_BackgroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      let newJsonDefault = inspector.getInspectorByKey('progress_ring_default_default');
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefault = JSON.parseJsonElement(newJsonDefault);

      let strColor = JSON.stringify(objDefault.getElement('$attrs').getString('backgroundColor'));
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + strColor);

      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100]: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual(objDefault.getElement('$attrs').getString('backgroundColor'));
      console.info("[ArkUI_Stage_Progress_Ring_BackgroundColor_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10;
      try {
        AppStorage.setOrCreate<number>('progress_ring_strokeWidth_number',progress_ring_strokeWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '10vp';
      try {
        AppStorage.setOrCreate<string>('progress_ring_strokeWidth_string',progress_ring_strokeWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_resource');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(newJson));


      let progress_ring_strokeWidth_resource = $r('sys.float.ohos_id_text_margin_vertical');
      AppStorage.setOrCreate<Resource>('progress_ring_strokeWidth_resource',progress_ring_strokeWidth_resource)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual(objJudge.getElement('$attrs').getElement('ringStyle').getString('strokeWidth'));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20px';
      try {
        AppStorage.setOrCreate<string>('progress_ring_strokeWidth_string',progress_ring_strokeWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("20.00px");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20vp';
      try {
        AppStorage.setOrCreate<string>('progress_ring_strokeWidth_string',progress_ring_strokeWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("20.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20fp';
      try {
        AppStorage.setOrCreate<string>('progress_ring_strokeWidth_string',progress_ring_strokeWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("20.00fp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] start");
      let newJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_string = '20lpx';
      try {
        AppStorage.setOrCreate<string>('progress_ring_strokeWidth_string',progress_ring_strokeWidth_string)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_string');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("20.00lpx");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 0;
      try {
        AppStorage.setOrCreate<number>('progress_ring_strokeWidth_number',progress_ring_strokeWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_0900] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = -10;
      try {
        AppStorage.setOrCreate<number>('progress_ring_strokeWidth_number',progress_ring_strokeWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1000] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = 10000;
      try {
        AppStorage.setOrCreate<number>('progress_ring_strokeWidth_number',progress_ring_strokeWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("10000.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = undefined;
      try {
        AppStorage.setOrCreate<number|undefined>('progress_ring_strokeWidth_number',progress_ring_strokeWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300
     * @tc.name     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300
     * @tc.desc     ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_StrokeWidth_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(newJson));

      let progress_ring_strokeWidth_number = undefined;
      try {
        AppStorage.setOrCreate<number|undefined>('progress_ring_strokeWidth_number',progress_ring_strokeWidth_number)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('strokeWidth')).assertEqual("4.00vp");
      console.info("[ArkUI_Stage_Progress_Ring_StrokeWidth_1300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Shadow_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_Shadow_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Shadow_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Shadow_static_0200
     * @tc.name     ArkUI_Stage_Progress_Ring_Shadow_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Shadow_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_ring_shadow_bool',progress_ring_shadow_bool)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Shadow_static_0300
     * @tc.name     ArkUI_Stage_Progress_Ring_Shadow_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Shadow_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_ring_shadow_bool',progress_ring_shadow_bool)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Shadow_static_0400
     * @tc.name     ArkUI_Stage_Progress_Ring_Shadow_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Shadow_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_ring_shadow_bool',progress_ring_shadow_bool)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Shadow_static_0500
     * @tc.name     ArkUI_Stage_Progress_Ring_Shadow_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Shadow_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Shadow_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(newJson));

      let progress_ring_shadow_bool = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_ring_shadow_bool',progress_ring_shadow_bool)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Shadow_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('shadow')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_Shadow_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Status_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_Status_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Status_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Status_static_0200
     * @tc.name     ArkUI_Stage_Progress_Ring_Status_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Status_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.LOADING;
      try {
        AppStorage.setOrCreate<ProgressStatus>('progress_ring_status_progressStatus',progress_ring_status_progressStatus)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('status')).assertEqual("ProgressStatus.LOADING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Status_static_0300
     * @tc.name     ArkUI_Stage_Progress_Ring_Status_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Status_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = ProgressStatus.PROGRESSING;
      try {
        AppStorage.setOrCreate<ProgressStatus>('progress_ring_status_progressStatus',progress_ring_status_progressStatus)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Status_static_0400
     * @tc.name     ArkUI_Stage_Progress_Ring_Status_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Status_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = undefined;
      try {
        AppStorage.setOrCreate<ProgressStatus|undefined>('progress_ring_status_progressStatus',progress_ring_status_progressStatus)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Status_static_0500
     * @tc.name     ArkUI_Stage_Progress_Ring_Status_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Status_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Status_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(newJson));

      let progress_ring_status_progressStatus = undefined;
      try {
        AppStorage.setOrCreate<ProgressStatus|undefined>('progress_ring_status_progressStatus',progress_ring_status_progressStatus)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Status_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('status')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('status')).assertEqual("ProgressStatus.PROGRESSING");
      console.info("[ArkUI_Stage_Progress_Ring_Status_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0100]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0200
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_ring_color_purity',progress_ring_color_purity)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200]: " + JSON.stringify(obj.getElement('$attrs').getString('color')));
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0300
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000.toInt(), offset: 0
      }, {
        color: 0xFFFFFFFF.toInt(), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_number',progress_ring_color_linear_number)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0400
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_string',progress_ring_color_linear_string)
      await CommonFunc.sleep(2000);


      let strJson = inspector.getInspectorByKey('progress_ring_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0500
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_color',progress_ring_color_linear_color)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0600
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0600
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_resource',progress_ring_color_linear_resource)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getString('backgroundColor') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0600]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0700
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0700
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = undefined
      try {
        AppStorage.setOrCreate<LinearGradient|undefined>('progress_ring_color_linear_null',progress_ring_color_linear_null)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0700]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_0800
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_0800
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800] start");
      let newJson = inspector.getInspectorByKey('progress_ring_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        AppStorage.setOrCreate<LinearGradient | undefined >('progress_ring_color_linear_undefined',progress_ring_color_linear_undefined)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_0800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_0800]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_0800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1100
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1100]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1200
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_ring_color_purity',progress_ring_color_purity)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200]: " + JSON.stringify(obj.getElement('$attrs').getString('color')));
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1300
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(newJson));


      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000.toInt(), offset: 0
      }, {
        color: 0xFFFFFFFF.toInt(), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_number',progress_ring_color_linear_number)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1400
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_string',progress_ring_color_linear_string)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1500
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_color',progress_ring_color_linear_color)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_1500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1600
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1600
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_resource',progress_ring_color_linear_resource)
      await CommonFunc.sleep(2000);


      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getString('backgroundColor') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1600]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1700
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1700
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = undefined
      try {
        AppStorage.setOrCreate<LinearGradient|undefined>('progress_ring_color_linear_null',progress_ring_color_linear_null)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1700]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_1800
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_1800
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_1800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        AppStorage.setOrCreate<LinearGradient | undefined>('progress_ring_color_linear_undefined',progress_ring_color_linear_undefined)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_1800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_1800]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_1800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2100
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2100]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2200
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_ring_color_purity',progress_ring_color_purity)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200]: " + JSON.stringify(obj.getElement('$attrs').getString('color')));
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2300
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000.toInt(), offset: 0
      }, {
        color: 0xFFFFFFFF.toInt(), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_number',progress_ring_color_linear_number)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2400
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_string',progress_ring_color_linear_string)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2500
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_color',progress_ring_color_linear_color)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_2500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2600
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2600
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_resource',progress_ring_color_linear_resource)
      await CommonFunc.sleep(2000);


      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getString('backgroundColor') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2600]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2700
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2700
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = undefined
      try {
        AppStorage.setOrCreate<LinearGradient|undefined>('progress_ring_color_linear_null',progress_ring_color_linear_null)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2700]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_2800
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_2800
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_2800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        AppStorage.setOrCreate<LinearGradient | undefined>('progress_ring_color_linear_undefined',progress_ring_color_linear_undefined)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_2800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_2800]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_2800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3100
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3100]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3200
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_ring_color_purity',progress_ring_color_purity)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200]: " + JSON.stringify(obj.getElement('$attrs').getString('color')));
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3300
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000.toInt(), offset: 0
      }, {
        color: 0xFFFFFFFF.toInt(), offset: 1
      }]);

      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_number',progress_ring_color_linear_number)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3400
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);

      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_string',progress_ring_color_linear_string)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3500
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_color',progress_ring_color_linear_color)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_3500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3600
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3600
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_resource',progress_ring_color_linear_resource)

      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getString('backgroundColor') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3600]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3700
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3700
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = undefined
      try {
        AppStorage.setOrCreate<LinearGradient|undefined>('progress_ring_color_linear_null',progress_ring_color_linear_null)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3700]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_3800
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_3800
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_3800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_3800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        AppStorage.setOrCreate<LinearGradient | undefined >('progress_ring_color_linear_undefined',progress_ring_color_linear_undefined)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_3800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_3800]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_3800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4100
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4100
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_default');
      let newJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let newJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      let objDefaultColorBegin = JSON.parseJsonElement(newJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(newJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4100]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4200
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4200
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(newJson));

      let progress_ring_color_purity = 0xFFFF0000.toInt();
      try {
        AppStorage.setOrCreate<int>('progress_ring_color_purity',progress_ring_color_purity)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200]: " + JSON.stringify(obj.getElement('$attrs').getString('color')));
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4300
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4300
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_number = new LinearGradient([{
        color: 0xFFFF0000.toInt(), offset: 0
      }, {
        color: 0xFFFFFFFF.toInt(), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_number',progress_ring_color_linear_number)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_number');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4400
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4400
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_string = new LinearGradient([{
        color: '#FFFF9A35', offset: 0
      }, {
        color: '#FFFFFFFF', offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_string',progress_ring_color_linear_string)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_string');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF9A35\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4500
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4500
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_color = new LinearGradient([{
        color: Color.Red, offset: 0
      }, {
        color: Color.White, offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_color',progress_ring_color_linear_color)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_color');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor'))
        .assertEqual("[{\"color\":\"#FFFF0000\",\"offset\":\"0.000000\"},{\"color\":\"#FFFFFFFF\",\"offset\":\"1.000000\"}]");
      console.info("[ArkUI_Stage_Progress_Ring_Color_4500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4600
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4600
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4600
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_resource');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_resource = new LinearGradient([{
        color: $r('sys.color.ohos_id_color_connected'), offset: 0
      }, {
        color: $r('sys.color.ohos_id_color_background'), offset: 1
      }]);
      AppStorage.setOrCreate<LinearGradient>('progress_ring_color_linear_resource',progress_ring_color_linear_resource)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_resource');
      let strJsonJudge = inspector.getInspectorByKey('progress_ring_resource_judge');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objJudge = JSON.parseJsonElement(strJsonJudge);
      let finalResult =
        "[{\"color\":\"" + objJudge.getElement('$attrs').getString('backgroundColor') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objJudge.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4600]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4600] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4700
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4700
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4700
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_null');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_null = undefined
      try {
        AppStorage.setOrCreate<LinearGradient | undefined>('progress_ring_color_linear_null',progress_ring_color_linear_null)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4700] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_null');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4700]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4700] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_Color_static_4800
     * @tc.name     ArkUI_Stage_Progress_Ring_Color_static_4800
     * @tc.desc     ArkUI_Stage_Progress_Ring_Color_static_4800
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_Color_static_4800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_color_linear_undefined');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(newJson));

      let progress_ring_color_linear_undefined = undefined
      try {
        AppStorage.setOrCreate<LinearGradient | undefined>('progress_ring_color_linear_undefined',progress_ring_color_linear_undefined)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_Color_4800] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_color_linear_undefined');
      let strJsonDefaultColorBegin = inspector.getInspectorByKey('progress_ring_default_default_color_begin');
      let strJsonDefaultColorEnd = inspector.getInspectorByKey('progress_ring_default_default_color_end');
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(strJson))

      let obj = JSON.parseJsonElement(strJson);
      let objDefaultColorBegin = JSON.parseJsonElement(strJsonDefaultColorBegin);
      let objDefaultColorEnd = JSON.parseJsonElement(strJsonDefaultColorEnd);
      let finalResult =
        "[{\"color\":\"" + objDefaultColorEnd.getElement('$attrs').getString('color') + "\",\"offset\":\"0.000000\"},{\"color\":\"" +
        objDefaultColorBegin.getElement('$attrs').getString('color') + "\",\"offset\":\"1.000000\"}]"

      console.info("[ArkUI_Stage_Progress_Ring_Color_4800]: " + JSON.stringify(obj.getElement('$attrs').getString('progressGradientColor')));
      expect(obj.getElement('$attrs').getString('progressGradientColor')).assertEqual(finalResult);
      console.info("[ArkUI_Stage_Progress_Ring_Color_4800] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_ring_enableScanEffect_boolean',progress_ring_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_ring_enableScanEffect_boolean',progress_ring_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_ring_enableScanEffect_boolean',progress_ring_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableScanEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableScanEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_ring_enableScanEffect_boolean',progress_ring_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('ringStyle')));
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('ringStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableScanEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_linear_enableScanEffect_boolean',progress_linear_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_linear_enableScanEffect_boolean',progress_linear_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_linear_enableScanEffect_boolean',progress_linear_enableScanEffect_boolean)

      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableScanEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableScanEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_linear_enableScanEffect_boolean',progress_linear_enableScanEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')));
      expect(obj.getElement('$attrs').getElement('linearStyle').getString('enableScanEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableScanEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_ring_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_ring_enableSmoothEffect_boolean',progress_ring_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_ring_enableSmoothEffect_boolean',progress_ring_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_ring_enableSmoothEffect_boolean',progress_ring_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Ring_EnableSmoothEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_ring_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_ring_enableSmoothEffect_boolean',progress_ring_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_ring_number');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_linear_enableSmoothEffect_boolean',progress_linear_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_linear_enableSmoothEffect_boolean',progress_linear_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_linear_enableSmoothEffect_boolean',progress_linear_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Linear_EnableSmoothEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_linear_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_linear_enableSmoothEffect_boolean',progress_linear_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_linear_color_number');
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Linear_EnableSmoothEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_default');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_capsule_enableSmoothEffect_boolean',progress_capsule_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_capsule_enableSmoothEffect_boolean',progress_capsule_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_capsule_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_capsule_enableSmoothEffect_boolean',progress_capsule_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_capsule_number');
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Capsule_EnableSmoothEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_default');
      console.info("[ArkUI_Stage_Progress_Ring_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_scaleRing_enableSmoothEffect_boolean',progress_scaleRing_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_scaleRing_enableSmoothEffect_boolean',progress_scaleRing_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_scaleRing_enableSmoothEffect_boolean',progress_scaleRing_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_scaleRing_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_scaleRing_enableSmoothEffect_boolean',progress_scaleRing_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_scaleRing_color_number');
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_ScaleRing_EnableSmoothEffect_0500] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100
     * @tc.name     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100
     * @tc.desc     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_default');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100]: " + JSON.stringify(newJson));

      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0100] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200
     * @tc.name     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200
     * @tc.desc     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = true;
      try {
        AppStorage.setOrCreate<boolean>('progress_eclipse_enableSmoothEffect_boolean',progress_eclipse_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0200] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300
     * @tc.name     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300
     * @tc.desc     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = false;
      try {
        AppStorage.setOrCreate<boolean>('progress_eclipse_enableSmoothEffect_boolean',progress_eclipse_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("false");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0300] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400
     * @tc.name     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400
     * @tc.desc     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_eclipse_enableSmoothEffect_boolean',progress_eclipse_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0400] end");
      done();
    });


    /**
     * @tc.number   ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500
     * @tc.name     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500
     * @tc.desc     ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] start");
      let newJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(newJson));

      let progress_eclipse_enableSmoothEffect_boolean = undefined;
      try {
        AppStorage.setOrCreate<boolean|undefined>('progress_eclipse_enableSmoothEffect_boolean',progress_eclipse_enableSmoothEffect_boolean)
      } catch (err) {
        console.log("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] change component data error: " +
        (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('progress_eclipse_color_number');
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " + JSON.stringify(strJson))
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500]: " +
      JSON.stringify(obj.getElement('$attrs').getString('enableSmoothEffect')));
      expect(obj.getElement('$attrs').getString('enableSmoothEffect')).assertEqual("true");
      console.info("[ArkUI_Stage_Progress_Eclipse_EnableSmoothEffect_0500] end");
      done();
    });
  })
}
function progressFontWeight(sysFontWeight: Resource):string {
  let fontWeightArr: string[] = [
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700',
    '800',
    '900',
    'FontWeight.Bold',
    'FontWeight.Normal',
    'FontWeight.Bolder',
    'FontWeight.Lighter',
    'FontWeight.Medium',
    'FontWeight.Regular']
  let resourceFontWeight = AppStorage.get<UIContext>('uiContext')!.getHostContext()?.resourceManager.getDouble(sysFontWeight.id).toInt()
  let newFontWeight: string = fontWeightArr[resourceFontWeight as int]
  return newFontWeight;
}
