import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { networkSecurity } from '@kit.NetworkKit';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function networkSecurityNoP() {
  describe('networkSecurityNoPTest',  () => {

    /**
     * @tc.name   testTelephonyNetworkSecurityNop0100
     * @tc.number SUB_Telephony_networkSecurity_Nop_0100
     * @tc.desc   isCleartextPermitted No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetworkSecurityNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetfirewallNop0700';
      console.info(`${caseName}---Start`);
      try{
        let result: boolean = networkSecurity.isCleartextPermitted();
        console.info(`isCleartextPermitted Result: ${JSON.stringify(result)}`);
        ExpectTrue(false);
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetworkSecurityNop0200
     * @tc.number SUB_Telephony_networkSecurity_Nop_0200
     * @tc.desc   isCleartextPermittedByHostName No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetworkSecurityNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testTelephonyNetworkSecurityNop0200';
      console.info(`${caseName}---Start`);
      try{
        let result: boolean = networkSecurity.isCleartextPermittedByHostName('www.baidu.com');
        console.info(`isCleartextPermittedByHostName Result: ${JSON.stringify(result)}`);
        ExpectTrue(false);
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })
  })
}
