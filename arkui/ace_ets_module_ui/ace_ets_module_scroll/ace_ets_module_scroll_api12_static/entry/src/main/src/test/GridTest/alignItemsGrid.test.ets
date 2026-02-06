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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function alignItemsGrid() {
  describe('alignItemsGrid', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("alignItemsGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/alignItemsGrid",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get alignItemsGrid state pages:" + JSON.stringify(pages));
        if (!("alignItemsGrid" == pages.name)) {
          console.info("get alignItemsGrid pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push alignItemsGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alignItemsGrid page error:" + err);
      }
      console.info("alignItemsGrid beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("alignItemsGrid after each called");
    });


    
    /**
     * @tc.number   alignItemsGrid_0100
     * @tc.name     alignItemsGrid_0100
     * @tc.desc     alignItemsGrid_0100
     * @tc.level    Level.LEVEL0
     */
it('alignItemsGrid_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alignItemsGrid_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text_00 = CommonFunc.getComponentRect('default_0');
      let height_0 = text_00.bottom - text_00.top;
      console.info("alignItemsGrid_0100 height_0 is" + height_0);

      let text_01 = CommonFunc.getComponentRect('default_1');
      let height_1 = text_01.bottom - text_01.top;
      console.info("alignItemsGrid_0100 height_1 is" + height_1);
      await CommonFunc.sleep(1000);

      if (height_0 != height_1) {
        expect(Math.abs(Math.round(height_0) - Math.round(height_1)) > 0).assertTrue();
      }
      console.info('[alignItemsGrid_0100] END');
      done();
    });


    
    /**
     * @tc.number   alignItemsGrid_0200
     * @tc.name     alignItemsGrid_0200
     * @tc.desc     alignItemsGrid_0200
     * @tc.level    Level.LEVEL0
     */
it('alignItemsGrid_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alignItemsGrid_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let text_00 = CommonFunc.getComponentRect('stretch_0');
      let height_0 = text_00.bottom - text_00.top;
      console.info("alignItemsGrid_0200 height_0 is" + height_0);

      let text_01 = CommonFunc.getComponentRect('stretch_1');
      let height_1 = text_01.bottom - text_01.top;
      console.info("alignItemsGrid_0200 height_1 is" + height_1);
      await CommonFunc.sleep(1000);

      expect(Math.abs(Math.round(height_0) - Math.round(height_1)) <= 1).assertTrue();
      console.info('[alignItemsGrid_0200] END');
      done();
    });
  })
}
