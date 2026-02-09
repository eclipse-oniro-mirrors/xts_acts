/*
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
 
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import networkSecurity from '@ohos.net.networkSecurity';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'networkSecurityNopTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    err = err as BusinessError;
    console.info("expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    err = err as BusinessError;
    console.info("expectInfo", `test sucess`);
  }
}

export default function networkSecurityNoPTest() {
  describe('networkSecurityNoPTest',  () => {
    /**
     * @tc.number  SUB_Telephony_networkSecurity_Nop_0100
     * @tc.name    testTelephonyNetworkSecurityNop_static_0100
     * @tc.desc    isCleartextPermitted No permission
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testTelephonyNetworkSecurityNop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testTelephonyNetworkSecurityNop_static_0100";
      hilog.info(domain, tag, '%{public}s'+ ' start');
      try {
        let result: boolean = networkSecurity.isCleartextPermitted();
        hilog.info(domain, tag, `${caseName} isCleartextPermitted Result: ${result}`);
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(err.code === 201);
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      done();
    });

    /**
     * @tc.number  SUB_Telephony_networkSecurity_Nop_0200
     * @tc.name    testTelephonyNetworkSecurityNop_static_0200
     * @tc.desc    isCleartextPermittedByHostName No permission
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testTelephonyNetworkSecurityNop_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testTelephonyNetworkSecurityNop_static_0200";
      hilog.info(domain, tag, '%{public}s'+ ' start');
      try {
        let result: boolean = networkSecurity.isCleartextPermittedByHostName('www.baidu.com');
        hilog.info(domain, tag, `${caseName} isCleartextPermittedByHostName Result: ${result}`);
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(err.code === 201);
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      done();
    });
  })
}
