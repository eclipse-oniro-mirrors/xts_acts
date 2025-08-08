import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import netFirewall from '@ohos.net.netFirewall';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function NetfirewallNoP() {
  let ipRuleUpd: netFirewall.NetFirewallRule = {
    id: 1,
    name: "rule1",
    description: "rule1 description update",
    direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
    action:netFirewall.FirewallRuleAction.RULE_ALLOW,
    type: netFirewall.NetFirewallRuleType.RULE_IP,
    isEnabled: false,
    appUid: 20001,
    userId: 100
  };
  let policy: netFirewall.NetFirewallPolicy = {
    isOpen: true,
    inAction: netFirewall.FirewallRuleAction.RULE_DENY,
    outAction: netFirewall.FirewallRuleAction.RULE_ALLOW
  };
  let ruleParam: netFirewall.RequestParam = {
    page: 1,
    pageSize: 10,
    orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
    orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
  };
  let ipRule: netFirewall.NetFirewallRule = {
    name: "rule1",
    description: "rule1 description",
    direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
    action:netFirewall.FirewallRuleAction.RULE_ALLOW,
    type: netFirewall.NetFirewallRuleType.RULE_IP,
    isEnabled: true,
    appUid: 20001,
    userId: 100
  };
  describe('NetfirewallNoPTest',  () => {
    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0100
     * @tc.name   : testTelephonyNetfirewallNop0100
     * @tc.desc   : setNetFirewallPolicy No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0100';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.setNetFirewallPolicy(100, policy).then(() => {
          console.info(`${caseName} set firewall policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0200
     * @tc.name   : testTelephonyNetfirewallNop0200
     * @tc.desc   : updateNetFirewallRule No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0200';
      console.info(`${caseName}---Start`);
      try{

        netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
          console.info(`${caseName} set firewall policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0300
     * @tc.name   : testTelephonyNetfirewallNop0300
     * @tc.desc   : getNetFirewallPolicy No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0300';
      console.info(`${caseName}---Start`);
      try{

        netFirewall.getNetFirewallPolicy(100).then(() => {
          console.info(`${caseName} get firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} get firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });

      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0400
     * @tc.name   : testTelephonyNetfirewallNop0400
     * @tc.desc   : removeNetFirewallRule No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0400';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.removeNetFirewallRule(100,1).then(() => {
          console.info(`${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });

      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0500
     * @tc.name   : testTelephonyNetfirewallNop0500
     * @tc.desc   : getNetFirewallRules No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0500';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRules(100,ruleParam).then(() => {
          console.info(`${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0600
     * @tc.name   : testTelephonyNetfirewallNop0600
     * @tc.desc   : getNetFirewallRule No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0600';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRule(100,1).then(() => {
          console.info(`${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });

      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Netfirewall_Nop_0700
     * @tc.name   : testTelephonyNetfirewallNop0700
     * @tc.desc   : addNetFirewallRule No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyNetfirewallNop0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0700';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.addNetFirewallRule(ipRule).then(() => {
          console.info(`${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 201);
          done();
        });

      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })
  })
}
