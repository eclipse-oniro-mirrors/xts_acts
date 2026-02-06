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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Length } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function measureOptionsTest() {
  describe('measureOptionsTest', () => {

    beforeAll(() => {
      console.info("measureOptionsTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("measureOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/measureOptionsTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get measureOptionsTest state pages:" + JSON.stringify(pages));
        if (!("measureOptionsTest" == pages.name)) {
          console.info("get measureOptionsTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push measureOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push measureOptionsTest page error:" + err);
      }
      console.info("measureOptionsTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("measureOptionsTest after each called");
    });

    
    /**
     * @tc.number   measureOptionsTest_static_0001
     * @tc.name     measureOptionsTest_static_0001
     * @tc.desc     measureOptionsTest_static_0001
     * @tc.level    Level.LEVEL1
     */
    it('measureOptionsTest_static_0001', Level.LEVEL1, async (done: ()=>void) => {
      let driver = Driver.create();
      console.info('SizeOptions measureOptionsTest_static_0001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getWidthAndHeight'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let textStyle1Width = AppStorage.get<number>('textStyle1Width') as number
      expect(textStyle1Width > 0).assertTrue();
      let textStyle1Height = AppStorage.get<number>('textStyle1Height') as number
      expect(textStyle1Height > 0).assertTrue();
      let textStyle2Width  = AppStorage.get<number>('textStyle2Width') as number
      expect(textStyle2Width > 0).assertTrue();
      let textStyle2Height = AppStorage.get<number>('textStyle2Height') as number
      expect(textStyle2Height > 0).assertTrue();
      let textStyle3Width = AppStorage.get<number>('textStyle3Width') as number
      expect(textStyle3Width > 0).assertTrue();
      let textStyle3WHeight = AppStorage.get<number>('textStyle3WHeight') as number
      expect(textStyle3WHeight > 0).assertTrue();
      AppStorage.delete('textStyle1Width')
      AppStorage.delete('textStyle1Height')
      AppStorage.delete('textStyle2Width')
      AppStorage.delete('textStyle2Width')
      AppStorage.delete('textStyle3Width')
      AppStorage.delete('textStyle3Height')
      console.info("[measureOptionsTest_static_0001] end");
      done();
    });
  })
}