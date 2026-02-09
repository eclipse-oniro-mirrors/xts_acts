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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
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
import Utils from '../common/Utils';

export default function CapiPostUITaskAndWaitS() {
  describe('CapiPostUITaskAndWaitS', () => {
    
    beforeEach(async (done: Function) => {
      console.info("ListCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/capi/ArkUIPostUITaskAndWaitS',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListCNode state pages:" + JSON.stringify(pages));
        if (!("ListCNodePage" == pages.name)) {
          console.info("get ListCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ListCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListCNode page error:" + err);
      }
      console.info("ListCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("ArkUIPostUITaskAndWaitResultValueS after each called");
    });

    /**
     * @tc.name   ArkUIPostUITaskAndWaitResultValueS_001
     * @tc.number ArkUIPostUITaskAndWaitResultValueS_001
     * @tc.desc   Test ArkUIPostUITaskAndWaitResultValueS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIPostUITaskAndWaitResultValueS_001', Level.LEVEL1, async (done: Function) => {
      console.info('[ArkUIPostUITaskAndWaitResultValueS_001] START'); 
      await Utils.sleep(3000);
      let driver: Driver = Driver.create();
      let view = await driver.findComponent(ON.id('text'));
      expect(view != null).assertTrue();
      console.info('[ArkUIPostUITaskAndWaitResultValueS_001] END');
      done();
    });
  })
}