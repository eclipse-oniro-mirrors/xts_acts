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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function scrollTranslateTest() {

  describe('ScrollTranslateTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_TRANSLATE_0100
     * @tc.name       : testScrollTranslate001
     * @tc.desc       : testing translate for scroll with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollTranslate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollTranslate001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_TRANSLATE_0200
     * @tc.name       : testScrollTranslate002
     * @tc.desc       : testing translate for scroll with big value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollTranslate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollTranslate002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_TRANSLATE_0300
     * @tc.name       : testScrollTranslate003
     * @tc.desc       : testing translate for scroll with overlapping value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testScrollTranslate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollTranslate003()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SCROLL_TRANSLATE_0400
     * @tc.name       : testScrollTranslate004
     * @tc.desc       : testing translate for scroll with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testScrollTranslate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testScrollTranslate004()).assertEqual(0)
      done();
    });
  })
}
