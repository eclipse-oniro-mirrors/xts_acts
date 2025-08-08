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

export default function textDecorationTest() {

  describe('TextDecorationTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0100
     * @tc.name       : testTextDecoration001
     * @tc.desc       : testing decoration for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0200
     * @tc.name       : testTextDecoration002
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0300
     * @tc.name       : testTextDecoration003
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0400
     * @tc.name       : testTextDecoration004
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0500
     * @tc.name       : testTextDecoration005
     * @tc.desc       : testing decoration for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextDecoration005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0600
     * @tc.name       : testTextDecoration006
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0700
     * @tc.name       : testTextDecoration007
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0800
     * @tc.name       : testTextDecoration008
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0900
     * @tc.name       : testTextDecoration009
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_1000
     * @tc.name       : testTextDecoration010
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_1100
     * @tc.name       : testTextDecoration011
     * @tc.desc       : testing decoration for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration011()).assertEqual(0)
      done()
    })


    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_1200
     * @tc.name       : testTextDecoration012
     * @tc.desc       : testing decoration for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration012()).assertEqual(0)
      done()
    })


    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_1300
     * @tc.name       : testTextDecoration013
     * @tc.desc       : testing decoration for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_1400
     * @tc.name       : testTextDecoration014
     * @tc.desc       : testing decoration for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration014()).assertEqual(0)
      done()
    })


    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_1500
     * @tc.name       : testTextDecoration015
     * @tc.desc       : testing decoration for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextDecoration015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDecoration015()).assertEqual(0)
      done()
    })
  })
}
