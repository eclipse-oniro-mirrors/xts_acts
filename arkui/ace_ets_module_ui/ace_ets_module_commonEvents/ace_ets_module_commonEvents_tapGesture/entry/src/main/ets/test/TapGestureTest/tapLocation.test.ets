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

export default function tapLocationTest() {
  describe('tapLocationTest', () => {
    beforeEach(async (done: Function) => {
      console.info('tapLocation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/tapLocation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get tapLocationstate pages:' + JSON.stringify(pages));
        if (!('tapLocation' == pages.name)) {
          console.info('get tapLocation state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push tapLocation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push tapLocation page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('tapLocation after each called');
    });

    /**
     * @tc.name   tapLocation1_0100
     * @tc.number tapLocation1_0100
     * @tc.desc   To test whether tapLocation is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tapLocation1_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('tapLocation1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('x');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[tapLocation1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[tapLocation1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(JSON.stringify(obj.$attrs.content) == '').assertFalse();
      console.info('[tapLocation1_0100] END');
      done();
    });

    /**
     * @tc.name   tapLocation1_0200
     * @tc.number tapLocation1_0200
     * @tc.desc   To test whether tapLocation is effective.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tapLocation1_0200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('tapLocation1_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('y');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[tapLocation1_0200] component obj1 is: ' + JSON.stringify(obj1));
      console.info('[tapLocation1_0200] title: ' + JSON.stringify(obj1.$attrs.content));
      expect(JSON.stringify(obj1.$attrs.content) == '').assertFalse();
      console.info('[tapLocation1_0200] END');
      done();
    });
  })
}
