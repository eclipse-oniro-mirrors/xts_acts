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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function stackOnAreaChangeTest() {

  describe('StackOnAreaChangeTest', () => {

    let PAGE_TAG = 'StackOnAreaChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`stack/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_ONAREACHANGE_0100
    * @tc.name       : testStackOnAreaChange001
    * @tc.desc       : test OnAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackOnAreaChange001', 0, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestStackSize');
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestStackSize').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_ONAREACHANGE_0200
    * @tc.name       : testStackOnAreaChange002
    * @tc.desc       : test OnAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackOnAreaChange002', 0, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestStackMoveCompare');
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestStackMove').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_ONAREACHANGE_0300
    * @tc.name       : testStackOnAreaChange003
    * @tc.desc       : test OnAreaChange event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackOnAreaChange003', 0, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestStackOffset');
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestStackOffset').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    });
  })
}
