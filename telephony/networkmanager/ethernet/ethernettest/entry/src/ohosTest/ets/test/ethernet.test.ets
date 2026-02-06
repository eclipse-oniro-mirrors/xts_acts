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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import ethernet from '@ohos.net.ethernet';
import { BusinessError } from '@ohos.base';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
export default function EtherNetTest() {
  describe('EtherNetTest', () => {

    /* *
    * @tc.number: SUB_NetworkMgr_GetMacAddress_0100
    * @tc.name  : testNetworkMgrGetMacAddress0100
    * @tc.desc  : getMacAddress
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkMgrGetMacAddress0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrGetMacAddress0100';
      console.info(`${caseName} test start `)
      ethernet.getMacAddress().then((data:Array<ethernet.MacAddressInfo>)=>{
        console.info(`${caseName} getMacAddress data:${JSON.stringify(data)}`);
        expect(data[0].iface!==null).assertTrue();
        expect(data[0].macAddress!==null).assertTrue();
        done();
      }).catch((error:BusinessError)=>{
        console.info(`${caseName} getMacAddress data error:${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      });
      console.info(`${caseName} test end `)
    })

    /* *
    * @tc.number: SUB_NetworkMgr_GetMacAddress_0200
    * @tc.name  : testNetworkMgrGetMacAddress0200
    * @tc.desc  : getMacAddress
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 0
    */
    it("testNetworkMgrGetMacAddress0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrGetMacAddress0200';
      console.info(`${caseName} test start `)
      ethernet.getMacAddress().then((data:Array<ethernet.MacAddressInfo>)=>{
        console.info(`${caseName} getMacAddress data:${JSON.stringify(data)}`);
        ExpectTrue(true);
        done();
      }).catch((error:BusinessError)=>{
        console.log(`${caseName} catch err `,JSON.stringify(error))
        ExpectTrue(error.code == 2201005)
        done();
      });
      console.info(`${caseName} test end `)
    })

  })
}
