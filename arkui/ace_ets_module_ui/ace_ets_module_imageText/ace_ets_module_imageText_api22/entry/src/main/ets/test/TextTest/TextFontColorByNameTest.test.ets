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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextFontColorByNameTest() {
  describe('TextFontColorByNameTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextFontColorByNameTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextFontColorByNameTest state pages: ' + JSON.stringify(pages));
        if (!('TextFontColorByNameTest' == pages.name)) {
          console.info('get TextFontColorByNameTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push TextFontColorByNameTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextFontColorByNameTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextFontColorByNameTest after each called');
    });

    /**
     * @tc.name   TextFontColorByNameTest_001
     * @tc.number SUB_ARKUI_ETS_TEXT_FONTCOLOR_BYNAME_0100
     * @tc.desc   fontColor with $r resource-by-name (type=COLOR), triggers resIdNum==-1 branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextFontColorByNameTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[TextFontColorByNameTest_001] START');
      let strJson = getInspectorByKey('textFontColorFromColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextFontColorByNameTest_001] fontColor: ' + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual('#FF00FF00');
      console.info('[TextFontColorByNameTest_001] END');
      done();
    });

    /**
     * @tc.name   TextFontColorByNameTest_002
     * @tc.number SUB_ARKUI_ETS_TEXT_FONTCOLOR_BYNAME_0200
     * @tc.desc   fontColor with $r resource-by-name (type=STRING), triggers resIdNum==-1 branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextFontColorByNameTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[TextFontColorByNameTest_002] START');
      let strJson = getInspectorByKey('textFontColorFromString');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextFontColorByNameTest_002] fontColor: ' + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual('#FF0000FF');
      console.info('[TextFontColorByNameTest_002] END');
      done();
    });

    /**
     * @tc.name   TextFontColorByNameTest_003
     * @tc.number SUB_ARKUI_ETS_TEXT_FONTCOLOR_BYNAME_0300
     * @tc.desc   fontColor with $r resource-by-name (type=INTEGER), triggers resIdNum==-1 branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextFontColorByNameTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[TextFontColorByNameTest_003] START');
      let strJson = getInspectorByKey('textFontColorFromInteger');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextFontColorByNameTest_003] fontColor: ' + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual('#7F00FF00');
      console.info('[TextFontColorByNameTest_003] END');
      done();
    });

    /**
     * @tc.name   TextFontColorByNameTest_004
     * @tc.number SUB_ARKUI_ETS_TEXT_FONTCOLOR_BYNAME_0400
     * @tc.desc   fontColor with $r resource-by-name (type=FLOAT fallback), triggers resIdNum==-1 branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextFontColorByNameTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[TextFontColorByNameTest_004] START');
      let strJson = getInspectorByKey('textFontColorFromFloat');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextFontColorByNameTest_004] fontColor: ' + JSON.stringify(obj.$attrs.fontColor));
      expect(obj.$attrs.fontColor).assertEqual('#00000000');
      console.info('[TextFontColorByNameTest_004] END');
      done();
    });
  })
}
