/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function AlphabetIndexerAttributeNullUndefined() {
   describe('AlphabetIndexerAttributeNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("AlphabetIndexerAttributeNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexerAttributeNullUndefined/AlphabetIndexerAttributeNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlphabetIndexerAttributeNullUndefined state pages:" + JSON.stringify(pages));
        if (!("alphabetAlignStyle" == pages.name)) {
          console.info("get AlphabetIndexerAttributeNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlphabetIndexerAttributeNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlphabetIndexerAttributeNullUndefined page error:" + err);
      }
      console.info("AlphabetIndexerAttributeNullUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0010
     * @tc.number AlphabetIndexerAttributeNullUndefined_0010
     * @tc.desc   test popupBackground undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0010', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0010]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info(`${testName} default popupBackground: ` + objdefault.$attrs.popupBackground);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 popupBackground: ` + obj1.$attrs.popupBackground);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`${testName} 2 popupBackground: ` + obj2.$attrs.popupBackground);

      expect(objdefault.$attrs.popupBackground).assertEqual(obj1.$attrs.popupBackground);
      expect(objdefault.$attrs.popupBackground).assertEqual(obj2.$attrs.popupBackground);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0020
     * @tc.number AlphabetIndexerAttributeNullUndefined_0020
     * @tc.desc   test popupSelectedColor undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0020', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0020]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0200] default popupSelectedColor: ' + objdefault.$attrs.popupSelectedColor);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0200] 1 popupSelectedColor: ' + obj1.$attrs.popupSelectedColor);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0200] 2 popupSelectedColor: ' + obj2.$attrs.popupSelectedColor);

      expect(objdefault.$attrs.popupSelectedColor).assertEqual(obj1.$attrs.popupSelectedColor);
      expect(objdefault.$attrs.popupSelectedColor).assertEqual(obj2.$attrs.popupSelectedColor);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0030
     * @tc.number AlphabetIndexerAttributeNullUndefined_0030
     * @tc.desc   test popupFont undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0030', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0030]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0300] default popupFont: ' + objdefault.$attrs.popupFont);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0300] 1 popupFont: ' + JSON.stringify(obj1.$attrs.popupFont));

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0300] 2 popupFont: ' + JSON.stringify(obj2.$attrs.popupFont));

      expect(JSON.stringify(obj2.$attrs.popupFont)).assertEqual(JSON.stringify(obj1.$attrs.popupFont));
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0040
     * @tc.number AlphabetIndexerAttributeNullUndefined_0040
     * @tc.desc   test popupItemBackgroundColor undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0040', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0040]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0400] default popupItemBackgroundColor: '
        + objdefault.$attrs.popupItemBackgroundColor);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0400] 1 popupItemBackgroundColor: ' + obj1.$attrs.popupItemBackgroundColor);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0400] 2 popupItemBackgroundColor: ' + obj2.$attrs.popupItemBackgroundColor);

      expect(objdefault.$attrs.popupItemBackgroundColor).assertEqual(obj1.$attrs.popupItemBackgroundColor);
      expect(objdefault.$attrs.popupItemBackgroundColor).assertEqual(obj2.$attrs.popupItemBackgroundColor);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0050
     * @tc.number AlphabetIndexerAttributeNullUndefined_0050
     * @tc.desc   test selectedFont undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0050', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0050]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0500] default selectedFont: '
        + objdefault.$attrs.selectedFont);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0500] 1 selectedFont: ' + JSON.stringify(obj1.$attrs.selectedFont));

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0500] 2 selectedFont: ' + JSON.stringify(obj2.$attrs.selectedFont));

      expect(JSON.stringify(obj2.$attrs.selectedFont)).assertEqual(JSON.stringify(obj1.$attrs.selectedFont));
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0060
     * @tc.number AlphabetIndexerAttributeNullUndefined_0060
     * @tc.desc   test popupItemFont undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0060', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0060]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0600] default popupItemFont: '
        + objdefault.$attrs.popupItemFont);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0600] 1 popupItemFont: ' + obj1.$attrs.popupItemFont);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0600] 2 popupItemFont: ' + obj2.$attrs.popupItemFont);

      expect(objdefault.$attrs.popupItemFont).assertEqual(obj1.$attrs.popupItemFont);
      expect(objdefault.$attrs.popupItemFont).assertEqual(obj2.$attrs.popupItemFont);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0070
     * @tc.number AlphabetIndexerAttributeNullUndefined_0070
     * @tc.desc   test font undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0070', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0070]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0700] default font: '
        + objdefault.$attrs.font);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0700] 1 font: ' + JSON.stringify(obj1.$attrs.font));

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0700] 2 font: ' + JSON.stringify(obj2.$attrs.font));

      expect(JSON.stringify(obj2.$attrs.font)).assertEqual(JSON.stringify(obj1.$attrs.font));
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0080
     * @tc.number AlphabetIndexerAttributeNullUndefined_0080
     * @tc.desc   test selected undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0080', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0080]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0800] default selected: '
        + objdefault.$attrs.selected);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0800] 1 selected: ' + obj1.$attrs.selected);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0800] 2 selected: ' + obj2.$attrs.selected);

      expect(objdefault.$attrs.selected).assertEqual(obj1.$attrs.selected);
      expect(objdefault.$attrs.selected).assertEqual(obj2.$attrs.selected);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0090
     * @tc.number AlphabetIndexerAttributeNullUndefined_0090
     * @tc.desc   test popupPosition undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0090', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0090]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_0900] default popupPosition: '
        + objdefault.$attrs.popupPosition);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_0900] 1 popupPosition: ' + JSON.stringify(obj1.$attrs.popupPosition));

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_0900] 2 popupPosition: ' + JSON.stringify(obj2.$attrs.popupPosition));

      expect(JSON.stringify(objdefault.$attrs.popupPosition)).assertEqual(JSON.stringify(obj1.$attrs.popupPosition));
      expect(JSON.stringify(objdefault.$attrs.popupPosition)).assertEqual(JSON.stringify(obj2.$attrs.popupPosition));
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0100
     * @tc.number AlphabetIndexerAttributeNullUndefined_0100
     * @tc.desc   test popupItemBorderRadius undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0100]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_1000] default popupItemBorderRadius: '
        + objdefault.$attrs.popupItemBorderRadius);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_1000] 1 popupItemBorderRadius: ' + obj1.$attrs.popupItemBorderRadius);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_1000] 2 popupItemBorderRadius: ' + obj2.$attrs.popupItemBorderRadius);

      expect(objdefault.$attrs.popupItemBorderRadius).assertEqual(obj1.$attrs.popupItemBorderRadius);
      expect(objdefault.$attrs.popupItemBorderRadius).assertEqual(obj2.$attrs.popupItemBorderRadius);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0110
     * @tc.number AlphabetIndexerAttributeNullUndefined_0110
     * @tc.desc   test itemBorderRadius undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0110', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0110]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_1100] default itemBorderRadius: '
        + objdefault.$attrs.itemBorderRadius);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_1100] 1 itemBorderRadius: ' + obj1.$attrs.itemBorderRadius);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_1100] 2 itemBorderRadius: ' + obj2.$attrs.itemBorderRadius);

      expect(objdefault.$attrs.itemBorderRadius).assertEqual(obj1.$attrs.itemBorderRadius);
      expect(objdefault.$attrs.itemBorderRadius).assertEqual(obj2.$attrs.itemBorderRadius);
      console.log(`${testName} end`);
      done();
    });

    /**
     * @tc.name   AlphabetIndexerAttributeNullUndefined_0120
     * @tc.number AlphabetIndexerAttributeNullUndefined_0120
     * @tc.desc   test popupBackgroundBlurStyle undefined/null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AlphabetIndexerAttributeNullUndefined_0120', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[AlphabetIndexerAttributeNullUndefined_0120]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();
      let strJsondefault = getInspectorByKey('alphabet_3');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[AlphabetIndexer_1200] default popupBackgroundBlurStyle: '
        + objdefault.$attrs.popupBackgroundBlurStyle);

      let strJson1 = getInspectorByKey('alphabet_1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[AlphabetIndexer_1200] 1 popupBackgroundBlurStyle: ' + obj1.$attrs.popupBackgroundBlurStyle);

      let strJson2 = getInspectorByKey('alphabet_2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[AlphabetIndexer_1200] 2 popupBackgroundBlurStyle: ' + obj2.$attrs.popupBackgroundBlurStyle);

      expect(objdefault.$attrs.popupBackgroundBlurStyle).assertEqual(obj1.$attrs.popupBackgroundBlurStyle);
      expect(objdefault.$attrs.popupBackgroundBlurStyle).assertEqual(obj2.$attrs.popupBackgroundBlurStyle);
      console.log(`${testName} end`);
      done();
    });

  })
}
