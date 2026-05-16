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
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { connection } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}


export default function NetExtAttributeNoNetTest() {
 describe('NetExtAttributeNoNetTest', () => {

   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync0600
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0600
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttributeSync0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync0600";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttributeSync(netHandle, netExtAttribute);
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }catch (err){
       if(err.code == 201){
         console.info(`${caseName} is not pc device `+JSON.stringify(err));
         ExpectTrue(true);
       }else if(err.code == 2100003){
         console.info(`${caseName} device no net catch err is `+JSON.stringify(err));
         ExpectTrue(true);
       }else{
         console.info(`${caseName}  catch err is `+JSON.stringify(err));
         ExpectFail();
       }
       console.info(`${caseName}---End`);
       done();
     }
   })
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0600
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0600
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0600";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttribute(netHandle, netExtAttribute).then(() => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectTrue(true);
         done();
       }).catch((err: BusinessError)=>{
         if (err.code == 201) {
           console.info(`${caseName} is not pc device `+JSON.stringify(err));
           ExpectTrue(true);
         }else if(err.code == 2100003){
           console.info(`${caseName} device no net catch err is `+JSON.stringify(err));
           ExpectTrue(true);
         }else{
           console.info(`${caseName}  catch err is `+JSON.stringify(err));
           ExpectFail();
         }
         console.info(`${caseName}---End`);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync0600
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0600
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttributeSync0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync0600";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       let netExtAttribute: string = connection.getNetExtAttributeSync(netHandle);
       console.info(`${caseName} netExtAttribute is ->`+JSON.stringify(netExtAttribute));
       ExpectFail();
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 2100003);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttribute0600
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0600
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttribute0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute0600";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       connection.getNetExtAttribute(netHandle).then((netExtAttribute: string)=>{
         console.info(`${caseName} getNetExtAttribute success netExtAttribute is ->`+ netExtAttribute);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} getNetExtAttribute failed err is ->`+ JSON.stringify(err));
         ExpectTrue(err.code == 2100003);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 2100003);
       console.info(`${caseName}---End`);
       done();
     }
   });


  });
}

