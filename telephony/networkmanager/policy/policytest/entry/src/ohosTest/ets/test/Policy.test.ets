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

import { describe, it, expect } from '@ohos/hypium';
import policy from '@ohos.net.policy';
import { BusinessError } from '@ohos.base';

export function expectEqual(exp: string | number | boolean, assert: string | number | boolean,
  info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
let setNetworkAccessPolicyFn =
  (caseName: string, done: Function, uid?: number | null | undefined, allowWiFi?: boolean, allowCellular?: boolean) => {
    let accessPolicy: policy.NetworkAccessPolicy = {
      allowWiFi: allowWiFi,
      allowCellular: allowCellular,
    }
    if (uid == null || uid == undefined) {
      console.info(`${caseName} test start`);
      try {
        policy.setNetworkAccessPolicy(uid, accessPolicy).then(() => {
          ExpectFail();
          done()
        }).catch((error: BusinessError) => {
          ExpectFail()
          done()
        });
      } catch (err) {
        expectEqual(err.code, '401')
        done()
        console.info(`${caseName} test end`);
      }
    } else {
      console.info(`${caseName} test start`);
      try {
        policy.setNetworkAccessPolicy(uid, accessPolicy).then(() => {
          ExpectTrue(true)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName} setNetworkAccessPolicy error ${JSON.stringify(error)}`);
          ExpectTrue(false)
          done()
        });
      } catch (err) {
        console.info(`${caseName} catch err ${JSON.stringify(err)}`);
        ExpectTrue(false)
        done()
        console.info(`${caseName} test end`);
      }
    }
  }

let getNetworkAccessPolicyByUidFn = (caseName: string, done: Function, uid?: number | null | undefined,) => {
  console.info(`${caseName} test start`);
  if (uid == null || uid == undefined) {
    try {
      policy.getNetworkAccessPolicy(uid).then((data: policy.NetworkAccessPolicy) => {
        ExpectTrue(false)
        done()
      }).catch((error: BusinessError) => {
        console.info(`${caseName} getNetworkAccessPolicy error ${JSON.stringify(error)}`);
        ExpectTrue(true)
        done()
      })
    } catch (err) {
      console.info(`${caseName} catch err ${JSON.stringify(err)}`);
      expectEqual(err.code, '401')
      done()
      console.info(`${caseName} test end`);
    }
  } else {
    try {
      policy.getNetworkAccessPolicy(uid).then((data: policy.NetworkAccessPolicy) => {
        ExpectTrue(true)
        done()
      }).catch((error: BusinessError) => {
        console.info(`${caseName} getNetworkAccessPolicy error ${JSON.stringify(error)}`);
        ExpectTrue(false)
        done()
      })
    } catch (err) {
      console.info(`${caseName} catch err ${JSON.stringify(err)}`);
      ExpectTrue(false)
      done()
      console.info(`${caseName} test end`);
    }
  }
}
let getNetworkAccessPolicyFn = (caseName: string, done: Function) => {
  console.info(`${caseName} test start`);
  try {
    policy.getNetworkAccessPolicy().then((data: policy.NetworkAccessPolicy) => {
      ExpectTrue(true)
      done()
    }).catch((error: BusinessError) => {
      console.info(`${caseName} getNetworkAccessPolicy error ${JSON.stringify(error)}`);
      ExpectTrue(false)
      done()
    })
  } catch (err) {
    console.info(`${caseName} catch err ${JSON.stringify(err)}`);
    ExpectTrue(false)
    done()
    console.info(`${caseName} test end`);
  }
}

export default function PolicyTset() {
  describe('PolicyTset', () => {

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0100
    * @tc.name  : testNetworkAccessPolicyPromise0100
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0100", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0100';
      setNetworkAccessPolicyFn(caseName, done, 20001, true, true)
    })

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0200
    * @tc.name  : testNetworkAccessPolicyPromise0200
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0200", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0200';
      setNetworkAccessPolicyFn(caseName, done, 2, false, false)
    })

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0300
    * @tc.name  : testNetworkAccessPolicyPromise0300
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0300", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0300';
      setNetworkAccessPolicyFn(caseName, done, 5, true, false)
    })

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0400
    * @tc.name  : testNetworkAccessPolicyPromise0400
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0400", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0400';
      setNetworkAccessPolicyFn(caseName, done, 6, false, true)
    })

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0500
    * @tc.name  : testNetworkAccessPolicyPromise0500
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0500", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0500';
      setNetworkAccessPolicyFn(caseName, done, null, false, true)
    })

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0600
    * @tc.name  : testNetworkAccessPolicyPromise0600
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0600", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0600';
      setNetworkAccessPolicyFn(caseName, done, undefined, false, true)
    })

    /* *
    * @tc.number: SUB_Network_policy_setNetworkAccessPolicyPromise_0700
    * @tc.name  : testNetworkAccessPolicyPromise0700
    * @tc.desc  : Set a policy that specifies whether the uid application can access the network, using the Promise method as an asynchronous method
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkAccessPolicyPromise0700", 0, async (done: Function) => {
      const caseName: string = 'testNetworkAccessPolicyPromise0700';
      setNetworkAccessPolicyFn(caseName, done, 20002, false, true)
    })

    /* *
    * @tc.number: SUB_Network_policy_getNetworkAccessPolicyByUidPromise_0100
    * @tc.name  : testUidNetworkAccessPolicyPromise0100
    * @tc.desc  : Gets access to the network policy for the specified uid, using the Promise method as an asynchronous method.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testUidNetworkAccessPolicyPromise0100", 0, async (done: Function) => {
      const caseName: string = 'testUidNetworkAccessPolicyPromise0100';
      await getNetworkAccessPolicyByUidFn(caseName, done, 20001)
    })

    /* *
    * @tc.number: SUB_Network_policy_getNetworkAccessPolicyByUidPromise_0200
    * @tc.name  : testUidNetworkAccessPolicyPromise0200
    * @tc.desc  : Gets access to the network policy for the specified uid, using the Promise method as an asynchronous method.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testUidNetworkAccessPolicyPromise0200", 0, async (done: Function) => {
      const caseName: string = 'testUidNetworkAccessPolicyPromise0200';
      await getNetworkAccessPolicyByUidFn(caseName, done, 20002)
    })

    /* *
    * @tc.number: SUB_Network_policy_getNetworkAccessPolicyByUidPromise_0300
    * @tc.name  : testUidNetworkAccessPolicyPromise0300
    * @tc.desc  : Gets access to the network policy for the specified uid, using the Promise method as an asynchronous method.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testUidNetworkAccessPolicyPromise0300", 0, async (done: Function) => {
      const caseName: string = 'testUidNetworkAccessPolicyPromise0300';
      await getNetworkAccessPolicyByUidFn(caseName, done, null)
    })

    /* *
    * @tc.number: SUB_Network_policy_getNetworkAccessPolicyByUidPromise_0400
    * @tc.name  : testUidNetworkAccessPolicyPromise0400
    * @tc.desc  : Gets access to the network policy for the specified uid, using the Promise method as an asynchronous method.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testUidNetworkAccessPolicyPromise0400", 0, async (done: Function) => {
      const caseName: string = 'testUidNetworkAccessPolicyPromise0400';
      await getNetworkAccessPolicyByUidFn(caseName, done, undefined)
    })

    /* *
    * @tc.number: SUB_Network_policy_getNetworkAccessPolicyByUidPromise_0500
    * @tc.name  : testUidNetworkAccessPolicyPromise0500
    * @tc.desc  : Gets access to the network policy for the specified uid, using the Promise method as an asynchronous method.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testUidNetworkAccessPolicyPromise0500", 0, async (done: Function) => {
      const caseName: string = 'testUidNetworkAccessPolicyPromise0500';
      await getNetworkAccessPolicyFn(caseName, done)
    })
  })
}