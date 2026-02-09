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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function repeatKeyJsunit() {
  describe('repeatKeyJsunit', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/repeatKey',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get repeatKeyJsunit state success " + JSON.stringify(pages));
        if (!("repeatKey" == pages.name)) {
          console.info("get repeatKeyJsunit state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push repeatKeyJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatKeyJsunit page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatKeyJsunit after each called");
    });

    /**
     * @tc.name   RepeatKey001
     * @tc.number RepeatKey001
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatKey001', Level.LEVEL0, async () => {
      console.info('RepeatKey001 START');
      expect(!!getInspectorByKey('one')).assertTrue();
      console.info('RepeatKey001 END');
    });

    /**
     * @tc.name   RepeatKey002
     * @tc.number RepeatKey002
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatKey002', Level.LEVEL0, async () => {
      console.info('RepeatKey001 START');
      expect(!getInspectorByKey('one1')).assertTrue();
      console.info('RepeatKey001 END');
    });
  })
}
  