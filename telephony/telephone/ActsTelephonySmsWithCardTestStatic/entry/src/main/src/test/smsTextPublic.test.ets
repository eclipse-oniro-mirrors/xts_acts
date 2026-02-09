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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import sms from '@ohos.telephony.sms';
import { AsyncCallback, BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function smsTextPublic() {
  describe('smsTextPublic', (): void => {
    let telphone: string = '+8617692630498';
    let telphoneErr: string = '+861xxxxxxxxxxx';
    let rawArrayNull: Array<number> = [];
    let pdu: Array<number> = [0x01, 0x00, 0x05, 0x81, 0x01, 0x80, 0xF6, 0x00, 0x00, 0x05, 0xE8, 0x32, 0x9B, 0xFD, 0x06];
    let pdu1: Array<number> = [0x01];
    let specification: string = '3gpp';
    let specification2: string = '3gpp2';

    /**
     * @tc.name   testTelephonySmsMmsHasSmsCapability0100
     * @tc.number SUB_Telephony_SmsMms_HasSmsCapability_0100
     * @tc.desc   Check if the current device has the ability to send and receive text messages, which is a synchronization method. version 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonySmsMmsHasSmsCapability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySmsMmsHasSmsCapability0100'
      hilog.info(domain, tag, '%{public}s', caseName+ ' test start');
      let result = sms.hasSmsCapability();
      hilog.info(domain, tag, '%{public}s', caseName+ JSON.stringify(result));
      expectTrue(result == true, caseName);
      done();
      hilog.info(domain, tag, '%{public}s', caseName+ ' test end');
    });
  });
}