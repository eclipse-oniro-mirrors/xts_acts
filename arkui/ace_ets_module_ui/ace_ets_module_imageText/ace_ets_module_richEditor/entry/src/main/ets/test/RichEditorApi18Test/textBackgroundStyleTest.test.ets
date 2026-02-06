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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function textBackgroundStyleTest() {
  describe('textBackgroundStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textBackgroundStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi18/textBackgroundStyleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textBackgroundStyleTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("textBackgroundStyleTest" == pages.name)) {
          console.info("get textBackgroundStyleTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push textBackgroundStyleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textBackgroundStyleTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textBackgroundStyleTest after each called");
    });

    /**
     * @tc.name   textBackgroundStyleTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   The TextBackgroundStyle  not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual(undefined);
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual(undefined);
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0001] end");
      done();
    });

    /**
     * @tc.name   textBackgroundStyleTest0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   The TextBackgroundStyle  color set undefined  radius not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle1'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual("#00000000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual("radiusTopLeft: [NA]radiusTopRight: [NA]radiusBottomLeft: [NA]radiusBottomRight: [NA]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0002] end");
      done();
    });

    /**
     * @tc.name   textBackgroundStyleTest0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   The TextBackgroundStyle set Normal Value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0003 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle2'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual("#FFFF0000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual("radiusTopLeft: [5.00vp]radiusTopRight: [5.00vp]radiusBottomLeft: [5.00vp]radiusBottomRight: [5.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0003] end");
      done();
    });

    /**
     * @tc.name   textBackgroundStyleTest0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   The TextBackgroundStyle  color not set and radius  set 5vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0004 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle3'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual("#00000000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual("radiusTopLeft: [5.00vp]radiusTopRight: [5.00vp]radiusBottomLeft: [5.00vp]radiusBottomRight: [5.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0004] end");
      done();
    });

    /**
     * @tc.name   textBackgroundStyleTest0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   The TextBackgroundStyle  color set Color.Red and radius set {topLeft:10,topRight:5,bottomLeft:20,bottomRight:15}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0005', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0005 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle4'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual("#FFFF0000");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual("radiusTopLeft: [10.00vp]radiusTopRight: [5.00vp]radiusBottomLeft: [20.00vp]radiusBottomRight: [15.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0005] end");
      done();
    });

    /**
     * @tc.name   textBackgroundStyleTest0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   The TextBackgroundStyle  color set #e0dbeb  radius set -1vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0006', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0006 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle5'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual("#FFE0DBEB");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual("radiusTopLeft: [-1.00vp]radiusTopRight: [-1.00vp]radiusBottomLeft: [-1.00vp]radiusBottomRight: [-1.00vp]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0006] end");
      done();
    });


    /**
     * @tc.name   textBackgroundStyleTest0007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   The TextBackgroundStyle  color set ResourceColor  radius set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textBackgroundStyleTest0007', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0007 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle6'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual("#FFF04B3D");
      expect(AppStorage.get('RichEditorTextBackgroundStyleRadius')).assertEqual("radiusTopLeft: [NA]radiusTopRight: [NA]radiusBottomLeft: [NA]radiusBottomRight: [NA]");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0007] end");
      done();
    });
  })
}
