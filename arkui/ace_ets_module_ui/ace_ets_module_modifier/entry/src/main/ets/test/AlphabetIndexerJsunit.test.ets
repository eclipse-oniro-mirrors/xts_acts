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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import Utils from './Utils';
import router from '@ohos.router';

export default function alphabetIndexerJsunit() {
  describe('alphabetIndexerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("alphabetIndexerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/alphabetIndexer',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get alphabetIndexer state pages: " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push alphabetIndexer page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0101
     * @tc.number ArkUI_AlphabetIndexer_0101
     * @tc.desc   Set font values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0101', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0101 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');
      expect(JSON.parse(strJson).$attrs.font.fontSize).assertEqual("18.00fp");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0102
     * @tc.number ArkUI_AlphabetIndexer_0102
     * @tc.desc   Set selectFont values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0102', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0102 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.selectedFont.fontSize).assertEqual("28.00fp");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0103
     * @tc.number ArkUI_AlphabetIndexer_0103
     * @tc.desc   Set color values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0103', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0103 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.color).assertEqual("#FF000000");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0104
     * @tc.number ArkUI_AlphabetIndexer_0104
     * @tc.desc   Set selectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0104', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0104 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual("#FFFF1493");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0105
     * @tc.number ArkUI_AlphabetIndexer_0105
     * @tc.desc   Set selectedBackgroundColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0105', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0105 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.selectedBackgroundColor).assertEqual("#FFBEBEBE");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0106
     * @tc.number ArkUI_AlphabetIndexer_0106
     * @tc.desc   Set itemSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0106', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0106 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.itemSize).assertEqual("26.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0107
     * @tc.number ArkUI_AlphabetIndexer_0107
     * @tc.desc   Set usingPopup values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0107', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0107 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.usingPopup).assertEqual("true");
      done();
    }); /**
     * @tc.number ArkUI_AlphabetIndexer_0108
     * @tc.name Test the properties of components
     * @tc.desc Set alignStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    /**
     * @tc.name   ArkUI_AlphabetIndexer_0108
     * @tc.number ArkUI_AlphabetIndexer_0108
     * @tc.desc   ArkUI_AlphabetIndexer_0108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0108', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0108 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.alignStyle).assertEqual("IndexerAlign.Left");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0109
     * @tc.number ArkUI_AlphabetIndexer_0109
     * @tc.desc   Set popupFont values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0109', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0109 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.popupFont.fontSize).assertEqual("28.00fp");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0110
     * @tc.number ArkUI_AlphabetIndexer_0110
     * @tc.desc   Set popupColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0110', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0110 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.popupColor).assertEqual("#FFFFA500");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0111
     * @tc.number ArkUI_AlphabetIndexer_0111
     * @tc.desc   Set popupBackground values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0111', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0111 start");
      let strJson = getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parse(strJson).$attrs.popupBackground).assertEqual("#FF32CD32");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0112
     * @tc.number ArkUI_AlphabetIndexer_0112
     * @tc.desc   Set selected values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0112', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0112 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parse(strJson).$attrs.selected).assertEqual("1");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0113
     * @tc.number ArkUI_AlphabetIndexer_0113
     * @tc.desc   Set popupPosition values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0113', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0113 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parse(strJson).$attrs.popupPosition?.popupPositionX).assertEqual("90.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0114
     * @tc.number ArkUI_AlphabetIndexer_0114
     * @tc.desc   Set popupSelectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0114', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0114 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parse(strJson).$attrs.popupSelectedColor).assertEqual("#FF00CED1");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0115
     * @tc.number ArkUI_AlphabetIndexer_0115
     * @tc.desc   Set popupUnselectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0115', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0115 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parse(strJson).$attrs.popupUnselectedColor).assertEqual("#FFC0FF3E");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0116
     * @tc.number ArkUI_AlphabetIndexer_0116
     * @tc.desc   Set popupItemBackground values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0116', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0116 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parse(strJson).$attrs.popupItemBackground).assertEqual("#FF8470FF");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0117
     * @tc.number ArkUI_AlphabetIndexer_0117
     * @tc.desc   Set popupItemFontSize values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0117', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_AlphabetIndexer_0117 start");
      let strJson = getInspectorByKey('alphabetIndexerTest2');
      expect(JSON.parse(strJson).$attrs.popupItemFontSize).assertEqual("30.00fp");
      done();
    });

    /**
     * @tc.name   ArkUI_AlphabetIndexer_0118
     * @tc.number ArkUI_AlphabetIndexer_0118
     * @tc.desc   Change selected values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_AlphabetIndexer_0118', Level.LEVEL0, async (done: Function) => {

      console.info('ArkUI_AlphabetIndexer_0118 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('alphabetIndexerTest2');
      console.info("ArkUI_AlphabetIndexer_0118 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.selected).assertEqual("2");
      console.info('ArkUI_AlphabetIndexer_0118 END');
      done();
    });

  })
}