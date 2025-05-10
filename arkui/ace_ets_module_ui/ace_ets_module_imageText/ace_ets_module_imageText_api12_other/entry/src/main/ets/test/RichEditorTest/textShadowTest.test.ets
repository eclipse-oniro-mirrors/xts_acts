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

export default function textShadowTest() {
  describe('textShadowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/textShadowTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textShadowTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("textShadowTest" == pages.name)) {
          console.info("get textShadowTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push textShadowTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textShadowTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textShadowTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         textShadowTest0001
    * @tc.desic        The textShadow set []
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textShadowTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle1'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get('shadowRadius1')).assertEqual(0);
      expect(AppStorage.get('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get('shadowColor1')).assertEqual('#FF000000');
      expect(AppStorage.get('shadowOffsetX0')).assertEqual(-1);
      expect(AppStorage.get('shadowOffsetX1')).assertEqual(0);
      expect(AppStorage.get('shadowOffsetY0')).assertEqual(-1);
      expect(AppStorage.get('shadowOffsetY1')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowRadius1')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowColor1')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetX1')
      AppStorage.delete('shadowOffsetY0')
      AppStorage.delete('shadowOffsetY1')
      console.info("[textShadowTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         textShadowTest0002
    * @tc.desic        The textShadow set {}
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textShadowTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle2'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get('shadowOffsetX0')).assertEqual(2);
      expect(AppStorage.get('shadowOffsetY0')).assertEqual(2);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0002] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         textShadowTest0003
    * @tc.desic        The textShadow set undefined
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textShadowTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0003 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle3'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('shadowRadius0')).assertEqual(0);
      expect(AppStorage.get('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get('shadowOffsetX0')).assertEqual(0);
      expect(AppStorage.get('shadowOffsetY0')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0003] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0004
    * @tc.name         textShadowTest0004
    * @tc.desic        The textShadow set Color
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textShadowTest0004', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0004 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle4'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get('shadowColor0')).assertEqual('#FFFF0000');
      expect(AppStorage.get('shadowOffsetX0')).assertEqual(0);
      expect(AppStorage.get('shadowOffsetY0')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0004] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0005
    * @tc.name         textShadowTest0005
    * @tc.desic        The textShadow set -1
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textShadowTest0005', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0005 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle5'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('shadowRadius0')).assertEqual(0);
      expect(AppStorage.get('shadowColor0')).assertEqual('#FFFF0000');
      expect(AppStorage.get('shadowOffsetX0')).assertEqual(2);
      expect(AppStorage.get('shadowOffsetY0')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0005] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0006
    * @tc.name         textShadowTest0006
    * @tc.desic        The textShadow set -1
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('textShadowTest0006', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0006 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle6'))
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get('shadowOffsetX0')).assertEqual(-1);
      expect(AppStorage.get('shadowOffsetY0')).assertEqual(-1);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0006] end");
      done();
    });
  })
}