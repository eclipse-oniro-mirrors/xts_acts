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

export default function TextAreaNodeTest() {
  describe('TextAreaNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textAreaNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaNode state pages: " + JSON.stringify(pages));
        if (!("textAreaNode" == pages.name)) {
          console.info("get textAreaNode pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textAreaNode page error: " + err);
      }

      await CommonFunc.sleep(1000)
      console.info("textAreaNode beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaNode after each called");
    })
    /**
     * @tc.number textAreaNode0100
     * @tc.name Test the FontSize property of the textArea component
     * @tc.desc set the FontSize property value is  TextAlign.Center
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */

    it('textAreaNode0100', 0, async (done: Function) => {

      let tagName = 'textAreaNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_Node_001');
      console.info('[' + tagName + '] Search fontSize is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .fontSize));
      console.info('[' + tagName + '] Search width is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .width));
      expect(JSON.parse(strJsonNew).$attrs.fontSize).assertEqual('16.00fp');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textAreaNode0200
     * @tc.name Test the FontStyle property of the textArea component
     * @tc.desc set the FontStyle property value is  TextAlign.Center
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
  
    it('textAreaNode0200', 0, async (done: Function) => {
      let tagName = 'textAreaNode0200';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_Node_001');
      console.info('[' + tagName + '] Search fontStyle is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .fontStyle));
      expect(JSON.parse(strJsonNew).$attrs.fontStyle).assertEqual('FontStyle.Italic');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textAreaNode0300
     * @tc.name Test the TextAlign property of the textArea component
     * @tc.desc set the TextAlign property value is  TextAlign.Center
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    
    it('textAreaNode0300', 0, async (done: Function) => {
      let tagName = 'textAreaNode0300';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_textArea_Node_001');
      console.info('[' + tagName + '] Search textAlign is: ' + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs
        .textAlign));
      expect(JSON.parse(strJsonNew).$attrs.textAlign).assertEqual('TextAlign.Center');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
    

