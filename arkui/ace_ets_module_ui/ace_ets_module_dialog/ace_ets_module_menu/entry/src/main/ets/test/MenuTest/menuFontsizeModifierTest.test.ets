/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { router } from '@kit.ArkUI';

export default function menuFontsizeModifierTest() {
  describe('menuFontsizeModifierTest', () => {
    beforeEach(async (done: Function) => {
      console.info('menuFontsizeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuFontsizeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get menuFontsizeModifier state pages:' + JSON.stringify(pages));
        if (!('menuFontsizeModifier' == pages.name)) {
          console.info('get menuFontsizeModifier pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push menuFontsizeModifier page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push menuFontsizeModifier page error:' + err);
      }
      console.info('menuFontsizeModifier beforeEach end');
      done();
    });
    /**
     * @tc.name   ArkUX_Modifier_Menu_FontSize_1001
     * @tc.number ArkUX_Modifier_Menu_FontSize_1001
     * @tc.desc   OnChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Modifier_Menu_FontSize_1001', Level.LEVEL2, async (done: Function) => {
        console.info('ArkUX_Modifier_Menu_FontSize_1001 START');
        let driver = Driver.create();
        let buttonOnchange = await driver.findComponent(ON.id('MenuFontSizeButtonID'));
        await buttonOnchange.click();
        await CommonFunc.sleep(1000)
  
        let strJsonNew:string = getInspectorByKey('MenuFontSizeValueKey');
        console.info("ArkUX_Modifier_Menu_FontSize_1001 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('50px');
        console.info('ArkUX_Modifier_Menu_FontSize_1001 END');
        await buttonOnchange.click();
        await CommonFunc.sleep(1000)
        done();
      });
  
      /**
       * @tc.name   ArkUX_Modifier_Menu_FontSize_1002
       * @tc.number ArkUX_Modifier_Menu_FontSize_1002
       * @tc.desc   OnChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('ArkUX_Modifier_Menu_FontSize_1002', Level.LEVEL2, async (done: Function) => {
        console.info('ArkUX_Modifier_Menu_FontSize_1002 START');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('MenuFontSizeChangeButtonID'));
        await button.click();
        await CommonFunc.sleep(2000)
        let buttonOnchange = await driver.findComponent(ON.id('MenuFontSizeButtonID'));
        await buttonOnchange.click();
        await CommonFunc.sleep(1000)
  
        let strJsonNew:string = getInspectorByKey('MenuFontSizeValueKey');
        console.info("ArkUX_Modifier_Menu_FontSize_1002 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('-20');
        console.info('ArkUX_Modifier_Menu_FontSize_1002 END');
        await buttonOnchange.click();
        await CommonFunc.sleep(1000)
        done();
      });
  
      /**
       * @tc.name   ArkUX_Modifier_Menu_FontSize_1003
       * @tc.number ArkUX_Modifier_Menu_FontSize_1003
       * @tc.desc   OnChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('ArkUX_Modifier_Menu_FontSize_1003', Level.LEVEL2, async (done: Function) => {
        console.info('ArkUX_Modifier_Menu_FontSize_1003 START');
        let driver = Driver.create();
        let buttonTwo = await driver.findComponent(ON.id('MenuFontSizeChangeButtonID'));
        await buttonTwo.click();
        await CommonFunc.sleep(2000)
        let buttonOnchange = await driver.findComponent(ON.id('MenuFontSizeButtonID'));
        await buttonOnchange.click();
        await CommonFunc.sleep(1000)
  
        let strJsonNew:string = getInspectorByKey('MenuFontSizeValueKey');
        console.info("ArkUX_Modifier_Menu_FontSize_1003 component  is: " + JSON.stringify(JSON.parse(strJsonNew)
          .$attrs));
        expect(JSON.parse(strJsonNew).$attrs.content).assertEqual('0');
        console.info('ArkUX_Modifier_Menu_FontSize_1003 END');
        await buttonOnchange.click();
        await CommonFunc.sleep(1000)
        done();
      });
    })
}
