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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
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


export default function lineNeJsunit() {
  describe('lineNeTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/line',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("lineNe after each called");
    });

    
    
    
    /**
     * @tc.number   testlineNe_static_0001
     * @tc.name     testlineNe_static_0001
     * @tc.desc     testlineNe_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testlineNe_static_0001', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('line1');
      console.info("[testlineNe0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Line');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("50.00vp");
      console.info("[testlineNe0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testlineNe_static_0002
     * @tc.name     testlineNe_static_0002
     * @tc.desc     testlineNe_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testlineNe_static_0002', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('line1');
      console.info("[testlineNe0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Line');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("100.00vp");
      console.info("[testlineNe0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testlineNe_static_0005
     * @tc.name     testlineNe_static_0005
     * @tc.desc     testlineNe_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testlineNe_static_0005', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('line2');
      console.info("[testlineNe0005] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Line');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("200.00vp");
      console.info("[testlineNe0005] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testlineNe_static_0006
     * @tc.name     testlineNe_static_0006
     * @tc.desc     testlineNe_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testlineNe_static_0006', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('line2');
      console.info("[testlineNe0006] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Line');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("200.00vp");
      console.info("[testlineNe0006] height value :" + obj.getElement('$attrs').getString('height'));

    });
  })
}
