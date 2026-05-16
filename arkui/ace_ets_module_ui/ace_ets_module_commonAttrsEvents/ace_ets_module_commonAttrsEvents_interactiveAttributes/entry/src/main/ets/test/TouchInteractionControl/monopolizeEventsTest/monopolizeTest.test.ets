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
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function monopolizeTest() {
  describe('monopolizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("monopolizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TouchInteractionControl/monopolizeEvents/monopolize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get monopolizeTest state pages: " + JSON.stringify(pages));
        if (!("monopolize" == pages.name)) {
          console.info("get monopolizeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push monopolizeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push monopolizeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   monopolizeTest_0100
     * @tc.number monopolize
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('monopolizeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('monopolizeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('monopolize_column');
      console.info("[monopolizeTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[monopolizeTest_0100] component obj.$attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[monopolizeTest_0100] text: " + JSON.stringify(JSON.parse(strJson).$attrs.monopolizeEvents));
      expect(JSON.parse(strJson).$attrs.monopolizeEvents).assertEqual(false);
      console.info('[monopolizeTest_0100] END');
      done();
    });
  })
}

