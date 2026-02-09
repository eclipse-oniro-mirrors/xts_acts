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

export default function textAreaHeightAdaptivePolicyTest() {
  describe('textAreaHeightAdaptivePolicyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaHeightAdaptivePolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi12/textAreaHeightAdaptivePolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaHeightAdaptivePolicy state pages: " + JSON.stringify(pages));
        if (!("textAreaHeightAdaptivePolicy" == pages.name)) {
          console.info("get textAreaHeightAdaptivePolicy pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaHeightAdaptivePolicy page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textAreaHeightAdaptivePolicy beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaHeightAdaptivePolicy after each called");
    })

    /**
     * @tc.name   textAreaHeightAdaptivePolicy0100
     * @tc.number textAreaHeightAdaptivePolicy0100
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaHeightAdaptivePolicy0100',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textAreaHeightAdaptivePolicy0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_heightAdaptivePolicy_001');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .heightAdaptivePolicy));
      expect(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy)
        .assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   textAreaHeightAdaptivePolicy0200
     * @tc.number textAreaHeightAdaptivePolicy0200
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.MAX_LINES_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaHeightAdaptivePolicy0200',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textAreaHeightAdaptivePolicy0200';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_heightAdaptivePolicy_002');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .heightAdaptivePolicy));
      expect(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   textAreaHeightAdaptivePolicy0300
     * @tc.number textAreaHeightAdaptivePolicy0300
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('textAreaHeightAdaptivePolicy0300',  Level.LEVEL0, async (done: Function) => {
      let tagName = 'textAreaHeightAdaptivePolicy0300';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_heightAdaptivePolicy_003');
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .heightAdaptivePolicy));
      expect(JSON.parse(strJsonNew).$attrs.heightAdaptivePolicy)
        .assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
