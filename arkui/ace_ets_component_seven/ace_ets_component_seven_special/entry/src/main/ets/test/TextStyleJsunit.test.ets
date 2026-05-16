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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';

export default function textStyleJsunit() {
  describe('textStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textStyle state pages:" + JSON.stringify(pages));
        if (!("textStyle" == pages.name)) {
          console.info("get textStyle state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textStyle page error:" + err);
      }
      done();
    });

    /**
     * @tc.name   testTextStyle001
     * @tc.number testTextStyle001
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextStyle001', Level.LEVEL0, async (done: Function) => {
      console.info('[testTextStyle001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text1');
      console.info("[testTextStyle001] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.fontColor).assertEqual('#FFFF0000');
      done();
    });

    /**
     * @tc.name   testTextStyle002
     * @tc.number testTextStyle002
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextStyle002', Level.LEVEL0, async (done: Function) => {
      console.info('[testTextStyle002] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text1');
      console.info("[testTextStyle002] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      done();
    });

    /**
     * @tc.name   testTextStyle003
     * @tc.number testTextStyle003
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextStyle003', Level.LEVEL0, async (done: Function) => {
      console.info('[testTextStyle003] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text1');
      console.info("[testTextStyle003] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      done();
    });

    /**
     * @tc.name   testTextStyle004
     * @tc.number testTextStyle004
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextStyle004', Level.LEVEL0, async (done: Function) => {
      console.info('[testTextStyle001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text1');
      console.info("[testTextStyle001] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.fontWeight).assertEqual('700');
      done();
    });

     /**
      * @tc.name   testTextStyle005
      * @tc.number testTextStyle005
      * @tc.desc   Set attribute values
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('testTextStyle005', Level.LEVEL0, async (done: Function) => {
      console.info('[testTextStyle005] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('text1');
      console.info("[testTextStyle005] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Justify');
      done();
    });

  })
}