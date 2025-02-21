/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterAll, afterEach } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import vpnExtension from '@ohos.net.vpnExtension';
import connect from '@ohos.net.connection';
import VpnExtensionAbility from '@ohos.app.ability.VpnExtensionAbility';
import vpn from '@ohos.net.vpn';
import common from '@ohos.app.ability.common';
import socket from "@ohos.net.socket";

let socketFd = 38;
let tag = 'Geegee';
let context1: vpn.AbilityContext = getContext(this) as common.UIAbilityContext;
let context2: vpnExtension.VpnExtensionContext;
let cc = connect.NetBearType.BEARER_VPN;
let address: vpn.LinkAddress = {
  address: {
    address: "10.0.0.5",
    family: 1
  },
  prefixLength: 24
}

let adress1: vpnExtension.LinkAddress = {
  address: {
    address: "10.0.0.10",
    family: 1
  },
  prefixLength: 24
}

let routeInfo: vpn.RouteInfo = {
  interface: '',
  destination: {
    address: {
      address: "10.0.0.10",
      family: 1
    },
    prefixLength: 24
  },
  gateway: {
    address: '192.168.0.1',
    family: 1,
    port: 8080
  },
  hasGateway: true,
  isDefaultRoute: true
}

let routeInfo1: vpnExtension.RouteInfo = {
  interface: '',
  destination: {
    address: {
      address: "10.0.0.10",
      family: 1
    },
    prefixLength: 24
  },
  gateway: {
    address: '192.168.0.1',
    family: 1,
    port: 8080
  },
  hasGateway: true,
  isDefaultRoute: true
}

let config: vpnExtension.VpnConfig = {
  addresses: [{
    address: {
      address: '10.0.0.5',
      family: 1
    },
    prefixLength: 24
  }],
  routes: [],
  dnsAddresses: ["114.114.114.114"],
  searchDomains: [],
  mtu: 1400,
  isIPv4Accepted: true,
  isIPv6Accepted: false,
  isInternal: true,
  isBlocking: false,
  trustedApplications: [],
  blockedApplications: ["com.example.vpn_xts"]
}

export class vpnExtAbility extends VpnExtensionAbility {
  onCreate(want: Want): void {
    let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
    vpnConnection.protect(socketFd).then(() => {
      console.log(tag + `protect success`);
    }).catch((err: BusinessError) => {
      console.log(tag + `protect fail ${JSON.stringify(err)}`);
    });
    vpnConnection.create(config).then(() => {
      console.log(tag + 'create success');
    }).catch((err: BusinessError) => {
      console.log(tag + `create fail ${JSON.stringify(err)}`);
    })
  }
  onDestroy(): void {
    let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
    vpnConnection.destroy().then(() => {
      console.log(tag + 'destroy success');
    }).catch((err: BusinessError) => {
      console.log(tag + `destroy fail ${JSON.stringify(err)}`);
    })
  }
}

export default function NetworkManagerVpnTest() {
  describe('NetworkManagerVpnTest', () => {
    beforeAll(async () => {
      console.log('NetworkManager_ActsNetworkManagerVpnTest beforeAll start');
      console.log('NetworkManager_ActsNetworkManagerVpnTest beforeAll end');
    });
    afterAll(async () => {
      console.log('NetworkManager_ActsNetworkManagerVpnTest afterAll start');
      console.log('NetworkManager_ActsNetworkManagerVpnTest afterAll end');
    });

    /**
     * @tc.number: SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0100
     * @tc.name: Test startVpnExtensionAbility() interface
     * @tc.desc: Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0100';
      let want: Want = {};
      try {
        vpnExtension.startVpnExtensionAbility(want);
        console.log(`${caseName} startVpnExtensionAbility success`);
        done();
      }
      catch (error) {
        console.log(`${caseName} startVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200
     * @tc.name: Test startVpnExtensionAbility() interface
     * @tc.desc: Function test
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200';
      try {
        vpnExtension.startVpnExtensionAbility(null);
        console.log(`${caseName} startVpnExtensionAbility success`);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.log(`${caseName} startVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_createVpnConnection_Async_0100
     * @tc.name: Test createVpnConnection() interface
     * @tc.desc: Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_createVpnConnection_Async_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_createVpnConnection_Async_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        console.log(`${caseName} create success`);
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_createVpnConnection_Async_0200
     * @tc.name: Test createVpnConnection() interface
     * @tc.desc: Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_createVpnConnection_Async_0200', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_createVpnConnection_Async_0200';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(null);
        console.log(`${caseName} create success`);
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_setAlwaysOnVpnEnabled_Promise_0100
     * @tc.name: Test setAlwaysOnVpnEnabled() interface
     * @tc.desc: Function test
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_setAlwaysOnVpnEnabled_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_setAlwaysOnVpnEnabled_Promise_0100';
      try {
        vpnExtension.setAlwaysOnVpnEnabled(true, 'com.example.vpn_xts');
        console.log(`${caseName} setAlwaysOnVpnEnabled success`);
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code == undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_isAlwaysOnVpnEnabled_Promise_0100
     * @tc.name: Test isAlwaysOnVpnEnabled() interface
     * @tc.desc: Function test
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_isAlwaysOnVpnEnabled_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_isAlwaysOnVpnEnabled_Promise_0100';
      try {
        vpnExtension.isAlwaysOnVpnEnabled('com.example.vpn_xts');
        console.log(`${caseName} isAlwaysOnVpnEnabled success`);
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code == undefined).assertTrue();
        done();
      }
    })
    /**
     * @tc.number: SUB_NetworkManager_VPN_create_Promise_0100
     * @tc.name: Test create() interface
     * @tc.desc: Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_create_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.create(config).then(() => {
          console.log(`${caseName} create success`);
          expect().assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} create fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_create_Promise_0200
     * @tc.name: Test create() interface
     * @tc.desc: Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_create_Promise_0200', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_0200';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.create(null).then(() => {
          console.log(`${caseName} create success`);
          expect().assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} create fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_protect_Promise_0100
     * @tc.name: Test protect() interface
     * @tc.desc: Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_protect_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_protect_Promise_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.protect(socketFd).then(() => {
          console.log(`${caseName} protect success`);
          expect().assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} protect fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_protect_Promise_0200
     * @tc.name: Test protect() interface
     * @tc.desc: Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_protect_Promise_0200', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_protect_Promise_0200';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.protect(null).then(() => {
          console.log(`${caseName} protect success`);
          expect().assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} protect fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_destroy_Promise_0100
     * @tc.name: Test destroy() interface
     * @tc.desc: Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.destroy().then(() => {
          console.log(`${caseName} destroy success`);
          expect().assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} destroy fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      }
      catch (error) {
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0100
     * @tc.name: Test stopVpnExtensionAbility() interface
     * @tc.desc: Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0100', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0100';
      let want: Want = {};
      try {
        vpnExtension.stopVpnExtensionAbility(want);
        console.log(`${caseName} stopVpnExtensionAbility success`);
        done();
      }
      catch (error) {
        console.log(`${caseName} stopVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200
     * @tc.name: Test stopVpnExtensionAbility() interface
     * @tc.desc: Function test
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200', 0, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200';
      try {
        vpnExtension.stopVpnExtensionAbility(null);
        console.log(`${caseName} stopVpnExtensionAbility success`);
        done();
      }
      catch (error) {
        console.log(`${caseName} stopVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })
  });
}