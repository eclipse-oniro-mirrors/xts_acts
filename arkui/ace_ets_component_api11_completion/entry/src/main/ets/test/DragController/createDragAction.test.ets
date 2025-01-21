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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function createDragAction() {
  describe('createDragAction', () => {
    beforeEach(async (done: Function) => {
      console.info("createDragAction beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/createDragAction',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createDragAction state pages: " + JSON.stringify(pages));
        if (!("createDragAction" == pages.name)) {
          console.info("get createDragAction state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createDragAction success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createDragAction page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_createDragAction_0100
     * @tc.name createDragAction_0100
     * @tc.desc createDragAction api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createDragAction_0100', 0, async (done: Function) => {
      console.info('createDragAction_0100 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('dragParent'));
      let text: Component = await driver.findComponent(ON.id('createDrag_id'));
      await button.dragTo(text);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('createDrag_id');
      console.info("[createDragAction_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[createDragAction_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('success');
      console.info('[createDragAction_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_createDragAction_0200
     * @tc.name createDragAction_0200
     * @tc.desc STARTED api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createDragAction_0200', 0, async (done: Function) => {
      console.info('createDragAction_0200 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('dragParent'));
      let text: Component = await driver.findComponent(ON.id('createDrag_id'));
      await button.dragTo(text);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('start_id');
      console.info("[createDragAction_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[createDragAction_0200] title: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('STARTED');
      console.info('[createDragAction_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_createDragAction_0300
     * @tc.name createDragAction_0300
     * @tc.desc ENDED  api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createDragAction_0300', 0, async (done: Function) => {
      console.info('createDragAction_0300 START');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('dragParent'));
      let text: Component = await driver.findComponent(ON.id('createDrag_id'));
      await button.dragTo(text);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('end_id');
      console.info("[createDragAction_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[createDragAction_0300] title: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('ENDED');
      console.info('[createDragAction_0300] END');
      done();
    });
  })
}

