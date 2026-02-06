import testndk from 'librdbQuery.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
let TAG = '[testLog-ets]';
export default function RdbQueryWithoutRowCountTest() {
  describe('RdbQueryWithoutRowCountTest', () => {

    beforeAll(() => {

    })
    beforeEach(() => {
      try {
        console.info( TAG +'testTag SetUpTestCase begin');
        let res:number = testndk.SetUpTestCase();
        console.info(TAG + 'testTag SetUpTestCase success ');
        expect(res == 0).assertTrue();
      }catch (err) {
        console.info(TAG + 'testTag SetUpTestCase fail. err: ' + err.code + err.message);
        // expect().assertFail();
      }
    })
    afterEach(() => {
      try {
        console.info( TAG +'testTag TearDownTestCase begin');
        let res:number = testndk.TearDownTestCase();
        console.info(TAG + 'testTag TearDownTestCase success ');
        expect(res == 0).assertTrue();
      }catch (err) {
        console.info(TAG + 'testTag TearDownTestCase fail. err: ' + err.code + err.message);
        // expect().assertFail();
      }
    })
    afterAll(() => {

    })

    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Normal_Get_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0100
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Normal_Get_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Normal_Get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Normal_Get_0100();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Normal_Get_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Normal_Get_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0200
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Normal_Get_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Normal_Get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Normal_Get_0200();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Normal_Get_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0300
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0400
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0500
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0600
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0600
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0700
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0600();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0700
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0800
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0700();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0800
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_0900
     * @tc.desc   OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0800();
      console.info(TAG + "OH_Rdb_QueryWithoutRowCount_Abnormal_InvalidArgs_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_QuerySqlWithoutRowCount_Normal_Get_0200
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_DQueryWithoutRowCount_1000
     * @tc.desc   OH_Rdb_QuerySqlWithoutRowCount_Normal_Get_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_QuerySqlWithoutRowCount_Normal_Get_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_QuerySqlWithoutRowCount_Normal_Get_0200();
      console.info(TAG + "OH_Rdb_QuerySqlWithoutRowCount_Normal_Get_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}