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
let testUri2 = "datashareproxy://com.acts.dataShare.config/test2";
let TAG = "ttt ";

export default function dataShareConfigSubscribeTest() {
  describe("dataShareConfigSubscribeTest", () => {
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
    afterAll(async () => {
      console.info(TAG + "afterAll---------------------------------");
    })

    /**
     * @tc.name   dataShareConfigSubscribeTest001
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0680
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        expect(results.length > 0).assertTrue();
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest001 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest001 failed,err =" + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest002
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0690
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tmpStr = "123456".repeat(34);
      let testUri = "datashareproxy://com.acts.dataShare.config/test11234" + tmpStr;
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        expect(results.length > 0).assertTrue();
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest002 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest002 failed,err =" + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest003
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0700
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tmpStr = "123456".repeat(34);
      let testUri = "datashareproxy://com.acts.dataShare.config/test11234" + tmpStr + "9";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        expect(results.length > 0).assertTrue();
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest003 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest003 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("15700014");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest004
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0710
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let uris = []
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest004 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest004 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest005
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0720
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = " ";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest005 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest005 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest006
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0730
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "@#$%^&*";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest006 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest006 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest007
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0740
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let results = g_handle!.on('dataChange', null, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest007 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest007 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest008
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0750
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let results = g_handle!.on('dataChange', undefined, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest008 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest008 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest009
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0760
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/ ";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest009 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest009 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest010
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0770
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/@#$%^&*";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest010 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest010 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest011
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0780
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/路径";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + '[DataShareProvider] dataShareConfigSubscribeTest011 success:' + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest011 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest012
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0790
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, null, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest012 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest012 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest013
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0800
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, undefined, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest013 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest013 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest014
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0810
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, null);
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest014 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest014 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest015
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0820
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, undefined);
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest015 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest015 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest016
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0830
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on(null, uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest016 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest016 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest017
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0840
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on(undefined, uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          expect().assertFail();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest017 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(1);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest017 failed.code =" + err.code + ",message=" + err.message);
        expect(err.code).assertEqual("401");
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest018
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0850
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          changeInfo.forEach((info) => {
            expect(info.type).assertEqual(2);
            expect(info.uri).assertEqual(testUri);
            expect(info.value).assertEqual("value is ok update");
          });
          g_handle!.off('dataChange', uris, g_config);
          done();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest018 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest018 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "value is ok update",
          allowList: ["all"]
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle!.publish(proxyData, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest018 publish failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest019
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0860
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          changeInfo.forEach((info) => {
            expect(info.type).assertEqual(1);
            expect(info.uri).assertEqual(testUri);
            expect(info.value).assertEqual("value is ok beforeEach");
          });
          g_handle!.off('dataChange', uris, g_config);
          done();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest019 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest019 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
      try {
        await g_handle!.delete(uris, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest019 publish failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest020
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0870
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest020 changeInfo : " + JSON.stringify(changeInfo));
          changeInfo.forEach((info) => {
            expect(info.type).assertEqual(dataShare.ChangeType.UPDATE);
            expect(info.uri).assertEqual(testUri);
            expect(info.value).assertEqual("aaaaa");
          });
          g_handle!.off('dataChange', uris, g_config, null);
          done();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest020 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest020 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
      try {
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "aaaaa",
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        await g_handle?.publish(proxyData, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest020 publish failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest021
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0880
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest021 changeInfo : " + JSON.stringify(changeInfo));
          changeInfo.forEach((info) => {
            expect(info.type).assertEqual(dataShare.ChangeType.DELETE);
            expect(info.uri).assertEqual(testUri);
            expect(info.value).assertEqual("value is ok beforeEach");
          });
          g_handle!.off('dataChange', uris, g_config, undefined);
          done();
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest021 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest021 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
      try {
        await g_handle!.delete(uris, g_config);
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest021 publish failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   dataShareConfigSubscribeTest022
     * @tc.number SUB_DistributedData_DataShare_SDK_ShareConfig_0950
     * @tc.desc   single uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataShareConfigSubscribeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testUri = "datashareproxy://com.acts.dataShare.config/test1";
      let uris = [
        testUri
      ]
      let count: number = 0;
      try {
        let results = g_handle!.on('dataChange', uris, g_config, (err: BusinessError, changeInfo: dataShare.DataProxyChangeInfo[]) => {
          console.log(TAG + "[DataShareProvider] onProxyData receive change:" + JSON.stringify(changeInfo));
          console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest022 changeInfo : " + JSON.stringify(changeInfo));
          console.log(TAG + "count:" + count);
          changeInfo.forEach((info) => {
            expect(info.uri).assertEqual(testUri);
            let infoType = count == 0 ? dataShare.ChangeType.DELETE : dataShare.ChangeType.INSERT;
            expect(info.type).assertEqual(infoType);
          });
        });
        console.log(TAG + "[DataShareProvider] dataShareConfigSubscribeTest022 success:" + JSON.stringify(results));
        results.forEach((result) => {
          console.info(TAG + `[DataShareProvider] URI: ${result.uri}, Result: ${result.result}`);
          expect(result.result).assertEqual(0);
        });
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest022 failed.code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
      try {
        await g_handle!.delete(uris, g_config);
        let proxyData: dataShare.ProxyData[] = [];
        let g_proxyDataAllowTest1: dataShare.ProxyData = {
          uri: testUri1,
          value: "value insert",
          allowList: []
        }
        proxyData.push(g_proxyDataAllowTest1);
        count += 1;
        await g_handle?.publish(proxyData, g_config);
        g_handle!.off("dataChange", uris, g_config, null);
        done();
      } catch (err) {
        console.error(TAG + "[DataShareProvider] dataShareConfigSubscribeTest022 publish failed,code =" + err.code + ",message=" + err.message);
        expect().assertFail();
      }
    });
  })
}