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
let TAG = "ttt ";

export default function dataShareConfigGetTest() {
  describe("dataShareConfigGetTest", () => {
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
        console.error(TAG + `[DataShareProvider] createDataProxyHandle failed: code:${err.code},message:${err.message}`);
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
        testUri1
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
    afterAll(async () => {
      console.info(TAG + "afterAll---------------------------------");
    })

    /**
     * @tc.name   dataShareConfigGetTest001
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0320
     * @tc.desc   uri is kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          expect(results.length > 0).assertTrue();
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(dataShare.DataProxyErrorCode.URI_NOT_EXIST);
            expect(result.value).assertEqual(undefined);
            expect(result.allowList).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest001 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest002
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0310
     * @tc.desc   uri length Equal 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tmpStr = "123456".repeat(33);
      let testUri = "datashareproxy://com.acts.dataShare.config/test1" + tmpStr;
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          expect(results.length > 0).assertTrue();
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(1);
            expect(result.value).assertEqual(undefined);
            expect(result.allowList).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest002 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest003
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0400
     * @tc.desc   uri length more than 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tmpStr = "123456".repeat(34);
      let testUri = "datashareproxy://com.acts.dataShare.config/test11234" + tmpStr + "9";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          expect(results.length > 0).assertTrue();
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest003 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("15700014");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest004
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0410
     * @tc.desc   uris
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let uris = []
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest004 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest005
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0420
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = " ";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(1);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest005 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest006
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0430
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "@#$%^&*";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(1);
            expect(result.uri).assertEqual(testUri);
            expect(result.value).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest006 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest007
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0440
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await g_handle!.get(null, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest007 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest008
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0450
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await g_handle!.get(undefined, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest008 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest009
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0460
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/ ";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(1);
            expect(result.uri).assertEqual(testUri);
            expect(result.value).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed.err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest009 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest010
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0470
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/@#$%^&*";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(1);
            expect(result.uri).assertEqual(testUri);
            expect(result.value).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed,err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest010 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest011
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0480
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/路径";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect(result.result).assertEqual(1);
            expect(result.uri).assertEqual(testUri);
            expect(result.value).assertEqual(undefined);
            expect(result.allowList).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed,err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest011 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest012
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0490
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, null).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed,err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest012 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest013
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0500
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        await g_handle!.get(uris, undefined).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            console.info(TAG + `[DataShareProvider] URI:${result.uri},Value:${result.value},Result:${result.result},AllowList:${result.allowList}`);
            expect().assertFail();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed,err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest013 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest014
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0510
     * @tc.desc   [uri] equal 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let uris: string[] = [];
      for (let i = 0; i < 64; i++) {
        let testUri = "datashareproxy://com.acts.dataShare.config/testMore" + i;
        uris.push(testUri);
      }
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          results.forEach((result) => {
            expect(result.result).assertEqual(1);
            expect(result.value).assertEqual(undefined);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed,err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest014 failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.name   dataShareConfigGetTest015
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0520
     * @tc.desc   [uri] more than 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let uris: string[] = [];
      for (let i = 0; i < 65; i++) {
        let testUri = "datashareproxy://com.acts.dataShare.config/test" + i;
        uris.push(testUri);
      }
      try {
        await g_handle!.get(uris, g_config).then((results: dataShare.DataProxyGetResult[]) => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(TAG + "[DataShareProvider] get failed,err =" + JSON.stringify(err));
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest015 failed,code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("15700014");
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest016
     * @tc.number SUB_DistributedData_DataShare_SDK_Expansion_0500
     * @tc.desc   get 4k value when default configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri1 = "datashareproxy://com.acts.dataShare.config/test";
      let uris = [testUri1];
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "valueisokgoodddd".repeat(256),
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
        let results = await g_handle!.get(uris, g_config);
        results.forEach(
          result => {
          expect(result.result).assertEqual(dataShare.DataProxyErrorCode.SUCCESS);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest016 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest017
     * @tc.number SUB_DistributedData_DataShare_SDK_Expansion_0600
     * @tc.desc   get 4k value when maxValueLength = MAX_LENGTH_4K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri1 = "datashareproxy://com.acts.dataShare.config/test";
      let uris = [testUri1];
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "valueisokgoodddd".repeat(256),
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        let config_get: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 4096 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_4K
        }
        await g_handle!.publish(proxyData, g_config);
        let results = await g_handle!.get(uris, config_get);
        results.forEach(
          result => {
          expect(result.result).assertEqual(dataShare.DataProxyErrorCode.SUCCESS);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest017 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest018
     * @tc.number SUB_DistributedData_DataShare_SDK_Expansion_0700
     * @tc.desc   get 4k value when maxValueLength = MAX_LENGTH_100K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri1 = "datashareproxy://com.acts.dataShare.config/test";
      let uris = [testUri1];
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "valueisokgoodddd".repeat(256),
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        let config_get: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 102400 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_100K
        }
        await g_handle!.publish(proxyData, g_config);
        let results = await g_handle!.get(uris, config_get);
        results.forEach(
          result => {
          expect(result.result).assertEqual(dataShare.DataProxyErrorCode.SUCCESS);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest018 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest019
     * @tc.number SUB_DistributedData_DataShare_SDK_Expansion_0800
     * @tc.desc   get 100k value when default configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri1 = "datashareproxy://com.acts.dataShare.config/test";
      let uris = [testUri1];
      try {
        let config_publish: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 102400 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_100K
        }
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "valueisokgoodddd".repeat(6400),
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, config_publish);
        let results = await g_handle!.get(uris, g_config);
        results.forEach(
          result => {
          expect(result.result).assertEqual(dataShare.DataProxyErrorCode.OVER_LIMIT);
        });
        await g_handle!.delete(config_publish);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest019 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest020
     * @tc.number SUB_DistributedData_DataShare_SDK_Expansion_0900
     * @tc.desc   get 100k value when maxValueLength = MAX_LENGTH_4K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri1 = "datashareproxy://com.acts.dataShare.config/test";
      let uris = [testUri1];
      try {
        let config_publish: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 102400 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_100K
        }
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "valueisokgoodddd".repeat(6400),
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        let config_get: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 4096 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_4K
        }
        await g_handle!.publish(proxyData, config_publish);
        let results = await g_handle!.get(uris, config_get);
        results.forEach(
          result => {
          expect(result.result).assertEqual(dataShare.DataProxyErrorCode.OVER_LIMIT);
        });
        await g_handle!.delete(config_publish);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest020 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigGetTest021
     * @tc.number SUB_DistributedData_DataShare_SDK_Expansion_1000
     * @tc.desc   get 100k value when maxValueLength = MAX_LENGTH_100K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigGetTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri1 = "datashareproxy://com.acts.dataShare.config/test";
      let uris = [testUri1];
      try {
        let config_publish: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 102400 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_100K
        }
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "valueisokgoodddd".repeat(6400),
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        let config_get: dataShare.DataProxyConfig = {
          type: 0 as dataShare.DataProxyType.SHARED_CONFIG,
          maxValueLength: 102400 as dataShare.DataProxyMaxValueLength.MAX_LENGTH_100K
        }
        await g_handle!.publish(proxyData, config_publish);
        let results = await g_handle!.get(uris, config_get);
        results.forEach(
          result => {
          expect(result.result).assertEqual(dataShare.DataProxyErrorCode.SUCCESS);
        });
        await g_handle!.delete(config_publish);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigGetTest021 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
  })
}