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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import observer from '@ohos.telephony.observer';

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

export default function ObserverNopTest() {
  describe("ObserverNopTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOnNoP0100
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOn_NoP_0100
     * @tc.desc   Using the observer on ('networkStateChange',options,callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyObserverNetworkStateChangeOnNoP0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOnNoP0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        }
        observer.on('networkStateChange', options, (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': on observer, data: ->'+JSON.stringify(data));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(error.code == 201 || error.code == 401);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOnNoP0200
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOn_NoP_0200
     * @tc.desc   Using the observer on ('networkStateChange',callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyObserverNetworkStateChangeOnNoP0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOnNoP0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.on('networkStateChange', (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': on observer, data: ->'+JSON.stringify(data));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
     } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(error.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

  })
}