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
import { afterAll, afterEach, describe, expect, it } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

let host='syysystem';
let host1='sytuingm';
let host2='awsyssy';
let ip:Array<string>=['1.2.1.2','2.3.2.3'];
let ip1:Array<string>=['1.2.3.4','2.4.2.5'];
let ip2:Array<string>=['1.2.3.3','2.3.2.6'];
let host_null='';

function expectFalse() {
  try{
    expect().assertFail();
  } catch(err){
    console.info('assertion failure');
  }
};

export default function Multicastconnection201Test() {
  afterAll(async ()=>{
    console.log('Multicastconnection201Test afterAll start');
    console.log('Multicastconnection201Test afterAll end');
  });

  describe("Multicastconnection201Test",  ()=>{
    /**
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0300
     * @tc.name Query key information
     * @tc.desc Function test
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_NetworkManager_DNS_addCustomDNSRule_Async_0300",0,async (done:Function)=> {
      let caseName = "SUB_NetworkManager_DNS_addCustomDNSRule_Async_0300";
      connection.addCustomDnsRule(host,ip,(err,data)=>{
        if (err) {
          console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          expect(err.code === 201).assertTrue();
          done();
        } else {
          console.log(`${caseName} addCustomDNSRule success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0200
     * @tc.name Query key information
     * @tc.desc Function test
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0200",0,async (done:Function)=> {
      let caseName = "SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0200";
      connection.addCustomDnsRule(host,ip).then((data)=>{
          console.log(`${caseName} addCustomDNSRule success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }).catch((err:BusinessError) =>  {
          console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          expect(err.code === 201).assertTrue();
          done();

      });
    });

    /**
    * @tc.number SUB_NetworkManagee_DNS_removeCustomDNSRulr_Async_0300
    * @tc.name connection::removeCustomDnsRule
    * @tc.desc Test removeCustomDnsRule property
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
    */
    it("SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0300",0,async (done:Function)=> {
      let caseName = "SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0300";
      connection.removeCustomDnsRule(host,(err,data)=>{
        if (err) {
          console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          expect(err.code === 201).assertTrue();
          done();
        } else {
          console.log(`${caseName} removeCustomDNSRule success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
    * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Promise_0200
    * @tc.name Query key information
    * @tc.desc Function test
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
    */
    it("SUB_NetworkManager_DNS_removeCustomDNSRule_Promise_0200",0,async (done:Function)=> {
         let caseName = "SUB_NetworkManager_DNS_removeCustomDNSRule_Promise_0200";
         connection.removeCustomDnsRule(host).then((data) => {
             console.log(`${caseName} removeCustomDNSRule success, data: ${JSON.stringify(data)}`);
             expectFalse();
             done();
           }).catch((err:BusinessError) =>  {
             console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
             expect(err.code === 201).assertTrue();
             done();
           });
         });

    /**
     * @tc.number SUB_NetworkManager_DNS_cleraCustomDNSRule_Async_0300
     * @tc.name connection::clearCustomDnsRules
     * @tc.desc Test removeCustomDnsRule property
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0300",0,async (done:Function)=> {
      let caseName = "SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0300";
      connection.clearCustomDnsRules((err,data)=>{
        if (err) {
          console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
          expect(err.code === 201).assertTrue();
          done();
        } else {
          console.log(`${caseName} clearCustomDnsRules success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });

    /**
     * @tc.number SUB_NetworkManager_DNS_clearCustomDNSRules_Promise_0200
     * @tc.name connection::clearCustomDnsRules
     * @tc.desc Test clearCustomDnsRules property
     * @tc.level Level1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_NetworkManager_DNS_clearCustomDNSRule_Promise_0300",0,async (done:Function)=> {
      let caseName = "SUB_NetworkManager_DNS_clearCustomDNSRule_Promise_0300";
      connection.clearCustomDnsRules().then((data)=>{
         console.log(`${caseName} clearCustomDnsRules success, data: ${JSON.stringify(data)}`);
         expectFalse();
         done();
         }).catch((err:BusinessError) =>  {
      console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
      expect(err.code === 201).assertTrue();
      done();
      });
    });
  })
};