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

export default function stackOnTouchTest() {

  describe('StackOnTouchTest', () => {

    let PAGE_TAG = 'StackOnTouchTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`stack/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_ONTOUCH_0100
    * @tc.name       : testStackOnTouch001
    * @tc.desc       : test OnTouch event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackOnTouch001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTest');
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnTouchTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_STACK_ONTOUCH_0200
    * @tc.name       : testStackOnTouch002
    * @tc.desc       : test OnTouch event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStackOnTouch002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestDisable');
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('OnTouchTestDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done();
    });
  })
}
