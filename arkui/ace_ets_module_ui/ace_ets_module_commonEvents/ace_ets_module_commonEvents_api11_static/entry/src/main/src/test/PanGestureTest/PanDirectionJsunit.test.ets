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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';

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

export default function fontWeightJsunit() {
  describe('panDirectionTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("panDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/panDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get panDirectionTest state pages:" + JSON.stringify(pages));
        if (!("panDirection" == pages.name)) {
          console.info("get panDirectionTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push panDirectionTest page error:" + err);
      }
      console.info("panDirectionTest beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("panDirection after each called");
    });


    
    /**
     * @tc.number   panDirectionText_static_0100
     * @tc.name     panDirectionText_static_0100
     * @tc.desc     panDirectionText_static_0100
     * @tc.level    Level.LEVEL0
     */
it('panDirectionText_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('panDirectionText_0100 START');
      let strJson = inspector.getInspectorByKey('panDirection');
      await Utils.sleep(1000);
      console.info("panDirectionText_0100 component strJson:" + strJson);
      console.info("panDirectionText_0100 component obj is: " +
      JSON.stringify(String(JSON.parseJsonElement(strJson).getElement("$attrs"))))
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Flex');
      done();
    });

  })
}