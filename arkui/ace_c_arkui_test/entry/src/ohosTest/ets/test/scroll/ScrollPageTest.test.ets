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

export default function scrollPageTest() {

  describe('ScrollPageTest', () => {

    let PAGE_TAG = 'ScrollPageTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_PAEG_0100
    * @tc.name       : testScrollPage001
    * @tc.desc       : testing Page for Scroll with 1
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollPage001', 0, async (done: Function) => {
      await Utils.clickComponent('scrollPageTestButtonUp')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('scrollPageUp').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_SCROLL_PAEG_0200
    * @tc.name       : testScrollPage002
    * @tc.desc       : testing Page for Scroll with 0
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollPage002', 0, async (done: Function) => {
      await Utils.clickComponent('scrollPageTestButtonDown')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('scrollPageDown').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}

