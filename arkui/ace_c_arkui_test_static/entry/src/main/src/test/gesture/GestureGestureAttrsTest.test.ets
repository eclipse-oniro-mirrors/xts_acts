'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function gestureGestureAttrsTest() {

  describe('GestureGestureAttrsTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testAddChildGesture001
     * @tc.name     testAddChildGesture001
     * @tc.desc     testAddChildGesture001
     * @tc.level    Level.LEVEL1
     */
    it('testAddChildGesture001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddChildGesture001()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddChildGesture002
     * @tc.name     testAddChildGesture002
     * @tc.desc     testAddChildGesture002
     * @tc.level    Level.LEVEL1
     */
    it('testAddChildGesture002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddChildGesture002()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddChildGesture003
     * @tc.name     testAddChildGesture003
     * @tc.desc     testAddChildGesture003
     * @tc.level    Level.LEVEL1
     */
    it('testAddChildGesture003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddChildGesture003()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddChildGesture004
     * @tc.name     testAddChildGesture004
     * @tc.desc     testAddChildGesture004
     * @tc.level    Level.LEVEL1
     */
    it('testAddChildGesture004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddChildGesture004()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddChildGesture005
     * @tc.name     testAddChildGesture005
     * @tc.desc     testAddChildGesture005
     * @tc.level    Level.LEVEL1
     */
    it('testAddChildGesture005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddChildGesture005()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddChildGesture006
     * @tc.name     testAddChildGesture006
     * @tc.desc     testAddChildGesture006
     * @tc.level    Level.LEVEL1
     */
    it('testAddChildGesture006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddChildGesture006()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveChildGesture001
     * @tc.name     testRemoveChildGesture001
     * @tc.desc     testRemoveChildGesture001
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveChildGesture001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveChildGesture001()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveChildGesture002
     * @tc.name     testRemoveChildGesture002
     * @tc.desc     testRemoveChildGesture002
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveChildGesture002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveChildGesture002()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveChildGesture003
     * @tc.name     testRemoveChildGesture003
     * @tc.desc     testRemoveChildGesture003
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveChildGesture003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveChildGesture003()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveChildGesture004
     * @tc.name     testRemoveChildGesture004
     * @tc.desc     testRemoveChildGesture004
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveChildGesture004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveChildGesture004()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveChildGesture005
     * @tc.name     testRemoveChildGesture005
     * @tc.desc     testRemoveChildGesture005
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveChildGesture005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveChildGesture005()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveChildGesture006
     * @tc.name     testRemoveChildGesture006
     * @tc.desc     testRemoveChildGesture006
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveChildGesture006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveChildGesture006()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testSetGestureEventTarget001
     * @tc.name     testSetGestureEventTarget001
     * @tc.desc     testSetGestureEventTarget001
     * @tc.level    Level.LEVEL1
     */
    it('testSetGestureEventTarget001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSetGestureEventTarget001()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testSetGestureEventTarget002
     * @tc.name     testSetGestureEventTarget002
     * @tc.desc     testSetGestureEventTarget002
     * @tc.level    Level.LEVEL1
     */
    it('testSetGestureEventTarget002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSetGestureEventTarget002()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testSetGestureEventTarget003
     * @tc.name     testSetGestureEventTarget003
     * @tc.desc     testSetGestureEventTarget003
     * @tc.level    Level.LEVEL1
     */
    it('testSetGestureEventTarget003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSetGestureEventTarget003()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testSetGestureEventTarget004
     * @tc.name     testSetGestureEventTarget004
     * @tc.desc     testSetGestureEventTarget004
     * @tc.level    Level.LEVEL1
     */
    it('testSetGestureEventTarget004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSetGestureEventTarget004()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddGestureToNode001
     * @tc.name     testAddGestureToNode001
     * @tc.desc     testAddGestureToNode001
     * @tc.level    Level.LEVEL1
     */
    it('testAddGestureToNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddGestureToNode001()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddGestureToNode002
     * @tc.name     testAddGestureToNode002
     * @tc.desc     testAddGestureToNode002
     * @tc.level    Level.LEVEL1
     */
    it('testAddGestureToNode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddGestureToNode002()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddGestureToNode003
     * @tc.name     testAddGestureToNode003
     * @tc.desc     testAddGestureToNode003
     * @tc.level    Level.LEVEL1
     */
    it('testAddGestureToNode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddGestureToNode003()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddGestureToNode004
     * @tc.name     testAddGestureToNode004
     * @tc.desc     testAddGestureToNode004
     * @tc.level    Level.LEVEL1
     */
    it('testAddGestureToNode004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddGestureToNode004()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddGestureToNode005
     * @tc.name     testAddGestureToNode005
     * @tc.desc     testAddGestureToNode005
     * @tc.level    Level.LEVEL1
     */
    it('testAddGestureToNode005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddGestureToNode005()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testAddGestureToNode006
     * @tc.name     testAddGestureToNode006
     * @tc.desc     testAddGestureToNode006
     * @tc.level    Level.LEVEL1
     */
    it('testAddGestureToNode006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAddGestureToNode006()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testRemoveGestureFromNode001
     * @tc.name     testRemoveGestureFromNode001
     * @tc.desc     testRemoveGestureFromNode001
     * @tc.level    Level.LEVEL1
     */
    it('testRemoveGestureFromNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRemoveGestureFromNode001()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testSetGestureInterrupterToNode001
     * @tc.name     testSetGestureInterrupterToNode001
     * @tc.desc     testSetGestureInterrupterToNode001
     * @tc.level    Level.LEVEL1
     */
    it('testSetGestureInterrupterToNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSetGestureInterrupterToNode001()).assertEqual(0);
      done();
    });


    
    /**
     * @tc.number   testDisposeToNode001
     * @tc.name     testDisposeToNode001
     * @tc.desc     testDisposeToNode001
     * @tc.level    Level.LEVEL1
     */
    it('testDisposeToNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDisposeToNode001()).assertEqual(0);
      done();
    });

  })
}