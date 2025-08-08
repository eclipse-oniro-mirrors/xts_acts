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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function EventTarget_id() {
  describe('EventTarget_id', () => {
    beforeEach(async (done: Function) => {
      console.info('EventTarget_id beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventTarget_id/EventTarget_id',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EventTarget_id state pages: ' + JSON.stringify(pages));
        if (!('EventTarget_id' == pages.name)) {
          console.info('get EventTarget_id state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push EventTarget_id success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EventTarget_id page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number EventTarget_id_0100
     * @tc.name   EventTarget_id_0100
     * @tc.desc   test the EventTarget_id
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EventTarget_id_0100', 0, async (done: Function) => {
      console.info('[EventTarget_id_0100] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('click_id'));
      await button1.click();
      await CommonFunc.sleep(1500);

      // test the child component response
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EventTarget_id_0100] strJson is: ' + strJson);
      console.info('[EventTarget_id_0100] EventTarget_id obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('id:click_id');

      console.info('[EventTarget_id_0100] END')
      done();
    });

    /**
     * @tc.number EventTarget_id_0200
     * @tc.name   EventTarget_id_0200
     * @tc.desc   test the EventTarget_id
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('EventTarget_id_0200', 0, async (done: Function) => {
      console.info('[EventTarget_id_0200] START');
      let driver: Driver = Driver.create();
      let button2 = await driver.findComponent(ON.id('click_key'));
      await button2.click();
      await CommonFunc.sleep(1500);

      // test the child component response
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[EventTarget_id_0200] strJson is: ' + strJson);
      console.info('[EventTarget_id_0200] EventTarget_id obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('id:click_key');

      console.info('[EventTarget_id_0200] END');
      done();
    });
  })
}