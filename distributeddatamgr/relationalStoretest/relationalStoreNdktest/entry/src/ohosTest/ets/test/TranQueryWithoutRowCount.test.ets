import testNdk from 'librdbTran.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
let TAG = '[testLog-ets]';
export default function TranQueryWithoutRowCountTest() {
  describe('TranQueryWithoutRowCountTest', () => {

    beforeAll(() => {

    })
    beforeEach(async () => {
      try {
        console.info( TAG +'testTag SetUpTestCase begin');
        let res = testNdk.SetUpTestCase();
        console.info(TAG + 'testTag SetUpTestCase success ');
        expect(res == 0).assertTrue();
      }catch (err) {
        console.info(TAG + 'testTag SetUpTestCase fail. err: ' + err.code + err.message);
        // expect().assertFail();
      }
    })
    afterEach(async () => {

      try {
        console.info( TAG +'testTag TearDownTestCase begin');
        let res = testNdk.TearDownTestCase();
        console.info(TAG + 'testTag TearDownTestCase success ');
        expect(res == 0).assertTrue();
      }catch (err) {
        console.info(TAG + 'testTag TearDownTestCase fail. err: ' + err.code + err.message);
        expect().assertFail();
      }
    })
    afterAll(() => {

    })

    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0100
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100();
      console.info(TAG + "SetUpTestCase res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0200
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200();
      console.info(TAG + "OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0300
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300();
      console.info(TAG + "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0400
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400();
      console.info(TAG + "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0500
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500();
      console.info(TAG + "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0600
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600();
      console.info(TAG + "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0700
     * @tc.desc   OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700();
      console.info(TAG + "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0800
     * @tc.desc   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100();
      console.info(TAG + "RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_0900
     * @tc.desc   RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200();
      console.info(TAG + "RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_RdbTransQueryWithoutRowCount_1000
     * @tc.desc   RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testNdk.RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300();
      console.info(TAG + "RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}