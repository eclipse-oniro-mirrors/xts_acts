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
import CommonFunc from '../../MainAbility/common/Common';

export default function textAreaMaxFontSize() {
  describe('textAreaMaxFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("searchMaxFontSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textAreaMaxFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaMaxFontSize state pages: " + JSON.stringify(pages));
        if (!("textAreaMaxFontSize" == pages.name)) {
          console.info("get textAreaMaxFontSize pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaMaxFontSize page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textAreaMaxFontSize beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaMaxFontSize after each called");
    })

    /**
     * @tc.number textAreaMaxFontSize0100
     * @tc.name Test the maxFontSize property of the textArea component
     * @tc.desc set the maxFontSize property value is  21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaMaxFontSize0100', 0, async (done: Function) => {
      let tagName = 'textAreaMaxFontSize0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_maxFontSize_001');
      console.info('[' + tagName + '] Search maxFontSize is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .maxFontSize));
      expect(JSON.parse(strJsonNew).$attrs.maxFontSize).assertEqual('21.00fp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
