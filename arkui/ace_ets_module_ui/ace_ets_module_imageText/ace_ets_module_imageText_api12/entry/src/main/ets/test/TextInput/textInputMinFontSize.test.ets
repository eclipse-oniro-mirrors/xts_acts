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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../TextInput/Utils';

export default function textInputMinFontSize() {
  describe('textInputMinFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputMinFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputMinFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputMinFontSize state pages: " + JSON.stringify(pages));
        if (!("textInputMinFontSize" == pages.name)) {
          console.info("get textInputMinFontSize pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputMinFontSize page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputMinFontSize beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputMinFontSize after each called");
    })

    /**
     * @tc.number textInputMinFontSize0100
     * @tc.name Test the minFontSize property of the textInput component
     * @tc.desc set the minFontSize property value is  16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textInputMinFontSize0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textAreaMinFontSize0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textInput_minFontSize_001');
      console.info('[' + tagName + '] TextInput minFontSize is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .minFontSize));

      expect(JSON.parse(strJsonNew).$attrs.minFontSize).assertEqual('16.00fp');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
