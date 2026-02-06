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

import router from '@ohos.router';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';import inspector from '@ohos.arkui.inspector'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ContainerSpanModifierTest() {
  describe('ContainerSpanModifierTest', () => {
    beforeAll(() => {
      console.info("ContainerSpanModifierTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ContainerSpanModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/ContainerSpanModifierTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ContainerSpanModifierTest state pages:" + JSON.stringify(pages));
        if (!("ContainerSpanModifierTest" == pages.name)) {
          console.info("get ContainerSpanModifierTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ContainerSpanModifierTest page error:" + err);
      }
      console.info("ContainerSpanModifierTest beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ContainerSpanModifierTest after each called");
    });

    
    /**
     * @tc.number   ContainerSpanModifierTest_static_0001
     * @tc.name     ContainerSpanModifierTest_static_0001
     * @tc.desc     ContainerSpanModifierTest_static_0001
     * @tc.level   Level.LEVEL0
     */
    it('ContainerSpanModifierTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('ContainerSpanModifierTest0001 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContainerSpanModifierText');
      let obj = JSON.parseJsonElement(strJson);
      console.log('ContainerSpanModifierText-----' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('I\'m ContainerSpan attributeModifier');
      console.info("[ContainerSpanModifierTest0001] end");
      done();
    });
  })
}