/**
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

import deviceInfo from '@ohos.deviceInfo';
import account from '@ohos.account.distributedAccount'
import { BusinessError, RecordData } from '@ohos.base';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'

let tag: string = 'testTag';


let LOGININFO: account.DistributedInfo = {
  name: 'ZhangSan',
  id: '12345',
  event: "Ohos.account.event.LOGIN"
}
let LOGOUTINFO: account.DistributedInfo = {
  name: 'ZhangSan',
  id: '12345',
  event: "Ohos.account.event.LOGOUT"
}

let deviceType = deviceInfo.deviceType;
hilog.info(0x0000, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

export default function ActsDAGetSetTestStatic() {
  describe('ActsDAGetSetTestStatic', () => {

    /**
     * @tc.number    ActsDADeviceId_0100
     * @tc.name      ActsDADeviceId_0100
     * @tc.desc      Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('ActsDADeviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsDADeviceId_0100 test query distribtued id start");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        accountAbility.setOsAccountDistributedInfo(LOGININFO, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>0100 set distributedInfo err: " + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>0100 get distributedInfo err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>0100 get distributedInfo info: " + JSON.stringify(data));
            let uid: string | undefined = '';
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                uid = data?.id;
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
              hilog.info(0x0000, tag, "====>0100 get Info err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>0100 get Info: " + JSON.stringify(data));
              try {
                if (data) {
                  expect(data?.name).assertEqual('Z**********');
                  expect(data?.id).assertEqual(uid);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
              }
              accountAbility.setOsAccountDistributedInfo(LOGOUTINFO, (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, '====>ActsDADeviceId_0100 logout_result:' + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                  hilog.info(0x0000, tag, "====>test query distribtued id end");
                } catch (err) {
                  hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
                }
                done();
              });
            });
          });
        });
      });

    /**
     * @tc.name   getDistributedAccountAbilityStatic_test
     * @tc.number getDistributedAccountAbilityStatic_test
     * @tc.desc   Test distributedAccount.getDistributedAccountAbility API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDistributedAccountAbilityStatic_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>start getDistributedAccountAbility_test====");
        let ret: boolean = false;
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        hilog.info(0x0000, tag, "====>getDistributedAccountAbility_test result: " + JSON.stringify(accountAbility));
        if (accountAbility !== null) {
          ret = true;
        }
        expect(ret).assertTrue();
        done();
      });

    /**
     * @tc.name   getOsAccountDistributedInfoStatic_test0100
     * @tc.number getOsAccountDistributedInfoStatic_test0100
     * @tc.desc   Test distributedAccount.getOsAccountDistributedInfo API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOsAccountDistributedInfoStatic_test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfoStatic_test0100====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfo promise");
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, '====>test0100 data:' + JSON.stringify(data));
          expect(data.name).assertEqual('ohosAnonymousName');
          expect(data.id).assertEqual('ohosAnonymousUid');
          expect(data.event).assertEqual('');
          expect(data.nickname).assertEqual('');
          expect(data.avatar).assertEqual('');
          expect(data.scalableData != null).assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.NOT_LOGGED_IN);
          expect(1).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>test0100 err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   getOsAccountDistributedInfoStatic_test0200
     * @tc.number getOsAccountDistributedInfoStatic_test0200
     * @tc.desc   Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOsAccountDistributedInfoStatic_test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfoStatic_test0200====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfo callback");
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, '====>test0200 err:' + JSON.stringify(err));
            hilog.info(0x0000, tag, '====>test0200 data:' + JSON.stringify(data));
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  expect(data?.name).assertEqual('ohosAnonymousName');
                  expect(data?.id).assertEqual('ohosAnonymousUid');
                  expect(data?.event).assertEqual('');
                  expect(data?.status).assertEqual(account.DistributedAccountStatus.NOT_LOGGED_IN);
                  hilog.info(0x0000, tag, "====>test0200 success");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>test002 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test001
     * @tc.name      setOsAccountDistributedInfo_test001
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('setOsAccountDistributedInfo_test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test001 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {}
        };
        try {
          await accountAbility.setOsAccountDistributedInfo(obj);
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, '====>getInfo_test001 data:' + JSON.stringify(data));
          expect(data.name).assertEqual('Z**********');
          expect(data.id !== 'ohosAnonymousUid').assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
          let obj1: account.DistributedInfo = {
            id: '12345',
            name: 'ZhangSan',
            event: 'Ohos.account.event.LOGOUT'
          };
          await accountAbility.setOsAccountDistributedInfo(obj1);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
        }
        accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
          hilog.info(0x0000, tag, '====>setInfo_test001 get err:' + JSON.stringify(err));
          hilog.info(0x0000, tag, '====>setInfo_test001 get data:' + JSON.stringify(data));
          try {
            expect(err).assertEqual(null);
            hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test001 end====");
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test002
     * @tc.name      setOsAccountDistributedInfo_test002
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {}
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test002 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, '====>setInfo_test002 err callback:' + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, '====>getInfo_test002 get err:' + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>getInfo_test002 get data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                expect(data?.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            let obj1: account.DistributedInfo = {
              id: '12345',
              name: 'ZhangSan',
              event: 'Ohos.account.event.LOGOUT'
            };
            hilog.info(0x0000, tag, "====>start LOGOUT");
            accountAbility.setOsAccountDistributedInfo(obj1, (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, '====>setInfo_test002 err callback:' + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test002 end====");
              done();
            });
          });
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test003
     * @tc.name      setOsAccountDistributedInfo_test003
     * @tc.desc      Test setOsAccountDistributedInfo 12300003 errcode.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('setOsAccountDistributedInfo_test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let tokenInvalidInfo: account.DistributedInfo = {
          name: 'ZhangSan',
          id: '12345',
          event: "Ohos.account.event.TOKEN_INVALID"
        };
        try {
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test003 start====");
          accountAbility.setOsAccountDistributedInfo(tokenInvalidInfo, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, '====>setInfo_test003 err: ' + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
            }
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>setInfo_test003 catch exception: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test0031
     * @tc.name      setOsAccountDistributedInfo_test0031
     * @tc.desc      Test setOsAccountDistributedInfo 12300003 errcode.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('setOsAccountDistributedInfo_test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let tokenInvalidInfo: account.DistributedInfo = {
          name: 'ZhangSan',
          id: '12345',
          event: "Ohos.account.event.TOKEN_INVALID"
        };
        try {
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test0031 start====");
          await accountAbility.setOsAccountDistributedInfo(tokenInvalidInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>setInfo_test0031 err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
        }
        done();
      });
      
    /**
     * @tc.number    setOsAccountDistributedInfo_test004
     * @tc.name      setOsAccountDistributedInfo_test004
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('setOsAccountDistributedInfo_test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {}
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test004 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>setInfo_test004 update_err: " + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>setInfo_test004 query_err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>setInfo_test004 query_data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                expect(data?.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            let obj1: account.DistributedInfo = {
              id: '12345',
              name: 'ZhangSan',
              event: 'Ohos.account.event.LOGOFF'
            };
            hilog.info(0x0000, tag, "====>start LOGOUT");
            accountAbility.setOsAccountDistributedInfo(obj1, (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, '====>setInfo_test004 err callback:' + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>setInfo_test004 end====");
              done();
            });
          });
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test005
     * @tc.name      setOsAccountDistributedInfo_test005
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                    normal nickname
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          nickname: 'test'
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test005 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>updateInfo_test005 set_err: " + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>updateInfo_test005 get_err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>updateInfo_test005 get_data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                expect(data?.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            let obj1: account.DistributedInfo = {
              id: '12345',
              name: 'ZhangSan',
              event: 'Ohos.account.event.LOGOFF'
            };
            hilog.info(0x0000, tag, "====>start LOGOFF");
            accountAbility.setOsAccountDistributedInfo(obj1, (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, '====>updateInfo_test005 err callback:' + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>updateInfo_test005 end====");
              done();
            });
          });
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test006
     * @tc.name      setOsAccountDistributedInfo_test006
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
     *                   normal nickname
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          nickname: 'test'
        };
        try {
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test006 start====");
          await accountAbility.setOsAccountDistributedInfo(obj);
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, "====>setInfo_test006 get_data: " + JSON.stringify(data));
          expect(data.name).assertEqual('Z**********');
          expect(data.id !== 'ohosAnonymousUid').assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
          let obj1: account.DistributedInfo = {
            id: '12345',
            name: 'ZhangSan',
            event: 'Ohos.account.event.LOGOFF'
          };
          hilog.info(0x0000, tag, "====>start LOGOFF");
          await accountAbility.setOsAccountDistributedInfo(obj1);
          hilog.info(0x0000, tag, '====>setInfo_test006 end');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>setOsAccountDistributedInfo_test006 err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test007
     * @tc.name      setOsAccountDistributedInfo_test007
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                    normal avatar
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          avatar: 'test'
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test007 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>setInfo_test007 set_err: " + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null,
            data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>setInfo_test007 get_err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>setInfo_test007 get_data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                expect(data?.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            let obj1: account.DistributedInfo = {
              id: '12345',
              name: 'ZhangSan',
              event: 'Ohos.account.event.LOGOFF'
            };
            hilog.info(0x0000, tag, "====>start LOGOFF");
            accountAbility.setOsAccountDistributedInfo(obj1, (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, '====>setInfo_test007 err callback:' + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>setInfo_test007 end====");
              done();
            });
          });
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test008
     * @tc.name      setOsAccountDistributedInfo_test008
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
     *                   normal avatar
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          avatar: 'test'
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test008 start====");
        try {
          await accountAbility.setOsAccountDistributedInfo(obj);
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, "====>setInfo_test008 get_data: " + JSON.stringify(data));
          expect(data.name).assertEqual('Z**********');
          expect(data.id !== 'ohosAnonymousUid').assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
          let obj1: account.DistributedInfo = {
            id: '12345',
            name: 'ZhangSan',
            event: 'Ohos.account.event.LOGOFF'
          };
          hilog.info(0x0000, tag, "====>start LOGOFF");
          await accountAbility.setOsAccountDistributedInfo(obj1);
          hilog.info(0x0000, tag, '====>setInfo_test008 end');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>setOsAccountDistributedInfo_test008 err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test009
     * @tc.name      setOsAccountDistributedInfo_test009
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                   overlength nickname 21
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let limitNickName: string = '';
        for (let i = 0; i < 1025; i++) {
          limitNickName += 'n';
        }
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          nickname: limitNickName,
          avatar: 'test'
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test009 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>setInfo_test009 set_err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test010
     * @tc.name      setOsAccountDistributedInfo_test010
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
     *               overlength nickname 21
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let limitNickName: string = '';
        for (let i = 0; i < 1025; i++) {
          limitNickName += 'n';
        }
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          nickname: limitNickName,
          avatar: 'test'
        };
        try {
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test010 start====");
          await accountAbility.setOsAccountDistributedInfo(obj);
          hilog.info(0x0000, tag, "====>setInfo_test010 run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setInfo_test010 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          done();
        };
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test011
     * @tc.name      setOsAccountDistributedInfo_test011
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                   overlength avatar 3*1024*1024+1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let limitAvatar: string = '';
        if (deviceType === 'wearable') {
          hilog.info(0x0000, tag, "====>test011 the wearable cannot construct 10M data");
          done();
          return new Promise<void>(() => {});
        } else {
          limitAvatar = ''.padEnd(10 * 1024 * 1024 + 1, 'o');
        }
        hilog.info(0x0000, tag, '====>setInfo_test011 avatar_length:' + limitAvatar.length);
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          avatar: limitAvatar
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test011 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>setInfo_test011 update_err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number    setOsAccountDistributedInfo_test012
     * @tc.name      setOsAccountDistributedInfo_test012
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by peomise.
     *                   overlength avatar 3*1024*1024+1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>setInfo_test012 start");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let limitAvatar: string = '';
        if (deviceType === 'wearable') {
          hilog.info(0x0000, tag, "====>test012 the wearable cannot construct 10M data");
          done();
          return new Promise<void>(() => {});
        } else {
          limitAvatar = ''.padEnd(10 * 1024 * 1024 + 1, 'o');
        }
        hilog.info(0x0000, tag, '====>setInfo_test012 avatar_length:' + limitAvatar.length);
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: {},
          avatar: limitAvatar
        };
        try {
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test012 start====");
          await accountAbility.setOsAccountDistributedInfo(obj);
          hilog.info(0x0000, tag, "====>setInfo_test012 set_err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setInfo_test012 throw_err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          done();
        }
      });
    /**
     * @tc.number    setOsAccountDistributedInfo_test013
     * @tc.name      setOsAccountDistributedInfo_test013
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                   overlength scalableData
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let limitInfo: Record<string, RecordData> = {};
        for (let i: number = 0; i < 513; i++) {
          limitInfo[i.toString()] = i;
        }
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: limitInfo,
        };
        hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test013 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>setInfo_test013 update_err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      });
    /**
     * @tc.number    setOsAccountDistributedInfo_test014
     * @tc.name      setOsAccountDistributedInfo_test014
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
     *                 overlength scalableData
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('setOsAccountDistributedInfo_test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let limitInfo: Record<string, RecordData> = {};
        for (let i: number = 0; i < 513; i++) {
          limitInfo[i.toString()] = i;
        }
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: limitInfo,
        };
        try {
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo_test014 start====");
          await accountAbility.setOsAccountDistributedInfo(obj);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setInfo_test014 throw_err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number    DistributedAccountEnum_0100
     * @tc.name      DistributedAccountEnum_0100
     * @tc.desc      Test distributedAccount Enum.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('DistributedAccountEnum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          let value: int = account.DistributedAccountStatus.NOT_LOGGED_IN
          hilog.info(0x0000, tag, "DistributedAccountEnum_0100 value is: " + value);
          expect(value + '').assertEqual('0');
          hilog.info(0x0000, tag, "====>DistributedAccountEnum_0100 success:");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>DistributedAccountEnum_0100 throw_err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number    DistributedAccountEnum_0200
     * @tc.name      DistributedAccountEnum_0200
     * @tc.desc      Test distributedAccount Enum.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('DistributedAccountEnum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          let value: int = account.DistributedAccountStatus.LOGGED_IN
          hilog.info(0x0000, tag, "DistributedAccountEnum_0200 value is: " + value);
          expect(value + '').assertEqual('1');
          hilog.info(0x0000, tag, "====>DistributedAccountEnum_0200 success:");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>DistributedAccountEnum_0200 throw_err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number    DistributedAccountOptionalParameter_0100
     * @tc.name      DistributedAccountOptionalParameter_0100
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                    OptionalParameter
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('DistributedAccountOptionalParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: undefined,
          nickname: undefined,
          avatar: undefined,
          status: undefined
        };
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>optionalParameter_0100 set_err: " + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>optionalParameter_0100 get_err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>optionalParameter_0100 get_data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                expect(data?.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            let obj: account.DistributedInfo = {
              id: '12345',
              name: 'ZhangSan',
              event: 'Ohos.account.event.LOGOFF'
            };
            hilog.info(0x0000, tag, "====>start LOGOFF");
            accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, '====>optionalParameter_0100 err callback:' + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>optionalParameter_0100 end====");
              done();
            });
          });
        });
      });

    /**
     * @tc.number    DistributedAccountOptionalParameter_0200
     * @tc.name      DistributedAccountOptionalParameter_0200
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
     *                   OptionalParameter
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('DistributedAccountOptionalParameter_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN',
          scalableData: undefined,
          nickname: undefined,
          avatar: undefined,
          status: undefined
        };
        try {
          await accountAbility.setOsAccountDistributedInfo(obj);
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, "====>optionalParameter_0200 get_data: " + JSON.stringify(data));
          expect(data.name).assertEqual('Z**********');
          expect(data.id !== 'ohosAnonymousUid').assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
          let obj1: account.DistributedInfo = {
            id: '12345',
            name: 'ZhangSan',
            event: 'Ohos.account.event.LOGOFF',
          };
          hilog.info(0x0000, tag, "====>start LOGOFF");
          await accountAbility.setOsAccountDistributedInfo(obj1);
          hilog.info(0x0000, tag, '====>optionalParameter_0200 end');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>optionalParameter_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number    DistributedAccountOptionalParameter_0500
     * @tc.name      DistributedAccountOptionalParameter_0500
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by callback.
     *                    OptionalParameter
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('DistributedAccountOptionalParameter_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN'
        };
        hilog.info(0x0000, tag, "====>DistributedAccountOptionalParameter_0500 start====");
        accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>optionalParameter_0500 set_err: " + JSON.stringify(err));
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>optionalParameter_0500 get_err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>optionalParameter_0500 get_data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.name).assertEqual('Z**********');
                expect(data?.id !== 'ohosAnonymousUid').assertTrue();
                expect(data?.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            let obj: account.DistributedInfo = {
              id: '12345',
              name: 'ZhangSan',
              event: 'Ohos.account.event.LOGOFF'
            };
            hilog.info(0x0000, tag, "====>start LOGOFF");
            accountAbility.setOsAccountDistributedInfo(obj, (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, '====>optionalParameter_0500 err callback:' + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>optionalParameter_0500 end====");
              done();
            });
          });
        });
      });

    /**
     * @tc.number    DistributedAccountOptionalParameter_0600
     * @tc.name      DistributedAccountOptionalParameter_0600
     * @tc.desc      Test distributedAccount.setOsAccountDistributedInfo API functionality by promise.
     *                   OptionalParameter
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('DistributedAccountOptionalParameter_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let obj: account.DistributedInfo = {
          id: '12345',
          name: 'ZhangSan',
          event: 'Ohos.account.event.LOGIN'
        };
        hilog.info(0x0000, tag, "====>DistributedAccountOptionalParameter_0600 start====");
        try {
          await accountAbility.setOsAccountDistributedInfo(obj);
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, "====>optionalParameter_0600 get_data: " + JSON.stringify(data));
          expect(data.name).assertEqual('Z**********');
          expect(data.id !== 'ohosAnonymousUid').assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
          let obj1: account.DistributedInfo = {
            id: '12345',
            name: 'ZhangSan',
            event: 'Ohos.account.event.LOGOFF',
          };
          hilog.info(0x0000, tag, "====>start LOGOFF");
          await accountAbility.setOsAccountDistributedInfo(obj1);
          hilog.info(0x0000, tag, '====>optionalParameter_0600 end');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>DistributedAccountOptionalParameter_1000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
  });
}
