/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function typeNodechildrenMainSizeTest() {
  describe('typeNodechildrenMainSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("childrenMainSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/typeNode/ChildrenMainSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get childrenMainSizeTest state pages: " + JSON.stringify(pages));
        if (!("childrenMainSize" == pages.name)) {
          console.info("get childrenMainSizeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push childrenMainSizeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push childrenMainSizeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    childrenMainSizeTest_0100
     * @tc.name      childrenMainSizeTest_0100
     * @tc.desc      TypedFrameNode: childrenMainSize
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('childrenMainSizeTest_0100', 0, async (done: Function) => {
      console.info('childrenMainSizeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('ChildernMainSize_1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('ChildernMainSize_'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('ChildernMainSize_');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[childrenMainSizeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('100');
      console.info('[childrenMainSizeTest_0100] END');
      done();
    });

    /**
     * @tc.number    childrenMainSizeTest_0200
     * @tc.name      childrenMainSizeTest_0200
     * @tc.desc      TypedFrameNode: childrenMainSize
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('childrenMainSizeTest_0200', 0, async (done: Function) => {
      console.info('childrenMainSizeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('ChildernMainSize_2'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('ChildernMainSize_'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('ChildernMainSize_');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[childrenMainSizeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('100');
      console.info('[childrenMainSizeTest_0100] END');
      done();
    });
  })
}


