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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function nodeRenderStateTest() {
  describe('nodeRenderStateTest', () => {
    beforeEach(async (done: Function) => {
      console.info('tapLocation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NodeRenderState/nodeRenderState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get nodeRenderStateTest pages:' + JSON.stringify(pages));
        if (!('nodeRenderState' == pages.name)) {
          console.info('get nodeRenderStateTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push nodeRenderStateTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push nodeRenderStateTest page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('nodeRenderStateTest after each called');
    });

    /* *
    * @tc.number: nodeRenderStateTest_0100
    * @tc.name  : nodeRenderStateTest_0100
    * @tc.desc  : To test add nodeRenderState return RENDER_IN
    * @tc.level : Level 1
    */
    it('nodeRenderStateTest_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('nodeRenderStateTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonAdd = await driver.findComponent(ON.id('addButton'));
      await buttonAdd.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('renderText');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[nodeRenderStateTest_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[nodeRenderStateTest_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('收到的通知: RENDER_IN');
      console.info('[nodeRenderStateTest_0100] END');
      done();
    });

    /* *
    * @tc.number: nodeRenderStateTest_0200
    * @tc.name  : nodeRenderStateTest_0200
    * @tc.desc  : To test add nodeRenderState return RENDER_OUT
    * @tc.level : Level 1
    */
    it('nodeRenderStateTest_0200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('nodeRenderStateTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonAdd1 = await driver.findComponent(ON.id('addButton'));
      await buttonAdd1.click();
      await CommonFunc.sleep(1000);
      let textRender = await driver.findComponent(ON.text('blue'));
      await textRender.click();
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('renderText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[nodeRenderStateTest_0200] component obj1 is: ' + JSON.stringify(obj1));
      console.info('[nodeRenderStateTest_0200] title: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('收到的通知: RENDER_OUT');
      console.info('[nodeRenderStateTest_0200] END');
      done();
    });

    /* *
    * @tc.number: nodeRenderStateTest_0300
    * @tc.name  : nodeRenderStateTest_0300
    * @tc.desc  : To test remove nodeRenderState
    * @tc.level : Level 1
    */
    it('nodeRenderStateTest_0300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('nodeRenderStateTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let textRender1 = await driver.findComponent(ON.text('green'));
      await textRender1.click();
      await CommonFunc.sleep(3000);
      let buttonRemove = await driver.findComponent(ON.id('removeButton'));
      await buttonRemove.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('renderText');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[nodeRenderStateTest_0300] component obj2 is: ' + JSON.stringify(obj2));
      console.info('[nodeRenderStateTest_0300] title: ' + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('收到的通知: ');
      console.info('[nodeRenderStateTest_0300] END');
      done();
    });
  })
}