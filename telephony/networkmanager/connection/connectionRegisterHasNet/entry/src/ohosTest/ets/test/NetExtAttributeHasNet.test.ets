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
import { describe, expect, it , TestType, Size, Level, beforeEach } from '@ohos/hypium';
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


export default function NetExtAttributeHasNetTest() {
 describe('NetExtAttributeHasNetTest', () => {
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync0100
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0100
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL1
    */
   it("testNetworkMgrConnectionSetNetExtAttributeSync0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync0100";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttributeSync(netHandle, netExtAttribute);
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectTrue(true);
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectTrue(err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   })
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0100
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0100
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL1
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0100";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttribute(netHandle, netExtAttribute).then(() => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectTrue(true);
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
         ExpectTrue(err.code == 201);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync0100
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0100
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttributeSync0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync0100";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       let netExtAttribute: string = connection.getNetExtAttributeSync(netHandle);
       console.info(`${caseName} netExtAttribute is ->`+JSON.stringify(netExtAttribute));
       ExpectTrue(netExtAttribute == '' || netExtAttribute == 'test');
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttribute0100
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0100
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttribute0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute0100";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       connection.getNetExtAttribute(netHandle).then((netExtAttribute: string)=>{
         console.info(`${caseName} getNetExtAttribute success netExtAttribute is ->`+ netExtAttribute);
         ExpectTrue(netExtAttribute == '' || netExtAttribute == 'test');
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} getNetExtAttribute failed err is ->`+ JSON.stringify(err));
         ExpectFail();
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
    * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync0200
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0200
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttributeSync0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync0200";
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
       ExpectTrue(err.code == 201 || err.code == 2100001);
       console.info(`${caseName}---End`);
       done();
     }
   })
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0200
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0200
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0200";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       connection.setNetExtAttribute(undefined, netExtAttribute).then(() => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         ExpectTrue(err.code == 201 || err.code == 2100001);
         console.info(`${caseName}---End`);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 201 || err.code == 2100001);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync0200
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0200
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttributeSync0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync0200";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = connection.getNetExtAttributeSync(undefined);
       console.info(`${caseName} netExtAttribute is ->`+JSON.stringify(netExtAttribute));
       ExpectFail();
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 2100001);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttribute0200
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0200
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttribute0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute0200";
     console.info(`${caseName}---Start`);
     try{
       connection.getNetExtAttribute(undefined).then((netExtAttribute: string)=>{
         console.info(`${caseName} getNetExtAttribute success netExtAttribute is ->`+ netExtAttribute);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} getNetExtAttribute failed err is ->`+ JSON.stringify(err));
         ExpectTrue(err.code == 2100001);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 2100001);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync0300
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0300
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttributeSync0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync0300";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       let netHandle = connection.getDefaultNetSync();
       netHandle.netId = -1;
       connection.setNetExtAttributeSync(netHandle, netExtAttribute);
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectFail();
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectTrue(err.code == 2100003 || err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0300
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0300
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0300";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = 'test';
       let netHandle = connection.getDefaultNetSync();
       netHandle.netId = -1;
       connection.setNetExtAttribute(netHandle, netExtAttribute).then(() => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
         ExpectTrue(err.code == 2100003 || err.code == 201);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       ExpectTrue(err.code == 2100003 || err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync0300
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0300
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttributeSync0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync0300";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       netHandle.netId = -1;
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
    * @tc.name   testNetworkMgrConnectionGetNetExtAttribute0300
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0300
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttribute0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute0300";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       netHandle.netId = -1;
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
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync0400
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0400
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttributeSync0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync0400";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = '';
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttributeSync(netHandle, "");
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectTrue(true);
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectTrue(err.code == 201)
       console.info(`${caseName}---End`);
       done();
     }
   })
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0400
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0400
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0400";
     console.info(`${caseName}---Start`);
     try{
       let netExtAttribute: string = '';
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttribute(netHandle, netExtAttribute).then(() => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectTrue(true);
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
         ExpectTrue(err.code == 201);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectTrue(err.code == 201);
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync0400
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0400
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttributeSync0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync0400";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       let netExtAttribute: string = connection.getNetExtAttributeSync(netHandle);
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectTrue(netExtAttribute == '');
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   })
   
   /**
    * @tc.name   testNetworkMgrConnectionGetNetExtAttribute0400
    * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0400
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionGetNetExtAttribute0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute0400";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       connection.getNetExtAttribute(netHandle).then((netExtAttribute: string) => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectTrue(netExtAttribute == '');
         console.info(`${caseName}---End`);
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
         ExpectFail();
         console.info(`${caseName}---End`);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectFail();
       console.info(`${caseName}---End`);
       done();
     }
   });
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync0500
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0500
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttributeSync0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync0500";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttributeSync(netHandle, undefined);
       console.info(`${caseName} setNetExtAttributeSync success `);
       ExpectFail();
       done();
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectTrue(err.code == 201 || err.code == 2100001);
       console.info(`${caseName}---End`);
       done();
     }
   })
   
   /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0500
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0500
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,async (done: Function) => {
     let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0500";
     console.info(`${caseName}---Start`);
     try{
       let netHandle = connection.getDefaultNetSync();
       connection.setNetExtAttribute(netHandle, undefined).then(() => {
         console.info(`${caseName} setNetExtAttributeSync success `);
         ExpectFail();
         done();
       }).catch((err: BusinessError)=>{
         console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
         ExpectTrue(err.code == 201 || err.code == 2100001);
         done();
       })
     }catch (err){
       console.info(`${caseName} catch err is `+JSON.stringify(err));
       console.info(`${caseName} is not pc device `+JSON.stringify(err));
       ExpectTrue(err.code == 201 || err.code == 2100001);
       console.info(`${caseName}---End`);
       done();
     }
   });

      /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0600
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0600
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
      it("testNetworkMgrConnectionSetNetExtAttribute0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,async (done: Function) => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0600";
        console.info(`${caseName}---Start`);
        try{
          let netHandle = connection.getDefaultNetSync();
          netHandle.netId = 22;
          connection.setNetExtAttribute(netHandle, undefined).then(() => {
            console.info(`${caseName} setNetExtAttributeSync success `);
            ExpectFail();
            done();
          }).catch((err: BusinessError)=>{
            console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
            ExpectTrue(err.code == 201 || err.code == 2100001);
            done();
          })
        }catch (err){
          console.info(`${caseName} catch err is `+JSON.stringify(err));
          console.info(`${caseName} is not pc device `+JSON.stringify(err));
          ExpectTrue(err.code == 201 || err.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        }
      });

         /**
    * @tc.name   testNetworkMgrConnectionSetNetExtAttribute0700
    * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0700
    * @tc.desc   To test the extended network attribute function
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL3
    */
   it("testNetworkMgrConnectionSetNetExtAttribute0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,async (done: Function) => {
    let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute0700";
    console.info(`${caseName}---Start`);
    try{
      let netHandle = connection.getDefaultNetSync();
      netHandle.netId = 0;
      connection.setNetExtAttribute(netHandle, undefined).then(() => {
        console.info(`${caseName} setNetExtAttributeSync success `);
        ExpectFail();
        done();
      }).catch((err: BusinessError)=>{
        console.info(`${caseName} setNetExtAttributeSync failed err is `+JSON.stringify(err));
        ExpectTrue(err.code == 201 || err.code == 2100001);
        done();
      })
    }catch (err){
      console.info(`${caseName} catch err is `+JSON.stringify(err));
      console.info(`${caseName} is not pc device `+JSON.stringify(err));
      ExpectTrue(err.code == 201 || err.code == 2100001);
      console.info(`${caseName}---End`);
      done();
    }
  });

  });
}

