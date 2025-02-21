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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputUnderlineColorTest() {
  describe('textInputUnderlineColorTest', () =>{
    beforeEach(async  (done:Function) =>{
      console.info("TextInputUnderlineColorTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputUnderlineColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputUnderlineColor state pages: " + JSON.stringify(pages));
        if (!("TextInputUnderlineColor" == pages.name)) {
          console.info("get TextInputUnderlineColor pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push TextInputUnderlineColor page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("TextInputUnderlineColor beforeEach end");
      done()
    });

    afterEach(async () =>{
      await Utils.sleep(1000);
      console.info("TextInputUnderlineColor after each called");
    })

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_0100
    * @tc.name  : textInputUnderlineColor_0100
    * @tc.desc  : set the underlineColor property value.
    * @tc.level : Level 0
    * @tc.type : Function
    * @tc.size : MediumTest
    */
    it('textInputUnderlineColor_0100', 0, async  (done:Function) =>{
      let tagName = 'textInputUnderlineColor_0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_TextInput_UnderlineColor_001');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.$attrs.underlineColor));
      let underlineColorObj = JSON.parse(obj.$attrs.underlineColor);

      expect(underlineColorObj.normal).assertEqual('#FF0000FF');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_0200
    * @tc.name  : textInputUnderlineColor_0200
    * @tc.desc  : set the underlineColor property value.
    * @tc.level : Level 0
    * @tc.type : Function
    * @tc.size : MediumTest
    */
    it('textInputUnderlineColor_0200', 0, async  (done:Function) =>{
      let tagName = 'textInputUnderlineColor_0200';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_TextInput_UnderlineColor_002');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.$attrs.underlineColor));
      let underlineColorObj = JSON.parse(obj.$attrs.underlineColor);

      expect(underlineColorObj.disable).assertEqual('#FFFF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_0300
    * @tc.name  : textInputUnderlineColor_0300
    * @tc.desc  : set the underlineColor property value.
    * @tc.level : Level 0
    * @tc.type : Function
    * @tc.size : MediumTest
    */
    it('textInputUnderlineColor_0300', 0, async  (done:Function) =>{
      let tagName = 'textInputUnderlineColor_0300';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_TextInput_UnderlineColor_003');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.$attrs.underlineColor));
      let underlineColorObj = JSON.parse(obj.$attrs.underlineColor);

      expect(underlineColorObj.typing).assertEqual('#FFFF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TEXTINPUT_0400
    * @tc.name  : textInputUnderlineColor_0400
    * @tc.desc  : set the underlineColor property value.
    * @tc.level : Level 0
    * @tc.type : Function
    * @tc.size : MediumTest
    */
    it('textInputUnderlineColor_0400', 0, async  (done:Function) =>{
      let tagName = 'ArkUI_textInputUnderlineColor_0400';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_TextInput_UnderlineColor_004');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextInput underlineColor is: ' + JSON.stringify(obj.$attrs.underlineColor));
      let underlineColorObj = JSON.parse(obj.$attrs.underlineColor);

      expect(underlineColorObj.error).assertEqual('#FFFF0000');

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}