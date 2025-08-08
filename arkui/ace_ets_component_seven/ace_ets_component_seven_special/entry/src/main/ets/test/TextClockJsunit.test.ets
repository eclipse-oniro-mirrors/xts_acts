/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router'
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function TextClockJsunit() {
  describe('TextClockJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextClock beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textClockPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextClock state pages: " + JSON.stringify(pages));
        if (!("textClockPage" == pages.name)) {
          console.info("get TextClock state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextClock page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClock page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number TextClock_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextClock_0100', 0, async (done: Function) => {
      console.info('[TextClock_0100] START');
      let strJson = getInspectorByKey('TextClockKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0100] obj :" + obj.$attrs);

      expect(obj.$attrs.format).assertEqual('hh:mm:ss');

      console.info('[TextClock_0100] END');
      done();
    });

    /**
     * @tc.number TextClock_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextClock_0200', 0, async (done: Function) => {
      console.info('[TextClock_0200] START');
      let strJson = getInspectorByKey('TextClockKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0200] obj :" + obj.$attrs);

      expect(obj.$attrs.fontColor).assertEqual('#FF123456');
      console.info('[TextClock_0200] END');
      done();
    });

    /**
     * @tc.number TextClock_0300
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextClock_0300', 0, async (done: Function) => {
      console.info('[TextClock_0300] START');
      let strJson = getInspectorByKey('TextClockKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0300] obj :" + obj.$attrs);

      expect(obj.$attrs.fontSize).assertEqual('15.00fp');
      console.info('[TextClock_0400] END');
      done();
    });

    /**
     * @tc.number TextClock_0400
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextClock_0400', 0, async (done: Function) => {
      console.info('[TextClock_0400] START');
      let strJson = getInspectorByKey('TextClockKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0400] obj :" + obj.$attrs);

      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');

      console.info('[TextClock_0400] END');
      done();
    });

    /**
     * @tc.number TextClock_0500
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextClock_0500', 0, async (done: Function) => {
      console.info('[TextClock_0500] START');
      let strJson = getInspectorByKey('TextClockKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0500] obj :" + obj.$attrs);

      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      console.info('[TextClock_0500] END');
      done();
    });

    /**
     * @tc.number TextClock_0600
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('TextClock_0600', 0, async (done: Function) => {
      console.info('[TextClock_0600] START');
      let strJson = getInspectorByKey('TextClockKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0600] obj :" + obj.$attrs);

      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      console.info('[TextClock_0600] END');
      done();
    });

  })
}
