'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Matrix2DTest() {
  describe('Matrix2DTest', () => {
    beforeAll(() => {
      console.info("Matrix2DTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Matrix2D/Matrix2DPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Matrix2DPage state pages:" + JSON.stringify(pages));
        if (!("Matrix2DPage" == pages.name)) {
          console.info("get Matrix2DPage pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Matrix2DPage page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("Matrix2D after each called");
    });

    
    /**
     * @tc.number   testMatrix2D_static_0010
     * @tc.name     testMatrix2D_static_0010
     * @tc.desc     testMatrix2D_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testMatrix2D_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testMatrix2D_static_0010] START');
      await Utils.sleep(2000);

      let strJson: string = inspector.getInspectorByKey('Matrix2DMultiplyCanvas');
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Canvas');

      let strJson2: string = inspector.getInspectorByKey('Matrix2DRotateCanvas');
      expect(JSON.parseJsonElement(strJson2).getString("$type")).assertEqual('Canvas');

      console.info('[testMatrix2D_static_0010] END');
      done();
    });
  })
}
