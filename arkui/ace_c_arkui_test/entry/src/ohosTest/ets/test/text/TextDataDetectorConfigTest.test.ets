/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textDataDetectorConfigTest() {

  describe('TextDataDetectorConfigTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testTextDataDetectorConfig001
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0100
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testTextDataDetectorConfig002
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0200
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig002()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testTextDataDetectorConfig003
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0300
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig003()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testTextDataDetectorConfig004
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0400
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig004()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testTextDataDetectorConfig005
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0500
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig005()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testTextDataDetectorConfig006
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0600
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig006()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testTextDataDetectorConfig007
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0700
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig007()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testTextDataDetectorConfig008
     * @tc.number SUB_ARKUI_CAPI_TEXT_ENABLE_DATA_DETECTOR_CONFIG_0800
     * @tc.desc   testing dataDetectorConfig for text with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextDataDetectorConfig008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextDataDetectorConfig008()).assertEqual(0)
      done()
    })


  })
}