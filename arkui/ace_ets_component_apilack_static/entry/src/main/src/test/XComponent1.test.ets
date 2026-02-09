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


export default function xcomponentGetXComponentContextJsunit() {
  describe('xcomponentGetXComponentContextTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/xcomponent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get xcomponent state success " + JSON.stringify(pages));
        if (!("xcomponent" == pages.name)) {
          console.info("get xcomponent state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push xcomponent page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("xcomponentGetXComponentContext after each called");
    });

    
    
    
    /**
     * @tc.number   testxcomponentGetXComponentContext_static_0010
     * @tc.name     testxcomponentGetXComponentContext_static_0010
     * @tc.desc     testxcomponentGetXComponentContext_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testxcomponentGetXComponentContext_static_0010', Level.LEVEL0, async () => {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0010 START');
      await Utils.sleep(1000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60228,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
          console.info("onRequestPopupData_0010 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('STATUS').toString()).assertEqual("callBackSuccess");
        }
        events_emitter.on(innerEventOne, callback1);
        await Utils.sleep(1000);
        console.info("onSelect_0012 click result is: " +
        JSON.stringify(inspector.sendEventByKey('getXComponentContextText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("onRequestPopupData_0010 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testxcomponentGetXComponentContext0010 END');

    });

    
    
    
    /**
     * @tc.number   testxcomponentSetXComponentSurfaceSize_static_0001
     * @tc.name     testxcomponentSetXComponentSurfaceSize_static_0001
     * @tc.desc     testxcomponentSetXComponentSurfaceSize_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testxcomponentSetXComponentSurfaceSize_static_0001', Level.LEVEL0, async () => {
      console.info('xcomponentSetXComponentContext testxcomponentSetXComponentSurfaceSize0001 START');
      await Utils.sleep(2000);
      console.info("setXComponentSurfaceSize0001 click result is: " +
      JSON.stringify(inspector.sendEventByKey('setXComponentSurfaceSizeText', 10, "")));
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual("Text");
      expect(obj.getElement('$attrs').tryGetDouble('surfaceWidth')).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0001 END');

    });

    
    
    
    /**
     * @tc.number   testxcomponentSetXComponentSurfaceSize_static_0002
     * @tc.name     testxcomponentSetXComponentSurfaceSize_static_0002
     * @tc.desc     testxcomponentSetXComponentSurfaceSize_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testxcomponentSetXComponentSurfaceSize_static_0002', Level.LEVEL0, async () => {
      console.info('xcomponentSetXComponentContext testxcomponentSetXComponentSurfaceSize0002 START');
      await Utils.sleep(2000);
      console.info("testxcomponentSetXComponentSurfaceSize0002 click result is: " +
      JSON.stringify(inspector.sendEventByKey('setXComponentSurfaceSizeText', 10, "")))
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual("Text");
      expect(obj.getElement('$attrs').tryGetDouble('surfaceHeight')).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0002 END');

    });
  })
}
