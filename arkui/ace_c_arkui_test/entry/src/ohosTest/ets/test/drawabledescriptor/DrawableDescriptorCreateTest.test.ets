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

export default function drawableDescriptorCreateTest() {

  describe('DrawableDescriptorCreateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testDrawableDescriptorCreate001
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0100
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDrawableDescriptorCreate002
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0200
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDrawableDescriptorCreate003
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0300
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDrawableDescriptorCreate004
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0400
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDrawableDescriptorCreate005
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0500
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDrawableDescriptorCreate006
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0600
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testDrawableDescriptorCreate007
     * @tc.number SUB_ARKUI_CAPI_DRAWABLE_DESCRIPTOR_0700
     * @tc.desc   testing align for button with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDrawableDescriptorCreate007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testDrawableDescriptorCreate007()).assertEqual(0)
      done()
    })

  })
}
