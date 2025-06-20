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

export default function textBackgroundImageTest() {

  describe('TextBackgroundImageTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0100
     * @tc.name       : testTextBackgroundImage001
     * @tc.desc       : testing backgroundimage for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundImage001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0200
     * @tc.name       : testTextBackgroundImage002
     * @tc.desc       : testing backgroundimage for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundImage002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0300
     * @tc.name       : testTextBackgroundImage003
     * @tc.desc       : testing backgroundimage for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundImage003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0400
     * @tc.name       : testTextBackgroundImage004
     * @tc.desc       : testing backgroundimage for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundImage004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0500
     * @tc.name       : testTextBackgroundImage005
     * @tc.desc       : testing backgroundimage for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextBackgroundImage005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0600
     * @tc.name       : testTextBackgroundImage006
     * @tc.desc       : testing backgroundimage for text with exception value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextBackgroundImage006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_BACKGROUNDIMAGE_0700
     * @tc.name       : testTextBackgroundImage007
     * @tc.desc       : testing backgroundimage for text with exception value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextBackgroundImage007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextBackgroundImage007()).assertEqual(0)
      done()
    })


  })
}
