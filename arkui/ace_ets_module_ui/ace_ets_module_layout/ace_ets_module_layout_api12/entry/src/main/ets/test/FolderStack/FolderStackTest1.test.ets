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

export default function FolderStackTest1() {
  describe('FolderStackTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("FolderStackTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/FolderStackTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FolderStackTest1 state pages:" + JSON.stringify(pages));
        if (!("FolderStackTest1" == pages.name)) {
          console.info("get FolderStackTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FolderStackTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FolderStackTest1 page error:" + err);
      }
      console.info("FolderStackTest1 beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FolderStackTest1 after each called");
    });


    /**
     * @tc.number    FolderStackTest1_0100
     * @tc.name      FolderStackTest1_0100
     * @tc.desc      Test FolderStack
     * @tc.level     Level 2
     */
    it('FolderStackTest1_0100', 0, async (done: Function) => {
      console.info('FolderStackTest1_0100 START');
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('FolderStackTest1_FolderStack');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[FolderStackTest1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.width).assertEqual('200.00vp');

      console.info('FolderStackTest1_0100 END');
      done();
    });



  })
}