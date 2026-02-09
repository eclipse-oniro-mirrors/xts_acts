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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../../Util.test'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function requestFocus7() {
  describe('requestFocus7', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("requestFocus7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus7',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get requestFocus7 state pages:" + JSON.stringify(pages));
        if (!("requestFocus7" == pages.name)) {
          console.info("get requestFocus7 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push requestFocus7 page error:" + err);
      }
      console.info("requestFocus7 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
    });

    /**
     * @tc.number requestFocus7_static_0100
     * @tc.name   requestFocus7_static_0100
     * @tc.desc
     */
    it('requestFocus7_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('requestFocus7_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('requestFocus7_btn2', 10, "")
      await CommonFunc.sleep(1000);
      console.info('click after')

      let text1 = inspector.getInspectorByKey('requestFocus7_text1');
      expect(JSON.stringify(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')))
        .assertEqual('"150003"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus7_static_0100 END');
      done();
    });

  })
}