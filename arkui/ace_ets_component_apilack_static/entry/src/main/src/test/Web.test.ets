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


export default function webGetTitleJsunit() {
  describe('webGetTitleTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/web',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get web state success " + JSON.stringify(pages));
        if (!("web" == pages.name)) {
          console.info("get web state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push web page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("webGetTitle after each called");
    });

    
    
    
    /**
     * @tc.number   testwebGetTitle_static_0001
     * @tc.name     testwebGetTitle_static_0001
     * @tc.desc     testwebGetTitle_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0001', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0001] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("500.00vp");
      console.info("[testwebGetTitle0001] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0002
     * @tc.name     testwebGetTitle_static_0002
     * @tc.desc     testwebGetTitle_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0002', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0002] component fileAccess strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('fileAccess')).assertEqual(undefined);
      console.info("[testwebGetTitle0002] fileAccess value :" + JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('fileAccess'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0003
     * @tc.name     testwebGetTitle_static_0003
     * @tc.desc     testwebGetTitle_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0003', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0003] component javaScriptAccess strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('javaScriptAccess')).assertEqual(undefined);
      console.info("[testwebGetTitle0003] javaScriptAccess value :" + JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('javaScriptAccess'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0004
     * @tc.name     testwebGetTitle_static_0004
     * @tc.desc     testwebGetTitle_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0004', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0004] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("20.00vp");
      console.info("[testwebGetTitle0004] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0005
     * @tc.name     testwebGetTitle_static_0005
     * @tc.desc     testwebGetTitle_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0005', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0005] component blur strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(obj.getElement('$attrs').getDouble('blur')).assertEqual(2);
      console.info("[testwebGetTitle0005] blur value :" + obj.getElement('$attrs').getDouble('blur'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0006
     * @tc.name     testwebGetTitle_static_0006
     * @tc.desc     testwebGetTitle_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0006', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0006] component userAgent strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('userAgent')).assertEqual(undefined);
      console.info("[testwebGetTitle0006] userAgent value :" + JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('userAgent'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0007
     * @tc.name     testwebGetTitle_static_0007
     * @tc.desc     testwebGetTitle_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0007', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0007] component fileFromUrlAccess strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('fileFromUrlAccess')).assertEqual(undefined);
      console.info("[testwebGetTitle0007] fileFromUrlAccess value :" + JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('fileFromUrlAccess'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0008
     * @tc.name     testwebGetTitle_static_0008
     * @tc.desc     testwebGetTitle_static_0008
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0008', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0008 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0008] component initialScale strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('initialScale')).assertEqual(undefined);
      console.info("[testwebGetTitle0008] initialScale value :" + JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('initialScale'));

    });

    
    
    /**
     * @tc.number   testwebGetTitle_static_0009
     * @tc.name     testwebGetTitle_static_0009
     * @tc.desc     testwebGetTitle_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0009', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0009] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      console.info("[testwebGetTitle0009] type value :" + obj.getString('$type'));

    });
  })
}
