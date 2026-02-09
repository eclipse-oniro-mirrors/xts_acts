/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function fontJsunit() {
  describe('fontJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridColOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/font/fontAdd',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridColOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("fontAdd" == pages.name)) {
          console.info("get GridColOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridColOffsetJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridColOffsetJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   fontJsunit_0100
     * @tc.number fontJsunit_0100
     * @tc.desc   fontJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fontJsunit_0100', Level.LEVEL0, async (done: Function) => {
      // Get the information of the font
      console.info('fontJsunit_0100 START');
      if (globalThis.winLeft == 0) {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('getSystemFontList'));
        await btn.click();
        await CommonFunc.sleep(100);
        let strJson = getInspectorByKey('fontlist');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[GridColOffsetJsunit_0100] component  strJson:" + JSON.stringify(obj.$attrs.content));
        let fontList:string[]|undefined = AppStorage.get('fontList')
        if (obj.$attrs.content == "") {
            expect(obj.$attrs.content).assertEqual("");
            expect(fontList && fontList.length==0).assertTrue()
        } else {
            expect(obj.$attrs.content).assertContain("书宋-简");
            expect(fontList && fontList.length>0).assertTrue()
        }
        AppStorage.delete('fontList')
      }
      done();
    });

    /**
     * @tc.name   fontJsunit_0200
     * @tc.number fontJsunit_0200
     * @tc.desc   fontJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fontJsunit_0200', Level.LEVEL0, async (done: Function) => {
      // Get the information of the font
      console.info('fontJsunit_0200 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('getgetFontByName'));
      await btn.click();
      await CommonFunc.sleep(100);
      let strJson = getInspectorByKey('fontName');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridColOffsetJsunit_0200] component  strJson:" + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("HarmonyOS Sans Italic");
      done();
    });

     /**
      * @tc.name   fontJsunit_0300
      * @tc.number fontJsunit_0300
      * @tc.desc   fontJsunit_0300
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fontJsunit_0300', Level.LEVEL0, async (done: Function) => {
      // Get the information of the font
      console.info('fontJsunit_0300 START');
      try {
        let font: string[] | null = globalThis.uiContext.getFont().getSystemFontList()
        expect(font !=null).assertTrue();
        if(font && font.length){
          expect(font && font.length>0).assertTrue
        }else{
          expect(font && font.length).assertEqual(0)
        }
      } catch (err) {
        console.error("fontJsunit_0300 error " + JSON.stringify(err));
      }
      done();
    });

     /**
      * @tc.name   fontJsunit_0400
      * @tc.number fontJsunit_0400
      * @tc.desc   fontJsunit_0400
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fontJsunit_0400', Level.LEVEL0, async (done: Function) => {
      // Get the information of the font
      console.info('fontJsunit_0400 START');
      try {
        let font: Object | null = globalThis.uiContext.getFont().getFontByName('HarmonyOS Sans Italic')
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0400 error " + JSON.stringify(err));
      }
      done();
    });

     /**
      * @tc.name   fontJsunit_0500
      * @tc.number fontJsunit_0500
      * @tc.desc   fontJsunit_0500
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('fontJsunit_0500', Level.LEVEL0, async (done: Function) => {
      // Get the information of the font
      console.info('fontJsunit_0500 START');
      try {
        let font: Object | null = globalThis.uiContext.getFont().getUIInspector();
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0500 error " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   fontJsunit_0600
     * @tc.number fontJsunit_0600
     * @tc.desc   fontJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fontJsunit_0600', Level.LEVEL0, async (done: Function) => {
      // Get the information of the font
      console.info('fontJsunit_0600 START');
      try {
        let font: Object | null = globalThis.uiContext.getFont().getComponentUtils();
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0600 error " + JSON.stringify(err));
      }
      done();
    });



  })
}
