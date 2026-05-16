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
import { $r, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


export default function textAreaOnCutJsunit() {
  describe('textAreaOnCutTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textArea state success " + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textArea state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textArea page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textAreaOnCut after each called");
    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0001
     * @tc.name     testtextAreaOnCut_static_0001
     * @tc.desc     testtextAreaOnCut_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0001', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testtextAreaOnCut0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0002
     * @tc.name     testtextAreaOnCut_static_0002
     * @tc.desc     testtextAreaOnCut_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0002', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testtextAreaOnCut0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0003
     * @tc.name     testtextAreaOnCut_static_0003
     * @tc.desc     testtextAreaOnCut_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0003', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testtextAreaOnCut0003] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0004
     * @tc.name     testtextAreaOnCut_static_0004
     * @tc.desc     testtextAreaOnCut_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0004', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testtextAreaOnCut0004] opacity value :" + obj.getElement('$attrs').getDouble('opacity'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0005
     * @tc.name     testtextAreaOnCut_static_0005
     * @tc.desc     testtextAreaOnCut_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0005', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testtextAreaOnCut0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0006
     * @tc.name     testtextAreaOnCut_static_0006
     * @tc.desc     testtextAreaOnCut_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0006', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testtextAreaOnCut0006] fontColor value :" + obj.getElement('$attrs').getString('fontColor'));

    });


    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0009
     * @tc.name     testtextAreaOnCut_static_0009
     * @tc.desc     testtextAreaOnCut_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0009', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testtextAreaOnCut0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaOnCut_static_0010
     * @tc.name     testtextAreaOnCut_static_0010
     * @tc.desc     testtextAreaOnCut_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaOnCut_static_0010', Level.LEVEL0, async () => {
      console.info('textAreaOnCut testtextAreaOnCut0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testtextAreaOnCut0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testtextAreaOnCut0010] textAlign value :" + obj.getElement('$attrs').getString('textAlign'));

    });

    
    
    
    /**
     * @tc.number   testtextAreaCopyOption_static_0011
     * @tc.name     testtextAreaCopyOption_static_0011
     * @tc.desc     testtextAreaCopyOption_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testtextAreaCopyOption_static_0011', Level.LEVEL0, async () => {
      console.info('textAreaCopyOption testtextAreaCopyOption0011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('textAreaCopyOptionText');
      console.info("[testtextAreaCopyOption0011] component copyOption strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextArea');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.None');
      console.info("[testtextAreaCopyOption0011] copyOption value :" +
      obj.getElement('$attrs').getString('copyOption'));

    });


  })
}
