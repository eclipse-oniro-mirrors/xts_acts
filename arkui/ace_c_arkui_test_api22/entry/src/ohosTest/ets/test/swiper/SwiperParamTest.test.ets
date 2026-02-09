/**
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

export default function SwiperParamTest(){

  describe('SwiperParamTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SwiperParamTest_0100
     * @tc.number SwiperParamTest_0100
     * @tc.desc   Test SwiperParam return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperParamTest_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperParam001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SwiperParamTest_0200
     * @tc.number SwiperParamTest_0200
     * @tc.desc   Test SwiperFontWeight Enumerated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperParamTest_0200', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperParam002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SwiperParamTest_0300
     * @tc.number SwiperParamTest_0300
     * @tc.desc   Test SwiperSelectedFont Enumerated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperParamTest_0300', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperParam003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SwiperParamTest_0400
     * @tc.number SwiperParamTest_0400
     * @tc.desc   Test SwiperIndicator SetMaxDisplayCount param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperParamTest_0400', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperParam004()).assertEqual(0)
      done()
    })
    
    /**
     * @tc.name   testSwiperParam005
     * @tc.number testSwiperParam005
     * @tc.desc   Test SetShowBackground param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSwiperParam005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperParam005()).assertEqual(0)
      done()
    })
  })
}