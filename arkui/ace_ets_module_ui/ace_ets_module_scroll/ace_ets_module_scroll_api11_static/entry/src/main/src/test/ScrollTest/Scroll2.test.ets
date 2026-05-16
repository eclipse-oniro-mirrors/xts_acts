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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from "../../../ets/MainAbility/common/Common";
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ScrollTest2() {
  describe('ScrollTest2', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Index2',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index2" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(3000);
          // console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUX_Scroll_Visual_static_0010
     * @tc.name     ArkUX_Scroll_Visual_static_0010
     * @tc.desc     ArkUX_Scroll_Visual_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Scroll_Visual_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Scroll_Visual_static_0010 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Scroll_Visual_0010');
          console.info('ArkUX_Scroll_Visual_static_0010 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Scroll_Visual_static_0010 obj is: " + JSON.stringify(obj));
          let scrollable: string = obj.getElement('$attrs').getString('scrollable')
          expect(scrollable).assertEqual("ScrollDirection.Vertical");
          console.info('ArkUX_Scroll_Visual_static_0010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Scroll_Visual_static_0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}