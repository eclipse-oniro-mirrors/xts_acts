/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import UTD from '@ohos.data.uniformTypeDescriptor'
import { BusinessError } from '@ohos.base';

export default function UtdfMimeTypeTest() {
  describe('UtdfMimeTypeTest', () => {
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest_0010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/msword"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0010 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/msword");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WORD_DOC);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-execl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0020 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EXCEL);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0040
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/wav"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0040 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/wav");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/wave"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0050 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/wave");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0060 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WM);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wmv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0070 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wmv");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0080 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wmp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-ms-wma"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0090 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wma");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wmx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0100 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wmx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wvx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0110 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wvx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-ms-wax"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0120 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wax");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/pdf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0130 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/pdf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PDF);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/postscript"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0140 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/postscript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-photoshop"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0150 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-photoshop");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/photoshop"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0160 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/photoshop");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/psd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0170 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/psd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/photoshop"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0180 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/photoshop");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.microsoft.portable-executable"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0190 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.microsoft.portable-executable");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PORTABLE_EXECUTABLE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0200
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/java-archive"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0200 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/java-archive");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0210
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-gtar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0210 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-gtar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_TAR_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0220
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-gzip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0220 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-gzip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0230
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/gzip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0230 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/gzip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0240
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mobipocket-ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0240 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mobipocket-ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MOBI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0250
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.amazon.ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0250 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.amazon.ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0260
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.amazon.mobi8-ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0260 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.amazon.mobi8-ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW3);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0270
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mobi8-ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0270 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mobi8-ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW3);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0280
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/targa"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0280 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/targa");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0290
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/tga"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0290 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/tga");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0300
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/tga"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0300 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/tga");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0310
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/sgi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0310 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/sgi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SGI_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0320
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/fpx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0320 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/fpx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLASHPIX_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0330
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.fpx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0330 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.fpx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLASHPIX_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0340
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/efax"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0340 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/efax");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EFX_FAX);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0350
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/vnd.rn-realaudio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0350 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/vnd.rn-realaudio");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0360
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-pn-realaudio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0360 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-pn-realaudio");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0370
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/smil"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0370 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/smil");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SMIL);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0380
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-stuffit"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0380 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-stuffit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0390
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-sit"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0390 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-sit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0400
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/stuffit"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0400 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/stuffit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0410
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0410 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
      expect(result).assertEqual(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT);


    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0420
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0420 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
      expect(result).assertEqual(UTD.UniformDataType.SPREADSHEETML_SHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0430
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.presentationmal.presentation"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0430 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.presentationml.presentation");
      expect(result).assertEqual(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0440
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0440 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text");
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_TEXT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0450
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.spreadsheet"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0450 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.spreadsheet");
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0460
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.presentation"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0460 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.presentation");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0470
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.graphics"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0470 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.graphics");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0480
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.formula"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0480 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.formula");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_FORMULA);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0490
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/png"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0490 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/png");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PNG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0500
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/jpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0500 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/jpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0510
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/tiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0510 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/tiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TIFF);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0960
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-quicktime"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0960 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xbitmap");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XBITMAP_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0520
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/avi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0520 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/avi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0530
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/msvideo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0530 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/msvideo");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0540
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-msvideo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0540 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-msvideo");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0550
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mpg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0550 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0560
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0560 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0570
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0570 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0580
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-mpg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0580 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-mpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0590
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp4"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0590 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG4);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0600
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp4v"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0600 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp4v");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG4);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0720
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/3gpp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0720 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/3gpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0610
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/3gpp2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0610 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/3gpp2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP2);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0620
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/ogg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0620 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/ogg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OGG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0630
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/aiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0630 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/aiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFF);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0640
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/pcm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0640 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/pcm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PCM);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0650
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/flac"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0650 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/flac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0660
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/alac"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0660 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/alac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ALAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0670
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mp3"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0670 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mp3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MP3);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0680
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/aac"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0680 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/aac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0690
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/basic"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0690 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/basic");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0700
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/au"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0700 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/au");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0710
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/snd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0710 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/snd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_073TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,audio/x-aiff
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-aiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0730 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-aiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFC_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0740
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-tar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0740 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-tar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TAR_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0750
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/tar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0750 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/tar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TAR_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0760
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/zip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0760 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/zip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ZIP_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0770
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-bzip2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0770 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-bzip2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.BZ2_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0780
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/plain"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0780 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/plain");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0790
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/html"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0790 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/html");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.HTML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0800
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0800 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/xml");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0950
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/markdown"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0950 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/markdown");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MARKDOWN);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0810
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-perl-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0810 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-perl-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PERL_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0820
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-python-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0820 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-python-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PYTHON_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0830
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/ruby-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0830 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/ruby-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.RUBY_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0840
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-php-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0840 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-php-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0850
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/php"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0850 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/php");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0860
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is"application/php"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0860 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/php");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0870
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/javascript"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0870 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/javascript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0880
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/calendar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0880 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/calendar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CALENDAR);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/calendar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/calendar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CALENDAR);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0900
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/epub+zip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0900 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/epub+zip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EPUB);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0910
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "font/ttf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0910 start');
      let result = UTD.getUniformDataTypeByMIMEType("font/ttf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_FONT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0920
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "font/collection"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0920 start');
      let result = UTD.getUniformDataTypeByMIMEType("font/collection");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT);

    }); /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest092 0
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0930
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "font/otf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0930 start');
      let result = UTD.getUniformDataTypeByMIMEType("font/otf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENTYPE_FONT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/calendar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/calendar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CALENDAR);
    });
    /**
     * @tc.name      : Test_SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-apple-diskimage"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-apple-diskimage");
      console.log("typeId:" + result);
      expect(result).assertEqual("macos.dmg");
    });
    /**
     * @tc.name      : Test_SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-debian-package"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-debian-package");
      console.log("typeId:" + result);
      expect(result).assertEqual("debian.deb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.debian.binary-package"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.debian.binary-package");
      console.log("typeId:" + result);
      expect(result).assertEqual("debian.deb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/css"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/css");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CSS);
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-ms-bmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-ms-bmp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.bmp");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-vob"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-vob");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.vob");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/dv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/dv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.dif-video");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/fli"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/fli");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.flc-animation");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/flc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/flc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.flc-animation");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-mng"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-mng");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mng");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/vnd.mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/vnd.mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-video");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp2ts"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp2ts");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TS);
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp2t"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp2t");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TS);
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/amr"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/amr");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.amr");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/amr-wb"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/amr-wb");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.amr-wb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-gsm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-gsm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gsm");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/GSM"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/GSM");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gsm");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/imelody"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/imelody");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.imy");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/midi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/midi");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.kar");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-4-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mobile-xmf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mobile-xmf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mxmf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-scpls"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-scpls");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pls");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/prs.sid"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/prs.sid");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.psid");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-icon"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-icon");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.ico");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-adobe-dng"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-adobe-dng");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.dng-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-excel.template.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel.template.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.template.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/gif"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/gif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gif");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.djvu"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.djvu");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.djvu-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-jng"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-jng");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jng-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.zbrush.pcx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.zbrush.pcx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pcx-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-bitmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-bitmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pbm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-graymap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-graymap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pgm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-anymap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-anymap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pnm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-pixmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-pixmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ppm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-rgb"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-rgb");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rgb-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/svg+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/svg+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.svg-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.wap.wbmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.wap.wbmp");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.wbmp-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-xpixmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xpixmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xpixmap-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-xwindowdump"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xwindowdump");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xwindowdump-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/heif"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/heif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heif");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/heic"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/heic");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heic");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-cdlink"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-cdlink");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.virtual-cd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-haskell"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-haskell");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.haskell-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-literate-haskell"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-literate-haskell");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.literate-haskell-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-tcl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-tcl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.tcl-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.rar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.rar");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rarlab.rar-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/rtf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/rtf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rich-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/richtext"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/richtext");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rich-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/csv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/csv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.comma-separated-values-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-setext"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-setext");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.setext");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-pcs-gcd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-pcs-gcd");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gcd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/tab-separated-values"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/tab-separated-values");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.tab-separated-values-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pkcs7-certreqresp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pkcs7-certreqresp");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.p7r");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pem-file"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pem-file");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pem");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-chess-pgn"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-chess-pgn");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.chess-pgn");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.chess-pgn"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.chess-pgn");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.chess-pgn");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-lha"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-lha");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lha-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-lzh"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-lzh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lzh-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-lzx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-lzx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lzx-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/rar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/rar");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rarlab.rar-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-shar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-shar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.shar-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-cpio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-cpio");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.cpio-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mimearchive"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mimearchive");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.web-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-ustar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-ustar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ustar");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/mathml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/mathml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mathml");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/mathml+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/mathml+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mathml");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/xhtml+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/xhtml+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xhtml");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/rss+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/rss+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rss");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/rdf+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/rdf+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rdf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "model/iges"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790 start');
      let result = UTD.getUniformDataTypeByMIMEType("model/iges");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iges");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/octet-stream"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/octet-stream");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.octet-stream");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-iso9660-image"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-iso9660-image");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iso");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "model/mesh"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820 start');
      let result = UTD.getUniformDataTypeByMIMEType("model/mesh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mesh-model");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-object"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-object");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-object");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/pkix-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/pkix-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.cer-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-x509-ca-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-x509-ca-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-x509-server-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-x509-server-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-x509-user-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-x509-user-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pkix-crl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pkix-crl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crl-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.chart"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.chart");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.chart");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text-master"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text-master");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-master");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text-web"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text-web");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-web");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.database"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.database");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.database");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.image"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.image");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.formula-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.formula-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.formula-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.chart-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.chart-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.chart-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.presentation-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.presentation-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.presentation-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.image-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.image-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.image-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.graphics-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.graphics-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.graphics-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.spreadsheet-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1990 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.spreadsheet-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.spreadsheet-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-sd2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-sd2");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.digidesign.sd2-audio");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is  "application/vnd.rn-realmedia"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.rn-realmedia");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.real.realmedia");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.cinderella"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.cinderella");
      console.log("typeId:" + result);
      expect(result).assertEqual("de.cinderella.cdy");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.visio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.visio");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.visio.vsd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.drawingml.drawing"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.drawingml.drawing");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.drawingml.visio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.wordprocessingml.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.presentationml.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.presentationml.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.presentationml.slideshow");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.slideshow");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.spreadsheetml.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100 start');
      let result =
        UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.spreadsheetml.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.calc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.calc");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.calc");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.draw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.draw");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.draw");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.writer.global"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.writer.global");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer-global");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.math"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.math");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.math");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.writer"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.writer");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.calc.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.calc.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.calc.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.draw.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.draw.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.draw.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.impress.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.impress.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.impress.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-excel.addin.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel.addin.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.addin.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.writer.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.writer.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.draw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.draw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.draw");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.calc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.calc");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.calc");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.impress"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.impress");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.impress");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2240
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.writer"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2240 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.writer");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.writer");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2250
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.chart"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2250 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.chart");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.chart");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2260
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.mail"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2260 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.mail");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.mail");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2270
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.writer-global"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2270 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.writer-global");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.writer-global");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2280
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.math"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2280 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.math");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.math");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2290
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2290 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2300
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-bibtex"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2300 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-bibtex");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.tug.bib");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2310
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-tex"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2310 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-tex");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.tug.cls");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2320
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-coreldraw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2310 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-coreldraw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.cdr");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2340
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-latex"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2340 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-latex");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.latex-project.latex");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2350
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-asf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2350 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-asf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.advanced-systems-format");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2360
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-asf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2360 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-asf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.advanced-systems-format");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2380
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-matroska"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2380 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-matroska");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.matroska.mkv");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2400
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-sgi-movie"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2400 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-sgi-movie");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sgi.movie");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2410
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/m4v"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2410 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/m4v");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.m4v");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2420
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/webm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2420 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/webm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.webmproject.webm");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2430
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/quicktime"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2430 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/quicktime");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.quicktime-movie");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2460
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-coreldrawtemplate"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2460 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-coreldrawtemplate");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.cdt");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2470
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-corelphotopaint"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2470 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-corelphotopaint");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.cpt");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2480
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-coreldrawpattern"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2480 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-coreldrawpattern");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.pat");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2490
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2490
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/ico"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2490 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/ico");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.ico");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2500
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-cmu-raster"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2500 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-cmu-raster");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sun.raster");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2510
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/webp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2510 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/webp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.google.webp");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2520
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-koan"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2520 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-koan");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sseyo.koan-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2530
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-moc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2530 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-moc");
      console.log("typeId:" + result);
      expect(result).assertEqual("io.qt.moc");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2540
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-font"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2540 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-font");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.ghostscript.font");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2560
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-font-pcf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2560 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-font-pcf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.x.pcf-font");
    });
    /**
     * @tc.name      : StestUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2570
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-ms-wmd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2570 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-ms-wmd");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-media-wmd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2580
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-ms-wmz"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2580 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-ms-wmz");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-media-wmz");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2590
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-msi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2590 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-msi");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-installer");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2600
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mspublisher"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2600 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mspublisher");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.publisher.pub");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2610
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-wpl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2610 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-wpl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-media-playlist");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2620
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/msaccess"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2620 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/msaccess");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.access.mdb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2630
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-pki.stl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2630 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-pki.stl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.3dsystems.stereolithography");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2640
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.apple.mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2640 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.apple.mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.media.playlist");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2650
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-abiword"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2650 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-abiword");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.abisource.word");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2660
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-maker"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2660 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-maker");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2670
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-cdf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2670 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-cdf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.wolfram.cdf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2690
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-director"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2690 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-director");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.dcr");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2710
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-gnumeric"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2710 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-gnumeric");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gnumeric.spreadsheet");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2720
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-hdf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2720 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-hdf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.hdfgroup.hdf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2730
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/mac-binhex40"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2730 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/mac-binhex40");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.binhex-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2740
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/hta"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2740 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/hta");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.hta");
    });
    /**
     * @tc.name      :test SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2750
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-internet-signup"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2750 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-internet-signup");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.internet.ins");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2770
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/troff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2770 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/troff");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.troff");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2780
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.mif"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2780 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.mif");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker.mif");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2790
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-freemind"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2790 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-freemind");
      console.log("typeId:" + result);
      expect(result).assertEqual("io.sourceforge.freemind");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2810
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.smaf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2810 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.smaf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.yamaha.smaf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2820
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/mathematica"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2820 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/mathematica");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.wolfram.mathematica.notebook");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2830
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/ogg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2830 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/ogg");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.xiph.ogg");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2840
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-ns-proxy-autoconfig"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2840 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-ns-proxy-autoconfig");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.netscape.proxy-autoconfig");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2850
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pkcs12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2850 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pkcs12");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rsa.pkcs-12");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2860
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/pgp-signature"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2860 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/pgp-signature");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openpgp.signature");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2870
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-quicktimeplayer"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2870 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-quicktimeplayer");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.quicktime-link");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2890
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.rar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2890 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.rar");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rarlab.rar-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2900
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-7z-compressed"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2900 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-7z-compressed");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.7-zip.7-zip-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2910
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-go-sgf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2910 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-go-sgf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.red-bean.sgf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2920
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2920
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-wav"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2920 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-wav");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.waveform-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2930
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2930
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/futuresplash"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2930 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/futuresplash");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.futuresplash");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2940
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-futuresplash"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2940 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-futuresplash");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.futuresplash");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2950
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-shockwave-flash"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2950 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-shockwave-flash");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.flash");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2960
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-texinfo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2960 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-texinfo");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gnu.texinfo");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2970
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-bittorrent"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2970 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-bittorrent");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.bittorrent.torrent");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is"application/x-doom"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2980 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-doom");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.idsoftware.doom");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2990
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2990
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-webarchive"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2990 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-webarchive");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.webarchive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3000
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-webarchive-xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3000 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-webarchive-xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.android.webarchive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-xcf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3010 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-xcf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gimp.xcf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-xcf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3020 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xcf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gimp.xcf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3030
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-eddx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3030 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-eddx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.edrawsoft.edrawmax");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3040
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-emmx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3040 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-emmx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.edrawsoft.edrawmind");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/caj"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3050 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/caj");
      console.log("typeId:" + result);
      expect(result).assertEqual("net.cnki.caj");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/dbf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3060 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/dbf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.dbase.dbf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/dbase"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3070 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/dbase");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.dbase.dbf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.dwg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3080 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.dwg");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dwg");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.dxf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3090 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.dxf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dxf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "model/vnd.dwf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3100 start');
      let result = UTD.getUniformDataTypeByMIMEType("model/vnd.dwf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dwf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.hp-hpgl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3110 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.hp-hpgl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.hp.graphics-language");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/avif"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3120 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/avif");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.aomedia.avif-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd-ms.dds"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3130 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd-ms.dds");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.dds");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-ilbm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3140 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-ilbm");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.ea.iff-ilbm");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-canon-cr2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3150 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-canon-cr2");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.canon.cr2-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-canon-cr3"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3160 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-canon-cr3");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.canon.cr3-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-canon-crw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3170 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-canon-crw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.canon.crw-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-nikon-nef"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3180 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-nikon-nef");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.nikon.nef-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "message/rfc822"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3190 start');
      let result = UTD.getUniformDataTypeByMIMEType("message/rfc822");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.email");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3200
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-dvi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3200 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-dvi");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.dvi");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3220
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-sony-arw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3220 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-sony-arw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sony.arw-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3240
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-word.document.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3240 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-word.document.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.document.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3250
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-word.template.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3240 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-word.template.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.template.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3270
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-excel.sheet.binary.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3240 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel.sheet.binary.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.binary.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3280
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-excel.sheet.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3280 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel.sheet.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.sheet.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3290
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint.addin.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3280 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint.addin.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.addin.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3300
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint.presentation.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3300 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint.presentation.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.presentation.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3310
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint.slideshow.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3310 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint.slideshow.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.slideshow.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3320
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint.template.macroEnabled.12"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3300 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint.template.macroEnabled.12");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.template.macroenabled");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3330
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-boo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3300 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-boo");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.boo-source");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3340
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-dsrc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3340 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-dsrc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.d-source");
    });
    /**
     * @tc.name      :test SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3350
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-component"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3350 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-component");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.html-component");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3360
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-pascal"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3360 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-pascal");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pascal-source");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3370
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-xbm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3370 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xbm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xbitmap-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3380
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-csh"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3380 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-csh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.csh-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3390
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-csrc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3390 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-csrc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-source");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3400
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-shellscript"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3400 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-shellscript");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.shell-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3410
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-c++src"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3410 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-c++src");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-plus-plus-source");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3420
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-c++hdr"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3420 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-c++hdr");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-plus-plus-header");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3430
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-chdr"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3430 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-chdr");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-header");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3440
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/vcard"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3440 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/vcard");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.vcard");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3450
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/bmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3450 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/bmp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.bmp");
    });


    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3460
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-flv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3460 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-flv");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.flash");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3470
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp4"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3470 start');
      let result = UTD.getUniformDataTypesByMIMEType("video/mp4");
      console.log("typeId:" + result);
      expect(result.toString()).assertEqual("general.mpeg-4,com.adobe.f4v");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3480
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp2t"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3480 start');
      let result = UTD.getUniformDataTypesByMIMEType("video/mp2t");
      console.log("typeId:" + result);
      expect(result.toString()).assertEqual("general.ts,general.mp2t");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3490
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3490
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/vnd.youtube.yt"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3490 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/vnd.youtube.yt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.youtube.video");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3500
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-webex"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3500 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-webex");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.cisco.webex-video");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3510
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3510 start');
      let result = UTD.getUniformDataTypesByMIMEType("video/mpeg");
      console.log("typeId:" + result);
      expect(result.toString()).assertEqual("general.mpeg,general.vob,general.mpeg-2,general.mpeg-1");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3520
     * @tc.desc      : getUniformDataTypeByMIMEType parameter is "application/vnd.rn-realmedia-vbr"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3520 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.rn-realmedia-vbr");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.real.realmedia-vbr");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3530
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-pn-realvideo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3530 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-pn-realvideo");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.real.realvideo");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3540
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/divx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3540 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/divx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.divx-video");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3550
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/annodex"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3550 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/annodex");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.csiro.annodex");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3560
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/ogg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3560 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/ogg");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ogv");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3570
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-la-asf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3570 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-la-asf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.lsf-video");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3580
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/jp2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3580 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/jp2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3590
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/jpx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3590 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/jpx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3600
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/jpm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3600 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/jpm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3610
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-fuji-raf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3610 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-fuji-raf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.fujifilm.raf-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3620
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-nikon-nrw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3620 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-nikon-nrw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.nikon.nrw-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3630
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-panasonic-raw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3630 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-panasonic-raw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.panasonic.rw2-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3640
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-pentax-pef"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3640 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-pentax-pef");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.pentax.pef-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3650
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-samsung-srw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3650 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-samsung-srw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sumsung.srw-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3660
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-epson-erf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3660 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-epson-erf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.epson.erf-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3670
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-olympus-orf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3670 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-olympus-orf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.olympus.orf-raw-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3680
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/ief"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3680 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/ief");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ief-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3690
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-jg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3690 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-jg");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.aol.art-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3700
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mp4"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3700 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mp4");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.m4p-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3710
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/ac3"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_3710 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/ac3");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ac3-audio");
    });
  });
}