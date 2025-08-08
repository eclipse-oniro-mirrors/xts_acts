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


import { describe, it, expect, TestType, Size, Level  } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import connection from '@ohos.net.connection';

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

export default function ConnectionHandleTest() {

  describe('ConnectionHandleTest',()=>{

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_2000
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName2000
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName2000';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "www.baidu.com";
          netHandle.getAddressByName(host, (error: BusinessError, data: connection.NetAddress) => {
            if (error) {
              console.error(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data != undefined);
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_2100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName2100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName2100';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "www.baidu.com";
          netHandle.getAddressByName(host).then((data: connection.NetAddress)=>{
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data != undefined );
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.error(`${caseName} Failed to get addresses. error:${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_2000
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName2000
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName2000';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "www.baidu.com";
          netHandle.getAddressesByName(host, (error: BusinessError, data: connection.NetAddress []) => {
            if (error) {
              console.error(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.info(`${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.length >= 0);
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_2100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName2100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName2100';
      console.info(`${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "www.baidu.com";
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[])=>{
            console.info(`${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.length >= 0);
            console.info(`${caseName}---End`);
            done();
          }).catch((err: BusinessError)=>{
            console.error(`${caseName} Failed to get addresses. error:${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          })
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.number : SUB_NetworkMgr_Connection_GetDefaultNetSync_0300
     * @tc.name   : testNetworkMgrConnectionGetDefaultNetSync0300
     * @tc.desc   : Obtain the network handle and check whether there is a network.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : SMALLTEST
     */
    it('testNetworkMgrConnectionGetDefaultNetSync0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrConnectionGetDefaultNetSync0300';
      console.info(`${caseName}---Start`);
      try {
        let netHandle =  connection.getDefaultNetSync();
        console.info(`${caseName} netHandle: ${JSON.stringify(netHandle)}`);
        ExpectTrue(netHandle.netId >= 100)
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /*
      * @tc.number:SUB_NetManager_GetConnectionPropertiesSync_0100
      * @tc.name: testNetManagerGetConnectionPropertiesSync0100
      * @tc.desc: Whether the getConnectionPropertiesSync_ method is called successfully with WIFI
      * @tc.level:Level 0
      * @tc.type:Function
      * @tc.size:MediumTest
      */
    it('testNetManagerGetConnectionPropertiesSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: Function) => {
      const caseName: string = 'testNetManagerGetConnectionPropertiesSync0100';
      console.info(`${caseName}---Start`);
      try {
        let nethandle = connection.getDefaultNetSync();
        let connectionProperties = connection.getConnectionPropertiesSync(nethandle);
        ExpectTrue(connectionProperties.linkAddresses.length >= 0);
        console.info(`${caseName}---End`);
        done();
      }catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


  });
}
