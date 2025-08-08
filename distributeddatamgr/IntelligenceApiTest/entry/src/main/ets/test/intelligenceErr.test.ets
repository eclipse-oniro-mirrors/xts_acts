/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import osAccount from '@ohos.account.osAccount';
import intelligence from '@ohos.data.intelligence'
import { BusinessError } from '@kit.BasicServicesKit';
import { config } from '@kit.AccessibilityKit';
import { ErrorCode } from '@kit.AbilityKit';
import deviceInfo from '@ohos.deviceInfo';


const TAG =["Intelligence_Test"];

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


export default function intelligenceErrTest() {
  let currentDeviceIsPc = false;
  describe('intelligenceErrTest', () => {
    beforeAll(() => {
      console.info(TAG + "beforeAll");
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsPc = deviceTypeInfo === '2in1' ? true : false;
      console.info(TAG + "the value of the deviceType is : " + deviceInfo.deviceType);
    })
    beforeEach(() => {
      console.info(TAG + "beforeEach");
    })
    afterEach(() => {
      console.info(TAG + "afterEach");
    })
    afterAll(() => {
      console.info(TAG + "afterAll");
    })

    console.info("*************intelligence Test begin**************");
    let retArray = [401, 801, 313000000];

    /**
     * @tc.name intelligenceApiTest2600
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2600
     * @tc.desc getImageEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2600 start");

      if (currentDeviceIsPc) {
        await intelligence.getImageEmbeddingModel(undefined)
          .then((data) => {
            console.info(TAG + "getImageEmbeddingModel success :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(401);
            done();
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest2700
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2700
     * @tc.desc getImageEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2700 start");
      if (currentDeviceIsPc) {
        await intelligence.getTextEmbeddingModel(undefined)
          .then((data) => {
            console.info(TAG + "getTextEmbeddingModel success :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "getTextEmbeddingModel fail" + err.code);
            expect(err.code).assertEqual(401);
            done();
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
      console.info(TAG + "intelligenceApiTest2700 end");
    })


    /**
     * @tc.name intelligenceApiTest2800
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2800
     * @tc.desc getTextEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */


     it("intelligenceApiTest2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest2800 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 0.5
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, null);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(TAG + 'splitText is fail' +err.message + err.code);
          expect(err.code).assertEqual(401);
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest2900
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2800
     * @tc.desc getImageEmbeddingModel getEmbedding  is invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2900 start");
      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel();
            data.getEmbedding(undefined)
              .then((loadData) => {
                console.info(TAG + "getEmbedding result 1200 :" + loadData);
                expect().assertFail();
                done();
              })
              .catch((err: BusinessError) => {
                console.error("Failed to get Embedding and code is " + err.code);
                expect(err.code).assertEqual(401);
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
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest3000
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3000
     * @tc.desc getImageEmbeddingModel getEmbedding batchTexts is invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest3000 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 10
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, config);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(TAG + 'splitText is fail' +err.message + err.code);
          expect(err.code).assertEqual(31300000);
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })

  })
}