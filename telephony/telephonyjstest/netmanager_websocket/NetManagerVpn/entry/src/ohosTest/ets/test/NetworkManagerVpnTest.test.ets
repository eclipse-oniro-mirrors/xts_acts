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

import { describe, it, expect, beforeAll, afterAll, afterEach, TestType, Size, Level } from '@ohos/hypium';
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

let vpnConfig: vpnExtension.VpnConfig = {
  vpnId: '123456',
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
     * @tc.name   testNetworkManagerVPNstartVpnExtensionAbilityPromise0100
     * @tc.number SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNstartVpnExtensionAbilityPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNstartVpnExtensionAbilityPromise0100';
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
     * @tc.name   SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200
     * @tc.number SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0200';
      try {
        vpnExtension.startVpnExtensionAbility(null);
        console.log(`${caseName} startVpnExtensionAbility success`);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.log(`${caseName} startVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0300
     * @tc.number SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0300';
      try {
        vpnExtension.startVpnExtensionAbility(undefined);
        console.log(`${caseName} startVpnExtensionAbility success`);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.log(`${caseName} startVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNcreateVpnConnectionAsync0100
     * @tc.number SUB_NetworkManager_VPN_createVpnConnection_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNcreateVpnConnectionAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNcreateVpnConnectionAsync0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        console.log(`${caseName} create success`);
        expect(vpnInstance != undefined).assertTrue();
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_createVpnConnection_Async_0200
     * @tc.number SUB_NetworkManager_VPN_createVpnConnection_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_createVpnConnection_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_createVpnConnection_Async_0200';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(null);
        console.log(`${caseName} create success`);
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_createVpnConnection_Async_0300
     * @tc.number SUB_NetworkManager_VPN_createVpnConnection_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_createVpnConnection_Async_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_createVpnConnection_Async_0300';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(undefined);
        console.log(`${caseName} create success`);
        expect().assertTrue();
        done();
      }
      catch (error) {
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNsetAlwaysOnVpnEnabledPromise0100
     * @tc.number SUB_NetworkManager_VPN_setAlwaysOnVpnEnabled_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNsetAlwaysOnVpnEnabledPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNsetAlwaysOnVpnEnabledPromise0100';
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
     * @tc.name   testNetworkManagerVPNisAlwaysOnVpnEnabledPromise0100
     * @tc.number SUB_NetworkManager_VPN_isAlwaysOnVpnEnabled_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNisAlwaysOnVpnEnabledPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNisAlwaysOnVpnEnabledPromise0100';
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
     * @tc.name   testNetworkManagerVPNcreatePromise0100
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNcreatePromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNcreatePromise0100';
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_create_Promise_0200
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_create_Promise_0300
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_0300';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.create(vpnConfig).then(() => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_create_Promise_0400
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_0400';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.create(undefined).then(() => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_create_Promise_0500
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_0500';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        let vpnConfig: vpnExtension.VpnConfig = {
          vpnId: '123456',
          addresses: [],
          routes: [],
          dnsAddresses: [],
          searchDomains: [""],
          mtu: 1400,
          isIPv4Accepted: false,
          isIPv6Accepted: true,
          isInternal: false,
          isBlocking: true,
          trustedApplications: [""],
          blockedApplications: []
        }
        vpnInstance.create(vpnConfig).then(() => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_create_Promise_0600
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_0600';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        let vpnConfig: vpnExtension.VpnConfig = {
          vpnId: '123456',
          addresses: [],
          routes: [{
            interface: "eth0",
            destination: {
              address: {
                address:'',
                family:1,
                port:8080
              },
              prefixLength:1
            },
            gateway: {
              address:'',
              family:1,
              port:8080
            },
            hasGateway: true,
            isDefaultRoute: true,
          }],
          dnsAddresses: [""],
          searchDomains: ["114.114.114.114"],
          mtu: 1400,
          isIPv4Accepted: false,
          isIPv6Accepted: true,
          isInternal: false,
          isBlocking: true,
          trustedApplications: ["com.example.vpn_xts"],
          blockedApplications: [""]
        }
        vpnInstance.create(vpnConfig).then(() => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_protect_Promise_0100
     * @tc.number SUB_NetworkManager_VPN_protect_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_protect_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_protect_Promise_0200
     * @tc.number SUB_NetworkManager_VPN_protect_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_protect_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_protect_Promise_0300
     * @tc.number SUB_NetworkManager_VPN_protect_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_protect_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_protect_Promise_0300';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.protect(undefined).then(() => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_destroy_Promise_0100
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
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
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNstopVpnExtensionAbilityPromise0100
     * @tc.number SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNstopVpnExtensionAbilityPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNstopVpnExtensionAbilityPromise0100';
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
     * @tc.name   SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200
     * @tc.number SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0200';
      try {
        vpnExtension.stopVpnExtensionAbility(null);
        console.log(`${caseName} stopVpnExtensionAbility success`);
        done();
      }
      catch (error) {
        console.log(`${caseName} stopVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0300
     * @tc.number SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0300';
      try {
        vpnExtension.stopVpnExtensionAbility(undefined);
        console.log(`${caseName} stopVpnExtensionAbility success`);
        done();
      }
      catch (error) {
        console.log(`${caseName} stopVpnExtensionAbility fail ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_generateVpnId_Promise_0100
     * @tc.number SUB_NetworkManager_VPN_generateVpnId_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_generateVpnId_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_generateVpnId_Promise_0100';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
        vpnConnection.generateVpnId().then((data: string) => {
          console.log(`${caseName} generateVpnId success ${JSON.stringify(data)}`);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} generateVpnId fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(`${caseName} generateVpnId error ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_destroy_Promise_0200
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_0200';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
        let vpnId: string = "test";
        vpnConnection.destroy(vpnId).then(() => {
          console.log(`${caseName} destroy success`);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} destroy fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(`${caseName} destroy error ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_destroy_Promise_0300
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_0300';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
        vpnConnection.destroy(null).then(() => {
          console.log(`${caseName} destroy success`);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} destroy fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(`${caseName} destroy error ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_destroy_Promise_0400
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_0400';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
        vpnConnection.destroy(undefined).then(() => {
          console.log(`${caseName} destroy success`);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} destroy fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.log(`${caseName} destroy error ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_NetworkManager_VPN_destroy_Promise_0500
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_0500';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2);
        vpnConnection.destroy("").then(() => {
          console.log(`${caseName} destroy success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} destroy fail ${JSON.stringify(err)}`);
          expect(err.code === 401).assertTrue();
          done();
        })
      } catch (error) {
        console.log(`${caseName} destroy error ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNContext0100
     * @tc.number SUB_NetworkManager_VPN_context_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNContext0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNContext0100';
      try {
        let vpnExtensionAbility = new VpnExtensionAbility();
        console.log(`${caseName} context ${JSON.stringify(vpnExtensionAbility.context)}`);
        expect(vpnExtensionAbility.context == undefined).assertTrue();
        done();
      } catch (error) {
        console.log(`${caseName} destroy error ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   testNetworkManagerVPNProtectProcessNetPromise0100
     * @tc.number SUB_NetworkManager_VPN_ProtectProcessNet_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkManagerVPNProtectProcessNetPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testNetworkManagerVPNProtectProcessNetPromise0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2);
        vpnInstance.protectProcessNet().then(() => {
          console.log(`${caseName} protectProcessNet success`);
          expect().assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} protectProcessNet fail ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
      }
      catch (error) {
        expect(error.code === 401).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   testNetworkManagerVPNcreateVpnObserver0100
     * @tc.number SUB_NetworkManager_VPN_createVpnObserver_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNcreateVpnObserver0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNcreateVpnObserver0100';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        console.log(`${caseName} createVpnObserver success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} createVpnObserver fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNonAuthorizationResult0100
     * @tc.number SUB_NetworkManager_VPN_onAuthorizationResult_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNonAuthorizationResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNonAuthorizationResult0100';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        vpnObserver.onAuthorizationResult((result: boolean) => {
          console.log(`${caseName} onAuthorizationResult callback ${result}`);
            expect(result === true).assertTrue();
        });
        console.log(`${caseName} onAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} onAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNonAuthorizationResult0200
     * @tc.number SUB_NetworkManager_VPN_onAuthorizationResult_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNonAuthorizationResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNonAuthorizationResult0200';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        vpnObserver.onAuthorizationResult((result: boolean) => {
          console.log(`${caseName} onAuthorizationResult callback ${result}`);
        });
        console.log(`${caseName} onAuthorizationResult success`);
        vpnObserver.onAuthorizationResult((result: boolean) => {
          console.log(`${caseName} onAuthorizationResult callback ${result}`);
        });
        console.log(`${caseName} onAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} onAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNonAuthorizationResult0300
     * @tc.number SUB_NetworkManager_VPN_onAuthorizationResult_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNonAuthorizationResult0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNonAuthorizationResult0300';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        vpnObserver.onAuthorizationResult((result: boolean) => {
          console.log(`${caseName} onAuthorizationResult callback ${result}`);
            expect(result === false).assertTrue();
        });
        console.log(`${caseName} onAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} onAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNoffAuthorizationResult0100
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult0100';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          console.log(`${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.onAuthorizationResult(callback);
        vpnObserver.offAuthorizationResult(callback);
        console.log(`${caseName} offAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} offAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNoffAuthorizationResult0200
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult0200';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          console.log(`${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.offAuthorizationResult(callback);
        console.log(`${caseName} offAuthorizationResult success`);
        console.log(`${caseName} vpnObserver = ${JSON.stringify(vpnObserver)}`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} offAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNoffAuthorizationResult0300
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult0300';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          console.log(`${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.offAuthorizationResult(callback);
        console.log(`${caseName} offAuthorizationResult success`);
        vpnObserver.offAuthorizationResult(callback);
        console.log(`${caseName} offAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} offAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkManagerVPNoffAuthorizationResult0400
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult0400';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          console.log(`${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.onAuthorizationResult(callback);
        vpnObserver.offAuthorizationResult();
        console.log(`${caseName} offAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      }
      catch (error) {
        console.log(`${caseName} offAuthorizationResult fail ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

  });
}