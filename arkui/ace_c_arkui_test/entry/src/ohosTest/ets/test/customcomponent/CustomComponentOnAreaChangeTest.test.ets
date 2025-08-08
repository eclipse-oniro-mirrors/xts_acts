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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function customComponentOnAreaChangeTest() {

  describe('CustomComponentOnAreaChangeTest', () => {

    let PAGE_TAG = 'CustomComponentOnAreaChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONAREACHANGE_0100
    * @tc.name       : testCustomComponentOnAreaChange001
    * @tc.desc       : test onAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnAreaChange001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestCustomComponentSize')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestCustomComponentSize').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONAREACHANGE_0200
    * @tc.name       : testCustomComponentOnAreaChange002
    * @tc.desc       : test onAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnAreaChange002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestCustomComponentMoveCompare')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestCustomComponentMove').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_ONAREACHANGE_0300
    * @tc.name       : testCustomComponentOnAreaChange003
    * @tc.desc       : test onAreaChange event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCustomComponentOnAreaChange003', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestCustomComponentOffset')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestCustomComponentOffset').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      done()
    })

  })
}
