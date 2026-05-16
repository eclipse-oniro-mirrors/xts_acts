/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '../../../hypium/index'
import customConfig from '@ohos.customization.customConfig';
import hilog from '@ohos.hilog'

export default function customConfigStaticTest() {
  describe("customConfigStaticTest", () => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start customConfigStaticTest*************');
      /**
       * @tc.name   testGetChannelID_static_0010
       * @tc.number testGetChannelID_static_0010
       * @tc.desc   test Get ChannelID with value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetChannelID_static_0010', Level.LEVEL0, () => {
          let paramValue: string = "Test-Hw";
          let channelId: string = customConfig.getChannelId();
          expect(paramValue).assertEqual(channelId);
      })
    hilog.info(0x0000, 'testTag', '%{public}s', '*************end customConfigStaticTest*************');
  })
}