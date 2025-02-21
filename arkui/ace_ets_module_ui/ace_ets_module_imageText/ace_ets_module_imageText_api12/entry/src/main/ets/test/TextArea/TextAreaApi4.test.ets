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

export default function TextAreaApi4() {
  describe('TextAreaApi4', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaApi4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaApi4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaApi4 state pages:" + JSON.stringify(pages));
        if (!("TextAreaApi4" == pages.name)) {
          console.info("get TextAreaApi4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaApi4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaApi4 page error:" + err);
      }
      console.info("TextAreaApi4 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number TextAreaApi4_0100
     * @tc.name   testTextArea
     * @tc.desc
     */
    it('TextAreaApi4_0100', 0, async (done: Function) => {
      console.info('TextAreaApi4_0100 START');
      await CommonFunc.sleep(1000);

      sendEventByKey('TextAreaApi4_btn1',10,"")
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('TextAreaApi4_text1');
      expect(String(JSON.parse(text1).$attrs.content)).assertEqual('{"type":"TextDecorationType.Overline","color":"#FFFF0000","style":"TextDecorationStyle.DOUBLE"}')

      await CommonFunc.sleep(1000);

      console.info('TextAreaApi4_0100 END');
      done();
    });

  })
}