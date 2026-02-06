/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import osAccount from '@ohos.account.osAccount'
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'

let tag: string = 'testTag';

export default function ActsOsAccountErrCodeCheckStatic() {
  describe('ActsOsAccountErrCodeCheckStatic', () => {
    let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
    hilog.info(0x0000, tag, "====>get os AccountManager finish====");

    /**
    * @tc.number     OsAccountErrCodeCheck_2300
    * @tc.name       OsAccountErrCodeCheck_2300
    * @tc.desc       err code check 12300002
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountErrCodeCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountErrCodeCheck_2300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        let info: osAccount.DomainAccountInfo = {
          domain: "domain",
          accountName: name
        }
        try {
          accountManager.getOsAccountLocalIdForDomain(info, (err: BusinessError<void> | null, data: int | undefined): void => {
              hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, logTag + "data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                  hilog.info(0x0000, tag, logTag + "end====");
                } else {
                  hilog.info(0x0000, tag, '====>run err');
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     OsAccountErrCodeCheck_2400
    * @tc.name       OsAccountErrCodeCheck_2400
    * @tc.desc       err code check 12300002
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountErrCodeCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountErrCodeCheck_2400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        let info: osAccount.DomainAccountInfo = {
          domain: name,
          accountName: "name"
        }
        try {
          accountManager.getOsAccountLocalIdForDomain(info, (err: BusinessError<void> | null, data: int | undefined): void => {
              hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                  hilog.info(0x0000, tag, logTag + "end====");
                } else {
                  hilog.info(0x0000, tag, '====>run err');
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     OsAccountErrCodeCheck_2500
    * @tc.name       OsAccountErrCodeCheck_2500
    * @tc.desc       err code check 12300002
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountErrCodeCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountErrCodeCheck_2500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 513; i++) {
          name += 'i';
        }
        let info: osAccount.DomainAccountInfo = {
          domain: name,
          accountName: "name"
        }
        try {
          let data: int = await accountManager.getOsAccountLocalIdForDomain(info);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
    * @tc.number     OsAccountErrCodeCheck_2600
    * @tc.name       OsAccountErrCodeCheck_2600
    * @tc.desc       err code check 12300002
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountErrCodeCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountErrCodeCheck_2600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 513; i++) {
          name += 'i';
        }
        let info: osAccount.DomainAccountInfo = {
          domain: "domain",
          accountName: name
        }
        try {
          let data: int = await accountManager.getOsAccountLocalIdForDomain(info);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
    * @tc.number     OsAccountErrCodeCheck_2700
    * @tc.name       OsAccountErrCodeCheck_2700
    * @tc.desc       err code check 12300003
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountErrCodeCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountErrCodeCheck_2700 "
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          accountManager.getOsAccountLocalIdForSerialNumber(-1, (err: BusinessError<void> | null, data: int | undefined): void => {
              hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300003);
                  hilog.info(0x0000, tag, logTag + "end====");
                } else {
                  hilog.info(0x0000, tag, '====>run err');
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  })
}
