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
  it("test_get_all_network_interfaces_sync_0103", Level.LEVEL2, async (done: Function) => {
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
  it("test_get_ip_address_sync_0103", Level.LEVEL2, async (done: Function) => {
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
  it("test_get_mac_sync_0103", Level.LEVEL2, async (done: Function) => {
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
  it("test_is_network_interface_disable_sync_0103", Level.LEVEL2, async (done: Function) => {
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
  it("test_set_network_interface_disable_sync_0104", Level.LEVEL2, async (done: Function) => {
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
  it("test_set_network_interface_disable_sync_0105", Level.LEVEL2, async (done: Function) => {
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
  it("test_set_global_proxy_sync_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setGlobalProxySync(SELFWANT, HTTP_PROXY);
      let proxy: connection.HttpProxy = networkManager.getGlobalProxySync(SELFWANT);
      expect(proxy.host === HTTP_PROXY.host).assertTrue();
      expect(proxy.port === HTTP_PROXY.port).assertTrue();
      expect(proxy.exclusionList.length === HTTP_PROXY.exclusionList.length).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
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

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0103
   * @tc.name      : test_get_global_proxy_sync_0103
   * @tc.desc      : test networkManager getGlobalProxySync success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_sync_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setGlobalProxySync(SELFWANT, HTTP_PROXY);
      let proxy: connection.HttpProxy = networkManager.getGlobalProxySync(SELFWANT);
      expect(proxy.host === HTTP_PROXY.host).assertTrue();
      expect(proxy.port === HTTP_PROXY.port).assertTrue();
      expect(proxy.exclusionList.length === HTTP_PROXY.exclusionList.length).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
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
  it("test_add_firewall_rule_0105", Level.LEVEL2, async (done: Function) => {
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
   * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_NETWORKMANAGER_JS_017
   * @tc.name test addFirewallRule method with normal admin and forward reject param
   * @tc.desc addFirewallRule with normal admin and forward reject param
   */
  it('AddFirewallRejectForwardRuleWithNormalAdminTest', 0, async (done: Function) =>{
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
   * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_NETWORKMANAGER_JS_018
   * @tc.name test removeFirewallRule method with normal admin and forward reject param
   * @tc.desc removeFirewallRule with normal admin and forward reject param
   */
  it('RemoveFirewallRejectForwardRuleWithNormalAdminTest', 0, async (done: Function) =>{
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
   * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_NETWORKMANAGER_JS_019
   * @tc.name test addDomainFilterRule method with super admin and forward reject param
   * @tc.desc addFirewallRule with normal admin and forward reject param
   */
  it('AddDomainFilterRejectForwardRuleWithNormalAdminTest', 0, async (done: Function) =>{
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
   * @tc.number SUB_CUSTOMIZATION_ENTERPRISE_DEVICE_MANAGER_NETWORKMANAGER_JS_020
   * @tc.name test removeDomainFilterRule method with super admin and forward reject param
   * @tc.desc removeDomainFilter with normal admin and forward reject param
   */
  it('RemoveDomainFilterRejectForwardRuleWithNormalAdminTest', 0, async (done: Function) =>{
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
      expect(error.code == 9200001).assertTrue();
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
      expect(error.code == 9200002).assertTrue();
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
      expect(error.code == 401).assertTrue();
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
      expect(error.code == 9200007).assertTrue();
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
      expect(false).assertTrue();
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
      expect(error.code == 9200001).assertTrue();
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
      expect(error.code == 9200002).assertTrue();
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
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}