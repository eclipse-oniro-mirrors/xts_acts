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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '@ohos/hypium'
import sms from '@ohos.telephony.sms';
import { AsyncCallback, BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import uitest from '@ohos.UiTest';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const expectFalse: (n: boolean, name: string) => void = (n: boolean, name: string) => {
  try {
    expect(n).assertFalse();
  }
  catch (err) {
    console.info(`${name}, test failed`);
  }
}

const expectTrue: (n: boolean, name: string) => void = (n: boolean, name: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`${name}, test failed`);
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.SEND_MESSAGES" | "ohos.permission.RECEIVE_MMS" | "ohos.permission.RECEIVE_SMS";
  let list: MyPermissions[] = ['ohos.permission.SEND_MESSAGES', 'ohos.permission.RECEIVE_MMS', 'ohos.permission.RECEIVE_SMS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.telephonysmstest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function smsTextNoCardPublic() {
  beforeAll(async (done: Function) => {
    console.log('getPermission beforeAll');
    await getPermissions();
    done();
  });
  describe("smsTextDoneCardPublic", () => {
    let telphone: string = '+8617692630498';
    let telphoneErr: string = '+861xxxxxxxxxxx';
    let rawArrayNull: Array<number> = [];
    let pdu: Array<number> = [0x01, 0x00, 0x05, 0x81, 0x01, 0x80, 0xF6, 0x00, 0x00, 0x05, 0xE8, 0x32, 0x9B, 0xFD, 0x06];
    let specification: string = '3gpp';
    let specification2: string = '3gpp2';

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0100
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0100
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0100';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification, (err: BusinessError, shortMessage: sms.ShortMessage) => {
          if (err) {
            console.info(`${caseName} fail:${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          } else {
            console.info(`${caseName} success:${shortMessage}`);
            expectFalse(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0200
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0200
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0200';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(pdu, specification, (err: BusinessError, shortMessage: sms.ShortMessage) => {
          if (err) {
            console.info(`${caseName} fail:${JSON.stringify(err)}`);
            expectFalse(true, caseName);
            done();
          } else {
            console.info(`${caseName} success :${JSON.stringify(shortMessage)}`);
            expectTrue(shortMessage != null, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0300
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0300
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0300';
      ;
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification2, (err: BusinessError, shortMessage: sms.ShortMessage) => {
          if (err) {
            console.info(`${caseName} fail:${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          } else {
            console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
            expectFalse(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0500
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0500
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0500';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification).then(shortMessage => {
          console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
          expectFalse(true, caseName);
          done();
        }).catch((err: BusinessError) => {
          expectTrue(err.code == 8300001, caseName);
          console.info(`${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0600
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0600
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0600';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(pdu, specification).then(shortMessage => {
          expectTrue(shortMessage != null, caseName);
          console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
          done();
        }).catch((err: BusinessError) => {
          expectFalse(true, caseName);
          console.info(`${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0700
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0700
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0700';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, specification2).then(shortMessage => {
          console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
          expectFalse(true, caseName);
          done();
        }).catch((err: BusinessError) => {
          expectTrue(err.code == 8300001, caseName);
          console.info(`${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage0900
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_0900
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage0900';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(pdu, '').then(shortMessage => {
          expectFalse(true, caseName);
          console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
          done();
        }).catch((err: BusinessError) => {
          expectTrue(err.code == 8300001, caseName);
          console.info(`${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });
  })
}
