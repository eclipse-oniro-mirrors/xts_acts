'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function listDidJsunit() {
  describe('listDidJsunit', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listDidJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listDid",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listDidJsunit state pages:" + JSON.stringify(pages));
        if (!("listDid" == pages.name)) {
          console.info("get listDidJsunit pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listDidJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listDidJsunit page error:" + err);
      }
      console.info("listDidJsunit beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listDidJsunit after each called");
    });


    
    /**
     * @tc.number   listDidJsunit_static_0100
     * @tc.name     listDidJsunit_static_0100
     * @tc.desc     listDidJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listDidJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listDidJsunit_static_0100] START');
      let listRect = CommonFunc.getComponentRectOnScreen('scrollSource_list')
      let driver = Driver.create()
      await driver.fling({
        x: (Number.parseInt(`${(listRect.right - listRect.left) * 0.5 + listRect.left}`)).toInt(),
        y: (Number.parseInt(`${(listRect.bottom - listRect.top) * 0.6 + listRect.top}`)).toInt()
      },
        {
          x: (Number.parseInt(`${(listRect.right - listRect.left) * 0.5 + listRect.left}`)).toInt(),
          y: (Number.parseInt(`${(listRect.bottom - listRect.top) * 0.2 + listRect.top}`)).toInt()
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('list_onDidScroll');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listDidJsunit_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[listDidJsunit_static_0100] content: " +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('scrollState: 0');
      console.info('[listDidJsunit_static_0100] END');
      done();
    });
  })
}
