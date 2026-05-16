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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function preventDefault() {
  describe('preventDefault', () => {
    beforeAll(() => {
      console.info("preventDefault beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("preventDefault beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Hyperlink/preventDefault",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get preventDefault state pages:" + "");
        if (!("preventDefault" == pages.name)) {
          console.info("get preventDefault pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push preventDefault page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push preventDefault page error:" + err);
      }
      console.info("preventDefault beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("preventDefault after each called");
    });


    
    /**
     * @tc.number   preventDefault_static_0001
     * @tc.name     preventDefault_static_0001
     * @tc.desc     preventDefault_static_0001
     * @tc.level    Level.LEVEL0
     */
it('preventDefault_static_0001', Level.LEVEL0, async () => {
      try {
        let driver = Driver.create();
          console.info('preventDefault preventDefault0001 START');
          await CommonFunc.sleep(1000);
          let hyperlink1 = await driver.findComponent(ON.id('hyperlink1'));
          await CommonFunc.sleep(500);
          await (hyperlink1?.click() as Promise<void>)
          await CommonFunc.sleep(500);

          let hyperlink3 = await driver.findComponent(ON.id('hyperlink3'));
          await CommonFunc.sleep(500);
          await (hyperlink3?.click() as Promise<void>)
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('禁掉onclick'));
          console.info("[preventDefault0001] end");
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
