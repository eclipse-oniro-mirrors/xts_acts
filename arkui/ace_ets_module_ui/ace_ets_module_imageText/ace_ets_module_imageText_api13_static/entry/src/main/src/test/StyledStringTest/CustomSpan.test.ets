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
import { Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
import inspector from '@ohos.arkui.inspector';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function CustomSpan() {
  describe('CustomSpan', () => {
    beforeAll(() => {
      console.info("CustomSpan beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api13.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("CustomSpan beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/CustomSpan',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomSpan state success " + JSON.stringify(pages));
        // let result = routerInstance.replaceUrl(options);
        routerInstance.replaceUrl(options);
        if (!("CustomSpan" == pages.name)) {
          console.info("get CustomSpan state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          // console.info("push CustomSpan page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomSpan page error: " + err);
      }
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CustomSpan after each called");
    });


    

    
/**
     * @tc.number   CustomSpan_static_0001
     * @tc.name     CustomSpan_static_0001
     * @tc.desc     CustomSpan_static_0001
     * @tc.level    Level.LEVEL1
     */
it('CustomSpan_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString CustomSpan0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('invalidate'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('StyledString CustomSpan0001 CustomSpanFontSize ' + AppStorage.get<number>('CustomSpanFontSize'));
      expect('' + AppStorage.get<number>('CustomSpanFontSize')).assertEqual('30');
      console.info('StyledString CustomSpan0001 CustomSpanWord ' + AppStorage.get<string>('CustomSpanWord'));
      expect('' + AppStorage.get<string>('CustomSpanWord')).assertEqual('你好');
      AppStorage.delete('CustomSpanFontSize')
      AppStorage.delete('CustomSpanWord')
      console.info("[CustomSpan0001] end");
      done();
    });
  })
}