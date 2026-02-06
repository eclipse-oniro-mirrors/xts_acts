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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function onSizeChange() {
  describe('onSizeChange', () => {
    beforeAll(() => {
      console.info("onSizeChange beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api12.static", "EntryAbility")
      
    });
    beforeEach(() => {
      console.info("onSizeChange beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onSizeChange/onSizeChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onSizeChange state pages: " + JSON.stringify(pages));
        if (!("onSizeChange" == pages.name)) {
          console.info("get onSizeChange state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push onSizeChange page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   onSizeChange_static_0100
     * @tc.name     onSizeChange_static_0100
     * @tc.desc     onSizeChange_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onSizeChange_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onSizeChange_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('onSizeChangeXTS'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onSizeChangeMessage');
      console.info("[onSizeChange_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[onSizeChange_static_0100] title: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual("onSizeChange success");
      console.info('[onSizeChange_static_0100] END');
      done();
    });

  })
}

