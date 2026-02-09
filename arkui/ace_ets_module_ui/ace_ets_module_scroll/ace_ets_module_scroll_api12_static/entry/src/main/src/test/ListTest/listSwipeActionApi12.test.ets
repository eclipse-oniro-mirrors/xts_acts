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
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listSwipeActionApi12Test() {
  describe('listSwipeActionApi12Test', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listSwipeActionApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listSwipeActionApi12"
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listSwipeActionApi12Test state pages: " + JSON.stringify(pages));
        if (!("listSwipeActionApi12" == pages.name)) {
          console.info("get listSwipeActionApi12Test state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listSwipeActionApi12Test success: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push listSwipeActionApi12Test page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   listSwipeActionApi12Test_static_001
     * @tc.name     listSwipeActionApi12Test_static_001
     * @tc.desc     listSwipeActionApi12Test_static_001
     * @tc.level    Level.LEVEL1
     */
it('listSwipeActionApi12Test_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listSwipeActionApi12Test_static_001 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      const winLeft = AppStorage.get<number>("winLeft") ?? 0
      const winTop = AppStorage.get<number>("winTop") ?? 0
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await driver.swipe(
        Math.round(winLeft + uiContext.vp2px(50)).toInt(),
        Math.round(winTop + uiContext.vp2px(108)).toInt(),
        Math.round(winLeft + uiContext.vp2px(200)).toInt(),
        Math.round(winTop + uiContext.vp2px(108)).toInt()
      );
      console.info('listSwipeActionApi12Test_static_003 START');
      await CommonFunc.sleep(5000);
      let strJson1 = inspector.getInspectorByKey('ListTestApi12_2');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('160');
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('item0')) as Component;
      btn1.click();
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('ListTestApi12_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      done();
    });
  })
}
