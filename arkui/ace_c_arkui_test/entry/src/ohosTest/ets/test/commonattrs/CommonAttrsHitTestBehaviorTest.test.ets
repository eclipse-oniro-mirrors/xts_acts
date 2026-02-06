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
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function commonAttrsHitTestBehaviorTest() {

  describe('CommonAttrsHitTestBehaviorTest', () => {

    let PAGE_TAG = 'CommonAttrsHitTestBehaviorTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`commonattrs/${PAGE_TAG}`, done);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_HITTESTBEHAVIOR_0100
     * @tc.name       : testCommonAttrsHitTestBehavior001
     * @tc.desc       : test commonattrs hitTestBehavior with event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsHitTestBehavior001', Level.LEVEL1, async (done: Function) => {
      await Utils.clickComponent('OnTouchTestStackDefault')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsDefault').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBrotherDefault').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackBlock')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBlock').$attrs.backgroundColor).assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBrotherBlock').$attrs.backgroundColor).assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackTransparent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsTransparent').$attrs.backgroundColor).assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBrotherTransparent').$attrs.backgroundColor).assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackNone')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsNone').$attrs.backgroundColor)
        .assertEqual('#FF0000FF')
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBrotherNone').$attrs.backgroundColor)
        .assertEqual('#FF00FF00')

      await Utils.clickComponent('OnTouchTestStackExceptBelow')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBrotherExceptBelow').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      await Utils.clickComponent('OnTouchTestStackExceptAbove')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')
      expect(Utils.getComponentInfoByKey('OnTouchTestCommonAttrsBrotherExceptAbove').$attrs.backgroundColor)
        .assertEqual('#FF000000')

      done()
    })

  })
}