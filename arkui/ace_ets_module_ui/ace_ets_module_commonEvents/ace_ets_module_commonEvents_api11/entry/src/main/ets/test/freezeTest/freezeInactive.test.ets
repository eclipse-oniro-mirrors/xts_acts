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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function freezeInactive() {
  describe('freezeInactive', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("freezeInactive beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/freeze/freezeInactive',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get freezeInactive state pages: " + JSON.stringify(pages));
        if (!("freezeInactive" == pages.name)) {
          console.info("get freezeInactive state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push freezeInactive success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push freezeInactive page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   freezeInactive_0100
     * @tc.number SUB_ACE_COMPONENTOPTIONS_FREEZEWHENINACTIVE_0010
     * @tc.desc   It freezes When the component is in the inactive state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('freezeInactive_0100', Level.LEVEL0, async (done: Function) => {
      console.info('freezeInactive_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('freeze_Inactive');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[freezeInactive_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('first Page 30');
      console.info('[freezeInactive_0100] END');
      done();
    });

  })
}