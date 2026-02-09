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


import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

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

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RelativeContainerStartApi() {
  describe('RelativeContainerStartApi', () => {
    beforeAll(() => {
      console.info("RelativeContainerStartApi beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainerStartApi beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainerStart/RelativeContainerStartApi",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainerStartApi state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerStartApi" == pages.name)) {
          console.info("get RelativeContainerStartApi pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RelativeContainerStartApi page error:" + err);
      }
      console.info("RelativeContainerStartApi beforeEach end");
    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   RelativeContainerStartApi_static_0100
     * @tc.name     RelativeContainerStartApi_static_0100
     * @tc.desc     RelativeContainerStartApi_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RelativeContainerStartApi_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RelativeContainerStartApi_static_0100 START');
      await CommonFunc.sleep(1000);

      let row1 = CommonFunc.getComponentRect('row1')
      let row2 = CommonFunc.getComponentRect('row2')
      let row3 = CommonFunc.getComponentRect('row3')

      expect(Math.abs(row3.left - row2.right) <= 1).assertTrue();
      expect(Math.abs(row3.top - row1.top) <= 1).assertTrue();
      await CommonFunc.sleep(1000);

      console.info('RelativeContainerStartApi_static_0100 END');
      done();
    });

  })
}