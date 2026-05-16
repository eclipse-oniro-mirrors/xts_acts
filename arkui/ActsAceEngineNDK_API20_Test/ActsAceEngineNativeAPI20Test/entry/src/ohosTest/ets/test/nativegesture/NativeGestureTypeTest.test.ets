/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativegesturendk from 'libnativegesturendk.so'

export default function NativeGestureTypeTest() {
  describe('NativeGestureTypeTest', () => {

    /**
     * @tc.name   testGetGestureType1
     * @tc.number SUB_ARKUI_ACE_ENGINE_LONG_PRESS_GESTURE_0100
     * @tc.desc   Test whether the key LONG_PRESS_GESTURE are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGestureType1',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureType1 start====");
          let result: number = nativegesturendk.GetGestureType1();
          console.info(`====>testGetGestureType1 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureType1 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testGetGestureType2
     * @tc.number SUB_ARKUI_ACE_ENGINE_PINCH_GESTURE_0100
     * @tc.desc   Test whether the key PINCH_GESTURE are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGestureType2',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureType2 start====");
          let result: number = nativegesturendk.GetGestureType2();
          console.info(`====>testGetGestureType2 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureType2 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testGetGestureType3
     * @tc.number SUB_ARKUI_ACE_ENGINE_ROTATION_GESTURE_0100
     * @tc.desc   Test whether the key ROTATION_GESTURE are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGestureType3',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureType3 start====");
          let result: number = nativegesturendk.GetGestureType3();
          console.info(`====>testGetGestureType3 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureType2 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testGetGestureType4
     * @tc.number SUB_ARKUI_ACE_ENGINE_SWIPE_GESTURE_0100
     * @tc.desc   Test whether the key SWIPE_GESTURE are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGestureType4',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureType4 start====");
          let result: number = nativegesturendk.GetGestureType4();
          console.info(`====>testGetGestureType4 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureType4 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testGetGestureType5
     * @tc.number SUB_ARKUI_ACE_ENGINE_GROUP_GESTURE_0100
     * @tc.desc   Test whether the key GROUP_GESTURE are working properly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGestureType5',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testGetGestureType5 start====");
          let result: number = nativegesturendk.GetGestureType5();
          console.info(`====>testGetGestureType5 result====${result}`);
          expect(1).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testGetGestureType5 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })
  })
}