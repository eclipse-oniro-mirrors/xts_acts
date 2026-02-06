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
import {describe, beforeAll, afterEach, afterAll, it, expect,beforeEach,Level} from "../../../../hypium/index"
import router from '@ohos.router';

import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils2.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
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
export default function DividerJsunit() {
  describe('DividerJsunit',  () => {
    beforeAll(() => {
      console.info("DividerJsunit beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
   beforeEach(async (): Promise<void> => {
     console.info("divider beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/dividerPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get divider state pages: " + "");
        if (!("dividerPage" == pages.name)) {
          console.info("get divider pages.name: " + "");
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push divider page error: " + err);
      }
    });
    afterEach(async () =>  {
      await Utils.sleep(1000);
      console.info("divider after each called");
    })
    
    
    

/**
     * @tc.number   testDividerColor01_static_01
     * @tc.name     testDividerColor01_static_01
     * @tc.desc     testDividerColor01_static_01
     * @tc.level    Level.LEVEL0
     */
it('testDividerColor01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'testDividerColor01_static_01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
       let strJson = inspector.getInspectorByKey('dividerkey');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[testDividerColor01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
     console.info('[' + tagName + '] component obj is: ' + strJson);
     expect(obj.getString('$type')).assertEqual('Divider');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
