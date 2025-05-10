/*
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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import Utils from './Utils';
import router from '@ohos.router';

export default function alphabetIndexerJsunit() {
  describe('alphabetIndexerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetIndexerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/alphabetIndexer',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetIndexer state pages: " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push alphabetIndexer page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alphabetIndexer page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ArkUI_AlphabetIndexer_0101
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0101', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0101 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.font.fontSize).assertEqual("18.00fp");
      done();
    });
 
    /**
     * @tc.number ArkUI_AlphabetIndexer_0102
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0102', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0102 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.selectedFont.fontSize).assertEqual("28.00fp");
      done();
    });
    
    /**
     * @tc.number ArkUI_AlphabetIndexer_0103
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0103', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0103 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.color).assertEqual("#FF000000");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0104
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0104', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0104 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.selectedColor).assertEqual("#FFFF1493");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0105
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0105', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0105 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.selectedBackgroundColor).assertEqual("#FFBEBEBE");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0106
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0106', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0106 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.itemSize).assertEqual("26.00vp");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0107
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0107', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0107 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.usingPopup).assertEqual("true");
      done();
    });    /**
     * @tc.number ArkUI_AlphabetIndexer_0108
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0108', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0108 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.alignStyle).assertEqual("IndexerAlign.Left");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0109
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0109', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0109 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupFont.fontSize).assertEqual("28.00fp");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0110
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0110', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0110 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupColor).assertEqual("#FFFFA500");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0111
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0111', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0111 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupBackground).assertEqual("#FF32CD32");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0112
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0112', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0112 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.selected).assertEqual("1");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0113
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0113', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0113 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupPosition.popupPositionX).assertEqual("90.00vp");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0114
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0114', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0114 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupSelectedColor).assertEqual("#FF00CED1");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0115
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0115', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0115 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupUnselectedColor).assertEqual("#FFC0FF3E");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0116
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0116', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0116 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupItemBackground).assertEqual("#FF8470FF");
      done();
    });

    /**
     * @tc.number ArkUI_AlphabetIndexer_0117
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_AlphabetIndexer_0117', 0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0117 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.popupItemFontSize).assertEqual("30.00fp");
      done();
    });


  })
}