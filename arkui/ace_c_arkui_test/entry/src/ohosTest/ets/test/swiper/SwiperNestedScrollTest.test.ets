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

export default function swiperNestedScrollTest() {

  describe('SwiperNestedScrollTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_NESTED_SCROLL_0100
     * @tc.name       : testSwiperNestedScroll001
     * @tc.desc       : testing nestedScroll for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperNestedScroll001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNestedScroll001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_NESTED_SCROLL_0200
     * @tc.name       : testSwiperNestedScroll002
     * @tc.desc       : testing nestedScroll for swiper with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperNestedScroll002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNestedScroll002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_NESTED_SCROLL_0300
     * @tc.name       : testSwiperNestedScroll003
     * @tc.desc       : testing nestedScroll for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperNestedScroll003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNestedScroll003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_NESTED_SCROLL_0400
     * @tc.name       : testSwiperNestedScroll004
     * @tc.desc       : testing nestedScroll for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperNestedScroll004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNestedScroll004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_NESTED_SCROLL_0500
     * @tc.name       : testSwiperNestedScroll005
     * @tc.desc       : testing nestedScroll for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperNestedScroll005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNestedScroll005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SWIPER_NESTED_SCROLL_0600
     * @tc.name       : testSwiperNestedScroll006
     * @tc.desc       : testing nestedScroll for swiper with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSwiperNestedScroll006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSwiperNestedScroll006()).assertEqual(0)
      done()
    })

  })
}
