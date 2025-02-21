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

export default function RichEditorApi13() {
  describe('RichEditorApi13', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorApi13 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorApi13',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorApi13 state pages:" + JSON.stringify(pages));
        if (!("RichEditorApi13" == pages.name)) {
          console.info("get RichEditorApi13 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorApi13 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi13 page error:" + err);
      }
      console.info("RichEditorApi13 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number RichEditorApi13_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('RichEditorApi13_0100', 0, async (done: Function) => {
      console.info('RichEditorApi13_0100 START');
      await CommonFunc.sleep(1000);

      let richEditor = getInspectorByKey('RichEditorApi13');
      expect(String(JSON.parse(richEditor).$type)).assertEqual('RichEditor')

      await CommonFunc.sleep(1000);

      console.info('RichEditorApi13_0100 END');
      done();
    });

  })
}