/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import observer from '@ohos.telephony.observer';
import data from '@ohos.telephony.data';
import sim from '@ohos.telephony.sim';
import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ObserverRadioManagerTest() {
  describe("ObserverRadioManagerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOff_static_0100
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOff_0100
     * @tc.desc   Unsubscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverNetworkStateChangeOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.onNetworkStateChange((data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.offNetworkStateChange();
        ExpectTrue(true);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOff_static_0200
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOff_0200
     * @tc.desc   Unsubscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverNetworkStateChangeOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.NetworkState) => void = (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.onNetworkStateChange(callback);
        observer.offNetworkStateChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOff_static_0400
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOff_0400
     * @tc.desc   Unsubscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverNetworkStateChangeOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.NetworkState) => void = (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.onNetworkStateChange(callback);
        observer.offNetworkStateChange(callback);
        observer.offNetworkStateChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOff0100
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOff_0100
     * @tc.desc   Unsubscribe signal status change event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        observer.onSignalInfoChange((data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        observer.offSignalInfoChange();
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOff0200
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOff_0200
     * @tc.desc   Unsubscribe signal status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.onSignalInfoChange(callback);
        observer.offSignalInfoChange(callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOff0400
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOff_0400
     * @tc.desc   Unsubscribe signal status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.onSignalInfoChange(callback);
        observer.offSignalInfoChange(callback);
        observer.offSignalInfoChange(callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    })
}