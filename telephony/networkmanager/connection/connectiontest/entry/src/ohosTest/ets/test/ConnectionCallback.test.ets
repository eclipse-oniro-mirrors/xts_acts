/**
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

export default function MulticastconnectionCallbackTest() {
  describe("MulticastconnectionCallbackTest", () => {

    /**
     * @tc.name   testNetworkManagerDNSAddCustomDNSRuleAsync0100
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0100
     * @tc.desc   Test addCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSAddCustomDNSRuleAsync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerDNSAddCustomDNSRuleAsync0100';
      console.info(`${caseName}---Start`);
      try{
        connection.addCustomDnsRule(host,ip,(err) => {
          if (err) {
            console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.log(`${caseName} addCustomDNSRule successed, data: `);
            ExpectTrue(true);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSAddCustomDNSRuleAsync0200
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0200
     * @tc.desc   Test addCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSAddCustomDNSRuleAsync0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerDNSAddCustomDNSRuleAsync0200';
      console.info(`${caseName}---Start`);
      try{
        connection.addCustomDnsRule(host_null,ip,(err) => {
          if (err) {
            console.log(`${caseName} addCustomDNSRule successed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
          } else {
            console.log(`${caseName} addCustomDNSRule failed`);
            ExpectFail();
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSRemoveCustomDNSRuleAsync0100
     * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0100
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSRemoveCustomDNSRuleAsync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerDNSRemoveCustomDNSRuleAsync0100';
      console.info(`${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host,ip);
        connection.removeCustomDnsRule(host,(err) => {
          if (err) {
            console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.log(`${caseName} removeCustomDNSRule successed`);
            ExpectTrue(true);
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSRemoveCustomDNSRuleAsync0200
     * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0200
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSRemoveCustomDNSRuleAsync0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerDNSRemoveCustomDNSRuleAsync0200';
      console.info(`${caseName}---Start`);
      try{
        connection.removeCustomDnsRule(host_null,(err,data) => {
          if (err) {
            console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
          } else {
            console.log(`${caseName} removeCustomDNSRule failed, data: ${JSON.stringify(data)}`);
            ExpectFail();
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSClearCustomDNSRuleAsync0100
     * @tc.number SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0100
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSClearCustomDNSRuleAsync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerDNSClearCustomDNSRuleAsync0100';
      console.info(`${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        await connection.addCustomDnsRule(host2,ip2);
        connection.clearCustomDnsRules((err, data) => {
          if (err) {
            console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
            ExpectFail();
          } else {
            console.log(`${caseName} clearCustomDnsRules successed, data: ${JSON.stringify(data)}`);
            ExpectTrue(data == undefined);
          }
          console.info(`${caseName}---End`);
          done();
        })
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    });


  })
};
