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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import sendfile from 'libsendfilendk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function sendfileNdkTest() {
  describe('MuslSendfileTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SENDFILE_SENDFILE_0100
     * @tc.name       : testMuslSendfileSendfile001
     * @tc.desc       : test sendfile
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslSendfileSendfile001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file1 = fs.openSync(filesDir + '/test1.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let file2 = fs.openSync(filesDir + '/test2.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen1 = fs.writeSync(file1.fd, "Try to write str.");
      let writeLen2 = fs.writeSync(file2.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen1);
      console.info("The length of str is: " + writeLen2);
      let buf = new ArrayBuffer(1024);
      let firstReadLen = fs.readSync(file1.fd, buf, { offset: 0 });
      let secondReadLen = fs.readSync(file2.fd, buf, { offset: 0 });
      fs.closeSync(file1);
      fs.closeSync(file2);
      let result:number = sendfile.sendfile(1);
      expect(result).assertEqual(-1);
      done()
    });

      /**
       * @tc.number     : SUB_THIRDPARTY_MUSL_SENDFILE_SENDFILE_0200
       * @tc.name       : testMuslSendfileSendfile002
       * @tc.desc       : test sendfile
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 2
       */
      it('testMuslSendfileSendfile002', 0, async (done: Function) => {
        let result:number = sendfile.sendfile(0);
        expect(result).assertEqual(1);
        done()
      });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SENDFILE_SENDFILE64_0100
     * @tc.name       : testMuslSendfileSendfile64001
     * @tc.desc       : test sendfile64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslSendfileSendfile64001', 0, async (done: Function) => {
      let result:number = sendfile.sendfile64(1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SENDFILE_SENDFILE64_0200
     * @tc.name       : testMuslSendfileSendfile64002
     * @tc.desc       : test sendfile64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslSendfileSendfile64002', 0, async (done: Function) => {
      let result:number = sendfile.sendfile64(0);
      expect(result).assertEqual(1);
      done()
    });
  })
}