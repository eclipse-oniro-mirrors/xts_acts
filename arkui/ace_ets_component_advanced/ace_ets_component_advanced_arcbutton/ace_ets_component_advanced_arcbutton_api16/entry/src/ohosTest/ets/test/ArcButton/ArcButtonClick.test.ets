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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from '@ohos/hypium';
import router from '@system.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}

export default function ChipOnClose() {
  describe('ArcButtonClick', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ArcButton/ArcButtonClick',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcButtonClick state pages: " + JSON.stringify(pages));
        if (!("ArcButtonClick" == pages.name)) {
          console.info("get ArcButtonClick state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcButtonClick page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcButtonClick page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number: ArkUX_Stage_ArcButton_ComponentTest_0100
     * @tc.name  : testArcButtonComponent
     * @tc.desc  : verifyBaseFunction
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcbutton01');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.styleMode));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.borderWidth));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.borderStyle));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.borderColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.align));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.$attrs.alignSelf));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.borderWidth).assertEqual('5.00vp');
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Dashed');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFC0CB');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF0000FF');
      expect(obj.$attrs.align).assertEqual('Alignment.Center');
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Baseline');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0100] END');
      done();
    });

    /**
     * @tc.number: ArkUX_Stage_ArcButton_ComponentTest_0200
     * @tc.name  : testArcButtonComponent
     * @tc.desc  : verifyBaseFunction
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcbutton02');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.borderWidth));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.borderStyle));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.borderColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.align));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.$attrs.alignSelf));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Solid');
      expect(obj.$attrs.borderColor).assertEqual('#FF000000');
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000');
      expect(obj.$attrs.align).assertEqual('Alignment.TopStart');
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Auto');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0200] END');
      done();
    });

    /**
     * @tc.number: ArkUX_Stage_ArcButton_ComponentTest_0300
     * @tc.name  : testArcButtonComponent
     * @tc.desc  : verifyBaseFunction
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('arcbutton03');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.borderWidth));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.borderStyle));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.borderColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.backgroundColor));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.align));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.$attrs.alignSelf));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.borderWidth).assertEqual('0.00px');
      expect(obj.$attrs.borderStyle).assertEqual('BorderStyle.Solid');
      expect(obj.$attrs.borderColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.align).assertEqual('Alignment.Center');
      expect(obj.$attrs.alignSelf).assertEqual('ItemAlign.Auto');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0300] END');
      done();
    });

    /**
     * @tc.number: ArkUX_Stage_ArcButton_ComponentTest_0400
     * @tc.name  : testArcButtonComponent
     * @tc.desc  : verifyBaseFunction
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it('ArkUX_Stage_ArcButton_ComponentTest_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.text('arcbutton4'))
      await button.click()
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('白色风车'))
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0400] END');
      done();
    });
  })
}
