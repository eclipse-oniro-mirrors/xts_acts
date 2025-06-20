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
import CommonFunc from '../../MainAbility/common/Common';

export default function textAreaMinFontSize() {
  describe('textAreaMinFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaMinFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaMinFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaMinFontSize state pages: " + JSON.stringify(pages));
        if (!("textAreaMinFontSize" == pages.name)) {
          console.info("get textAreaMinFontSize pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaMinFontSize page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textAreaMinFontSize beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaMinFontSize after each called");
    })

    /**
     * @tc.number textAreaMinFontSize0100
     * @tc.name Test the minFontSize property of the textArea component
     * @tc.desc set the minFontSize property value is  16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaMinFontSize0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textAreaMinFontSize0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_minFontSize_001');
      console.info('[' + tagName + '] Search minFontSize is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .minFontSize));
      expect(JSON.parse(strJsonNew).$attrs.minFontSize).assertEqual('16.00fp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
