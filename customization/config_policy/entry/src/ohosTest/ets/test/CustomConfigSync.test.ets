/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import customConfig from '@ohos.customization.customConfig';

export default function customConfigTest() {
  describe("customConfigTest", () => {
      console.log('*************start customConfigTest*************');

      /**
       * @tc.number    : testGetChannelID_0010
       * @tc.name      : Get ChannelID with value
       * @tc.desc      : test GetChannelID
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
      it('testGetChannelID_0010', Level.LEVEL0, () => {
          let paramValue: string = "Test-Hw";
          let channelId: string = customConfig.getChannelId();
          expect(paramValue).assertEqual(channelId);
      })

      console.log('*************end customConfigTest*************');
  })
}