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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import ncAPI from 'libtestNetConnectNdk.so'

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
// 成功
const NETCONNECTION_OK = 0;
// 参数错误
const ERROR_CODE_401 = 401;
// 无法连接到服务
const ERROR_CODE_2100002 = 2100002;
// 回调不存在
const ERROR_CODE_2101007 = 2101007;

export default function NetConnectionNDKTest() {

  describe('NetConnectionNDKTest', () => {

    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testOHNetConnGetAddrInfo_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0100
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnGetAddrInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let host = 'www.baidu.com';
      let serv = 'https';
      let netid = 0;
      let re: number = ncAPI.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetAddrInfo_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0200
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetAddrInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let host = 'www.baidu.com';
      let serv = '';
      let netid = 0;
      let re: number = ncAPI.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_2100002);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetAddrInfo_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0300
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetAddrInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let host = '';
      let serv = 'https';
      let netid = 0;
      let re: number = ncAPI.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetAddrInfo_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0400
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnGetAddrInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let host = 'www.baidu.com';
      let serv = 'https';
      let netid = 1;
      let re: number = ncAPI.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetAddrInfo_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0500
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetAddrInfo_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let host = '';
      let serv = '';
      let netid = 0;
      let re: number = ncAPI.OHNetConnGetAddrInfo(host, serv, netid);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnFreeDnsResult_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0100
     * @tc.desc   ：Release DNS results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnFreeDnsResult_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnFreeDnsResult(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnFreeDnsResult_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0200
     * @tc.desc   ：Release DNS results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnFreeDnsResult_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnFreeDnsResult(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnFreeDnsResult_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0300
     * @tc.desc   ：Release DNS results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnFreeDnsResult_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnFreeDnsResult(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnGetAllNets_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETALLNETS_0100
     * @tc.desc   ：Query all activated data networks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetAllNets_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetAllNets(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetAllNets_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETALLNETS_0200
     * @tc.desc   ：Query all activated data networks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetAllNets_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetAllNets(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnHasDefaultNet_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNHASDEFAULTNET_0100
     * @tc.desc   ：Check if there is a default activated data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnHasDefaultNet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnHasDefaultNet(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnHasDefaultNet_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNHASDEFAULTNET_0200
     * @tc.desc   ：Check if there is a default activated data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnHasDefaultNet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnHasDefaultNet(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnIsDefaultNetMetered_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNISDEFAULTNETMETERED_0100
     * @tc.desc   ：Check if the default data network records traffic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnIsDefaultNetMetered_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnIsDefaultNetMetered(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnIsDefaultNetMetered_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNISDEFAULTNETMETERED_0200
     * @tc.desc   ：Check if the default data network records traffic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnIsDefaultNetMetered_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnIsDefaultNetMetered(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnGetDefaultNet_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTNET_0100
     * @tc.desc   ：Get the activated default data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetDefaultNet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultNet(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetDefaultNet_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTNET_0200
     * @tc.desc   ：Get the activated default data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetDefaultNet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultNet(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnGetConnectionProperties_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0100
     * @tc.desc   ：Query the link information of a data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnGetConnectionProperties_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetConnectionProperties_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0200
     * @tc.desc   ：Query the link information of a data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetConnectionProperties_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetConnectionProperties_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0300
     * @tc.desc   ：Query the link information of a data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetConnectionProperties_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetConnectionProperties_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0400
     * @tc.desc   ：Query the link information of a data network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetConnectionProperties_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnGetNetCapabilities_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0100
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetNetCapabilities_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetNetCapabilities_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0200
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetNetCapabilities_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetNetCapabilities_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0300
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetNetCapabilities_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetNetCapabilities_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0400
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetNetCapabilities_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHNetConnGetDefaultHttpProxy_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTHTTPPROXY_0100
     * @tc.desc   ：Query the default network proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetDefaultHttpProxy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultHttpProxy(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnGetDefaultHttpProxy_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTHTTPPROXY_0200
     * @tc.desc   ：Query the default network proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnGetDefaultHttpProxy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultHttpProxy(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.name   testOHOSNetConnRegisterDnsResolver_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHOSNETCONNREGISTERDNSRESOLVER_0100
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHOSNetConnRegisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnRegisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHOSNetConnRegisterDnsResolver_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHOSNETCONNREGISTERDNSRESOLVER_0200
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHOSNetConnRegisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnRegisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHOSNetConnUnregisterDnsResolver_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0100
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHOSNetConnUnregisterDnsResolver_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0200
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHOSNetConnUnregisterDnsResolver_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0300
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnBindSocket_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0100
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnBindSocket_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnBindSocket_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0200
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnBindSocket_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnBindSocket_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0300
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnBindSocket_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnBindSocket_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0400
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnBindSocket_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0100
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_1);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0200
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnRegisterNetConnCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0300
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0400
     * @tc.desc   ：Register net connection callback with default netspecifier.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0500
     * @tc.desc   ：Register net connection callback with cellular netspecifier, and timeout 0ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0600
     * @tc.desc   ：Register net connection callback with cellular netspecifier, and timeout 3000ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0700
     * @tc.desc   ：Register net connection callback with cellular netspecifier, and timeout UINT32_MAX ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0800
     * @tc.desc   ：Register net connection callback with wifi netspecifier, and timeout 0ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_0900
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0900
     * @tc.desc   ：Register net connection callback with wifi netspecifier, and timeout 3000ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_1000
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_1000
     * @tc.desc   ：Register net connection callback with wifi netspecifier, and timeout UINT32_MAX ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetConnRegisterNetConnCallback_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterNetConnCallback_1100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_1100
     * @tc.desc   ：Register net connection callback with wifi ident netspecifier, and timeout UINT32_MAX ms.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterNetConnCallback_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_6);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterDefaultNetConnCallback_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterDefaultNetConnCallback_0100
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterDefaultNetConnCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDefaultNetConnCallback(CASE_INDEX_1);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterDefaultNetConnCallback_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterDefaultNetConnCallback_0200
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterDefaultNetConnCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDefaultNetConnCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterDefaultNetConnCallback_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnRegisterDefaultNetConnCallback_0300
     * @tc.desc   ：Register net connection callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterDefaultNetConnCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDefaultNetConnCallback(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterNetConnCallback_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0100
     * @tc.desc   ：Unregister default net connection callback with invalid arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterNetConnCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_1);
      expect(re).assertEqual(ERROR_CODE_2101007);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterNetConnCallback_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0200
     * @tc.desc   ：Unregister default net connection callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterNetConnCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterNetConnCallback_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0300
     * @tc.desc   ：Unregister default net connection callback twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterNetConnCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_2101007);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterNetConnCallback_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0400
     * @tc.desc   ：Unregister cellular net connection callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterNetConnCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterNetConnCallback_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0500
     * @tc.desc   ：Unregister wifi net connection callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterNetConnCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterNetConnCallback_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0600
     * @tc.desc   ：Unregister wifi net connection callback with 3000ms timeout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterNetConnCallback_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_6);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnSetAppHttpProxy_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNSETAPPHTTPPROXY_0100
     * @tc.desc   ：Sets http proxy information to current application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnSetAppHttpProxy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnSetAppHttpProxy(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnSetAppHttpProxy_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNSETAPPHTTPPROXY_0200
     * @tc.desc   ：Sets http proxy information to current application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnSetAppHttpProxy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnSetAppHttpProxy(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnSetAppHttpProxy_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNSETAPPHTTPPROXY_0300
     * @tc.desc   ：Sets http proxy information to current application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnSetAppHttpProxy_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnSetAppHttpProxy(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterAppHttpProxyCallback_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0100
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterAppHttpProxyCallback_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0200
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterAppHttpProxyCallback_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0300
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterAppHttpProxyCallback_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0400
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterAppHttpProxyCallback_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0500
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterAppHttpProxyCallback_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0100
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterAppHttpProxyCallback_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0200
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterAppHttpProxyCallback_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0300
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterAppHttpProxyCallback_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0400
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterAppHttpProxyCallback_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0500
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterDnsResolver_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERDNSRESOLVER_0100
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnRegisterDnsResolver_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERDNSRESOLVER_0200
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnRegisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterDnsResolver_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERDNSRESOLVER_0100
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConnUnregisterDnsResolver_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERDNSRESOLVER_0200
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });


    /**
     * @tc.name   testOHNetConnUnregisterDnsResolver_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERDNSRESOLVER_0300
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConnUnregisterDnsResolver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterDnsResolver(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConSetPacUrl_0100
     * @tc.number SUB_NETWORK_testOHNetConSetPacUrl_0100
     * @tc.desc   ：SetPacUr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConSetPacUrl_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const pac: string = "a/b/test";
      console.info(`testOHNetConSetPacUrl_0100 start`);
      let re: number = ncAPI.OHNetConnSetPacUrl(pac);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.name   testOHNetConGetPacUrl_0100
     * @tc.number SUB_NETWORK_testOHNetConGetPacUrl_0100
     * @tc.desc   ：GetPacUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetConGetPacUrl_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`testOHNetConGetPacUrl_0100test start`);
      let re: string = ncAPI.OHNetConnGetPacUrl(CASE_INDEX_5);
      console.info(`testOHNetConGetPacUrl_0100test ${re}`);
      done();
    });

    /**
     * @tc.name   testOHNetCallHttpClientApi_0100
     * @tc.number SUB_NETWORK_CallHttpClientApi_0100
     * @tc.desc   CallHttpClientApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetCallHttpClientApi_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result : number = ncAPI.CallHttpClientApi();
      expect(result).assertEqual(0);
      console.info(`testOHNetCallHttpClientApi_0100 ${result}`);
      done();
    });

    /**
     * @tc.name   testOHStackHttpGetHeaderValue_0100
     * @tc.number SUB_NETWORK_OHHttpGetHeaderValue_0100
     * @tc.desc   GetHttpHeaderValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHStackHttpGetHeaderValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result : number = ncAPI.OHHttpGetHeaderValue();
      console.info(`testOHStackHttpGetHeaderValue_0100 ${result}`);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNetStackIsCleartextCfgByComponent0100
     * @tc.number SUB_NetStack_IsCleartextCfgByComponent_0100
     * @tc.desc   Disabling the HTTP non-cipher test protocol based on the configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackIsCleartextCfgByComponent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const component: string = "Network Kit";
      console.info(`testOHNetStackIsCleartextCfgByComponent0100 start`);
      let re: number = ncAPI.OHNetStackIsCleartextCfgByComponent(component);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });
  });
}

