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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function listTranslateTest() {

  describe('ListTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_TRANSLATE_0100
     * @tc.name       : testListTranslate001
     * @tc.desc       : testing translate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListTranslate001', 0, async (done: Function) => {
      expect(nativeFunc.testListTranslate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_TRANSLATE_0200
     * @tc.name       : testListTranslate002
     * @tc.desc       : testing translate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListTranslate002', 0, async (done: Function) => {
      expect(nativeFunc.testListTranslate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_TRANSLATE_0300
     * @tc.name       : testListTranslate003
     * @tc.desc       : testing translate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListTranslate003', 0, async (done: Function) => {
      expect(nativeFunc.testListTranslate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_TRANSLATE_0400
     * @tc.name       : testListTranslate004
     * @tc.desc       : testing translate for list with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListTranslate004', 0, async (done: Function) => {
      expect(nativeFunc.testListTranslate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_TRANSLATE_0500
     * @tc.name       : testListTranslate005
     * @tc.desc       : testing translate for list with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListTranslate005', 0, async (done: Function) => {
      expect(nativeFunc.testListTranslate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_TRANSLATE_0600
     * @tc.name       : testListTranslate006
     * @tc.desc       : testing translate for list with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListTranslate006', 0, async (done: Function) => {
      expect(nativeFunc.testListTranslate006()).assertEqual(0)
      done()
    })
  })
}
