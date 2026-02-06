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

export default function requestFocus14() {
  describe('requestFocus14', () => {
    beforeAll(() => {
      console.info("requestFocus14 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("requestFocus14 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/requestFocus/requestFocus14',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get requestFocus14 state pages:" + JSON.stringify(pages));
        if (!("requestFocus14" == pages.name)) {
          console.info("get requestFocus14 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push requestFocus14 page error:" + err);
      }
      console.info("requestFocus14 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
    });

    /**
     * @tc.number requestFocus14_static_0100
     * @tc.name   requestFocus14_static_0100
     * @tc.desc
     */
    it('requestFocus14_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('requestFocus14_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let bnt1 = await (driver.findComponent(ON.id('requestFocus14_btn1')) as Promise<Component>);
      await bnt1.click()
      await CommonFunc.sleep(2000);

      let bnt2 = await (driver.findComponent(ON.id('requestFocus14_btn2')) as Promise<Component>);
      await bnt2.click()
      await CommonFunc.sleep(2000);

      let textInput1 = inspector.getInspectorByKey('requestFocus14_textInput1');
      expect(JSON.stringify(JSON.parseJsonElement(textInput1).getElement('$attrs').getString('text')))
        .assertEqual('"TextInput_1"');
      await CommonFunc.sleep(1000);

      console.info('requestFocus14_static_0100 END');
      done();
    });

  })
}