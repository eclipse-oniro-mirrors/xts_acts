/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default function GestureClick() {
  describe('GestureClick', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("GestureClick beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onGestureJudgeBegin/GestureClick',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureClick state pages: " + JSON.stringify(pages));
        if (!("GestureClick" == pages.name)) {
          console.info("get GestureClick state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureClick success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureClick page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_GestureClick_0100
     * @tc.name      GestureClick_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('GestureClick_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GestureClick_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GestureClick'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('GestureClick');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GestureClick_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GestureClick_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('Gesture is CLICK');
      console.info('[GestureClick_0100] END');
      done();
    });
    

  })
}

