/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import intelligence from '@ohos.data.intelligence';
import { BusinessError } from "@ohos.base";
import deviceInfo from '@ohos.deviceInfo';

import hilog from '@ohos.hilog'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag  '; //日志标识字符串,作为tag标识当前runner类下的测试行为

let textConfig:intelligence.ModelConfig  = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"test"
}

let imageConfig:intelligence.ModelConfig = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"image"
}
let currentDeviceIsPc = false;

export default function intelligenceStaticErrTest() {
  let currentDeviceIsPc = false;
  describe('intelligenceStaticErrTest', () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      let deviceTypeInfo = deviceInfo.deviceType;
      console.info(TAG + "the value of the deviceType is : " + deviceInfo.deviceType + " " + currentDeviceIsPc);
    })
    beforeEach(async () => {
      console.info(TAG + "beforeEach");
    })
    afterEach(async () => {
      console.info(TAG + "afterEach");
    })
    afterAll(async () => {
      console.info(TAG + "afterAll");
    })

    console.info("*************intelligence Test begin**************");
    let retArray = [401, 801, 313000000];

    /**
     * @tc.name   intelligenceGetEmbeddingErrTest0100
     * @tc.number SUB_DistributedData_Intelligence_SDK_Static_Basic_Ets_ErrApi_ErrTest_0100
     * @tc.desc   getEmbedding argent null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceGetEmbeddingErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "intelligenceApiTest0700 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data:intelligence.TextEmbedding) => {
            console.info(TAG + "get intelligenceGetEmbeddingErrTest0100 result:" + data);
            data.getEmbedding('')
              .then((loadData) => {
                console.info(TAG + "700 getEmbedding result:" + loadData);
                let dataSize:number = loadData.length;
                let ret = dataSize > 0;
                expect().assertFail();
                done();
              })
              .catch((err) => {
                let error: BusinessError = err as BusinessError;
                expect(error.code).assertEqual(31300000);
                done();
              })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
          })
          .catch((err) => {
            let error: BusinessError = err as BusinessError;
            expect(error.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name   intelligenceGetEmbeddingErrTest0200
     * @tc.number SUB_DistributedData_Intelligence_SDK_Static_Basic_Ets_ErrApi_ErrTest_0200
     * @tc.desc   getEmbedding argent null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceGetEmbeddingErrTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "intelligenceGetEmbeddingErrTest0200 start");
      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then(async (data:intelligence.TextEmbedding) => {
            console.info(TAG + "intelligenceGetEmbeddingErrTest0200 get result: " + data);
            await data.loadModel();
            let batchTexts:Array<String> = ['11', '22', '33'];
            data.getEmbedding([])
              .then((loadData:Array<Array<double>>) => {
                console.info(TAG + "getEmbedding result 0900: " + loadData);
                let dataSize:number = loadData.length;
                let ret = dataSize > 0;
                expect(ret).assertEqual(true);
                done();
              })
              .catch ((err) =>{
                console.info(TAG + "getEmbedding result:" + err.code + err.message);
                expect(err.code).assertEqual(31300000);
                done();
              })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result: " + data);
            expect().assertFail();
            done();
          })
          .catch((err) => {
            let error: BusinessError = err as BusinessError;
            expect(error.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name   intelligenceGetEmbeddingErrTest0300
     * @tc.number SUB_DistributedData_Intelligence_SDK_Static_Basic_Ets_ErrApi_ErrTest_0300
     * @tc.desc   getEmbedding argent null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceGetEmbeddingErrTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "intelligenceGetEmbeddingErrTest0300 start");
      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then(async (data:intelligence.ImageEmbedding) => {
            console.info(TAG + "get result :" + data);
            await data.loadModel();
            let text:intelligence.Image = '111.jpg';
            data.getEmbedding('')
              .then((loadData) => {
                console.info(TAG + "getEmbedding result 0300 :" + loadData);
                expect().assertFail();
                done();
              })
              .catch((err) => {
                let error: BusinessError = err as BusinessError;
                expect(error.code).assertEqual(31300000);
                done();
              })
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err) => {
            let error: BusinessError = err as BusinessError;
            expect(error.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name   intelligenceSplitTextErrTest0100
     * @tc.number SUB_DistributedData_Intelligence_SDK_Static_Basic_Ets_ErrApi_ErrTest_0400
     * @tc.desc   splitText first argent null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceSplitTextErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "intelligenceApiTest2800 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText('', config);
          expect().assertFail();
          done();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          expect(error.code).assertEqual(31300000);
          done();
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err) => {
            let error: BusinessError = err as BusinessError;
            expect(error.code).assertEqual(801);
            done();
          })
      }
    })
  })
}