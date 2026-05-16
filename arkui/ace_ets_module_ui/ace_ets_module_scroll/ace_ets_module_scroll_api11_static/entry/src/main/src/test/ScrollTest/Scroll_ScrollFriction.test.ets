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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function scroll_ScrollFrictionTest() {
  describe('scroll_ScrollFrictionTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollFrictionPage',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get ScrollFrictionPage state pages:" + JSON.stringify(pages));
        if (!("ScrollFrictionPage" == pages.name)) {
          console.info("get Scroll_ScrollInitialIndex1 pages.name:" + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ScrollFrictionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollFrictionPage page error:" + err);
      }
      console.info("ScrollFrictionPage beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ScrollFrictionPage after each called");
    });


    
    /**
     * @tc.number   testScrollFriction_static_0100
     * @tc.name     testScrollFriction_static_0100
     * @tc.desc     testScrollFriction_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testScrollFriction_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollFriction_static_0100] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'friction', value: -1
      })
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = inspector.getInspectorByKey('Scroll_ScrollFriction');
      expect(JSON.parseJsonElement(scrollContainerStrJson).getString('$type')).assertEqual('Scroll');
      console.info('[testScrollFriction_static_0100] scrollContainerStrJson friction: ' +
      JSON.parseJsonElement(scrollContainerStrJson).getElement('$attrs').getDouble('friction'));
      let scrollDefJson = inspector.getInspectorByKey('scroll_friction_default');
      console.info('[testScrollFriction_static_0100] scrollDefJson friction: ' +
      JSON.parseJsonElement(scrollDefJson).getElement('$attrs').getDouble('friction'));
      expect(JSON.parseJsonElement(scrollContainerStrJson).getElement('$attrs').getDouble('friction'))
        .assertEqual(JSON.parseJsonElement(scrollDefJson).getElement('$attrs').getDouble('friction'));
      console.info('[testScrollFriction_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   testScrollFriction_static_0200
     * @tc.name     testScrollFriction_static_0200
     * @tc.desc     testScrollFriction_static_0200
     * @tc.level    Level.LEVEL0
     */
it('testScrollFriction_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testScrollFriction_static_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'friction', value: 10
      })
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = inspector.getInspectorByKey('Scroll_ScrollFriction');
      expect(JSON.parseJsonElement(scrollContainerStrJson).getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(scrollContainerStrJson).getElement('$attrs').getDouble('friction')).assertEqual(10);
      console.info('[testScrollFriction_static_0200] END');
      done();
    });
  })
}
