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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function enumFolderTest() {
  describe('enumFolderTest', () => {
    beforeEach(async (done: Function) => {
      console.info("enumFolderTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enumFolderTest state pages:" + JSON.stringify(pages));
        if (!("folder_stack" == pages.name)) {
          console.info("get enumFolderTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/FolderStack/folder_stack"})
          await CommonFunc.sleep(2000);
          console.info("push enumFolderTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enumFolderTest page error:" + err);
      }
      console.info("enumFolderTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("enumFolderTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_relativeCTest_0100
     * @tc.desc      test basis
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */

    it('enumFolderTest_0100', 0, async (done: Function) => {
      console.info('[enumFolderTest_0100] START');
      await CommonFunc.sleep(2000);
      // no trigger
      let json = getInspectorByKey('flod_tx3');
      let Obj1: ESObject = JSON.parse(json);
      console.info("relativeCTest_0100 json info " + JSON.stringify(json));
      expect(Obj1.$attrs.content).assertEqual("")
      done();
    });

  })
}
