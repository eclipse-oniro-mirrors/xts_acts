/**
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
  UiDriver,
  Component,
  Driver,
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

export default function allowOverride() {
  describe('allowOverride', () => {
    beforeEach(async (done: Function) => {
      console.info("allowOverride beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/allowOverride/allowOverride',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get allowOverride state pages: " + JSON.stringify(pages));
        if (!("allowOverride" == pages.name)) {
          console.info("get allowOverride state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push allowOverride success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push allowOverride page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   allowOverride_0100
     * @tc.number SUB_ACE_PROVIDEOPTIONS_ALLOWOVERRIDE_0010
     * @tc.desc   Whether or not to allow @Provide overrides.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('allowOverride_0100', Level.LEVEL0, async (done: Function) => {
      console.info('allowOverride_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('allowOverride_Consume');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[allowOverride_0100] component obj is: " + JSON.stringify(obj));
      console.info("[allowOverride_0100] value: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('reviewVotes(10)');
      console.info('[allowOverride_0100] END');
      done();
    });

  })
}