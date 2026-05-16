/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function selectUndefinedFour() {
  describe('selectUndefinedFour', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("selectUndefinedFour beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Select/selectUndefinedFour",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get selectUndefinedFour state pages:" + JSON.stringify(pages));
        if (!("selectUndefinedFour" == pages.name)) {
          console.info("get selectUndefinedFour pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectUndefinedFour page error:" + err);
      }
      console.info("selectUndefinedFour beforeEach end");
    });

    /**
     * @tc.number    arrowModifier_static_0100
     * @tc.name      arrowModifier_static_0100
     * @tc.desc      arrowModifier_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('arrowModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arrowModifier_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test04');
      let obj = JSON.parseJsonElement(strJson);

      let arrowModifier = obj.getElement('$attrs').tryGetString('symbolFontSize');
      console.info("arrowModifier_static_0100 symbolFontSize is: " + arrowModifier);
      expect(arrowModifier).assertEqual('');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change03')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test04');
      obj = JSON.parseJsonElement(strJson);

      arrowModifier = obj.getElement('$attrs').getString('symbolFontSize');
      console.info("arrowModifier_static_0100 symbolFontSize is: " + arrowModifier);
      expect(arrowModifier).assertEqual('53.00vp');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test04');
      obj = JSON.parseJsonElement(strJson);

      arrowModifier = obj.getElement('$attrs').tryGetString('symbolFontSize');
      console.info("arrowModifier_static_0100 symbolFontSize is: " + arrowModifier);
      expect(arrowModifier).assertEqual('');

      console.info('[arrowModifier_static_0100] END');
      done();
    });

    /**
     * @tc.number    optionTextModifier_static_0200
     * @tc.name      optionTextModifier_static_0200
     * @tc.desc      optionTextModifier_static_0200
     * @tc.level     Level.LEVEL0
     */
    it('optionTextModifier_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[optionTextModifier_static_0200] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test04');
      let obj = JSON.parseJsonElement(strJson);

      let optionTextModifier = obj.getElement('$attrs').getString('optionFont');
      let strJson1 = JSON.parseJsonElement(optionTextModifier).getString('size');
      console.info("optionTextModifier_static_0200 optionFontSize is: " + strJson1);
      expect(JSON.parseJsonElement(optionTextModifier).getString('size')).assertEqual('16.00fp');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change03')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test04');
      obj = JSON.parseJsonElement(strJson);

      let optionFontColor = obj.getElement('$attrs').getString('optionFontColor');
      console.info("optionTextModifier_static_0200 optionFontColor is: " + optionFontColor);
      expect(optionFontColor).assertEqual('#FF008000');

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test04');
      obj = JSON.parseJsonElement(strJson);

      optionTextModifier = obj.getElement('$attrs').getString('optionFont');
      strJson1 = JSON.parseJsonElement(optionTextModifier).getString('size');
      console.info("optionTextModifier_static_0200 optionFontSize is: " + strJson1);
      expect(JSON.parseJsonElement(optionTextModifier).getString('size')).assertEqual('16.00fp');

      console.info('[optionTextModifier_static_0200] END');
      done();
    });

    /**
     * @tc.number    selectedOptionTextModifier_static_0300
     * @tc.name      selectedOptionTextModifier_static_0300
     * @tc.desc      selectedOptionTextModifier_static_0300
     * @tc.level     Level.LEVEL0
     */
    it('selectedOptionTextModifier_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectedOptionTextModifier_static_0300] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Select_Test04');
      let obj = JSON.parseJsonElement(strJson);

      let selectedOptionTextModifier = obj.getElement('$attrs').getString('selectedOptionFont');
      let strJson1 = JSON.parseJsonElement(selectedOptionTextModifier).getString('size');
      console.info("selectedOptionTextModifier_static_0300 size is: " + strJson1);
      expect(JSON.parseJsonElement(selectedOptionTextModifier).getString('size')).assertEqual('14.00px');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('Select_Change03')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test04');
      obj = JSON.parseJsonElement(strJson);

      let selectedOptionFontColor = obj.getElement('$attrs').getString('selectedOptionFontColor');
      console.info("selectedOptionTextModifier_static_0300 selectedOptionFontColor is: " + selectedOptionFontColor);

      await bnt1.click();
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('Select_Test04');
      obj = JSON.parseJsonElement(strJson);

      selectedOptionTextModifier = obj.getElement('$attrs').getString('selectedOptionFont');
      strJson1 = JSON.parseJsonElement(selectedOptionTextModifier).getString('size');
      console.info("selectedOptionTextModifier_static_0300 size is: " + strJson1);
      expect(JSON.parseJsonElement(selectedOptionTextModifier).getString('size')).assertEqual('14.00px');

      console.info('[selectedOptionTextModifier_static_0300] END');
      done();
    });

  })
}