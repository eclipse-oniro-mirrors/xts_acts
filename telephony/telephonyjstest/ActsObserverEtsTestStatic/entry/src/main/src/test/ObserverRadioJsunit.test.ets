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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import observer from '@ohos.telephony.observer';
import radio from '@ohos.telephony.radio';
import hilog from '@ohos.hilog'
import cellular from '@ohos.telephony.data';
import call from '@ohos.telephony.call';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ObserverRadioJsunit() {
  describe('ObserverRadioJsunit', (): void => {
    hilog.info(domain, tag, '%{public}s', '************* Observer Test start *************');

    /**
     * @tc.name   Telephony_observer_observer_off_signalInfoChange_0100
     * @tc.number SUB_Telephony_observer_observer_off_signalInfoChange_0100
     * @tc.desc   call the off method of signalInfoChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_observer_observer_off_signalInfoChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_signalInfoChange_0100 Test start *************');
      try {
        let callback = (SignalInformation:Array<radio.SignalInformation>) => {
          hilog.info(domain, tag, '%{public}s', 'on signalInfoChange, SignalInformation:'+JSON.stringify(SignalInformation));
          expect(typeof SignalInformation === undefined).assertFalse();
        }
        observer.onSignalInfoChange(callback);
        // 可以指定传入on中的callback取消一个订阅，也可以不指定callback清空所有订阅。
        observer.offSignalInfoChange(callback);
        observer.offSignalInfoChange();
        done();
      } catch (err) {
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* Telephony_observer_observer_off_signalInfoChange_0100 Test end *************');
    })

    hilog.info(domain, tag, '%{public}s', '************* Observer Test end *************');
  })
}