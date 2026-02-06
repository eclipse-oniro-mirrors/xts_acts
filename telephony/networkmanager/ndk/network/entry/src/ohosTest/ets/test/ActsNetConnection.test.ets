/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import NetConnectionTest from 'libnetconnectiontest.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';

const OH_HTTP_OK = 0;
const WEBSOCKET_OK = 0;
const NETCONN_PERMISSION_DENIED = 201;
const OH_HTTP_PARAMETER_ERROR = 401;
const NETCONN_PARAMETER_ERROR = 401;
const OH_HTTP_OUT_OF_MEMORY = 2300027;
const NETCONN_INTERNAL_ERROR = 2100003;
const WEBSOCKET_CLIENT_NULL = 1001;
const WEBSOCKET_CLIENT_NOT_CREATED = 1002;
const WEBSOCKET_SEND_DATA_NULL = 1011;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 4;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;

export default function ActsNetConnectionTest() {
  describe('ActsNetConnectionTest', () => {

    /**
     * @tc.number  : SUB_NetworkManager_Net_HasDefaultNet_NoP_0100
     * @tc.name    : testSUBNetworkManagerNetHasDefaultNetNoP0100
     * @tc.desc    : Test whether the right of interface is denied.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testSUBNetworkManagerNetHasDefaultNetNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testSUBNetworkManagerNetHasDefaultNetNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_HasDefaultNet();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} cache error is: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_GetDefaultNet_NoP_0100
     * @tc.name    : testNetworkManagerNetGetDefaultNetNoP0100
     * @tc.desc    : Get the default network connection.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetGetDefaultNetNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetGetDefaultNetNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetDefaultNet();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_IsDefaultNetMetered_NoP_0100
     * @tc.name    : testNetworkManagerNetIsDefaultNetMeteredNoP0100
     * @tc.desc    : Check if the default network connection is metered.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetIsDefaultNetMeteredNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetIsDefaultNetMeteredNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_IsDefaultNetMetered();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_GetConnectionProperties_NoP_0100
     * @tc.name    : testNetworkManagerNetGetConnectionPropertiesNoP0100
     * @tc.desc    : Get the connection properties of the default network.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetGetConnectionPropertiesNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetGetConnectionPropertiesNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetConnectionProperties();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_GetNetCapabilities_NoP_0100
     * @tc.name    : testNetworkManagerNetGetNetCapabilitiesNoP0100
     * @tc.desc    : Get the network capabilities of the default network.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetGetNetCapabilitiesNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetGetNetCapabilitiesNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetNetCapabilities();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_GetAllNets_NoP_0100
     * @tc.name    : testNetworkManagerNetGetAllNetsNoP0100
     * @tc.desc    : Get all available network connections.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetGetAllNetsNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetGetAllNetsNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetAllNets();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_SetPacUrl_NoP_0100
     * @tc.name    : testNetworkManagerNetSetPacUrlNoP0100
     * @tc.desc    : Set the PAC URL of the network.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetSetPacUrlNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetSetPacUrlNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_SetPacUrl("test");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_SetPacUrl_NoP_0200
     * @tc.name    : testNetworkManagerNetSetPacUrlNoP0200
     * @tc.desc    : Set the PAC URL of the network.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetSetPacUrlNoP0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetSetPacUrlNoP0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_SetPacUrl("");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_GetPacUrl_NoP_0100
     * @tc.name    : testNetworkManagerNetGetPacUrlNoP0100
     * @tc.desc    : Get the PAC URL of the network.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetGetPacUrlNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetGetPacUrlNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetPacUrl(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result == NETCONN_INTERNAL_ERROR || result == OH_HTTP_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_GetPacUrl_NoP_0200
     * @tc.name    : testNetworkManagerNetGetPacUrlNoP0200
     * @tc.desc    : Get the PAC URL of the network.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetGetPacUrlNoP0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetGetPacUrlNoP0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetPacUrl(0);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0100
     * @tc.name    : testNetworkManagerNetCapabilities0100
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })
    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0200
     * @tc.name    : testNetworkManagerNetCapabilities0200
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0300
     * @tc.name    : testNetworkManagerNetCapabilities0300
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_3);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0400
     * @tc.name    : testNetworkManagerNetCapabilities0400
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_4);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0500
     * @tc.name    : testNetworkManagerNetCapabilities0500
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_5);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0600
     * @tc.name    : testNetworkManagerNetCapabilities0600
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_6);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0700
     * @tc.name    : testNetworkManagerNetCapabilities0700
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_7);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0800
     * @tc.name    : testNetworkManagerNetCapabilities0800
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_8);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_0900
     * @tc.name    : testNetworkManagerNetCapabilities0900
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities0900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_9);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_1000
     * @tc.name    : testNetworkManagerNetCapabilities1000
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities1000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_10);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Net_Capabilities_1100
     * @tc.name    : testNetworkManagerNetCapabilities1100
     * @tc.desc    : Test NetCapabilities netCaps interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetCapabilities1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetCapabilities1100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_NetCapabilities_netCaps(CASE_INDEX_11);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })



    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Close_Result_0100
     * @tc.name    : testNetworkManagerWebSocketCloseResult0100
     * @tc.desc    : Test Web socket close interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */

    it('testNetworkManagerWebSocketCloseResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketCloseResult0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.WebSocket_Close_Result(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Close_Result_0200
     * @tc.name    : testNetworkManagerWebSocketCloseResult0200
     * @tc.desc    : Test Web socket close interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketCloseResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketCloseResult0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.WebSocket_Close_Result(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Error_Result_0100
     * @tc.name    : testNetworkManagerWebSocketErrorResult0100
     * @tc.desc    : Test Web socket error interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketErrorResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketErrorResult0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.WebSocket_Error_Result(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Error_Result_0200
     * @tc.name    : testNetworkManagerWebSocketErrorResult0200
     * @tc.desc    : Test Web socket error interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketErrorResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketErrorResult0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.WebSocket_Error_Result(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Open_Result_0100
     * @tc.name    : testNetworkManagerWebSocketOpenResult0100
     * @tc.desc    : Test Web socket open interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketOpenResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketOpenResult0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.WebSocket_Open_Result(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Open_Result_0200
     * @tc.name    : testNetworkManagerWebSocketOpenResult0200
     * @tc.desc    : Test Web socket open interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketOpenResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketOpenResult0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.WebSocket_Open_Result(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_Request_Option_0100
     * @tc.name    : testNetworkManagerWebSocketRequestOption0100
     * @tc.desc    : Test Web socket request option interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketRequestOption0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketRequestOption0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.WebSocket_Request_Options();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })


    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_0100
     * @tc.name    : testNetworkManagerWebSocket0100
     * @tc.desc    : Test Web socket interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_0200
     * @tc.name    : testNetworkManagerWebSocket0200
     * @tc.desc    : Test Web socket interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_0300
     * @tc.name    : testNetworkManagerWebSocket0300
     * @tc.desc    : Test Web socket interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket(CASE_INDEX_3);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_0400
     * @tc.name    : testNetworkManagerWebSocket0400
     * @tc.desc    : Test Web socket interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket(CASE_INDEX_4);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_ErrCode_0100
     * @tc.name    : testNetworkManagerWebSocketErrCode0100
     * @tc.desc    : Test Web socket err code interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketErrCode0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketErrCode0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket_ErrCode(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_ErrCode_0200
     * @tc.name    : testNetworkManagerWebSocketErrCode0200
     * @tc.desc    : Test Web socket err code interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketErrCode0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketErrCode0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket_ErrCode(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_CLIENT_NULL);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_ErrCode_0300
     * @tc.name    : testNetworkManagerWebSocketErrCode0300
     * @tc.desc    : Test Web socket err code interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketErrCode0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketErrCode0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket_ErrCode(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_CLIENT_NOT_CREATED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_WebSocket_ErrCode_0400
     * @tc.name    : testNetworkManagerWebSocketErrCode0400
     * @tc.desc    : Test Web socket err code interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocketErrCode0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocketErrCode0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Web_Socket_ErrCode(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_SEND_DATA_NULL);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetStack_Certificate_PinningKind_0100
     * @tc.name    : testNetworkManagerNetStackCertificatePinningKind0100
     * @tc.desc    : Test PinningKind code interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetStackCertificatePinningKind0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetStackCertificatePinningKind0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetStack_Certificate_PinningKind("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetStack_Hash_Algorithm_0100
     * @tc.name    : testNetworkManagerNetStackHashAlgorithm0100
     * @tc.desc    : Test Hash Algorithm interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetStackHashAlgorithm0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetStackHashAlgorithm0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetStack_Hash_Algorithm("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Public_KeyHash_0100
     * @tc.name    : testNetworkManagerPublicKeyHash0100
     * @tc.desc    : Test Public Key Hash interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerPublicKeyHash0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerPublicKeyHash0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.Public_KeyHash("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetStack_IsCleartextPermitted_0100
     * @tc.name    : testNetworkManagerNetStackIsCleartextPermitted0100
     * @tc.desc    : Test Is Cleartext Permitted interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetStackIsCleartextPermitted0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetStackIsCleartextPermitted0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetStack_IsCleartextPermitted(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetStack_IsCleartextPermitted_0200
     * @tc.name    : testNetworkManagerNetStackIsCleartextPermitted0200
     * @tc.desc    : Test Is Cleartext Permitted interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetStackIsCleartextPermitted0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetStackIsCleartextPermitted0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetStack_IsCleartextPermitted(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetStack_IsCleartextPermittedByHostName_0100
     * @tc.name    : testNetworkManagerNetStackIsCleartextPermittedByHostName0100
     * @tc.desc    : Test Is Cleartext Permitted By Host Name interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetStackIsCleartextPermittedByHostName0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetStackIsCleartextPermittedByHostName0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetStack_IsCleartextPermittedByHostName(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetStack_IsCleartextPermittedByHostName_0200
     * @tc.name    : testNetworkManagerNetStackIsCleartextPermittedByHostName0200
     * @tc.desc    : Test Is Cleartext Permitted By Host Name interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetStackIsCleartextPermittedByHostName0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetStackIsCleartextPermittedByHostName0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetStack_IsCleartextPermittedByHostName(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Net_Addr_0100
     * @tc.name    : testNetworkManagerNetConnNetAddr0100
     * @tc.desc    : Test Net Addr interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnNetAddr0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnNetAddr0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Net_Addr(CASE_INDEX_1, "192.168.1.1");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Net_Addr_0200
     * @tc.name    : testNetworkManagerNetConnNetAddr0200
     * @tc.desc    : Test Net Addr interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnNetAddr0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnNetAddr0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Net_Addr(CASE_INDEX_2, "192.168.1.1");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Net_Addr_0300
     * @tc.name    : testNetworkManagerNetConnNetAddr0300
     * @tc.desc    : Test Net Addr interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnNetAddr0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnNetAddr0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Net_Addr(CASE_INDEX_3, "192.168.1.1");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Net_Addr_0400
     * @tc.name    : testNetworkManagerNetConnNetAddr0400
     * @tc.desc    : Test Net Addr interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnNetAddr0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnNetAddr0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Net_Addr(CASE_INDEX_4, "192.168.1.1");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Route_0100
     * @tc.name    : testNetworkManagerNetConnRoute0100
     * @tc.desc    : Test Route interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnRoute0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnRoute0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_RouteConn(CASE_INDEX_1, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Route_0200
     * @tc.name    : testNetworkManagerNetConnRoute0200
     * @tc.desc    : Test Route interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnRoute0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnRoute0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_RouteConn(CASE_INDEX_2, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Route_0300
     * @tc.name    : testNetworkManagerNetConnRoute0300
     * @tc.desc    : Test Route interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnRoute0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnRoute0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_RouteConn(CASE_INDEX_3, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Route_0400
     * @tc.name    : testNetworkManagerNetConnRoute0400
     * @tc.desc    : Test Route interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnRoute0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnRoute0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_RouteConn(CASE_INDEX_4, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Route_0500
     * @tc.name    : testNetworkManagerNetConnRoute0500
     * @tc.desc    : Test Route interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnRoute0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnRoute0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_RouteConn(CASE_INDEX_5, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Http_Proxy_0100
     * @tc.name    : testNetworkManagerNetConnHttpProxy0100
     * @tc.desc    : Test Http_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnHttpProxy0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnHttpProxy0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Http_Proxy(CASE_INDEX_1, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Http_Proxy_0200
     * @tc.name    : testNetworkManagerNetConnHttpProxy0200
     * @tc.desc    : Test Http_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnHttpProxy0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnHttpProxy0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Http_Proxy(CASE_INDEX_2, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Http_Proxy_0300
     * @tc.name    : testNetworkManagerNetConnHttpProxy0300
     * @tc.desc    : Test Http_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnHttpProxy0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnHttpProxy0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Http_Proxy(CASE_INDEX_3, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Http_Proxy_0400
     * @tc.name    : testNetworkManagerNetConnHttpProxy0400
     * @tc.desc    : Test Http_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnHttpProxy0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnHttpProxy0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Http_Proxy(CASE_INDEX_4, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0100
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0100
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_1, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0200
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0200
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_2, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0300
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0300
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_3, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0400
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0400
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_4, "eth0");

        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0500
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0500
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_5, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0600
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0600
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0600';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_6, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0700
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0700
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0700';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_7, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0800
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0800
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0800';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_8, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_0900
     * @tc.name    : testNetworkManagerNetConnConnectionProperties0900
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties0900';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_9, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_1000
     * @tc.name    : testNetworkManagerNetConnConnectionProperties1000
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties1000';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_10, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_Connection_Properties_1100
     * @tc.name    : testNetworkManagerNetConnConnectionProperties1100
     * @tc.desc    : Test Connection_Properties interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnConnectionProperties1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnConnectionProperties1100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_Connection_Properties(CASE_INDEX_11, "eth0");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_NetHandle_List_0100
     * @tc.name    : testNetworkManagerNetConnNetHandleList0100
     * @tc.desc    : Test NetHandle_List interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnNetHandleList0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnNetHandleList0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_NetHandle_List(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NetConn_NetHandle_List_0200
     * @tc.name    : testNetworkManagerNetConnNetHandleList0200
     * @tc.desc    : Test NetHandle_List interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNetConnNetHandleList0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNetConnNetHandleList0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_NetHandle_List(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NETCONN_PERMISSION_DENIED_NoP_0100
     * @tc.name    : testNetworkManagerNETCONNPERMISSIONDENIEDNoP0100
     * @tc.desc    : Test NETCONN_PERMISSION_DENIED error code.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNETCONNPERMISSIONDENIEDNoP0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNETCONNPERMISSIONDENIEDNoP0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetConnectionTest.NetConn_SetPacUrl("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_NETCONN_PARAMETER_ERROR_0100
     * @tc.name    : testNetworkManagerNETCONNPARAMETERERROR0100
     * @tc.desc    : test NETCONN_PARAMETER_ERROR error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerNETCONNPARAMETERERROR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerNETCONNPARAMETERERROR0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_GetPacUrl(0);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_RegisterDnsResolver_0100
     * @tc.name    : testNetworkManagerRegisterDnsResolver0100
     * @tc.desc    : test NETCONN_PARAMETER_ERROR error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerRegisterDnsResolver0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerRegisterDnsResolver0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Register_DnsResolver(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Register_DnsResolver_0200
     * @tc.name    : testNetworkManagerRegisterDnsResolver0200
     * @tc.desc    : test Register_DnsResolver error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerRegisterDnsResolver0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerRegisterDnsResolver0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Register_DnsResolver(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Unregister_DnsResolver_0100
     * @tc.name    : testNetworkManagerUnregisterDnsResolver0100
     * @tc.desc    : test Unregister_DnsResolver error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerUnregisterDnsResolver0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerUnregisterDnsResolver0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Unregister_DnsResolver(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Unregister_DnsResolver_0200
     * @tc.name    : testNetworkManagerUnregisterDnsResolver0200
     * @tc.desc    : test Unregister_DnsResolver error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerUnregisterDnsResolver0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerUnregisterDnsResolver0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Unregister_DnsResolver(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
    /**
     * @tc.number  : SUB_NetworkManager_Unregister_DnsResolver_0300
     * @tc.name    : testNetworkManagerUnregisterDnsResolver0300
     * @tc.desc    : test Unregister_DnsResolver error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerUnregisterDnsResolver0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerUnregisterDnsResolver0300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Unregister_DnsResolver(CASE_INDEX_3);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Unregister_DnsResolver_0400
     * @tc.name    : testNetworkManagerUnregisterDnsResolver0400
     * @tc.desc    : test Unregister_DnsResolver error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerUnregisterDnsResolver0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerUnregisterDnsResolver0400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Unregister_DnsResolver(CASE_INDEX_4);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Register_DefaultCallback_0100
     * @tc.name    : testNetworkManagerRegisterDefaultCallback0100
     * @tc.desc    : test Register_DefaultCallback error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerRegisterDefaultCallback0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerRegisterDefaultCallback0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.Register_DetCallback(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_QueryProbeResult_0100
     * @tc.name    : testNetworkManagerQueryProbeResult0100
     * @tc.desc    : test QueryProbeResult error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerQueryProbeResult0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerQueryProbeResult0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetCon_QueryProResult(CASE_INDEX_1, 'www.baidu.com');
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_QueryTraceRoute_0100
     * @tc.name    : testNetworkManagerQueryTraceRoute0100
     * @tc.desc    : test QueryTraceRoute error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerQueryTraceRoute0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerQueryTraceRoute0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_QueryTrRout(CASE_INDEX_1, 'www.baidu.com');
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_QueryTraceRoute_0200
     * @tc.name    : testNetworkManagerQueryTraceRoute0200
     * @tc.desc    : test QueryTraceRoute error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerQueryTraceRoute0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerQueryTraceRoute0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_QueryTrRout(CASE_INDEX_2, 'www.baidu.com');
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_OH_NetConn_FreeDnsResult_0100
     * @tc.name    : testNetworkManagerOHNetConnFreeDnsResult0100
     * @tc.desc    : test FreeDnsResult error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerOHNetConnFreeDnsResult0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerOHNetConnFreeDnsResult0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_QueryTrRout(CASE_INDEX_1, 'www.baidu.com');
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
    
    /**
     * @tc.number  : SUB_NetworkManager_OH_NetConn_BindSocket_0100
     * @tc.name    : testNetworkManagerOHNetConnBindSocket0100
     * @tc.desc    : test BindSocket error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerOHNetConnBindSocket0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerOHNetConnBindSocket0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.NetConn_BindSocket(1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_GetCertificatesHost_Auth_0100
     * @tc.name    : testNetworkManagerGetCertificatesHostAuth0100
     * @tc.desc    : test NetStack_GetCertificatesHost error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerGetCertificatesHostAuth0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerGetCertificatesHostAuth0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionTest.GetCertificatesHost('www.baidu.com');
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
  })
}
