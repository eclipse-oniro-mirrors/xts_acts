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

const FIREWALL_RULE7: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::26-2409:8c54:871:1003::30',
  destAddr: 'fe80::7068:b5ff:febd:5492',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.OUTPUT,
  action: networkManager.Action.DENY,
  protocol: networkManager.Protocol.UDP,
  family: 2
}

const FIREWALL_RULE8: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::36-2409:8c54:871:1003::40',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.TCP,
  family: 2
}

const FIREWALL_RULE9: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::46-2409:8c54:871:1003::50',
  srcPort: '7171,8888',
  destPort: '6161',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.ICMP,
  family: 2
}

const FIREWALL_RULE10: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::56-2409:8c54:871:1003::66',
  srcPort: '7070,9999',
  destPort: '6060',
  appUid: '9696',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.ALL,
  family: 2
}

const FIREWALL_RULE11: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::26-2409:8c54:871:1003::30',
  destAddr: 'fe80::7068:b5ff:febd:5492',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP,
  family: 2
}

const FIREWALL_RULE12: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::26-2409:8c54:871:1003::30',
  destAddr: 'fe80::7068:b5ff:febd:5492',
  srcPort: '8080',
  destPort: '8080',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP,
  family: 2
}

const FIREWALL_RULE13: networkManager.FirewallRule = {
  family: 2
}

const FIREWALL_RULE14: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::26-2409:8c54:871:1003::30',
  destAddr: 'fe80::7068:b5ff:febd:5492',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.OUTPUT,
  action: networkManager.Action.DENY,
  protocol: networkManager.Protocol.UDP,
  family: 2,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE15: networkManager.FirewallRule = {
  srcAddr: '2409:8c54:871:1003::26-2409:8c54:871:1003::30',
  destAddr: 'fe80::7068:b5ff:febd:5492',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP,
  family: 2,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE16: networkManager.FirewallRule = {
  srcAddr: '192.168.1.1-192.168.1.22',
  destAddr: '192.168.2.1',
  srcPort: '8080',
  destPort: '8080',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP,
  logType: networkManager.LogType.NFLOG
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

const DOMAIN_FILTER_RULE5: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  action: networkManager.Action.DENY,
  family: 2
};

const DOMAIN_FILTER_RULE6: networkManager.DomainFilterRule = {
  domainName: 'www.6666.com',
  appUid: '9797',
  action: networkManager.Action.ALLOW,
  family: 2
};

const DOMAIN_FILTER_RULE7: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  family: 2
};

const DOMAIN_FILTER_RULE8: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  family: 2
};

const DOMAIN_FILTER_RULE9: networkManager.DomainFilterRule = {
  family: 2
};

const DOMAIN_FILTER_RULE10: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  action: networkManager.Action.DENY,
  family: 2,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE11: networkManager.DomainFilterRule = {
  domainName: 'www.6666.com',
  appUid: '9797',
  action: networkManager.Action.ALLOW,
  family: 2,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE12: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  family: 2,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE13: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE14: networkManager.DomainFilterRule = {
  family: 2,
  logType: networkManager.LogType.NFLOG
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

const INTERFACE_DHCP_CONFIG: networkManager.InterfaceConfig = {
  "ipSetMode": networkManager.IpSetMode.DHCP,
  "ipAddress": "192.168.1.121",
  "gateway": "192.168.1.1",
  "netMask": "255.255.255.0",
  "dnsServers": "8.8.8.8,192.168.1.1"
}

const INTERFACE_STATIC_CONFIG: networkManager.InterfaceConfig = {
  "ipSetMode": networkManager.IpSetMode.STATIC,
  "ipAddress": "192.168.1.121",
  "gateway": "192.168.1.1",
  "netMask": "255.255.255.0",
  "dnsServers": "8.8.8.8,192.168.1.1"
}

const INTERFACE_INVALID_CONFIG: networkManager.InterfaceConfig = {
  "ipSetMode": networkManager.IpSetMode.STATIC,
  "ipAddress": "aaaaaaa",
  "gateway": "192.168.1.1",
  "netMask": "255.255.255.0",
  "dnsServers": "8.8.8.8,bbbbbbb"
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

    testSetEthernetConfig();
  })
}

