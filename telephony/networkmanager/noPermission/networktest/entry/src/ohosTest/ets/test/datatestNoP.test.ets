import { describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { data } from "@kit.TelephonyKit";
import { BusinessError } from "@kit.BasicServicesKit";

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
const apnInfoParameter: data.ApnInfo = {
  apnName: 'apnName',
  apn: 'apn',
  mcc: 'mcc',
  mnc: 'mnc',
  user: 'user',
  type: 'type',
  proxy: 'proxy',
  mmsproxy: 'mmsproxy'
}
export default function datatestNoPTest() {
  describe('datatestNoPTest',  () => {

    /**
     * @tc.number : SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_NoP_0100
     * @tc.name   : testTelephonyDataIsCellularDataRoamingEnabledSyncNoP_0100
     * @tc.desc   : isCellularDataRoamingEnabledSync No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyDataIsCellularDataRoamingEnabledSyncNoP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabledSyncNoP_0100';
      console.info(`${caseName} test start `);
      try {
        let isEnabled: boolean = await data.isCellularDataRoamingEnabledSync(1);
        console.log(`${caseName} get result success `,isEnabled)
        ExpectTrue(false);
        done();
      } catch (error) {
        console.info(`${caseName} fall`,JSON.stringify(error));
        ExpectTrue(error.code == 201);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number : SUB_Telephony_Data_IsCellularDataEnabledSync_NoP_0200
     * @tc.name   : testTelephonyDataIsCellularDataEnabledSyncNoP_0200
     * @tc.desc   : isCellularDataEnabledSync No permission
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testTelephonyDataIsCellularDataEnabledSyncNoP_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3  ,async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabledSyncNoP_0200';
      console.info(`${caseName} test start `);
      try {
        let isEnabled: Boolean = data.isCellularDataEnabledSync();
        console.log(`${caseName} isCellularDataEnabledSync get success`,isEnabled)
        ExpectTrue(false);
        done();
      }catch (err){
        console.log(`${caseName} catch error in `,JSON.stringify(err))
        ExpectTrue(err.code == 201)
        done();
      }


    })

    /**
     * @tc.number : SUB_Telephony_Data_QueryAllApns_NoP_0300
     * @tc.name   : testTelephonyDataQueryAllApnsNoP_0300
     * @tc.desc   : QueryAllApns No permission
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyDataQueryAllApnsNoP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      let caseName: string = 'testTelephonyDataQueryAllApnsNoP_0300';
      console.info(`${caseName} test start `);
      try {
        await data.queryAllApns().then(()=>{
          console.log(`${caseName}  get queryAllApns success `)
          ExpectTrue(false)
          done()
        }).catch((err: BusinessError )=>{
          console.log(`${caseName} catch error in`,err)
          ExpectTrue(err.code == 201)
          done();
        })
      } catch (error) {
        console.info(`${caseName} fall`,JSON.stringify(error));
        ExpectTrue(error.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number : SUB_Telephony_Data_QueryApnIds_NoP_0400
     * @tc.name   : testTelephonyDataQueryApnIdsNoP_0400
     * @tc.desc   : queryApnIds No permission
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyDataQueryApnIdsNoP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testTelephonyDataQueryApnIdsNoP_0400';
      console.info(`${caseName} test start `);
      try {
        await data.queryApnIds(apnInfoParameter).then(()=>{
          console.log(`${caseName}  get queryAllApns success `)
          ExpectTrue(false)
          done()
        }).catch((err: BusinessError )=>{
          console.log(`${caseName} catch error in`,err)
          ExpectTrue(err.code == 201)
          done();
        })
      } catch (error) {
        console.info(`${caseName} fall`,JSON.stringify(error));
        ExpectTrue(error.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number : SUB_Telephony_Data_SetPreferredApn_NoP_0500
     * @tc.name   : testTelephonyDataSetPreferredApnNoP_0500
     * @tc.desc   : setPreferredApn No permission
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyDataSetPreferredApnNoP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testTelephonyDataSetPreferredApnNoP_0500';
      console.info(`${caseName} test start `);
      try {
        await data.setPreferredApn(1).then(()=>{
          console.log(`${caseName}  setPreferredApn success `)
          ExpectTrue(false)
          done()
        }).catch((err: BusinessError )=>{
          console.log(`${caseName} catch error in`,err)
          ExpectTrue(err.code == 201)
          done();
        })
      } catch (error) {
        console.info(`${caseName} fall`,JSON.stringify(error));
        ExpectTrue(error.code == 201);
        done();
        console.info(`${caseName} test end`);
      }
    });;
  })
}
