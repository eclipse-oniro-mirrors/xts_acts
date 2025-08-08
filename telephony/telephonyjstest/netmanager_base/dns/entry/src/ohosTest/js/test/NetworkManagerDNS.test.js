/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

 import netConnection from '@ohos.net.connection';
 
 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level  } from '@ohos/hypium'
export default function Telephony_NETMANAGER_TestDNSTest() {

 describe('Telephony_NETMANAGER_TestDNSTest',function(){
 
 
     it('Telephony_NETMANAGER_TestDNS_Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressesByName("www.baidu.com").then(function(addresses){
                 if(addresses === undefined || addresses.length == 0 ){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0100 addresses is '+addresses);
                     expect(false).assertFail();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0100 is success');
                     expect(true).assertTrue();
                 }
                 done();
             })
         })
     });
 
     it('Telephony_NETMANAGER_TestDNS_Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressesByName("www.baidu.com", function(err, addresses){
                 if(addresses === undefined || addresses.length == 0 ){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0200 addresses is '+addresses);
                     expect(false).assertFail();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0200 is success');
                     expect(true).assertTrue();
                 }
                 done();
             })
         })
     });
 
 
     it('Telephony_NETMANAGER_TestDNS_Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressByName("www.baidu.com").then(function(address){
                 if(address === undefined){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0300 addresses is '+address);
                     expect(false).assertFail();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0300 is success');
                     expect(true).assertTrue();
                 }
                 done();
             })
         })
     });
 
     it('Telephony_NETMANAGER_TestDNS_Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressByName("www.baidu.com", function(err, address){
                 if(address === undefined ){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0400 addresses is '+address);
                     expect(false).assertFail();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0400 is success');
                     expect(true).assertTrue();
                 }
                 done();
             })
         })
     });
 
     it('Telephony_NETMANAGER_TestDNS_Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressesByName("www.askjdbaksjnhd.com").then(function (data) {
                 if(data !== undefined && data.length !== 0){
                     expect(false).assertTrue();
                 }
                 done()
             }).catch(function (error) {
                 if(error === undefined){
                     expect(false).assertTrue();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0500 error is '+JSON.stringify(error));
                 }
                 done();
             })
         })
     });
 
     it('Telephony_NETMANAGER_TestDNS_Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressesByName("www.askjdbaksjnhd.com", function(err, addresses){
                 if(addresses instanceof Array && addresses.length !== 0 ){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0600 addresses is '+addresses);
                     expect(false).assertFail();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0600 is success');
                     expect(true).assertTrue();
                 }
                 done();
             })
         })
     });
 
 
     it('Telephony_NETMANAGER_TestDNS_Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressByName("www.askjdbaksjnhd.com").then(function(data) {
                 if(data !== undefined && data.length !== 0){
                     expect(false).assertTrue();
                 }
                 done()
             }).catch(function (error){
                 if(error !== undefined){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0700 error is '+ JSON.stringify(error));
                     expect(true).assertTrue();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0700 is success');
                 }
                 done();
             })
         })
     });
 
     it('Telephony_NETMANAGER_TestDNS_Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
 
         netConnection.getDefaultNet().then(function(netHandle){
             netHandle.getAddressByName("www.askjdbaksjnhd.com", function(err, address){
                 if(address !== undefined ){
                     console.info('Telephony_NETMANAGER_TestDNS_Test0800 address is undefined '+address);
                     expect(false).assertFail();
                 }else{
                     console.info('Telephony_NETMANAGER_TestDNS_Test0800 is success');
                     expect(true).assertTrue();
                 }
                 done();
             })
         })
     });

     it('Telephony_NETMANAGER_TestDNS_Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function(done){
         let netHandle =  netConnection.getDefaultNetSync();
         console.info("Telephony_NETMANAGER_TestDNS_Test0900 " + JSON.stringify(netHandle));
         expect(netHandle.netId >= 100).assertTrue();
         done();
     });
 });
}