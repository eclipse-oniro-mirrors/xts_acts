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
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function onWillApplyTheme() {
  describe('onWillApplyTheme', () => {
    beforeEach(async (done: Function) => {
      console.info("onWillApplyTheme beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onWillApplyTheme state pages:" + JSON.stringify(pages));
        if (!("onWillApplyTheme" == pages.name)) {
          console.info("get  onWillApplyTheme pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/onWillApplyTheme/onWillApplyTheme"
          })
          await CommonFunc.sleep(2000);
          console.info("push onWillApplyTheme page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onWillApplyTheme page error:" + err);
      }
      console.info("onWillApplyTheme foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onWillApplyTheme after each called");
    });


    /**
     * @tc.name   onWillApplyTheme_001
     * @tc.number onWillApplyTheme_001
     * @tc.desc   onWillApplyTheme_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onWillApplyTheme_001', Level.LEVEL0, async (done: Function) => {
      console.info('[onWillApplyTheme_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('onWillApplyThemeText');
      await CommonFunc.sleep(200);
      console.info("[onWillApplyTheme_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);

      expect(JSON.parse(strJson).$attrs.content).assertEqual('onWillApplyTheme');
      console.info('[onWillApplyTheme_001] END');
      done();
    });


  })
}
