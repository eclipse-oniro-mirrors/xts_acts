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

export default function PanGesture2() {
  describe('PanGesture2', () => {
      beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("PanGesture2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGesture2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGesture2 state pages: " + JSON.stringify(pages));
        if (!("PanGesture2" == pages.name)) {
          console.info("get PanGesture2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PanGesture2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGesture2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   PanGesture2_0100
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
     * @tc.desc   To test that the Provide decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGesture2_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('PanGesture2_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Pan3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PanGesture2_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PanGesture2_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PanGesture offset:X:10Y:20');
      console.info('[PanGesture2_0100] END');
      done();
    });
    /**
     * @tc.name   PanGesture2_0200
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0360
     * @tc.desc   To test that the Provide decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGesture2_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PanGesture2_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let colum = CommonFunc.getComponentRectOnScreen('PanGesture2');
      let top = colum.top
      await driver.swipe(Math.round(colum.left+(colum.right - colum.left)/2), Math.round(colum.bottom), Math.round(colum.right), Math.round(top), 600)
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PanGesture2_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PanGesture2_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PanGesture2_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect((Math.abs(Number(obj.$attrs.content)) - 379) < 20).assertEqual(true);
      console.info('[PanGesture2_0200] END');
      done();
    });

  })
}