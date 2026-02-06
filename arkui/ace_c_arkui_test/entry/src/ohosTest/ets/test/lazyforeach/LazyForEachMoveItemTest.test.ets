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

const SleepTime: number = 2000
const ColorGreen: string = '#FF00FF00'

export default function lazyForEachMoveItemTest() {

  describe('LazyForEachMoveItemTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_MOVEITEM_0100
     * @tc.name       : testLazyForEachMoveItem001
     * @tc.desc       : testing moveItem for lazyForEach with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachMoveItem001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`lazyforeach/LazyForEachMoveItemTest`)
      await Utils.clickComponent('btn')
      await Utils.sleep(SleepTime)
      expect(Utils.getComponentInfoByKey('col').$attrs.backgroundColor).assertEqual(ColorGreen)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_MOVEITEM_0200
     * @tc.name       : testLazyForEachMoveItem002
     * @tc.desc       : testing moveItem for lazyForEach with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachMoveItem002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLazyForEachMoveItem002()).assertEqual(0)
      done()
    })

  })
}