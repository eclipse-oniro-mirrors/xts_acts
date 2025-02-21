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

import {describe, expect, it, afterEach, afterAll } from '@ohos/hypium';
import connection from '@ohos.net.connection';

let host='syysystem';
let host1='sytuingm';
let host2='awsyssy';
let ip:Array<string>=['1.2.1.2','2.3.2.3'];
let ip1:Array<string>=['1.2.3.4','2.4.2.5'];
let ip2:Array<string>=['1.2.3.3','2.3.2.6'];
let host_null='';

export default function MulticastconnectionAsyncTest() {
    describe("MulticastconnectionAsyncTest", () => {
      afterEach(async ()=>{
        console.log('MulticastconnectionAsyncTest afterAll start');
        console.log('MulticastconnectionAsyncTest afterAll end');
      });
      let expectFalse = ()=>{
        try {
          expect().assertFail();
        } catch (err) {
          console.info('assertion failed');
        }
      };

      /**
       * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0100
       * @tc.name connection::addCustomDnsRule
       * @tc.desc Test addCustomDNSRule property
       * @tc.level Level1
       * @tc.type: Function
       * @tc.size: SmallTest
       */
       it("SUB_NetworkManager_DNS_addCustomDNSRule_Async_0100", 0 , async (done:Function) => {
           let caseName = "SUB_NetworkManager_DNS_addCustomDNSRule_Async_0100";
           connection.addCustomDnsRule(host,ip,(err,data) => {
               if (err) {
                   console.log(`${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
                   expectFalse();
                   done();
               } else {
                   console.log(`${caseName} addCustomDNSRule successed, data: ${JSON.stringify(data)}`);
                   expect(data == undefined).assertTrue();
                   done();
               }
           });
       });

      /**
       * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0200
       * @tc.name connection::addCustomDnsRule
       * @tc.desc Test addCustomDNSRule property
       * @tc.level Level1
       * @tc.type: Function
       * @tc.size: SmallTest
       */
       it("SUB_NetworkManager_DNS_addCustomDNSRule_Async_0200", 0 , async (done:Function) => {
           let caseName = "SUB_NetworkManager_DNS_addCustomDNSRule_Async_0200";
           connection.addCustomDnsRule(host_null,ip,(err,data) => {
               if (err) {
                   console.log(`${caseName} addCustomDNSRule successed, err: ${JSON.stringify(err)}`);
                   expect(err.code == 401).assertTrue();
                   done();
               } else {
                   console.log(`${caseName} addCustomDNSRule failed, data: ${JSON.stringify(data)}`);
                   expectFalse();
                   done();
               }
           });
       });

      /**
       * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0100
       * @tc.name connection::removeCustomDnsRule
       * @tc.desc Test removeCustomDNSRule property
       * @tc.level Level1
       * @tc.type: Function
       * @tc.size: SmallTest
       */
       it("SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0100", 0 , async (done:Function) => {
           await connection.addCustomDnsRule(host,ip);
           let caseName = "SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0100";
           connection.removeCustomDnsRule(host,(err,data) => {
               if (err) {
                   console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
                   expectFalse();
                   done();
               } else {
                   console.log(`${caseName} removeCustomDNSRule successed, data: ${JSON.stringify(data)}`);
                   expect(data == undefined).assertTrue();
                   done();
               }
           });
       });

      /**
       * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0200
       * @tc.name connection::removeCustomDnsRule
       * @tc.desc Test removeCustomDNSRule property
       * @tc.level Level1
       * @tc.type: Function
       * @tc.size: SmallTest
       */
        it("SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0200", 0 , async (done:Function) => {
           let caseName = "SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0200";
           try{
              connection.removeCustomDnsRule(host_null,(err,data) => {
                  if (err) {
                       console.log(`${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
                       done();
                   } else {
                       console.log(`${caseName} removeCustomDNSRule failed, data: ${JSON.stringify(data)}`);
                       expectFalse();
                       done();
                  }
              });
           }catch(error){
               console.log(`${caseName} removeCustomDnsRule failed err: ${JSON.stringify(error)}`);
               expect(error.code == 401).assertTrue();
               done();
           }
        });

      /**
       * @tc.number SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0100
       * @tc.name connection::clearCustomDnsRules
       * @tc.desc Test removeCustomDNSRule property
       * @tc.level Level1
       * @tc.type: Function
       * @tc.size: SmallTest
       */
       it("SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0100", 0 , async (done:Function) => {
           await connection.addCustomDnsRule(host1,ip1);
           await connection.addCustomDnsRule(host2,ip2);
           let caseName = "SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0100";
           connection.clearCustomDnsRules((err, data) => {
               if (err) {
                   console.log(`${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
                   expectFalse();
                   done();
               } else {
                   console.log(`${caseName} clearCustomDnsRules successed, data: ${JSON.stringify(data)}`);
                   expect(data == undefined).assertTrue();
                   done();
               }
           })
       });
    })
};