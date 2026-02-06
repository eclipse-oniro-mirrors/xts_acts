import { describe, it, expect, Level, TestType, Size, beforeAll, afterAll } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import netFirewall from '@ohos.net.netFirewall';
import { JSON } from '@kit.ArkTS';

export default function NetfirewallErrorCode01() {
  describe('NetfirewallErrorCodeTest01',  () => {
    const UID:number = 100;
    let CURRENT_ID :number | undefined = -1;
    let ipRule: netFirewall.NetFirewallRule = {
      name: "rule01",
      description: "rule01 description",
      direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
      action: netFirewall.FirewallRuleAction.RULE_ALLOW,
      type: netFirewall.NetFirewallRuleType.RULE_IP,
      isEnabled: true,
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
    };
    let ipRulers : netFirewall.NetFirewallIpParams [] = []
    const ruleParam: netFirewall.RequestParam = {
      page: 1,
      pageSize: 10,
      orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
      orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
    };
    let portRulers : netFirewall.NetFirewallPortParams [] = []
    let domainRulers : netFirewall.NetFirewallDomainParams [] = []

    const ExpectTrue: (n: boolean) => void = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
      }
    };
    const getName:() => string=()=>{
      return "ruler"+ (Math.random()*1000000).toFixed(0)+(Math.random()*10000).toFixed(0)
    }
    const getDomainName:() => string=()=>{
      return "www.baidu"+ (Math.random()*1000).toFixed(0)+(Math.random()*10000).toFixed(0)+".com"
    }

   let updateCurrentId: (caseName: string) => void = async (caseName: string)=>{
      try{
        await netFirewall.getNetFirewallRules(UID, ruleParam).then((result: netFirewall.FirewallRulePage) => {
          if(result.data.length == 0) CURRENT_ID = -1
          else CURRENT_ID = result.data[0].id == undefined ? -1: result.data[0].id
        }, (error: BusinessError) => {
          console.error(caseName, " get firewall rules failed err in : " + JSON.stringify(error));
        });
      }catch (err){
        console.error(caseName, "  update CurrentId failed err in : " + JSON.stringify(err));
      }
    }

    let removedAll:  (deleteNum: number) => void = async (deleteNum: number)=>{
      try {
        let i = 0
        while (i<deleteNum && CURRENT_ID !=-1){
          i++;
          await netFirewall.removeNetFirewallRule(UID,CURRENT_ID).catch((error : BusinessError) => {
            i = 2000
            console.error(" delete firewall rule failed: " + JSON.stringify(error));
          });
          await updateCurrentId("remove调用")
        }
      }catch (err){
        console.error(" remove netfirewall catch err in ",JSON.stringify(err))
      }
    }

    let getIpRule: () => netFirewall.NetFirewallRule = ()=>{
      return  {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
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
        protocol: 6,
        localPorts: [
          {
            startPort: 1000,
            endPort: 1000
          },{
          startPort: 2000,
          endPort: 2001
        }],
        remotePorts: [
          {
            startPort: 443,
            endPort: 443
          }],
        userId: 100
      };
    }
    let getMoreIPRule: (ipNumber: number) => netFirewall.NetFirewallRule  = (ipNumber: number)=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      for(let i:number = 0 ; i<ipNumber; i++){
        ipRulers.push({
          family: 1,
          type: 1,
          address: "10.10.1.1"
        })
      }
      resultIpRulers.localIps = ipRulers
      return resultIpRulers
    }
    let getMorePortRule: () => netFirewall.NetFirewallRule  = ()=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      for(let i:number = 0 ; i<20; i++){
        portRulers.push(
          {
            startPort: 1000,
            endPort: 1000
          })
      }
      resultIpRulers.localPorts = portRulers
      return resultIpRulers
    }
    let getMoreDnsRule: () => netFirewall.NetFirewallRule  = ()=>{
      let resultRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_DNS,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      resultRulers.dns = {
        primaryDns:'1.1.1.1'
      }
      return resultRulers
    }
    let getMoreDomainRuler: () => netFirewall.NetFirewallRule  = ()=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_DOMAIN,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      for(let i:number = 0 ; i<100; i++){
        domainRulers.push(
          {
            isWildcard: false,
            domain: getDomainName()
          })
      }
      resultIpRulers.domains = domainRulers;
      return resultIpRulers
    }

    let getUpdateIPRule:(ipNumber: number) => netFirewall.NetFirewallRule  = (ipNumber: number)=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }
      for(let i:number = 0 ; i<ipNumber; i++){
        ipRulers.push({
          family: 1,
          type: 1,
          address: "10.10.1.1"
        })
      }
      resultIpRulers.localIps = ipRulers
      return resultIpRulers
    }
    let getUpdatePortRule : (portNumber: number) => netFirewall.NetFirewallRule  = (portNumber: number)=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id:CURRENT_ID
      }
      for(let i:number = 0 ; i<portNumber; i++){
        portRulers.push(
          {
            startPort: 1000,
            endPort: 1000
          })
      }
      resultIpRulers.localPorts = portRulers
      return resultIpRulers
    }
    let getUpdateDomainRuler: (domainNumber: number) => netFirewall.NetFirewallRule  = (domainNumber: number)=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_DOMAIN,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }
      for(let i:number = 0 ; i<domainNumber; i++){
        domainRulers.push(
          {
            isWildcard: false,
            domain: getDomainName()
          })
      }
      resultIpRulers.domains = domainRulers;
      return resultIpRulers
    }
    let getUpdateDnsRule: () => netFirewall.NetFirewallRule  = ()=>{
      let resultIpRulers :netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action:netFirewall.FirewallRuleAction.RULE_ALLOW,
        type:netFirewall.NetFirewallRuleType.RULE_DNS,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }

      resultIpRulers.dns = {
        primaryDns:'1.1.1.1'
      }
      return resultIpRulers
    }


    beforeAll(async ()=>{
      await updateCurrentId("beforeAll 调用的");
      await removedAll(100);

    })
    afterAll(async ()=>{
      await updateCurrentId("afterAll 调用的");
      await removedAll(700);
    })
    
    /**
     * @tc.name   testTelephonyNetfirewallErrCo0100
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0100
     * @tc.desc   removeNetFirewallRule The specified rule does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0100';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.removeNetFirewallRule(100, 999999).then(() => {
          console.info(`${caseName} delete firewall rule success.`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} delete firewall rule failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 29400006);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400006);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo0200
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0200
     * @tc.desc   updateNetFirewallRule The specified rule does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0200';
      console.info(`${caseName}---Start`);
      try{
        let ipRuleUpd: netFirewall.NetFirewallRule = {
          userId:100,
          id: 9999999,
          name: "rule2",
          description: "rule1 description update",
          direction: 1,
          action: 1,
          type: 1,
          isEnabled: false,
          appUid: 20001
        };
        await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
          console.info(`${caseName}update firewall rule success.`);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.log(`${caseName}update firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 29400006);
          done();
        }).catch((err:BusinessError)=>{
          console.log(`${caseName} update firewall rule failed: `,JSON.stringify(err));
          ExpectTrue(false);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400006);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo0300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0300
     * @tc.desc   removeNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0300';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.removeNetFirewallRule(205, 999999).then(() => {
          console.info(`${caseName} delete firewall rule success.`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} delete firewall rule failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 29400000);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo0400
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0400
     * @tc.desc   getNetFirewallRule The specified rule does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0400';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRule(UID, 999999).then((rule: netFirewall.NetFirewallRule) => {
          console.info(`${caseName} result:`, JSON.stringify(rule));
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(` ${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 29400006);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400006);
        done();
      }
    })


    /**
     * @tc.name   testTelephonyNetfirewallErrCo0500
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0500
     * @tc.desc   removeNetFirewallRule	Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0500';
      console.info(`${caseName}---Start`);
      let InvalidParameter:number = 999999999999999999999999999999999999;
      try{
        netFirewall.removeNetFirewallRule(InvalidParameter, InvalidParameter).then(() => {
          console.info(`${caseName} delete firewall rule success.`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} delete firewall rule failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 2100001);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo0600
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0600
     * @tc.desc   getNetFirewallRules Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0600';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRules(undefined, undefined).then((result: netFirewall.FirewallRulePage) => {
          console.info(`${caseName} result:`, JSON.stringify(result));
          ExpectTrue(false);
          done();
        }, (error: BusinessError) => {
          console.error("get firewall rules failed: " + JSON.stringify(error));
          ExpectTrue(error.code == 401);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo0700
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0700
     * @tc.desc   getNetFirewallRules The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0700';
      console.info(`${caseName}---Start`);
      try{
        let ruleParam: netFirewall.RequestParam = {
          page: 1,
          pageSize: 10,
          orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
          orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
        };
        netFirewall.getNetFirewallRules(555, ruleParam).then((result: netFirewall.FirewallRulePage) => {
          console.info(`${caseName} result:`, JSON.stringify(result));
          ExpectTrue(false);
          done();
        }, (error: BusinessError) => {
          console.error(`${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 29400000);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo0800
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0800
     * @tc.desc   getNetFirewallRules Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0800';
      console.info(`${caseName}---Start`);
      try{
        let ruleParam: netFirewall.RequestParam = {
          page: 1,
          pageSize: 10,
          orderField: 55,
          orderType: 55
        };
        netFirewall.getNetFirewallRules(100, ruleParam).then((result: netFirewall.FirewallRulePage) => {
          console.info(`${caseName} result:`, JSON.stringify(result));
          ExpectTrue(false);
          done();
        }, (error: BusinessError) => {
          console.error(`${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 2100001);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        done();
      }
    })


    /**
     * @tc.name   testTelephonyNetfirewallErrCo0900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0900
     * @tc.desc   getNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0900';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRule(500, 5).then((rule: netFirewall.NetFirewallRule) => {
          console.info(`${caseName} result:`, JSON.stringify(rule));
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(` ${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 29400000);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000);
        done();
      }
    })
    /**
     * @tc.name   testTelephonyNetfirewallErrCo1000
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1000
     * @tc.desc   getNetFirewallRule Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1000';
      console.info(`${caseName}---Start`);
      let InvalidParameter: number = 99999999999999999999999999;
      try{
        netFirewall.getNetFirewallRule(InvalidParameter, InvalidParameter).then((rule: netFirewall.NetFirewallRule) => {
          console.info(`${caseName} result:`, JSON.stringify(rule));
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(` ${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 2100001);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1100
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1100
     * @tc.desc   addNetFirewallRule Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1100';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.addNetFirewallRule(undefined).then((result: number) => {
          console.info(`${caseName} rule Id: `, result);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.error(`${caseName} add firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 401);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1200
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1200
     * @tc.desc   removeNetFirewallRule Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1200';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.removeNetFirewallRule(undefined, undefined).then(() => {
          console.info(`${caseName} delete firewall rule success.`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} delete firewall rule failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 401);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1300
     * @tc.desc   getNetFirewallPolicy Invalid parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1300';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallPolicy(500000000000000000000).then((result: netFirewall.NetFirewallPolicy) => {
          console.info(`${caseName} firewall policy: `, JSON.stringify(result));
          ExpectTrue(false);
          done();
        }, (error: BusinessError) => {
          console.error(`${caseName} get firewall policy failed: `, JSON.stringify(error));
          ExpectTrue(error.code == 2100001);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1400
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1400
     * @tc.desc   setNetFirewallPolicy Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo0100';
      console.info(`${caseName}---Start`);
      try{
        let policy: netFirewall.NetFirewallPolicy = {
          isOpen: true,
          inAction: netFirewall.FirewallRuleAction.RULE_DENY,
          outAction: netFirewall.FirewallRuleAction.RULE_ALLOW
        };
        netFirewall.setNetFirewallPolicy(undefined, policy).then(() => {
          console.info(`${caseName} set firewall policy success.`);
          ExpectTrue(false);
          done()
        }).catch((error : BusinessError) => {
          console.error(`${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 401)
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1500
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1500
     * @tc.desc   addNetFirewallRule Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1500';
      console.info(`${caseName}---Start`);
      try{
        let ipRule: netFirewall.NetFirewallRule = {
          name: "rule1",
          description: "rule1 description",
          direction: 5,
          action:5,
          type:5,
          isEnabled: false,
          appUid: 20001,
          userId: 100
        };
        netFirewall.addNetFirewallRule(ipRule).then((result: number) => {
          console.info(`${caseName} rule Id: `, result);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.error(`${caseName} add firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 2100001);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1600
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1600
     * @tc.desc   getNetFirewallPolicy Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1600';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallPolicy(undefined).then((result: netFirewall.NetFirewallPolicy) => {
          console.info(`${caseName} firewall policy: `, JSON.stringify(result));
          ExpectTrue(false);
          done();
        }, (error: BusinessError) => {
          console.error(`${caseName} get firewall policy failed: `, JSON.stringify(error));
          ExpectTrue(error.code == 401);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo1700
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1700
     * @tc.desc   getNetFirewallRule Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1700';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRule(undefined, 1).then((rule: netFirewall.NetFirewallRule) => {
          console.info(`${caseName} result:`, JSON.stringify(rule));
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(` ${caseName} get firewall rules failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 401);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    })


    /**
     * @tc.name   testTelephonyNetfirewallErrCo1800
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1800
     * @tc.desc   setNetFirewallPolicy Invalid parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1800';
      console.info(`${caseName}---Start`);
      try{
        let policy: netFirewall.NetFirewallPolicy = {
          isOpen: true,
          inAction: 5,
          outAction: 5
        };
        netFirewall.setNetFirewallPolicy(UID, policy).then(() => {
          console.info(`${caseName} set firewall policy success.`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 2100001)
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001 );
        done();
      }
    })


    /**
     * @tc.name   testTelephonyNetfirewallErrCo1900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1900
     * @tc.desc   setNetFirewallPolicy The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo1900';
      console.info(`${caseName}---Start`);
      try{
        let policy: netFirewall.NetFirewallPolicy = {
          isOpen: true,
          inAction: 1,
          outAction: 1
        };
        netFirewall.setNetFirewallPolicy(500, policy).then(() => {
          console.info(`${caseName} set firewall policy success.`);
          ExpectTrue(false);
          done();
        }).catch((error : BusinessError) => {
          console.error(`${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code == 29400000)
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000 );
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2000
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2000
     * @tc.desc   updateNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2000';
      console.info(`${caseName}---Start`);
      try{
        let ipRuleUpd: netFirewall.NetFirewallRule = {
          userId:555,
          id: 1,
          name: "rule2",
          description: "rule1 description update",
          direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
          action: netFirewall.FirewallRuleAction.RULE_ALLOW,
          type: netFirewall.NetFirewallRuleType.RULE_IP,
          isEnabled: false,
          appUid: 20001
        };
        await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
          console.info(`${caseName}update firewall rule success.`);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.log(`${caseName}update firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 29400000);
          done();
        }).catch((err:BusinessError)=>{
          console.log(`${caseName} update firewall rule failed: `,JSON.stringify(err));
          ExpectTrue(false);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000);
        done();
      }
    })
    /**
     * @tc.name   testTelephonyNetfirewallErrCo2100
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2100
     * @tc.desc   updateNetFirewallRule Invalid parameter value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2100';
      console.info(`${caseName}---Start`);
      try{
        let ipRuleUpd: netFirewall.NetFirewallRule = {
          userId:100,
          id: CURRENT_ID,
          name: "rule2",
          description: "rule1 description update",
          direction: 9,
          action: 9,
          type: 9,
          isEnabled: false,
          appUid: 20001,
        };
        await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
          console.info(`${caseName} update firewall rule success.`);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.log(`${caseName} update1 firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 2100001);
          done();
        })
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2200
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2200
     * @tc.desc   updateNetFirewallRule Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2200';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.updateNetFirewallRule(undefined).then(() => {
          console.info(`${caseName} update firewall rule success.`);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.error(`${caseName} update firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 401);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 401);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2300
     * @tc.desc   addNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2300';
      console.info(`${caseName}---Start`);
      try{
        let ipRule: netFirewall.NetFirewallRule = {
          name: "rule1",
          description: "rule1 description",
          direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
          action:netFirewall.FirewallRuleAction.RULE_ALLOW,
          type:netFirewall.NetFirewallRuleType.RULE_IP,
          isEnabled: false,
          appUid: 20001,
          userId: 500
        };
        netFirewall.addNetFirewallRule(ipRule).then((result: number) => {
          console.info(`${caseName} rule Id: `, result);
          ExpectTrue(false);
          done();
        }, (err: BusinessError) => {
          console.error(`${caseName} add firewall rule failed: `, JSON.stringify(err));
          ExpectTrue(err.code == 29400000);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2400
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2400
     * @tc.desc   getNetFirewallPolicy 	The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2400';
      console.info(`${caseName}---Start`);
      try{
        netFirewall.getNetFirewallPolicy(500).then((result: netFirewall.NetFirewallPolicy) => {
          console.info(`${caseName} firewall policy: `, JSON.stringify(result));
          ExpectTrue(false);
          done();
        }, (error: BusinessError) => {
          console.error(`${caseName} get firewall policy failed: `, JSON.stringify(error));
          ExpectTrue(error.code == 29400000);
          done();
        });
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400000);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2500
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2500
     * @tc.desc   addNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2500';
      console.info(`${caseName}---Start`);
      let i: number = 0;
      try{
        while(i<100){
          i++;
          await netFirewall.addNetFirewallRule(getMorePortRule()).catch(async (err:BusinessError)=>{
            console.log(`${caseName} err in`,JSON.stringify(err))
            ExpectTrue(err.code == 29400003)
            i = 2000;
            done();
            return
          });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400003);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2600
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2600
     * @tc.desc   addNetFirewallRule The number of IP address rules in the firewall rule exceeds the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2600';
      console.info(`${caseName}---Start`);
      let i: number = 0;
      try{
        while(i<5){
          i++;
          await netFirewall.addNetFirewallRule(getMoreIPRule(20)).catch(async (err:BusinessError)=>{
            console.log(`${caseName}  err in"`,JSON.stringify(err))
            ExpectTrue(err.code == 29400002)
            i = 2000;
            done();
          });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400002);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2700
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2700
     * @tc.desc   addNetFirewallRule The number of domain rules in the firewall rule exceeds the maximum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2700';
      console.info(`${caseName}---Start`);
      let i: number = 0;
      try{
        while(i<1001){
          i++;
          await netFirewall.addNetFirewallRule(getMoreDomainRuler()).then(()=>{
            console.log(`${caseName} add rule success`, i)
          }).catch(async (err:BusinessError)=>{
            console.log(`${caseName} err in `,JSON.stringify(err))
            ExpectTrue(err.code == 29400004 )
            i = 2000;
            done();
            return
          });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400004);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo3300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo3300
     * @tc.desc   updateNetFirewallRule The number of domain rules in the firewall rule exceeds the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo3300';
      console.info(`${caseName}---Start`);
      let i : number = 0;
      try{
        while (i< 600){
          i++
          await updateCurrentId(caseName);
          await netFirewall.updateNetFirewallRule(getUpdateDomainRuler(500)).catch(async (err:BusinessError)=>{
            console.log(`${caseName} err in"`,JSON.stringify(err))
            ExpectTrue(err.code == 29400004 )
            i=2000;
            done();
          });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400004);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2800
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2800
     * @tc.desc   updateNetFirewallRule The number of IP address rules in the firewall rule exceeds the maximum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2800';
      console.info(`${caseName}---Start`);
      try{
        await netFirewall.updateNetFirewallRule(getUpdateIPRule(100)).then(async ()=>{
          console.log(`${caseName} update ruler success `)
          ExpectTrue(false);
          done();
        })
          .catch(async (err: BusinessError)=>{
            console.log(`${caseName} update ruler failed`,JSON.stringify(err))
            ExpectTrue(err.code == 29400002)
            done();
          })
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400002);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo2900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2900
     * @tc.desc   updateNetFirewallRule The number of port rules in the firewall rule exceeds the maximum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo2900';
      console.info(`${caseName}---Start`);
      try{
        await netFirewall.updateNetFirewallRule(getUpdatePortRule(110)).then(()=>{
          console.log(`${caseName} update ruler success `)
          ExpectTrue(false);
          done();
        })
          .catch(async (err: BusinessError)=>{
            console.log(`${caseName} update ruler failed`,JSON.stringify(err))
            ExpectTrue(err.code == 29400003)
            done();
          })
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400003);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo3000
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3000
     * @tc.desc   addNetFirewallRule The dns rule is duplication.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo3000';
      console.info(`${caseName}---Start`);
      let i: number = 0;
      try{
        while(i<5){
          i++;
          await netFirewall.addNetFirewallRule(getMoreDnsRule()).then(()=>{
          }).catch(async (err:BusinessError)=>{
            console.log(`${caseName} err in `,JSON.stringify(err))
            ExpectTrue(err.code == 29400007)
            i = 2000;
            done();
            return
          });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400007);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo3200
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3200
     * @tc.desc   updateNetFirewallRule The dns rule is duplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo3200';
      console.info(`${caseName}---Start`);
      let i : number = 0;
      try{
        while (i<1000){
          i++;
          await updateCurrentId(caseName);
          await netFirewall.updateNetFirewallRule(getUpdateDnsRule()).catch(async (err:BusinessError)=>{
            console.log(`${caseName} err in"`,JSON.stringify(err))
            ExpectTrue(err.code == 29400007)
            i= 2000
            done();
          });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400007);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo3100
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3100
     * @tc.desc   addNetFirewallRule The number of firewall rules exceeds the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallErrCo3100';
      console.info(`${caseName}---Start`);
      let i: number = 0;
      try{
        while(i <1001){
          i++;
          await netFirewall.addNetFirewallRule(getIpRule())
            .catch(async (err:BusinessError)=>{
              console.log(`${caseName} err in `,JSON.stringify(err))
              ExpectTrue(err.code == 29400001)
              done();
              i = 2000;
            });
        }
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 29400001);
        done();
      }
    })
  })
}

