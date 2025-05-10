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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON, MouseButton } from '@ohos.UiTest';

export default function RichEditorApi() {
  describe('RichEditorApi', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorApi state success " + JSON.stringify(pages));
        if (!("RichEditorApi" == pages.name)) {
          console.info("get RichEditorApi state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorApi page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorApi after each called");
    });

    /*
     * @tc.number      RichEditorApi_001
     * @tc.name        RichEditorApi_001
     * @tc.desc        RichEditorApi addBuilderSpan test
     * @tc.level       Level 2
     */
    it('RichEditorApi_001', 0, async (done: Function) => {
      console.info('[RichEditorApi_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RichEditorApi_text_hello');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi_001] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('hello');

      console.info('[RichEditorApi_001] END');
      done();

    });

    /*
     * @tc.number      RichEditorApi_002
     * @tc.name        RichEditorApi_002
     * @tc.desc        RichEditorApi getParagraphs test
     * @tc.level       Level 2
     */
    it('RichEditorApi_002', 0, async (done: Function) => {
      console.info('[RichEditorApi_002] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorApi_btn_getParagraphs'));
      await btn1.click()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('RichEditorApi_text_spanParagraphs');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi_002] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('[{"style":{"textAlign":0,"leadingMargin":{"size":["5.00vp","0.00vp"]}},"range":[0,4]}]');
      console.info('[RichEditorApi_002] END');
      done();
    });

    /*
     * @tc.number      RichEditorApi_003
     * @tc.name        RichEditorApi_003
     * @tc.desc        RichEditorApi updateParagraphStyle test
     * @tc.level       Level 2
     */
    it('RichEditorApi_003', 0, async (done: Function) => {
      console.info('[RichEditorApi_003] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('RichEditorApi_btn_updateParagraphStyle'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      console.info('[RichEditorApi_003] btn1');

      let btn2 = await driver.findComponent(ON.id('RichEditorApi_btn_getParagraphs'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info('[RichEditorApi_003] btn2');

      let strJson = getInspectorByKey('RichEditorApi_text_spanParagraphs');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi_003] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('[{"style":{"textAlign":0,"leadingMargin":{"size":["10.00vp","0.00vp"]}},"range":[0,4]}]');
      console.info('[RichEditorApi_003] END');
      done();
    });

    /*
    * @tc.number      RichEditorApi_004
    * @tc.name        RichEditorApi_004
    * @tc.desc        RichEditorApi RichEditorResponseType test
    * @tc.level       Level 2
    */
    it('RichEditorApi_004', 0, async (done: Function) => {
      console.info('[RichEditorApi_004] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor3 = CommonFunc.getComponentRectOnScreen('RichEditorApi_RichEditor3')
      await driver.mouseClick({
        x: Math.round((RichEditor3.right - RichEditor3.left) * 0.5 + RichEditor3.left),
        y: Math.round((RichEditor3.bottom - RichEditor3.top) * 0.5 + RichEditor3.top)
      }, MouseButton.MOUSE_BUTTON_RIGHT)
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('RichEditorApi_text1');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi_004] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('CustomMenuAppear');
      console.info('[RichEditorApi_004] END');
      done();
    });


    /*
    * @tc.number      RichEditorApi_005
    * @tc.name        RichEditorApi_005
    * @tc.desc        RichEditorApi RichEditorResponseType test
    * @tc.level       Level 2
    */
    it('RichEditorApi_005', 0, async (done: Function) => {
      console.info('[RichEditorApi_005] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditor4 = CommonFunc.getComponentRectOnScreen('RichEditorApi_RichEditor4')
      await driver.longClick(Math.round((RichEditor4.right - RichEditor4.left) * 0.5 + RichEditor4.left),
        Math.round((RichEditor4.bottom - RichEditor4.top) * 0.5 + RichEditor4.top))
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('RichEditorApi_text2');
      await CommonFunc.sleep(1000);
      console.info("[RichEditorApi_005] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('SecondMenuAppear');
      console.info('[RichEditorApi_005] END');
      done();
    });
  })
}


