/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError, RecordData } from '@ohos.base';
import UTD from '@ohos.data.uniformTypeDescriptor'
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function UtdFileNameTest() {
  describe("UtdFileNameTest", (): void => {

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".bmp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.BMP);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ico
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ico");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ICO);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .doc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1290 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".doc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WORD_DOC);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .xls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EXCEL);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ppt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ppt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PPT);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wav
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wav");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wave
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0060 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wave");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WM);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wmv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmv");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wmp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wma");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wmx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0110 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wvx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0120 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wvx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .wax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0130 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wax");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0140 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pdf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PDF);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0150 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ps");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .eps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0160 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".eps");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .psd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0170 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".psd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ai
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0180 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ai");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AI_IMAGE);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pfb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0190 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pfb");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT_PFB_FONT);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pfa
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0200 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pfa");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT_PFA_FONT);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .exe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0210 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".exe");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PORTABLE_EXECUTABLE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .dll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0220 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dll");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PORTABLE_EXECUTABLE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0230 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".class");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SUN_JAVA_CLASS);

    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .jar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0240 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_ARCHIVE);

    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .gtar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0250 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gtar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_TAR_ARCHIVE);

    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .gz
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0260 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gz");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);

    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .gzip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0270 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gzip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);

    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .tgz
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0280 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tgz");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .mobi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0290 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mobi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MOBI);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .azw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0300 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".azw");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .azw3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1300 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".azw3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW3);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .kfx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0310 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".kfx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.KFX);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .tga
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0320 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tga");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .sgi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0330 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sgi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SGI_IMAGE)
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .exr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0340 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".exr");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENEXR_IMAGE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .fpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0350 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fpx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLASHPIX_IMAGE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .jfx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0360 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jfx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JFX_FAX);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .efx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0370 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".efx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EFX_FAX);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .sd2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0380 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sd2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SD2_AUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .rm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0390 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALMEDIA);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ra
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0400 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ra");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ram
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0410 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ram");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .smil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0420 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".smil");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SMIL);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .sitx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0430 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sitx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .sit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0440 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .docx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0450 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".docx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .docm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0460 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".docm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.document.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .xlsx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0470 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlsx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SPREADSHEETML_SHEET);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .xlsm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0480 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlsm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.sheet.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pptx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0490 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pptx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pptx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0500 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pptx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .odt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0510 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_TEXT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .fodt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0520 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fodt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_TEXT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0530 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ods");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .fods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0540 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fods");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .odp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0550 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .fodp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0560 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fodp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .odg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0570 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .fodg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0580 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fodg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .odf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0590 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_FORMULA);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .hap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0600 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hap");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENHARMONY_HAP);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .hdoc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0610 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hdoc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENHARMONY_HDOC);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .hinote
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0620 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hinote");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENHARMONY_HINOTE);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0630 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".png");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PNG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0640 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JPEG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .jpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0650 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JPEG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .tif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0660 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tif");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TIFF);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .tiff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0670 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TIFF);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .xbm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0680 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xbm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XBITMAP_IMAGE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .avi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0690 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".avi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .vfw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1310 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vfw");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .mpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1320 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1330 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .m75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0700 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m75");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .m15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0710 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m15");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1340 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG4);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .3gp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0720 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .3gpp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0730 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .3g2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0740 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3g2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP2);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .3gp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0750 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gp2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP2);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ogg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0760 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ogg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OGG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .aiff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0770 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFF);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pcm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0780 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pcm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PCM);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .flac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0790 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".flac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLAC);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .alac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0800 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".alac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ALAC);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .mp3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0810 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MP3);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .aac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0820 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AAC);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .au
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0830 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".au");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .snd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0840 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".snd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .aifc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aifc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFC_AUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .aif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0870 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".aif");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFC_AUDIO);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .tar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0880 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TAR_ARCHIVE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .zip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".zip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ZIP_ARCHIVE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .bz2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0900 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".bz2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.BZ2_ARCHIVE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .txt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1350 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".txt");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0910 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".html");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.HTML);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .htm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".htm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.HTML);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .xml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xml");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XML);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .md
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0940 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".md");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MARKDOWN);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .sh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0950 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sh");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SHELL_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0960 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".command");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SHELL_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .csh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0970 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".csh");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CSH_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0980 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pl");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PERL_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .pm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_0990 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PERL_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .py
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1000 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".py");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PYTHON_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .rb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rb");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.RUBY_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .rbw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rbw");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.RUBY_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .php
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".php");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .php3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".php3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .php4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".php4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ph3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1060 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ph3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ph4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ph4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .phtml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".phtml");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .ts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ts");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TYPE_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .js
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".js");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .jscript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1110 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jscript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .javascript
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1120 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".javascript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .c
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1130 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".c");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .h
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1140 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".h");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_HEADER);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .cp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1360 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is .cpp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1150 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".c++"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1370 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".c++");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1160 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cxx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1170 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cxx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hpp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1180 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".h++"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1190 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".h++");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hxx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1200 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hxx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.C_PLUS_PLUS_HEADER);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".java"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1210 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".java");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jav"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1220 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jav")
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SOURCE);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".epub"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1230 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".epub");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EPUB);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vcs"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1240 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vcs");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VCS);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ics"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1250 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ics");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ICS);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ttf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1260 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ttf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_FONT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ttc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1270 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ttc");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".otf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1280 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".otf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENTYPE_FONT);
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1380
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dmg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1380 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dmg");
      console.log("typeId:" + result);
      expect(result).assertEqual("macos.dmg");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1390
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".deb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1390 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".deb");
      console.log("typeId:" + result);
      expect(result).assertEqual("debian.deb");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1400
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".udeb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1400 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".udeb");
      console.log("typeId:" + result);
      expect(result).assertEqual("debian.deb");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1410
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1410
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ofd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1410 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ofd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OFD);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1420
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1420
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".opg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1420 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".opg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPG);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1430
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1430
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".css"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1430 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".css");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CSS);
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1440
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1440
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vob"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1440 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vob");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.vob");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1450
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1450
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1450 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.dif-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1460
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1460
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1460 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.dv-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1470
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1470
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".fli"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1470 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fli");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.flc-animation");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1480
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1480
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".flc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1480 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".flc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.flc-animation");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1490
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1490
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mxu"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1490 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mxu");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1500
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m4u"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1500 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m4u");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1510
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1510
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mhtml"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1510 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mhtml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.web-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1520
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1520
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".amr"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1520 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".amr");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.amr");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1530
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1530
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".awb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1530 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".awb");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.amr-wb");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1540
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1540
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".gsm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1540 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gsm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gsm");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1550
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1550
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".imy"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1550 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".imy");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.imy");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1560
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1560
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".kar"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1560 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".kar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.kar");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1570
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1570
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m3u"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1570 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m3u");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1580
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1580
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m4a"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1580 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m4a");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-4-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1590
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1590
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mid"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1590 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mid");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.midi-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1600
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mp2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1600 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mp2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1610
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1610
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpga"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1610 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpga");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1620
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1620
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mxmf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1620 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mxmf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mxmf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1630
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1630
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ota"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1630 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ota");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ota");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1640
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1640
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1640 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pls");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pls");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1650
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1650
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rtttl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1650 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rtttl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rtttl");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1660
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1660
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sid"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1660 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sid");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.psid");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1670
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1670
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".psid"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1670 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".psid");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.psid");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1680
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1680
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".potm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1680 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".potm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.template.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1690
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1690
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ulw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1690 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ulw");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ulaw-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1700
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".midi"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1700 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".midi");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.midi-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1710
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1710
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xmf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1710 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xmf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xmf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1720
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1720
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".gif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1720 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gif");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1730
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1730
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".djv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1730 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".djv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.djvu-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1740
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1740
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".djvU"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1740 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".djvU");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.djvu-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1750
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1750
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jng"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1750 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jng");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jng-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1760
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1760
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pcx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1760 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pcx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pcx-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1770
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1770
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pbm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1770 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pbm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pbm-image");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1790
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1790
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ppm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1790 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ppm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ppm-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1800
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rgb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1800 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rgb");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rgb-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1810
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1810
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".svg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1810 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".svg");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.svg-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1820
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1820
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".svgz"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1820 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".svgz");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.svg-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1830
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1830
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wbmp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1830 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wbmp");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.wbmp-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1840
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1840
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xpm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1840 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xpm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xpixmap-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1850
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1850
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xwd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xwd");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xwindowdump-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1860
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1860
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".heif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1860 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".heif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heif");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1870
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1870
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".heic"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1870 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".heic");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heic");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1880
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1880
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vcd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1880 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vcd");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.virtual-cd");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1890
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1890
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".boo"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1890 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".boo");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.boo-source");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1900
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".d"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1900 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".d");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.d-source");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1910
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1910
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".htc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1910 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".htc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.html-component");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1920
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1920
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".p"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".p");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pascal-source");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1930
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1930
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pas"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pas");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pascal-source");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1940
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1940
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hs"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1940 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hs");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.haskell-script");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1950
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1950
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lhs"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1950 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".lhs");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.literate-haskell-script");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1970
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1970
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".asc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1970 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".asc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.asc-text");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1980
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1980
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".po"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1980 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".po");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.portable-object");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1990
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1990
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rtf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_1990 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rtf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rich-text");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2010
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rtx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rtx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rich-text");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2020
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".csv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".csv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.comma-separated-values-text");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2030
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".diff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".diff");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.diff");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2040
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".etx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".etx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.setext");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2050
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".gcd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gcd");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gcd");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2070
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".tsv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tsv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.tab-separated-values-text");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2080
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".p7r"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".p7r");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.p7r");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2090
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pem"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pem");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pem");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2100
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pgn"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pgn");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.chess-pgn");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2110
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mml"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2110 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mathml");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2120
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xhtml"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2120 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xhtml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xhtml");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2130
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rss"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2130 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rss");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rss");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2140
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rdf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2140 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rdf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rdf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2150
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2150
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".iges"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2150 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".iges");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iges");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2160
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".igs"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2160 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".igs");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iges");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2170
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2170
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".iso"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2170 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".iso");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iso");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2180
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".msh"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2180 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".msh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mesh-model");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2190
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mesh"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2190 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mesh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mesh-model");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2200
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".silo"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2200 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".silo");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mesh-model");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2210
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".o"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2210 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".o");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-object");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2220
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dvi"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2220 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dvi");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.dvi");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2230
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cer"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2230 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cer");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.cer-certificate");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2240
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".crt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2240 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".crt");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2250
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".crl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2250 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".crl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crl-certificate");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2260
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".prn"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2260 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".prn");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.prn");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2270
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2270
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".odc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2270 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odc");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.chart");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2280
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2280
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".odm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2280 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-master");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2290
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".oth"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2290 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".oth");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-web");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2300
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".odb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2300 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odb");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.database");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2310
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".odi"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2310 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".odi");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2320
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".tz"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2320 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tz");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.taz-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2330
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".otc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2330 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".otc");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.chart-template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2340
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".otp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2340 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".otp");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.presentation-template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2350
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".oti"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2350 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".oti");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.image-template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2360
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".otg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2360 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".otg");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.graphics-template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2370
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ots"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2370 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ots");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.spreadsheet-template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2380
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ott"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2380 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ott");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2390
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dot"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2390 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dot");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.word.dot");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2400
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2400
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pps"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2400 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pps");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.powerpoint.pps");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2410
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2410
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pot"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2410 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pot");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.powerpoint.pot");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2420
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2420
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xlt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2420 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.excel.xlt");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2430
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2430
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vsd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2430 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vsd");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.visio.vsd");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2440
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2440
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vsdx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2440 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vsdx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.drawingml.visio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2450
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2450
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vstx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2450 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vstx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.drawingml.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2460
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2460
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vsdm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2460 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vsdm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.drawingml.visio.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2470
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2470
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vstm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2470 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vstm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.drawingml.template.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2480
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2480
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dotx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2480 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dotx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2490
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2490
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".potx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2490 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".potx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2500
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2500
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ppsx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2500 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ppsx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.slideshow");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2510
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2510
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xltx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2510 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xltx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2520
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2520
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sxc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2520 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sxc");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.calc");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2530
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2530
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sxd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2530 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sxd");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.draw");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2540
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2540
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sxg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2540 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sxg");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer-global");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2550
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2550
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sxi"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2550 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sxi");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.impress");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2560
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2560
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sxm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2560 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sxm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.math");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2570
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2570
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sxw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2570 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sxw");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2580
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2580
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".stc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2580 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".stc");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.calc.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2590
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2590
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".std"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2590 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".std");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.draw.template");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2600
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2600
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".stw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2600 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".stw");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2610
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2610
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sda"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2610 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sda");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.draw");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2620
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2620
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sdc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2620 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sdc");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.calc");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2630
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2630
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sdd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2630 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sdd");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.impress");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2640
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2640
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sdw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2640 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sdw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.writer");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2650
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2650
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sdm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2650 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sdm");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.mail");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2660
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2660
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sgl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2660 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sgl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.writer-global");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2670
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2670
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".smf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2670 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".smf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.math");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2680
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2680
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vor"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2680 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vor");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2690
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2690
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".bib"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2690 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".bib");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.tug.bib");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2700
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2700
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cls"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2700 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cls");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.tug.cls");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2710
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2710
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sty"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2710 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sty");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.tug.sty");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2720
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2720
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".tex"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2720 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tex");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.tug.tex");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2730
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2730
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ltx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2730 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ltx");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.latex-project.latex");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2740
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2740
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".latex"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2740 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".latex");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.latex-project.latex");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2750
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2750
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".asf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2750 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".asf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.advanced-systems-format");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2760
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2760
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".asx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2760 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".asx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.advanced-stream-redirector");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2770
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2770
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mkv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2770 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mkv");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.matroska.mkv");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2780
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2780
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mka"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2780 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mka");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.matroska.mka");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2790
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2790
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".movie"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2790 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".movie");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sgi.movie");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2800
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2800
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m4v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2800 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m4v");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.m4v");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2810
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2810
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".webm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2810 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".webm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.webmproject.webm");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2820
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2820
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mov"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2820 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mov");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.quicktime-movie");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2830
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2830
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".qt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2830 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".qt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.quicktime-movie");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2850
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2850
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cdr"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cdr");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.cdr");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2860
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2860
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cpt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2860 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cpt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.cpt");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2870
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2870
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pat"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2870 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pat");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.pat");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2880
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2880
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cur"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2880 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cur");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.cur");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2890
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2890
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ras"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2890 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ras");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sun.raster");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2900
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2900
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".webp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2900 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".webp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.google.webp");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2910
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2910
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".skd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2910 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".skd");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sseyo.koan-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2920
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2920
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".skm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".skm");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sseyo.koan-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2930
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2930
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".skp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".skp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sseyo.koan-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2940
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2940
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".skt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2940 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".skt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sseyo.koan-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2950
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2950
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".moc"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2950 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".moc");
      console.log("typeId:" + result);
      expect(result).assertEqual("io.qt.moc");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2960
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2960
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".gsf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2960 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gsf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.ghostscript.font");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2970
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2970
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pcf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2970 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pcf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.x.pcf-font");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2980
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2980
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wmd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2980 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmd");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-media-wmd");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2990
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2990
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wmz"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_2990 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmz");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-media-wmz");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3000
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3000
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".msi"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3000 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".msi");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-installer");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3010
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pub"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pub");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.publisher.pub");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3020
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wpl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wpl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.windows-media-playlist");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3030
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mdb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mdb");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.access.mdb");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3040
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".stl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".stl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.3dsystems.stereolithography");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3050
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m3u8"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".m3u8");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.media.playlist");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3060
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3060
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".abw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3060 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".abw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.abisource.word");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3070
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".book"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".book");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3080
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".fm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".fm");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3090
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".frame"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".frame");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3100
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".maker"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".maker");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3110
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cdf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3110 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cdf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.wolfram.cdf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3120
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cdy"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3120 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cdy");
      console.log("typeId:" + result);
      expect(result).assertEqual("de.cinderella.cdy");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3130
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dcr"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3130 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dcr");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.dcr");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3140
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dir"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3140 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dir");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.dir");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3150
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3150
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dxr"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3150 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dxr");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.dxr");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3160
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".gnumeric"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3160 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".gnumeric");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gnumeric.spreadsheet");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3170
     * @tc.number testSUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3170
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hdf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3170 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hdf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.hdfgroup.hdf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3180
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hqx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3180 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hqx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.binhex-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3190
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hta"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3190 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hta");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.hta");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3200
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ins"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3200 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ins");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.internet.ins");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3210
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".isp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3210 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".isp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.internet.isp");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3220
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".man"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3220 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".man");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.troff");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3230
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".t"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3230 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".t");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.troff");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3240
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".roff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3240 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".roff");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.troff");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3250
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3250 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mif");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.framemaker.mif");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3260
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3260 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mm");
      console.log("typeId:" + result);
      expect(result).assertEqual("io.sourceforge.freemind");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3270
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3270
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mmf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3270 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mmf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.yamaha.smaf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3280
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3280
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".nb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3280 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".nb");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.wolfram.mathematica.notebook");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3290
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".oga"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3290 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".oga");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.xiph.ogg");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3300
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sdp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3300 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sdp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.impress");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3310
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pac"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3310 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pac");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.netscape.proxy-autoconfig");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3320
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pfx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3320 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pfx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rsa.pkcs-12");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3330
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".p12"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3330 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".p12");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rsa.pkcs-12");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3340
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pgp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3340 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pgp");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openpgp.signature");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3350
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".qtl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3350 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".qtl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.quicktime-link");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3360
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rar"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3360 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".rar");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.rarlab.rar-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3370
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".7z"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3370 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".7z");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.7-zip.7-zip-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3380
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sgf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3380 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sgf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.red-bean.sgf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3390
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".tar.z"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3390 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tar.z");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.taz-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3400
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3400
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".spl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3400 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".spl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.futuresplash");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3410
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3410
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".swf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3410 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".swf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.flash");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3420
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3420
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".texinfo"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3420 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".texinfo");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gnu.texinfo");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3430
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3430
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".texi"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3430 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".texi");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gnu.texinfo");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3440
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3440
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".torrent"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3440 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".torrent");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.bittorrent.torrent");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3450
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3450
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wad"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3450 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wad");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.idsoftware.doom");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3460
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3460
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".webarchive"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3460 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".webarchive");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.webarchive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3470
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3470
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".webarchivexml"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3470 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".webarchivexml");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.android.webarchive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3480
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3480
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xcf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3480 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xcf");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gimp.xcf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3490
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3490
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".eddx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3490 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".eddx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.edrawsoft.edrawmax");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3500
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3500
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".emmx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3500 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".emmx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.edrawsoft.edrawmind");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3510
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3510
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".caj"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3510 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".caj");
      console.log("typeId:" + result);
      expect(result).assertEqual("net.cnki.caj");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3520
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3520
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dbf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3520 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dbf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.dbase.dbf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3530
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3530
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dwg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3530 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dwg");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dwg");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3540
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3540
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dxf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3540 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dxf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dxf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3550
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3550
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dws"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3550 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dws");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dws");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3560
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3560
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dwt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3560 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dwt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dwt");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3570
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3570
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dwf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3570 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dwf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dwf");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3580
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3580
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dwfx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3580 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dwfx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.dwfx");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3590
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3590
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".shp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3590 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".shp");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.shp");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3600
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3600
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".shx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3600 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".shx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.shx");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3610
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3610
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".slb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3610 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".slb");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.slide-library");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3620
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3620
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lin"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3620 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".lin");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.line");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3630
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3630
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".plt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3630 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".plt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.autodesk.plotter");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3640
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3640
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hpgl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3640 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hpgl");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.hp.graphics-language");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3650
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3650
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wmf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3650 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wmf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.metafile");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3660
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3660
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sat"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3660 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sat");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.spatial.acis.sat");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3670
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3670
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".avif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3670 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".avif");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.aomedia.avif-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3680
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3680
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dds"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3680 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dds");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.dds");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3690
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3690
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ilbm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3690 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ilbm");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.ea.iff-ilbm");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3700
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3700
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cr2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3700 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cr2");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.canon.cr2-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3710
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3710
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cr3"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3710 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cr3");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.canon.cr3-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3720
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3720
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".crw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3720 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".crw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.canon.crw-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3730
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3730
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dng"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3730 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dng");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.dng-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3740
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3740
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".arw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3740 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".arw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sony.arw-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3750
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3750
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".nef"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3750 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".nef");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.nikon.nef-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3760
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3760
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mmap"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3760 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.mindjet.mindmanager.mmap");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3770
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3770
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".eml"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3770 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".eml");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.email");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3780
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3780
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".msg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3780 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".msg");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.message");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3790
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3790
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pst"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3790 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pst");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.pst");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3800
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3800
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wps"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3800 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wps");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.kingsoft.office.writer.wps");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3810
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3810
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wpt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3810 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".wpt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.kingsoft.office.writer.wpt");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3820
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3820
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dps"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3820 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dps");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.kingsoft.office.presentation.dps");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3830
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3830
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dpt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3830 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".dpt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.kingsoft.office.presentation.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3840
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3840
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".et"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3840 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".et");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.kingsoft.office.spreadsheets.et");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3850
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3850
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ett"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3850 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ett");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.kingsoft.office.spreadsheets.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3860
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3860
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mng"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3860 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mng");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mng");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3870
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3870
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pgm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3870 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pgm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pgm-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3880
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3880
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".tcl"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3880 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".tcl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.tcl-script");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3890
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3890
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sti"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3890 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sti");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.impress.template");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3900
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3900
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sds"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3900 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".sds");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.chart");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3910
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3910
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cdt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3910 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cdt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.coreldraw.cdt");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3920
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3920
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xlsb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3920 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlsb");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.binary.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3930
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3930
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xlam"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3930 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xlam");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.addin.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3940
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3940
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".xltm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3940 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".xltm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.template.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3950
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3950
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jpe"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3950 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpe");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3960
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3960
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpe"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3960 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpe");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3970
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3970
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".3gpp2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3970 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".3gpp2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.3gpp2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3980
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3980
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".text"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3980 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".text");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.plain-text");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3990
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3990
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hh"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_3990 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".hh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-plus-plus-header");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4000
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4000
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vcard"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4000 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vcard");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.vcard");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4010
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4010
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vcf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4010 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".vcf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.vcard");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4020
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4020
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pnm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4020 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".pnm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pnm-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4030
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4030
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lha"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4030 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".lha");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lha-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4040
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4040
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lzh"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4040 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".lzh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lzh-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4050
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4050
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lzx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4050 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".lzx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lzx-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4070
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4070
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".shar"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4070 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".shar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.shar-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4080
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4080
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".cpio"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4080 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".cpio");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.cpio-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4090
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4090
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mht"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4090 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".mht");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.web-archive");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4100
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4100
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ustar"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4100 start');
      let result = UTD.getUniformDataTypeByFilenameExtension(".ustar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ustar");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4110
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4110
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dotm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4110");
      let result = UTD.getUniformDataTypeByFilenameExtension(".dotm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.template.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4120
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4120
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ppam"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4120");
      let result = UTD.getUniformDataTypeByFilenameExtension(".ppam");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.addin.macroenabled");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4130
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4130
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ppsm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4130");
      let result = UTD.getUniformDataTypeByFilenameExtension(".ppsm");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.slideshow.macroenabled");
    });


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4140
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4140
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".f4v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4140");
      let result = UTD.getUniformDataTypeByFilenameExtension(".f4v");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.f4v");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4150
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4150
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m2ts"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4150");
      let result = UTD.getUniformDataTypeByFilenameExtension(".m2ts");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mp2t");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4160
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4160
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mts"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4160");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mts");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mp2t");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4170
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4170
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m2t"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4170");
      let result = UTD.getUniformDataTypeByFilenameExtension(".m2t");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mp2t");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4180
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4180
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".yt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4180");
      let result = UTD.getUniformDataTypeByFilenameExtension(".yt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.youtube.video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4190
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4190
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".vt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4190");
      let result = UTD.getUniformDataTypeByFilenameExtension(".vt");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.youtube.video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4200
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4200
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".wrf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4200");
      let result = UTD.getUniformDataTypeByFilenameExtension(".wrf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.cisco.webex-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4210
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4210
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpeg2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4210");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4220
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4220
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpv2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4220");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpv2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4230
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4230
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mp2v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4230");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp2v");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4240
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4240
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m2v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4240");
      let result = UTD.getUniformDataTypeByFilenameExtension(".m2v");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4250
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4250
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4250");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-2");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4260
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4260
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpeg1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4260");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg1");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-1");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4270
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4270
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpv1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4270");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpv1");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-1");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4280
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4280
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mp1v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4280");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp1v");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-1");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4290
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4290
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m1v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4290");
      let result = UTD.getUniformDataTypeByFilenameExtension(".m1v");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-1");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4300
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4300
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rmvb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4300");
      let result = UTD.getUniformDataTypeByFilenameExtension(".rmvb");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.real.realmedia-vbr");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4310
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4310
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4310");
      let result = UTD.getUniformDataTypeByFilenameExtension(".rv");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.real.realvideo");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4320
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4320
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".divx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4320");
      let result = UTD.getUniformDataTypeByFilenameExtension(".divx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.divx-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4330
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4330
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".axv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4330");
      let result = UTD.getUniformDataTypeByFilenameExtension(".axv");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.csiro.annodex");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4340
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4340
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ogv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4340");
      let result = UTD.getUniformDataTypeByFilenameExtension(".ogv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ogv");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4350
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4350
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lsf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4350");
      let result = UTD.getUniformDataTypeByFilenameExtension(".lsf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.lsf-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4360
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4360
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".lsx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4360");
      let result = UTD.getUniformDataTypeByFilenameExtension(".lsx");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.lsf-video");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4370
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4370
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".h264"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4370");
      let result = UTD.getUniformDataTypeByFilenameExtension(".h264");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.h264-video");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4380
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4380
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jp2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4380");
      let result = UTD.getUniformDataTypeByFilenameExtension(".jp2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4390
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4390
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".nrw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4390");
      let result = UTD.getUniformDataTypeByFilenameExtension(".nrw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.nikon.nrw-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4400
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4400
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jpg2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4400");
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpg2");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4410
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4410
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jpx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4410");
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4420
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4420
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jpf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4420");
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4430
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4430
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".jpm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4430");
      let result = UTD.getUniformDataTypeByFilenameExtension(".jpm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jpeg-2000");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4440
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4440
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".raf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4440");
      let result = UTD.getUniformDataTypeByFilenameExtension(".raf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.fujifilm.raf-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4450
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4450
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".raw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4450");
      let result = UTD.getUniformDataTypeByFilenameExtension(".raw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.panasonic.rw2-raw-image");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4460
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4460
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pef"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4460");
      let result = UTD.getUniformDataTypeByFilenameExtension(".pef");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.pentax.pef-raw-image");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4470
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4470
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".srw"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4470");
      let result = UTD.getUniformDataTypeByFilenameExtension(".srw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.sumsung.srw-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4480
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4480
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".erf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4480");
      let result = UTD.getUniformDataTypeByFilenameExtension(".erf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.epson.erf-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4490
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4490
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".orf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4490");
      let result = UTD.getUniformDataTypeByFilenameExtension(".orf");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.olympus.orf-raw-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4500
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4500
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ief"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4500");
      let result = UTD.getUniformDataTypeByFilenameExtension(".ief");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ief-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4510
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4510
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".art"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4510");
      let result = UTD.getUniformDataTypeByFilenameExtension(".art");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.aol.art-image");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4520
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4520
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".heifs"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4520");
      let result = UTD.getUniformDataTypeByFilenameExtension(".heifs");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heif");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4530
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4530
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".hif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4530");
      let result = UTD.getUniformDataTypeByFilenameExtension(".hif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heif");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4540
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4540
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".heics"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4540");
      let result = UTD.getUniformDataTypeByFilenameExtension(".heics");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heic");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4550
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4550
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mp4v"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4550");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mp4v");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-4");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4560
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4560
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".mpeg4"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4560");
      let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg4");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-4");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4570
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4570
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m4p"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4570");
      let result = UTD.getUniformDataTypeByFilenameExtension(".m4p");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.apple.m4p-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4580
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4580
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".m4b"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4580");
      let result = UTD.getUniformDataTypeByFilenameExtension(".m4b");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-4-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4590
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4590
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ac3"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4590");
      let result = UTD.getUniformDataTypeByFilenameExtension(".ac3");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ac3-audio");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4600
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4600
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".bm"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4600");
      let result = UTD.getUniformDataTypeByFilenameExtension(".bm");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.bmp");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4610
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4610
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".flv"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4610");
      let result = UTD.getUniformDataTypeByFilenameExtension(".flv");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.adobe.flash");
    });
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4620
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4620
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".rw2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log("SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4620");
      let result = UTD.getUniformDataTypeByFilenameExtension(".rw2");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.panasonic.rw2-raw-image");
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4630
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4630
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4630',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.dif', 'general.video');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.dif-video");
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
        expect(error != null ).assertFail();
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4640
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4640
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".dif"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.dif', 'general.composite-object');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.microsoft.excel.dif")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4650
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4650
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ts"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4650',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.ts', 'general.video');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.ts")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4660
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4660
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ts"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4660',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.ts', 'general.source-code');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.type-script")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4670
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4670
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ogg"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4670',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.ogg', 'general.audio');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.ogg,org.xiph.ogg")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4680
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4680
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".aiff"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4680',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.aiff', 'general.audio');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.aiff,general.aifc-audio")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4690
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4690
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".au"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4690',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.au', 'general.audio');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.au-audio,general.ulaw-audio")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4700
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4700
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".snd"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4700',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.snd', 'general.audio');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.au-audio,general.ulaw-audio")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4710
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4710
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".tar"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4710',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.tar', 'general.archive');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.tar-archive")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4720
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4720
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".etx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4720',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.etx', 'general.text');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.setext")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4730
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4730
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".etx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4730',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.etx', 'general.composite-object');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.kingsoft.office.spreadsheets.etx")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4740
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4740
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".etx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4740',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.etx', 'com.kingsoft.office');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.kingsoft.office.spreadsheets.etx")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4750
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4750
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".etx"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4750',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.etx', 'com.kingsoft.office');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.kingsoft.office.spreadsheets.etx")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4760
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4760
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".otf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4760',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.otf', 'general.font');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("general.opentype-font")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4770
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4770
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".otf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4770',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.otf', 'general.composite-object');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("org.oasis-open.opendocument.formula-template")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4780
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4780
     * @tc.desc   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4780
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4780',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.otf', 'org.oasis.opendocument');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("org.oasis-open.opendocument.formula-template")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4790
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4790
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".movie"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4790',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.movie', 'general.video');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.sgi.movie,com.apple.quicktime-movie")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4800
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4800
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".sit"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4800',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.sit', 'general.archive');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.allume.stuffit-archive,com.stuffit.sit-archive")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4810
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4810
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".pdb"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4810',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.pdb', 'general.database');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.microsoft.pdb")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4820
     * @tc.number SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4820
     * @tc.desc   getUniformDataTypeByFilenameExtension  parmater is ".ape"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_4820',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let typeIds = UTD.getUniformDataTypesByFilenameExtension('.ape', 'general.audio');
        console.info(`typeId is ${typeIds}`);
        expect(typeIds.toString()).assertEqual("com.monkeysaudio.ape-audio")
      } catch(e) {
        let error: BusinessError = e as BusinessError;
        console.error(`getUniformDataTypesByFilenameExtension throws an exception. code is ${error.code}, message is ${error.message} `);
      }
    })
  });
}

