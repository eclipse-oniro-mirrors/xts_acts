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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function attachNodeAdapterTest() {
  describe('attachNodeAdapterTest', () => {
    beforeEach(async (done: Function) => {
      console.info("attachNodeAdapterTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/attachNodeAdapter",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get attachNodeAdapterTest state pages: " + JSON.stringify(pages));
        if (!("attachNodeAdapter" == pages.name)) {
          console.info("get attachNodeAdapterTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push attachNodeAdapterTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push attachNodeAdapterTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    onCreateChildTest_0010
     * @tc.name      onCreateChildTest_0010
     * @tc.desc      frameNode: onCreateChild
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onCreateChildTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('onCreateChildTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('onCreateChild_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('onCreateChild_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[onCreateChildTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('onCreateChild succ');
      console.info('[onCreateChildTest_0010] END');
      done();
    });
    /**
     * @tc.number    onDisposeChildTest_0020
     * @tc.name      onDisposeChildTest_0020
     * @tc.desc      frameNode: onDisposeChild
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onDisposeChildTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('onDisposeChildTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('attachNodeAdapterReload'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('onDisposeChild_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('onDisposeChild_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[onDisposeChildTest_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('onDisposeChild succ');
      console.info('[onDisposeChildTest_0020] END');
      done();
    });
    /**
     * @tc.number    onUpdateChildTest_0030
     * @tc.name      onUpdateChildTest_0030
     * @tc.desc      frameNode: onUpdateChild
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('onUpdateChildTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('onUpdateChildTest_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('attachNodeAdapterReload'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('onUpdateChild_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('onUpdateChild_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[onUpdateChildTest_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('onUpdateChild succ');
      console.info('[onUpdateChildTest_0030] END');
      done();
    });
    /**
     * @tc.number    attachNodeAdapterTest_0040
     * @tc.name      attachNodeAdapterTest_0040
     * @tc.desc      frameNode: attachNodeAdapter
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('attachNodeAdapterTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('attachNodeAdapterTest_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('attachNodeAdapter_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('attachNodeAdapter_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[attachNodeAdapterTest_0040] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('50');
      console.info('[attachNodeAdapterTest_0040] END');
      done();
    });
    /**
     * @tc.number    detachNodeAdapterTest_0050
     * @tc.name      detachNodeAdapterTest_0050
     * @tc.desc      frameNode: detachNodeAdapter
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('detachNodeAdapterTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('detachNodeAdapterTest_0050 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('detachNodeAdapter_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('detachNodeAdapter_id');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[detachNodeAdapterTest_0050] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('0');
      console.info('[detachNodeAdapterTest_0050] END');
      done();
    });
  })
}