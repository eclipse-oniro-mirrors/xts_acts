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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function APIremoveGestureByTag() {
  describe('APIremoveGestureByTag', () => {
    beforeEach(async (done: Function) => {
      console.info("APIremoveGestureByTag beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/APIremoveGestureByTag',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIremoveGestureByTag state pages:" + JSON.stringify(pages));
        if (!("APIremoveGestureByTag" == pages.name)) {
          console.info("get APIremoveGestureByTag pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push APIremoveGestureByTag page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIremoveGestureByTag page error:" + err);
      }
      console.info("APIremoveGestureByTag beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   APIremoveGestureByTag_0100
     * @tc.number APIremoveGestureByTag_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIremoveGestureByTag_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('APIremoveGestureByTag_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIremoveGestureByTag_Text01');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APIremoveGestureByTag_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('init');
      console.info('[APIremoveGestureByTag_0100] END');
      done();
    });
  })
}