/*
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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function APIshouldBuiltInRecognizerParallelWith() {
  describe('APIshouldBuiltInRecognizerParallelWith', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/APIshouldBuiltInRecognizerParallelWith',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIshouldBuiltInRecognizerParallelWith state pages: " + JSON.stringify(pages));
        if (!("APIshouldBuiltInRecognizerParallelWith" == pages.name)) {
          console.info("get APIshouldBuiltInRecognizerParallelWith state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push APIshouldBuiltInRecognizerParallelWith success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIshouldBuiltInRecognizerParallelWith page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIshouldBuiltInRecognizerParallelWith after each called");
    });

    /**
     * @tc.name   APIshouldBuiltInRecognizerParallelWith_0100
     * @tc.number APIshouldBuiltInRecognizerParallelWith_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIshouldBuiltInRecognizerParallelWith_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIshouldBuiltInRecognizerParallelWith_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text01');
      let obj: ESObject = JSON.parse(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_0100 obj', obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('API_getTag');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_0100] END');
      done();
    });
    /**
     * @tc.name   APIshouldBuiltInRecognizerParallelWith_0200
     * @tc.number APIshouldBuiltInRecognizerParallelWith_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIshouldBuiltInRecognizerParallelWith_0200', Level.LEVEL0, async (done: Function) => {
      console.info('APIshouldBuiltInRecognizerParallelWith_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text02');
      let obj: ESObject = JSON.parse(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_0200 obj', obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_0200] END');
      done();
    });
    /**
     * @tc.name   APIshouldBuiltInRecognizerParallelWith_0300
     * @tc.number APIshouldBuiltInRecognizerParallelWith_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIshouldBuiltInRecognizerParallelWith_0300', Level.LEVEL0, async (done: Function) => {
      console.info('APIshouldBuiltInRecognizerParallelWith_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text03');
      let obj: ESObject = JSON.parse(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_0300 obj', obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('API_getEventTargetInfo');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_0300] END');
      done();
    });
    /**
     * @tc.name   APIshouldBuiltInRecognizerParallelWith_0400
     * @tc.number APIshouldBuiltInRecognizerParallelWith_0400
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIshouldBuiltInRecognizerParallelWith_0400', Level.LEVEL0, async (done: Function) => {
      console.info('APIshouldBuiltInRecognizerParallelWith_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('APIshouldBuiltInRecognizerParallelWith_Text04');
      let obj: ESObject = JSON.parse(strJson);
      console.info('APIshouldBuiltInRecognizerParallelWith_0400 obj', obj, obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('API_getPanGestureOptions');
      await CommonFunc.sleep(1000);
      console.info('[APIshouldBuiltInRecognizerParallelWith_0400] END');
      done();
    });

    /**
     * @tc.name   APIshouldBuiltInRecognizerParallelWith_0500
     * @tc.number APIshouldBuiltInRecognizerParallelWith_0500
     * @tc.desc   api for test isBegin and isEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIshouldBuiltInRecognizerParallelWith_0500', Level.LEVEL0, async (done: Function) => {
      console.info('APIshouldBuiltInRecognizerParallelWith_0500 START');
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.id('inner'));
      await scrollBar.scrollToTop();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('isBegin')).assertEqual(true);
      expect(AppStorage.get('isEnd')).assertEqual(false);
      await scrollBar.scrollToBottom(20000);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('isBegin')).assertEqual(false);
      expect(AppStorage.get('isEnd')).assertEqual(true);
      await CommonFunc.sleep(200);
      console.info('[APIshouldBuiltInRecognizerParallelWith_0500] END');
      done();
    });
  })
}