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
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function SwipeGesture2() {
  describe('SwipeGesture2', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });
    beforeAll(async (done: Function) => {
      console.info("SwipeGesture2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwipeGesture/SwipeGesture2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwipeGesture2 state pages: " + JSON.stringify(pages));
        if (!("SwipeGesture2" == pages.name)) {
          console.info("get SwipeGesture2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SwipeGesture2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGesture2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SwipeGesture2_0300
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0370
     * @tc.desc   To test that the Provide decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwipeGesture2_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeGesture2_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeGesture2');
      let top = colum.top
      let right = colum.right
      let left = colum.left
      await driver.swipe(Math.round(colum.left + (colum.right - colum.left) / 2), Math.round(top),
        Math.round(colum.right), Math.round(colum.bottom))
      await CommonFunc.sleep(1000);
      let pages = router.getState();
      console.info("get SwipeGesture2 state pages: " + JSON.stringify(pages.name));
      expect(pages.name).assertEqual('index');
      console.info('[SwipeGesture2_0300] END');
      done();
    });

  })
}