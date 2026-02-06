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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, NETWORK_ETH_LOCAL, NETWORK_ETH_INVALID, INVALID_WANT,
  DEFAULT_ACCOUNT_ID, INVALID_ACCOUNT_ID } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import networkManager from '@ohos.enterprise.networkManager';
import connection from '@ohos.net.connection';
import sysDeviceInfo from '@ohos.deviceInfo';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import sim from '@ohos.telephony.sim';

const HTTP_PROXY: connection.HttpProxy = {
  host: '9090',
  port: 192,
  exclusionList: ['192.168.2.2']
}

const FIREWALL_RULE: networkManager.FirewallRule = {
  srcAddr: '192.168.1.1-192.168.1.22',
  destAddr: '192.168.2.1',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.OUTPUT,
  action: networkManager.Action.DENY,
  protocol: networkManager.Protocol.UDP
}

const FIREWALL_RULE2: networkManager.FirewallRule = {
  srcAddr: '192.168.44.1-192.188.33.77',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.TCP
}

const FIREWALL_RULE3: networkManager.FirewallRule = {
  srcAddr: '192.168.55.1-192.188.44.88',
  srcPort: '7171,8888',
  destPort: '6161',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.ICMP
}

const FIREWALL_RULE4: networkManager.FirewallRule = {
  srcAddr: '192.168.3.1-192.188.22.66',
  srcPort: '7070,9999',
  destPort: '6060',
  appUid: '9696',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.ALL
}

const FIREWALL_RULE5: networkManager.FirewallRule = {
  srcAddr: '192.168.1.1-192.168.1.22',
  destAddr: '192.168.2.1',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP
}

const FIREWALL_RULE6: networkManager.FirewallRule = {
  srcAddr: '192.168.1.1-192.168.1.22',
  destAddr: '192.168.2.1',
  srcPort: '8080',
  destPort: '8080',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP
}

const DOMAIN_FILTER_RULE: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  action: networkManager.Action.DENY
};

const DOMAIN_FILTER_RULE2: networkManager.DomainFilterRule = {
  domainName: 'www.6666.com',
  appUid: '9797',
  action: networkManager.Action.ALLOW
};

const DOMAIN_FILTER_RULE3: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT
};

const DOMAIN_FILTER_RULE4: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT
};

const ADD_APN_INFO: Record<string, string> = {
  "apn": "TEST_ADD_APN",
  "mcc": "TEST_ADD_MCC",
  "mnc": "TEST_ADD_MNC",
  "apnName": "TEST_ADD_APN_NAME",
  "proxy": "TEST_ADD_PROXY",
};

const UPDATE_APN_INFO: Record<string, string> = {
  "apn": "TEST_UPDATE_APN",
  "proxy": "TEST_UPDATE_PROXY",
};

const HAS_ACTIVE_SIM = (): boolean => {
  let count: number = sim.getMaxSimCount();
  if (count > 0) {
    for (let i = 0; i < count; ++i) {
      if (sim.isSimActiveSync(i)) {
        console.log("sim.hasSimCardSync(i) == true")
        return true;
      }
    }
  }
  console.log("sim.hasSimCardSync(i) == false")
  return false;
}

export default function networkManagerTest() {
  describe('networkManager_test', () => {
    testGetAllNetworkInterfacesSync();
    testGetIpAddressSync();

    testGetMacSync();

    testIsNetworkInterfaceDisabledSync();
    testSetNetworkInterfaceDisabledSync();

    testSetGlobalProxySync();
    testGetGlobalProxySync();

    testAddFirewallRule();
    testRemoveFirewallRule();
    testGetFirewallRules();

    testAddDomainFilterRule();
    testRemoveDomainFilterRule();
    testGetDomainFilterRules();

    testSetGlobalProxyForAccount();
    testGetGlobalProxyForAccount();

    testTurnOnMobileData();
    testTurnOffMobileData();

    testAddApn();
    testDeleteApn();
    testUpdateApn();
    testSetPreferredApn();
    testQueryApn();
  })
}

function testGetAllNetworkInterfacesSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0100
   * @tc.name      : test_get_all_network_interfaces_sync_0100
   * @tc.desc      : test networkManager getAllNetworkInterfacesSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_all_network_interfaces_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getAllNetworkInterfacesSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0101
   * @tc.name      : test_get_all_network_interfaces_sync_0101
   * @tc.desc      : test networkManager getAllNetworkInterfacesSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_all_network_interfaces_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getAllNetworkInterfacesSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0102
   * @tc.name      : test_get_all_network_interfaces_sync_0102
   * @tc.desc      : test networkManager getAllNetworkInterfacesSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_all_network_interfaces_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getAllNetworkInterfacesSync(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0103
   * @tc.name      : test_get_all_network_interfaces_sync_0103
   * @tc.desc      : test networkManager getAllNetworkInterfacesSync success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_all_network_interfaces_sync_0103", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: Array<string> = networkManager.getAllNetworkInterfacesSync(SELFWANT);
      expect(result).not().assertUndefined();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetIpAddressSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0100
   * @tc.name      : test_get_ip_address_sync_0100
   * @tc.desc      : test networkManager getIpAddressSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ip_address_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getIpAddressSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0101
   * @tc.name      : test_get_ip_address_sync_0101
   * @tc.desc      : test networkManager getIpAddressSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ip_address_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getIpAddressSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0102
   * @tc.name      : test_get_ip_address_sync_0102
   * @tc.desc      : test networkManager getIpAddressSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ip_address_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getIpAddressSync(INVALID_WANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0103
   * @tc.name      : test_get_ip_address_sync_0103
   * @tc.desc      : test networkManager getIpAddressSync with local network interface success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ip_address_sync_0103", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = networkManager.getIpAddressSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(result !== '').assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetMacSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0100
   * @tc.name      : test_get_mac_sync_0100
   * @tc.desc      : test networkManager getMacSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_mac_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getMacSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0101
   * @tc.name      : test_get_mac_sync_0101
   * @tc.desc      : test networkManager getMacSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_mac_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getMacSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0102
   * @tc.name      : test_get_mac_sync_0102
   * @tc.desc      : test networkManager getMacSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_mac_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getMacSync(INVALID_WANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0103
   * @tc.name      : test_get_mac_sync_0103
   * @tc.desc      : test networkManager getMacSync success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_mac_sync_0103", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = networkManager.getMacSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(result !== '').assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testIsNetworkInterfaceDisabledSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.name      : test_is_network_interface_disable_sync_0100
   * @tc.desc      : test networkManager isNetworkInterfaceDisabledSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0101
   * @tc.name      : test_is_network_interface_disable_sync_0101
   * @tc.desc      : test networkManager isNetworkInterfaceDisabledSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0102
   * @tc.name      : test_is_network_interface_disable_sync_0102
   * @tc.desc      : test networkManager isNetworkInterfaceDisabledSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.isNetworkInterfaceDisabledSync(INVALID_WANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0103
   * @tc.name      : test_is_network_interface_disable_sync_0103
   * @tc.desc      : test networkManager isNetworkInterfaceDisabledSync success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0103", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(result !== undefined).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0104
   * @tc.name      : test_is_network_interface_disable_sync_0104
   * @tc.desc      : test networkManager isNetworkInterfaceDisabledSync with invalid network interface
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_INVALID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetNetworkInterfaceDisabledSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.name      : test_set_network_interface_disable_sync_0100
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_network_interface_disable_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0101
   * @tc.name      : test_set_network_interface_disable_sync_0101
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_network_interface_disable_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0102
   * @tc.name      : test_set_network_interface_disable_sync_0102
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setNetworkInterfaceDisabledSync(INVALID_WANT, NETWORK_ETH_LOCAL, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0103
   * @tc.name      : test_set_network_interface_disable_sync_0103
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync with invalid network interface
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_network_interface_disable_sync_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_INVALID, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0104
   * @tc.name      : test_set_network_interface_disable_sync_0104
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync false
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_network_interface_disable_sync_0104", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL, false);
      expect(networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0105
   * @tc.name      : test_set_network_interface_disable_sync_0105
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync true
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_network_interface_disable_sync_0105", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL, true);
      expect(networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL)).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetGlobalProxySync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.name      : test_set_global_proxy_sync_0100
   * @tc.desc      : test networkManager setGlobalProxySync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setGlobalProxySync(SELFWANT, HTTP_PROXY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0101
   * @tc.name      : test_set_global_proxy_sync_0101
   * @tc.desc      : test networkManager setGlobalProxySync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setGlobalProxySync(SELFWANT, HTTP_PROXY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0102
   * @tc.name      : test_set_global_proxy_sync_0102
   * @tc.desc      : test networkManager setGlobalProxySync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setGlobalProxySync(INVALID_WANT, HTTP_PROXY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0103
   * @tc.name      : test_set_global_proxy_sync_0103
   * @tc.desc      : test networkManager setGlobalProxySync success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_sync_0103", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let originProxy: connection.HttpProxy = networkManager.getGlobalProxySync(SELFWANT);
    try {
      networkManager.setGlobalProxySync(SELFWANT, HTTP_PROXY);
      let proxy: connection.HttpProxy = networkManager.getGlobalProxySync(SELFWANT);
      expect(proxy.host === HTTP_PROXY.host).assertTrue();
      expect(proxy.port === HTTP_PROXY.port).assertTrue();
      expect(proxy.exclusionList.length === HTTP_PROXY.exclusionList.length).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      networkManager.setGlobalProxySync(SELFWANT, originProxy);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetGlobalProxySync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.name      : test_get_global_proxy_sync_0100
   * @tc.desc      : test networkManager getGlobalProxySync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getGlobalProxySync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0101
   * @tc.name      : test_get_global_proxy_sync_0101
   * @tc.desc      : test networkManager getGlobalProxySync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getGlobalProxySync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0102
   * @tc.name      : test_get_global_proxy_sync_0102
   * @tc.desc      : test networkManager getGlobalProxySync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getGlobalProxySync(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddFirewallRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0100
   * @tc.name      : test_add_firewall_rule_0100
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0101
   * @tc.name      : test_add_firewall_rule_0101
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0101", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE2);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0102
   * @tc.name      : test_add_firewall_rule_0102
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0102", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE3);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0103
   * @tc.name      : test_add_firewall_rule_0103
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0103", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE4);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0104
   * @tc.name      : test_add_firewall_rule_0104
   * @tc.desc      : test networkManager addFirewallRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0105
   * @tc.name      : test_add_firewall_rule_0105
   * @tc.desc      : test networkManager addFirewallRule with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(INVALID_WANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0106
   * @tc.name      : test_add_firewall_rule_0106
   * @tc.desc      : test networkManager addFirewallRule with invalid param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(INVALID_WANT, FIREWALL_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0107
   * @tc.name      : test_add_firewall_rule_0107
   * @tc.desc      : test networkManager addFirewallRule
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE6);
      let firewallRules: Array<networkManager.FirewallRule>;
      firewallRules = networkManager.getFirewallRules(SELFWANT);
      expect(firewallRules.length == 1).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeFirewallRule(SELFWANT);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });
}

function testRemoveFirewallRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0100
   * @tc.name      : test_remove_firewall_rule_0100
   * @tc.desc      : test networkManager removeFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0101
   * @tc.name      : test_remove_firewall_rule_0101
   * @tc.desc      : test networkManager removeFirewallRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeFirewallRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0102
   * @tc.name      : test_remove_firewall_rule_0102
   * @tc.desc      : test networkManager removeFirewallRule with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeFirewallRule(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0103
   * @tc.name      : test_remove_firewall_rule_0103
   * @tc.desc      : test networkManager removeFirewallRule with invalid param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0104
   * @tc.name      : test_remove_firewall_rule_0104
   * @tc.desc      : test networkManager removeFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0104", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0105
   * @tc.name      : test_remove_firewall_rule_0105
   * @tc.desc      : test networkManager removeFirewallRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0106
   * @tc.name      : test_remove_firewall_rule_0106
   * @tc.desc      : test networkManager removeFirewallRule
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE6);
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE6);
      let firewallRules: Array<networkManager.FirewallRule>;
      firewallRules = networkManager.getFirewallRules(SELFWANT);
      expect(firewallRules.length == 0).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeFirewallRule(SELFWANT);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });
}

function testGetFirewallRules() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0100
   * @tc.name      : test_get_firewall_rules_0100
   * @tc.desc      : test networkManager getFirewallRules without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_firewall_rules_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getFirewallRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0101
   * @tc.name      : test_get_firewall_rules_0101
   * @tc.desc      : test networkManager getFirewallRules with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_firewall_rules_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getFirewallRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0102
   * @tc.name      : test_get_firewall_rules_0102
   * @tc.desc      : test networkManager getFirewallRules with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_firewall_rules_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getFirewallRules(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddDomainFilterRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0100
   * @tc.name      : test_add_domain_filter_rule_0100
   * @tc.desc      : test networkManager addDomainFilterRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_domain_filter_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0101
   * @tc.name      : test_add_domain_filter_rule_0101
   * @tc.desc      : test networkManager addDomainFilterRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_domain_filter_rule_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0102
   * @tc.name      : test_add_domain_filter_rule_0102
   * @tc.desc      : test networkManager addDomainFilterRule with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_domain_filter_rule_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(INVALID_WANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0103
   * @tc.name      : test_add_domain_filter_rule_0103
   * @tc.desc      : test networkManager addDomainFilterRule with invalid param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_domain_filter_rule_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE3);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0104
   * @tc.name      : test_add_domain_filter_rule_0104
   * @tc.desc      : test networkManager addDomainFilterRule
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_domain_filter_rule_0104", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE4);
      let domainFilterRules: Array<networkManager.DomainFilterRule>;
      domainFilterRules = networkManager.getDomainFilterRules(SELFWANT);
      expect(domainFilterRules.length == 1).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeDomainFilterRule(SELFWANT);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  })
}

function testRemoveDomainFilterRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0100
   * @tc.name      : test_remove_domain_filter_rule_0100
   * @tc.desc      : test networkManager removeDomainFilterRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0101
   * @tc.name      : test_remove_domain_filter_rule_0101
   * @tc.desc      : test networkManager removeDomainFilterRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeDomainFilterRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0102
   * @tc.name      : test_remove_domain_filter_rule_0102
   * @tc.desc      : test networkManager removeDomainFilterRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE3);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0103
   * @tc.name      : test_remove_domain_filter_rule_0103
   * @tc.desc      : test networkManager removeDomainFilterRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0103", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0104
   * @tc.name      : test_remove_domain_filter_rule_0104
   * @tc.desc      : test networkManager removeDomainFilterRule with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0105
   * @tc.name      : test_remove_domain_filter_rule_0105
   * @tc.desc      : test networkManager removeDomainFilterRule with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeDomainFilterRule(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0106
   * @tc.name      : test_remove_domain_filter_rule_0106
   * @tc.desc      : test networkManager removeDomainFilterRule
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE4);
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE4);
      let domainFilterRules: Array<networkManager.DomainFilterRule>;
      domainFilterRules = networkManager.getDomainFilterRules(SELFWANT);
      expect(domainFilterRules.length == 0).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeDomainFilterRule(SELFWANT);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  })
}

