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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function NavigationSymbolIcon() {
  describe('NavigationSymbolIcon', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationSymbolIcon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationSymbolIcon',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationSymbolIcon state pages:" + JSON.stringify(pages));
        if (!("NavigationSymbolIcon" == pages.name)) {
          console.info("get NavigationSymbolIcon pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationSymbolIcon page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationSymbolIcon page error:" + err);
      }
      console.info("NavigationSymbolIcon beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationSymbolIcon after each called");
    });


    /**
     * @tc.number    NavigationSymbolIcon_0100
     * @tc.name      NavigationSymbolIcon_0100
     * @tc.desc      Test Navigation symbolIcon
     * @tc.level     Level 2
     */
    it('NavigationSymbolIcon_0100', 0, async (done: Function) => {
      console.info('NavigationSymbolIcon_0100 START');
      await CommonFunc.sleep(1000);

      let obj1 = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);

      expect(obj1.$children[0].$children[0].$children[0].$children[1].$children[0].$children[0].$children[0].$type).assertEqual('SymbolGlyph');
      console.info('NavigationSymbolIcon_0100 syb1');
      expect(obj1.$children[0].$children[0].$children[2].$children[0].$children[0].$children[0].$children[1].$type).assertEqual('SymbolGlyph');
      console.info('NavigationSymbolIcon_0100 syb2');
      expect(obj1.$children[0].$children[0].$children[2].$children[0].$children[1].$children[0].$children[1].$type).assertEqual('SymbolGlyph');
      console.info('NavigationSymbolIcon_0100 END');
      done();
    });


  })
}