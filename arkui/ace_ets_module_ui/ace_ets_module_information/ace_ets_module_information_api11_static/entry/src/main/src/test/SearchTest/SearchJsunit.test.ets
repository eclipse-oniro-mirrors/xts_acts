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
import events_emitter from '@ohos.events.emitter';
import { CopyOptions } from '@ohos.arkui.component'
import accessibility from '@ohos.accessibility';
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function searchJsunit() {
  describe('searchJsunit', () => {
    beforeAll(() => {
      console.info("searchJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push search page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("search after each called");
    });

    /**
     * @tc.number   testSearch_static_001
     * @tc.name     testSearch_static_001
     * @tc.desc     testSearch_static_001
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch001] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch001] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('10');
      done();
    });

    /**
     * @tc.number   testSearch_static_002
     * @tc.name     testSearch_static_002
     * @tc.desc     testSearch_static_002
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch002] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('searchButton','5')

      } catch (err) {
        console.log("[testSearch002] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testSearch002] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getString('searchButton')).assertEqual('5');
      done();
    });


    /**
     * @tc.number   testSearch_static_003
     * @tc.name     testSearch_static_003
     * @tc.desc     testSearch_static_003
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch003] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch003] component strJson:" + strJson);
      let obj3 = JSON.parseJsonElement(strJson);
      expect(obj3.getElement('$attrs').getString('maxLength')).assertEqual('19');
      done();
    });


    /**
     * @tc.number   testSearch_static_004
     * @tc.name     testSearch_static_004
     * @tc.desc     testSearch_static_004
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch004] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<int>('maxLength',0)

      } catch (err) {
        console.log("[testSearch004] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch004] component strJson:" + strJson);
      let obj4 = JSON.parseJsonElement(strJson);
      expect(obj4.getElement('$attrs').getString('maxLength')).assertEqual('0');
      done();
    });


    /**
     * @tc.number   testSearch_static_005
     * @tc.name     testSearch_static_005
     * @tc.desc     testSearch_static_005
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch005] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<int>('maxLength',123)
      } catch (err) {
        console.log("[testSearch005] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch005] component strJson:" + strJson);
      let obj5 = JSON.parseJsonElement(strJson);
      expect(obj5.getElement('$attrs').getString('maxLength')).assertEqual('123');
      done();
    });


    /**
     * @tc.number   testSearch_static_006
     * @tc.name     testSearch_static_006
     * @tc.desc     testSearch_static_006
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch006] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<int>('maxLength',1000000)
      } catch (err) {
        console.log("[testSearch006] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch006] component strJson:" + strJson);
      let obj6 = JSON.parseJsonElement(strJson);
      expect(obj6.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      done();
    });


    /**
     * @tc.number   testSearch_static_007
     * @tc.name     testSearch_static_007
     * @tc.desc     testSearch_static_007
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch007] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<int>('maxLength',-1)

      } catch (err) {
        console.log("[testSearch007] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch007] component strJson:" + strJson);
      let obj7 = JSON.parseJsonElement(strJson);
      expect(obj7.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      done();
    });


    /**
     * @tc.number   testSearch_static_008
     * @tc.name     testSearch_static_008
     * @tc.desc     testSearch_static_008
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch008] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<int>('maxLength',1020300)

      } catch (err) {
        console.log("[testSearch008] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch008] component strJson:" + strJson);
      let obj8 = JSON.parseJsonElement(strJson);
      expect(obj8.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      done();
    });


    /**
     * @tc.number   testSearch_static_009
     * @tc.name     testSearch_static_009
     * @tc.desc     testSearch_static_009
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch009] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch009] component strJson:" + strJson);
      let obj9 = JSON.parseJsonElement(strJson);
      expect(obj9.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Local');
      done();
    });


    /**
     * @tc.number   testSearch_static_0010
     * @tc.name     testSearch_static_0010
     * @tc.desc     testSearch_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch0010] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<CopyOptions>('copyOption',CopyOptions.InApp)

      } catch (err) {
        console.log("[testSearch0010] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch0010] component strJson:" + strJson);
      let obj10 = JSON.parseJsonElement(strJson);
      expect(obj10.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      done();
    });


    /**
     * @tc.number   testSearch_static_0011
     * @tc.name     testSearch_static_0011
     * @tc.desc     testSearch_static_0011
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch0011] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<CopyOptions>('copyOption',CopyOptions.LocalDevice)

      } catch (err) {
        console.log("[testSearch0011] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch0011] component strJson:" + strJson);
      let obj11 = JSON.parseJsonElement(strJson);
      expect(obj11.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Local');
      done();
    });

    
    /**
     * @tc.number   testSearch_static_099
     * @tc.name     testSearch_static_099
     * @tc.desc     testSearch_static_099
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_099', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch099] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index0');
      done();
    });

    
    /**
     * @tc.number   testSearch_static_100
     * @tc.name     testSearch_static_100
     * @tc.desc     testSearch_static_100
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch100] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('searchText','123456789')

      } catch (err) {
        console.log("[testSearch100] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText'));
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index9');
      done();
    });

    
    /**
     * @tc.number   testSearch_static_101
     * @tc.name     testSearch_static_101
     * @tc.desc     testSearch_static_101
     * @tc.level    Level.LEVEL0
     */
it('testSearch_static_101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch101] START');
      await CommonFunc.sleep(1000);
      try {
        AppStorage.setOrCreate<string>('searchText','1234567890abc')

      } catch (err) {
        console.log("[testSearch101] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText'));
      await CommonFunc.sleep(1000);
      let text = await (caretText?.getText() as Promise<string>);
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