function testGetDomainFilterRules() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0100
   * @tc.name      : test_get_domain_filter_rules_0100
   * @tc.desc      : test networkManager getDomainFilterRules without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_domain_filter_rules_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getDomainFilterRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0101
   * @tc.name      : test_get_domain_filter_rules_0101
   * @tc.desc      : test networkManager getDomainFilterRules with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_domain_filter_rules_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getDomainFilterRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0102
   * @tc.name      : test_get_domain_filter_rules_0102
   * @tc.desc      : test networkManager getDomainFilterRules with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_domain_filter_rules_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getDomainFilterRules(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetGlobalProxyForAccount() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0100
   * @tc.name      : test_set_global_proxy_for_account_0100
   * @tc.desc      : test networkManager setGlobalProxyForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    try {
      networkManager.setGlobalProxyForAccount(SELFWANT, HTTP_PROXY, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_FOR_ACCOUNT_JS_0101
   * @tc.name      : test_set_global_proxy_for_account_0101
   * @tc.desc      : test networkManager setGlobalProxyForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_for_account_0101", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setGlobalProxyForAccount(SELFWANT, HTTP_PROXY, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0102
   * @tc.name      : test_set_global_proxy_for_account_0102
   * @tc.desc      : test networkManager setGlobalProxyForAccount with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_for_account_0102", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setGlobalProxyForAccount(INVALID_WANT, HTTP_PROXY, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0103
   * @tc.name      : test_set_global_proxy_for_account_0103
   * @tc.desc      : test networkManager setGlobalProxyForAccount with invalid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_for_account_0103", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setGlobalProxyForAccount(SELFWANT, HTTP_PROXY, INVALID_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0104
   * @tc.name      : test_set_global_proxy_for_account_0104
   * @tc.desc      : test networkManager setGlobalProxyForAccount success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_for_account_0104", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let originProxy: connection.HttpProxy = networkManager.getGlobalProxyForAccount(SELFWANT, DEFAULT_ACCOUNT_ID);
    try {
      networkManager.setGlobalProxyForAccount(SELFWANT, HTTP_PROXY, DEFAULT_ACCOUNT_ID);
      let proxy: connection.HttpProxy = networkManager.getGlobalProxyForAccount(SELFWANT, DEFAULT_ACCOUNT_ID);
      expect(proxy.host === HTTP_PROXY.host).assertTrue();
      expect(proxy.port === HTTP_PROXY.port).assertTrue();
      expect(proxy.exclusionList.length === HTTP_PROXY.exclusionList.length).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      networkManager.setGlobalProxyForAccount(SELFWANT, originProxy, DEFAULT_ACCOUNT_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetGlobalProxyForAccount() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0100
   * @tc.name      : test_get_global_proxy_for_account_0100
   * @tc.desc      : test networkManager getGlobalProxyForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    try {
      networkManager.getGlobalProxyForAccount(SELFWANT, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0101
   * @tc.name      : test_get_global_proxy_for_account_0101
   * @tc.desc      : test networkManager getGlobalProxyForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_for_account_0101", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getGlobalProxyForAccount(SELFWANT, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0102
   * @tc.name      : test_get_global_proxy_sync_0102
   * @tc.desc      : test networkManager getGlobalProxyForAccount with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_for_account_0102", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.getGlobalProxyForAccount(INVALID_WANT, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testTurnOnMobileData() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0001
   * @tc.name      : test_turnon_mobile_data_0001
   * @tc.desc      : test wifiManager turnOnMobileData without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.turnOnMobileData(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0002
   * @tc.name      : test_turnon_mobile_data_0002
   * @tc.desc      : test wifiManager turnOnMobileData without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0002", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.turnOnMobileData(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0003
   * @tc.name      : test_turnon_mobile_data_0003
   * @tc.desc      : test wifiManager turnOnMobileData with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.turnOnMobileData(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0004
   * @tc.name      : test_turnon_mobile_data_0004
   * @tc.desc      : test wifiManager turnOnMobileData with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.turnOnMobileData(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0005
   * @tc.name      : test_turnon_mobile_data_0005
   * @tc.desc      : test wifiManager turnOnMobileData with normal super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOnMobileData(SELFWANT, true);
      let info: string = systemParameterEnhance.getSync("persist.edm.mobile_data_policy", "");
      expect(info == "force_open").assertTrue();
      networkManager.turnOnMobileData(SELFWANT, false);
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0006
   * @tc.name      : test_turnon_mobile_data_0006
   * @tc.desc      : test wifiManager turnOnMobileData with no super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOnMobileData(null, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0007
   * @tc.name      : test_turnon_mobile_data_0007
   * @tc.desc      : test networkManager turnOnMobileData with no super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOnMobileData(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0008
   * @tc.name      : test_turnon_mobile_data_0008
   * @tc.desc      : test networkManager turnOnMobileData with normal super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_mobile_data_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOnMobileData(SELFWANT, false);
      let info: string = systemParameterEnhance.getSync("persist.edm.mobile_data_policy", "");
      expect(info == "none").assertTrue();
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testTurnOffMobileData() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_JS_0001
   * @tc.name      : test_turnoff_mobile_data_0001
   * @tc.desc      : test networkManager turnOffMobileData without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnoff_mobile_data_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.turnOffMobileData(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0002
   * @tc.name      : test_turnoff_mobile_data_0002
   * @tc.desc      : test networkManager turnOffMobileData with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnoff_mobile_data_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.turnOffMobileData(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0003
   * @tc.name      : test_turnoff_mobile_data_0003
   * @tc.desc      : test networkManager turnOffMobileData with no super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnoff_mobile_data_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOffMobileData(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0004
   * @tc.name      : test_turnoff_mobile_data_0004
   * @tc.desc      : test networkManager turnOffMobileData with normal super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnoff_mobile_data_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOffMobileData(SELFWANT);
      let info: string = systemParameterEnhance.getSync("persist.edm.mobile_data_policy", "");
      expect(info == "none").assertTrue();
      networkManager.turnOnMobileData(SELFWANT, false);
    } catch (error) {
      expect(error.code == 9200007 || error.code == 801).assertTrue();
    } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddApn() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0001
   * @tc.name      : test_add_apn_0001
   * @tc.desc      : test networkManager addApn without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_apn_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_add_apn_0001 error 9200001 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0002
   * @tc.name      : test_add_apn_0002
   * @tc.desc      : test networkManager addApn with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.addApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_add_apn_0002 error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0003
   * @tc.name      : test_add_apn_0003
   * @tc.desc      : test networkManager addApn with no admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_apn_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addApn(null, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_add_apn_0003 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0004
   * @tc.name      : test_add_apn_0004
   * @tc.desc      : test networkManager addApn with no apnInfo
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_apn_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addApn(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_add_apn_0004 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0005
   * @tc.name      : test_add_apn_0005
   * @tc.desc      : test networkManager addApn with no apnInfo
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_apn_0005", Level.LEVEL2, async (done: Function) => {
    if (HAS_ACTIVE_SIM()) {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        networkManager.addApn(SELFWANT, ADD_APN_INFO);
        let testApnId: string = networkManager.queryApn(SELFWANT, ADD_APN_INFO)[0];
        expect(networkManager.queryApn(SELFWANT, testApnId)["apn"] == "TEST_ADD_APN").assertTrue();
        expect(networkManager.queryApn(SELFWANT, testApnId)["proxy"] == "TEST_ADD_PROXY").assertTrue();
        networkManager.updateApn(SELFWANT, UPDATE_APN_INFO, testApnId);
        expect(networkManager.queryApn(SELFWANT, testApnId)["apn"] == "TEST_UPDATE_APN").assertTrue();
        expect(networkManager.queryApn(SELFWANT, testApnId)["proxy"] == "TEST_UPDATE_PROXY").assertTrue();
        networkManager.setPreferredApn(SELFWANT, testApnId);
        networkManager.deleteApn(SELFWANT, testApnId);
      } catch (error) {
        console.info(' --- test_add_apn_0005 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
    } else {
      expect(true).assertTrue();
    }
    done();
  });
}

function testDeleteApn() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0001
   * @tc.name      : test_delete_apn_0001
   * @tc.desc      : test networkManager deleteApn without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_delete_apn_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.deleteApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_delete_apn_0001 error 9200001 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0002
   * @tc.name      : test_delete_apn_0002
   * @tc.desc      : test networkManager deleteApn with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_delete_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.deleteApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_delete_apn_0002 error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0003
   * @tc.name      : test_delete_apn_0003
   * @tc.desc      : test networkManager deleteApn with no admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_delete_apn_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.deleteApn(null, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_delete_apn_0003 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0004
   * @tc.name      : test_delete_apn_0004
   * @tc.desc      : test networkManager deleteApn with no apnId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_delete_apn_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.deleteApn(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_delete_apn_0004 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUpdateApn() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0001
   * @tc.name      : test_update_apn_0001
   * @tc.desc      : test networkManager updateApn without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_update_apn_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.updateApn(SELFWANT, UPDATE_APN_INFO, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_update_apn_0001 error 9200001 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0002
   * @tc.name      : test_update_apn_0002
   * @tc.desc      : test networkManager updateApn with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_update_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.updateApn(SELFWANT, UPDATE_APN_INFO, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_update_apn_0002 error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0003
   * @tc.name      : test_update_apn_0003
   * @tc.desc      : test networkManager updateApn with no admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_update_apn_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.updateApn(null, UPDATE_APN_INFO, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_update_apn_0003 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0004
   * @tc.name      : test_update_apn_0004
   * @tc.desc      : test networkManager updateApn with no apnInfo
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_update_apn_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.updateApn(SELFWANT, null, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_update_apn_0004 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0005
   * @tc.name      : test_update_apn_0005
   * @tc.desc      : test networkManager updateApn with no apnId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_update_apn_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.updateApn(SELFWANT, UPDATE_APN_INFO, null);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_update_apn_0005 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetPreferredApn() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0001
   * @tc.name      : test_set_preferred_apn_0001
   * @tc.desc      : test networkManager setPreferredApn without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_preferred_apn_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setPreferredApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_preferred_apn_0001 error 9200001 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0002
   * @tc.name      : test_set_preferred_apn_0002
   * @tc.desc      : test networkManager setPreferredApn with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_preferred_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setPreferredApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_preferred_apn_0002 error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0003
   * @tc.name      : test_set_preferred_apn_0003
   * @tc.desc      : test networkManager setPreferredApn with no admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_preferred_apn_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setPreferredApn(null, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_preferred_apn_0003 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0004
   * @tc.name      : test_set_preferred_apn_0004
   * @tc.desc      : test networkManager setPreferredApn with no apnId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_preferred_apn_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setPreferredApn(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_preferred_apn_0004 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testQueryApn() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0001
   * @tc.name      : test_query_apn_0001
   * @tc.desc      : test networkManager queryApn without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.queryApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0001 error 9200001 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });
  
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0002
   * @tc.name      : test_query_apn_0002
   * @tc.desc      : test networkManager queryApn without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0002", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.queryApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0002 error 9200001 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0003
   * @tc.name      : test_query_apn_0003
   * @tc.desc      : test networkManager queryApn with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.queryApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0003 error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
  
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0004
   * @tc.name      : test_query_apn_0004
   * @tc.desc      : test networkManager queryApn with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.queryApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0004 error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0005
   * @tc.name      : test_query_apn_0005
   * @tc.desc      : test networkManager queryApn with no admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.queryApn(null, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0005 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0006
   * @tc.name      : test_query_apn_0006
   * @tc.desc      : test networkManager queryApn with no admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.queryApn(null, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0006 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0007
   * @tc.name      : test_query_apn_0007
   * @tc.desc      : test networkManager queryApn with no apnId or no apnInfo
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_query_apn_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.queryApn(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0007 error 401 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}