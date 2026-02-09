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


export default function videoOnFullscreenChangeJsunit() {
  describe('videoOnFullscreenChangeTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get video state success " + JSON.stringify(pages));
        if (!("video" == pages.name)) {
          console.info("get video state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push video page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("videoOnFullscreenChange after each called");
    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0001
     * @tc.name     testvideoOnFullscreenChange_static_0001
     * @tc.desc     testvideoOnFullscreenChange_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0001', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("600.00vp");
      console.info("[testvideoOnFullscreenChange0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0002
     * @tc.name     testvideoOnFullscreenChange_static_0002
     * @tc.desc     testvideoOnFullscreenChange_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0002', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("400.00vp");
      console.info("[testvideoOnFullscreenChange0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0003
     * @tc.name     testvideoOnFullscreenChange_static_0003
     * @tc.desc     testvideoOnFullscreenChange_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0003', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').tryGetDouble('fontSize')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0003] fontSize value :" +
      obj.getElement('$attrs').tryGetDouble('fontSize'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0004
     * @tc.name     testvideoOnFullscreenChange_static_0004
     * @tc.desc     testvideoOnFullscreenChange_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0004', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testvideoOnFullscreenChange0004] opacity value :" + obj.getElement('$attrs').getDouble('opacity'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0005
     * @tc.name     testvideoOnFullscreenChange_static_0005
     * @tc.desc     testvideoOnFullscreenChange_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0005', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
      console.info("[testvideoOnFullscreenChange0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0006
     * @tc.name     testvideoOnFullscreenChange_static_0006
     * @tc.desc     testvideoOnFullscreenChange_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0006', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').tryGetDouble('fontColor')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0006] fontColor value :" +
      obj.getElement('$attrs').tryGetDouble('fontColor'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0007
     * @tc.name     testvideoOnFullscreenChange_static_0007
     * @tc.desc     testvideoOnFullscreenChange_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0007', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').tryGetDouble('lineHeight')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0007] lineHeight value :" +
      obj.getElement('$attrs').tryGetDouble('lineHeight'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0009
     * @tc.name     testvideoOnFullscreenChange_static_0009
     * @tc.desc     testvideoOnFullscreenChange_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0009', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("0.00vp");
      console.info("[testvideoOnFullscreenChange0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0010
     * @tc.name     testvideoOnFullscreenChange_static_0010
     * @tc.desc     testvideoOnFullscreenChange_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0010', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(obj.getElement('$attrs').tryGetElement('textAlign')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0010] textAlign value :" +
      obj.getElement('$attrs').tryGetString('textAlign'));

    });

    
    
    /**
     * @tc.number   testvideoOnFullscreenChange_static_0011
     * @tc.name     testvideoOnFullscreenChange_static_0011
     * @tc.desc     testvideoOnFullscreenChange_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testvideoOnFullscreenChange_static_0011', Level.LEVEL0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0011 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60227,
        priority: events_emitter.EventPriority.LOW
      }
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback success");
          console.info("eventData.data.result result is: " +
          ((eventData.data) as ESObject)?.getProperty('result').toString());
          expect(((eventData.data) as ESObject)?.getProperty('result').toString()).assertEqual("success");
          console.info("video_101 end: ");
        } catch (err) {
          console.info("video_101 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(innerEvent, callback);
        await Utils.sleep(500);
        console.info("video_101 click result is: " + JSON.stringify(inspector.sendEventByKey('fullScreen', 10, "")));
        await Utils.sleep(2000);

      } catch (err) {
        console.info("video_101 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
