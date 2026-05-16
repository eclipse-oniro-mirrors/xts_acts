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

import RectValue from './RectValue.test';

export default function gridMaxCountJsunit() {
  describe('gridMaxCountTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("grid" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridMaxCount after each called");
    });

    
    
    /**
     * @tc.number   testcheckgridMaxCount_static_0001
     * @tc.name     testcheckgridMaxCount_static_0001
     * @tc.desc     testcheckgridMaxCount_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcheckgridMaxCount_static_0001', Level.LEVEL0, async () => {
      console.info('testcheckgridMaxCount testcheckgridMaxCount0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('maxCountTest');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid');
      console.info("[testcheckgridMaxCount0001] selectedMaxCount value :" +
      obj.getElement('$attrs').getDouble('maxCount'));
      expect(obj.getElement('$attrs').getDouble('maxCount') == 5).assertTrue();

    });

    
    
    /**
     * @tc.number   testEdgeEffectOptions_static_0002
     * @tc.name     testEdgeEffectOptions_static_0002
     * @tc.desc     testEdgeEffectOptions_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testEdgeEffectOptions_static_0002', Level.LEVEL0, async () => {
      console.info('testEdgeEffectOptions testEdgeEffectOptions0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('maxCountTest');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(obj1.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertTrue();
      console.info("edgeEffectOptions value :" +
      obj1.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));
    });

    
    
    /**
     * @tc.number   testEdgeEffectOptions_static_0003
     * @tc.name     testEdgeEffectOptions_static_0003
     * @tc.desc     testEdgeEffectOptions_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testEdgeEffectOptions_static_0003', Level.LEVEL0, async () => {
      console.info('testEdgeEffectOptions testEdgeEffectOptions0003 START');
      await Utils.sleep(2000);
      try {
        AppStorage.setOrCreate<boolean>('alwaysEnabled', false);
      } catch (err: Error) {
        console.log("[testEdgeEffectOptions0003] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('maxCountTest');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(obj1.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled')).assertFalse();
      console.info("edgeEffectOptions value :" +
      obj1.getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });
  })
}
