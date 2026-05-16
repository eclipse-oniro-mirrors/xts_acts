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

export default function textInputHeightAdaptivePolicy() {
  describe('textInputHeightAdaptivePolicy', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputHeightAdaptivePolicy beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInputHeightAdaptivePolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputHeightAdaptivePolicy state pages: " + JSON.stringify(pages));
        if (!("textInputHeightAdaptivePolicy" == pages.name)) {
          console.info("get textInputHeightAdaptivePolicy pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputHeightAdaptivePolicy page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputHeightAdaptivePolicy beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputHeightAdaptivePolicy after each called");
    })

    /**
     * @tc.name   textInputHeightAdaptivePolicy0100
     * @tc.number textInputHeightAdaptivePolicy0100
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHeightAdaptivePolicy0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputHeightAdaptivePolicy0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textInput_heightAdaptivePolicy_001');
      let obj: Record<string, ESObject> = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] 123123: ' + strJsonNew);
      console.info('[' + tagName + '] TextInput heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   textInputHeightAdaptivePolicy0200
     * @tc.number textInputHeightAdaptivePolicy0200
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.MAX_LINES_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHeightAdaptivePolicy0200',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputHeightAdaptivePolicy0200';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textInput_heightAdaptivePolicy_002');
      console.info('[' + tagName + '] TextInput heightAdaptivePolicy is: ' + JSON.stringify(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy));

      expect(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   textInputHeightAdaptivePolicy0300
     * @tc.number textInputHeightAdaptivePolicy0300
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textInputHeightAdaptivePolicy0300',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textInputHeightAdaptivePolicy0300';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textInput_heightAdaptivePolicy_003');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy));

      expect(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
