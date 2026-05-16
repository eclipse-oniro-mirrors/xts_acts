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

export default function buttonMaxFontScaleTest() {
  describe('buttonMaxFontScaleTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonType/maxFontScale',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get maxFontScale state success ' + JSON.stringify(pages));
        if (!('maxFontScale' == pages.name)) {
          console.info('get maxFontScale state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push maxFontScale page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push maxFontScale page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0100
     * @tc.number buttonMaxFontScaleTest_0100
     * @tc.desc   set button maxFontScale:1,return value: 1.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0100 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn01 = getInspectorByKey('btn01');
      console.info("buttonMaxFontScaleTest_0100 component obj is: " + JSON.stringify(btn01));
      console.info("[buttonMaxFontScaleTest_0100] title: " + JSON.stringify(JSON.parse(btn01).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn01).$attrs.maxFontScale)).assertEqual('"1.000000"');
      console.info('buttonMinFontScaleTest_0100 END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0200
     * @tc.number buttonMaxFontScaleTest_0200
     * @tc.desc   set button maxFontScale:1.5,return value: 1.500000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0200 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn02 = getInspectorByKey('btn02');
      console.info("buttonMaxFontScaleTest_0200 component obj is: " + JSON.stringify(btn02));
      console.info("[buttonMaxFontScaleTest_0200] title: " + JSON.stringify(JSON.parse(btn02).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn02).$attrs.maxFontScale)).assertEqual('"1.500000"');
      console.info('buttonMaxFontScaleTest_0200 END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0300
     * @tc.number buttonMaxFontScaleTest_0300
     * @tc.desc   set button maxFontScale:3.2,return value: 3.200000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0300 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn03 = getInspectorByKey('btn03');
      console.info("buttonMaxFontScaleTest_0300 component obj is: " + JSON.stringify(btn03));
      console.info("[buttonMaxFontScaleTest_0300] title: " + JSON.stringify(JSON.parse(btn03).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn03).$attrs.maxFontScale)).assertEqual('"3.200000"');
      console.info('buttonMaxFontScaleTest_0300 END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0400
     * @tc.number buttonMaxFontScaleTest_0400
     * @tc.desc   set button maxFontScale:20,return value: 20.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0400 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn04 = getInspectorByKey('btn04');
      console.info("buttonMaxFontScaleTest_0400 component obj is: " + JSON.stringify(btn04));
      console.info("[buttonMaxFontScaleTest_0400] title: " + JSON.stringify(JSON.parse(btn04).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn04).$attrs.maxFontScale)).assertEqual('"20.000000"');
      console.info('buttonMaxFontScaleTest_0400 END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0500
     * @tc.number buttonMaxFontScaleTest_0500
     * @tc.desc   set button maxFontScale:undefined,return value: 3.200000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0500 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn05 = getInspectorByKey('btn05');
      console.info("buttonMaxFontScaleTest_0500 component obj is: " + JSON.stringify(btn05));
      console.info("[buttonMaxFontScaleTest_0500] title: " + JSON.stringify(JSON.parse(btn05).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn05).$attrs.maxFontScale)).assertEqual('"3.200000"');
      console.info('buttonMaxFontScaleTest_0500 END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0600
     * @tc.number buttonMaxFontScaleTest_0600
     * @tc.desc   set button maxFontScale:null,return value:3.200000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0600 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn06 = getInspectorByKey('btn06');
      console.info("buttonMaxFontScaleTest_0600 component obj is: " + JSON.stringify(btn06));
      console.info("[buttonMaxFontScaleTest_0600] title: " + JSON.stringify(JSON.parse(btn06).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn06).$attrs.maxFontScale)).assertEqual('"3.200000"');
      console.info('buttonMaxFontScaleTest_0600 END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontScaleTest_0700
     * @tc.number buttonMaxFontScaleTest_0700
     * @tc.desc   set button maxFontScale:0,return value: 1.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonMaxFontScaleTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('buttonMaxFontScaleTest_0700 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let btn07 = getInspectorByKey('btn07');
      console.info("buttonMaxFontScaleTest_0700 component obj is: " + JSON.stringify(btn07));
      console.info("[buttonMaxFontScaleTest_0700] title: " + JSON.stringify(JSON.parse(btn07).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn07).$attrs.maxFontScale)).assertEqual('"1.000000"');
      console.info('buttonMaxFontScaleTest_0700 END');
      done();
    });
   
  })
}
