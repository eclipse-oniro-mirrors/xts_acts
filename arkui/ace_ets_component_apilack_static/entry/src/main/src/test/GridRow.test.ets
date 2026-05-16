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


export default function grid_rowOnBreakpointChangeJsunit() {
  describe('grid_rowOnBreakpointChangeTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid_row',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get grid_row state success " + JSON.stringify(pages));
        if (!("grid_row" == pages.name)) {
          console.info("get grid_row state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push grid_row page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("grid_rowOnBreakpointChange after each called");
    });

    
    
    
    /**
     * @tc.number   testgrid_rowOnBreakpointChange_static_001
     * @tc.name     testgrid_rowOnBreakpointChange_static_001
     * @tc.desc     testgrid_rowOnBreakpointChange_static_001
     * @tc.level    Level.LEVEL0
     */
it('testgrid_rowOnBreakpointChange_static_001', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridRow');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100vp");
      console.info("[testgrid_rowOnBreakpointChange001] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    
    
    /**
     * @tc.number   testgrid_rowOnBreakpointChange_static_002
     * @tc.name     testgrid_rowOnBreakpointChange_static_002
     * @tc.desc     testgrid_rowOnBreakpointChange_static_002
     * @tc.level    Level.LEVEL0
     */
it('testgrid_rowOnBreakpointChange_static_002', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridRow');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("100vp");
      console.info("[testgrid_rowOnBreakpointChange002] height value :" + obj.getElement('$attrs').getString('height'));

    });

    
    
    
    /**
     * @tc.number   testgrid_rowOnBreakpointChange_static_003
     * @tc.name     testgrid_rowOnBreakpointChange_static_003
     * @tc.desc     testgrid_rowOnBreakpointChange_static_003
     * @tc.level    Level.LEVEL0
     */
it('testgrid_rowOnBreakpointChange_static_003', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange003] component backgroundColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridRow');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("0xFF0000");
      console.info("[testgrid_rowOnBreakpointChange003] backgroundColor value :" +
      obj.getElement('$attrs').getString('backgroundColor'));
    });
  })
}
