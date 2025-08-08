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

export default function nativeTest() {

  describe('nativeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_native_0100
     * @tc.name       : nativeTest001
     * @tc.desc       : testing create for native with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('nativeTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_native_0200
     * @tc.name       : nativeTest002
     * @tc.desc       : testing create for native with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('nativeTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_0300
    * @tc.name       : nativeTest003
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_003()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_0500
    * @tc.name       : nativeTest005
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_005()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_0600
    * @tc.name       : nativeTest006
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_006()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_0700
    * @tc.name       : nativeTest007
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_007()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_0800
    * @tc.name       : nativeTest008
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_008()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_0900
    * @tc.name       : nativeTest009
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_009()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_1000
    * @tc.name       : nativeTest010
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_010()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_1100
    * @tc.name       : nativeTest011
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_011()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_1200
    * @tc.name       : nativeTest012
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_012()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_1300
    * @tc.name       : nativeTest013
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_013()).assertEqual(0)
      done()
    })
    /*
    * @tc.number     : SUB_ARKUI_CAPI_native_1400
    * @tc.name       : nativeTest014
    * @tc.desc       : testing create for native with normal value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('nativeTest014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.native_014()).assertEqual(0)
      done()
    })

  })
}
