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

export default function OnClick1() {
  describe('OnClick1', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("OnClick1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OnClick/OnClick1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnClick1 state pages: " + JSON.stringify(pages));
        if (!("OnClick1" == pages.name)) {
          console.info("get OnClick1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OnClick1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnClick1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   OnClick1_0100
     * @tc.number SUB_ACE_OnClick1_0100
     * @tc.desc   To test that the Provide decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnClick1_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('OnClick1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Click1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[OnClick1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[OnClick1_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('RotationGesture angle:90');
      console.info('[OnClick1_0100] END');
      done();
    });
    /**
     * @tc.name   OnClick1_0200
     * @tc.number SUB_ACE_OnClick1_0200
     * @tc.desc   To test that the Provide decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnClick1_0200', Level.LEVEL0, async (done: Function) => {
      console.info('OnClick1_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('OnClick1'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Click2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[OnClick1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[OnClick1_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect((Number(obj.$attrs.content) - 100) < 10).assertEqual(true);
      console.info('[OnClick1_0200] END');
      done();
    });

  })
}

