/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import CommonFunc from '../../MainAbility/utils/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TabsAp1() {
  describe('TabsAp1', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsAp1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsAp1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsAp1 state pages:" + JSON.stringify(pages));
        if (!("TabsAp1" == pages.name)) {
          console.info("get TabsAp1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsAp1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsAp1 page error:" + err);
      }
      console.info("TabsAp1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number TabsAp1_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('TabsAp1_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TabsAp1_0100 START');
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('TabsAp1_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('tabContent3')

      await CommonFunc.sleep(1000);

      console.info('TabsAp1_0100 END');
      done();
    });

  })
}