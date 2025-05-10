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

export default function listItemShadowTest() {

  describe('ListItemShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SHADOW_0100
     * @tc.name       : testListItemShadow001
     * @tc.desc       : testing shadow for listItem with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemShadow001', 0, async (done: Function) => {
      expect(nativeFunc.testListItemShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SHADOW_0200
     * @tc.name       : testListItemShadow002
     * @tc.desc       : testing shadow for listItem with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemShadow002', 0, async (done: Function) => {
      expect(nativeFunc.testListItemShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SHADOW_0300
     * @tc.name       : testListItemShadow003
     * @tc.desc       : testing shadow for listItem with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemShadow003', 0, async (done: Function) => {
      expect(nativeFunc.testListItemShadow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SHADOW_0400
     * @tc.name       : testListItemShadow004
     * @tc.desc       : testing shadow for listItem with ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemShadow004', 0, async (done: Function) => {
      expect(nativeFunc.testListItemShadow004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SHADOW_0500
     * @tc.name       : testListItemShadow005
     * @tc.desc       : testing shadow for listItem with ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemShadow005', 0, async (done: Function) => {
      expect(nativeFunc.testListItemShadow005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LISTITEM_SHADOW_0600
     * @tc.name       : testListItemShadow006
     * @tc.desc       : testing shadow for listItem with ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListItemShadow006', 0, async (done: Function) => {
      expect(nativeFunc.testListItemShadow006()).assertEqual(0)
      done()
    })
  })
}
