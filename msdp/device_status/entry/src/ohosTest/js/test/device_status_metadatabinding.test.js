/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import metadataBinding from '@ohos.multimodalAwareness.metadataBinding';

export default function DeviceStatusMetadataBindingTest() {
  describe('DeviceStatusMetadataBindingTest', function () {
    console.log("*************MetadataBinding API Test Begin*************");
    beforeAll(async function (done) {
      console.info('-----------------msdp metadataBinding test beforeAll begin-----------------');
      console.info('-----------------msdp metadataBinding test beforeAll end-----------------');
      done();
    })

    afterAll(function() {
      console.info('msdp metadataBinding test afterAll called')
    })

    beforeEach(function() {
      console.info('msdp metadataBinding test beforeEach called')
    })

    afterEach(function() {
      console.info('msdp metadataBinding test afterEach called')
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0100
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0100
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0100 is start---------------")
      try {
        metadataBinding.submitMetadata('123')
        console.log('metadataBinding.submitMetadata is success')
        expect().assertFail()
      } catch (error) {
        console.log('metadataBinding.submitMetadata is failed' + JSON.stringify(error))
        expect(error.code == 32100001).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0100 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0200
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0200
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0200 is start---------------")
      try {
        metadataBinding.submitMetadata(-10)
        console.log('metadataBinding.submitMetadata is success')
        expect().assertFail()
      } catch (error) {
        console.log('metadataBinding.submitMetadata is failed' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0200 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0300
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0300
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0300 is start---------------")
      try {
        metadataBinding.on('operationSubmitMetadata', 'com.example.mydevicestatusapp', (data) => {
          console.log('metadataBinding.on is success' + data)
        })
      } catch (error) {
        console.log('metadataBinding.on is failed catch' + JSON.stringify(error))
        expect(error.code == 32100004).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0300 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0400
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0400
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0400 is start---------------")
      try {
        metadataBinding.off('operationSubmitMetadata', 'com.example.mydevicestatusapp', (data) => {
          console.log('metadataBinding.off is success' + data)
        })
      } catch (error) {
        console.log('metadataBinding.off is failed' + JSON.stringify(error))
        expect().assertFail()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0400 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0500
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0500
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0500 is start---------------")
      try {
        metadataBinding.on('operationSubmitMetadata', null, (data) => {
          console.log('metadataBinding.on is success' + data)
          expect().assertFail()
        })
      } catch (error) {
        console.log('metadataBinding.on is failed catch' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0500 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0600
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0600
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0600 is start---------------")
      try {
        metadataBinding.off(-10, (data) => {
          console.log('metadataBinding.off is success' + data)
          expect().assertFail()
        })
      } catch (error) {
        console.log('metadataBinding.off is failed catch' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0600 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0700
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0700
     * @tc.desc   metadataBinding callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0700 is start---------------")
      try {
        metadataBinding.off('operationSubmitMetadata', 'com.example.mydevicestatusapp')
        console.log('metadataBinding.off is success')
      } catch (error) {
        console.log('metadataBinding.off is failed' + JSON.stringify(error))
        expect().assertFail()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0700 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0800
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0800
     * @tc.desc   metadataBinding submitMetadata is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0800 is start---------------")
      try {
        metadataBinding.submitMetadata("")
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_0800 metadataBinding.submitMetadata is success')
        expect().assertFail()
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_0800 metadataBinding.submitMetadata is failed' + JSON.stringify(error))
        expect(error.code == 32100001).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0800 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_0900
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_0900
     * @tc.desc   metadataBinding submitMetadata is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0900 is start---------------")
      try {
        metadataBinding.submitMetadata(null)
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_0900 metadataBinding.submitMetadata is success')
        expect().assertFail()
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_0900 metadataBinding.submitMetadata is failed' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_0900 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1000
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1000
     * @tc.desc   metadataBinding submitMetadata is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1000 is start---------------")
      try {
        metadataBinding.submitMetadata(undefined)
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1000 metadataBinding.submitMetadata is success')
        expect().assertFail()
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1000 metadataBinding.submitMetadata is failed' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1000 is end---------------")
      done();
    })


    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1100
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1100
     * @tc.desc   metadataBinding on is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1100 is start---------------")
      try {
        metadataBinding.on('operationSubmitMetadata', "", (data) => {
          console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1100 metadataBinding.on is success' + data)
        })
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1100 metadataBinding.on is success')
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1100 metadataBinding.on is failed catch' + JSON.stringify(error))
        expect(error.code == 32100004).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1100 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1200
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1200
     * @tc.desc   metadataBinding on is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1200 is start---------------")
      try {
        metadataBinding.on('operationSubmitMetadata', null, (data) => {
          console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1200 metadataBinding.on is success' + data)
          expect().assertFail()
        })
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1200 metadataBinding.on is failed catch' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1200 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1300
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1300
     * @tc.desc   metadataBinding on is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1300 is start---------------")
      try {
        metadataBinding.on('operationSubmitMetadata', undefined, (data) => {
          console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1300 metadataBinding.on is success' + data)
          expect().assertFail()
        })
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1300 metadataBinding.on is failed catch' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1300 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1400
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1400
     * @tc.desc   metadataBinding off is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1400 is start---------------")
      try {
        metadataBinding.off('operationSubmitMetadata', "", (data) => {
          console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1400 metadataBinding.off is success' + data)
        })
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1400 metadataBinding.off is success')
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1400 metadataBinding.off is failed' + JSON.stringify(error))
        expect().assertFail()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1400 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1500
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1500
     * @tc.desc   metadataBinding off is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1500 is start---------------")
      try {
        metadataBinding.off('operationSubmitMetadata', null, (data) => {
          console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1500 metadataBinding.off is success' + data)
          expect().assertFail()
        })
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1500 metadataBinding.off is failed' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1500 is end---------------")
      done();
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MetadataBinding_1600
     * @tc.number SUB_MSDP_DeviceStatus_API_MetadataBinding_1600
     * @tc.desc   metadataBinding off is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MetadataBinding_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1600 is start---------------")
      try {
        metadataBinding.off('operationSubmitMetadata', undefined, (data) => {
          console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1600 metadataBinding.off is success' + data)
          expect().assertFail()
        })
      } catch (error) {
        console.log('SUB_MSDP_DeviceStatus_API_MetadataBinding_1600 metadataBinding.off is failed' + JSON.stringify(error))
        expect(error.code == 401).assertTrue()
      }
      console.info("---------------SUB_MSDP_DeviceStatus_API_MetadataBinding_1600 is end---------------")
      done();
    })
  })
}
