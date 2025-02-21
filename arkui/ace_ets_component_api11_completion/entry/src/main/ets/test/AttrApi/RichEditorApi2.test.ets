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
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from "../../MainAbility/common/Common";
import { Driver, ON ,MouseButton} from '@ohos.UiTest';


export default function RichEditorApi2() {
  describe('RichEditorApi2', function () {
    beforeEach(async function (done) {
      console.info("RichEditorApi2 beforeEach start");
      let options = {
        uri: 'MainAbility/pages/AttrApi/RichEditorApi2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorApi2 state success " + JSON.stringify(pages));
        if (!("RichEditorApi2" == pages.name)) {
          console.info("get RichEditorApi2 state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push RichEditorApi2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi2 page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("RichEditorApi2 after each called");
    });


    /*
    * @tc.number      RichEditorApi2_001
    * @tc.name        RichEditorApi2_001
    * @tc.desc        RichEditorApi2 RichEditorResponseType test
    * @tc.level       Level 2
    */
    it('RichEditorApi2_001', 0, async function (done) {
      console.info('[RichEditorApi2_001] START');
      await Utils.sleep(1000);

      let driver= Driver.create();
      await Utils.sleep(1000);
      let RichEditor1 = Utils.getComponentRect('RichEditorApi2_RichEditor1')
      await driver.mouseDrag({
        x:parseInt((RichEditor1.right-RichEditor1.left)*0.3+RichEditor1.left),
        y:parseInt((RichEditor1.bottom-RichEditor1.top)*0.5+RichEditor1.top)},
        { x:parseInt((RichEditor1.right-RichEditor1.left)*0.5+RichEditor1.left),
          y:parseInt((RichEditor1.bottom-RichEditor1.top)*0.5+RichEditor1.top)})
      await Utils.sleep(3000);

      let strJson = getInspectorByKey('RichEditorApi2_text1');
      let obj = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[RichEditorApi2_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('SelectMenuAppear');

      console.info('[RichEditorApi2_001] END');
      done();
    });

    /*
  * @tc.number      RichEditorApi2_002
  * @tc.name        RichEditorApi2_002
  * @tc.desc        RichEditorApi2 RichEditorSymbolSpanStyle test
  * @tc.level       Level 2
  */
    it('RichEditorApi2_002', 0, async function (done) {
      console.info('[RichEditorApi2_002] START');
      await Utils.sleep(1000);

      let driver= Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorApi2_getSpans'));
      await btn1.click()
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('RichEditorApi2_text2');
      let obj = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[RichEditorApi2_002] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('renderingStrategy:0,effectStrategy:0');

      console.info('[RichEditorApi2_002] END');
      done();
    });

  })
}


