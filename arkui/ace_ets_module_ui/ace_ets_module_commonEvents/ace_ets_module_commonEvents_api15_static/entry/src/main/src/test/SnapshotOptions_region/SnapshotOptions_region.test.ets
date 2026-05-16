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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, MouseButton, ON, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SnapshotOptions_region() {
  describe('SnapshotOptions_region', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('SnapshotOptions_region beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SnapshotOptions_region/SnapshotOptions_region',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SnapshotOptions_region state pages: ' + JSON.stringify(pages));
        if (!('SnapshotOptions_region' == pages.name)) {
          console.info('get SnapshotOptions_region state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SnapshotOptions_region page error: ' + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   SnapshotOptions_region_static_0100
     * @tc.name     SnapshotOptions_region_static_0100
     * @tc.desc     SnapshotOptions_region_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SnapshotOptions_region_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SnapshotOptions_region_static_0100] START');
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('SnapshotRegion'));
      await CommonFunc.sleep(2000);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('image1');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SnapshotOptions_region_static_0100] strJson is: ' + strJson);
      console.info('[SnapshotOptions_region_static_0100] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('width')));
      console.info('[SnapshotOptions_region_static_0100] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('height')));
      let height: string = obj.getElement('$attrs').getString('height');
      let width: string = obj.getElement('$attrs').getString('width');
      expect(height === width).assertTrue();
      console.info('[SnapshotOptions_region_static_0100] END');
      done();
    });


    
    
/**
     * @tc.number   SnapshotOptions_region_static_0200
     * @tc.name     SnapshotOptions_region_static_0200
     * @tc.desc     SnapshotOptions_region_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SnapshotOptions_region_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SnapshotOptions_region_0200] START');
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('LocalizedSnapshotRegion'));
      await CommonFunc.sleep(2000);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('image1');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SnapshotOptions_region_0200] strJson is: ' + strJson);
      console.info('[SnapshotOptions_region_0200] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('width')));
      console.info('[SnapshotOptions_region_0200] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('height')));
      let height: string = obj.getElement('$attrs').getString('height');
      let width: string = obj.getElement('$attrs').getString('width');
      expect(height === width).assertTrue();

      console.info('[SnapshotOptions_region_0200] END');
      done();
    });


    
    
/**
     * @tc.number   SnapshotOptions_region_static_0300
     * @tc.name     SnapshotOptions_region_static_0300
     * @tc.desc     SnapshotOptions_region_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SnapshotOptions_region_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SnapshotOptions_region_0300] START');
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('SnapshotRegion1'));
      await CommonFunc.sleep(2000);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('image2');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SnapshotOptions_region_0300] strJson is: ' + strJson);
      console.info('[SnapshotOptions_region_0300] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('width')));
      console.info('[SnapshotOptions_region_0300] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('height')));
      expect(obj.getElement('$attrs').getString('height')).assertEqual('470.66vp');
      expect(obj.getElement('$attrs').getString('width')).assertEqual('470.66vp');


      console.info('[SnapshotOptions_region_0300] END');
      done();
    });


    
    
/**
     * @tc.number   SnapshotOptions_region_static_0400
     * @tc.name     SnapshotOptions_region_static_0400
     * @tc.desc     SnapshotOptions_region_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SnapshotOptions_region_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SnapshotOptions_region_0400] START');
      let driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('LocalizedSnapshotRegion1'));
      await CommonFunc.sleep(2000);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('image2');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SnapshotOptions_region_0400] strJson is: ' + strJson);
      console.info('[SnapshotOptions_region_0400] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('width')));
      console.info('[SnapshotOptions_region_0400] SnapshotOptions_region obj is: ' +
      JSON.stringify(obj.getElement('$attrs').getString('height')));
      expect(obj.getElement('$attrs').getString('height')).assertEqual('470.66vp');
      expect(obj.getElement('$attrs').getString('width')).assertEqual('470.66vp');

      console.info('[SnapshotOptions_region_0400] END');
      done();
    });
  })
}