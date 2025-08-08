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

export default function imageOnDownloadProgressTest() {

  describe('ImageOnDownloadProgressTest', () => {

    let PAGE_TAG = 'ImageOnDownloadProgressTest';

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NODE_IMAGE_ON_DOWNLOAD_PROGRESS_0100
     * @tc.name       : testImageOnDownloadProgress001
     * @tc.desc       : test image onDownloadProgress with event callback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageOnDownloadProgress001', 0, async (done: Function) => {
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(5000);
      expect(Utils.getComponentInfoByKey('downprogress').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

  })
}