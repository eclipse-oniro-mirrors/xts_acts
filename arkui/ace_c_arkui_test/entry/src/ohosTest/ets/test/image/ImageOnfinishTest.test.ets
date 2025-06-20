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
import { ComponentInfo } from '../common/Interfaces';
import Utils from '../common/Utils';

export default function imageOnfinishTest() {

  describe('ImageOnfinishTest', () => {

    let PAGE_TAG = 'ImageOnfinishTest';

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ON_SVG_PLAY_FINISH_0100
     * @tc.name       : testImageOnFinish001
     * @tc.desc       : test image onFinish with event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageOnFinish001', 0, async (done: Function) => {
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(8000);
      expect(Utils.getComponentInfoByKey('OnFinish').$attrs.backgroundColor).assertEqual('#FFFF0000')

      done()
    })

  })
}