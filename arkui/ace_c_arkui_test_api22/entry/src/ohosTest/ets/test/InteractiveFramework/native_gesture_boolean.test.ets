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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function native_gesture_booleanTest() {

  describe('native_gesture_booleanTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number   False_OH_ArkUI_GestureInterruptInfo_GetSystemFlag
     * @tc.name     native_gesture_booleanTest001
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.False_OH_ArkUI_GestureInterruptInfo_GetSystemFlag()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   True_OH_ArkUI_GestureInterruptInfo_GetSystemFlag
     * @tc.name     native_gesture_booleanTest002
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.True_OH_ArkUI_GestureInterruptInfo_GetSystemFlag()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   True_OH_ArkUI_GetGestureRecognizerEnabled
     * @tc.name     native_gesture_booleanTest003
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.True_OH_ArkUI_GetGestureRecognizerEnabled()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   False_OH_ArkUI_GetGestureRecognizerEnabled
     * @tc.name     native_gesture_booleanTest004
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.False_OH_ArkUI_GetGestureRecognizerEnabled()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   True_OH_ArkUI_IsBuiltInGesture
     * @tc.name     native_gesture_booleanTest005
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.True_OH_ArkUI_IsBuiltInGesture()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   False_OH_ArkUI_IsBuiltInGesture
     * @tc.name     native_gesture_booleanTest006
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.False_OH_ArkUI_IsBuiltInGesture()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   True_OH_ArkUI_IsGestureRecognizerValid
     * @tc.name     native_gesture_booleanTest007
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.True_OH_ArkUI_IsGestureRecognizerValid()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   False_OH_ArkUI_IsGestureRecognizerValid
     * @tc.name     native_gesture_booleanTest008
     * @tc.desc     testing interface return boolean
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('native_gesture_booleanTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.False_OH_ArkUI_IsGestureRecognizerValid()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

  })
}