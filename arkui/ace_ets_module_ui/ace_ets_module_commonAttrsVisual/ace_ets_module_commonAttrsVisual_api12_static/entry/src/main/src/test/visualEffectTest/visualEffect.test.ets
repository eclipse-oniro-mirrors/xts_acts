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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function visualEffectTest() {
  describe('visualEffectTest', () => {
    beforeAll(() => {
      console.info("visualEffectTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api12.static", "EntryAbility")
      
    });
    beforeEach(() => {
      console.info("visualEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visualEffect/visualEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get visualEffectTest state pages: " + JSON.stringify(pages));
        if (!("visualEffect" == pages.name)) {
          console.info("get visualEffectTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push visualEffectTest page error: " + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   visualEffectTest_static_0100
     * @tc.name     visualEffectTest_static_0100
     * @tc.desc     visualEffectTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('visualEffectTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('visualEffectTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('visualEffect_text');
      await CommonFunc.sleep(1000);

      console.log('visualEffectTest_static_0100 111',
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')))

      // console.log('visualEffectTest_static_0100 000 ',
      //   JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visualEffect')))

      expect(JSON.parseJsonElement(strJson).tryGetElement('$attrs')?.tryGetElement('visualEffect'))
        .assertEqual(undefined);

      console.info('visualEffectTest_static_0100 END');
      done();
    });


    
    
/**
     * @tc.number   foregroundFilterTest_static_0200
     * @tc.name     foregroundFilterTest_static_0200
     * @tc.desc     foregroundFilterTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('foregroundFilterTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('foregroundFilterTest_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('foregroundFilter_text');
      await CommonFunc.sleep(1000);
      console.log('foregroundFilterTest_static_0200', JSON.parseJsonElement(strJson).getElement('$attrs'))
      // console.log('foregroundFilterTest_static_0200',
      //   JSON.parseJsonElement(strJson).getElement('$attrs').getString('foregroundFilter'))
      expect(JSON.parseJsonElement(strJson).tryGetElement('$attrs')?.tryGetElement('foregroundFilter'))
        .assertEqual(undefined);
      console.info('foregroundFilterTest_static_0200 END');
      done();
    });


    
    
/**
     * @tc.number   backgroundFilterTest_static_0300
     * @tc.name     backgroundFilterTest_static_0300
     * @tc.desc     backgroundFilterTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('backgroundFilterTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('backgroundFilterTest_static_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('backgroundFilter_text');
      await CommonFunc.sleep(1000);
      console.log('backgroundFilterTest_static_0300', JSON.parseJsonElement(strJson).getElement('$attrs'))
      expect(JSON.parseJsonElement(strJson).tryGetElement('$attrs')?.tryGetElement('backgroundFilter'))
        .assertEqual(undefined);
      console.info('backgroundFilterTest_static_0300 END');
      done();
    });


    
    
/**
     * @tc.number   compositingFilterTest_static_0400
     * @tc.name     compositingFilterTest_static_0400
     * @tc.desc     compositingFilterTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('compositingFilterTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('compositingFilterTest_static_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('compositingFilter_text');
      await CommonFunc.sleep(1000);
      console.log('compositingFilterTest_static_0400', JSON.parseJsonElement(strJson).getElement('$attrs'))
      // console.log('compositingFilterTest_static_0400',
      //   JSON.parseJsonElement(strJson).getElement('$attrs').getString('compositingFilter'))
      expect(JSON.parseJsonElement(strJson).tryGetElement('$attrs')?.tryGetElement('compositingFilter'))
        .assertEqual(undefined);
      console.info('compositingFilterTest_static_0400 END');
      done();
    });
  })
}
