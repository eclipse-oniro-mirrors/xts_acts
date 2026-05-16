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
  afterEach,
  afterAll
} from '../../../hypium/index';
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


export default function mediaQueryOffJsunit() {
  describe('mediaQueryOffTest', () => {

    /**
     * run before testcase
     */
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info('[mediaQueryOffTest] before each called')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/mediaQuery'
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear()
      let pages = routerInstance.getState();
      if (!("mediaQuery" == pages.name)) {
        console.info("get list_item state success " + JSON.stringify(pages.name));
        routerInstance.pushUrl(options);
        await Utils.sleep(2000);
      }
    });

    /**
     * run after testcase
     */
    afterAll(async () => {
      console.info('[mediaQueryOffTest] after each called')
      await Utils.sleep(1000)
    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0001
     * @tc.name     testmediaQueryOff_static_0001
     * @tc.desc     testmediaQueryOff_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0001', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testmediaQueryOff0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0002
     * @tc.name     testmediaQueryOff_static_0002
     * @tc.desc     testmediaQueryOff_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0002', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("70.00vp");
      console.info("[testmediaQueryOff0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0003
     * @tc.name     testmediaQueryOff_static_0003
     * @tc.desc     testmediaQueryOff_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0003', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("20.00fp");
      console.info("[testmediaQueryOff0003] fontSize value :" + obj.getElement('$attrs').getString('fontSize'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0004
     * @tc.name     testmediaQueryOff_static_0004
     * @tc.desc     testmediaQueryOff_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0004', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testmediaQueryOff0004] opacity value :" + obj.getElement('$attrs').getDouble('opacity'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0005
     * @tc.name     testmediaQueryOff_static_0005
     * @tc.desc     testmediaQueryOff_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0005', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart");
      console.info("[testmediaQueryOff0005] align value :" + obj.getElement('$attrs').getString('align'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0006
     * @tc.name     testmediaQueryOff_static_0006
     * @tc.desc     testmediaQueryOff_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0006', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info("[testmediaQueryOff0006] fontColor value :" + obj.getElement('$attrs').getString('fontColor'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0007
     * @tc.name     testmediaQueryOff_static_0007
     * @tc.desc     testmediaQueryOff_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0007', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('lineHeight')).assertEqual("25.00fp");
      console.info("[testmediaQueryOff0007] lineHeight value :" + obj.getElement('$attrs').getString('lineHeight'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0009
     * @tc.name     testmediaQueryOff_static_0009
     * @tc.desc     testmediaQueryOff_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0009', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual("10.00vp");
      console.info("[testmediaQueryOff0009] padding value :" + obj.getElement('$attrs').getString('padding'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0010
     * @tc.name     testmediaQueryOff_static_0010
     * @tc.desc     testmediaQueryOff_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0010', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('offText');
      console.info("[testmediaQueryOff0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
      console.info("[testmediaQueryOff0010] textAlign value :" + obj.getElement('$attrs').getString('textAlign'));

    });

    
    
    
    /**
     * @tc.number   testmediaQueryOff_static_0011
     * @tc.name     testmediaQueryOff_static_0011
     * @tc.desc     testmediaQueryOff_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testmediaQueryOff_static_0011', Level.LEVEL0, async () => {
      console.info('mediaQueryOff testmediaQueryOff0011 START');
      await Utils.sleep(2000);
      console.info("onSelect_0012 click result is: " + JSON.stringify(inspector.sendEventByKey('offText', 10, "")));
      await Utils.sleep(2000);
      expect(AppStorage.get<boolean>('result')).assertEqual(true);
      console.info('testmediaQueryOff0011 END');

    });

    
    
    
    /**
     * @tc.number   testmatchMediaSync0001
     * @tc.name     testmatchMediaSync0001
     * @tc.desc     testmatchMediaSync0001
     * @tc.level    Level.LEVEL0
     */
it('testmatchMediaSync0001', Level.LEVEL0, async () => {
      console.info('matchMediaSync testmatchMediaSync0001 START');
      inspector.sendEventByKey('matchMediaSyncText', 10, "")
      await Utils.sleep(2000);
      expect(AppStorage.get<boolean>('result')).assertEqual(true);
      console.info('testmatchMediaSync0001 END');
    });
  })
}
