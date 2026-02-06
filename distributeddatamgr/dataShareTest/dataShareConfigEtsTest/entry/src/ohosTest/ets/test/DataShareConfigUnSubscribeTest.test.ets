/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { dataShare } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';

let g_handle: dataShare.DataProxyHandle | undefined = undefined;
let g_config: dataShare.DataProxyConfig = {
  type: 0 as dataShare.DataProxyType.SHARED_CONFIG
}
let testUri1 = "datashareproxy://com.acts.dataShare.config/test1";
let uris = [
  testUri1,
]
let TAG = "ttt ";

export default function dataShareConfigUnSubscribeTest() {
  describe("dataShareConfigUnSubscribeTest", () => {
    /**
     * 发布配置
     */
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
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "value is ok beforeAll",
          allowList: ["all"]
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] beforeEach publish failed, code=" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    })
    /**
     * 订阅uri
     */
    beforeEach(async () => {
      console.info(TAG + "beforeEach---------------------------------");
      let results = g_handle!.on("dataChange", uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
        console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
      });
      console.log(TAG + "[DataShareProvider] onProxyData success:" + JSON.stringify(results));
      results.forEach((result) => {
        console.info(TAG + `[DataShareProvider] URI:${result.uri},Result:${result.result}`);
        expect(result.result).assertEqual(0);
      });
    })
    /**
     * 取消订阅uri
     */
    afterEach(async () => {
      console.info(TAG + "afterEach---------------------------------");
      g_handle!.off("dataChange", uris, g_config, undefined);
    })
    /**
     * 删除配置
     */
    afterAll(async () => {
      console.info(TAG + "afterAll---------------------------------");
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
     * @tc.name dataShareConfigUnSubscribeTest001
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0890
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config, undefined);
        expect(results.length > 0).assertTrue();
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] off URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest001 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest002
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0900
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config, null);
        expect(results.length > 0).assertTrue();
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] off URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest002 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest003
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0910
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        g_handle!.off(null, uris, g_config);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigUnSubscribeTest003 failed.code =" + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest004
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0920
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        g_handle!.off(undefined, uris, g_config);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigUnSubscribeTest004 failed.code =" + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest005
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0930
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        g_handle!.off("dataChange", uris, null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigUnSubscribeTest005 failed.code =" + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest006
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0940
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        g_handle!.off("dataChange", uris, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigUnSubscribeTest006 failed.code =" + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest008
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0960
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        expect(results.length > 0).assertTrue();
        console.log(TAG + '[DataShareProvider] onProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest008 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest009
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0970
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tmpStr = "123456".repeat(34);
      let testUri = "datashareproxy://com.acts.dataShare.config/test11234" + tmpStr;
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] onProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest009 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest010
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0980
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tmpStr = "123456".repeat(34);
      let testUri = "datashareproxy://com.acts.dataShare.config/test11234" + tmpStr + "9";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] offProxyData success:' + JSON.stringify(results));
        expect().assertFail();
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest010 failed.code =' + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("15700014");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest011
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0990
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = " ";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] offProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest011 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest012
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_1000
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "@#￥%^&*";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] offProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest012 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest013
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_1010
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let results = g_handle!.off("dataChange", null, g_config);
        console.log(TAG + '[DataShareProvider] offProxyData success:' + JSON.stringify(results));
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigUnSubscribeTest013 failed.code =" + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest014
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_1020
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let results = g_handle!.off("dataChange", undefined, g_config);
        console.log(TAG + '[DataShareProvider] offProxyData success:' + JSON.stringify(results));
        expect().assertFail();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigUnSubscribeTest014 failed.code =" + err.code + ",message =" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest015
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_1030
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/ ";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] onProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest015 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest016
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_1050
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/路径";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] onProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest016 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name dataShareConfigUnSubscribeTest017
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_1060
     * @tc.desc single uri
     * @tc.size MediumTest
     * @tc.type RELIABILITY
     * @tc.level Level 1
     */
    it('dataShareConfigUnSubscribeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.off("dataChange", uris, g_config);
        console.log(TAG + '[DataShareProvider] onProxyData success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
          expect(result.uri).assertEqual(testUri);
        });
      } catch (err) {
        console.error(TAG + '[DataShareProvider] dataShareConfigUnSubscribeTest017 failed.code =' + err.code + ",message =" + err.message);
        expect().assertFail();
      }
    });
  })
}