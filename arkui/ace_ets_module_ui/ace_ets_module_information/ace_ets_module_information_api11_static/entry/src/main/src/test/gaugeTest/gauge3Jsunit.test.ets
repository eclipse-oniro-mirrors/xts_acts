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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { ResourceColor , LinearGradient, Color, Resource,Length } from '@ohos.arkui.component'
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';
const waitUiReadyMs = 1000;

export default function gauge3Jsunit() {
  describe('gauge3Jsunit', () => {
    beforeAll(() => {
      console.info("gauge3Jsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {

      console.info("gauge3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gauge3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gauge3Jsunit state pages:" + JSON.stringify(pages));
        if (!("gauge3" == pages.name)) {
          console.info("get gauge3Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
          console.error("push gauge3Jsunit page error:" + err);
	        expect().assertFail();
      }
    });

    /**
     * @tc.number   gauge3Jsunit_static_0100
     * @tc.name     gauge3Jsunit_static_0100
     * @tc.desc     gauge3Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
       console.info('gauge3Jsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the gauge component and test attribute
       let strJson = inspector.getInspectorByKey('guage');
       let obj = JSON.parseJsonElement(strJson);
       console.info('gauge3Jsunit_0100 component obj is:' + JSON.stringify(obj));
       console.info('gauge3Jsunit_0100 component obj startAngle is:' + obj.getElement('$attrs').getString('startAngle'));
       console.info('gauge3Jsunit_0100 component obj startAngle is:' + obj.getElement('$attrs').getString('endAngle'));
       console.info('gauge3Jsunit_0100 component obj startAngle is:' + obj.getElement('$attrs').getString('strokeWidth'));
       console.info('gauge3Jsunit_0100 component obj startAngle is:' + obj.getElement('$attrs').getString('colors'));
       expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('0.00');
       expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('0.00');
       expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('0.00vp');
       expect(obj.getElement('$attrs').getString('value')).assertEqual('30.00');
       expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00');
       expect(obj.getElement('$attrs').getString('max')).assertEqual('100.00');
       let colors = obj.getElement('$attrs').getString('colors');
       console.info('gauge3Jsunit_0100 component obj is: ' + colors);
      expect(colors).assertEqual('[[[["#FF317AF7","0.000000"]],0.10000000149011612],[[["#FF5BA854","0.000000"]],0.20000000298023224],[[["#FFE08C3A","0.000000"]],0.300000011920929],[[["#FF9C554B","0.000000"]],0.40000000596046448]]');
       done();
    });

   /**
     * @tc.number   gauge3Jsunit_static_0200
     * @tc.name     gauge3Jsunit_static_0200
     * @tc.desc     gauge3Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the type attribute normal value of guage dynamically
  AppStorage.setOrCreate<number>("startAngle",20)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("strokeWidth",30)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("endAngle",270)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<Array<[ResourceColor | LinearGradient , number]>>("colors",[[0x317AF6, 0.3], [0x5BA854, 0.3], [0xE08C3A, 0.4], [0x9A554B, 0.4]])
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('20.00');
      expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('270.00');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
      let colors: string = obj.getElement('$attrs').getString('colors');
      console.info('gauge3Jsunit_0200 component obj is: ' + colors);
      expect(colors).assertEqual('[[[["#FF317AF6","0.000000"]],0.300000011920929],[[["#FF5BA854","0.000000"]],0.300000011920929],[[["#FFE08C3A","0.000000"]],0.40000000596046448],[[["#FF9A554B","0.000000"]],0.40000000596046448]]');
      done();
    });

  /**
     * @tc.number   gauge3Jsunit_static_0300
     * @tc.name     gauge3Jsunit_static_0300
     * @tc.desc     gauge3Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_0200 START');
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<number>("value",0)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("min",0)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("max",100)
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('max')).assertEqual('100.00');
      done();
    });


    /**
     * @tc.number   gauge3Jsunit_static_0400
     * @tc.name     gauge3Jsunit_static_0400
     * @tc.desc     gauge3Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_0400 START');
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<number>("startAngle",-30)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<string>("strokeWidth",'-30')
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("endAngle",450)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<Array<[ResourceColor | LinearGradient , number]>>("colors",[[0x317AF6, 2], [0x5BA, 0.3], [0xE08C3A, 0.4], [0x9A554B, 0.4]])
      await CommonFunc.sleep(2000);
       // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_0400 component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('startAngle')).assertEqual('-30.00');
      expect(obj.getElement('$attrs').getString('endAngle')).assertEqual('450.00');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
      let colors = obj.getElement('$attrs').getString('colors');
      console.info('gauge3Jsunit_0400 component obj is: ' + colors);
      expect(colors).assertEqual('[[[["#FF317AF6","0.000000"]],2],[[["#FF0005BA","0.000000"]],0.300000011920929],[[["#FFE08C3A","0.000000"]],0.40000000596046448],[[["#FF9A554B","0.000000"]],0.40000000596046448]]');
      done();
   });

   /**
     * @tc.number   gauge3Jsunit_static_0500
     * @tc.name     gauge3Jsunit_static_0500
     * @tc.desc     gauge3Jsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the illegal parameter
  AppStorage.setOrCreate<number>("value",0)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("min",0)
      await CommonFunc.sleep(2000);
  AppStorage.setOrCreate<number>("max",100)
      await CommonFunc.sleep(2000);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00');
      expect(obj.getElement('$attrs').getString('max')).assertEqual('100.00');
      done();
    });

    /**
     * @tc.number   gauge3Jsunit_static_0600
     * @tc.name     gauge3Jsunit_static_0600
     * @tc.desc     gauge3Jsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_0600 START');
      await CommonFunc.sleep(1000);
      // test the support common attribute
  AppStorage.setOrCreate<Length>("wth",'20')
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_0600 component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('20.00vp')
      done();
    });

    /**
     * @tc.number   gauge3Jsunit_static_0700
     * @tc.name     gauge3Jsunit_static_0700
     * @tc.desc     gauge3Jsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('gauge3Jsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gauge3Jsunit_0700 START');
      await CommonFunc.sleep(1000);
      // test the support common attribute
  AppStorage.setOrCreate<Length>("wth",'-60')
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('guage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('gauge3Jsunit_0700 component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('200.00vp')
      done();
    });

  })
}