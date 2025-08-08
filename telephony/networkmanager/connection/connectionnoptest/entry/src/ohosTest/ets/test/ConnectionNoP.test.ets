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
import {  describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

let host='syysystem';
let ip:Array<string>=['1.2.1.2','2.3.2.3'];

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

export default function Multicastconnection201Test() {
  describe("Multicastconnection201Test",  ()=>{


    /**
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0300
     * @tc.name testNetworkManagerDNSaddCustomDNSRuleAsync0300
     * @tc.desc Function test
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerDNSaddCustomDNSRuleAsync0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done:Function)=> {
      const caseName: string = 'testNetworkManagerDNSaddCustomDNSRuleAsync0300';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule(host,ip,(err,data)=>{
          if (err) {
            console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
          } else {
            console.log(`${caseName} addCustomDNSRule success, data: ${JSON.stringify(data)}`);
            ExpectFail();
          }
          done();
          console.info(`${caseName}---End`);
        });
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }

    });

    /**
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0200
     * @tc.name testNetworkManagerDNSaddCustomDNSRulePromise0200
     * @tc.desc Function test
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerDNSaddCustomDNSRulePromise0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done:Function)=> {
      const caseName: string = 'testNetworkManagerDNSaddCustomDNSRulePromise0200';
      console.info(`${caseName}---Start`);
      try {
        connection.addCustomDnsRule(host,ip).then((data)=>{
          console.log(`${caseName} addCustomDNSRule success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) =>  {
          console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }

    });

    /**
     * @tc.number SUB_NetworkManagee_DNS_removeCustomDNSRulr_Async_0300
     * @tc.name testNetworkManageeDNSremoveCustomDNSRulrAsync0300
     * @tc.desc Test removeCustomDnsRule property
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManageeDNSremoveCustomDNSRulrAsync0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done:Function)=> {
      const caseName: string = 'testNetworkManageeDNSremoveCustomDNSRulrAsync0300';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(host,(err,data)=>{
          if (err) {
            console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} removeCustomDNSRule success, data: ${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Promise_0200
     * @tc.name testNetworkManagerDNSremoveCustomDNSRulePromise0200
     * @tc.desc Function test
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerDNSremoveCustomDNSRulePromise0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done:Function)=> {
      const caseName: string = 'testNetworkManagerDNSremoveCustomDNSRulePromise0200';
      console.info(`${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(host).then((data) => {
          console.log(`${caseName} removeCustomDNSRule success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) =>  {
          console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_DNS_cleraCustomDNSRule_Async_0300
     * @tc.name testNetworkManagerDNScleraCustomDNSRuleAsync0300
     * @tc.desc Test removeCustomDnsRule property
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerDNScleraCustomDNSRuleAsync0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done:Function)=> {
      const caseName: string = 'testNetworkManageeDNSremoveCustomDNSRulrAsync0300';
      console.info(`${caseName}---Start`);
      try {
        connection.clearCustomDnsRules((err,data)=>{
          if (err) {
            console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
          } else {
            console.log(`${caseName} clearCustomDnsRules success, data: ${JSON.stringify(data)}`);
            ExpectFail();
          }
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_NetworkManager_DNS_clearCustomDNSRules_Promise_0200
     * @tc.name testNetworkManagerDNSclearCustomDNSRulesPromise0200
     * @tc.desc Test clearCustomDnsRules property
     * @tc.level Level0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testNetworkManagerDNSclearCustomDNSRulesPromise0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done:Function)=> {
      const caseName: string = 'testNetworkManagerDNSclearCustomDNSRulesPromise0200';
      console.info(`${caseName}---Start`);
      try {
        connection.clearCustomDnsRules().then((data)=>{
          console.log(`${caseName} clearCustomDnsRules success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err:BusinessError) =>  {
          console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_NoP_0100
     * @tc.name testNetworkMgrConnectionSetNetExtAttributeSyncNoP0100
     * @tc.desc Test setNetExtAttributeSync permission
     * @tc.level Level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
   it("testNetworkMgrConnectionSetNetExtAttributeSyncNoP0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSyncNoP0100";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       connection.setNetExtAttributeSync(undefined, netExtAttribute);
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   })
 
     /**
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_NoP_0100
     * @tc.name testNetworkMgrConnectionSetNetExtAttributeNoP0100
     * @tc.desc Test setNetExtAttribute permission
     * @tc.level Level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
   it("testNetworkMgrConnectionSetNetExtAttributeNoP0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeNoP0100";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       connection.setNetExtAttribute(undefined, netExtAttribute).then(() => {
         console.info(`${caseName} setNetExtAttribute success `);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         ExpectTrue(err.code == 201);
         console.info(`${caseName}---End`);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   });

    /**
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_NoP_0100
     * @tc.name testNetworkMgrConnectionGetNetExtAttributeSyncNoP0100
     * @tc.desc Test getNetExtAttributeSync permission
     * @tc.level Level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
   it("testNetworkMgrConnectionGetNetExtAttributeSyncNoP0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSyncNoP0100";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = connection.getNetExtAttributeSync(undefined);
       console.info(`${caseName} netExtAttribute is ->`+JSON.stringify(netExtAttribute));
       ExpectFail();
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   });

    /**
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_NoP_0100
     * @tc.name testNetworkMgrConnectionGetNetExtAttributeNoP0100
     * @tc.desc Test getNetExtAttribute permission
     * @tc.level Level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
   it("testNetworkMgrConnectionGetNetExtAttributeNoP0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeNoP0100";
     console.info(`${caseName}---Start`);
     try{
       connection.getNetExtAttribute(undefined).then((netExtAttribute: string)=>{
         console.info(`${caseName} getNetExtAttribute success netExtAttribute is ->`+ netExtAttribute);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} getNetExtAttribute failed err is ->`+ JSON.stringify(err));
         ExpectTrue(err.code == 201);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   });

  })
};
