'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';

const uiContext = new UIContext();

export default function fontJsunit() {
  describe('fontJsunit', () => {
    beforeAll(() => {
      console.info("APIgetUIFontConfigJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("APIgetUIFontConfigJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/font/fontAdd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get APIgetUIFontConfigJsunit state pages:" + JSON.stringify(pages));
        if (!("fontAdd" == pages.name)) {
          console.info("get APIgetUIFontConfigJsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APIgetUIFontConfigJsunit page error:" + err);
      }
      console.info("APIgetUIFontConfigJsunit beforeEach end");
    });


    /**
     * @tc.number   fontJsunit_static_0100
     * @tc.name     fontJsunit_static_0100
     * @tc.desc     fontJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('fontJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the font
      console.info('fontJsunit_static_0100 START');
      if (AppStorage.get<number>('winLeft') == 0) {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('getSystemFontList'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(100);
        let strJson = inspector.getInspectorByKey('fontlist');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[GridColOffsetJsunit_0100] component  strJson:" + JSON.stringify(obj.getElement('$attrs').getString('content')));
        if (obj.getElement('$attrs').getString('content') == "") {
            expect(obj.getElement('$attrs').getString('content')).assertEqual("");
        } else {
            expect(obj.getElement('$attrs').getString('content')).assertContain("书宋-简");
        }
      }
      done();
    });

    /**
     * @tc.number   fontJsunit_static_0200
     * @tc.name     fontJsunit_static_0200
     * @tc.desc     fontJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('fontJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the font
      console.info('fontJsunit_static_0200 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('getgetFontByName'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('fontName');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridColOffsetJsunit_0200] component  strJson:" + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("HarmonyOS Sans Italic");
      done();
    });

     /**
     * @tc.number   fontJsunit_static_0300
     * @tc.name     fontJsunit_static_0300
     * @tc.desc     fontJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('fontJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the font
      console.info('fontJsunit_static_0300 START');
      try {
        let font: Object | null = uiContext.getFont().getSystemFontList()
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0300 error " + JSON.stringify(err));
      }
      done();
    });

     /**
     * @tc.number   fontJsunit_static_0400
     * @tc.name     fontJsunit_static_0400
     * @tc.desc     fontJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('fontJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the font
      console.info('fontJsunit_static_0400 START');
      try {
        let font: Object | null = uiContext.getFont().getFontByName('HarmonyOS Sans Italic')
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0400 error " + JSON.stringify(err));
      }
      done();
    });

     /**
     * @tc.number   fontJsunit_static_0500
     * @tc.name     fontJsunit_static_0500
     * @tc.desc     fontJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('fontJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the font
      console.info('fontJsunit_static_0500 START');
      try {
        let font: Object | null = uiContext.getUIInspector();
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0500 error " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number   fontJsunit_static_0600
     * @tc.name     fontJsunit_static_0600
     * @tc.desc     fontJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('fontJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the font
      console.info('fontJsunit_static_0600 START');
      try {
        let font: Object | null = uiContext.getComponentUtils();
        expect(font !=null).assertTrue();
      } catch (err) {
        console.error("fontJsunit_0600 error " + JSON.stringify(err));
      }
      done();
    });



  })
}
