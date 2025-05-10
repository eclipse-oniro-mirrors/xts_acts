/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import pty from 'libptyndk.so'

export default function ptyNdkTest() {
  describe('MuslPtyTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTY_FORKPTY_0100
     * @tc.name       : testMuslTimeForkpty001
     * @tc.desc       : test forkpty
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeForkpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result:number = pty.forkpty();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTY_OPENPTY_0100
     * @tc.name       : testMuslPtyOpenpty001
     * @tc.desc       : openpty
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslPtyOpenpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pty.openpty();
      expect(result).assertEqual(0);
      done()
    });
  })
}