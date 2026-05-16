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
import {describe, beforeAll,afterEach, afterAll,beforeEach, it, expect,Level} from "../../../../hypium/index"
import router from '@ohos.router';

import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
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
export default function enumsHorizontalAlignJsunit() {
  describe('enumsHorizontalAlign', () => {
    beforeAll(() => {
      console.info("enumsHorizontalAlign beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
   beforeEach(async (): Promise<void> => {
     console.info("enumsHorizontalAlign beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Column/enumsHorizontalAlign',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('beforeEach get enumsHorizontalAlign state pages:' + "");
        if (!('enumsHorizontalAlign' == pages.name)) {
          console.info('beforeEach get enumsHorizontalAlign state pages.name:' + "");
          
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          
        }
      } catch (err) {
        console.error('beforeEach push enumsHorizontalAlign page error:' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('[ afterEach ] ===================enumsFlexItemTest test after each called===================');
    });

    
    

/**
     * @tc.number   enumsHorizontalAlignTest_static_0100
     * @tc.name     enumsHorizontalAlignTest_static_0100
     * @tc.desc     enumsHorizontalAlignTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enumsHorizontalAlignTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsHorizontalAlignTest_static_0100 START');
      await Utils.sleep(1500);
      let strJson: string = inspector.getInspectorByKey('HorizontalAlign');
      console.info("enumsHorizontalAlignTest_static_0100 component strJson:" + strJson);
     console.info("enumsHorizontalAlignTest_static_0100 component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Center');
      console.info('enumsHorizontalAlignTest_static_0100 END');
      done();
    });
  })
}
