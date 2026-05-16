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
import RectValue from '../../../ets/MainAbility/common/Rect';
import text from "@ohos.graphics.text"
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RelativeContainerApi1() {
  describe('RelativeContainerApi1', (): void => {
    beforeAll(() => {
      console.info("RelativeContainerApi1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainerApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainerApi1",
      }
      try {

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeContainerApi1 state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerApi1" == pages.name)) {
          console.info("get RelativeContainerApi1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RelativeContainerApi1 page error:" + err);
      }
      console.info("RelativeContainerApi1 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeContainerApi1 after each called");
    });

    

    /**
     * @tc.number   RelativeContainerApi1_static_001
     * @tc.name     RelativeContainerApi1_static_001
     * @tc.desc     RelativeContainerApi1_static_001
     * @tc.level    Level.LEVEL0
     */
    it('RelativeContainerApi1_static_001',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RelativeContainerApi1_001] START');
      await CommonFunc.sleep(1000);

      let row: RectValue = CommonFunc.getComponentRectOnScreen('row1');
      let row11: RectValue = CommonFunc.getComponentRectOnScreen('row11');
      let rel: RectValue = CommonFunc.getComponentRectOnScreen('RelativeContainerApi1');
      let rel2: RectValue = CommonFunc.getComponentRectOnScreen('RelativeContainerApi2');
      await CommonFunc.sleep(1000);

      console.info("[RelativeContainerApi1_001] RelativeContainerTop is: " + row.top);
      console.info("[RelativeContainerApi1_001] RelativeContainer left is: " + rel.top);
      console.info("[RelativeContainerApi1_001] RelativeContainerTop is: " + row11.top);
      console.info("[RelativeContainerApi1_001] RelativeContainer left is: " + rel2.top);
      expect(Math.abs(Math.round(row.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row11.top - rel2.top)) <= 1).assertTrue();
      await CommonFunc.sleep(1000);

      console.info('[RelativeContainerApi1_001] END');
      done();
    });







  })
}
