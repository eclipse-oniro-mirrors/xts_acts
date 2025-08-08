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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function stackFromEndList() {
  describe('stackFromEndList', () => {
    beforeEach(async (done: Function) => {
      console.info("stackFromEndList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/stackFromEndList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("stackFromEndList" == pages.name)) {
          console.info("get stackFromEndList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stackFromEndList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackFromEndList page error:" + err);
      }
      console.info("stackFromEndList beforeEach end");
      done();
    });

    /**
     * @tc.number    stackFromEndList_001
     * @tc.name      stackFromEndList_0100
     * @tc.desc      Set the layout of the List component from the top.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stackFromEndList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[stackFromEndList_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_stackFromEnd');
      console.info("[stackFromEndList_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[stackFromEndList_0100] stackFromEnd: " + JSON.stringify(JSON.parse(strJson).$attrs.stackFromEnd));
      expect(JSON.parse(strJson).$type).assertEqual('List');

      let list1 = CommonFunc.getComponentRectOnScreen('list_stackFromEnd');
      console.info('[stackFromEndList_0100] list1.top: ' + list1.top);
      let listItem1 = CommonFunc.getComponentRectOnScreen('stackFromEnd_1');
      console.info('[stackFromEndList_0100] listItem1.top: ' + listItem1.top);
      await CommonFunc.sleep(1000);
      console.info(`[stackFromEndList_0100] listItem1.top - vp2px(2) - list1.top=
      ${(listItem1.top - vp2px(2) - list1.top)}`);
      expect(Math.abs(Math.floor(listItem1.top - vp2px(2) - list1.top)) <=1 ).assertTrue();
      console.info('[stackFromEndList_0100] END');
      done();
    });

    /**
     * @tc.number    stackFromEndList_002
     * @tc.name      stackFromEndList_0200
     * @tc.desc      Set the layout of the List component to start from the end.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stackFromEndList_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[stackFromEndList_0200] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('list_stackFromEnd_true'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('list_stackFromEnd');
      console.info("[stackFromEndList_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[stackFromEndList_0200] stackFromEnd: " + JSON.stringify(JSON.parse(strJson).$attrs.stackFromEnd));
      expect(JSON.parse(strJson).$type).assertEqual('List');

      let list1 = CommonFunc.getComponentRectOnScreen('list_stackFromEnd');
      console.info('[stackFromEndList_0200] list1.bottom: ' + list1.bottom);
      let listItem5 = CommonFunc.getComponentRectOnScreen('stackFromEnd_5');
      console.info('[stackFromEndList_0200] listItem5.bottom: ' + listItem5.bottom);
      await CommonFunc.sleep(1000);
      console.info(`[stackFromEndList_0200] list1.bottom - vp2px(2) - listItem5.bottom=
      ${(list1.bottom - vp2px(2) - listItem5.bottom)}`);
      expect(Math.abs(Math.floor(list1.bottom - vp2px(2) - listItem5.bottom)) <=1 ).assertTrue();
      console.info('[stackFromEndList_0200] END');
      done();
    });
  })
}