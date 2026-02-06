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

export default function RichEditorApi6() {
  describe('RichEditorApi6', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorApi6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorApi6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorApi6 state pages:" + JSON.stringify(pages));
        if (!("RichEditorApi6" == pages.name)) {
          console.info("get RichEditorApi6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorApi6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi6 page error:" + err);
      }
      console.info("RichEditorApi6 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number RichEditorApi6_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('RichEditorApi6_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('RichEditorApi6_0100 START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);

        let richEditor1 = CommonFunc.getComponentRect('RichEditorApi6_richEditor1')
        let y1 = richEditor1.bottom
        await CommonFunc.sleep(500);

        let richEditor1_1 = await driver.findComponent(ON.id("RichEditorApi6_richEditor1"));
        await richEditor1_1.click()
        await CommonFunc.sleep(500);

        let richEditor2 = CommonFunc.getComponentRect('RichEditorApi6_richEditor1')
        let y2 = richEditor2.bottom
        await CommonFunc.sleep(500);

        expect(y2).assertLess(y1);
        await CommonFunc.sleep(1000);
      }

      console.info('RichEditorApi6_0100 END');
      done();
    });

  })
}