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

export default function RichEditorApi2() {
  describe('RichEditorApi2', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorApi2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorApi2 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get RichEditorApi2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi2 page error:" + err);
      }
      console.info("RichEditorApi2 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number RichEditorApi2_0100
     * @tc.name testButton
     * @tc.desc
     */
    it('RichEditorApi2_0100', 0, async (done: Function) => {
      console.info('RichEditorApi2_0100 START');
      await CommonFunc.sleep(1000);

      let RichEditorApi2_1 = getInspectorByKey('RichEditorApi2_1');
      expect(JSON.stringify(JSON.parse(RichEditorApi2_1).$attrs.placeholder).replace(/\\\"/g,  '"')).assertEqual("\"{\"value\":\"input...\",\"style\":\"{\"font\":\"{\"size\":\"16.00fp\",\"weight\":\"FontWeight.Normal\",\"family\":\"HarmonyOS Sans\",\"style\":\"FontStyle.Normal\"}\",\"fontColor\":\"#FF808080\"}\"}\"");

      console.info('RichEditorApi2_0100 END');
      done();
    });

  })
}