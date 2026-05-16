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

export default function smsTextPublic() {
  beforeAll(async (done: Function) => {
    console.log('getPermission beforeAll');
    await getPermissions();
		done();
  });

  describe('smsTextPublic', () => {
    let telphone: string = '+8617692630498';
    let telphoneErr: string = '+861xxxxxxxxxxx';
    let rawArrayNull: Array<number> = [];
    let pdu: Array<number> = [0x01, 0x00, 0x05, 0x81, 0x01, 0x80, 0xF6, 0x00, 0x00, 0x05, 0xE8, 0x32, 0x9B, 0xFD, 0x06];
    let pdu1: Array<number> = [0x01];
    let specification: string = '3gpp';
    let specification2: string = '3gpp2';

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage1000
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1000
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1000';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, '').then(shortMessage => {
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
     * @tc.name   testTelephonySmsMmsCreateMessage1100
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1100
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1100';
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(pdu, '', (err: BusinessError, shortMessage: sms.ShortMessage) => {
          if (err) {
            console.info(`${caseName} fail :${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonySmsMmsCreateMessage1200
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1200
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1200'
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(rawArrayNull, '').then(shortMessage => {
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
     * @tc.name   testTelephonySmsMmsSendMessage0100
     * @tc.number SUB_Telephony_SmsMms_SendMessage_0100
     * @tc.desc   Send a text message. version 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendMessage0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendMessage0100';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendCallback: AsyncCallback<sms.ISendShortMessageCallback> = (err: BusinessError, data: sms.ISendShortMessageCallback) => {
            if (err) {
              console.info(`${caseName} sendCallback: err->${JSON.stringify(err)}`);
              expectFalse(true, caseName);
              done();
            } else {
              console.info(`${caseName} sendCallback: data->${JSON.stringify(data)}`);
              expectTrue(data.result == 1, caseName);
              done();
            }
          };
          let deliveryCallback: AsyncCallback<sms.IDeliveryShortMessageCallback> = (err: BusinessError, data: sms.IDeliveryShortMessageCallback) => {
            console.info(`deliveryCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          };
          let options: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: telphoneErr,
            serviceCenter: telphoneErr,
            sendCallback: sendCallback,
            deliveryCallback: deliveryCallback
          };
          sms.sendMessage(options);
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendMessage0500
     * @tc.number SUB_Telephony_SmsMms_SendMessage_0500
     * @tc.desc   Send a text message. version 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendMessage0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendMessage0500';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendCallback: AsyncCallback<sms.ISendShortMessageCallback> = (err: BusinessError, data: sms.ISendShortMessageCallback) => {
            if (err) {
              console.info(`${caseName} sendCallback: err->${JSON.stringify(err)}`);
              expectFalse(true, caseName);
              done();
            } else {
              console.info(`${caseName} sendCallback: data->${JSON.stringify(data)}`);
              expectTrue(data.result == 1, caseName);
              done();
            }
          };
          let deliveryCallback: AsyncCallback<sms.IDeliveryShortMessageCallback> = (err: BusinessError, data: sms.IDeliveryShortMessageCallback) => {
            console.info(`deliveryCallback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          };
          let options: sms.SendMessageOptions = {
            slotId: 0,
            content: [1, 2, 3],
            destinationPort: 1000,
            destinationHost: telphoneErr,
            serviceCenter: telphoneErr,
            sendCallback: sendCallback,
            deliveryCallback: deliveryCallback
          };
          sms.sendMessage(options);
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage0300
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_0300
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage0300';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: '',
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage0400
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_0400
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage0400';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: '',
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage0500
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_0500
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage0500';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '',
            destinationHost: '',
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage0600
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_0600
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage0600';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '',
            destinationHost: '',
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1100
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1100
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1100';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: '+8613010180501',
            serviceCenter: '短信中心地址',
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectTrue(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1200
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1200
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1200';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: '+8613010180501',
            serviceCenter: '短信中心地址',
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectTrue(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1300
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1300
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1300';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: telphoneErr,
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1400
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1400
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1400';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '短信内容',
            destinationHost: telphoneErr,
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1500
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1500
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1500';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '',
            destinationHost: telphoneErr,
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1600
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1600
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1600';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: '',
            destinationHost: telphoneErr,
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1700
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1700
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1700';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [1, 2, 3],
            destinationHost: telphoneErr,
            serviceCenter: telphone,
            destinationPort: 1000,
            sendCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: sendCallback error->${JSON.stringify(err)}`);
              }
            },
            deliveryCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: deliveryCallback error->${JSON.stringify(err)}`);
              }
            }
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1800
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1800
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1800';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [1, 2, 3],
            destinationHost: telphoneErr,
            serviceCenter: telphone,
            destinationPort: 1000,
            sendCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: sendCallback error->${JSON.stringify(err)}`);
              }
            },
            deliveryCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: deliveryCallback error->${JSON.stringify(err)}`);
              }
            }
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage1900
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_1900
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage1900';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [1, 2, 3],
            destinationHost: telphoneErr,
            destinationPort: 1000,
            sendCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: sendCallback error->${JSON.stringify(err)}`);
              }
            },
            deliveryCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: deliveryCallback error->${JSON.stringify(err)}`);
              }
            }
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage2000
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_2000
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage2000';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [1, 2, 3],
            destinationHost: telphoneErr,
            destinationPort: 1000,
            sendCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: sendCallback error->${JSON.stringify(err)}`);
              }
            },
            deliveryCallback: (err)=>{
              if (err) {
                console.info(`${caseName}: deliveryCallback error->${JSON.stringify(err)}`);
              }
            }
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage2300
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_2300
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage2300';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 2,
            content: '短信正文',
            destinationHost: telphone,
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage2400
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_2400
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage2400';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 2,
            content: '短信正文',
            destinationHost: telphone,
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage2700
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_2700
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage2700';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [],
            destinationHost: telphone,
            destinationPort: 1000,
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage2800
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_2800
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage2800';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [],
            destinationHost: telphone,
            destinationPort: 1000,
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err=> ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage2900
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_2900
     * @tc.desc   Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage2900';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [],
            destinationHost: telphoneErr,
            destinationPort: 1000,
          };
          sms.sendShortMessage(sendOptions, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 8300001, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage3000
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_3000
     * @tc.desc   Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage3000';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          let sendOptions: sms.SendMessageOptions = {
            slotId: 0,
            content: [],
            destinationHost: telphoneErr,
            destinationPort: 1000,
          };
          sms.sendShortMessage(sendOptions).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 8300001, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSlotId0100
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSlotId_0100
     * @tc.desc   Get the default SIM card slot ID for sending text messages. Use callback for asynchronous callback. version 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsGetDefaultSmsSlotId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSlotId0100';
      console.info(`${caseName} test start`);
      try {
        sms.getDefaultSmsSlotId((err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName}: getDefaultSmsSlotId err->${JSON.stringify(err)}`);
            expectFalse(true, caseName);
          } else {
            expectTrue(data == 0, caseName);
            console.info(`${caseName}: data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSlotId0200
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSlotId_0200
     * @tc.desc   Get the default SIM card slot ID for sending text messages. Use Promise asynchronous callback. version 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsGetDefaultSmsSlotId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSlotId0200';
      console.info(`${caseName} test start`);
      try {
        sms.getDefaultSmsSlotId().then((data: number) => {
          console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
          expectTrue(data == 0, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
          expectFalse(true, caseName);
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsHasSmsCapability0100
     * @tc.number SUB_Telephony_SmsMms_HasSmsCapability_0100
     * @tc.desc   Check if the current device has the ability to send and receive text messages, which is a synchronization method. version 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsHasSmsCapability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsHasSmsCapability0100'
      console.info(`${caseName} test start`);
      let result = sms.hasSmsCapability();
      console.info(`${caseName} : ${JSON.stringify(result)}`);
      expectTrue(result == true, caseName);
      done();
      console.info(`${caseName}  test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSimId0100
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSimId_0100
     * @tc.desc   Obtain SMS formats supported on IMS. Use callback for asynchronous callback. version 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsGetDefaultSmsSimId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSimId0100';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          sms.getDefaultSmsSimId((err: BusinessError, data: number) => {
            if (err) {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
              expectFalse(true, caseName);
              done();
            } else {
              console.info(`${caseName} callback: data->${JSON.stringify(data)}`);
              expectTrue(data != null, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSimId0200
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSimId_0200
     * @tc.desc   Obtain SMS formats supported on IMS. Use Promise asynchronous callback. version 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsGetDefaultSmsSimId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSimId0200';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          sms.getDefaultSmsSimId().then((data: number) => {
            console.info(`${caseName} promise: data->${JSON.stringify(data)}`);
            expectTrue(data != null, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} promise: err->${JSON.stringify(err)}`);
            expectFalse(true, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsGetDefaultSmsSlotId0800
     * @tc.number SUB_Telephony_SmsMms_GetDefaultSmsSlotId_0800
     * @tc.desc   Get the default SIM card slot ID for sending text messages. Use Promise asynchronous callback. version 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsGetDefaultSmsSlotId0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsGetDefaultSmsSlotId0800';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          sms.setDefaultSmsSlotId(-1).then(() => {
            console.info(`${caseName} setDefaultSmsSlotId success.`);
            sms.getDefaultSmsSlotId().then((data: number) => {
              console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
              expectTrue(data == 0, caseName);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
              expectFalse(true, caseName);
            });
          }).catch((err: BusinessError) => {
            console.error(`${caseName} setDefaultSmsSlotId failed, promise: err->${JSON.stringify(err)}`);
            expectFalse(true, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectFalse(true, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage1300
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1300
     * @tc.desc   Send a text message. 8300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1300'
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(pdu1, specification, (err: BusinessError, shortMessage: sms.ShortMessage) => {
          if (err) {
            console.info(`${caseName} fail:${JSON.stringify(err.code)}`);
            expectTrue(err.code == 8300003, caseName);
            done();
          } else {
            console.info(`${caseName} success :${JSON.stringify(shortMessage)}`);
            expectFalse(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err:${err.code}`);
        expectTrue(err.code == 8300003, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage1400
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1400
     * @tc.desc   Send a text message. 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1400'
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(null, "[0x1]", (err: BusinessError, shortMessage: sms.ShortMessage) => {
          if (err) {
            console.info(`${caseName} fail:${JSON.stringify(err)}`);
            expectTrue(err.code == 401, caseName);
            done();
          } else {
            console.info(`${caseName} success :${JSON.stringify(shortMessage)}`);
            expectFalse(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectTrue(err.code == 401, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage1500
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1500
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1500'
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(pdu, "[0x1]").then(shortMessage => {
          console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
          expectFalse(true, caseName);
          done();
        }).catch((err: BusinessError) => {
          expectTrue(err.code == 8300003, caseName);
          console.info(`${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectTrue(err.code == 8300003, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsCreateMessage1600
     * @tc.number SUB_Telephony_SmsMms_CreateMessage_1600
     * @tc.desc   Create a SMS instance based on the Protocol Data Unit (PDU) and the specified SMS protocol. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsCreateMessage1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsCreateMessage1600'
      console.info(`${caseName} test start`);
      try {
        sms.createMessage(null, "[0x1]").then(shortMessage => {
          console.info(`${caseName} success:${JSON.stringify(shortMessage)}`);
          expectFalse(true, caseName);
          done();
        }).catch((err: BusinessError) => {
          expectTrue(err.code == 401, caseName);
          console.info(`${caseName} fail :${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectTrue(err.code == 401, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendMessage0600
     * @tc.number SUB_Telephony_SmsMms_SendMessage_0600
     * @tc.desc   Send a text message. 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendMessage0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendMessage0600';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          sms.sendMessage(null);
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err.code}`);
        expectTrue(err.code == 401, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage3100
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_3100
     * @tc.desc   401 Send a text message. Use callback for asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage3100';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          sms.sendShortMessage(null, (err: BusinessError) => {
            if (err) {
              console.info(`${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
              expectTrue(err.code == 401, caseName);
              done();
            } else {
              console.info(`${caseName}: success`);
              expectFalse(true, caseName);
              done();
            }
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectTrue(err.code == 401, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonySmsMmsSendShortMessage3200
     * @tc.number SUB_Telephony_SmsMms_SendShortMessage_3200
     * @tc.desc   401 Send a text message. Use Promise asynchronous callback. version 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsSendShortMessage3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonySmsMmsSendShortMessage3200';
      console.info(`${caseName} test start`);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        expectTrue(hasSim, caseName);
        if (hasSim) {
          sms.sendShortMessage(null).then(() => {
            console.info(`${caseName} success`);
            expectFalse(true, caseName);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} sendShortMessage err: ${JSON.stringify(err)}`);
            expectTrue(err.code == 401, caseName);
            done();
          });
        } else {
          console.info(`${caseName} no sim`);
          expectFalse(true, caseName);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err:${err}`);
        expectTrue(err.code == 401, caseName);
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}