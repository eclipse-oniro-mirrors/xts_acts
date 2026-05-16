'use static';
/*
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
import { describe, beforeEach, afterEach,  it, Level, expect, beforeAll } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function PixelUnitsConversionJsunit() {
  describe('PixelUnitsConversionTest', () => {
    beforeAll(() => {
      console.info("PixelUnitsConversionTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.example.myapplication.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('PixelUnitsConversionTest beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/xts/PixelUnitsConversion',
      }
      try {
        const router = AppStorage.get<Router>("router" ) as Router
        router.clear();
        let pages = router.getState();
        console.info('get PixelUnitsConversion state pages:' + JSON.stringify(pages));
        if (!('PixelUnitsConversion' == pages.name)) {
          console.info('get PixelUnitsConversion state pages.name:' + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push PixelUnitsConversion page error:' + JSON.stringify(err));
      }
    });
    afterEach(async  () =>{
      await Utils.sleep(1000);
      console.info('PixelUnitsConversion after each called');
    });
    
    


/**
     * @tc.number   PixelUnitsConversionTest_static_0100
     * @tc.name     PixelUnitsConversionTest_static_0100
     * @tc.desc     PixelUnitsConversionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PixelUnitsConversionTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {

      console.info('PixelUnitsConversionTest_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('px2vp_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text = inspector.getInspectorByKey('px2vp_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('220');
      console.info('PixelUnitsConversionTest_0100 END');
      done();
    });
    
    


/**
     * @tc.number   PixelUnitsConversionTest_static_0200
     * @tc.name     PixelUnitsConversionTest_static_0200
     * @tc.desc     PixelUnitsConversionTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PixelUnitsConversionTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {

      console.info('PixelUnitsConversionTest_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('vp2px_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text = inspector.getInspectorByKey('vp2px_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('220');
      console.info('PixelUnitsConversionTest_0200 END');
      done();
    });
    
    


/**
     * @tc.number   PixelUnitsConversionTest_static_0300
     * @tc.name     PixelUnitsConversionTest_static_0300
     * @tc.desc     PixelUnitsConversionTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('PixelUnitsConversionTest_static_0300', Level.LEVEL0, async (done: ()=>void) => {

      console.info('PixelUnitsConversionTest_0300 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('fp2px_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text = inspector.getInspectorByKey('fp2px_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('220');
      console.info('PixelUnitsConversionTest_0300 END');
      done();
    });
    
    


/**
     * @tc.number   PixelUnitsConversionTest_static_0400
     * @tc.name     PixelUnitsConversionTest_static_0400
     * @tc.desc     PixelUnitsConversionTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('PixelUnitsConversionTest_static_0400', Level.LEVEL0, async (done: ()=>void) => {

      console.info('PixelUnitsConversionTest_0400 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('px2fp_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text = inspector.getInspectorByKey('px2fp_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('220');
      console.info('PixelUnitsConversionTest_0400 END');
      done();
    });
    
    


/**
     * @tc.number   PixelUnitsConversionTest_static_0500
     * @tc.name     PixelUnitsConversionTest_static_0500
     * @tc.desc     PixelUnitsConversionTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('PixelUnitsConversionTest_static_0500', Level.LEVEL0, async (done: ()=>void) => {

      console.info('PixelUnitsConversionTest_0500 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('lpx2px_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text = inspector.getInspectorByKey('lpx2px_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('220');
      console.info('PixelUnitsConversionTest_0500 END');
      done();
    });
    
    


/**
     * @tc.number   PixelUnitsConversionTest_static_0600
     * @tc.name     PixelUnitsConversionTest_static_0600
     * @tc.desc     PixelUnitsConversionTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('PixelUnitsConversionTest_static_0600', Level.LEVEL0, async (done: ()=>void) => {

      console.info('PixelUnitsConversionTest_0600 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('px2lpx_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text = inspector.getInspectorByKey('px2lpx_text');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('220');
      console.info('PixelUnitsConversionTest_0600 END');
      done();
    });
  })
}