/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function textAreaLetterSpacing() {
  describe('textAreaLetterSpacing', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaLetterSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaLetterSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaLetterSpacing state pages: " + JSON.stringify(pages));
        if (!("textAreaLetterSpacing" == pages.name)) {
          console.info("get textAreaLetterSpacing pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaLetterSpacing page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textAreaLetterSpacing beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaLetterSpacing after each called");
    })

    /**
     * @tc.number textAreaLetterSpacing_0100
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaLetterSpacing_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[textAreaLetterSpacing_0100] START');
      let strJson = getInspectorByKey('key_textArea_letterSpacing_001');
      console.info("[textAreaLetterSpacing_0100] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.letterSpacing).assertEqual('5.00fp');
      console.info('[textAreaLetterSpacing_0100] END');
      done();
    });
  })
}
