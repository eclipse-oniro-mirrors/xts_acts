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
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0100
     * @tc.name   ：TestOHNetConnGetAddrInfo_0100
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
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
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0200
     * @tc.name   ：TestOHNetConnGetAddrInfo_0200
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
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
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0300
     * @tc.name   ：TestOHNetConnGetAddrInfo_0300
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
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
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0400
     * @tc.name   ：TestOHNetConnGetAddrInfo_0400
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
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
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETADDRINFO_0500
     * @tc.name   ：TestOHNetConnGetAddrInfo_0500
     * @tc.desc   ：Obtain DNS results through netId.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
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
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0100
     * @tc.name   ：TestOHNetConnFreeDnsResult_0100
     * @tc.desc   ：Release DNS results.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnFreeDnsResult_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnFreeDnsResult(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0200
     * @tc.name   ：TestOHNetConnFreeDnsResult_0200
     * @tc.desc   ：Release DNS results.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnFreeDnsResult_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnFreeDnsResult(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNFREEDNSRESULT_0300
     * @tc.name   ：TestOHNetConnFreeDnsResult_0300
     * @tc.desc   ：Release DNS results.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnFreeDnsResult_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnFreeDnsResult(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETALLNETS_0100
     * @tc.name   ：TestOHNetConnGetAllNets_0100
     * @tc.desc   ：Query all activated data networks.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAllNets_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetAllNets(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETALLNETS_0200
     * @tc.name   ：TestOHNetConnGetAllNets_0200
     * @tc.desc   ：Query all activated data networks.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetAllNets_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetAllNets(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNHASDEFAULTNET_0100
     * @tc.name   ：TestOHNetConnHasDefaultNet_0100
     * @tc.desc   ：Check if there is a default activated data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnHasDefaultNet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnHasDefaultNet(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNHASDEFAULTNET_0200
     * @tc.name   ：TestOHNetConnHasDefaultNet_0200
     * @tc.desc   ：Check if there is a default activated data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnHasDefaultNet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnHasDefaultNet(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNISDEFAULTNETMETERED_0100
     * @tc.name   ：TestOHNetConnIsDefaultNetMetered_0100
     * @tc.desc   ：Check if the default data network records traffic.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnIsDefaultNetMetered_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnIsDefaultNetMetered(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNISDEFAULTNETMETERED_0200
     * @tc.name   ：TestOHNetConnIsDefaultNetMetered_0200
     * @tc.desc   ：Check if the default data network records traffic.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetConnIsDefaultNetMetered_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnIsDefaultNetMetered(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTNET_0100
     * @tc.name   ：TestOHNetConnGetDefaultNet_0100
     * @tc.desc   ：Get the activated default data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultNet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultNet(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTNET_0200
     * @tc.name   ：TestOHNetConnGetDefaultNet_0200
     * @tc.desc   ：Get the activated default data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultNet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultNet(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0100
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0100
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetConnGetConnectionProperties_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0200
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0200
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0300
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0300
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETCONNECTIONPROPERTIES_0400
     * @tc.name   ：TestOHNetConnGetConnectionProperties_0400
     * @tc.desc   ：Query the link information of a data network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetConnectionProperties_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetConnectionProperties(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0100
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0100
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0200
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0200
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0300
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0300
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETNETCAPABILITIES_0400
     * @tc.name   ：TestOHNetConnGetNetCapabilities_0400
     * @tc.desc   ：Query the capability set of a certain network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetNetCapabilities_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetNetCapabilities(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTHTTPPROXY_0100
     * @tc.name   ：TestOHNetConnGetDefaultHttpProxy_0100
     * @tc.desc   ：Query the default network proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultHttpProxy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultHttpProxy(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNGETDEFAULTHTTPPROXY_0200
     * @tc.name   ：TestOHNetConnGetDefaultHttpProxy_0200
     * @tc.desc   ：Query the default network proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnGetDefaultHttpProxy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnGetDefaultHttpProxy(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNREGISTERDNSRESOLVER_0100
     * @tc.name   ：TestOHOSNetConnRegisterDnsResolver_0100
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnRegisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnRegisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNREGISTERDNSRESOLVER_0200
     * @tc.name   ：TestOHOSNetConnRegisterDnsResolver_0200
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnRegisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnRegisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0100
     * @tc.name   ：TestOHOSNetConnUnregisterDnsResolver_0100
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0200
     * @tc.name   ：TestOHOSNetConnUnregisterDnsResolver_0200
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHOSNETCONNUNREGISTERDNSRESOLVER_0300
     * @tc.name   ：TestOHOSNetConnUnregisterDnsResolver_0300
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHOSNetConnUnregisterDnsResolver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHOSNetConnUnregisterDnsResolver(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0100
     * @tc.name   ：TestOHNetConnBindSocket_0100
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetConnBindSocket_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0200
     * @tc.name   ：TestOHNetConnBindSocket_0200
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnBindSocket_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0300
     * @tc.name   ：TestOHNetConnBindSocket_0300
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnBindSocket_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNBINDSOCKET_0400
     * @tc.name   ：TestOHNetConnBindSocket_0400
     * @tc.desc   ：Bind the socket to the specified network.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnBindSocket_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnBindSocket(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0100
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0100
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_1);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0200
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0200
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetConnRegisterNetConnCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0300
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0300
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0400
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0400
     * @tc.desc   ：Register net connection callback with default netspecifier.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0500
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0500
     * @tc.desc   ：Register net connection callback with cellular netspecifier, and timeout 0ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0600
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0600
     * @tc.desc   ：Register net connection callback with cellular netspecifier, and timeout 3000ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0700
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0700
     * @tc.desc   ：Register net connection callback with cellular netspecifier, and timeout UINT32_MAX ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0800
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0800
     * @tc.desc   ：Register net connection callback with wifi netspecifier, and timeout 0ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_0900
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_0900
     * @tc.desc   ：Register net connection callback with wifi netspecifier, and timeout 3000ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_1000
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_1000
     * @tc.desc   ：Register net connection callback with wifi netspecifier, and timeout UINT32_MAX ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetConnRegisterNetConnCallback_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterNetConnCallback_1100
     * @tc.name   ：TestOHNetConnRegisterNetConnCallback_1100
     * @tc.desc   ：Register net connection callback with wifi ident netspecifier, and timeout UINT32_MAX ms.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterNetConnCallback_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterNetConnCallbackTimeout(CASE_INDEX_6);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterDefaultNetConnCallback_0100
     * @tc.name   ：TestOHNetConnRegisterDefaultNetConnCallback_0100
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterDefaultNetConnCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDefaultNetConnCallback(CASE_INDEX_1);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterDefaultNetConnCallback_0200
     * @tc.name   ：TestOHNetConnRegisterDefaultNetConnCallback_0200
     * @tc.desc   ：Register net connection callback with invalid arg.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterDefaultNetConnCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDefaultNetConnCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnRegisterDefaultNetConnCallback_0300
     * @tc.name   ：TestOHNetConnRegisterDefaultNetConnCallback_0300
     * @tc.desc   ：Register net connection callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterDefaultNetConnCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDefaultNetConnCallback(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0100
     * @tc.name   ：TestOHNetConnUnregisterNetConnCallback_0100
     * @tc.desc   ：Unregister default net connection callback with invalid arg.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterNetConnCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_1);
      expect(re).assertEqual(ERROR_CODE_2101007);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0200
     * @tc.name   ：TestOHNetConnUnregisterNetConnCallback_0200
     * @tc.desc   ：Unregister default net connection callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterNetConnCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0300
     * @tc.name   ：TestOHNetConnUnregisterNetConnCallback_0300
     * @tc.desc   ：Unregister default net connection callback twice.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterNetConnCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_2101007);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0400
     * @tc.name   ：TestOHNetConnUnregisterNetConnCallback_0400
     * @tc.desc   ：Unregister cellular net connection callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterNetConnCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0500
     * @tc.name   ：TestOHNetConnUnregisterNetConnCallback_0500
     * @tc.desc   ：Unregister wifi net connection callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterNetConnCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNetConnUnregisterNetConnCallback_0600
     * @tc.name   ：TestOHNetConnUnregisterNetConnCallback_0600
     * @tc.desc   ：Unregister wifi net connection callback with 3000ms timeout.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterNetConnCallback_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterNetConnCallback(CASE_INDEX_6);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNSETAPPHTTPPROXY_0100
     * @tc.name   ：OHNetConnSetAppHttpProxy_0100
     * @tc.desc   ：Sets http proxy information to current application.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnSetAppHttpProxy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnSetAppHttpProxy(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNSETAPPHTTPPROXY_0200
     * @tc.name   ：OHNetConnSetAppHttpProxy_0200
     * @tc.desc   ：Sets http proxy information to current application.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnSetAppHttpProxy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnSetAppHttpProxy(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNSETAPPHTTPPROXY_0300
     * @tc.name   ：OHNetConnSetAppHttpProxy_0300
     * @tc.desc   ：Sets http proxy information to current application.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnSetAppHttpProxy_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnSetAppHttpProxy(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0100
     * @tc.name   ：OHNetConnRegisterAppHttpProxyCallback_0100
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0200
     * @tc.name   ：OHNetConnRegisterAppHttpProxyCallback_0200
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0300
     * @tc.name   ：OHNetConnRegisterAppHttpProxyCallback_0300
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_3);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0400
     * @tc.name   ：OHNetConnRegisterAppHttpProxyCallback_0400
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_4);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERAPPHTTPPROXYCALLBACK_0500
     * @tc.name   ：OHNetConnRegisterAppHttpProxyCallback_0500
     * @tc.desc   ：Registers callback to listen for changes to the application-level http proxy.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterAppHttpProxyCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterAppHttpProxyCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0100
     * @tc.name   ：OHNetConnUnregisterAppHttpProxyCallback_0100
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0200
     * @tc.name   ：OHNetConnUnregisterAppHttpProxyCallback_0200
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0300
     * @tc.name   ：OHNetConnUnregisterAppHttpProxyCallback_0300
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0400
     * @tc.name   ：OHNetConnUnregisterAppHttpProxyCallback_0400
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_4);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERAPPHTTPPROXYCALLBACK_0500
     * @tc.name   ：OHNetConnUnregisterAppHttpProxyCallback_0500
     * @tc.desc   ：Unregisters a callback function that listens for application-level proxy changes.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterAppHttpProxyCallback_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterAppHttpProxyCallback(CASE_INDEX_5);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERDNSRESOLVER_0100
     * @tc.name   ：TestOHNetConnRegisterDnsResolver_0100
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNREGISTERDNSRESOLVER_0200
     * @tc.name   ：TestOHNetConnRegisterDnsResolver_0200
     * @tc.desc   ：Register a custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnRegisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnRegisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERDNSRESOLVER_0100
     * @tc.name   ：TestOHNetConnUnregisterDnsResolver_0100
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterDnsResolver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterDnsResolver(CASE_INDEX_1);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERDNSRESOLVER_0200
     * @tc.name   ：TestOHNetConnUnregisterDnsResolver_0200
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterDnsResolver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterDnsResolver(CASE_INDEX_2);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETCONNUNREGISTERDNSRESOLVER_0300
     * @tc.name   ：TestOHNetConnUnregisterDnsResolver_0300
     * @tc.desc   ：Unregister custom DNS parser.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConnUnregisterDnsResolver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let re: number = ncAPI.OHNetConnUnregisterDnsResolver(CASE_INDEX_3);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_testOHNetConSetPacUrl_0100
     * @tc.name   ：testOHNetConSetPacUrl_0100
     * @tc.desc   ：SetPacUr
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     *
     */
    it('testOHNetConSetPacUrl_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const pac: string = "a/b/test";
      console.info(`testOHNetConSetPacUrl_0100 start`);
      let re: number = ncAPI.OHNetConnSetPacUrl(pac);
      expect(re).assertEqual(NETCONNECTION_OK);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_testOHNetConGetPacUrl_0100
     * @tc.name   ：testOHNetConGetPacUrl_0100
     * @tc.desc   ：GetPacUrl
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetConGetPacUrl_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`testOHNetConGetPacUrl_0100test start`);
      let re: string = ncAPI.OHNetConnGetPacUrl(CASE_INDEX_5);
      console.info(`testOHNetConGetPacUrl_0100test ${re}`);
      done();
    });
  });
}

