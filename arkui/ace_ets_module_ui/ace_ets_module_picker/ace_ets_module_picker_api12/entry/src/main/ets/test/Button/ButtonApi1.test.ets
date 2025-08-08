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

export default function ButtonApi1() {
  describe('ButtonApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("ButtonApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Button/ButtonApi1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ButtonApi1 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ButtonApi1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ButtonApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonApi1 page error:" + err);
      }
      console.info("ButtonApi1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number ButtonApi1_0100
     * @tc.name testButton
     * @tc.desc
     */
    it('ButtonApi1_0100', 0, async (done: Function) => {
      console.info('ButtonApi1_0100 START');
      await CommonFunc.sleep(1000);

      let ButtonApi1_1 = getInspectorByKey('ButtonApi1_1');

      expect(JSON.stringify(JSON.parse(ButtonApi1_1).$attrs.role)).assertEqual('"ButtonRole.NORMAL"');

      console.info('ButtonApi1_0100 END');
      done();
    });
    /**
     * @tc.number ButtonApi1_0200
     * @tc.name testButton
     * @tc.desc
     */
    it('ButtonApi1_0200', 0, async (done: Function) => {
      console.info('ButtonApi1_0200 START');
      await CommonFunc.sleep(1000);

      let ButtonApi1_2 = getInspectorByKey('ButtonApi1_2');

      expect(JSON.stringify(JSON.parse(ButtonApi1_2).$attrs.role)).assertEqual('"ButtonRole.ERROR"');

      console.info('ButtonApi1_0200 END');
      done();
    });



  })
}