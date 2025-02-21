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

export default function commonEventOnAreaChangeTest() {

  describe('CommonEventOnAreaChangeTest', () => {

    let PAGE_TAG = 'CommonEventOnAreaChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`commonevent/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_ONAREACHANGE_0100
    * @tc.name       : testCommonEventOnAreaChange001
    * @tc.desc       : test onAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEventOnAreaChange001', 0, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestImageSpanSize')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestImageSpanSize').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_ONAREACHANGE_0200
    * @tc.name       : testCommonEventOnAreaChange002
    * @tc.desc       : test onAreaChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEventOnAreaChange002', 0, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestImageSpanMoveCompare')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestImageSpanMove').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONEVENT_ONAREACHANGE_0300
    * @tc.name       : testCommonEventOnAreaChange003
    * @tc.desc       : test onAreaChange event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonEventOnAreaChange003', 0, async (done: Function) => {
      await Utils.clickComponent('OnAreaChangeTestImageSpanOffset')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAreaChangeTestImageSpanOffset').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      done()
    })

  })
}
