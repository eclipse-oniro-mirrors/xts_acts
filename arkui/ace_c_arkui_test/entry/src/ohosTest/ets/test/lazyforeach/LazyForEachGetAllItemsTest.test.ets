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

const SleepTime: number = 2000
const ColorGreen: string = '#FF00FF00'

export default function lazyForEachGetAllItemsTest() {

  describe('LazyForEachGetAllItemsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_GETALLITEMS_0100
     * @tc.name       : testLazyForEachGetAllItems001
     * @tc.desc       : testing getAllItems for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachGetAllItems001', 0, async (done: Function) => {
      await Utils.pushPage(`lazyforeach/LazyForEachGetAllItemsTest`)
      await Utils.clickComponent("btn")
      await Utils.sleep(SleepTime)
      expect(Utils.getComponentInfoByKey('colGetAllItems').$attrs.backgroundColor).assertEqual(ColorGreen)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_GETALLITEMS_0200
     * @tc.name       : testLazyForEachGetAllItems002
     * @tc.desc       : testing getAllItems for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachGetAllItems002', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachGetAllItems002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_GETALLITEMS_0300
     * @tc.name       : testLazyForEachGetAllItems003
     * @tc.desc       : testing getAllItems for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachGetAllItems003', 0, async (done: Function) => {
      expect(nativeFunc.testLazyForEachGetAllItems003()).assertEqual(0)
      done()
    })
  })
}