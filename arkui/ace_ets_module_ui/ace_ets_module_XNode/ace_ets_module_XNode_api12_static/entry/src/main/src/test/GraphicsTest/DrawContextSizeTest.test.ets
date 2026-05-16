'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, On, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';

export default function DrawContextSizeTest() {
  describe('DrawContextSizeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("DrawContextSizeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info('DrawContextSizeTest startAbility completed');
    });

    beforeEach(async (): Promise<void> => {
      console.info("DrawContextSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Graphics/DrawContextSize",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get DrawContextSizeTest state pages: " + JSON.stringify(pages));
        if (!("DrawContextSize" == pages.name)) {
          console.info("get DrawContextSizeTest state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push DrawContextSizeTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   DrawContext_size_0100
     * @tc.name     DrawContext_size_0100
     * @tc.desc     Test DrawContext.size property - get canvas size in vp
     * @tc.level    Level.LEVEL0
     */
    it('DrawContext_size_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DrawContext_size_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component | null = await driver.findComponent(ON.id('buttonGetProps'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textSizeWidth');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawContext_size_0100] size width: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      let sizeWidthStr = obj.getElement('$attrs').getString('content');
      expect(sizeWidthStr).assertContain('100');
      console.info('[DrawContext_size_0100] END');
      done();
    });

    /**
     * @tc.number   DrawContext_size_0200
     * @tc.name     DrawContext_size_0200
     * @tc.desc     Test DrawContext.size property - get canvas size height
     * @tc.level    Level.LEVEL0
     */
    it('DrawContext_size_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DrawContext_size_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component | null = await driver.findComponent(ON.id('buttonGetProps'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textSizeHeight');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawContext_size_0200] size height: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      let sizeHeightStr = obj.getElement('$attrs').getString('content');
      expect(sizeHeightStr).assertContain('100');
      console.info('[DrawContext_size_0200] END');
      done();
    });

    /**
     * @tc.number   DrawContext_sizeInPixel_0100
     * @tc.name     DrawContext_sizeInPixel_0100
     * @tc.desc     Test DrawContext.sizeInPixel property - get canvas size in px
     * @tc.level    Level.LEVEL0
     */
    it('DrawContext_sizeInPixel_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DrawContext_sizeInPixel_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component | null = await driver.findComponent(ON.id('buttonGetProps'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textSizeInPixelWidth');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawContext_sizeInPixel_0100] sizeInPixel width: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      console.info("[DrawContext_sizeInPixel_0100] expected width: " + AppStorage.get<UIContext>("uiContext")!.vp2px(100));
      let sizeInPixelWidthStr = obj.getElement('$attrs').getString('content');
      expect(sizeInPixelWidthStr).assertContain(AppStorage.get<UIContext>("uiContext")!.vp2px(100).toString());
      console.info('[DrawContext_sizeInPixel_0100] END');
      done();
    });

    /**
     * @tc.number   DrawContext_sizeInPixel_0200
     * @tc.name     DrawContext_sizeInPixel_0200
     * @tc.desc     Test DrawContext.sizeInPixel property - get canvas size height in px
     * @tc.level    Level.LEVEL0
     */
    it('DrawContext_sizeInPixel_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DrawContext_sizeInPixel_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component | null = await driver.findComponent(ON.id('buttonGetProps'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textSizeInPixelHeight');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawContext_sizeInPixel_0200] sizeInPixel height: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      console.info("[DrawContext_sizeInPixel_0200] expected height: " + AppStorage.get<UIContext>("uiContext")!.vp2px(100));
      let sizeInPixelHeightStr = obj.getElement('$attrs').getString('content');
      expect(sizeInPixelHeightStr).assertContain(AppStorage.get<UIContext>("uiContext")!.vp2px(100).toString());
      console.info('[DrawContext_sizeInPixel_0200] END');
      done();
    });

    /**
     * @tc.number   DrawContext_canvas_0100
     * @tc.name     DrawContext_canvas_0100
     * @tc.desc     Test DrawContext.canvas property - get drawing canvas
     * @tc.level    Level.LEVEL0
     */
    it('DrawContext_canvas_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DrawContext_canvas_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component | null = await driver.findComponent(ON.id('buttonGetProps'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('textCanvasValid');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DrawContext_canvas_0100] canvas valid: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      let canvasValidStr = obj.getElement('$attrs').getString('content');
      expect(canvasValidStr).assertEqual('canvas valid: true');
      console.info('[DrawContext_canvas_0100] END');
      done();
    });
  });
}