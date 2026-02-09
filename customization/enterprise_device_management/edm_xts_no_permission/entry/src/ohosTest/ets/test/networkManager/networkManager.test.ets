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
  protocol: networkManager.Protocol.UDP,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE2: networkManager.FirewallRule = {
  srcAddr: '192.168.44.1-192.188.33.77',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.TCP,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE3: networkManager.FirewallRule = {
  srcAddr: '192.168.55.1-192.188.44.88',
  srcPort: '7171,8888',
  destPort: '6161',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.ICMP,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE4: networkManager.FirewallRule = {
  srcAddr: '192.168.3.1-192.188.22.66',
  srcPort: '7070,9999',
  destPort: '6060',
  appUid: '9696',
  direction: networkManager.Direction.INPUT,
  action: networkManager.Action.ALLOW,
  protocol: networkManager.Protocol.ALL,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE5: networkManager.FirewallRule = {
  srcAddr: '192.168.1.1-192.168.1.22',
  destAddr: '192.168.2.1',
  srcPort: '8080',
  destPort: '8080',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  protocol: networkManager.Protocol.UDP,
  logType: networkManager.LogType.NFLOG
}

const FIREWALL_RULE6: networkManager.FirewallRule = {
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
  action: networkManager.Action.DENY,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE2: networkManager.DomainFilterRule = {
  domainName: 'www.6666.com',
  appUid: '9797',
  action: networkManager.Action.ALLOW,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE3: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  appUid: '9696',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
  logType: networkManager.LogType.NFLOG
};

const DOMAIN_FILTER_RULE4: networkManager.DomainFilterRule = {
  domainName: 'www.example.com',
  direction: networkManager.Direction.FORWARD,
  action: networkManager.Action.REJECT,
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
   * @tc.desc   test networkManager getAllNetworkInterfacesSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_all_network_interfaces_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getAllNetworkInterfacesSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetIpAddressSync() {
  /**
   * @tc.name   test_get_ip_address_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0100
   * @tc.desc   test networkManager getIpAddressSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_ip_address_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getIpAddressSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetMacSync() {
  /**
   * @tc.name   test_get_mac_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0100
   * @tc.desc   test networkManager getMacSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_mac_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getMacSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testIsNetworkInterfaceDisabledSync() {
  /**
   * @tc.name   test_is_network_interface_disable_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.desc   test networkManager isNetworkInterfaceDisabledSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_network_interface_disable_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.isNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetNetworkInterfaceDisabledSync() {
  /**
   * @tc.name   test_set_network_interface_disable_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.desc   test networkManager setNetworkInterfaceDisabledSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_network_interface_disable_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, NETWORK_ETH_LOCAL, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetGlobalProxySync() {
  /**
   * @tc.name   test_set_global_proxy_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.desc   test networkManager setGlobalProxySync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_global_proxy_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setGlobalProxySync(SELFWANT, HTTP_PROXY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetGlobalProxySync() {
  /**
   * @tc.name   test_get_global_proxy_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.desc   test networkManager getGlobalProxySync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_global_proxy_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getGlobalProxySync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddFirewallRule() {
  /**
   * @tc.name   test_add_firewall_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0100
   * @tc.desc   test networkManager addFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_firewall_rule_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.addFirewallRule(SELFWANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveFirewallRule() {
  /**
   * @tc.name   test_remove_firewall_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0100
   * @tc.desc   test networkManager removeFirewallRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_firewall_rule_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeFirewallRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
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
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeFirewallRule(SELFWANT, FIREWALL_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetFirewallRules() {
  /**
   * @tc.name   test_get_firewall_rules_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0100
   * @tc.desc   test networkManager getFirewallRules with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_firewall_rules_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getFirewallRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDomainFilterRule() {
  /**
   * @tc.name   test_add_domain_filter_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0100
   * @tc.desc   test networkManager addDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_domain_filter_rule_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.addDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveDomainFilterRule() {
  /**
   * @tc.name   test_remove_domain_filter_rule_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0100
   * @tc.desc   test networkManager removeDomainFilterRule with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_domain_filter_rule_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeDomainFilterRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
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
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.removeDomainFilterRule(SELFWANT, DOMAIN_FILTER_RULE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDomainFilterRules() {
  /**
   * @tc.name   test_get_domain_filter_rules_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0100
   * @tc.desc   test networkManager getDomainFilterRules with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_domain_filter_rules_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getDomainFilterRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetGlobalProxyForAccount() {
  /**
   * @tc.name   test_set_global_proxy_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_GLOBAL_FOR_ACCOUNT_JS_0100
   * @tc.desc   test networkManager setGlobalProxyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_global_proxy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setGlobalProxyForAccount(SELFWANT, HTTP_PROXY, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetGlobalProxyForAccount() {
  /**
   * @tc.name   test_get_global_proxy_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_FOR_ACCOUNT_JS_0100
   * @tc.desc   test networkManager getGlobalProxyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_global_proxy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.getGlobalProxyForAccount(SELFWANT, DEFAULT_ACCOUNT_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testTurnOnMobileData() {
  /**
   * @tc.name   test_turnon_mobile_data_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0001
   * @tc.desc   test wifiManager turnOnMobileData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_mobile_data_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.turnOnMobileData(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_mobile_data_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_MOBILE_DATA_JS_0002
   * @tc.desc   test wifiManager turnOnMobileData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_mobile_data_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.turnOnMobileData(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testTurnOffMobileData() {
  /**
   * @tc.name   test_turnoff_mobile_data_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_MOBILE_DATA_JS_0001
   * @tc.desc   test wifiManager turnOffMobileData with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_mobile_data_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.turnOffMobileData(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddApn() {
  /**
   * @tc.name   test_add_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_APN_JS_0001
   * @tc.desc   test networkManager addApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_apn_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.addApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_add_apn_0001 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testDeleteApn() {
  /**
   * @tc.name   test_delete_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_DELETE_APN_JS_0001
   * @tc.desc   test networkManager deleteApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_delete_apn_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.deleteApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_delete_apn_0001 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testUpdateApn() {
  /**
   * @tc.name   test_update_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_UPDATE_APN_JS_0001
   * @tc.desc   test networkManager updateApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_update_apn_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.updateApn(SELFWANT, UPDATE_APN_INFO, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_update_apn_0001 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetPreferredApn() {
  /**
   * @tc.name   test_set_preferred_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PREFERRED_APN_JS_0001
   * @tc.desc   test networkManager setPreferredApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_preferred_apn_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setPreferredApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_preferred_apn_0001 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testQueryApn() {
  /**
   * @tc.name   test_query_apn_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0001
   * @tc.desc   test networkManager queryApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_query_apn_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.queryApn(SELFWANT, "0");
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0001 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_query_apn_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_QUERY_APN_JS_0002
   * @tc.desc   test networkManager queryApn with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_query_apn_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.queryApn(SELFWANT, ADD_APN_INFO);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_query_apn_0002 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetEthernetConfig() {
  /**
   * @tc.name   test_set_ethernet_config_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0001
   * @tc.desc   test networkManager setEthernetConfig with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_DHCP_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_ethernet_config_0001 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_ethernet_config_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_ETHERNET_CONFIG_JS_0002
   * @tc.desc   test networkManager setEthernetConfig with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_ethernet_config_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      networkManager.setEthernetConfig(SELFWANT, "eth0", INTERFACE_STATIC_CONFIG);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_ethernet_config_0002 error 201 or 801 is expected, actually catch: ' + error.code);
      expect((error.code == 201) || (error.code == 801)).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}