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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function search_bottom() {
  describe('search_bottom', () => {
    beforeAll(() => {
      console.info("search_bottom beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("search_bottom beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search_bottom',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get search_bottom state pages: " + JSON.stringify(pages));
        if (!("search_bottom" == pages.name)) {
          console.info("get search_bottom state pages.name: " + '');
          await CommonFunc.sleep(2000);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push search_bottom page result: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push search_bottom page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   search_bottom_static_001
     * @tc.name     search_bottom_static_001
     * @tc.desc     search_bottom_static_001
     * @tc.level    Level.LEVEL2
     */
    it('search_bottom_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[search_bottom_001] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") ?? 0 == 0) {
        console.log('get click before Initial value')
        let text_00 = CommonFunc.getComponentRect('search_bottom_text_00');
        let text_01 = CommonFunc.getComponentRect('search_bottom_text_01');
        let text_02 = CommonFunc.getComponentRect('search_bottom_text_02');
        let text_03 = CommonFunc.getComponentRect('search_bottom_text_03');
        let Column_1 = CommonFunc.getComponentRect('search_bottom_Column_1');
        let driver = Driver.create();
        await CommonFunc.sleep(500);
        await (driver.mouseScroll({
          x: 360, y: 640
        }, true, 30, 2072) as Promise<void>)
        await CommonFunc.sleep(1000);
        console.log('get swipe after Initial value')
        let search_01 = CommonFunc.getComponentRect('search_bottom_search_01');
        console.log('assert click before position')
        let y1 = search_01.bottom
        await (driver.click(
          Math.round(search_01.left + (search_01.right - search_01.left) / 2) as Int,
          Math.round(search_01.top + (search_01.bottom - search_01.top) / 2) as Int
        ) as Promise<void>)
        await CommonFunc.sleep(1000);
        console.log('get click after Initial value')
        let search_02 = CommonFunc.getComponentRect('search_bottom_search_01');
        let y2 = search_02.bottom
        expect(y1).assertEqual(y2);
      }
      done();
    });
  })
}
