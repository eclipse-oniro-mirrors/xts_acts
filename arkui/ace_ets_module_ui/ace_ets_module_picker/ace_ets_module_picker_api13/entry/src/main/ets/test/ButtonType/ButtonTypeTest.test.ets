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

export default function ButtonTypeTest() {
  describe('ButtonTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ButtonTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ButtonType/ButtonTypeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ButtonTypeTest state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ButtonTypeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ButtonTypeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonTypeTest page error:" + err);
      }
      console.info("ButtonTypeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number ButtonTypeTest_0100
     * @tc.name testButton
     * @tc.desc
     */
    it('ButtonTypeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ButtonTypeTest_0100 START');
      await CommonFunc.sleep(1000);
      let btn = getInspectorByKey('btn');
      console.info("ButtonTypeTest_0100 component obj is: " + JSON.stringify(btn));
      console.info("[ButtonTypeTest_0100] title: " + JSON.stringify(JSON.parse(btn).$attrs.type));
      expect(JSON.stringify(JSON.parse(btn).$attrs.type)).assertEqual('"ButtonType.ROUNDED_RECTANGLE"');
      console.info('ButtonTypeTest_0100 END');
      done();
    });
  
  })
}