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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function textMinFontSizeJsunit() {
  describe('textMinFontSizeTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get text state success " + JSON.stringify(pages));
        if (!("text" == pages.name)) {
          console.info("get text state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push text page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textMinFontSize after each called");
    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0001
     * @tc.name     testtextMinFontSize_static_0001
     * @tc.desc     testtextMinFontSize_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0001', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtextMinFontSize0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0002
     * @tc.name     testtextMinFontSize_static_0002
     * @tc.desc     testtextMinFontSize_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0002', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testtextMinFontSize0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0003
     * @tc.name     testtextMinFontSize_static_0003
     * @tc.desc     testtextMinFontSize_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0003', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("30.00px");
      console.info("[testtextMinFontSize0003] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });


    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0004
     * @tc.name     testtextMinFontSize_static_0004
     * @tc.desc     testtextMinFontSize_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0004', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testtextMinFontSize0004] opacity value :" + obj.getElement('$attrs').getDouble('opacity'));

    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0005
     * @tc.name     testtextMinFontSize_static_0005
     * @tc.desc     testtextMinFontSize_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0005', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testtextMinFontSize0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0006
     * @tc.name     testtextMinFontSize_static_0006
     * @tc.desc     testtextMinFontSize_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0006', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testtextMinFontSize0006] fontColor value :" + obj.getElement('$attrs').getString('fontColor'));
    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0007
     * @tc.name     testtextMinFontSize_static_0007
     * @tc.desc     testtextMinFontSize_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0007', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testtextMinFontSize0007] lineHeight value :" + obj.getElement('$attrs').getString('lineHeight'));
    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0009
     * @tc.name     testtextMinFontSize_static_0009
     * @tc.desc     testtextMinFontSize_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0009', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtextMinFontSize0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    
    /**
     * @tc.number   testtextMinFontSize_static_0010
     * @tc.name     testtextMinFontSize_static_0010
     * @tc.desc     testtextMinFontSize_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0010', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testtextMinFontSize0010] textAlign value :" + obj.getElement('$attrs').getString('textAlign'));

    });

    
    
    /**
     * @tc.number   testtextMinFontSize_static_0011
     * @tc.name     testtextMinFontSize_static_0011
     * @tc.desc     testtextMinFontSize_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testtextMinFontSize_static_0011', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextMinFontSize0011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('minFontSizeText');
      console.info("[testtextMinFontSize0011] component minFontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('minFontSize')).assertEqual("50.00px");
      console.info("[testtextMinFontSize0011] minFontSize value :" + obj.getElement('$attrs').getString('minFontSize'));

    });

    
    
    /**
     * @tc.number   testtextCopyOptionText_static_0001
     * @tc.name     testtextCopyOptionText_static_0001
     * @tc.desc     testtextCopyOptionText_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testtextCopyOptionText_static_0001', Level.LEVEL0, async () => {
      console.info('textMinFontSize testtextCopyOptionText0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('copyOptionText');
      console.info("[testtextCopyOptionText0001] component copyOption strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
      console.info("[testtextCopyOptionText0001] copyOption value :" +
      obj.getElement('$attrs').getString('copyOption'));

    });
  })
}
