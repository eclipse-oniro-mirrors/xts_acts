/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {  Driver, ON } from '@ohos.UiTest'
import { startAbility, stopApplication } from './Utils.test';

const TestTag = 'testTag';
const ErrorCode = 401;

export default function uitestEnumTest() {
  describe('UitestComponent401ErrorCode', () => {

    /**
     * @tc.name   testApi9_Component_inputText_401
     * @tc.number UiTest_uitest401_041
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_inputText_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_inputText_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.inputText(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_inputText_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.inputText(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_inputText_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_inputText_401 END`);
    })

    /**
     * @tc.name   testApi20_Component_inputTextMode_401
     * @tc.number UiTest_uitest401_042
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi20_Component_inputTextMode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi20_Component_inputTextMode_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.inputText(null, {paste: false});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Component_inputTextMode_401 text = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.inputText(undefined, {addition: false});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi20_Component_inputTextMode_401 text = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.inputText('hello', null);
      } catch (error) {
        console.log(`${TestTag}, testApi20_Component_inputTextMode_401 mode = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.inputText('hello', undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi20_Component_inputTextMode_401 mode = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi20_Component_inputTextMode_401 END`);
    })

    /**
     * @tc.name   testApi9_Component_scrollToTop_401
     * @tc.number UiTest_uitest401_043
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_scrollToTop_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_scrollToTop_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToTop(null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToTop(undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToTop(-1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToTop(100);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = -1 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToTop(41000);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToTop_401 text = -1 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_scrollToTop_401 END`);
    })

    /**
     * @tc.name   testApi9_Component_scrollToBottom_401
     * @tc.number UiTest_uitest401_044
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_scrollToBottom_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToBottom(null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 spe = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToBottom(undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 spe = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToBottom(-1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 spe = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToBottom(100);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 spe = 100 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollToBottom(41000);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 spe = 41000 error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_scrollToBottom_401 END`);
    })

    /**
     * @tc.name   testApi9_Component_dragTo_401
     * @tc.number UiTest_uitest401_045
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_dragTo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_dragTo_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.dragTo(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_dragTo_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.dragTo(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_dragTo_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_dragTo_401 END`);
    })

    /**
     * @tc.name   testApi9_Component_pinchOut_401
     * @tc.number UiTest_uitest401_046
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_pinchOut_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_pinchOut_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.pinchOut(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchOut_401 sc = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.pinchOut(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchOut_401 sc = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.pinchOut(-1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchOut_401 sc = -1 error, ${JSON.stringify(error)}`);
        console.log(`${TestTag}, testApi9_Component_pinchOut_401 sc = undefined error.message, ${JSON.stringify(error.message)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_pinchOut_401 END`);
    })

    /**
     * @tc.name   testApi9_Component_pinchIn_401
     * @tc.number UiTest_uitest401_047
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_pinchIn_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_pinchIn_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.pinchIn(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchIn_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.pinchIn(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchIn_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.pinchIn(-1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_pinchIn_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_pinchIn_401 END`);
    })

    /**
     * @tc.name   testApi9_Component_scrollSearch_401
     * @tc.number UiTest_uitest401_048
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_Component_scrollSearch_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_Component_scrollSearch_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollSearch(null, false, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 on = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.text('MainPage'))
        await input1.scrollSearch(undefined, false, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 on = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let input1 = await driver.findComponent(ON.type('Scroll'))
        await input1.scrollSearch(ON.text('next page'), false, null);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 offset = null error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.type('Scroll'))
        await input1.scrollSearch(ON.text('next page'), false, undefined);
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 offset = undefined error, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let input1 = await driver.findComponent(ON.type('Scroll'))
        await input1.scrollSearch(ON.text('next page'), false, -1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi9_Component_scrollSearch_401 offset = -1 error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testApi9_Component_scrollSearch_401 END`);
    })

  })
}