/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputMaxFontSize() {
  describe('textInputMaxFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputMaxFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputMaxFontSize state pages: " + JSON.stringify(pages));
        if (!("textInputMaxFontSize" == pages.name)) {
          console.info("get textInputMaxFontSize pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputMaxFontSize page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputMaxFontSize beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputMaxFontSize after each called");
    })

    /**
     * @tc.number textInputMaxFontSize0100
     * @tc.name Test the maxFontSize property of the textInput component
     * @tc.desc set the maxFontSize property value is  21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputMaxFontSize0100', 0, async (done: Function) => {
      let tagName = 'textInputMaxFontSize0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textInput_maxFontSize_001');
      console.info('[' + tagName + '] TextInput maxFontSize is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .maxFontSize));


      expect(JSON.parse(strJsonNew).$attrs.maxFontSize).assertEqual('21.00fp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
