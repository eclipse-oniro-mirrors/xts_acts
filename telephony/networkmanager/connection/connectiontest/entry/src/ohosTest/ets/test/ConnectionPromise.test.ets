/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError} from '@ohos.base';

let host='syysystem';
let host1='sytuingm';
let host2='awsyssy';
let ip:Array<string>=['1.2.1.2','2.3.2.3'];
let ip1:Array<string>=['1.2.3.4','2.4.2.5'];
let ip2:Array<string>=['1.2.3.3','2.3.2.6'];
let host_null='';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function MulticastconnectionPromiseTest() {
  describe("MulticastconnectionPromiseTest", ()=>{

    /**
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0100
     * @tc.name testNetworkManagerDNSAddCustomDNSRulePromise0100
     * @tc.desc Test addCustomDNSRule property
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerDNSAddCustomDNSRulePromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = "testNetworkManagerDNSAddCustomDNSRulePromise0100";
      console.info(`${caseName}---Start`);
      try{
        connection.addCustomDnsRule(host,ip).then(() => {
          console.log(`${caseName} addCustomDNSRule success`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        console.log(`${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_Connection_addCustomDNSRule_Promise_0300
     * @tc.name testNetworkManagerConnectionAddCustomDNSRulePromise0300
     * @tc.desc Test addCustomDNSRule property
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerConnectionAddCustomDNSRulePromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = "testNetworkManagerConnectionAddCustomDNSRulePromise0300";
      console.info(`${caseName}---Start`);
      try{
        connection.addCustomDnsRule(host_null,ip).then((data) => {
          console.log(`${caseName} addCustomDNSRule failed, data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        console.log(`${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_Connection_removeCustomDNSRule_Promise_0100
     * @tc.name testNetworkManagerConnectionRemoveCustomDNSRulePromise0100
     * @tc.desc Test removeCustomDNSRule property
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerConnectionRemoveCustomDNSRulePromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = "testNetworkManagerConnectionRemoveCustomDNSRulePromise0100";
      console.info(`${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        connection.removeCustomDnsRule(host).then(() => {
          console.log(`${caseName} removeCustomDNSRule success`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        console.log(`${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_Connection_removeCustomDNSRule_Promise_0300
     * @tc.name testNetworkManagerConnectionRemoveCustomDNSRulePromise0300
     * @tc.desc Test removeCustomDNSRule property
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerConnectionRemoveCustomDNSRulePromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = "testNetworkManagerConnectionRemoveCustomDNSRulePromise0300";
      console.info(`${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        connection.removeCustomDnsRule(host_null).then(() => {
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          ExpectTrue(err.code == 401);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        console.log(`${caseName} --test end`);
        done();
      }
    });
    /*
     * @tc.number SUB_NetworkManager_Connection_clearCustomDNSRule_Promise_0100
     * @tc.name testNetworkManagerConnectionClearCustomDNSRulePromise0100
     * @tc.desc Test clearCustomDnsRules property
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerConnectionClearCustomDNSRulePromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = "testNetworkManagerConnectionClearCustomDNSRulePromise0100";
      console.info(`${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        await connection.addCustomDnsRule(host2,ip2);
        connection.clearCustomDnsRules().then(() => {
          console.log(`${caseName} clearCustomDnsRules success`);
          ExpectTrue(true);
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        })
      }catch (err){
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        console.log(`${caseName} --test end`);
        done();
      }
    });
  })
};
