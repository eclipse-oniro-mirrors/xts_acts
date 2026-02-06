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

export default function textInputLineHeight() {
  describe('textInputLineHeight', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputLineHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi12/textInputLineHeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputLineHeight state pages: " + JSON.stringify(pages));
        if (!("textInputLineHeight" == pages.name)) {
          console.info("get textInputLineHeight pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputLineHeight page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textInputLineHeight beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputLineHeight after each called");
    })

    /**
     * @tc.name   textInputLineHeight_0100
     * @tc.number textInputLineHeight_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputLineHeight_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[textInputLineHeight_0100] START');
      let strJson = getInspectorByKey('key_textInput_lineHeight_001');
      console.info("[textInputLineHeight_0100] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual('30.00fp');
      console.info('[textInputLineHeight_0100] END');
      done();
    });
  })
}
