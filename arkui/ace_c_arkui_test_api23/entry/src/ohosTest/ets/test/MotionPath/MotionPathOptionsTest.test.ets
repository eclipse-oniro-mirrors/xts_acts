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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function MotionPathOptionsTest(){

  describe('MotionPathOptionsTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   MotionPathOptionsTest_0100
     * @tc.number MotionPathOptionsTest_0100
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   MotionPathOptionsTest_0200
     * @tc.number MotionPathOptionsTest_0200
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0200', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   MotionPathOptionsTest_0300
     * @tc.number MotionPathOptionsTest_0300
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0300', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   MotionPathOptionsTest_0400
     * @tc.number MotionPathOptionsTest_0400
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0400', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions004()).assertEqual(0)
      done()
    })
    
    /**
     * @tc.name   MotionPathOptionsTest_0500
     * @tc.number MotionPathOptionsTest_0500
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0500', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   MotionPathOptionsTest_0600
     * @tc.number MotionPathOptionsTest_0600
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0600', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   MotionPathOptionsTest_0700
     * @tc.number MotionPathOptionsTest_0700
     * @tc.desc   Test MotionPath options 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0700', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   MotionPathOptionsTest_0800
     * @tc.number MotionPathOptionsTest_0800
     * @tc.desc   Test MotionPath options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0800', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions008()).assertEqual(0)
      done()
    })
    
    /**
     * @tc.name   MotionPathOptionsTest_0900
     * @tc.number MotionPathOptionsTest_0900
     * @tc.desc   Test MotionPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MotionPathOptionsTest_0900', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testMotionPathOptions009()).assertEqual(0)
      done()
    })
  })
}