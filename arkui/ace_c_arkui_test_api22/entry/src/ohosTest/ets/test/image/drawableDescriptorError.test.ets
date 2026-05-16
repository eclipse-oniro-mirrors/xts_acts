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
import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeFunc from 'libnativefunc.so'
import Utils from '../common/Utils';

export default function ImageDrawableErrorTest() {

  describe('ImageDrawableErrorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number  testImageDrawable001
     * @tc.name    testImageDrawable001
     * @tc.desc    testing FrameDurations for image with errorCode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testImageDrawable001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDrawable001()).assertEqual(0)
      done()
    })
    /**
     * @tc.number  testImageDrawable002
     * @tc.name    testImageDrawable002
     * @tc.desc    testing AutoPlay for image with errorCode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testImageDrawable002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDrawable002()).assertEqual(0)
      done()
    })
    /**
     * @tc.number   testImageDrawable003
     * @tc.name     testImageDrawable003
     * @tc.desc     testing CreateAnimationController for image with errorCode
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testImageDrawable003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDrawable003()).assertEqual(0)
      done()
    })
    /**
     * @tc.number   testImageDrawable004
     * @tc.name     testImageDrawable004
     * @tc.desc     testing StartAnimation for image with errorCode
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('testImageDrawable004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageDrawable004()).assertEqual(0)
      done()
    })
  })
}
