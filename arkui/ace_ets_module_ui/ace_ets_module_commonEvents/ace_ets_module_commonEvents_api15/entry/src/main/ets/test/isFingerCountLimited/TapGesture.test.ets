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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function tapGestureTest() {
  describe('tapGestureTest', () => {
    beforeEach(async (done: Function) => {
      console.info('tapGesture beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gesture/isFingerCountLimited/TapGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get tapGesture state pages:' + JSON.stringify(pages));
        if (!('tapGesture' == pages.name)) {
          console.info('get tapGesture state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push tapGesture page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push tapGesture page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('tapGesture after each called');
    });

    /* *
    * @tc.number
    * @tc.name  : TapGesture1_0100
    * @tc.desc  : To test whether isFingerCountLimited is effective.
    * @tc.level : Level 2
    */
    it('TapGesture1_0200', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TapGesture1_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TapGesture');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TapGesture1_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[TapGesture1_0200] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('success');
      console.info('[TapGesture1_0200] END');
      done();
    });

    /* *
    * @tc.number
    * @tc.name  : TapGesture1_0200
    * @tc.desc  : To test whether isFingerCountLimited is effective.
    * @tc.level : Level 1
    */
    it('TapGesture1_0200', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TapGesture1_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture2'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TapGesture2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TapGesture1_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[TapGesture1_0200] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('success');
      console.info('[TapGesture1_0200] END');
      done();
    });

  })
}
