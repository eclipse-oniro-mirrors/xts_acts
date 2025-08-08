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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function setForegroundColor() {
  describe('setForegroundColor', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
done();
});
    beforeAll(async (done: Function) => {
      console.info("setForegroundColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/setForegroundColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setForegroundColor state pages: " + JSON.stringify(pages));
        if (!("setForegroundColor" == pages.name)) {
          console.info("get setForegroundColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setForegroundColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setForegroundColor page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_setForegroundColor_0100
     * @tc.name      setForegroundColor_0100
     * @tc.desc      setForegroundColor api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setForegroundColor_0100', 0, async (done: Function) => {
      console.info('setForegroundColor_0100 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TouchParent_id'));
      let text: Component = await driver.findComponent(ON.id('setForegroundColor_id'));
      await button.dragTo(text);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setForegroundColor_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setForegroundColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[setForegroundColor_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[setForegroundColor_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_setForegroundColor_0200
     * @tc.name      setForegroundColor_0200
     * @tc.desc     getDragPreview api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('setForegroundColor_0200', 0, async (done: Function) => {
      console.info('setForegroundColor_0200 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TouchParent_id'));
      let text: Component = await driver.findComponent(ON.id('setForegroundColor_id'));
      await button.dragTo(text);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('setForegroundColor_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setForegroundColor_0200] component obj is: " + JSON.stringify(obj));
      console.info("[setForegroundColor_0200] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[setForegroundColor_0200] END');
      done();
    });
  })
}

