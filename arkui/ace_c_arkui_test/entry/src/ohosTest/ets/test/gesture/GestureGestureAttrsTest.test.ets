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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function gestureGestureAttrsTest() {

  describe('GestureGestureAttrsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testAddChildGesture001
     * @tc.number SUB_ARKUI_CAPI_ADD_CHILD_GESTURE_0100
     * @tc.desc   Test the add child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddChildGesture001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddChildGesture001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddChildGesture002
     * @tc.number SUB_ARKUI_CAPI_ADD_CHILD_GESTURE_0200
     * @tc.desc   Test the add child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddChildGesture002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddChildGesture002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddChildGesture003
     * @tc.number SUB_ARKUI_CAPI_ADD_CHILD_GESTURE_0300
     * @tc.desc   Test the add child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddChildGesture003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddChildGesture003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddChildGesture004
     * @tc.number SUB_ARKUI_CAPI_ADD_CHILD_GESTURE_0400
     * @tc.desc   Test the add child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddChildGesture004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddChildGesture004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddChildGesture005
     * @tc.number SUB_ARKUI_CAPI_ADD_CHILD_GESTURE_0500
     * @tc.desc   Test the add child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddChildGesture005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddChildGesture005()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddChildGesture006
     * @tc.number SUB_ARKUI_CAPI_ADD_CHILD_GESTURE_0600
     * @tc.desc   Test the add child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddChildGesture006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddChildGesture006()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveChildGesture001
     * @tc.number SUB_ARKUI_CAPI_REMOVE_CHILD_GESTURE_0100
     * @tc.desc   Test removing child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveChildGesture001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveChildGesture001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveChildGesture002
     * @tc.number SUB_ARKUI_CAPI_REMOVE_CHILD_GESTURE_0200
     * @tc.desc   Test removing child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveChildGesture002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveChildGesture002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveChildGesture003
     * @tc.number SUB_ARKUI_CAPI_REMOVE_CHILD_GESTURE_0300
     * @tc.desc   Test removing child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveChildGesture003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveChildGesture003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveChildGesture004
     * @tc.number SUB_ARKUI_CAPI_REMOVE_CHILD_GESTURE_0400
     * @tc.desc   Test removing child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveChildGesture004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveChildGesture004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveChildGesture005
     * @tc.number SUB_ARKUI_CAPI_REMOVE_CHILD_GESTURE_0500
     * @tc.desc   Test removing child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveChildGesture005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveChildGesture005()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveChildGesture006
     * @tc.number SUB_ARKUI_CAPI_REMOVE_CHILD_GESTURE_0600
     * @tc.desc   Test removing child gesture functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveChildGesture006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveChildGesture006()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetGestureEventTarget001
     * @tc.number SUB_ARKUI_CAPI_SET_GESTURE_EVENT_TARGET_0100
     * @tc.desc   Test setting gesture event target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGestureEventTarget001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSetGestureEventTarget001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetGestureEventTarget002
     * @tc.number SUB_ARKUI_CAPI_SET_GESTURE_EVENT_TARGET_0200
     * @tc.desc   Test setting gesture event target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGestureEventTarget002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSetGestureEventTarget002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetGestureEventTarget003
     * @tc.number SUB_ARKUI_CAPI_SET_GESTURE_EVENT_TARGET_0300
     * @tc.desc   Test setting gesture event target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGestureEventTarget003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSetGestureEventTarget003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetGestureEventTarget004
     * @tc.number SUB_ARKUI_CAPI_SET_GESTURE_EVENT_TARGET_0400
     * @tc.desc   Test setting gesture event target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGestureEventTarget004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSetGestureEventTarget004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddGestureToNode001
     * @tc.number SUB_ARKUI_CAPI_ADD_GESTURE_TO_NODE_0100
     * @tc.desc   Test adding gesture to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddGestureToNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddGestureToNode001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddGestureToNode002
     * @tc.number SUB_ARKUI_CAPI_ADD_GESTURE_TO_NODE_0200
     * @tc.desc   Test adding gesture to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddGestureToNode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddGestureToNode002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddGestureToNode003
     * @tc.number SUB_ARKUI_CAPI_ADD_GESTURE_TO_NODE_0300
     * @tc.desc   Test adding gesture to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddGestureToNode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddGestureToNode003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddGestureToNode004
     * @tc.number SUB_ARKUI_CAPI_ADD_GESTURE_TO_NODE_0400
     * @tc.desc   Test adding gesture to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddGestureToNode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddGestureToNode004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddGestureToNode005
     * @tc.number SUB_ARKUI_CAPI_ADD_GESTURE_TO_NODE_0500
     * @tc.desc   Test adding gesture to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddGestureToNode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddGestureToNode005()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAddGestureToNode006
     * @tc.number SUB_ARKUI_CAPI_ADD_GESTURE_TO_NODE_0600
     * @tc.desc   Test adding gesture to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddGestureToNode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAddGestureToNode006()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testRemoveGestureFromNode001
     * @tc.number SUB_ARKUI_CAPI_REMOVE_GESTURE_FROM_NODE_0100
     * @tc.desc   Test removing gesture from node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveGestureFromNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRemoveGestureFromNode001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testSetGestureInterrupterToNode001
     * @tc.number SUB_ARKUI_CAPI_SET_GESTURE_INTERRUPTER_TO_NODE_0100
     * @tc.desc   Test setting gesture interrupter to node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGestureInterrupterToNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSetGestureInterrupterToNode001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDisposeToNode001
     * @tc.number SUB_ARKUI_CAPI_DISPOSE_TO_NODE_0100
     * @tc.desc   dispose gesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDisposeToNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDisposeToNode001()).assertEqual(0);
      done();
    });

  })
}