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
import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function APICanvasSizeTest() {
  describe('APICanvasSizeTest', () => {
    beforeAll(() => {
      console.info("APICanvasSizeTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.drawAPI12.static", "EntryAbility")


    });

    beforeEach(async (): Promise<void> => {
      console.info("APICanvasSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Canvas/APICanvasSize",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get APICanvasSizeTest state pages:" + JSON.stringify(pages));
        if (!("APICanvasSize" == pages.name)) {
          console.info("get APICanvasSizeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APICanvasSizeTest page error:" + err);
      }
      console.info("APICanvasSizeTest beforeEach end");
    });
    
    /**
     * @tc.number   APICanvasSizeTest_static_0100
     * @tc.name     APICanvasSizeTest_static_0100
     * @tc.desc     APICanvasSizeTest_static_0100
     * @tc.level    Level.LEVEL2 
     */
it('APICanvasSizeTest_static_0100', Level.LEVEL2 , async (done: () => void): Promise<void> => {
      console.info('APICanvasSizeTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      let rectParent = Utils.getComponentRect('APICanvasSizeFlex');
      let widthParent = rectParent.right - rectParent.left
      let heightParent = rectParent.bottom - rectParent.top
      console.info("[APICanvasSizeTest_static_0100] widthParent is: " + widthParent);
      console.info("[APICanvasSizeTest_static_0100] heightParent is: " + heightParent);

      let button1 = await driver.findComponent(ON.id('APICanvasSizeButton1'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('APICanvasSizeText1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APICanvasSizeTest_static_0100] text1 content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      console.info("[APICanvasSizeTest_static_0100] canvas width is: " + JSON.stringify(AppStorage.get<UIContext>('uiContext')!.vp2px(Number(obj.getElement('$attrs').getString('content')))));
      expect(Math.abs(Math.floor(AppStorage.get<UIContext>('uiContext')!.vp2px(Number(obj.getElement('$attrs').getString('content'))) - widthParent * 0.8)) <= 1).assertTrue();
      console.info('[APICanvasSizeTest_static_0100] END');
      done();
    });
    
    /**
     * @tc.number   APICanvasSizeTest_static_0200
     * @tc.name     APICanvasSizeTest_static_0200
     * @tc.desc     APICanvasSizeTest_static_0200
     * @tc.level    Level.LEVEL2 
     */
it('APICanvasSizeTest_static_0200', Level.LEVEL2 , async (done: () => void): Promise<void> => {
      console.info('APICanvasSizeTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      let rectParent = Utils.getComponentRect('APICanvasSizeFlex');
      let widthParent = rectParent.right - rectParent.left
      let heightParent = rectParent.bottom - rectParent.top
      console.info("[APICanvasSizeTest_static_0200] widthParent is: " + widthParent);
      console.info("[APICanvasSizeTest_static_0200] heightParent is: " + heightParent);

      let button1 = await driver.findComponent(ON.id('APICanvasSizeButton2'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('APICanvasSizeText2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APICanvasSizeTest_static_0200] text2 content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      console.info("[APICanvasSizeTest_static_0200] canvas height is: " + JSON.stringify(AppStorage.get<UIContext>('uiContext')!.vp2px(Number(obj.getElement('$attrs').getString('content')))));
      expect(Math.abs(Math.floor(AppStorage.get<UIContext>('uiContext')!.vp2px(Number(obj.getElement('$attrs').getString('content'))) - heightParent * 0.5)) <= 1).assertTrue();
      console.info('[APICanvasSizeTest_static_0200] END');
      done();
    });
  })
}

