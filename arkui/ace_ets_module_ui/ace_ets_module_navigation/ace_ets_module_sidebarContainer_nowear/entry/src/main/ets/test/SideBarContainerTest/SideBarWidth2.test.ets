/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, UiDirection, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SideBarWidth2() {
  describe('SideBarWidth2', () => {
    beforeEach(async (done: Function) => {
      console.info('SideBarWidth2 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarWidth2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SideBarWidth2 state pages:' + JSON.stringify(pages));
        if (!('SideBarWidth2' == pages.name)) {
          console.info('get SideBarWidth2 pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SideBarWidth2 page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SideBarWidth2 page error:' + err);
      }
      console.info('SideBarWidth2 beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SideBarWidth2 after each called');
    });


    /**
     * @tc.number    SideBarWidth2_0100
     * @tc.name      SideBarWidth2_0100
     * @tc.desc      Test sideBarWidth -1
     * @tc.level     Level 0
     */
    it('SideBarWidth2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SideBarWidth2_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('sideId2');
      console.info('SideBarWidth2_0100: ' + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SideBarWidth2_0100] sideBarWidth:' + obj?.$attrs?.sideBarWidth);
      console.info('[SideBarWidth2_0100] minSideBarWidth:' + obj?.$attrs?.minSideBarWidth);
      console.info('[SideBarWidth2_0100] maxSideBarWidth:' + obj?.$attrs?.maxSideBarWidth);
      expect(obj?.$attrs?.sideBarWidth).assertEqual('240.000000');
      expect(obj?.$attrs?.minSideBarWidth).assertEqual('240.000000');
      expect(obj?.$attrs?.maxSideBarWidth).assertEqual('280.000000');
      console.log('[SideBarWidth2_0100] END');
      done();
    });
  })
}