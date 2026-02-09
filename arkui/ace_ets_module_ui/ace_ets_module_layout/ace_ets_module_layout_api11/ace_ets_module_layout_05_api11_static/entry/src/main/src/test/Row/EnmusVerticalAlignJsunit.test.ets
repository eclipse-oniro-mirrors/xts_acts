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
import Utils from '../Utils.test';
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

export default function enumsVerticalAlignJsunit() {
  describe('enumsVerticalAlign', () => {
    beforeAll(() => {
      console.info("enumsVerticalAlign beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("enumsVerticalAlignJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/enumsVerticalAlign',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get enumsVerticalAlignJsunit state pages: " + JSON.stringify(pages));
        if (!("enumsVerticalAlign" == pages.name)) {
          console.info("get enumsVerticalAlignJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enumsVerticalAlignJsunit page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('[ afterEach ] ===================enumsFlexItemTest test after each called===================');
    });
    
    
    

/**
     * @tc.number   enumsVerticalAlignTest_static_0100
     * @tc.name     enumsVerticalAlignTest_static_0100
     * @tc.desc     enumsVerticalAlignTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enumsVerticalAlignTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsVerticalAlignTest_static_0100 START');
      await CommonFunc.sleep(1500);
      let strJson: string = inspector.getInspectorByKey('VerticalAlign');
      console.info("enumsVerticalAlignTest_static_0100 component strJson:" + strJson);
     console.info("enumsVerticalAlignTest_static_0100 component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')).assertEqual('VerticalAlign.Center');
      console.info('enumsVerticalAlignTest_static_0100 END');
      done();
    });
  })
}
