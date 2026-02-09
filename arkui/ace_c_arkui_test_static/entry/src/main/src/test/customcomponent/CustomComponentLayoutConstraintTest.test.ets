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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function customComponentLayoutConstraintTest() {

  describe('CustomComponentLayoutConstraintTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testLayoutConstraintCreate001
     * @tc.name     testLayoutConstraintCreate001
     * @tc.desc     testLayoutConstraintCreate001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintCreate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintCreate001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintCopy001
     * @tc.name     testLayoutConstraintCopy001
     * @tc.desc     testLayoutConstraintCopy001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintCopy001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintCopy001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMinWidth001
     * @tc.name     testLayoutConstraintMinWidth001
     * @tc.desc     testLayoutConstraintMinWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMinWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMinWidth001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMinWidth002
     * @tc.name     testLayoutConstraintMinWidth002
     * @tc.desc     testLayoutConstraintMinWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMinWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMinWidth002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMaxWidth001
     * @tc.name     testLayoutConstraintMaxWidth001
     * @tc.desc     testLayoutConstraintMaxWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMaxWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMaxWidth001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMaxWidth002
     * @tc.name     testLayoutConstraintMaxWidth002
     * @tc.desc     testLayoutConstraintMaxWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMaxWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMaxWidth002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMinHeight001
     * @tc.name     testLayoutConstraintMinHeight001
     * @tc.desc     testLayoutConstraintMinHeight001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMinHeight001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMinHeight001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMinHeight002
     * @tc.name     testLayoutConstraintMinHeight002
     * @tc.desc     testLayoutConstraintMinHeight002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMinHeight002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMinHeight002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMaxHeight001
     * @tc.name     testLayoutConstraintMaxHeight001
     * @tc.desc     testLayoutConstraintMaxHeight001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMaxHeight001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMaxHeight001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMaxHeight002
     * @tc.name     testLayoutConstraintMaxHeight002
     * @tc.desc     testLayoutConstraintMaxHeight002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMaxHeight002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMaxHeight002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintPercentReferenceWidth001
     * @tc.name     testLayoutConstraintPercentReferenceWidth001
     * @tc.desc     testLayoutConstraintPercentReferenceWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintPercentReferenceWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintPercentReferenceWidth001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintPercentReferenceWidth002
     * @tc.name     testLayoutConstraintPercentReferenceWidth002
     * @tc.desc     testLayoutConstraintPercentReferenceWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintPercentReferenceWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintPercentReferenceWidth002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintPercentReferenceHeight001
     * @tc.name     testLayoutConstraintPercentReferenceHeight001
     * @tc.desc     testLayoutConstraintPercentReferenceHeight001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintPercentReferenceHeight001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintPercentReferenceHeight001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintPercentReferenceHeight002
     * @tc.name     testLayoutConstraintPercentReferenceHeight002
     * @tc.desc     testLayoutConstraintPercentReferenceHeight002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintPercentReferenceHeight002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintPercentReferenceHeight002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMeasuredSize001
     * @tc.name     testLayoutConstraintMeasuredSize001
     * @tc.desc     testLayoutConstraintMeasuredSize001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMeasuredSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMeasuredSize001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMeasuredSize002
     * @tc.name     testLayoutConstraintMeasuredSize002
     * @tc.desc     testLayoutConstraintMeasuredSize002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMeasuredSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMeasuredSize002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintLayoutPosition001
     * @tc.name     testLayoutConstraintLayoutPosition001
     * @tc.desc     testLayoutConstraintLayoutPosition001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintLayoutPosition001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintLayoutPosition001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintLayoutPosition002
     * @tc.name     testLayoutConstraintLayoutPosition002
     * @tc.desc     testLayoutConstraintLayoutPosition002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintLayoutPosition002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintLayoutPosition002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMeasureNode001
     * @tc.name     testLayoutConstraintMeasureNode001
     * @tc.desc     testLayoutConstraintMeasureNode001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMeasureNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMeasureNode001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintMeasureNode002
     * @tc.name     testLayoutConstraintMeasureNode002
     * @tc.desc     testLayoutConstraintMeasureNode002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintMeasureNode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintMeasureNode002()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintLayoutNode001
     * @tc.name     testLayoutConstraintLayoutNode001
     * @tc.desc     testLayoutConstraintLayoutNode001
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintLayoutNode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintLayoutNode001()).assertEqual(0);
      done();
    });
    
    
/**
     * @tc.number   testLayoutConstraintLayoutNode002
     * @tc.name     testLayoutConstraintLayoutNode002
     * @tc.desc     testLayoutConstraintLayoutNode002
     * @tc.level    Level.LEVEL1
     */
    it('testLayoutConstraintLayoutNode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLayoutConstraintLayoutNode002()).assertEqual(0);
      done();
    });
  })
}
