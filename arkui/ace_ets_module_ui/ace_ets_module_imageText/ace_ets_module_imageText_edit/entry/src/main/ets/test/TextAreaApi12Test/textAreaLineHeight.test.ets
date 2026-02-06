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

export default function textAreaLineHeight() {
  describe('textAreaLineHeight', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaLineHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi12/textAreaLineHeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaLineHeight state pages: " + JSON.stringify(pages));
        if (!("textAreaLineHeight" == pages.name)) {
          console.info("get textAreaLineHeight pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaLineHeight page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textAreaLineHeight beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaLineHeight after each called");
    })

    /**
     * @tc.name   textAreaLineHeight_0100
     * @tc.number textAreaLineHeight_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaLineHeight_0100',  Level.LEVEL0, async  (done: Function) => {
      console.info('[textAreaLineHeight_0100] START');
      let strJson = getInspectorByKey('key_textArea_lineHeight_001');
      console.info("[textAreaLineHeight_0100] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual('30.00fp');
      console.info('[textAreaLineHeight_0100] END');
      done();
    });
  })
}
