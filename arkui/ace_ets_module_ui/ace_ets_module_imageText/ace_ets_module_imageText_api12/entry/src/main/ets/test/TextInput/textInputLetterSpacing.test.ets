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
import Utils from '../TextInput/Utils';

export default function textInputLetterSpacing() {
  describe('textInputLetterSpacing', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputLetterSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputLetterSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputLetterSpacing state pages: " + JSON.stringify(pages));
        if (!("textInputLetterSpacing" == pages.name)) {
          console.info("get textInputLetterSpacing pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputLetterSpacing page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputLetterSpacing beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputLetterSpacing after each called");
    })

    /**
     * @tc.name   textInputLetterSpacing_0100
     * @tc.number textInputLetterSpacing_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputLetterSpacing_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[textInputLetterSpacing_0100] START');
      let strJson = getInspectorByKey('key_textInput_letterSpacing_001');
      console.info("[textInputLetterSpacing_0100] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.letterSpacing).assertEqual('5.00fp');
      console.info('[textInputLetterSpacing_0100] END');
      done();
    });
  })
}
