/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import { dataShare } from '@kit.ArkData';
import data_dataSharePredicates from '@ohos.data.dataSharePredicates';

let g_handle: dataShare.DataProxyHandle | undefined = undefined;
let g_config: dataShare.DataProxyConfig = {
  type: 0 as dataShare.DataProxyType.SHARED_CONFIG
}
let testUri1 = "datashareproxy://com.acts.dataShare.config/test1";
let testUri2 = "datashareproxy://com.acts.dataShare.config/test2";
let TAG = "ttt ";

export default function DataSharePredicatesErrTest() {
  describe('DataSharePredicatesErrTest', () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll---------------------------------");
      await dataShare.createDataProxyHandle().then((handle: dataShare.DataProxyHandle) => {
        if (handle == null || handle == undefined) {
          console.log(TAG + "[DataShareProvider] createDataProxyHandle failed,handle is null");
          return;
        }
        g_handle = handle;
        console.log(TAG + "[DataShareProvider] createDataProxyHandle success");
      }).catch((err: BusinessError) => {
        console.error(TAG + `[DataShareProvider] createDataProxyHandle failed: code:${err.code},message:${err.message}`)
      })
    })
    beforeEach(async () => {
      console.info(TAG + "beforeEach---------------------------------");
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "value is ok beforeEach",
          allowList: ["all"]
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] beforeEach publish failed, code=" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    })
    afterEach(async () => {
      console.info(TAG + "afterEach---------------------------------");
      let uris = [
        testUri1,
        testUri2
      ]
      try {
        await g_handle!.delete(uris, g_config).then((results: dataShare.DataProxyResult[]) => {
          console.log("[ttt] [DataShareProvider] afterEach delete success,results:" + JSON.stringify(results));
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] delete failed.code=" + err.code + ",message=" + err.message);
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] afterEach delete failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_CreateDataProxyHandle0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0010
     * @tc.desc   SUB_DataShare_CreateDataProxyHandle0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_DataShare_CreateDataProxyHandle0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info(TAG + "SUB_DataShare001_CreateDataProxyHandle-start");
      await dataShare.createDataProxyHandle().then((handle: dataShare.DataProxyHandle) => {
        if (handle == null || handle == undefined) {
          console.log(TAG + "[DataShareProvider] createDataProxyHandle failed,handle is null");
          return;
        }
        g_handle = handle;
        expect(g_handle).assertInstanceOf("Object");
        console.log(TAG + "SUB_DataShare_CreateDataProxyHandle0001 success");
      }).catch((err: BusinessError) => {
        console.error(TAG + `SUB_DataShare_CreateDataProxyHandle0001 failed: code:${err.code},message:${err.message}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_DataShare_OnDataChange0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0020
     * @tc.desc   SUB_DataShare_OnDataChange0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OnDataChange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on(null, uris, g_config, (err, changeInfo) => {
          console.log(TAG + "SUB_DataShare_OnDataChange0001 receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        expect(results.length > 0).assertTrue();
        console.log(TAG + 'SUB_DataShare_OnDataChange0001 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `SUB_DataShare_OnDataChange0001 URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "SUB_DataShare_OnDataChange0001 failed,err =" + JSON.stringify(err));
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   SUB_DataShare_OnDataChange0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0030
     * @tc.desc   SUB_DataShare_OnDataChange0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OnDataChange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on(undefined, uris, g_config, (err, changeInfo) => {
          console.log(TAG + "SUB_DataShare_OnDataChange0002:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        expect(results.length > 0).assertTrue();
        console.log(TAG + 'SUB_DataShare_OnDataChange0002 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `SUB_DataShare_OnDataChange0002 URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "SUB_DataShare_OnDataChange0002 failed,err =" + JSON.stringify(err));
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   SUB_DataShare_OffDataChange0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0040
     * @tc.desc   SUB_DataShare_OffDataChange0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OffDataChange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.example.myapplication/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off(null, uris, g_config, undefined);
        expect(results.length > 0).assertTrue();
        results.forEach((result) => {
          console.info(TAG + `SUB_DataShare_OffDataChange0001 URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + 'SUB_DataShare_OffDataChange0001 failed.code =' + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   SUB_DataShare_OffDataChange0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0050
     * @tc.desc   SUB_DataShare_OffDataChange0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OffDataChange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.example.myapplication/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off(undefined, uris, g_config, undefined);
        expect(results.length > 0).assertTrue();
        results.forEach((result) => {
          console.info(TAG + `SUB_DataShare_OffDataChange0002 URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + 'SUB_DataShare_OffDataChange0002 failed.code =' + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   SUB_DataShare_OffDataChange0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0060
     * @tc.desc   SUB_DataShare_OffDataChange0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OffDataChange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.example.myapplication/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", [], g_config, undefined);
        expect(results.length > 0).assertTrue();
        results.forEach((result) => {
          console.info(TAG + `SUB_DataShare_OffDataChange0003 URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + 'SUB_DataShare_OffDataChange0003 failed.code =' + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   SUB_DataShare_EqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0070
     * @tc.desc   SUB_DataShare_EqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_EqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo(null, "zhangSan");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_EqualTo0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_EqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0080
     * @tc.desc   SUB_DataShare_EqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_EqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo(undefined, "zhangSan");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_EqualTo0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_EqualTo0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0090
     * @tc.desc   SUB_DataShare_EqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_EqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("", "zhangSan");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_EqualTo0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0100
     * @tc.desc   SUB_DataShare_NotEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo(null, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotEqualTo0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotEqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0110
     * @tc.desc   SUB_DataShare_NotEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo(undefined, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotEqualTo0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotEqualTo0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0120
     * @tc.desc   SUB_DataShare_NotEqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo("", 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotEqualTo0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_BeginWrap0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0130
     * @tc.desc   SUB_DataShare_BeginWrap0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_BeginWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.beginWrap();
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_BeginWrap0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_EndWrap0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0140
     * @tc.desc   SUB_DataShare_EndWrap0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_EndWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.endWrap();
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_EndWrap0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Or0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0150
     * @tc.desc   SUB_DataShare_Or0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Or0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.or();
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Or0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_And0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0160
     * @tc.desc   SUB_DataShare_And0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_And0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.and();
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_And0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Like0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0170
     * @tc.desc   SUB_DataShare_Like0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Like0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like(null, "li%");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Like0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Like0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0180
     * @tc.desc   SUB_DataShare_Like0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Like0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like(undefined, "li%");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Like0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Like0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0190
     * @tc.desc   SUB_DataShare_Like0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Like0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like("name", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Like0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Like0004
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0200
     * @tc.desc   SUB_DataShare_Like0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Like0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like("name", undefined);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Like0004 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Like0005
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0210
     * @tc.desc   SUB_DataShare_Like0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Like0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like("", "li%");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Like0005 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Like0006
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0220
     * @tc.desc   SUB_DataShare_Like0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Like0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.like("name", "");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Like0006 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Between0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0230
     * @tc.desc   SUB_DataShare_Between0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Between0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.between(null, 2, 4);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Between0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Between0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0240
     * @tc.desc   SUB_DataShare_Between0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Between0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.between(undefined, 2, 4);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Between0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Between0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0250
     * @tc.desc   SUB_DataShare_Between0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Between0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.between("", 2, 4);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Between0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotBetween0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0260
     * @tc.desc   SUB_DataShare_NotBetween0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotBetween0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notBetween(null, 2, 4);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotBetween0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotBetween0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0270
     * @tc.desc   SUB_DataShare_NotBetween0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotBetween0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notBetween(undefined, 2, 4);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotBetween0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotBetween0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0280
     * @tc.desc   SUB_DataShare_NotBetween0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotBetween0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notBetween("", 2, 4);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotBetween0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_GreaterThan0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0290
     * @tc.desc   SUB_DataShare_GreaterThan0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_GreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThan(null, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_GreaterThan0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_GreaterThan0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0300
     * @tc.desc   SUB_DataShare_GreaterThan0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_GreaterThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThan(undefined, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_GreaterThan0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_GreaterThan0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0310
     * @tc.desc   SUB_DataShare_GreaterThan0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_GreaterThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThan("", 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_GreaterThan0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_LessThan0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0320
     * @tc.desc   SUB_DataShare_LessThan0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_LessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThan(null, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_LessThan0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_LessThan0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0330
     * @tc.desc   SUB_DataShare_LessThan0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_LessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThan(undefined, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_LessThan0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_LessThan0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0340
     * @tc.desc   SUB_DataShare_LessThan0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_LessThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThan("", 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_LessThan0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_GreaterThanOrEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0350
     * @tc.desc   SUB_DataShare_GreaterThanOrEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_GreaterThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo(null, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_GreaterThanOrEqualTo0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_GreaterThanOrEqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0360
     * @tc.desc   SUB_DataShare_GreaterThanOrEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_GreaterThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo(undefined, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_GreaterThanOrEqualTo0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_GreaterThanOrEqualTo0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0370
     * @tc.desc   SUB_DataShare_GreaterThanOrEqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_GreaterThanOrEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo("", 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_GreaterThanOrEqualTo0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_LessThanOrEqualTo0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0380
     * @tc.desc   SUB_DataShare_LessThanOrEqualTo0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_LessThanOrEqualTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo(null, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_LessThanOrEqualTo0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_LessThanOrEqualTo0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0390
     * @tc.desc   SUB_DataShare_LessThanOrEqualTo0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_LessThanOrEqualTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo(undefined, 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_LessThanOrEqualTo0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_LessThanOrEqualTo0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0400
     * @tc.desc   SUB_DataShare_LessThanOrEqualTo0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_LessThanOrEqualTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo("", 18);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_LessThanOrEqualTo0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_OrderByAsc0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0410
     * @tc.desc   SUB_DataShare_OrderByAsc0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OrderByAsc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.orderByAsc("id");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_OrderByAsc0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_OrderByDesc0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0420
     * @tc.desc   SUB_DataShare_OrderByDesc0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_OrderByDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.orderByDesc("id");
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_OrderByDesc0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_Limit0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0430
     * @tc.desc   SUB_DataShare_Limit0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_Limit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan").limit(10, 3);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_Limit0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_In0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0440
     * @tc.desc   SUB_DataShare_In0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_In0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in(null, [18, 19]);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_In0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_In0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0450
     * @tc.desc   SUB_DataShare_In0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_In0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in(undefined, [18, 19]);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_In0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_In0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0460
     * @tc.desc   SUB_DataShare_In0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_In0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in("age", null);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_In0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_In0004
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0470
     * @tc.desc   SUB_DataShare_In0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_In0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in("age", undefined);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_In0004 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_In0005
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0480
     * @tc.desc   SUB_DataShare_In0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_In0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in("", [18, 19]);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_In0005 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotIn0001
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0490
     * @tc.desc   SUB_DataShare_NotIn0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notIn(null, [2, 4]);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotIn0001 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotIn0002
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0500
     * @tc.desc   SUB_DataShare_NotIn0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotIn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notIn(undefined, [2, 4]);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotIn0002 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_DataShare_NotIn0003
     * @tc.number SUB_DistributedData_DataShare_SDK_DataSharePredicatesErrtest_0510
     * @tc.desc   SUB_DataShare_NotIn0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DataShare_NotIn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.notIn("", [2, 4]);
        expect(predicates).assertInstanceOf("Object");
      } catch (e) {
        console.info(TAG + "SUB_DataShare_NotIn0003 fail err.code is " + e.code + "err.message is " + e.message);
        expect().assertFail();
      }
    })

  })
}