function testGetAllNetworkInterfacesSync() {
  /**
   * @tc.name   test_get_all_network_interfaces_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0100
   * @tc.desc   test networkManager getAllNetworkInterfacesSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_all_network_interfaces_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0101
   * @tc.desc   test networkManager getAllNetworkInterfacesSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_all_network_interfaces_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_all_network_interfaces_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0102
   * @tc.desc   test networkManager getAllNetworkInterfacesSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_all_network_interfaces_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0103
   * @tc.desc   test networkManager getAllNetworkInterfacesSync success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_get_ip_address_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0100
   * @tc.desc   test networkManager getIpAddressSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_ip_address_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0101
   * @tc.desc   test networkManager getIpAddressSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_ip_address_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_ip_address_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0102
   * @tc.desc   test networkManager getIpAddressSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_ip_address_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0103
   * @tc.desc   test networkManager getIpAddressSync with local network interface success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_get_mac_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0100
   * @tc.desc   test networkManager getMacSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_mac_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0101
   * @tc.desc   test networkManager getMacSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_mac_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_mac_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0102
   * @tc.desc   test networkManager getMacSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_mac_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0103
   * @tc.desc   test networkManager getMacSync success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_is_network_interface_disable_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.desc   test networkManager isNetworkInterfaceDisabledSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_is_network_interface_disable_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0101
   * @tc.desc   test networkManager isNetworkInterfaceDisabledSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_network_interface_disable_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_is_network_interface_disable_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0102
   * @tc.desc   test networkManager isNetworkInterfaceDisabledSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_is_network_interface_disable_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0103
   * @tc.desc   test networkManager isNetworkInterfaceDisabledSync success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_is_network_interface_disable_sync_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0104
   * @tc.desc   test networkManager isNetworkInterfaceDisabledSync with invalid network interface
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_network_interface_disable_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_network_interface_disable_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0101
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_network_interface_disable_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_is_network_interface_disable_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0102
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_network_interface_disable_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0103
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync with invalid network interface
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_network_interface_disable_sync_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0104
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_set_network_interface_disable_sync_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0105
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_set_global_proxy_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.desc   test networkManager setGlobalProxySync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_global_proxy_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0101
   * @tc.desc   test networkManager setGlobalProxySync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_global_proxy_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_global_proxy_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0102
   * @tc.desc   test networkManager setGlobalProxySync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_global_proxy_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0103
   * @tc.desc   test networkManager setGlobalProxySync success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
   * @tc.name   test_get_global_proxy_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.desc   test networkManager getGlobalProxySync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_global_proxy_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0101
   * @tc.desc   test networkManager getGlobalProxySync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_global_proxy_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_global_proxy_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0102
   * @tc.desc   test networkManager getGlobalProxySync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0100
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0101
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0102
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0103
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0104
   * @tc.desc   test networkManager addFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_add_firewall_rule_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0105
   * @tc.desc   test networkManager addFirewallRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0106
   * @tc.desc   test networkManager addFirewallRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_firewall_rule_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0107
   * @tc.desc   test networkManager addFirewallRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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

  /**
   * @tc.name   test_add_firewall_rule_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0108
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0108", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0109
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0109", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE8);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0110
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0110", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE9);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0111
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0111", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE10);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0112
   * @tc.desc   test networkManager addFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0113
   * @tc.desc   test networkManager addFirewallRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(INVALID_WANT, FIREWALL_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0114
   * @tc.desc   test networkManager addFirewallRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0114", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(INVALID_WANT, FIREWALL_RULE11);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0115
   * @tc.desc   test networkManager addFirewallRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0115", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE12);
      let firewallRules: Array<networkManager.FirewallRule>;
      firewallRules = networkManager.getFirewallRules(SELFWANT);
      expect(firewallRules.length == 1).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE13);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0116
   * @tc.desc   test networkManager addFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0116", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0117
   * @tc.desc   test networkManager addFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0117", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0118
   * @tc.desc   test networkManager addFirewallRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0118", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(INVALID_WANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0119
   * @tc.desc   test networkManager addFirewallRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0119", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(INVALID_WANT, FIREWALL_RULE15);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_firewall_rule_0120
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0120
   * @tc.desc   test networkManager addFirewallRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0120", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE16);
      let firewallRules: Array<networkManager.FirewallRule>;
      firewallRules = networkManager.getFirewallRules(SELFWANT);
      expect(firewallRules.length == 1).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE16);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });
}

function testRemoveFirewallRule() {
  /**
   * @tc.name   test_remove_firewall_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0100
   * @tc.desc   test networkManager removeFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_firewall_rule_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0101
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_remove_firewall_rule_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0102
   * @tc.desc   test networkManager removeFirewallRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_firewall_rule_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0103
   * @tc.desc   test networkManager removeFirewallRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_firewall_rule_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0104
   * @tc.desc   test networkManager removeFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_firewall_rule_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0105
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_remove_firewall_rule_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0106
   * @tc.desc   test networkManager removeFirewallRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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

  /**
   * @tc.name   test_remove_firewall_rule_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0107
   * @tc.desc   test networkManager removeFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0107", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE13);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0108
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE13);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0109
   * @tc.desc   test networkManager removeFirewallRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeFirewallRule(INVALID_WANT, FIREWALL_RULE13);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0110
   * @tc.desc   test networkManager removeFirewallRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0110", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE11);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0111
   * @tc.desc   test networkManager removeFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0111", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0112
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0113
   * @tc.desc   test networkManager removeFirewallRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE12);
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE12);
      let firewallRules: Array<networkManager.FirewallRule>;
      firewallRules = networkManager.getFirewallRules(SELFWANT);
      expect(firewallRules.length == 0).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE13);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0114
   * @tc.desc   test networkManager removeFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0114", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0115
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0115", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0116
   * @tc.desc   test networkManager removeFirewallRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0116", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeFirewallRule(INVALID_WANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0117
   * @tc.desc   test networkManager removeFirewallRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0117", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE15);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0118
   * @tc.desc   test networkManager removeFirewallRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0118", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0119
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0119", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_firewall_rule_0120
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0120
   * @tc.desc   test networkManager removeFirewallRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0120", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE16);
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE16);
      let firewallRules: Array<networkManager.FirewallRule>;
      firewallRules = networkManager.getFirewallRules(SELFWANT);
      expect(firewallRules.length == 0).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });
}

function testGetFirewallRules() {
  /**
   * @tc.name   test_get_firewall_rules_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0100
   * @tc.desc   test networkManager getFirewallRules without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_firewall_rules_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0101
   * @tc.desc   test networkManager getFirewallRules with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_firewall_rules_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_firewall_rules_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0102
   * @tc.desc   test networkManager getFirewallRules with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_domain_filter_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0100
   * @tc.desc   test networkManager addDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_domain_filter_rule_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0101
   * @tc.desc   test networkManager addDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_add_domain_filter_rule_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0102
   * @tc.desc   test networkManager addDomainFilterRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_domain_filter_rule_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0103
   * @tc.desc   test networkManager addDomainFilterRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_domain_filter_rule_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0104
   * @tc.desc   test networkManager addDomainFilterRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
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
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0105
   * @tc.desc   test networkManager addDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0105", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0106
   * @tc.desc   test networkManager addDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0107
   * @tc.desc   test networkManager addDomainFilterRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(INVALID_WANT, DOMAIN_FILTER_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0108
   * @tc.desc   test networkManager addDomainFilterRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0109
   * @tc.desc   test networkManager addDomainFilterRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_add_domain_filter_rule_0109", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE8);
      let domainFilterRules: Array<networkManager.DomainFilterRule>;
      domainFilterRules = networkManager.getDomainFilterRules(SELFWANT);
      expect(domainFilterRules.length == 1).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE9);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0110
   * @tc.desc   test networkManager addDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0110", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE10);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0111
   * @tc.desc   test networkManager addDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0111", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE11);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0112
   * @tc.desc   test networkManager addDomainFilterRule with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(INVALID_WANT, DOMAIN_FILTER_RULE10);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0113
   * @tc.desc   test networkManager addDomainFilterRule with invalid param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE12);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_domain_filter_rule_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0114
   * @tc.desc   test networkManager addDomainFilterRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_add_domain_filter_rule_0114", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE13);
      let domainFilterRules: Array<networkManager.DomainFilterRule>;
      domainFilterRules = networkManager.getDomainFilterRules(SELFWANT);
      expect(domainFilterRules.length == 1).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE13);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });
}

function testRemoveDomainFilterRule() {
  /**
   * @tc.name   test_remove_domain_filter_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0100
   * @tc.desc   test networkManager removeDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_domain_filter_rule_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0101
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_remove_domain_filter_rule_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0102
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_domain_filter_rule_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0103
   * @tc.desc   test networkManager removeDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_domain_filter_rule_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0104
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_remove_domain_filter_rule_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0105
   * @tc.desc   test networkManager removeDomainFilterRule with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_remove_domain_filter_rule_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0106
   * @tc.desc   test networkManager removeDomainFilterRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0107
   * @tc.desc   test networkManager removeDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0107", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE9);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0108
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE9);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0109
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE7);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0110
   * @tc.desc   test networkManager removeDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0110", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0111
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0111", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE5);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0112
   * @tc.desc   test networkManager removeDomainFilterRule with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeDomainFilterRule(INVALID_WANT, DOMAIN_FILTER_RULE9);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.name   test_remove_domain_filter_rule_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0113
   * @tc.desc   test networkManager removeDomainFilterRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE8);
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE8);
      let domainFilterRules: Array<networkManager.DomainFilterRule>;
      domainFilterRules = networkManager.getDomainFilterRules(SELFWANT);
      expect(domainFilterRules.length == 0).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE9);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0114
   * @tc.desc   test networkManager removeDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0114", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0115
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0115", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0116
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0116", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE12);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0117
   * @tc.desc   test networkManager removeDomainFilterRule without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0117", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE10);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0118
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0118", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE10);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0119
   * @tc.desc   test networkManager removeDomainFilterRule with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0119", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.removeDomainFilterRule(INVALID_WANT, DOMAIN_FILTER_RULE14);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_domain_filter_rule_0120
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0120
   * @tc.desc   test networkManager removeDomainFilterRule
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0120", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE13);
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE13);
      let domainFilterRules: Array<networkManager.DomainFilterRule>;
      domainFilterRules = networkManager.getDomainFilterRules(SELFWANT);
      expect(domainFilterRules.length == 0).assertTrue();
    } catch (e) {
      expect(false).assertTrue();
    }
    finally {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE9);
      await adminManager.disableSuperAdmin(SELFWANT.bundleName);
    }
    done();
  });
}

function testGetDomainFilterRules() {
  /**
   * @tc.name   test_get_domain_filter_rules_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0100
   * @tc.desc   test networkManager getDomainFilterRules without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_domain_filter_rules_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0101
   * @tc.desc   test networkManager getDomainFilterRules with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_domain_filter_rules_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_domain_filter_rules_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0102
   * @tc.desc   test networkManager getDomainFilterRules with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_global_proxy_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0100
   * @tc.desc   test networkManager setGlobalProxyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_global_proxy_for_account_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_FOR_ACCOUNT_JS_0101
   * @tc.desc   test networkManager setGlobalProxyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_global_proxy_for_account_0101", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_global_proxy_for_account_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0102
   * @tc.desc   test networkManager setGlobalProxyForAccount with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_global_proxy_for_account_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0103
   * @tc.desc   test networkManager setGlobalProxyForAccount with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_global_proxy_for_account_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0104
   * @tc.desc   test networkManager setGlobalProxyForAccount success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
      networkManager.setGlobalProxyForAccount(SELFWANT, originProxy, DEFAULT_ACCOUNT_ID);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetGlobalProxyForAccount() {
  /**
   * @tc.name   test_get_global_proxy_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0100
   * @tc.desc   test networkManager getGlobalProxyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_get_global_proxy_for_account_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0101
   * @tc.desc   test networkManager getGlobalProxyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_global_proxy_for_account_0101", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_get_global_proxy_for_account_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0102
   * @tc.desc   test networkManager getGlobalProxyForAccount with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_turnon_mobile_data_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0001
   * @tc.desc   test wifiManager turnOnMobileData without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_turnon_mobile_data_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0002
   * @tc.desc   test wifiManager turnOnMobileData without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_turnon_mobile_data_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0003
   * @tc.desc   test wifiManager turnOnMobileData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_mobile_data_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.turnOnMobileData(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_mobile_data_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0004
   * @tc.desc   test wifiManager turnOnMobileData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_mobile_data_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.turnOnMobileData(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_mobile_data_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0005
   * @tc.desc   test wifiManager turnOnMobileData with normal super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_turnon_mobile_data_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0006
   * @tc.desc   test wifiManager turnOnMobileData with no super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_mobile_data_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOnMobileData(null, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_mobile_data_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0007
   * @tc.desc   test networkManager turnOnMobileData with no super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_mobile_data_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOnMobileData(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_mobile_data_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0008
   * @tc.desc   test networkManager turnOnMobileData with normal super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_turnoff_mobile_data_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_JS_0001
   * @tc.desc   test networkManager turnOffMobileData without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_turnoff_mobile_data_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0002
   * @tc.desc   test networkManager turnOffMobileData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_mobile_data_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.turnOffMobileData(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnoff_mobile_data_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0003
   * @tc.desc   test networkManager turnOffMobileData with no super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_mobile_data_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.turnOffMobileData(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnoff_mobile_data_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0004
   * @tc.desc   test networkManager turnOffMobileData with normal super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0001
   * @tc.desc   test networkManager addApn without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_apn_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0002
   * @tc.desc   test networkManager addApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.addApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_add_apn_with_byod error 9200002 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_apn_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0003
   * @tc.desc   test networkManager addApn with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_apn_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0004
   * @tc.desc   test networkManager addApn with no apnInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_add_apn_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0005
   * @tc.desc   test networkManager addApn with no apnInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_apn_0005", Level.LEVEL2, async (done: Function) => {
    if (HAS_ACTIVE_SIM()) {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let res = networkManager.queryApn(SELFWANT, ADD_APN_INFO);
        expect(res.length == 0).assertTrue();
        networkManager.addApn(SELFWANT, ADD_APN_INFO);
        let res1 = networkManager.queryApn(SELFWANT, ADD_APN_INFO);
        expect(res1.length > 0).assertTrue();
        let testApnId: string = res1[0];
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
   * @tc.name   test_delete_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0001
   * @tc.desc   test networkManager deleteApn without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_delete_apn_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0002
   * @tc.desc   test networkManager deleteApn with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_delete_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_delete_apn_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0003
   * @tc.desc   test networkManager deleteApn with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_delete_apn_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0004
   * @tc.desc   test networkManager deleteApn with no apnId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_update_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0001
   * @tc.desc   test networkManager updateApn without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_update_apn_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0002
   * @tc.desc   test networkManager updateApn with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_update_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_update_apn_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0003
   * @tc.desc   test networkManager updateApn with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_update_apn_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0004
   * @tc.desc   test networkManager updateApn with no apnInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_update_apn_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0005
   * @tc.desc   test networkManager updateApn with no apnId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_preferred_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0001
   * @tc.desc   test networkManager setPreferredApn without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_preferred_apn_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0002
   * @tc.desc   test networkManager setPreferredApn with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_preferred_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_set_preferred_apn_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0003
   * @tc.desc   test networkManager setPreferredApn with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_set_preferred_apn_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0004
   * @tc.desc   test networkManager setPreferredApn with no apnId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_query_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0001
   * @tc.desc   test networkManager queryApn without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_query_apn_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0002
   * @tc.desc   test networkManager queryApn without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_query_apn_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0003
   * @tc.desc   test networkManager queryApn with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_query_apn_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_query_apn_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0004
   * @tc.desc   test networkManager queryApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_query_apn_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
   * @tc.name   test_query_apn_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0005
   * @tc.desc   test networkManager queryApn with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_query_apn_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0006
   * @tc.desc   test networkManager queryApn with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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
   * @tc.name   test_query_apn_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0007
   * @tc.desc   test networkManager queryApn with no apnId or no apnInfo
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
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

function testSetEthernetConfig() {
  /**
   * @tc.name   test_set_ethernet_config_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0001
   * @tc.desc   test networkManager setEthernetConfig without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0001", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_DHCP_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0002
   * @tc.desc   test networkManager setEthernetConfig without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0002", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_STATIC_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 9200001) || (error.code == 801)).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0003
   * @tc.desc   test networkManager setEthernetConfig with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_DHCP_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0004
   * @tc.desc   test networkManager setEthernetConfig with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_STATIC_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 9200002) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0005
   * @tc.desc   test networkManager setEthernetConfig with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setEthernetConfig(null, "eth0", INTERFACE_STATIC_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0006
   * @tc.desc   test networkManager setEthernetConfig with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setEthernetConfig(SELFWANT, "", INTERFACE_STATIC_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 401) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0007
   * @tc.desc   test networkManager setEthernetConfig with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_INVALID_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 9200012) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0008
   * @tc.desc   test networkManager setEthernetConfig with no admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth123", INTERFACE_STATIC_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      expect((error.code == 9201010) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
