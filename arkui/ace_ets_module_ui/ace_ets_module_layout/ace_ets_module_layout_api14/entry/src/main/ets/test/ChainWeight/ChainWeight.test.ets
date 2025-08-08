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
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ChainWeight() {
  describe('ChainWeight', () => {
    beforeEach(async (done: Function) => {
      console.info("ChainWeight beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChainWeight/ChainWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChainWeight state pages:" + JSON.stringify(pages));
        if (!("ChainWeight" == pages.name)) {
          console.info("get ChainWeight pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChainWeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChainWeight page error:" + err);
      }
      console.info("ChainWeight beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number ChainWeight_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('ChainWeight_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('ChainWeight_0100 START');
      await CommonFunc.sleep(1000);

      let rect1 = Utils.getComponentRect('row1');
      let rect2 = Utils.getComponentRect('row2');
      console.info('ChainWeight_0100 row1 left: ' + rect1.left + ',top: ' + rect1.top + ',right: ' + rect1.right + ',bottom: ' + rect1.bottom);
      console.info('ChainWeight_0100 row2 left: ' + rect2.left + ',top: ' + rect2.top + ',right: ' + rect2.right + ',bottom: ' + rect2.bottom);
      expect(Math.abs(Math.round((rect1.right - rect1.left)/2 - (rect2.right - rect2.left))) <= 1).assertTrue();

      console.info('ChainWeight_0100 END');
      done();
    });

  })
}