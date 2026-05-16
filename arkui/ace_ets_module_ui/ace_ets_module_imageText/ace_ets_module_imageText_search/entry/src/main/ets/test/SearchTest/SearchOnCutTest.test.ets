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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function SearchOnCutTest() {
  describe('SearchOnCutTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchOnCutTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchOnCutTest state success " + JSON.stringify(pages));
        if (!("SearchOnCutTest" == pages.name)) {
          console.info("get SearchOnCutTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push SearchOnCutTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchOnCutTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SearchOnCutTest after each called");
    });

    /**
     * @tc.name   testsearchOnCut0001
     * @tc.number testsearchOnCut0001
     * @tc.desc   acesearchOnCutEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0001',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("320.00vp");
      console.info("[testsearchOnCut0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testsearchOnCut0002
     * @tc.number testsearchOnCut0002
     * @tc.desc   acesearchOnCutEtsTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0002',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testsearchOnCut0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testsearchOnCut0003
     * @tc.number testsearchOnCut0003
     * @tc.desc   acesearchOnCutEtsTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0003',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0003 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testsearchOnCut0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /**
     * @tc.name   testsearchOnCut0004
     * @tc.number testsearchOnCut0004
     * @tc.desc   acesearchOnCutEtsTest0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0004',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0004 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testsearchOnCut0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testsearchOnCut0005
     * @tc.number testsearchOnCut0005
     * @tc.desc   acesearchOnCutEtsTest0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0005',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0005 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testsearchOnCut0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /**
     * @tc.name   testsearchOnCut0006
     * @tc.number testsearchOnCut0006
     * @tc.desc   acesearchOnCutEtsTest0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0006',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0006 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testsearchOnCut0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /**
     * @tc.name   testsearchOnCut0007
     * @tc.number testsearchOnCut0007
     * @tc.desc   acesearchOnCutEtsTest0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0007',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0007 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testsearchOnCut0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);

    });

    /**
     * @tc.name   testsearchOnCut0009
     * @tc.number testsearchOnCut0009
     * @tc.desc   acesearchOnCutEtsTest0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0009',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut009 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testsearchOnCut0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testsearchOnCut0010
     * @tc.number testsearchOnCut0010
     * @tc.desc   acesearchOnCutEtsTest0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsearchOnCut0010',  Level.LEVEL0, async () => {
      console.info('searchOnCut testsearchOnCut0010 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('onCutTextSearchText');
      console.info("[testsearchOnCut0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
      console.info("[testsearchOnCut0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });
  })
}
