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

export default function TextAreaApi2() {
  describe('TextAreaApi2', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaApi2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaApi2 state pages:" + JSON.stringify(pages));
        if (!("TextAreaApi2" == pages.name)) {
          console.info("get TextAreaApi2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaApi2 page error:" + err);
      }
      console.info("TextAreaApi2 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   TextAreaApi2_0100
     * @tc.number TextAreaApi2_0100
     * @tc.desc   TextAreaApi2_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAreaApi2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('TextAreaApi2_0100 START');
      await CommonFunc.sleep(1000);

      let textArea1 = getInspectorByKey('TextAreaApi2_textArea');
      expect(JSON.stringify(JSON.parse(textArea1).$attrs.contentType)).assertEqual('"TextContentType.DETAIL_INFO_WITHOUT_STREET"');
      await CommonFunc.sleep(1000);

      console.info('TextAreaApi2_0100 END');
      done();
    });

  })
}