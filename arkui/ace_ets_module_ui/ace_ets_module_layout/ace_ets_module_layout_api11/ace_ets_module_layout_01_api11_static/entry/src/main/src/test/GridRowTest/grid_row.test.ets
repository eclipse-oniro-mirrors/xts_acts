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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {FlexAlign} from '@ohos.arkui.component'
// import {fp2px,lpx2px} from '@ohos.arkui.UIContext'
import  RectValue from '../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../ets/MainAbility/common/Common';
// import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function grid_rowOnBreakpointChangeJsunit() {
  describe('grid_rowOnBreakpointChangeTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridRow/grid_row',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get grid_row state success " + JSON.stringify(pages));
        if (!("grid_row" == pages?.name)) {
          console.info("get grid_row state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          // let result = await router.push(options);
          await CommonFunc.sleep(2000);
          // console.info("push grid_row page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid_row page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("grid_rowOnBreakpointChange after each called");
    });

    
    



    /**
     * @tc.number  testgrid_rowOnBreakpointChange001_static
     * @tc.name     testgrid_rowOnBreakpointChange001_static
     * @tc.desc     testgrid_rowOnBreakpointChange001_static
     * @tc.level    Level.LEVEL0
     */
    it('testgrid_rowOnBreakpointChange001_static', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange001_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange001_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridRow');
      console.info("[testgrid_rowOnBreakpointChange001_static] width value :" + obj.getElement('$attrs').getString('width'));
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100vp");
    });

    
    



    /**
     * @tc.number  testgrid_rowOnBreakpointChange002_static
     * @tc.name     testgrid_rowOnBreakpointChange002_static
     * @tc.desc     testgrid_rowOnBreakpointChange002_static
     * @tc.level    Level.LEVEL0
     */
    it('testgrid_rowOnBreakpointChange002_static', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridRow');
      console.info("[testgrid_rowOnBreakpointChange002] height value :" + obj.getElement('$attrs').getString('height'));
      expect(obj.getElement('$attrs').getString('height')).assertEqual("100vp");
    });

    
    



    /**
     * @tc.number  testgrid_rowOnBreakpointChange003_static
     * @tc.name     testgrid_rowOnBreakpointChange003_static
     * @tc.desc     testgrid_rowOnBreakpointChange003_static
     * @tc.level    Level.LEVEL0
     */
    it('testgrid_rowOnBreakpointChange003_static', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_rowOnBreakpointChange003_static START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange003_static] component backgroundColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridRow');
      console.info("[testgrid_rowOnBreakpointChange003_static] backgroundColor value :" + obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("0xFF0000");
    });
  })
}
