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

export default function listItemTranslateTest() {

  describe('ListItemTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_TRANSLATE_0100
     * @tc.name       : testListItemTranslate001
     * @tc.desc       : testing translate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemTranslate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemTranslate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_TRANSLATE_0200
     * @tc.name       : testListItemTranslate002
     * @tc.desc       : testing translate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemTranslate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemTranslate002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_TRANSLATE_0300
     * @tc.name       : testListItemTranslate003
     * @tc.desc       : testing translate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemTranslate003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemTranslate003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_TRANSLATE_0400
     * @tc.name       : testListItemTranslate004
     * @tc.desc       : testing translate for listItem with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemTranslate004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemTranslate004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_TRANSLATE_0500
     * @tc.name       : testListItemTranslate005
     * @tc.desc       : testing translate for listItem with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testListItemTranslate005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemTranslate005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_TRANSLATE_0600
     * @tc.name       : testListItemTranslate006
     * @tc.desc       : testing translate for listItem with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemTranslate006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListItemTranslate006()).assertEqual(0)
      done()
    })
  })
}
