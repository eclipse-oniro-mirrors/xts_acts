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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;











export default function rowJsunit() {
  describe('rowTest', () => {
    beforeAll(() => {
      console.info("rowTest beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("rowJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/Row',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get rowJsunit state pages: " + JSON.stringify(pages));
        if (!("Row" == pages.name)) {
          console.info("get rowJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push rowJsunit page error: " + err);
      }
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000)
      console.info("Row after each called");
    });

    
    
    

/**
     * @tc.number   rowTest001_static_01
     * @tc.name     rowTest001_static_01
     * @tc.desc     rowTest001_static_01
     * @tc.level    Level.LEVEL0
     */
it('rowTest001_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('++++++++++++++++ rowTest001_static_01 START ++++++++++++++++');
      await UtilsTest.msSleep(1000)
      let strJson = inspector.getInspectorByKey('row');
     let obj = JSON.parseJsonElement(strJson);
     console.info("get inspector value is: " + JSON.stringify(obj));
     console.log(JSON.stringify(obj.getString('$type')))
     expect(obj.getString('$type')).assertEqual('Row')
     console.log('Row‘s alignItems is ' + JSON.stringify(obj.getElement('$attrs').getString('alignItems')))
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('VerticalAlign.Top')
      console.info('++++++++++++++++ rowTest001_static_01 End ++++++++++++++++');
      done();
    });
  })
}
