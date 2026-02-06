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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function SwipeGesture2() {
  describe('SwipeGesture2', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("SwipeGesture2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwipeGesture/SwipeGesture2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwipeGesture2 state pages: " + JSON.stringify(pages));
        if (!("SwipeGesture2" == pages.name)) {
          console.info("get SwipeGesture2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SwipeGesture2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGesture2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : SwipeGesture2_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('SwipeGesture2_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('SwipeGesture2_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Swipe3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwipeGesture2_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SwipeGesture2_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PanGesture offset:X:20Y:10');
      console.info('[SwipeGesture2_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0360
    * @tc.name  : SwipeGesture2_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('SwipeGesture2_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeGesture2_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeGesture2');
      let top = colum.top
      let right = colum.right
      let left = colum.left
      await driver.swipe(Math.round(colum.right), Math.round(top),
        Math.round(colum.right), Math.round(colum.bottom))
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Swipe4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwipeGesture2_0200] component obj is: " + JSON.stringify(obj));
      console.info("[SwipeGesture2_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect((Math.abs(Number(obj.$attrs.content)) - 92) < 10).assertEqual(true);
      console.info('[SwipeGesture2_0200] END');
      done();
    });

  })
}