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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridColOffsetJsunit() {
  describe('GridColOffsetJsunit', () => {
    beforeAll(() => {
      console.info("GridColOffsetJsunit beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridColOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridColoffsetPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridColOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("GridColoffsetPage" == pages.name)) {
          console.info("get GridColOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridColOffsetJsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridColOffsetJsunit_static_0100
     * @tc.name     GridColOffsetJsunit_static_0100
     * @tc.desc     GridColOffsetJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GridColOffsetJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      let strJson = inspector.getInspectorByKey('keykey2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridCol');
      console.info("[GridColOffsetJsunit_static_0100] component  strJson:" +
      JSON.stringify(obj.getElement('$attrs').getString('gridColOffset')));
      expect(obj.getElement('$attrs').getString('gridColOffset')).assertEqual("0");
      done();
    });
    
    
    

/**
     * @tc.number   GridColOffsetJsunit_static_0200
     * @tc.name     GridColOffsetJsunit_static_0200
     * @tc.desc     GridColOffsetJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('GridColOffsetJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridColOffsetJsunit_static_0200] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({ name: 'gridColoffset', value: 2 });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('keykey2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridCol');
      console.info("[GridColOffsetJsunit_static_0200] component  strJson:" +
      JSON.stringify(obj.getElement('$attrs').getString('gridColOffset')));
      expect(obj.getElement('$attrs').getString('gridColOffset')).assertEqual("2");
      done();
    });

  })
}
