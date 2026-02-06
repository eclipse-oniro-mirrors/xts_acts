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

import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common'

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function gestureParallelJsunit() {
  describe('gestureParallelTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("gestureParallelTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureGroup/gesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureParallelTest state pages:" + JSON.stringify(pages));
        if (!("gesture" == pages.name)) {
          console.info("get gestureParallelTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureParallelTest page error:" + err);
      }
      console.info("gestureParallelTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gestureParallel after each called");
    });


    
    /**
     * @tc.number   testgestureParallel_static_0001
     * @tc.name     testgestureParallel_static_0001
     * @tc.desc     testgestureParallel_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testgestureParallel_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gestureParallel testgestureParallel0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ParallelText');
      await CommonFunc.sleep(2000);
      console.info("[testgestureParallel0001] component width strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString('width')).assertEqual("320.00vp");
      console.info("[testgestureParallel0001] width value :" +
      JSON.parseJsonElement(strJson).getElement("$attrs").getString('width'));
      done();
    });
  })
}
