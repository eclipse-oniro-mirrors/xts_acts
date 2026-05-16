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
import {Driver, UiWindow, ResizeDirection, PointerMatrix } from '@ohos.UiTest'
import { startAbility, stopApplication } from './Utils.test';

const TestTag = 'testTag';
const ErrorCode = 401;

export default function uitestEnumTest() {
  describe('UitestUiWindow401ErrorCode', () => {
    /**
     * @tc.name   testApi9_UiWindow_moveTo_401
     * @tc.number UiTest_uitest401_01020
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_moveTo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_UiWindow_moveTo_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(null, 100)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, x = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(undefined, 100)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, x = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(100, null)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, y = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.moveTo(100, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_moveTo_401, y = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testApi9_UiWindow_moveTo_401 END`);
    })

    /**
     * @tc.name   testApi9_UiWindow_resize_401
     * @tc.number UiTest_uitest401_0103
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_resize_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_UiWindow_resize_401 start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(null, 100, ResizeDirection.UP)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, width = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(undefined, 100, ResizeDirection.DOWN)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, width = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(100, null, ResizeDirection.LEFT)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, height = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(100, undefined, ResizeDirection.RIGHT)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_resize_401, height = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testApi9_UiWindow_resize_401 END`);
    })

    /**
     * @tc.name   testApi9_PointerMatrix_create_401
     * @tc.number UiTest_uitest401_0104
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_PointerMatrix_create_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_PointerMatrix_create_401 start`);
      try {
        let points = PointerMatrix.create(null, 1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, finger = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(undefined, 1);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, finger = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, null);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, step = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_create_401, step = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_PointerMatrix_create_401 END`);
    })

    /**
     * @tc.name   testApi9_PointerMatrix_setPoint_401
     * @tc.number UiTest_uitest401_0105
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_PointerMatrix_setPoint_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_PointerMatrix_setPoint_401 start`);
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(null, 0, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, finger = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(undefined, 0, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, finger = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, null, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, step = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, undefined, {x: 100, y: 100})
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, step = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, null)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, point = null error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        let points = PointerMatrix.create(1, 1);
        points.setPoint(0, 0, undefined)
        expect().assertFail();
      } catch (error) {
        console.log(TestTag, `testApi9_PointerMatrix_setPoint_401, point = undefined error is, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi9_PointerMatrix_setPoint_401 END`);
    })

    /**
     * @tc.name   testApi9_UiWindow_False
     * @tc.number UiTest_uitest401_0106
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi9_UiWindow_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi9_UiWindow_False start`);
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000)
      try {
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts', active: false, focused: false})
        console.log(TestTag, `testApi9_UiWindow_False, window, ${JSON.stringify(window)}`);
        expect(window).assertNull();
      } catch (error) {
        console.log(TestTag, `testApi9_UiWindow_False, error is, ${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, testApi9_UiWindow_False END`);
    })

  })
}