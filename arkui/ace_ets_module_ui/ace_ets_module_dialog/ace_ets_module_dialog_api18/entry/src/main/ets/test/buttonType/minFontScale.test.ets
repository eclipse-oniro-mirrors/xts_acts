/*
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";

const SLEEP_TIME = 1000;

export default function buttonMinFontScaleTest() {
  describe('buttonMinFontScaleTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonType/minFontScale',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get minFontScale state success ' + JSON.stringify(pages));
        if (!('minFontScale' == pages.name)) {
          console.info('get minFontScale state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push minFontScale page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push minFontScale page error ' + JSON.stringify(err));
      }
      done()
    });

   /**
    * @tc.name   buttonMinFontScaleTest_0100
    * @tc.number buttonMinFontScaleTest_0100
    * @tc.desc   set button minFontScale:0.5
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('buttonMinFontScaleTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0100 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn1 = getInspectorByKey('btn1');
      console.info("buttonMinFontScaleTest_0100 component obj is: " + JSON.stringify(btn1));
      console.info("[buttonMinFontScaleTest_0100] title: " + JSON.stringify(JSON.parse(btn1).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn1).$attrs.minFontScale)).assertEqual('"0.500000"');
      console.info('buttonMinFontScaleTest_0100 END');
      done();
    });


    /**
     * @tc.name   buttonMinFontScaleTest_0200
     * @tc.number buttonMinFontScaleTest_0200
     * @tc.desc   set button minFontScale:0.7,return value: 0.700000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMinFontScaleTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0200 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn2 = getInspectorByKey('btn2');
      console.info("buttonMinFontScaleTest_0200 component obj is: " + JSON.stringify(btn2));
      console.info("[buttonMinFontScaleTest_0200] title: " + JSON.stringify(JSON.parse(btn2).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn2).$attrs.minFontScale)).assertEqual('"0.700000"');
      console.info('buttonMinFontScaleTest_0200 END');
      done();
    });

    /**
     * @tc.name   buttonMinFontScaleTest_0300
     * @tc.number buttonMinFontScaleTest_0300
     * @tc.desc   set button minFontScale:0,return value: 0.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMinFontScaleTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0300 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn3 = getInspectorByKey('btn3');
      console.info("buttonMinFontScaleTest_0300 component obj is: " + JSON.stringify(btn3));
      console.info("[buttonMinFontScaleTest_0300] title: " + JSON.stringify(JSON.parse(btn3).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn3).$attrs.minFontScale)).assertEqual('"0.000000"');
      console.info('buttonMinFontScaleTest_0300 END');
      done();
    });

    /**
     * @tc.name   buttonMinFontScaleTest_0400
     * @tc.number buttonMinFontScaleTest_0400
     * @tc.desc   set button minFontScale:1,return value: 1.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMinFontScaleTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0400 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn4 = getInspectorByKey('btn4');
      console.info("buttonMinFontScaleTest_0400 component obj is: " + JSON.stringify(btn4));
      console.info("[buttonMinFontScaleTest_0400] title: " + JSON.stringify(JSON.parse(btn4).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn4).$attrs.minFontScale)).assertEqual('"1.000000"');
      console.info('buttonMinFontScaleTest_0400 END');
      done();
    });

    /**
     * @tc.name   buttonMinFontScaleTest_0500
     * @tc.number buttonMinFontScaleTest_0500
     * @tc.desc   set button minFontScale:undefined,return value: 0.850000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMinFontScaleTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0500 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn5 = getInspectorByKey('btn5');
      console.info("buttonMinFontScaleTest_0500 component obj is: " + JSON.stringify(btn5));
      console.info("[buttonMinFontScaleTest_0500] title: " + JSON.stringify(JSON.parse(btn5).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn5).$attrs.minFontScale)).assertEqual('"0.850000"');
      console.info('buttonMinFontScaleTest_0500 END');
      done();
    });

    /**
     * @tc.name   buttonMinFontScaleTest_0600
     * @tc.number buttonMinFontScaleTest_0600
     * @tc.desc   set button minFontScale:null,return value: 0.850000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMinFontScaleTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0600 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn6 = getInspectorByKey('btn6');
      console.info("buttonMinFontScaleTest_0600 component obj is: " + JSON.stringify(btn6));
      console.info("[buttonMinFontScaleTest_0600] title: " + JSON.stringify(JSON.parse(btn6).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn6).$attrs.minFontScale)).assertEqual('"0.850000"');
      console.info('buttonMinFontScaleTest_0600 END');
      done();
    });

    /**
     * @tc.name   buttonMinFontScaleTest_0700
     * @tc.number buttonMinFontScaleTest_0700
     * @tc.desc   set button minFontScale:-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMinFontScaleTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMinFontScaleTest_0700 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn7 = getInspectorByKey('btn7');
      console.info("buttonMinFontScaleTest_0700 component obj is: " + JSON.stringify(btn7));
      console.info("[buttonMinFontScaleTest_0700] title: " + JSON.stringify(JSON.parse(btn7).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn7).$attrs.minFontScale)).assertEqual('"0.000000"');
      console.info('buttonMinFontScaleTest_0700 END');
      done();
    });
  })
}
