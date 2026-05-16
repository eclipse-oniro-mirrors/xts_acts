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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function dstIndexTest() {
  describe('dstIndexTest', (): void => {
    beforeAll(() => {
      console.info("dstIndexTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("dstIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Matrix/dstIndex",
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dstIndexTest state pages:" + JSON.stringify(pages));
        if (!("dstIndex" == pages.name)) {
          console.info("get dstIndexTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dstIndexTest page error:" + err);
      }
      console.info("dstIndexTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dstIndexTest after each called");
    });

    
    /**
     * @tc.number   dstIndexTest_static_001
     * @tc.name     dstIndexTest_static_001
     * @tc.desc     dstIndexTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it('dstIndexTest_static_001',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dstIndexTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let img = await driver.findComponent(ON.id('img'));
      await CommonFunc.sleep(1000);
      let rect = await (img?.getBounds() as Promise<Rect>);
      await CommonFunc.sleep(1000);
      let width1 = rect.right - rect.left
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let width2 = rect.right - rect.left
      console.info('width1: ' + width1);
      console.info('width2: ' + width2);
      expect(Math.abs(width1 - width2) <= 1).assertTrue();
      console.info('[dstIndexTest_001] END');
      done();
    });
  })
}
