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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextFontWeightTest() {
  describe('TextFontWeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextFontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextFontWeightTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextFontWeightTest state pages:" + JSON.stringify(pages));
        if (!("TextFontWeightTest" == pages.name)) {
          console.info("get TextFontWeightTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextFontWeightTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextFontWeightTest page error:" + err);
      }
      console.info("TextFontWeightTest beforeEach end");
      done();
    });

    /**
     * @tc.name   TextFontWeightTest_001
     * @tc.number TextFontWeightTest_001
     * @tc.desc   set Text: fontWeight  负数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextFontWeightTest_001',  Level.LEVEL3, async (done: Function) => {
      console.info('TextFontWeightTest_0010 START');
      let strJson1 = getInspectorByKey('textFontWeightTest01');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextFontWeightTest_0010] value: ' + JSON.stringify(obj1.$attrs.fontWeight));
      expect(obj1.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('TextFontWeightTest_0010 END');
      done();
    });

    /**
     * @tc.name   TextFontWeightTest_002
     * @tc.number TextFontWeightTest_002
     * @tc.desc   set Text: fontWeight  99
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextFontWeightTest_002',  Level.LEVEL3, async (done: Function) => {
      console.info('TextFontWeightTest_002 START');
      let strJson1 = getInspectorByKey('textFontWeightTest02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextFontWeightTest_002] value: ' + JSON.stringify(obj1.$attrs.fontWeight));
      expect(obj1.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('TextFontWeightTest_002 END');
      done();
    });

    /**
     * @tc.name   TextFontWeightTest_003
     * @tc.number TextFontWeightTest_003
     * @tc.desc   set Text: fontWeight  901
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextFontWeightTest_003',  Level.LEVEL3, async (done: Function) => {
      console.info('TextFontWeightTest_003 START');
      let strJson1 = getInspectorByKey('textFontWeightTest03');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextFontWeightTest_003] value: ' + JSON.stringify(obj1.$attrs.fontWeight));
      expect(obj1.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('TextFontWeightTest_003 END');
      done();
    });

    /**
     * @tc.name   TextFontWeightTest_004
     * @tc.number TextFontWeightTest_004
     * @tc.desc   set Text: fontWeight  负数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextFontWeightTest_004',  Level.LEVEL3, async (done: Function) => {
      console.info('TextFontWeightTest_004 START');
      let strJson1 = getInspectorByKey('textFontWeightTest04');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextFontWeightTest_004] value: ' + JSON.stringify(obj1.$attrs.fontWeight));
      expect(obj1.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('TextFontWeightTest_004 END');
      done();
    });

    /**
     * @tc.name   TextFontWeightTest_005
     * @tc.number TextFontWeightTest_005
     * @tc.desc   set Text: fontWeight  99
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextFontWeightTest_005',  Level.LEVEL3, async (done: Function) => {
      console.info('TextFontWeightTest_005 START');
      let strJson1 = getInspectorByKey('textFontWeightTest05');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextFontWeightTest_005] value: ' + JSON.stringify(obj1.$attrs.fontWeight));
      expect(obj1.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('TextFontWeightTest_005 END');
      done();
    });

    /**
     * @tc.name   TextFontWeightTest_006
     * @tc.number TextFontWeightTest_006
     * @tc.desc   set Text: fontWeight  901
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextFontWeightTest_006',  Level.LEVEL3, async (done: Function) => {
      console.info('TextFontWeightTest_006 START');
      let strJson1 = getInspectorByKey('textFontWeightTest06');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TextFontWeightTest_006] value: ' + JSON.stringify(obj1.$attrs.fontWeight));
      expect(obj1.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('TextFontWeightTest_006 END');
      done();
    });

  })
}