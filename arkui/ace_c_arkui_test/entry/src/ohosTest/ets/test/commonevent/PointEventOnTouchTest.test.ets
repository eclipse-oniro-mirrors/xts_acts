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

export default function PointEventOnTouchTest() {

  describe('PointEventOnTouchTest', () => {

    let PAGE_TAG = 'PointEventOnTouchTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`commonevent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POINTEVENT_ONTOUCH_0100
    * @tc.name       : testPointEventOnTouch001
    * @tc.desc       : test onTouch event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPointEventOnTouch001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTest')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_POINTEVENT_ONTOUCH_0200
    * @tc.name       : testPointEventOnTouch002
    * @tc.desc       : test onTouch event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPointEventOnTouch002', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

  })
}
