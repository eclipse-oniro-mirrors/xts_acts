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


export default function pathNewTest() {
  describe('pathNewTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/path',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get path state success " + JSON.stringify(pages));
        if (!("path" == pages.name)) {
          console.info("get path state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          ;
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push path page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("pathNe after each called");
    });

    
    
    
    /**
     * @tc.number   testpathNe_static_0001
     * @tc.name     testpathNe_static_0001
     * @tc.desc     testpathNe_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testpathNe_static_0001', Level.LEVEL0, async () => {
      console.info('pathNe testpathNe0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Path');
      console.info("[testpathNe0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Path');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00px");
      console.info("[testpathNe0001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testpathNe_static_0002
     * @tc.name     testpathNe_static_0002
     * @tc.desc     testpathNe_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testpathNe_static_0002', Level.LEVEL0, async () => {
      console.info('pathNe testpathNe0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Path');
      console.info("[testpathNe0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Path');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("100.00px");
      console.info("[testpathNe0002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testpathNe_static_0003
     * @tc.name     testpathNe_static_0003
     * @tc.desc     testpathNe_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testpathNe_static_0003', Level.LEVEL0, async () => {
      console.info('pathNe testpathNe0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Path');
      console.info("[testpathNe0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Path');
      expect(obj.getElement('$attrs').getString('commands')).assertEqual("M150 0 L300 300 L0 300 Z");
      console.info("[testpathNe0003] commands value :" + obj.getElement('$attrs').getString('commands'));

    });
  })
}
