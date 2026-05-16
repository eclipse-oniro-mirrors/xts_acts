'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
export default function setShapeClipTest() {
  describe('setShapeClipTest', () => {
    beforeAll(() => {
      console.info("setShapeClipTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () : Promise<void> => {
      console.info("setShapeClipTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/renderNode/setShapeClip",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get setShapeClipTest state pages: " + JSON.stringify(pages));
        if (!("setShapeClip" == pages.name)) {
          console.info("get setShapeClipTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push setShapeClipTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setShapeClipTest page error: " + err);
           expect().assertFail();
      }
      //done();
    }); 

    
    



    /**
     * @tc.number   setShapeClipTest_static_0010
     * @tc.name     setShapeClipTest_static_0010
     * @tc.desc     setShapeClipTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('setShapeClipTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('setShapeClipTest_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('SetShapeClip_id'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('SetShapeClip_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[setShapeClipTest_0010] component obj is: " + JSON.stringify(obj));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('label'))).assertEqual('"{\\"rect\\":{\\"top\\":0,\\"left\\":0,\\"right\\":150,\\"bottom\\":150},\\"roundRect\\":null,\\"circle\\":null,\\"oval\\":null,\\"path\\":null}"');
      console.info('[setShapeClipTest_0010] END');
      done();
    });  
  })
}