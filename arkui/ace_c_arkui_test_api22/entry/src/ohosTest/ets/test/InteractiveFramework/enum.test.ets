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

export default function enumTest() {

  describe('enumTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number   Enum_ARKUI_GESTURE_RECOGNIZER_STATE_READY
     * @tc.name     enumTest001
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_GESTURE_RECOGNIZER_STATE_READY()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_GESTURE_RECOGNIZER_STATE_DETECTING
     * @tc.name     enumTest002
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_GESTURE_RECOGNIZER_STATE_DETECTING()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_GESTURE_RECOGNIZER_STATE_PENDING
     * @tc.name     enumTest003
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_GESTURE_RECOGNIZER_STATE_PENDING()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_GESTURE_RECOGNIZER_STATE_BLOCKED
     * @tc.name     enumTest004
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_GESTURE_RECOGNIZER_STATE_BLOCKED()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_GESTURE_RECOGNIZER_STATE_FAILED
     * @tc.name     enumTest005
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_GESTURE_RECOGNIZER_STATE_FAILED()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_ERROR_CODE_COMPONENT_SNAPSHOT_TIMEOUT
     * @tc.name     enumTest006
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_ERROR_CODE_COMPONENT_SNAPSHOT_TIMEOUT()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_ALL
     * @tc.name     enumTest007
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_ALL()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_FINGER
     * @tc.name     enumTest008
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_FINGER()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_PEN
     * @tc.name     enumTest009
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_PEN()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_MOUSE
     * @tc.name     enumTest010
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_ARKUI_RESPONSE_REGIN_SUPPORTED_TOOL_MOUSE()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_UI_INPUT_EVENT_SOURCE_TYPE_UNKNOWN
     * @tc.name     enumTest011
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_UI_INPUT_EVENT_SOURCE_TYPE_UNKNOWN()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_UI_INPUT_EVENT_SOURCE_TYPE_MOUSE
     * @tc.name     enumTest012
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_UI_INPUT_EVENT_SOURCE_TYPE_MOUSE()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_UI_INPUT_EVENT_SOURCE_TYPE_KEY
     * @tc.name     enumTest013
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_UI_INPUT_EVENT_SOURCE_TYPE_KEY()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_UI_INPUT_EVENT_SOURCE_TYPE_JOYSTICK
     * @tc.name     enumTest014
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_UI_INPUT_EVENT_SOURCE_TYPE_JOYSTICK()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_GESTURE_EVENT_ACTION_ACCEPT
     * @tc.name     enumTest015
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_GESTURE_EVENT_ACTION_ACCEPT()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_OH_ArkUI_NodeEvent_GetEventType
     * @tc.name     enumTest016
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_OH_ArkUI_NodeEvent_GetEventType()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_OH_ArkUI_KeyEvent_GetType
     * @tc.name     enumTest017
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_OH_ArkUI_KeyEvent_GetType()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_OH_ArkUI_KeyEvent_GetKeyIntensionCode
     * @tc.name     enumTest018
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_OH_ArkUI_KeyEvent_GetKeyIntensionCode()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.number   Enum_OH_ArkUI_DragEvent_StartDataLoading
     * @tc.name     enumTest019
     * @tc.desc     testing enum
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('enumTest019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Enum_OH_ArkUI_DragEvent_StartDataLoading()).assertEqual(0)
      await Utils.sleep(200)
      done()
    })

  })
}