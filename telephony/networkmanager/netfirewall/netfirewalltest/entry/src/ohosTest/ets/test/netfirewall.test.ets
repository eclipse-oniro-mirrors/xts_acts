import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType, Size,Level} from '@ohos/hypium';
import netFirewall from '@ohos.net.netFirewall';
import { BusinessError } from '@kit.BasicServicesKit';
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};
const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
export default function netfirewallTest() {
  describe('netfriewallTest',  () => {
    const updateCurrentId: (caseName: string) => void = async (caseName: string)=>{
      await netFirewall.getNetFirewallRules(userId, ruleParam).then((result: netFirewall.FirewallRulePage) => {
        Current_Ruler_ID = result.data[0].id == undefined ? 1: result.data[0].id;
      }, (error: BusinessError) => {
        console.error(caseName, "get firewall rules failed: " + JSON.stringify(error));
      });
    }
    const removedAll:  () => void = async ()=>{
      try {
        let i = 0
        while (i<200){
          i++;
          await updateCurrentId("remove 调用的")
          await netFirewall.removeNetFirewallRule(userId,Current_Ruler_ID).catch((error : BusinessError) => {
            i = 2000
            console.error("delete firewall rule failed: " + JSON.stringify(error));
          });
        }
      }catch (err){
        console.log("remove netfirewall catch err in ",JSON.stringify(err))
      }

    }
    let Current_Ruler_ID :number | undefined = 1;
    const userId :number = 100;
    let ruleDirection_RULE_IN : netFirewall.NetFirewallRuleDirection;
    let ruleDirection_RULE_OUT :netFirewall.NetFirewallRuleDirection;
    let ruleAction_RULE_ALLOW :netFirewall.FirewallRuleAction;
    let ruleAction_RULE_DENY :netFirewall.FirewallRuleAction
    let ruleType_RULE_IP :netFirewall.NetFirewallRuleType;
    let ruleType_RULE_DNS :netFirewall.NetFirewallRuleType;
    let ruleType_RULE_DOMAIN :netFirewall.NetFirewallRuleType;
    let orderField_ORDER_BY_RULE_NAME :netFirewall.NetFirewallOrderField;
    let orderField_ORDER_BY_RECORD_TIME :netFirewall.NetFirewallOrderField;
    let orderType_ORDER_ASC :netFirewall.NetFirewallOrderType;
    let orderType_ORDER_DESC :netFirewall.NetFirewallOrderType;
    const ruleParam: netFirewall.RequestParam = {
      page: 1,
      pageSize: 10,
      orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
      orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
    };
    const  getNetfirewallEnum: ()=> void = ()=>{
      try {
        ruleDirection_RULE_IN = netFirewall.NetFirewallRuleDirection.RULE_IN
        ruleDirection_RULE_OUT = netFirewall.NetFirewallRuleDirection.RULE_OUT
        ruleAction_RULE_ALLOW = netFirewall.FirewallRuleAction.RULE_ALLOW
        ruleAction_RULE_DENY = netFirewall.FirewallRuleAction.RULE_DENY
        ruleType_RULE_IP = netFirewall.NetFirewallRuleType.RULE_IP
        ruleType_RULE_DNS = netFirewall.NetFirewallRuleType.RULE_DNS
        ruleType_RULE_DOMAIN = netFirewall.NetFirewallRuleType.RULE_DOMAIN
        orderField_ORDER_BY_RULE_NAME = netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME
        orderField_ORDER_BY_RECORD_TIME = netFirewall.NetFirewallOrderField.ORDER_BY_RECORD_TIME
        orderType_ORDER_ASC = netFirewall.NetFirewallOrderType.ORDER_ASC
        orderType_ORDER_DESC = netFirewall.NetFirewallOrderType.ORDER_DESC
      }catch (err){
        ruleDirection_RULE_IN = 1
        ruleDirection_RULE_OUT = 2
        ruleAction_RULE_ALLOW = 0
        ruleAction_RULE_DENY = 1
        ruleType_RULE_IP = 1
        ruleType_RULE_DNS = 3
        ruleType_RULE_DOMAIN = 2
        orderField_ORDER_BY_RULE_NAME = 1
        orderField_ORDER_BY_RECORD_TIME = 100
        orderType_ORDER_ASC = 1
        orderType_ORDER_DESC = 100
      }
    }
    beforeAll(async ()=>{
      await getNetfirewallEnum();
      await removedAll();
    })

    /**
     * @tc.number : SUB_Network_NetFirewall_AddNetFirewallRule_0100
     * @tc.name   : testNetFirewallAddNetFirewallRule_0100
     * @tc.desc   : Add a NetFirewallRule
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetFirewallAddNetFirewallRule_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetFirewallAddNetFirewallRule_0100';
      console.info(`${caseName}---Start`);
      try{
        let ipRule_01: netFirewall.NetFirewallRule = {
          name: "rule10",
          description: "rule10 description",
          direction: ruleDirection_RULE_OUT,
          action: ruleAction_RULE_ALLOW,
          type: ruleType_RULE_DOMAIN,
          isEnabled: false,
          appUid: 20001,
          protocol: 6,
          userId: 100,
          localIps: [
            {
              family: 1,
              type: 1,
              address: "10.10.1.1",
              mask: 24
            },{
            family: 1,
            type: 2,
            startIp: "10.20.1.1",
            endIp: "10.20.1.10"
          }],
          remoteIps:[
            {
              family: 1,
              type: 1,
              address: "20.10.1.1",
              mask: 24
            },{
            family: 1,
            type: 2,
            startIp: "20.20.1.1",
            endIp: "20.20.1.10"
          }],
          remotePorts: [
            {
              startPort: 443,
              endPort: 443
            }],
          localPorts: [
            {
              startPort: 1000,
              endPort: 1000
            },{
            startPort: 2000,
            endPort: 2001
          }],
          domains: [
            {
              isWildcard: false,
              domain: "www.baidu.com"
            }
          ],
          dns: {
            primaryDns: "11.1.11.1",
            standbyDns: "11.0.11.2"
          }
        };
        await netFirewall.addNetFirewallRule(ipRule_01).then((result: number) => {
          console.info(`${caseName} rule Id: `, result);
          ExpectTrue(true);
          done();
        }, (reason: BusinessError) => {
          ExpectFail();
          done();
          console.error(`${caseName} add firewall rule failed: `, JSON.stringify(reason));
        });
      }catch (err){
        console.log("test end");
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.number : SUB_Network_NetFirewall_AddNetFirewallRule_0200
     * @tc.name   : testNetFirewallAddNetFirewallRule_0200
     * @tc.desc   : Add a NetFirewallRule
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetFirewallAddNetFirewallRule_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetFirewallAddNetFirewallRule_0200';
      console.info(`${caseName}---Start`);
      try{
        let ipRule_01: netFirewall.NetFirewallRule = {
          name: "rule10",
          description: "rule10 description",
          direction: ruleDirection_RULE_IN,
          action: ruleAction_RULE_DENY,
          type: ruleType_RULE_IP,
          isEnabled: true,
          appUid: 20001,
          protocol: 6,
          userId: 100
        };
        await netFirewall.addNetFirewallRule(ipRule_01).then((result: number) => {
          console.info(`${caseName} rule Id: `, result);
          ExpectTrue(true);
          done();
        }, (reason: BusinessError) => {
          ExpectFail();
          done();
          console.error(`${caseName} add firewall rule failed: `, JSON.stringify(reason));
        });

      }catch (err){
        console.log("test end");
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Network_NetFirewall_setNetFirewallPolicy_0100
     * @tc.name   : testNetFirewallSetNetFirewallPolicy_0100
     * @tc.desc   : Set NetFirewall Policy
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetFirewallSetNetFirewallPolicy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function) => {
      const caseName: string = 'testNetFirewallSetNetFirewallPolicy_0100';
      console.info(`${caseName}---Start`);
      try{
        let policy: netFirewall.NetFirewallPolicy = {
          isOpen: true,
          inAction: ruleAction_RULE_ALLOW,
          outAction: ruleAction_RULE_ALLOW
        };
        await netFirewall.setNetFirewallPolicy(userId, policy).then(() => {
          console.info(`${caseName} set firewall policy success.`);
          ExpectTrue(true);
          done();
        }).catch((error : BusinessError) => {
          console.info(`${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectFail();
          done();
        });
      }catch (err){
        console.log("test end");
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.number : SUB_Network_NetFirewall_getNetFirewallRules_0100
     * @tc.name   : testNetFirewallGetNetFirewallRules0100
     * @tc.desc   : Get NetFirewallRules
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetFirewallGetNetFirewallRules0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function) => {
      const caseName: string = 'testNetFirewallGetNetFirewallRules0100';
      console.info(`${caseName}---Start`);
      try{
        let ruleParam: netFirewall.RequestParam = {
          page: 1,
          pageSize: 10,
          orderField: orderField_ORDER_BY_RULE_NAME,
          orderType: orderType_ORDER_ASC
        };
        await netFirewall.getNetFirewallRules(userId, ruleParam).then((result: netFirewall.FirewallRulePage) => {
          console.info(`${caseName} getNetFirewallRules success :`, JSON.stringify(result));
          Current_Ruler_ID = result.data[0].id;
          ExpectTrue(result.page != undefined);
          ExpectTrue(result.pageSize != undefined);
          ExpectTrue(result.totalPage != undefined);
          ExpectTrue(result.data != undefined);
          done();
        }, (error: BusinessError) => {
          console.error("get firewall rules failed: " + JSON.stringify(error));
          ExpectFail();
        });
      }catch (err){
        console.log(`${caseName} test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Network_NetFirewall_getNetFirewallRule_0100
     * @tc.name   : testNetFirewallGetNetFirewallRule_0100
     * @tc.desc   : Get NetFirewall rule
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */

    it('testNetFirewallGetNetFirewallRule_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetFirewallGetNetFirewallRule_0100';
      console.info(`${caseName}---Start`);
      try{
        await netFirewall.getNetFirewallRule(userId, Current_Ruler_ID).then((rule: netFirewall.NetFirewallRule) => {
          console.info(`${caseName} result:`, JSON.stringify(rule));
          Current_Ruler_ID = rule.id;
          ExpectTrue(true);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(false);
          done();
        });
      }catch (err){
        console.log("test end");
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })




    /**
     * @tc.number : SUB_Network_NetFirewall_getNetFirewallPolicy_0100
     * @tc.name   : testNetFirewallGetNetFirewallPolicy_0100
     * @tc.desc   : Get NetFirewall Policy
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetFirewallGetNetFirewallPolicy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function) => {
      const caseName: string = 'testNetFirewallGetNetFirewallPolicy_0100';
      console.info(`${caseName}---Start`);
      try{
        await netFirewall.getNetFirewallPolicy(userId).then((result: netFirewall.NetFirewallPolicy)=>{
          console.log(`${caseName} getNetFirewallPolicy success`)
          console.log('firewall policy: ', JSON.stringify(result));
          ExpectTrue(result.isOpen != undefined);
          ExpectTrue(result.inAction != undefined);
          ExpectTrue(result.outAction!= undefined);
          done();
        },(reason: BusinessError) => {
          console.error('get firewall policy failed: ', JSON.stringify(reason));
          ExpectFail();
          done()
        })
      }catch (err){
        console.log(`${caseName} getNetFirewallPolicy failed Error is `,err)
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Network_NetFirewall_updateNetFirewallRule_0100
     * @tc.name   : testNetFirewallupdateNetFirewallRule_0100
     * @tc.desc   : update NetFirewallRule
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */

    it('testNetFirewallupdateNetFirewallRule_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetFirewallupdateNetFirewallRule_0100';
      console.info(`${caseName}---Start`);
      try{
        let ipRuleUpd: netFirewall.NetFirewallRule = {
          userId:userId,
          id: Current_Ruler_ID,
          name: "rule2",
          description: "rule1 description update",
          direction: ruleDirection_RULE_IN,
          action: ruleAction_RULE_ALLOW,
          type: ruleType_RULE_IP,
          isEnabled: false,
          appUid: 20001
        };
        await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
          console.info(`${caseName}update firewall rule success.`);
          ExpectTrue(true);
          done();
        }, (reason: BusinessError) => {
          console.log(`${caseName}update firewall rule failed: `, JSON.stringify(reason));
          ExpectTrue(false);
          done();
        }).catch((err:BusinessError)=>{
          console.log(`${caseName} update firewall rule failed: `,JSON.stringify(err));
          ExpectTrue(false);
          done();
        });
      }catch (err){
        console.log("test end ");
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.number : SUB_Network_NetFirewall_RemoveNetFirewallRule_0100
     * @tc.name   : testNetFirewallRemoveNetFirewallRule_0100
     * @tc.desc   : Remove NetFirewall Rule
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetFirewallRemoveNetFirewallRule_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function) => {
      const caseName: string = 'testNetFirewallRemoveNetFirewallRule_0100';
      console.info(`${caseName}---Start`);
      try{
        await netFirewall.removeNetFirewallRule(userId, Current_Ruler_ID).then(() => {
          console.info("delete firewall rule success.");
          ExpectTrue(true);
          done();
        }).catch((error : BusinessError) => {
          console.error("delete firewall rule failed: " + JSON.stringify(error));
          ExpectTrue(false);
          done();
        });
      }catch (err){
        console.log("test end");
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        done();
      }
    })
  })
}
