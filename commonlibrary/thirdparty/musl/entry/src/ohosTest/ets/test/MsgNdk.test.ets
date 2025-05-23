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
import msg from 'libmsgndk.so'

export default function msgNdkTest() {
  describe('MuslMsgTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MSG_MSGGET_0100
     * @tc.name     : testMuslMsgMsgget001
     * @tc.desc     : test msgget
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslMsgMsgget001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = msg.msgget();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MSG_MSGSND_0100
     * @tc.name     : testMuslMsgMsgsnd001
     * @tc.desc     : test msgsnd
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslMsgMsgsnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = msg.msgsnd();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MSG_MSGRCV_0100
     * @tc.name     : testMuslMsgMsgrcv001
     * @tc.desc     : test msgrcv
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslMsgMsgrcv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = msg.msgrcv();
      expect(result).assertEqual(1)
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_MSG_MSGCTL_0100
     * @tc.name     : testMuslMsgMsgctl001
     * @tc.desc     : test msgctl
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslMsgMsgctl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = msg.msgctl();
      expect(result).assertEqual(1)
      done()
    });
  })
}