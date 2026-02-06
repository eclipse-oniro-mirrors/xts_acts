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


export default function searchOnCutJsunit() {
  describe('searchOnCutTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/search',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("searchOnCut after each called");
    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0001
     * @tc.name     testsearchOnCut_static_0001
     * @tc.desc     testsearchOnCut_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0001', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("320.00vp");
      console.info("[testsearchOnCut0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0002
     * @tc.name     testsearchOnCut_static_0002
     * @tc.desc     testsearchOnCut_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0002', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testsearchOnCut0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0003
     * @tc.name     testsearchOnCut_static_0003
     * @tc.desc     testsearchOnCut_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0003', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testsearchOnCut0003] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0004
     * @tc.name     testsearchOnCut_static_0004
     * @tc.desc     testsearchOnCut_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0004', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testsearchOnCut0004] opacity value :" + obj.getElement('$attrs').getDouble('opacity'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0005
     * @tc.name     testsearchOnCut_static_0005
     * @tc.desc     testsearchOnCut_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0005', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testsearchOnCut0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0006
     * @tc.name     testsearchOnCut_static_0006
     * @tc.desc     testsearchOnCut_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0006', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testsearchOnCut0006] fontColor value :" + obj.getElement('$attrs').getString('fontColor'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0007
     * @tc.name     testsearchOnCut_static_0007
     * @tc.desc     testsearchOnCut_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0007', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testsearchOnCut0007] lineHeight value :" + obj.getElement('$attrs').getString('lineHeight'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0009
     * @tc.name     testsearchOnCut_static_0009
     * @tc.desc     testsearchOnCut_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0009', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testsearchOnCut0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    
    /**
     * @tc.number   testsearchOnCut_static_0010
     * @tc.name     testsearchOnCut_static_0010
     * @tc.desc     testsearchOnCut_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testsearchOnCut_static_0010', Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onCutText');
      console.info("[testsearchOnCut0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testsearchOnCut0010] textAlign value :" + obj.getElement('$attrs').getString('textAlign'));

    });
  })
}
