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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function Foreach2() {
  describe('Foreach2', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Foreach1/Foreach2',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get Foreach2 state success " + JSON.stringify(pages));
        if (!("Foreach2" == pages.name)) {
          console.info("get Foreach2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push Foreach2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Foreach2 page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach2 after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_001
     * @tc.name ForEachKey
     * @tc.desc aceEtsTest
     */
    it('ForEachKey001', Level.LEVEL0, async () => {
      console.info('ForEachKey001 START');
      expect(!!getInspectorByKey('one')).assertTrue();
      console.info('ForEachKey001 END');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_002
     * @tc.name ForEachKey
     * @tc.desc aceEtsTest
     */
    it('ForEachKey002', Level.LEVEL0, async () => {
      console.info('ForEachKey001 START');
      expect(!getInspectorByKey('one2')).assertTrue();
      console.info('ForEachKey001 END');
    });
  })
}
  