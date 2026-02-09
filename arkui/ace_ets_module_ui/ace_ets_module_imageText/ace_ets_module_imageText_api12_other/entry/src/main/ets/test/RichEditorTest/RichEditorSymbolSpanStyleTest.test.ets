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

export default function RichEditorSymbolSpanStyleTest() {
  describe('RichEditorSymbolSpanStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSymbolSpanStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorSymbolSpanStyleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSymbolSpanStyleTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("RichEditorSymbolSpanStyleTest" == pages.name)) {
          console.info("get RichEditorSymbolSpanStyleTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push RichEditorSymbolSpanStyleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSymbolSpanStyleTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorSymbolSpanStyleTest after each called");
    });

    /**
     * @tc.name   RichEditorSymbolSpanStyleTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   RichEditorSymbolSpanStyleTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RichEditorSymbolSpanStyleTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorSymbolSpanStyleTest0001 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan1'))
      await CommonFunc.sleep(500);
      await addSymbolSpan.click()
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await getSymbolSpanStyle.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('symbolSpanStyleFontColor')).assertEqual('#FFFF0000');
      expect(''+AppStorage.get('symbolSpanStyleFontSize')).assertEqual('30');
      expect(''+AppStorage.get('symbolSpanStyleFontWeight')).assertEqual('1');
      expect(''+AppStorage.get('symbolSpanStyleEffectStrategy')).assertEqual('0');
      expect(''+AppStorage.get('symbolSpanStyleSpanIndex')).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0001] end");
      done();
    });

    /**
     * @tc.name   RichEditorSymbolSpanStyleTest0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   RichEditorSymbolSpanStyleTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RichEditorSymbolSpanStyleTest0002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('RichEditorSymbolSpanStyleTest0002 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan2'))
      await CommonFunc.sleep(500);
      await addSymbolSpan.click()
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await getSymbolSpanStyle.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('symbolSpanStyleFontColor')).assertEqual('#FFFF0000,#FF0000FF,#FFFFC0CB');
      expect(''+AppStorage.get('symbolSpanStyleFontSize')).assertEqual('40');
      expect(''+AppStorage.get('symbolSpanStyleFontWeight')).assertEqual('10');
      expect(''+AppStorage.get('symbolSpanStyleEffectStrategy')).assertEqual('0');
      expect(''+AppStorage.get('symbolSpanStyleSpanIndex')).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0002] end");
      done();
    });

    /**
     * @tc.name   RichEditorSymbolSpanStyleTest0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   RichEditorSymbolSpanStyleTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RichEditorSymbolSpanStyleTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' RichEditorSymbolSpanStyleTest0003 START');
      await CommonFunc.sleep(1000);
      let addSymbolSpan = await driver.findComponent(ON.id('addSymbolSpan3'))
      await CommonFunc.sleep(500);
      await addSymbolSpan.click()
      await CommonFunc.sleep(500);
      let getSymbolSpanStyle = await driver.findComponent(ON.id('getSymbolSpanStyle'))
      await CommonFunc.sleep(500);
      await getSymbolSpanStyle.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('symbolSpanStyleFontColor')).assertEqual('#FFF04B3D,#FF0000FF,#FFFFC0CB');
      expect(''+AppStorage.get('symbolSpanStyleFontSize')).assertEqual('50');
      expect(''+AppStorage.get('symbolSpanStyleFontWeight')).assertEqual('8');
      expect(''+AppStorage.get('symbolSpanStyleEffectStrategy')).assertEqual('0');
      expect(''+AppStorage.get('symbolSpanStyleSpanIndex')).assertEqual('0');
      AppStorage.delete('symbolSpanStyleFontColor')
      AppStorage.delete('symbolSpanStyleFontSize')
      AppStorage.delete('symbolSpanStyleFontWeight')
      AppStorage.delete('symbolSpanStyleEffectStrategy')
      AppStorage.delete('symbolSpanStyleSpanIndex')
      console.info("[RichEditorSymbolSpanStyleTest0003] end");
      done();
    });

  })
}